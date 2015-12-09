using System.Data.Entity.Migrations;

namespace Host.Migrations.ClientConfiguration
{
    internal sealed class Configuration : DbMigrationsConfiguration<Thinktecture.IdentityServer.EntityFramework.ClientConfigurationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            MigrationsDirectory = @"Migrations\ClientConfiguration";
        }

        protected override void Seed(Thinktecture.IdentityServer.EntityFramework.ClientConfigurationDbContext context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            //    context.People.AddOrUpdate(
            //      p => p.FullName,
            //      new Person { FullName = "Andrew Peters" },
            //      new Person { FullName = "Brice Lambson" },
            //      new Person { FullName = "Rowan Miller" }
            //    );
            //
        }
    }
}
