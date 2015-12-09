using Models;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Thinktecture.IdentityModel.Client;
using Thinktecture.IdentityModel.Mvc;

namespace WebClient.Controllers
{
    public class HomeController : Controller
    {
        public async Task<ActionResult> Index()
        {
            using (var client = new HttpClient())
            {
                var response = await GetTokenAsync();
                client.SetBearerToken(response.AccessToken);

                var result = client.GetAsync(String.Format("https://{0}/WebApi/api/HomeApi/Index", ConfigurationManager.AppSettings["ServerName"])).Result;
                ViewBag.Message = result.Content.ReadAsAsync(typeof(string)).Result;
            }
            return View();
        }

        //[Authorize(Roles = "InternalUsers")]
        public async Task<ActionResult> InternalSection()
        {
            using (var client = new HttpClient())
            {
                var user = User as ClaimsPrincipal;
                var token = user.FindFirst("access_token").Value;

                client.SetBearerToken(token);

                var result = client.GetAsync(String.Format("https://{0}/WebApi/api/HomeApi/InternalSection", ConfigurationManager.AppSettings["ServerName"])).Result;

                if (result.IsSuccessStatusCode)
                {
                    ViewBag.Message = result.Content.ReadAsAsync(typeof(string)).Result;
                }
                else
                {
                    if (result.StatusCode == System.Net.HttpStatusCode.Unauthorized)
                    {
                        return View("Forbidden");
                    }
                }

            }
            return View();
        }

        //[Authorize(Roles = "ExternalUsers")]
        public async Task<ActionResult> ExternalSection()
        {
            using (var client = new HttpClient())
            {
                var user = User as ClaimsPrincipal;
                var token = user.FindFirst("access_token").Value;

                client.SetBearerToken(token);

                var result = client.GetAsync(String.Format("https://{0}/WebApi/api/HomeApi/ExternalSection", ConfigurationManager.AppSettings["ServerName"])).Result;

                if (result.IsSuccessStatusCode)
                {
                    ViewBag.Message = result.Content.ReadAsAsync(typeof(string)).Result;
                }
                else
                {
                    if (result.StatusCode == System.Net.HttpStatusCode.Unauthorized)
                    {
                        return View("Forbidden");
                    }
                }

            }
            return View();
        }

        [HandleForbidden]
        public async Task<ActionResult> Profile()
        {
            var user = User as ClaimsPrincipal;
            IList<UserClaim> claims =
                                        (from c in user.Claims
                                         select new UserClaim
                                         {
                                             Type = c.Type,
                                             Value = c.Value
                                         }).ToList();

            return View(claims);

            //using (var client = new HttpClient())
            //{
            //    var user = User as ClaimsPrincipal;
            //    var token = user.FindFirst("access_token").Value;

            //    client.SetBearerToken(token);

            //    var result = client.GetAsync(String.Format("https://{0}/WebApi/api/HomeApi/Profile", ConfigurationManager.AppSettings["ServerName"])).Result;

            //    if (result.IsSuccessStatusCode)
            //    {
            //        ViewBag.Message = result.Content.ReadAsAsync(typeof(string)).Result;
            //    }
            //    else
            //    {
            //        if (result.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            //        {
            //            return View("Forbidden");
            //        }
            //    }

            //}
            //return View();
        }




        public ActionResult Logout()
        {
            Request.GetOwinContext().Authentication.SignOut();
            return Redirect("/");
        }


        private async Task<TokenResponse> GetTokenAsync()
        {
            var client = new OAuth2Client(
                new Uri(String.Format("https://{0}/idsvr3/connect/token", ConfigurationManager.AppSettings["ServerName"])),
                "clientwebapi",
                "$0m3P@$$w0rd");

            return await client.RequestClientCredentialsAsync("clientwebapi");
        }


        private async Task<string> CallApi(string token)
        {
            var client = new HttpClient();
            client.SetBearerToken(token);

            var json = await client.GetStringAsync(String.Format("https://{0}/WebApi/Identity", ConfigurationManager.AppSettings["ServerName"]));
            return JArray.Parse(json).ToString();
        }
    }
}