USE [BlueRibbon]
GO

CREATE TABLE [dbo].[Tests]
(
	[ID] [uniqueidentifier] NOT NULL ROWGUIDCOL CONSTRAINT [DF_Tests_ID] DEFAULT (newid()),
	[Name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT [PK_Tests] PRIMARY KEY CLUSTERED
	(
		[ID] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY  = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CertQuestions]
(
	[ID] [uniqueidentifier] NOT NULL ROWGUIDCOL CONSTRAINT [DF_CertQuestions_ID] DEFAULT (newid()),
	[Question] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Category] [uniqueidentifier] NOT NULL,
	CONSTRAINT [PK_CertQuestions] PRIMARY KEY CLUSTERED
	(
		[ID] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY  = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[TestScores]
(
	[ID] [uniqueidentifier] NOT NULL ROWGUIDCOL CONSTRAINT [DF_TestScores_ID] DEFAULT (newid()),
	[TestTakenID] [uniqueidentifier] NOT NULL,
	[TechID] [uniqueidentifier] NOT NULL,
	[TestScore] [decimal] (18,2) NOT NULL,
	CONSTRAINT [PK_TestScores] PRIMARY KEY CLUSTERED
	(
		[ID] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY  = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[InterviewQuestions]
(
	[ID] [uniqueidentifier] NOT NULL ROWGUIDCOL CONSTRAINT [DF_InterviewQuestions_ID] DEFAULT (newid()),
	[QuestionID] [uniqueidentifier] NOT NULL,
	[TechID] [uniqueidentifier] NOT NULL,
	[Answer] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Passed] [bit] NULL,
	CONSTRAINT [PK_InterviewQuestions] PRIMARY KEY CLUSTERED
	(
		[ID] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY  = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[TestAnswers]
(
	[ID] [uniqueidentifier] NOT NULL ROWGUIDCOL CONSTRAINT [DF_TestAnswers_ID] DEFAULT (newid()),
	[TestTakenID] [uniqueidentifier] NOT NULL,
	[testID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_TestAnswers_testID] DEFAULT (newid()),
	[techID] [uniqueidentifier] NOT NULL,
	[questionID] [uniqueidentifier] NOT NULL,
	[answerID] [uniqueidentifier] NULL,
	[answerText] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[isEssay] [bit] NOT NULL,
	[DateTaken] [datetime] NOT NULL CONSTRAINT [DF_TestAnswers_DateTaken] DEFAULT (getdate()),
	[Passed] [bit] NULL,
	CONSTRAINT [PK_TestAnswers] PRIMARY KEY CLUSTERED
	(
		[ID] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY  = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Techs]
(
	[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Techs_ID] DEFAULT (newid()),
	[FirstName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Phone] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Email] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Zip] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_Techs_CreateDate] DEFAULT (getdate()),
	[Password] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Gender] [bit] NOT NULL,
	[BirthDate] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[About] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProfileImage] [image] NULL,
	[EmailVerified] [bit] NOT NULL CONSTRAINT [DF_Techs_EmailVerified] DEFAULT ((0)),
	[Certified] [bit] NULL,
	CONSTRAINT [PK_Techs] PRIMARY KEY CLUSTERED
	(
		[ID] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY  = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[TestPages]
(
	[ID] [uniqueidentifier] NOT NULL ROWGUIDCOL CONSTRAINT [DF_TestPages_ID] DEFAULT (newid()),
	[TestID] [uniqueidentifier] NOT NULL,
	[PageOrder] [int] NOT NULL,
	[QuestionCategory] [uniqueidentifier] NOT NULL,
	[NumberOfQuestions] [int] NOT NULL,
	[isRandom] [bit] NOT NULL,
	[isEssay] [bit] NOT NULL,
	[isInterview] [bit] NULL,
	CONSTRAINT [PK_TestPages] PRIMARY KEY CLUSTERED
	(
		[ID] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY  = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[a]
(
	[id] [int] NULL,
	[asdf] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[asdff] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[adfasdfsdf] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[BlueRibbonCerts]
(
	[ID] [uniqueidentifier] NOT NULL ROWGUIDCOL CONSTRAINT [DF_BlueRibbonCerts_ID] DEFAULT (newid()),
	[TechID] [uniqueidentifier] NOT NULL,
	[Passed] [bit] NOT NULL,
	CONSTRAINT [PK_BlueRibbonCerts] PRIMARY KEY CLUSTERED
	(
		[ID] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY  = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CertAnswers]
(
	[ID] [uniqueidentifier] NOT NULL ROWGUIDCOL CONSTRAINT [DF_CertAnswers_ID] DEFAULT (newid()),
	[QuestionID] [uniqueidentifier] NOT NULL,
	[Choice] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Answer] [bit] NOT NULL,
	[Order] [int] NOT NULL,
	CONSTRAINT [PK_CertAnswers] PRIMARY KEY CLUSTERED
	(
		[ID] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY  = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[CertCategories]
(
	[ID] [uniqueidentifier] NOT NULL ROWGUIDCOL CONSTRAINT [DF_CertCategories_ID] DEFAULT (newid()),
	[CategoryName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT [PK_CertCategories] PRIMARY KEY CLUSTERED
	(
		[ID] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY  = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TestsTaken]
(
	[ID] [uniqueidentifier] NOT NULL,
	[TestID] [uniqueidentifier] NOT NULL,
	[TechID] [uniqueidentifier] NOT NULL ROWGUIDCOL CONSTRAINT [DF_TestsTaken_TechID] DEFAULT (newid()),
	[DateTaken] [datetime] NOT NULL CONSTRAINT [DF_TestsTaken_DateTaken] DEFAULT (getdate()),
	CONSTRAINT [PK_TestsTaken] PRIMARY KEY CLUSTERED
	(
		[ID] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY  = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[IsPassed]
(
	@TechID UNIQUEIDENTIFIER
)
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @passed BIT
	SET @passed = 'False'

	DECLARE @count INT
	SET @count = 0

	SELECT @count = COUNT(*) FROM BlueRibbonCerts WHERE TechID = @techID
	
	IF @count = 0
		BEGIN
			RETURN 'NA'
		END
	ELSE
		BEGIN
			SELECT @passed = Passed FROM BlueRibbonCerts WHERE TechID = @techID
			IF @passed = 0
				RETURN 'False'
			ELSE
				RETURN 'True'
		END
		
	RETURN 'False'
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION IsGradedFunc
(
	@TechID UNIQUEIDENTIFIER
)
RETURNS BIT
AS
BEGIN
	DECLARE @graded BIT
	SET @graded = 'False'

	SELECT @graded = COUNT(*) FROM BlueRibbonCerts WHERE TechID = @techID
	
	RETURN @graded
END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 2/11/2012
-- Description:	Retrieve interview questions
-- =============================================
CREATE PROCEDURE [dbo].[RetrieveInterviewQuestions]
	@TechID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @mylist TABLE (Question NVARCHAR(MAX) NOT NULL, QuestionID UNIQUEIDENTIFIER NOT NULL, 
	Answer NVARCHAR(MAX) NOT NULL, TechID UNIQUEIDENTIFIER, PassedIt VARCHAR(7))


	DECLARE @questionText NVARCHAR(MAX)
	DECLARE @questionID UNIQUEIDENTIFIER
	
	DECLARE curs CURSOR LOCAL FOR 
		SELECT ID, Question FROM CertQuestions WHERE Category = '6f229691-b568-4255-b4d4-f0272a44fd66'
	
	OPEN curs
	
	FETCH NEXT FROM curs INTO @questionID, @questionText
	
	DECLARE @Answer NVARCHAR(MAX)
	SET @Answer = ''
	
	DECLARE @passed VARCHAR(7)
	
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @Answer = ''
		SET @passed = 'NA'
		SELECT @Answer = Answer, @passed = CASE WHEN Passed IS NULL THEN 'NA' ELSE CONVERT(NVARCHAR, Passed) END FROM InterviewQuestions WHERE TechID = @TechID AND QuestionID = @questionID
		
		INSERT INTO @mylist (Question, QuestionID, Answer, TechID, PassedIt) SELECT @questionText, @questionID, @Answer, @TechID, @passed
		
		FETCH NEXT FROM curs INTO @questionID, @questionText
	END

	CLOSE curs
	DEALLOCATE curs
	
	SELECT * FROM @mylist
	
END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 2/2/2012
-- Description:	Retrieve user's test scores
-- =============================================
CREATE PROCEDURE [dbo].[GetTestScores]
	@testID UNIQUEIDENTIFIER,
	@techID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT TS.ID AS TestTakenID, TS.TestScore, TT.DateTaken  
	FROM TestScores TS, TestsTaken TT 
	WHERE TS.TestTakenID = TT.ID AND TT.TestID = @testID AND TT.TechID = @techID

END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 2/11/2012
-- Description:	Retrieve tech short answers
-- =============================================
CREATE PROCEDURE [dbo].[RetrieveTechAnswers]
	@TechID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT TA.answerText, TA.ID AS QuestionID, CA.Question, TA.techID AS TechID, 
		CASE WHEN TA.Passed IS NULL THEN 'NA' ELSE CONVERT(NVARCHAR, TA.Passed) 
		END AS 'PassedIt' FROM TestAnswers TA, CertQuestions CA WHERE TA.techID = 
		@TechID AND TA.isEssay = 'True'
		AND TA.questionID = CA.ID
END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 2/1/2012
-- Description:	Insert a test score
-- =============================================
CREATE PROCEDURE [dbo].[InsertTestScore]
	@techID UNIQUEIDENTIFIER,
	@testTakenID UNIQUEIDENTIFIER,
	@score DECIMAL(18,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO TestScores (TestTakenID, TechID, TestScore) VALUES (@testTakenID, @techID, @score)

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


	SELECT *, dbo.IsGradedFunc(TS.TechID) AS 'IsGraded', dbo.IsPassed(TS.TechID) AS 'IsPassed' 
		FROM Techs T, TestScores TS WHERE T.ID = TS.TechID
END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 2/11/2012
-- Description:	Score Techs short answer questions
-- =============================================
CREATE PROCEDURE [dbo].[UpdateIntvQuestion]
	@questionID UNIQUEIDENTIFIER,
	@isPass BIT,
	@techID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE InterviewQuestions SET Passed = @isPass WHERE QuestionID = @questionID AND TechID = @techID
END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 1/26/2012
-- Description:	Retrieve all answers for a given question
-- =============================================
CREATE PROCEDURE [dbo].[GetUserOnUserName]
	@userName NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM Techs WHERE Email = @userName

END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 2/11/2012
-- Description:	Update interview question text
-- =============================================
CREATE PROCEDURE [dbo].[InsertQuestionText]
	@questionID UNIQUEIDENTIFIER,
	@techID UNIQUEIDENTIFIER,
	@answerText TEXT	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO InterviewQuestions (Answer, QuestionID, TechID) VALUES (@answerText, @questionID, @techID)
END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 2/11/2012
-- Description:	Score Techs short answer questions
-- =============================================
CREATE PROCEDURE [dbo].[UpdateTechQuestion]
	@questionID UNIQUEIDENTIFIER,
	@isPass BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TestAnswers SET Passed = @isPass WHERE ID = @questionID
END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 2/11/2012
-- Description:	Update interview question text
-- =============================================
CREATE PROCEDURE [dbo].[UpdateQuestionText]
	@questionID UNIQUEIDENTIFIER,
	@techID UNIQUEIDENTIFIER,
	@answerText TEXT	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE InterviewQuestions SET Answer = @answerText WHERE QuestionID = @questionID AND TechID = @techID
END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 2/1/2012
-- Description:	Insert a new test
-- =============================================
CREATE PROCEDURE [dbo].[InsertTest]
	@testID UNIQUEIDENTIFIER,
	@techID UNIQUEIDENTIFIER,
	@testTakenID UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SET @testTakenID = NEWID()
	
	INSERT INTO TestsTaken (ID, TestID, TechID) VALUES (@testTakenID, @testID, @techID)


END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 1/26/2012
-- Description:	Retrieve all questions in a particular category
-- =============================================
CREATE PROCEDURE [dbo].[RetrieveQuestions]
	@categoryID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT Question, ID FROM CertQuestions WHERE Category = @categoryID

END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 1/26/2012
-- Description:	Retrieve all answers for a given question
-- =============================================
CREATE PROCEDURE RetrieveAnswers
	@questionID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT ID, Choice, Answer FROM CertAnswers WHERE QuestionID = @questionID

END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 2/14/2012
-- Description:	Grade the Tech
-- =============================================
CREATE PROCEDURE [dbo].[GradeTech]
	@techID UNIQUEIDENTIFIER,
	@passed BIT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @grade DECIMAL(18,2)
	DECLARE @numShortPassed INT
	DECLARE @numShortFailed INT
	DECLARE @numInvPassed INT
	DECLARE @numInvFailed INT
	
	SELECT @numShortPassed = COUNT(*) FROM TestAnswers WHERE techID = @techID AND Passed = 'True'
	SELECT @numShortFailed = COUNT(*) FROM TestAnswers WHERE techID = @techID AND Passed = 'False'
	SELECT @numInvPassed = COUNT(*) FROM InterviewQuestions WHERE TechID = @techID AND Passed = 'True'
	SELECT @numInvFailed = COUNT(*) FROM InterviewQuestions WHERE TechID = @techID AND Passed = 'True'
	
	SET @grade = (CONVERT(DECIMAL(18,2),@numShortPassed) + CONVERT(DECIMAL(18,2),@numInvPassed)) 
			/ (CONVERT(DECIMAL(18,2),@numShortPassed) + CONVERT(DECIMAL(18,2),@numShortFailed) + 
				CONVERT(DECIMAL(18,2),@numInvPassed) + CONVERT(DECIMAL(18,2),@numInvFailed))
	
	SET @grade = @grade * 100.00
	
	IF @grade > 80.00
		BEGIN
			SET @passed = 'True'
		END
	ELSE
		BEGIN
			SET @passed = 'False'
		END
	
	INSERT INTO BlueRibbonCerts (TechID, Passed) VALUES (@techID, @passed)
	
END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 2/14/2012
-- Description:	Determine whether tech has been blueribbon certified
-- =============================================
CREATE PROCEDURE [dbo].[RetrievedPassFail]
	@techID UNIQUEIDENTIFIER,
	@passed BIT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SET @passed = 'False'

	SELECT @passed = Passed FROM BlueRibbonCerts WHERE TechID = @techID
	
END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 2/14/2012
-- Description:	Determine whether tech has been graded overall and for each question for Blue Ribbon certification
-- =============================================
CREATE PROCEDURE [dbo].[IsGraded]
	@TechID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @hasUnanswered BIT
	SET @hasUnanswered = 'False'

	DECLARE @theCount INT
	SET @theCount = 0

	SELECT @theCount = COUNT(*) FROM TestAnswers TA, CertQuestions CA WHERE TA.techID = 
		@TechID AND TA.isEssay = 'True' AND TA.Passed IS NULL
		AND TA.questionID = CA.ID
	
	IF @theCount > 0
		BEGIN
			SET @hasUnanswered = 'True'
		END
	ELSE
		BEGIN
			CREATE TABLE #tmpBus
			(
			   Question NVARCHAR(MAX),
			   QuestionID UNIQUEIDENTIFIER,
			   Answer NVARCHAR(MAX),
			   TechID UNIQUEIDENTIFIER,
			   PassedIt VARCHAR(7)   
			)

			INSERT INTO #tmpBus EXEC RetrieveInterviewQuestions @TechID
		
			SELECT @theCount = COUNT(*) FROM #tmpBus WHERE PassedIt = 'NA'
			IF @theCount > 0
			BEGIN
				SET @hasUnanswered = 'True'
			END
		END
	
	
	DECLARE @graded BIT
	SET @graded = 'False'

	SELECT @graded = COUNT(*) FROM BlueRibbonCerts WHERE TechID = @techID
	
	SELECT @graded AS 'graded', @TechID AS 'TechID', @hasUnanswered AS 'hasUnanswered'
	
END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 1/26/2012
-- Description:	Retrieve all answers for a given question
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

	SELECT @count = COUNT(*) FROM Techs WHERE Email = @userName AND Password = @password

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
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 2/1/2012
-- Description:	Update user's profile details
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUserDetails]
	@firstName NVARCHAR(50),
	@lastName NVARCHAR(50),
	@phone CHAR(10),
	@zip CHAR(5),
	@birthDate CHAR(8),
	@gender BIT,
	@techID UNIQUEIDENTIFIER,
	@profileImage IMAGE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE Techs SET FirstName = @firstName, LastName = @lastName, Phone = @phone,
		Zip = @zip, Gender = @gender, BirthDate = @birthDate, ProfileImage = @profileImage WHERE ID = @techID

END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 2/1/2012
-- Description:	Update user's description
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUserDescription]
	@techID UNIQUEIDENTIFIER,
	@description TEXT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE Techs SET About = @description WHERE ID = @techID

END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 1/30/2012
-- Description:	Insert a new test answer
-- =============================================
CREATE PROCEDURE [dbo].[InsertAnswer]
	@testID UNIQUEIDENTIFIER,
	@techID UNIQUEIDENTIFIER,
	@testTakenID UNIQUEIDENTIFIER,
	@questionID UNIQUEIDENTIFIER,
	@answerID UNIQUEIDENTIFIER,
	@answerText TEXT,
	@isEssay BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO TestAnswers (TestTakenID, testID, techID, questionID, answerID, answerText, isEssay) 
	VALUES(@testTakenID, @testID, @techID, @questionID, @answerID, @answerText, @isEssay)
	
END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 1/27/2012
-- Description:	Register a new tech
-- =============================================
CREATE PROCEDURE [dbo].[SignUpUser]
	@firstName NVARCHAR(50),
	@lastName NVARCHAR(50),
	@phone CHAR(10),
	@zip CHAR(5),
	@email NVARCHAR(100),
	@birthDate CHAR(8),
	@gender BIT,
	@password VARCHAR(100),
	@techID UNIQUEIDENTIFIER OUTPUT,
	@message NVARCHAR(100) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @count INT
	SET @count = 0

	SELECT @count = COUNT(*) FROM Techs WHERE Email = @email

	IF @count <> 0
		BEGIN
			SET @message = 'An account associated with this email address already exists.'
		END
	ELSE
		BEGIN
			DECLARE @newG UNIQUEIDENTIFIER
			SET @newG = NEWID()

			INSERT INTO Techs (ID, FirstName, LastName, Phone, Zip, Email, Password, Gender, BirthDate) 
			VALUES (@newG, @firstName, @lastName, @phone, @zip, @email, @password, @gender, @birthDate)
			
			SET @techID = @newG
			SET @message = 'success'	
		END
END
GO
-- =============================================
-- Author:		Aleksandra Czajka
-- Create date: 1/30/2012
-- Description:	Retrieve a test page
-- =============================================
CREATE PROCEDURE [dbo].[GetTestPage]
	@testID UNIQUEIDENTIFIER,
	@pageID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @isEssay BIT
	SET @isEssay = 'False'

	SELECT @isEssay = isEssay FROM TestPages WHERE TestID = @testID AND PageOrder = @pageID

	IF @isEssay = 0
		BEGIN
			SELECT T.[Name], T.ID AS TestID, TP.PageOrder, TP.NumberOfQuestions, TP.isRandom, TP.isEssay,
				CQ.Question, CQ.ID AS QuestionID, CA.Choice AS Choice, CA.[Order] AS AnswerOrder, CA.Answer AS Answer, CA.ID AS AnswerID
			FROM Tests T, TestPages TP, CertQuestions CQ, CertAnswers CA WHERE T.ID = @testID AND TP.TestID = T.ID 
				AND TP.PageOrder = @pageID AND CQ.Category = TP.QuestionCategory AND CA.QuestionID = CQ.ID
		END
	ELSE
		BEGIN
			SELECT T.[Name], T.ID AS TestID, TP.PageOrder, TP.NumberOfQuestions, TP.isRandom, TP.isEssay,
				CQ.Question, CQ.ID AS QuestionID
			FROM Tests T, TestPages TP, CertQuestions CQ WHERE T.ID = @testID AND TP.TestID = T.ID 
				AND TP.PageOrder = @pageID AND CQ.Category = TP.QuestionCategory
		END

	--Select the count of all pages from this specific test
	--Parameter used to determine whether there is a 'next' button on the page
	SELECT COUNT(*) AS PageCount FROM TestPages WHERE TestID = @testID

END
GO
