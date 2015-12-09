using Owin;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Http;
using Thinktecture.IdentityServer.AccessTokenValidation;

namespace WebApi
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.UseIdentityServerBearerTokenAuthentication(new IdentityServerBearerTokenAuthenticationOptions
            {
                Authority = String.Format("https://{0}/idsvr3/",ConfigurationManager.AppSettings["ServerName"]),
                RequiredScopes = new[] { "clientwebapi" }
            });
            // web api configuration
            var config = new HttpConfiguration();
            config.MapHttpAttributeRoutes();

            app.UseWebApi(config);
        }
    }
}