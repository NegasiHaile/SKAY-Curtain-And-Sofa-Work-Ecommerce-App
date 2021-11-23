CREATE TABLE [dbo].[FunctionsPrices] (
    [Id]                  INT            IDENTITY (1, 1) NOT NULL,
    [FunctionName]        NVARCHAR (25)  NOT NULL,
    [PricePermeterOrTask] REAL           NOT NULL,
    [FunctionDescription] NVARCHAR (150) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

