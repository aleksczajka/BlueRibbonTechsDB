USE [BlueRibbonAdmin]
GO

CREATE TABLE [dbo].[AllowedAccessKeys]
(
	[ID] [uniqueidentifier] NOT NULL ROWGUIDCOL CONSTRAINT [DF_AllowedAccessKeys_ID] DEFAULT (newid()),
	[AccessKey] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT [PK_AllowedAccessKeys] PRIMARY KEY CLUSTERED
	(
		[ID] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY  = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[InterviewQuestions]
(
	[ID] [uniqueidentifier] NOT NULL ROWGUIDCOL CONSTRAINT [DF_InterviewQuestions_ID] DEFAULT (newid()),
	[QuestionText] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT [PK_InterviewQuestions] PRIMARY KEY CLUSTERED
	(
		[ID] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY  = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Admins]
(
	[ID] [uniqueidentifier] NOT NULL ROWGUIDCOL CONSTRAINT [DF_Admins_ID] DEFAULT (newid()),
	[Email] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Password] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED
	(
		[ID] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY  = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 2/7/2012
-- Description:	Retrieve an Admin
-- =============================================
CREATE PROCEDURE [dbo].[GetAdminOnUserName]
	@userName NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM Admins WHERE Email = @userName

END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 2/7/2012
-- Description:	Retrieve all Techs
-- =============================================
CREATE PROCEDURE [dbo].[RetrieveAllTechs]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM Techs
END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 2/7/2012
-- Description:	Validate whether the particular key associated with a browser has access to site
-- =============================================
CREATE PROCEDURE [ValidateAccessKey]
	@accessKey NVARCHAR(200),
	@answer BIT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @count INT
    SET @count = 0
    
    SELECT @count = COUNT(*) FROM AllowedAccessKeys WHERE AccessKey = @accessKey
    
    IF @count = 0
	BEGIN
		SET @answer = 'False'
	END
	ELSE
	BEGIN
		SET @answer = 'True'
	END
    
END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 2/7/2012
-- Description:	Authorize Admin
-- =============================================
CREATE PROCEDURE [dbo].[AuthorizeUser]
	@userName VARCHAR(50),
	@password VARCHAR(100),
	@success BIT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @count INT
	SET @count = 0

	SELECT @count = COUNT(*) FROM Admins WHERE Email = @userName AND Password = @password

	IF @count = 0
		BEGIN
			SET @success = 'False'
		END
	ELSE
		BEGIN
			SET @success = 'True'
		END
END
GO
