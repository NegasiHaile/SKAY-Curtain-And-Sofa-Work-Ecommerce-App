CREATE TABLE [dbo].[Orders] (
    [Order_Id]            INT            IDENTITY (1, 1) NOT NULL,
    [Custom_Phone_Number] NVARCHAR (13)  NOT NULL,
    [Cart_Ids]            NVARCHAR (15)  NULL,
    [Slected_Items]       NVARCHAR (50)  NULL,
    [Total_Price]         REAL           NULL,
    [Holding_Amount]      REAL           NULL,
    [Left_Amount]         REAL           NULL,
    [Order_Date]          NVARCHAR (20)  NULL,
    [Appointmet_Date]     NVARCHAR (20)  NULL,
    [Order_Descreption]   TEXT           NULL,
    [Order_Status]        NVARCHAR (25)  NULL,
    [Payment_Status]      NVARCHAR (25)  NULL,
    [Comment]             NVARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([Order_Id] ASC)
);

