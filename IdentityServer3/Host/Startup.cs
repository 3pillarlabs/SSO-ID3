using System;
using System.Collections.Generic;
using System.Configuration;
using System.IdentityModel.Tokens;
using Host;
using Host.Configuration;
using Host.Manager;
using IdentityManager.Configuration;
using Microsoft.AspNet.Identity;
using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.Google;
using Microsoft.Owin.Security.MicrosoftAccount;
using Microsoft.Owin.Security.OpenIdConnect;
using Owin;
using Thinktecture.IdentityServer.Core.Configuration;

[assembly: OwinStartup(typeof(Startup))]

namespace Host
{
    public class Startup
    {
        public void Configuration(IAppBuilder appBuilder)
        {
            var connectionString = ConfigurationManager.AppSettings["Connection"];

            JwtSecurityTokenHandler.InboundClaimTypeMap = new Dictionary<string, string>();

            appBuilder.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = "Cookies"
            });

            appBuilder.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);

            appBuilder.UseOpenIdConnectAuthentication(new OpenIdConnectAuthenticationOptions
            {
                AuthenticationType = "oidc",
                Authority = ConfigurationManager.AppSettings["IdentityServer"],
                ClientId = "idmgr_client",
                RedirectUri = ConfigurationManager.AppSettings["IdentityManager"],
                ResponseType = "id_token",
                UseTokenLifetime = false,
                Scope = "openid idmgr",
                SignInAsAuthenticationType = "Cookies"
            });


            // Identity Manager
            appBuilder.Map("/admin", adminApp =>
            {
                var factory = new IdentityManagerServiceFactory();
                factory.Configure(connectionString);

                var options = new IdentityManagerOptions
                {
                    Factory = factory
                };

                if (Convert.ToBoolean(ConfigurationManager.AppSettings["SecurityEnabled"]))
                {
                    options.SecurityConfiguration = new HostSecurityConfiguration
                    {
                        HostAuthenticationType = "Cookies",
                        AdditionalSignOutType = "oidc"
                    };
                }

                adminApp.UseIdentityManager(options);
            });

            // Identity Server
            var idFactory = new IdentityServerServiceFactory();
            idFactory.Configure(connectionString);

            var idOptions = new IdentityServerOptions
            {
                SigningCertificate = Certificate.Load(),
                Factory = idFactory,
                CorsPolicy = CorsPolicy.AllowAll,
                AuthenticationOptions = new AuthenticationOptions
                {
                    IdentityProviders = ConfigureIdentityProviders
                }
            };

            appBuilder.UseIdentityServer(idOptions);
        }

        private void ConfigureIdentityProviders(IAppBuilder app, string signInAsType)
        {
            app.UseGoogleAuthentication(new GoogleOAuth2AuthenticationOptions
            {
                AuthenticationType = "Google",
                Caption = "Google",
                SignInAsAuthenticationType = signInAsType,

                ClientId = "765434836238-h62rqjlo5199jl8hsoi0075pqi5a8qqp.apps.googleusercontent.com",
                ClientSecret = "pBJz2OyhyERijXlgI9FrkMn8"
            });

            app.UseMicrosoftAccountAuthentication(new MicrosoftAccountAuthenticationOptions
            {
                AuthenticationType = "Microsoft",
                Caption = "Microsoft",
                SignInAsAuthenticationType = signInAsType,

                ClientId = "000000004415FD85",
                ClientSecret = "ntXCMonPTm09ZXHIhNSZ5Q7RZ5gZM1t1"
            });
        }
    }
}
