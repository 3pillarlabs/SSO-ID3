using Host.MembershipReboot;
using Thinktecture.IdentityServer.Core.Configuration;
using Thinktecture.IdentityServer.Core.Services;
using Thinktecture.IdentityServer.EntityFramework;

namespace Host.Configuration
{
    public static class IdentityServerServiceExtensions
    {
        public static void Configure(this IdentityServerServiceFactory factory, string connectionString)
        {
            var config = new EntityFrameworkServiceOptions
            {
                ConnectionString = connectionString
            };

            factory.RegisterConfigurationServices(config);
            factory.RegisterOperationalServices(config);

            factory.UserService = new Registration<IUserService, CustomUserService>();
            factory.Register(new Registration<CustomUserAccountService>());
            factory.Register(new Registration<CustomConfig>(CustomConfig.Config));
            factory.Register(new Registration<CustomUserRepository>());
            factory.Register(new Registration<CustomDatabase>(resolver => new CustomDatabase(connectionString)));
        }
    }
}
