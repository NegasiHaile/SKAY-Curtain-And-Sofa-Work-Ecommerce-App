CREATE TABLE [dbo].[Employees] (
    [PhoneNumber]  NVARCHAR (13)   NOT NULL,
    [FName]        NVARCHAR (23)   NOT NULL,
    [MName]        NVARCHAR (23)   NOT NULL,
    [LName]        NVARCHAR (23)   NOT NULL,
    [Gender]       NVARCHAR (7)    NOT NULL,
    [Salary]       REAL            NOT NULL,
    [Branch]       NVARCHAR (20)   NOT NULL,
    [Position]     NVARCHAR (23)   NOT NULL,
    [Photo]        VARBINARY (MAX) NULL,
    [Teyaz_Detail] VARBINARY (MAX) NULL,
    PRIMARY KEY CLUSTERED ([PhoneNumber] ASC)
);

