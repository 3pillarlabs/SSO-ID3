using IdentityServer3.Core;
using Microsoft.IdentityModel.Protocols;
using Microsoft.Owin;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.OpenIdConnect;
using Owin;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IdentityModel.Tokens;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Helpers;
using Thinktecture.IdentityModel.Client;

[assembly: OwinStartup(typeof(WebClient.Startup))]
namespace WebClient
{
    
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            AntiForgeryConfig.UniqueClaimTypeIdentifier = Constants.ClaimTypes.Subject;
            JwtSecurityTokenHandler.InboundClaimTypeMap = new Dictionary<string, string>();

            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = "Cookies"
            });
            app.UseResourceAuthorization(new AuthorizationService());

            
            
            app.UseOpenIdConnectAuthentication(new OpenIdConnectAuthenticationOptions
            {
                Authority = ConfigurationManager.AppSettings["IdentityAuthority"],

                ClientId = "webclient",
                Scope = "openid profile offline_access roles usermanager clientwebapi",
                ResponseType = "id_token token",
                RedirectUri = ConfigurationManager.AppSettings["RedirectUrl"],

                SignInAsAuthenticationType = "Cookies",
                UseTokenLifetime = false,

                

                Notifications = new OpenIdConnectAuthenticationNotifications
                {
                    SecurityTokenValidated = async n =>
                    {
                        var nid = new ClaimsIdentity(
                            n.AuthenticationTicket.Identity.AuthenticationType,
                            Constants.ClaimTypes.GivenName,
                            Constants.ClaimTypes.Role);

                        // get userinfo data
                        var userInfoClient = new UserInfoClient(
                            new Uri(n.Options.Authority + "/connect/userinfo"),
                            n.ProtocolMessage.AccessToken);

                        var userInfo = await userInfoClient.GetAsync();
                        userInfo.Claims.ToList().ForEach(ui => nid.AddClaim(new Claim(ui.Item1, ui.Item2)));

                        var givenName = nid.FindFirst(Constants.ClaimTypes.GivenName);
                        
                        var familyName = nid.FindFirst(Constants.ClaimTypes.FamilyName);



                        //nid.AddClaim(givenName);
                        //nid.AddClaim(familyName);

                        // keep the id_token for logout
                        nid.AddClaim(new Claim("id_token", n.ProtocolMessage.IdToken));

                        // add access token for sample API
                        nid.AddClaim(new Claim("access_token", n.ProtocolMessage.AccessToken));

                        // keep track of access token expiration
                        nid.AddClaim(new Claim("expires_at", DateTimeOffset.Now.AddSeconds(int.Parse(n.ProtocolMessage.ExpiresIn)).ToString()));

                        // add some other app specific claim
                        nid.AddClaim(new Claim("app_specific", "some data"));


                        n.AuthenticationTicket = new AuthenticationTicket(
                            nid,
                            n.AuthenticationTicket.Properties);

                        
                    },

                    

                    RedirectToIdentityProvider = n =>
                    {
                        if (n.ProtocolMessage.RequestType == OpenIdConnectRequestType.LogoutRequest)
                        {
                            var idTokenHint = n.OwinContext.Authentication.User.FindFirst("id_token");

                            if (idTokenHint != null)
                            {
                                n.ProtocolMessage.IdTokenHint = idTokenHint.Value;
                            }
                        }
                        return Task.FromResult(0);
                    }
                }
            });
        }

    }
}