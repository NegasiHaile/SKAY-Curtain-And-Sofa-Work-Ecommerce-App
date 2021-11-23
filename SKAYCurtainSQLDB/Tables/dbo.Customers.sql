CREATE TABLE [dbo].[Customers] (
    [PhoneNumber] NVARCHAR (13) NOT NULL,
    [FullName]    NVARCHAR (50) NOT NULL,
    [Gender]      NVARCHAR (7)  NOT NULL,
    [FullAddress] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([PhoneNumber] ASC)
);

