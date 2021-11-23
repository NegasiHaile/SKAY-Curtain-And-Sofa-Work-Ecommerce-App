CREATE TABLE [dbo].[SelectedItems] (
    [Id]                        INT           IDENTITY (1, 1) NOT NULL,
    [Cart_Id]                   INT           NOT NULL,
    [Item_Id]                   NVARCHAR (6)  NOT NULL,
    [wndw_ClothSofa_Meter]      REAL          NOT NULL,
    [Shirink_ForWhatPartOfSofa] NVARCHAR (15) NOT NULL,
    [Meskeya_Tailoring]         NVARCHAR (5)  NULL,
    [Drilling_Clothing]         NVARCHAR (5)  NULL,
    [Price]                     REAL          NOT NULL,
    [Item_Status]               NVARCHAR (15) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

