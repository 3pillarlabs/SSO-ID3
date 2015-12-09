# SSO with Identity Server3
Simple example demonstrating identity server capabilities for SSO and token based authentication and authorization

## Setup
#### Database setup
1. Create a database with name “idsvr3”
2. Run the script available at https://github.com/3pillarlabs/SSO-ID3/blob/master/sql/Create_db.sql

###IIS Setup
####Identity Server 3
1.	Clone the repository
2.	Create a X509Certificate2 with name idsrv3test
3.	Configure “Default Web Site” on SSL. Refer https://technet.microsoft.com/en-us/library/cc732230(v=ws.10).aspx
4.	Keep the certificate in following certificate store
    5.	Personal
        6.	Current User 
        7.	Trusted Root Certification Authority 
    8.	Local
        9.	Current User
        10.	Trusted Root Certification Authority
5.	Extract the certificate into idsrv3test.pfx file. Keep the password idsrv3test
6.	Copy the certificate to https://github.com/3pillarlabs/SSO-ID3/blob/master/IdentityServer3/Host/Configuration/idsrv3test.pfx
7.	Create a new  Web Application “idsvr3” under “Default Web Site” and point it to
https://github.com/3pillarlabs/SSO-ID3/tree/master/IdentityServer3/Host 
8.	Access https://localhost/idsvr3/Admin or https://machine-name/idsvr3/Admin 
9.	Configure clients on IdentityServer3
    10.	Make sure all the configuration entries are correctly setup as per the local settings
    11.	Now build the “cli” project. Make sure it app.config entries are all correctly setup as per your local settings
    12.	Browse to its build folder of cli project and configure IdentityServer database with clients and scopes.
    13.	IdSvr3EfCli.exe -c IdSvr3Config -f local.json
	
####WebClient

1.	Create a new  Web Application “WebClient” under “Default Web Site” and point it to
https://github.com/3pillarlabs/SSO-ID3/tree/master/WebClient/WebClient
2.	SSL is already setup of  “Default Web Site” 
3.	Make sure to setup the web.config settings appropriately

####WebApi
1. Create a new  Web Application “WebApi” under “Default Web Site” and point it to
https://github.com/3pillarlabs/SSO-ID3/tree/master/WebClient/WebApi
2. SSL is already setup of  “Default Web Site” 
3. Make sure to setup the web.config settings appropriately

###Environment
1.	SQL Server 2008 R2
2.	IIS 7.5
3.	MS Visual Studio 2013

##Run the application
###Identity Server 3
1.	Access the ID3 https://<machinename>/idsvr3/admin
2.	Login with username=admin and password=India@123
3.	Create 2 different roles
    4.	ExternalUsers
    5.	InternalUsers
4.	Create 2 different Users
    5.	ExternalSiteUser
        6.	Assign role to ExternalUsers
    7.	InternalSiteUser
        8.	Assign role to InternalUsers

c.	Run WebClient and WebApi and browse different section with ExternalSiteUser and InternalSiteUser

# About this project

![3Pillar Global] (http://www.3pillarglobal.com/wp-content/themes/base/library/images/logo_3pg.png)

**SSO-ID3** is developed and maintained by [3Pillar Global](http://www.3pillarglobal.com/).
