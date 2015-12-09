using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Thinktecture.IdentityModel.Client;

namespace WebClient.Controllers
{
    public class CallApiController : Controller
    {
        // GET: CallApi/ClientCredentials
        public async Task<ActionResult> ClientCredentials()
        {
            var response = await GetTokenAsync();
            var result = await CallApi(response.AccessToken);

            JsonResult resultJ = new JsonResult();

            resultJ.Data = result;


            ViewBag.Json = resultJ ;
            return View("ShowApiResult");
        }


        private async Task<TokenResponse> GetTokenAsync()
        {
            var client = new OAuth2Client(
                new Uri(string.Format("https://{0}/idsvr3/connect/token", ConfigurationManager.AppSettings["ServerName"])),
                "clientwebapi",
                "$0m3P@$$w0rd");

            return await client.RequestClientCredentialsAsync("clientwebapi");
        }

        private async Task<string> CallApi(string token)
        {
            var client = new HttpClient();
            client.SetBearerToken(token);

            var json = await client.GetStringAsync(string.Format("https://{0}/WebApi/Identity", ConfigurationManager.AppSettings["ServerName"]));
            return JArray.Parse(json).ToString();
        }
    }
}