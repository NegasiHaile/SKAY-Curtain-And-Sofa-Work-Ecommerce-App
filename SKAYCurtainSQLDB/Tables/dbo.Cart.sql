CREATE TABLE [dbo].[Cart] (
    [Cart_Id]                INT           IDENTITY (1, 1) NOT NULL,
    [Custom_Phone_Number]    NVARCHAR (13) NOT NULL,
    [Material_id]            NVARCHAR (15) NULL,
    [Model_Id]               NVARCHAR (6)  NULL,
    [Target_Task]            NVARCHAR (10) NOT NULL,
    [Item_Quantity]          INT           NOT NULL,
    [TotalMeter_WindowWidth] NVARCHAR (10) NOT NULL,
    [Tailor_Function]        NVARCHAR (15) NULL,
    [Drill_Malbes_Function]  NVARCHAR (15) NULL,
    [TotalPrice]             FLOAT (53)    NULL,
    [Cart_Description]       TEXT          NULL,
    [Cart_Status]            NVARCHAR (13) NULL,
    [Othor_Status]           NVARCHAR (13) NULL,
    PRIMARY KEY CLUSTERED ([Cart_Id] ASC)
);

