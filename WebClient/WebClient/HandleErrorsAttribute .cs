using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebClient
{
    public class HandleErrorsAttribute : FilterAttribute, IExceptionFilter
    {
        public virtual void OnException(ExceptionContext filterContext)
        {
            if (filterContext.HttpContext.User.Identity.IsAuthenticated)
            {
                // 403 we know who you are, but you haven't been granted access
                filterContext.Result = new HttpStatusCodeResult(System.Net.HttpStatusCode.Forbidden);

               // filterContext.Result = new ViewResult { ViewName = "Forbidden" };
            }
            else
            {
                // 401 who are you? go login and then try again
                filterContext.Result = new HttpUnauthorizedResult();
            }
        }
    }
}