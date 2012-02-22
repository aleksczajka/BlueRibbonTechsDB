USE [ProdDBAdmin]
GO

CREATE TABLE [dbo].[SiteEmails]
(
	[ID] [uniqueidentifier] NOT NULL ROWGUIDCOL CONSTRAINT [DF_SiteEmails_ID] DEFAULT (newid()),
	[EmailContent] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[EmailTitle] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_SiteEmails] PRIMARY KEY CLUSTERED
	(
		[ID] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY  = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 2/21/2012
-- Description:	Retrieve specific email
-- =============================================
CREATE PROCEDURE [dbo].[RetrieveEmail]
	@emailName VARCHAR(50),
	@emailContent VARCHAR(MAX) OUTPUT,
	@emailSubject VARCHAR(100) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT @emailContent = EmailContent, @emailSubject = EmailTitle FROM SiteEmails WHERE EmailName = @emailName
END
GO
