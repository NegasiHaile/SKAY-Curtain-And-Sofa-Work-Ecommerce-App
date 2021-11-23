CREATE TABLE [dbo].[FeedBacks] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [FullName]    NVARCHAR (50)  NOT NULL,
    [Phone_Email] NVARCHAR (30)  NOT NULL,
    [Subject]     NVARCHAR (100) NULL,
    [Message]     NVARCHAR (500) NULL,
    [Status]      NVARCHAR (10)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

