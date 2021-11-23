CREATE TABLE [dbo].[Accounts] (
    [Account_ID]     INT           IDENTITY (1, 1) NOT NULL,
    [PhoneNumber]    NVARCHAR (13) NOT NULL,
    [Email]          NVARCHAR (50) NULL,
    [Password]       NVARCHAR (50) NOT NULL,
    [Account_Type]   NVARCHAR (20) NOT NULL,
    [Account_Status] NVARCHAR (5)  NULL,
    PRIMARY KEY CLUSTERED ([PhoneNumber] ASC)
);

