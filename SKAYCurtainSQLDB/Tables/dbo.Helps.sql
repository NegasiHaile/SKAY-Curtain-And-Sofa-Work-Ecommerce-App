CREATE TABLE [dbo].[Helps] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [Help_Subject] NVARCHAR (100) NOT NULL,
    [Help_Detail]  NVARCHAR (600) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

