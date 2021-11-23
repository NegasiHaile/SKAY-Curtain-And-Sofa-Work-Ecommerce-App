CREATE TABLE [dbo].[SofaCloths] (
    [IdNumber]           NVARCHAR (6)    NOT NULL,
    [Width]              REAL            NOT NULL,
    [Height]             REAL            NOT NULL,
    [Name_Color]         NVARCHAR (50)   DEFAULT (NULL) NULL,
    [PricePerMeter]      REAL            NOT NULL,
    [GeberPricePerMeter] REAL            NULL,
    [Description]        NVARCHAR (101)  NULL,
    [Photo]              VARBINARY (MAX) NOT NULL,
    [How_Many_Users]     INT             NULL,
    [ClothCatagory]      NVARCHAR (20)   NULL,
    [SubCatagory]        NVARCHAR (20)   NULL,
    PRIMARY KEY CLUSTERED ([IdNumber] ASC)
);

