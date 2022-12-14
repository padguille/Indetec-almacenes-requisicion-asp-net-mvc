SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL Serializable
GO
BEGIN TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping extended properties'
GO
BEGIN TRY
	EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N'tblOrdenCompraDet', 'COLUMN', N'Status'
END TRY
BEGIN CATCH
	DECLARE @msg nvarchar(max);
	DECLARE @severity int;
	DECLARE @state int;
	SELECT @msg = ERROR_MESSAGE(), @severity = ERROR_SEVERITY(), @state = ERROR_STATE();
	RAISERROR(@msg, @severity, @state);

	SET NOEXEC ON
END CATCH
GO
PRINT N'Dropping foreign keys from [dbo].[tblOrdenCompraDet]'
GO
ALTER TABLE [dbo].[tblOrdenCompraDet] DROP CONSTRAINT [FK_tblOrdenCompraDet_tblCuentaPresupuestalEgr]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[tblOrdenCompraDet] DROP CONSTRAINT [FK_tblOrdenCompraDet_tblOrdenCompra]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[tblOrdenCompraDet] DROP CONSTRAINT [FK_tblOrdenCompraDet_tblProducto]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[tblOrdenCompraDet] DROP CONSTRAINT [FK_tblOrdenCompraDet_tblTarifaImpuesto]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[tblOrdenCompraCancelPDet]'
GO
ALTER TABLE [dbo].[tblOrdenCompraCancelPDet] DROP CONSTRAINT [FK_tblOrdenCompraCancelPDet_tblOrdenCompraDet]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[tblOrdenCompraDet]'
GO
ALTER TABLE [dbo].[tblOrdenCompraDet] DROP CONSTRAINT [PK_tblOrdenCompraDet]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[tblOrdenCompraDet]'
GO
ALTER TABLE [dbo].[tblOrdenCompraDet] DROP CONSTRAINT [DF_tblOrdenCompraDet_Status]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[tblOrdenCompraDet]'
GO
ALTER TABLE [dbo].[tblOrdenCompraDet] DROP CONSTRAINT [DF_tblOrdenCompraDet_Cantidad]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[tblOrdenCompraDet]'
GO
ALTER TABLE [dbo].[tblOrdenCompraDet] DROP CONSTRAINT [DF_tblOrdenCompraDet_Costo]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[tblOrdenCompraDet]'
GO
ALTER TABLE [dbo].[tblOrdenCompraDet] DROP CONSTRAINT [DF_tblOrdenCompraDet_Importe]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[tblOrdenCompraDet]'
GO
ALTER TABLE [dbo].[tblOrdenCompraDet] DROP CONSTRAINT [DF__tblOrdenCo__IEPS__6A50C1DA]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[tblOrdenCompraDet]'
GO
ALTER TABLE [dbo].[tblOrdenCompraDet] DROP CONSTRAINT [DF__tblOrdenC__Ajust__6B44E613]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Rebuilding [dbo].[tblOrdenCompraDet]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_tblOrdenCompraDet]
(
[OrdenCompraDetId] [int] NOT NULL IDENTITY(1, 1),
[OrdenCompraId] [int] NOT NULL,
[TarifaImpuestoId] [varchar] (10) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ProductoId] [varchar] (10) COLLATE Modern_Spanish_CI_AS NOT NULL,
[CuentaPresupuestalEgrId] [int] NOT NULL,
[Descripcion] [varchar] (250) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Status] [char] (1) COLLATE Modern_Spanish_CI_AS NOT NULL CONSTRAINT [DF_tblOrdenCompraDet_Status] DEFAULT ('A'),
[Cantidad] [float] NOT NULL CONSTRAINT [DF_tblOrdenCompraDet_Cantidad] DEFAULT ((0)),
[Costo] [money] NOT NULL CONSTRAINT [DF_tblOrdenCompraDet_Costo] DEFAULT ((0)),
[Importe] [money] NOT NULL CONSTRAINT [DF_tblOrdenCompraDet_Importe] DEFAULT ((0.00)),
[IEPS] [float] NOT NULL CONSTRAINT [DF__tblOrdenCo__IEPS__10E07F16] DEFAULT ((0)),
[Ajuste] [float] NOT NULL CONSTRAINT [DF__tblOrdenC__Ajust__11D4A34F] DEFAULT ((0)),
[IVA] [float] NOT NULL,
[ISH] [float] NOT NULL,
[RetencionISR] [float] NOT NULL,
[RetencionCedular] [float] NOT NULL,
[RetencionIVA] [float] NOT NULL,
[TotalPresupuesto] [float] NOT NULL,
[Total] [float] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_tblOrdenCompraDet] ON
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
INSERT INTO [dbo].[RG_Recovery_1_tblOrdenCompraDet]([OrdenCompraDetId], [OrdenCompraId], [TarifaImpuestoId], [ProductoId], [CuentaPresupuestalEgrId], [Descripcion], [Status], [Cantidad], [Costo], [Importe], [IEPS], [Ajuste]) SELECT [OrdenCompraDetId], [OrdenCompraId], [TarifaImpuestoId], [ProductoId], [CuentaPresupuestalEgrId], [Descripcion], [Status], [Cantidad], [Costo], [Importe], [IEPS], [Ajuste] FROM [dbo].[tblOrdenCompraDet]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_tblOrdenCompraDet] OFF
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[dbo].[tblOrdenCompraDet]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[dbo].[RG_Recovery_1_tblOrdenCompraDet]', RESEED, @idVal)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
DROP TABLE [dbo].[tblOrdenCompraDet]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_tblOrdenCompraDet]', N'tblOrdenCompraDet', N'OBJECT'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_tblOrdenCompraDet] on [dbo].[tblOrdenCompraDet]'
GO
ALTER TABLE [dbo].[tblOrdenCompraDet] ADD CONSTRAINT [PK_tblOrdenCompraDet] PRIMARY KEY CLUSTERED ([OrdenCompraDetId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[tblOrdenCompraDet]'
GO
ALTER TABLE [dbo].[tblOrdenCompraDet] ADD CONSTRAINT [FK_tblOrdenCompraDet_tblCuentaPresupuestalEgr] FOREIGN KEY ([CuentaPresupuestalEgrId]) REFERENCES [dbo].[tblCuentaPresupuestalEgr] ([CuentaPresupuestalEgrId])
GO
ALTER TABLE [dbo].[tblOrdenCompraDet] ADD CONSTRAINT [FK_tblOrdenCompraDet_tblOrdenCompra] FOREIGN KEY ([OrdenCompraId]) REFERENCES [dbo].[tblOrdenCompra] ([OrdenCompraId])
GO
ALTER TABLE [dbo].[tblOrdenCompraDet] ADD CONSTRAINT [FK_tblOrdenCompraDet_tblProducto] FOREIGN KEY ([ProductoId]) REFERENCES [dbo].[tblProducto] ([ProductoId])
GO
ALTER TABLE [dbo].[tblOrdenCompraDet] ADD CONSTRAINT [FK_tblOrdenCompraDet_tblTarifaImpuesto] FOREIGN KEY ([TarifaImpuestoId]) REFERENCES [dbo].[tblTarifaImpuesto] ([TarifaImpuestoId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[tblOrdenCompraCancelPDet]'
GO
ALTER TABLE [dbo].[tblOrdenCompraCancelPDet] ADD CONSTRAINT [FK_tblOrdenCompraCancelPDet_tblOrdenCompraDet] FOREIGN KEY ([OrdenCompraDetId]) REFERENCES [dbo].[tblOrdenCompraDet] ([OrdenCompraDetId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating extended properties'
GO
BEGIN TRY
	EXEC sp_addextendedproperty N'MS_Description', N'A = Activo, R = Recibido, P = Parcialmente Recibido, C = Cancelado', 'SCHEMA', N'dbo', 'TABLE', N'tblOrdenCompraDet', 'COLUMN', N'Status'
END TRY
BEGIN CATCH
	DECLARE @msg nvarchar(max);
	DECLARE @severity int;
	DECLARE @state int;
	SELECT @msg = ERROR_MESSAGE(), @severity = ERROR_SEVERITY(), @state = ERROR_STATE();
	RAISERROR(@msg, @severity, @state);

	SET NOEXEC ON
END CATCH
GO
COMMIT TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
-- This statement writes to the SQL Server Log so SQL Monitor can show this deployment.
IF HAS_PERMS_BY_NAME(N'sys.xp_logevent', N'OBJECT', N'EXECUTE') = 1
BEGIN
    DECLARE @databaseName AS nvarchar(2048), @eventMessage AS nvarchar(2048)
    SET @databaseName = REPLACE(REPLACE(DB_NAME(), N'\', N'\\'), N'"', N'\"')
    SET @eventMessage = N'Redgate SQL Compare: { "deployment": { "description": "Redgate SQL Compare deployed to ' + @databaseName + N'", "database": "' + @databaseName + N'" }}'
    EXECUTE sys.xp_logevent 55000, @eventMessage
END
GO
DECLARE @Success AS BIT
SET @Success = 1
SET NOEXEC OFF
IF (@Success = 1) PRINT 'The database update succeeded'
ELSE BEGIN
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
	PRINT 'The database update failed'
END
GO
