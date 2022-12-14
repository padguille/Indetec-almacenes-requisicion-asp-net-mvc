ALTER TABLE [dbo].[tblCompraDet] ADD
	[IVA] [float] NULL,
	[ISH] [float] NULL,
	[RetencionISR] [float] NULL,
	[RetencionCedular] [float] NULL,
	[RetencionIVA] [float] NULL,
	[TotalPresupuesto] [float] NULL,
	[Total] [float] NULL
GO

UPDATE tblCompraDet
  SET
      IVA = 0,
      ISH = 0,
      RetencionISR = 0,
      RetencionCedular = 0,
      RetencionIVA = 0,
      TotalPresupuesto = 0,
      Total = 0
GO

ALTER TABLE [dbo].[tblCompraDet] ALTER COLUMN [IVA] [float] NOT NULL
GO

ALTER TABLE [dbo].[tblCompraDet] ALTER COLUMN [ISH] [float] NOT NULL
GO
	
ALTER TABLE [dbo].[tblCompraDet] ALTER COLUMN [RetencionISR] [float] NOT NULL 
GO

ALTER TABLE [dbo].[tblCompraDet] ALTER COLUMN [RetencionCedular] [float] NOT NULL
GO

ALTER TABLE [dbo].[tblCompraDet] ALTER COLUMN [RetencionIVA] [float] NOT NULL
GO

ALTER TABLE [dbo].[tblCompraDet] ALTER COLUMN [TotalPresupuesto] [float] NOT NULL
GO

ALTER TABLE [dbo].[tblCompraDet] ALTER COLUMN [Total] [float] NOT NULL
GO