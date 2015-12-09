using System;   
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Web.Http;
using WebApi.Models;

namespace WebApi.Controllers
{
    public class HomeApiController : ApiController
    {
        [HttpGet]
        public string Index()
        {
            return "Public Section of the site.";
        }

        [Authorize(Roles = "InternalUsers")]
        [HttpGet]
        public string InternalSection()
        {
            return "Internal section of the site.";
        }

        [Authorize(Roles = "ExternalUsers")]
        [HttpGet]
        public string ExternalSection()
        {
            return "External section of the site.";
        }

        [Authorize( Roles = "InternalUsers,ExternalUsers")]
        //[ClaimsAuthorization(Roles = "InternalUsers,ExternalUsers")]


        [HttpGet]
        public IList<UserClaim> Profile()
        {
            var user = User as ClaimsPrincipal;
            IList<UserClaim> claims =
                                        (from c in user.Claims
                                         select new UserClaim
                                         {
                                             Type = c.Type,
                                             Value = c.Value
                                         }).ToList();

            return claims;
        }

        

    }
}
