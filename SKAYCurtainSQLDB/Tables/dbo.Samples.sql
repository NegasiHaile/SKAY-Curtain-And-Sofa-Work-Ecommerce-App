CREATE TABLE [dbo].[Samples] (
    [Id]                   NVARCHAR (6)    NOT NULL,
    [IdsOfTools]           NVARCHAR (6)    NULL,
    [SampleType]           NVARCHAR (10)   NOT NULL,
    [Drp_Wndw_Sf_TtlMeter] REAL            NULL,
    [ShirinkPer]           REAL            NULL,
    [TotalCost]            REAL            NOT NULL,
    [Image]                VARBINARY (MAX) NOT NULL,
    [Production_Date]      DATE            NULL,
    [Sample_SubCatagory]   NVARCHAR (30)   NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

