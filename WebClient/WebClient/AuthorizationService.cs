﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Thinktecture.IdentityModel.Owin.ResourceAuthorization;

namespace WebClient
{
    public class AuthorizationService : ResourceAuthorizationManager
    {
        public override Task<bool> CheckAccessAsync(ResourceAuthorizationContext context)
        {
            switch (context.Resource.First().Value)
            {
                case "ContactDetails":
                    return AuthorizeContactDetails(context);
                default:
                    return Nok();
            }
        }

        private Task<bool> AuthorizeContactDetails(ResourceAuthorizationContext context)
        {
            switch (context.Action.First().Value)
            {
                case "Read":
                    return Eval(context.Principal.HasClaim("role", "Geek"));
                case "Write":
                    return Eval(context.Principal.HasClaim("role", "Operator"));
                default:
                    return Nok();
            }
        }
    }
}