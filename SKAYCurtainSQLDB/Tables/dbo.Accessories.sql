CREATE TABLE [dbo].[Accessories] (
    [Id]                 INT             IDENTITY (1, 1) NOT NULL,
    [Acce_Type]          NVARCHAR (15)   NOT NULL,
    [SpecialName_color]  NVARCHAR (50)   NULL,
    [PricePerMeter_One]  FLOAT (53)      NOT NULL,
    [Available_Quantity] FLOAT (53)      NOT NULL,
    [Acce_Description]   NVARCHAR (101)  NULL,
    [HowMuch_Love]       INT             NULL,
    [Acce_Photo]         VARBINARY (MAX) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

