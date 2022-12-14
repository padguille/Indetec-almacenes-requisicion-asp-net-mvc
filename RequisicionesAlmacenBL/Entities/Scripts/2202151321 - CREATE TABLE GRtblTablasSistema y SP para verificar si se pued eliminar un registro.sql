SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRtblTablasSistema](
	[NombreTabla] [varchar](100) NOT NULL,
	[CampoBorrado] [varchar](100) NOT NULL,
	[IDEstatusBorrado] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'MItblControlMaestroDimension', N'Borrado', 1)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'MItblControlMaestroDimensionNivel', N'Borrado', 1)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'MItblControlMaestroFrecuenciaMedicion', N'Borrado', 1)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'MItblControlMaestroFrecuenciaMedicionNivel', N'Borrado', 1)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'MItblControlMaestroTipoIndicador', N'Borrado', 1)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'MItblControlMaestroTipoIndicadorNivel', N'Borrado', 1)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'MItblControlMaestroUnidadMedida', N'Borrado', 1)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'MItblControlMaestroUnidadMedidaDimension', N'Borrado', 1)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'MItblControlMaestroUnidadMedidaFormulaVariable', N'Borrado', 1)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'MItblMatrizConfiguracionPresupuestal', N'EstatusId', 3)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'MItblMatrizConfiguracionPresupuestalDetalle', N'EstatusId', 3)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'MItblMatrizConfiguracionPresupuestalSeguimientoVariable', N'EstatusId', 3)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'MItblMatrizIndicadorResultado', N'EstatusId', 3)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'MItblMatrizIndicadorResultadoIndicador', N'EstatusId', 3)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'MItblMatrizIndicadorResultadoIndicadorFormulaVariable', N'EstatusId', 3)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'MItblMatrizIndicadorResultadoIndicadorMeta', N'EstatusId', 3)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'MItblPlanDesarrollo', N'EstatusId', 3)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'MItblPlanDesarrolloEstructura', N'EstatusId', 3)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'RHtblEmpleado', N'EstatusId', 3)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'GRtblUsuario', N'Borrado', 1)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'GRtblUsarioPermiso', N'EstatusId', 3)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'GRtblRol', N'EstatusId', 3)
GO
INSERT [dbo].[GRtblTablasSistema] ([NombreTabla], [CampoBorrado], [IDEstatusBorrado]) VALUES (N'GRtblRolMenu', N'EstatusId', 3)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_GRtblTablasSistema]    Script Date: 17/02/2022 11:31:11 p. m. ******/
ALTER TABLE [dbo].[GRtblTablasSistema] ADD  CONSTRAINT [IX_GRtblTablasSistema] UNIQUE NONCLUSTERED 
(
	[NombreTabla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GRspPermiteEliminarRegistro]    Script Date: 17/02/2022 11:31:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GRspPermiteEliminarRegistro]
	@RegistroId bigInt,
	@NombreTabla nvarchar(500),
	@PermiteEliminar BIT OUTPUT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @TableName NVARCHAR(128);
	DECLARE @ColumnName NVARCHAR(128);
	DECLARE @sSQL nvarchar(max);
	DECLARE @Contador bigint;
	DECLARE @campoBorrado NVARCHAR(100)
	DECLARE @IdEstatusBorrado INT
	DECLARE @PermiteEliminarTmp BIT

	SET @PermiteEliminarTmp = 1

	-- Obtenemos todas las tablas a las que esta relacionado el registro que 
	-- queremos borrar (FK)
	DECLARE cLlaves 
	CURSOR FOR
	SELECT  OBJECT_NAME(f.parent_object_id) TableName,
			COL_NAME(fc.parent_object_id,fc.parent_column_id) ColumnName
	FROM sys.foreign_keys AS f
	INNER JOIN sys.foreign_key_columns AS fc ON f.object_id = fc.constraint_object_id
	INNER JOIN sys.tables AS t ON t.object_id = fc.referenced_object_id
	WHERE OBJECT_NAME(f.referenced_object_id) = @NombreTabla;

	-- Iteramos por cada tabla encontrada, y verificamos si el registro que queremos
	-- borrar se encuentra en esa tabla y esta vigente 
	OPEN cLlaves;
	FETCH NEXT FROM cLlaves INTO @TableName, @ColumnName;
	WHILE @@FETCH_STATUS = 0
	BEGIN

		SET @campoBorrado = (SELECT CampoBorrado FROM GRtblTablasSistema WHERE NombreTabla = @TableName)
		SET @IdEstatusBorrado = (SELECT IDEstatusBorrado FROM GRtblTablasSistema WHERE NombreTabla = @TableName)

		SET @sSQL = 'SELECT @Contador = COUNT(*) FROM ' + QUOTENAME(@TableName) +               
					' WHERE ' + QUOTENAME(@ColumnName) + ' = ' + cast(@RegistroId as nvarchar) + 
							 (CASE WHEN @campoBorrado IS NOT NULL THEN ( ' AND ' + QUOTENAME(@campoBorrado) + ' <> ' + cast(@IdEstatusBorrado as nvarchar) ) ELSE '' END )
		EXEC sp_executesql @sSQL, N'@Contador bigint output', @Contador OUTPUT;	 
		IF @Contador > 0 
		BEGIN		
			SET @PermiteEliminarTmp = 0
			BREAK;
		END
	
	FETCH NEXT FROM cLlaves INTO @TableName, @ColumnName;
	end;

	close cLlaves;
	deallocate cLlaves;

	SET @PermiteEliminar = @PermiteEliminarTmp
	RETURN @PermiteEliminar
END
GO

/****** Object:  StoredProcedure [dbo].[GRspPermiteEliminarRegistro]    Script Date: 17/02/2022 10:35:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alonso Soto
-- Create date: 20/09/2021
-- Description:	SP para validar si un registro puede ser eliminado
-- =============================================
CREATE PROCEDURE [dbo].[GRspPermiteEliminarRegistro]
	@RegistroId bigInt,
	@NombreTabla nvarchar(500),
	@PermiteEliminar BIT OUTPUT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @TableName NVARCHAR(128);
	DECLARE @ColumnName NVARCHAR(128);
	DECLARE @sSQL nvarchar(max);
	DECLARE @Contador bigint;
	DECLARE @campoBorrado NVARCHAR(100)
	DECLARE @IdEstatusBorrado INT
	DECLARE @PermiteEliminarTmp BIT

	SET @PermiteEliminarTmp = 1

	-- Obtenemos todas las tablas a las que esta relacionado el registro que 
	-- queremos borrar (FK)
	DECLARE cLlaves 
	CURSOR FOR
	SELECT  OBJECT_NAME(f.parent_object_id) TableName,
			COL_NAME(fc.parent_object_id,fc.parent_column_id) ColumnName
	FROM sys.foreign_keys AS f
	INNER JOIN sys.foreign_key_columns AS fc ON f.object_id = fc.constraint_object_id
	INNER JOIN sys.tables AS t ON t.object_id = fc.referenced_object_id
	WHERE OBJECT_NAME(f.referenced_object_id) = @NombreTabla;

	-- Iteramos por cada tabla encontrada, y verificamos si el registro que queremos
	-- borrar se encuentra en esa tabla y esta vigente 
	OPEN cLlaves;
	FETCH NEXT FROM cLlaves INTO @TableName, @ColumnName;
	WHILE @@FETCH_STATUS = 0
	BEGIN

		SET @campoBorrado = (SELECT CampoBorrado FROM GRtblTablasSistema WHERE NombreTabla = @TableName)
		SET @IdEstatusBorrado = (SELECT IDEstatusBorrado FROM GRtblTablasSistema WHERE NombreTabla = @TableName)

		SET @sSQL = 'SELECT @Contador = COUNT(*) FROM ' + QUOTENAME(@TableName) +               
					' WHERE ' + QUOTENAME(@ColumnName) + ' = ' + cast(@RegistroId as nvarchar) + 
							 (CASE WHEN @campoBorrado IS NOT NULL THEN ( ' AND ' + QUOTENAME(@campoBorrado) + ' <> ' + cast(@IdEstatusBorrado as nvarchar) ) ELSE '' END )
		EXEC sp_executesql @sSQL, N'@Contador bigint output', @Contador OUTPUT;	 
		IF @Contador > 0 
		BEGIN		
			SET @PermiteEliminarTmp = 0
			BREAK;
		END
	
	FETCH NEXT FROM cLlaves INTO @TableName, @ColumnName;
	end;

	close cLlaves;
	deallocate cLlaves;

	SET @PermiteEliminar = @PermiteEliminarTmp
	RETURN @PermiteEliminar
END
GO
