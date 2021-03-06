USE [idsvr3]

SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientClaims]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](250) NOT NULL,
	[Client_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ClientClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientCorsOrigins]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientCorsOrigins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Origin] [nvarchar](150) NOT NULL,
	[Client_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ClientCorsOrigins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientGrantTypeRestrictions]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientGrantTypeRestrictions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GrantType] [nvarchar](250) NOT NULL,
	[Client_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ClientGrantTypeRestrictions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientIdPRestrictions]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientIdPRestrictions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Provider] [nvarchar](200) NOT NULL,
	[Client_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ClientIdPRestrictions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientPostLogoutRedirectUris]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientPostLogoutRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Uri] [nvarchar](2000) NOT NULL,
	[Client_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ClientPostLogoutRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientRedirectUris]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Uri] [nvarchar](2000) NOT NULL,
	[Client_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ClientRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clients]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[ClientName] [nvarchar](200) NOT NULL,
	[ClientUri] [nvarchar](2000) NULL,
	[LogoUri] [nvarchar](max) NULL,
	[RequireConsent] [bit] NOT NULL,
	[AllowRememberConsent] [bit] NOT NULL,
	[Flow] [int] NOT NULL,
	[IdentityTokenLifetime] [int] NOT NULL,
	[AccessTokenLifetime] [int] NOT NULL,
	[AuthorizationCodeLifetime] [int] NOT NULL,
	[AbsoluteRefreshTokenLifetime] [int] NOT NULL,
	[SlidingRefreshTokenLifetime] [int] NOT NULL,
	[RefreshTokenUsage] [int] NOT NULL,
	[RefreshTokenExpiration] [int] NOT NULL,
	[AccessTokenType] [int] NOT NULL,
	[EnableLocalLogin] [bit] NOT NULL,
	[IncludeJwtId] [bit] NOT NULL,
	[AlwaysSendClientClaims] [bit] NOT NULL,
	[PrefixClientClaims] [bit] NOT NULL,
	[AllowClientCredentialsOnly] [bit] NOT NULL,
	[UpdateAccessTokenClaimsOnRefresh] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientScopeRestrictions]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientScopeRestrictions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
	[Client_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ClientScopeRestrictions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientSecrets]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](250) NOT NULL,
	[ClientSecretType] [nvarchar](250) NULL,
	[Description] [nvarchar](2000) NULL,
	[Expiration] [datetimeoffset](7) NULL,
	[Client_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ClientSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Consents]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consents](
	[Subject] [nvarchar](200) NOT NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[Scopes] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_dbo.Consents] PRIMARY KEY CLUSTERED 
(
	[Subject] ASC,
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupChilds]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupChilds](
	[Key] [int] IDENTITY(1,1) NOT NULL,
	[ParentKey] [int] NOT NULL,
	[ChildGroupID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.GroupChilds] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Groups]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Key] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ID] [uniqueidentifier] NOT NULL,
	[Tenant] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Created] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Groups] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LinkedAccountClaims]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinkedAccountClaims](
	[Key] [int] IDENTITY(1,1) NOT NULL,
	[ParentKey] [int] NOT NULL,
	[ProviderName] [nvarchar](30) NOT NULL,
	[ProviderAccountID] [nvarchar](100) NOT NULL,
	[Type] [nvarchar](150) NOT NULL,
	[Value] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_dbo.LinkedAccountClaims] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LinkedAccounts]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinkedAccounts](
	[Key] [int] IDENTITY(1,1) NOT NULL,
	[ParentKey] [int] NOT NULL,
	[ProviderName] [nvarchar](30) NOT NULL,
	[ProviderAccountID] [nvarchar](100) NOT NULL,
	[LastLogin] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.LinkedAccounts] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PasswordResetSecrets]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PasswordResetSecrets](
	[Key] [int] IDENTITY(1,1) NOT NULL,
	[ParentKey] [int] NOT NULL,
	[PasswordResetSecretID] [uniqueidentifier] NOT NULL,
	[Question] [nvarchar](150) NOT NULL,
	[Answer] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_dbo.PasswordResetSecrets] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScopeClaims]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScopeClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[AlwaysIncludeInIdToken] [bit] NOT NULL,
	[Scope_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ScopeClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Scopes]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[Type] [int] NOT NULL,
	[IncludeAllClaimsForUser] [bit] NOT NULL,
	[ClaimsRule] [nvarchar](200) NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Scopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tokens]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tokens](
	[Key] [nvarchar](128) NOT NULL,
	[TokenType] [smallint] NOT NULL,
	[SubjectId] [nvarchar](200) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[JsonCode] [nvarchar](max) NOT NULL,
	[Expiry] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_dbo.Tokens] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[TokenType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TwoFactorAuthTokens]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TwoFactorAuthTokens](
	[Key] [int] IDENTITY(1,1) NOT NULL,
	[ParentKey] [int] NOT NULL,
	[Token] [nvarchar](100) NOT NULL,
	[Issued] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.TwoFactorAuthTokens] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserAccounts]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccounts](
	[Key] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Age] [int] NULL,
	[ID] [uniqueidentifier] NOT NULL,
	[Tenant] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](254) NOT NULL,
	[Created] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[IsAccountClosed] [bit] NOT NULL,
	[AccountClosed] [datetime] NULL,
	[IsLoginAllowed] [bit] NOT NULL,
	[LastLogin] [datetime] NULL,
	[LastFailedLogin] [datetime] NULL,
	[FailedLoginCount] [int] NOT NULL,
	[PasswordChanged] [datetime] NULL,
	[RequiresPasswordReset] [bit] NOT NULL,
	[Email] [nvarchar](254) NULL,
	[IsAccountVerified] [bit] NOT NULL,
	[LastFailedPasswordReset] [datetime] NULL,
	[FailedPasswordResetCount] [int] NOT NULL,
	[MobileCode] [nvarchar](100) NULL,
	[MobileCodeSent] [datetime] NULL,
	[MobilePhoneNumber] [nvarchar](20) NULL,
	[MobilePhoneNumberChanged] [datetime] NULL,
	[AccountTwoFactorAuthMode] [int] NOT NULL,
	[CurrentTwoFactorAuthStatus] [int] NOT NULL,
	[VerificationKey] [nvarchar](100) NULL,
	[VerificationPurpose] [int] NULL,
	[VerificationKeySent] [datetime] NULL,
	[VerificationStorage] [nvarchar](100) NULL,
	[HashedPassword] [nvarchar](200) NULL,
 CONSTRAINT [PK_dbo.UserAccounts] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserCertificates]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCertificates](
	[Key] [int] IDENTITY(1,1) NOT NULL,
	[ParentKey] [int] NOT NULL,
	[Thumbprint] [nvarchar](150) NOT NULL,
	[Subject] [nvarchar](250) NULL,
 CONSTRAINT [PK_dbo.UserCertificates] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 11/27/2015 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Key] [int] IDENTITY(1,1) NOT NULL,
	[ParentKey] [int] NOT NULL,
	[Type] [nvarchar](150) NOT NULL,
	[Value] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_dbo.UserClaims] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_Client_Id]    Script Date: 11/27/2015 2:36:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_Client_Id] ON [dbo].[ClientClaims]
(
	[Client_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Client_Id]    Script Date: 11/27/2015 2:36:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_Client_Id] ON [dbo].[ClientCorsOrigins]
(
	[Client_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Client_Id]    Script Date: 11/27/2015 2:36:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_Client_Id] ON [dbo].[ClientGrantTypeRestrictions]
(
	[Client_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Client_Id]    Script Date: 11/27/2015 2:36:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_Client_Id] ON [dbo].[ClientIdPRestrictions]
(
	[Client_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Client_Id]    Script Date: 11/27/2015 2:36:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_Client_Id] ON [dbo].[ClientPostLogoutRedirectUris]
(
	[Client_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Client_Id]    Script Date: 11/27/2015 2:36:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_Client_Id] ON [dbo].[ClientRedirectUris]
(
	[Client_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Client_Id]    Script Date: 11/27/2015 2:36:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_Client_Id] ON [dbo].[ClientScopeRestrictions]
(
	[Client_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Client_Id]    Script Date: 11/27/2015 2:36:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_Client_Id] ON [dbo].[ClientSecrets]
(
	[Client_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentKey]    Script Date: 11/27/2015 2:36:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_ParentKey] ON [dbo].[GroupChilds]
(
	[ParentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentKey]    Script Date: 11/27/2015 2:36:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_ParentKey] ON [dbo].[LinkedAccountClaims]
(
	[ParentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentKey]    Script Date: 11/27/2015 2:36:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_ParentKey] ON [dbo].[LinkedAccounts]
(
	[ParentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentKey]    Script Date: 11/27/2015 2:36:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_ParentKey] ON [dbo].[PasswordResetSecrets]
(
	[ParentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Scope_Id]    Script Date: 11/27/2015 2:36:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_Scope_Id] ON [dbo].[ScopeClaims]
(
	[Scope_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentKey]    Script Date: 11/27/2015 2:36:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_ParentKey] ON [dbo].[TwoFactorAuthTokens]
(
	[ParentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentKey]    Script Date: 11/27/2015 2:36:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_ParentKey] ON [dbo].[UserCertificates]
(
	[ParentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentKey]    Script Date: 11/27/2015 2:36:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_ParentKey] ON [dbo].[UserClaims]
(
	[ParentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clients] ADD  DEFAULT ((0)) FOR [AllowClientCredentialsOnly]
GO
ALTER TABLE [dbo].[Clients] ADD  DEFAULT ((0)) FOR [UpdateAccessTokenClaimsOnRefresh]
GO
ALTER TABLE [dbo].[ClientClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ClientClaims_dbo.Clients_Client_Id] FOREIGN KEY([Client_Id])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientClaims] CHECK CONSTRAINT [FK_dbo.ClientClaims_dbo.Clients_Client_Id]
GO
ALTER TABLE [dbo].[ClientCorsOrigins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ClientCorsOrigins_dbo.Clients_Client_Id] FOREIGN KEY([Client_Id])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientCorsOrigins] CHECK CONSTRAINT [FK_dbo.ClientCorsOrigins_dbo.Clients_Client_Id]
GO
ALTER TABLE [dbo].[ClientGrantTypeRestrictions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ClientGrantTypeRestrictions_dbo.Clients_Client_Id] FOREIGN KEY([Client_Id])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientGrantTypeRestrictions] CHECK CONSTRAINT [FK_dbo.ClientGrantTypeRestrictions_dbo.Clients_Client_Id]
GO
ALTER TABLE [dbo].[ClientIdPRestrictions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ClientIdPRestrictions_dbo.Clients_Client_Id] FOREIGN KEY([Client_Id])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientIdPRestrictions] CHECK CONSTRAINT [FK_dbo.ClientIdPRestrictions_dbo.Clients_Client_Id]
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ClientPostLogoutRedirectUris_dbo.Clients_Client_Id] FOREIGN KEY([Client_Id])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris] CHECK CONSTRAINT [FK_dbo.ClientPostLogoutRedirectUris_dbo.Clients_Client_Id]
GO
ALTER TABLE [dbo].[ClientRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ClientRedirectUris_dbo.Clients_Client_Id] FOREIGN KEY([Client_Id])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientRedirectUris] CHECK CONSTRAINT [FK_dbo.ClientRedirectUris_dbo.Clients_Client_Id]
GO
ALTER TABLE [dbo].[ClientScopeRestrictions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ClientScopeRestrictions_dbo.Clients_Client_Id] FOREIGN KEY([Client_Id])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientScopeRestrictions] CHECK CONSTRAINT [FK_dbo.ClientScopeRestrictions_dbo.Clients_Client_Id]
GO
ALTER TABLE [dbo].[ClientSecrets]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ClientSecrets_dbo.Clients_Client_Id] FOREIGN KEY([Client_Id])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientSecrets] CHECK CONSTRAINT [FK_dbo.ClientSecrets_dbo.Clients_Client_Id]
GO
ALTER TABLE [dbo].[GroupChilds]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GroupChilds_dbo.Groups_ParentKey] FOREIGN KEY([ParentKey])
REFERENCES [dbo].[Groups] ([Key])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupChilds] CHECK CONSTRAINT [FK_dbo.GroupChilds_dbo.Groups_ParentKey]
GO
ALTER TABLE [dbo].[LinkedAccountClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.LinkedAccountClaims_dbo.UserAccounts_ParentKey] FOREIGN KEY([ParentKey])
REFERENCES [dbo].[UserAccounts] ([Key])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LinkedAccountClaims] CHECK CONSTRAINT [FK_dbo.LinkedAccountClaims_dbo.UserAccounts_ParentKey]
GO
ALTER TABLE [dbo].[LinkedAccounts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.LinkedAccounts_dbo.UserAccounts_ParentKey] FOREIGN KEY([ParentKey])
REFERENCES [dbo].[UserAccounts] ([Key])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LinkedAccounts] CHECK CONSTRAINT [FK_dbo.LinkedAccounts_dbo.UserAccounts_ParentKey]
GO
ALTER TABLE [dbo].[PasswordResetSecrets]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PasswordResetSecrets_dbo.UserAccounts_ParentKey] FOREIGN KEY([ParentKey])
REFERENCES [dbo].[UserAccounts] ([Key])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PasswordResetSecrets] CHECK CONSTRAINT [FK_dbo.PasswordResetSecrets_dbo.UserAccounts_ParentKey]
GO
ALTER TABLE [dbo].[ScopeClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ScopeClaims_dbo.Scopes_Scope_Id] FOREIGN KEY([Scope_Id])
REFERENCES [dbo].[Scopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ScopeClaims] CHECK CONSTRAINT [FK_dbo.ScopeClaims_dbo.Scopes_Scope_Id]
GO
ALTER TABLE [dbo].[TwoFactorAuthTokens]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TwoFactorAuthTokens_dbo.UserAccounts_ParentKey] FOREIGN KEY([ParentKey])
REFERENCES [dbo].[UserAccounts] ([Key])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TwoFactorAuthTokens] CHECK CONSTRAINT [FK_dbo.TwoFactorAuthTokens_dbo.UserAccounts_ParentKey]
GO
ALTER TABLE [dbo].[UserCertificates]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserCertificates_dbo.UserAccounts_ParentKey] FOREIGN KEY([ParentKey])
REFERENCES [dbo].[UserAccounts] ([Key])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserCertificates] CHECK CONSTRAINT [FK_dbo.UserCertificates_dbo.UserAccounts_ParentKey]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserClaims_dbo.UserAccounts_ParentKey] FOREIGN KEY([ParentKey])
REFERENCES [dbo].[UserAccounts] ([Key])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_dbo.UserClaims_dbo.UserAccounts_ParentKey]
GO

Insert into UserAccounts
SELECT
	'admin',	
	NULL,	
	NULL,	
	'E39115DA-86EF-4283-963C-97560138AD85',
	'default',
	'admin',
	'2015-09-09',
	'2015-11-19',
	0,
	NULL,
	1,
	'2015-11-24',
	'2015-10-19',
	0,
	'2015-10-19',
	0,	
	'admin@3pillarglobal.com',
	0,	
	NULL,
	0,
	NULL,
	NULL,
	NULL,NULL,
	0,
	0,
	'5A5B76B6CF9E4CC3EB25E0C13D0C9FA39705391FDB90A4E332118C59A19EC36F',
	3,
	'2015-09-09',
	'admin@3pillarglobal.com',
	'2710.AD0LdjhypzNaYni9gwfk/YPdk6yKd2uvhg4O+c+mnoJakfiBmpBYBzrnqfAZbQF2Ig=='

GO
declare @pId INT
SET @pId = (SELECT TOP 1 [Key] from UserAccounts WHERE  username ='admin' )

insert into userClaims
select @pId,'role','IdentityManagerAdministrator'

insert into userClaims
select @pId,'UserManager','true'

insert into userClaims
select @pId,'role','Administrator'

insert into userClaims
select @pId,'name','admin'
