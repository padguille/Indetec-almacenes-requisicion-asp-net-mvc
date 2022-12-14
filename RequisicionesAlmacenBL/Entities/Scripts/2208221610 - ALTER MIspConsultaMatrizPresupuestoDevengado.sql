SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================
-- Author:		Alonso Soto
-- Create date: 10/03/2022
-- Description:	SP para obtener la matriz de presupuesto devengado
-- =============================================================
ALTER   PROCEDURE [dbo].[MIspConsultaMatrizPresupuestoDevengado]
	@mirID INT
AS
BEGIN

DECLARE @NIVEL_INDICADOR_COMPONENTE INT = 42
DECLARE @NIVEL_INDICADOR_ACTIVIDAD INT = 43
DECLARE @TIPO_RELACION_ACTIVIDAD_PROYECTO INT = 54
DECLARE @TIPO_RELACION_COMPONENTE_PROYECTO INT = 55
DECLARE @TIPO_PRESUPUESTO_DEVENGADO INT = 57

DECLARE @ejercicio INT
DECLARE @proyectosID NVARCHAR(2000)
DECLARE @fechaInicio NVARCHAR(50)
DECLARE @fechaFin NVARCHAR(50)
DECLARE @tblMontoProyectosResult TABLE (ProyectoId NVARCHAR(6),
									    Nombre NVARCHAR(250),
                                        MontoVigente MONEY,
                                        MontoDevengado MONEY)

DECLARE @tblMontoProyectos TABLE (ProyectoId NVARCHAR(6), 
                                  Nombre NVARCHAR(250), 
								  Enero MONEY,
								  Febrero MONEY,
								  Marzo MONEY,
								  Abril MONEY,
								  Mayo MONEY,
								  Junio MONEY,
								  Julio MONEY,
								  Agosto MONEY,
								  Septiembre MONEY,
								  Octubre MONEY,
								  Noviembre MONEY,
								  Diciembre MONEY,
								  MontoAnual MONEY,
								  CorteEnero MONEY,
								  CorteFebrero MONEY,
								  CorteMarzo MONEY,
								  CorteAbril MONEY,
								  CorteMayo MONEY,
								  CorteJunio MONEY,
								  CorteJulio MONEY,
								  CorteAgosto MONEY,
								  CorteSeptiembre MONEY,
								  CorteOctubre MONEY,
								  CorteNoviembre MONEY,
								  CorteDiciembre MONEY)

DECLARE @tblMatrizPresupuestoDevengado TABLE (
											ConfiguracionPresupuestoDetalleId INT,
											ConfiguracionPresupuestoId INT,
											MIRIndicadorId INT,
											NombreComponente NVARCHAR(500),
											NombreActividad NVARCHAR(500),
											MIRIndicadorComponenteId INT,
											TipoComponenteId INT,
											NivelIndicadorId INT,
											ProyectoId VARCHAR(6),
											PorcentajeProyecto DECIMAL(18,2),
											PorcentajeActividad DECIMAL(18,2),
											Enero DECIMAL(18,2),
											Febrero DECIMAL(18,2),
											Marzo DECIMAL(18,2),
											Abril DECIMAL(18,2),
											Mayo DECIMAL(18,2),
											Junio DECIMAL(18,2),
											Julio DECIMAL(18,2),
											Agosto DECIMAL(18,2),
											Septiembre DECIMAL(18,2),
											Octubre DECIMAL(18,2),
											Noviembre DECIMAL(18,2),
											Diciembre DECIMAL(18,2),
											Anual DECIMAL(18,2),
											NumeroRow INT
											)

DECLARE @tblMatrizPresupuestoDevengadoTemp TABLE (
											ConfiguracionPresupuestoDetalleId INT,
											ConfiguracionPresupuestoId INT,
											MIRIndicadorId INT,
											NombreComponente NVARCHAR(500),
											NombreActividad NVARCHAR(500),
											MIRIndicadorComponenteId INT,
											TipoComponenteId INT,
											NivelIndicadorId INT,
											ProyectoId VARCHAR(6),
											PorcentajeProyecto DECIMAL(18,2),
											PorcentajeActividad DECIMAL(18,2),
											Enero DECIMAL(18,2),
											Febrero DECIMAL(18,2),
											Marzo DECIMAL(18,2),
											Abril DECIMAL(18,2),
											Mayo DECIMAL(18,2),
											Junio DECIMAL(18,2),
											Julio DECIMAL(18,2),
											Agosto DECIMAL(18,2),
											Septiembre DECIMAL(18,2),
											Octubre DECIMAL(18,2),
											Noviembre DECIMAL(18,2),
											Diciembre DECIMAL(18,2),
											Anual DECIMAL(18,2),
											NumeroRow INT
											)

--Insertamos los proyectos de los cuales tomaremos los montos devengados
INSERT INTO @tblMontoProyectos (ProyectoId)
SELECT DISTINCT MIRI.ProyectoId 
FROM MItblMatrizIndicadorResultado MIR
INNER JOIN MItblMatrizIndicadorResultadoIndicador MIRI ON MIRI.MIRId = MIR.MIRId
WHERE NivelIndicadorId IN (42, 43) AND 
		MIRI.EstatusId = 1 AND 
		MIRI.ProyectoId IS NOT NULL AND
		MIR.MIRId = @mirID

SET @proyectosID = ''

SELECT @proyectosID = CASE WHEN  @proyectosID = '' THEN ProyectoId ELSE @proyectosID + COALESCE(',' + ProyectoId, '') END 
FROM @tblMontoProyectos

SET @proyectosID = 'WHERE ProyectoId IN (' + @proyectosID + ')' 
SET @ejercicio = (SELECT Ejercicio FROM MItblMatrizIndicadorResultado WHERE MIRId = @mirID)

--INSERT INTO @tblMontoProyectos
--EXEC dbo.Rep_Proyecto @fechaInicio, @fechaFin, @proyectosID   

DECLARE @contador INT = 1;
DECLARE @fechaInicial DATE = CONCAT(@ejercicio,'/01/01')

WHILE(@contador < 13)
BEGIN
    
	SET @fechaInicio = DATEADD(mm, DATEDIFF(mm, 0, @fechaInicial), 0)  ----First Day
	SET @fechaFin = DATEADD (dd, -1, DATEADD(mm, DATEDIFF(mm, 0, @fechaInicial) + 1, 0)) ----Last Day

	INSERT INTO @tblMontoProyectosResult
	EXEC dbo.MIspConsultaRepProyecto @fechaInicio, @fechaFin   

	IF(@contador = 1) --Enero
	BEGIN
		UPDATE @tblMontoProyectos 
		SET Enero = MPR.MontoDevengado
		FROM @tblMontoProyectosResult MPR
		WHERE [@tblMontoProyectos].ProyectoId = MPR.ProyectoId 
	END

	IF(@contador = 2) --Febrero
	BEGIN
		UPDATE @tblMontoProyectos 
		SET Febrero = MPR.MontoDevengado
		FROM @tblMontoProyectosResult MPR
		WHERE [@tblMontoProyectos].ProyectoId = MPR.ProyectoId 
	END

	IF(@contador = 3) --Marzo
	BEGIN
		UPDATE @tblMontoProyectos 
		SET Marzo = MPR.MontoDevengado
		FROM @tblMontoProyectosResult MPR
		WHERE [@tblMontoProyectos].ProyectoId = MPR.ProyectoId 
	END

	IF(@contador = 4) --Abril
	BEGIN
		UPDATE @tblMontoProyectos 
		SET Abril = MPR.MontoDevengado
		FROM @tblMontoProyectosResult MPR
		WHERE [@tblMontoProyectos].ProyectoId = MPR.ProyectoId 
	END

	IF(@contador = 5) --Mayo
	BEGIN
		UPDATE @tblMontoProyectos 
		SET Mayo = MPR.MontoDevengado
		FROM @tblMontoProyectosResult MPR
		WHERE [@tblMontoProyectos].ProyectoId = MPR.ProyectoId 
	END

		IF(@contador = 6) --Junio
	BEGIN
		UPDATE @tblMontoProyectos 
		SET Junio = MPR.MontoDevengado
		FROM @tblMontoProyectosResult MPR
		WHERE [@tblMontoProyectos].ProyectoId = MPR.ProyectoId 
	END

		IF(@contador = 7) --Julio
	BEGIN
		UPDATE @tblMontoProyectos 
		SET Julio = MPR.MontoDevengado
		FROM @tblMontoProyectosResult MPR
		WHERE [@tblMontoProyectos].ProyectoId = MPR.ProyectoId 
	END

		IF(@contador = 8) --Agosto
	BEGIN
		UPDATE @tblMontoProyectos 
		SET Agosto = MPR.MontoDevengado
		FROM @tblMontoProyectosResult MPR
		WHERE [@tblMontoProyectos].ProyectoId = MPR.ProyectoId 
	END

		IF(@contador = 9) --Septiembre
	BEGIN
		UPDATE @tblMontoProyectos 
		SET Septiembre = MPR.MontoDevengado
		FROM @tblMontoProyectosResult MPR
		WHERE [@tblMontoProyectos].ProyectoId = MPR.ProyectoId 
	END

		IF(@contador = 10) --Octubre
	BEGIN
		UPDATE @tblMontoProyectos 
		SET Octubre = MPR.MontoDevengado
		FROM @tblMontoProyectosResult MPR
		WHERE [@tblMontoProyectos].ProyectoId = MPR.ProyectoId 
	END

		IF(@contador = 11) --Noviembre
	BEGIN
		UPDATE @tblMontoProyectos 
		SET Noviembre = MPR.MontoDevengado
		FROM @tblMontoProyectosResult MPR
		WHERE [@tblMontoProyectos].ProyectoId = MPR.ProyectoId 
	END

		IF(@contador = 12) --Diciembre
	BEGIN
		UPDATE @tblMontoProyectos 
		SET Diciembre = MPR.MontoDevengado
		FROM @tblMontoProyectosResult MPR
		WHERE [@tblMontoProyectos].ProyectoId = MPR.ProyectoId 
	END
	
	--Limpiamos la tabla @tblMontoProyectosResult
	DELETE FROM @tblMontoProyectosResult
	--Incrementamos los contadores
	SET @fechaInicial = DATEADD(MM, 1, @fechaInicial)
	SET @contador += 1
END

--Actualizamos los Montos Corte de la tabla de Proyectos
UPDATE @tblMontoProyectos
SET CorteEnero = Enero ,
	CorteFebrero = Enero + Febrero,
	CorteMarzo = Enero + Febrero + Marzo,
	CorteAbril = Enero + Febrero + Marzo + Abril,
	CorteMayo = Enero + Febrero + Marzo + Abril + Mayo,
	CorteJunio = Enero + Febrero + Marzo + Abril + Mayo + Junio,
	CorteJulio = Enero + Febrero + Marzo + Abril + Mayo + Junio + Julio,
	CorteAgosto = Enero + Febrero + Marzo + Abril + Mayo + Junio + Julio + Agosto,
	CorteSeptiembre = Enero + Febrero + Marzo + Abril + Mayo + Junio + Julio + Agosto + Septiembre,
	CorteOctubre = Enero + Febrero + Marzo + Abril + Mayo + Junio + Julio + Agosto + Septiembre + Octubre,
	CorteNoviembre = Enero + Febrero + Marzo + Abril + Mayo + Junio + Julio + Agosto + Septiembre + Octubre + Noviembre,
	CorteDiciembre = Enero + Febrero + Marzo + Abril + Mayo + Junio + Julio + Agosto + Septiembre + Octubre + Noviembre + Diciembre,
	MontoAnual = Enero + Febrero + Marzo + Abril + Mayo + Junio + Julio + Agosto + Septiembre + Octubre + Noviembre + Diciembre
	
--SELECT * FROM @tblMontoProyectos


;WITH MIREstructuraCTE (MIRIndicadorId, NombreComponente, NombreActividad, MIRIndicadorComponenteId, TipoComponenteId, NivelIndicadorId, ProyectoId, PorcentajeProyecto, PorcentajeActividad, Orden)
		AS
		(
			SELECT  MIRI.MIRIndicadorId,
					CAST('C' + CAST( ROW_NUMBER() OVER(ORDER BY MIR.Codigo) AS NVARCHAR(10)) + ' - ' +  MIRI.NombreIndicador AS NVARCHAR(500))AS NombreComponente,
					CAST(NULL AS NVARCHAR(500)) AS NombreActividad,
					MIRI.MIRIndicadorComponenteId,
					MIRI.TipoComponenteId,
					MIRI.NivelIndicadorId,
					MIRI.ProyectoId,
					MIRI.PorcentajeProyecto,
					MIRI.PorcentajeActividad,
					CAST(RIGHT('00000' + Ltrim(Rtrim(ROW_NUMBER() OVER(ORDER BY MIR.Codigo))),5) AS VARCHAR(255))
			FROM MItblMatrizIndicadorResultado MIR
			INNER JOIN MItblMatrizIndicadorResultadoIndicador MIRI ON MIRI.MIRId = MIR.MIRId
			WHERE NivelIndicadorId = 42 AND 
				  MIRI.EstatusId = 1 AND 
				  MIR.MIRId = @mirID

			UNION ALL
		    
			SELECT  MIRI.MIRIndicadorId,
					MIREstructuraCTE.NombreComponente,
					CAST(MIRI.NombreIndicador AS NVARCHAR(500))AS NombreActividad,
					MIRI.MIRIndicadorComponenteId,
					MIRI.TipoComponenteId,
					MIRI.NivelIndicadorId,
					MIRI.ProyectoId,
					MIRI.PorcentajeProyecto,
					MIRI.PorcentajeActividad,
				   CAST(MIREstructuraCTE.Orden + '.' + RIGHT('00000' + Ltrim(Rtrim(ROW_NUMBER() OVER(ORDER BY MIRI.Codigo))),5) AS VARCHAR(255))
			FROM dbo.MItblMatrizIndicadorResultadoIndicador MIRI
			INNER JOIN MIREstructuraCTE ON MIRI.MIRIndicadorComponenteId =  MIREstructuraCTE.MIRIndicadorId 
			WHERE MIRI.NivelIndicadorId = 43 AND 
				  MIRI.EstatusId = 1 
		)	
		
INSERT INTO @tblMatrizPresupuestoDevengado
SELECT  MCPD.ConfiguracionPresupuestoDetalleId,
		MCPD.ConfiguracionPresupuestoId,
		MIREstructuraCTE.MIRIndicadorId,
		MIREstructuraCTE.NombreComponente,
		MIREstructuraCTE.NombreActividad,
		MIREstructuraCTE.MIRIndicadorComponenteId,
		MIREstructuraCTE.TipoComponenteId,
		MIREstructuraCTE.NivelIndicadorId,
		MIREstructuraCTE.ProyectoId,
		MIREstructuraCTE.PorcentajeProyecto,
		MIREstructuraCTE.PorcentajeActividad,
		ISNULL(MCPD.Enero,0),
		ISNULL(MCPD.Febrero,0),
		ISNULL(MCPD.Marzo,0),
		ISNULL(MCPD.Abril,0),
		ISNULL(MCPD.Mayo,0),
		ISNULL(MCPD.Junio,0),
		ISNULL(MCPD.Julio,0),
		ISNULL(MCPD.Agosto,0),
		ISNULL(MCPD.Septiembre,0),
		ISNULL(MCPD.Octubre,0),
		ISNULL(MCPD.Noviembre,0),
		ISNULL(MCPD.Diciembre,0),
		ISNULL(MCPD.Enero, 0) + ISNULL(MCPD.Febrero, 0) + ISNULL(MCPD.Marzo, 0) + ISNULL(MCPD.Abril, 0) + ISNULL(MCPD.Mayo, 0)+ ISNULL(MCPD.Junio, 0) +
		ISNULL(MCPD.Julio, 0) + ISNULL(MCPD.Agosto, 0) + ISNULL(MCPD.Septiembre, 0) + ISNULL(MCPD.Octubre, 0) + ISNULL(MCPD.Noviembre, 0) + ISNULL(MCPD.Diciembre, 0) AS MontoTotalAsignado, 
		ROW_NUMBER() OVER(ORDER BY Orden)
FROM MIREstructuraCTE 
LEFT JOIN @tblMontoProyectos MP ON MP.ProyectoId = MIREstructuraCTE.ProyectoId
LEFT JOIN ( SELECT  MCPD.*
			FROM MItblMatrizConfiguracionPresupuestal MCP
			INNER JOIN dbo.MItblMatrizConfiguracionPresupuestalDetalle MCPD ON MCPD.ConfiguracionPresupuestoId = MCP.ConfiguracionPresupuestoId
			WHERE  MCP.ClasificadorId = @TIPO_PRESUPUESTO_DEVENGADO
		  ) MCPD ON MCPD.MIRIndicadorId = MIREstructuraCTE.MIRIndicadorId


--Respaldamos la informacion de la Tabla @tblMatrizPresupuestoDevengado		  
INSERT INTO @tblMatrizPresupuestoDevengadoTemp
SELECT * FROM @tblMatrizPresupuestoDevengado

DECLARE @numeroComponentes INT
DECLARE @numeroActividades INT
DECLARE @numeroRowComponente INT 
DECLARE @numeroRowActividad INT

DECLARE @componenteId INT
DECLARE @tipoComponenteId INT
DECLARE @ultimoMesCapturado INT

DECLARE @iterador INT
DECLARE @iteradorComponentes INT
DECLARE @iteradorActividades INT

DECLARE @proyectoId VARCHAR(6)
DECLARE @montoAnualActividad DECIMAL(18,2)
DECLARE @montoAnualComponente DECIMAL(18,2)
DECLARE @montoAnualProyecto DECIMAL(18,2)

DECLARE @sumaMontoAnualComponentes DECIMAL(18,2)
DECLARE @sumaMontoActividades DECIMAL(18,2)
DECLARE @sumaMontoAnualActividades DECIMAL(18,2)

DECLARE @porcentajeActividad DECIMAL(18,2)
DECLARE @porcentajeComponente DECIMAL(18,2)

SET @numeroComponentes =  (SELECT COUNT(*) FROM @tblMatrizPresupuestoDevengado WHERE NivelIndicadorId = @NIVEL_INDICADOR_COMPONENTE)

SET @iteradorComponentes = 1
SET @numeroRowComponente = 1

WHILE (@iteradorComponentes <= @numeroComponentes)
BEGIN
	-- Inicializamos variables
	SET @iterador = 0
	SET @sumaMontoAnualActividades = 0
	SET @sumaMontoAnualComponentes = 0
	SET @montoAnualComponente = 0 
	SET @sumaMontoActividades = 0
	SET @ultimoMesCapturado = @iterador

	SET @componenteId = (SELECT MIRIndicadorId FROM @tblMatrizPresupuestoDevengado WHERE NumeroRow = @numeroRowComponente)
	SET @tipoComponenteId = (SELECT TipoComponenteId FROM @tblMatrizPresupuestoDevengado WHERE NumeroRow = @numeroRowComponente)

	--Si la relacion del componente es COMPONENTE - PROYECTO
	IF(@tipoComponenteId = @TIPO_RELACION_COMPONENTE_PROYECTO)
	BEGIN
		
		-- Obtenemos el ID del proyecto del Componente
		SET @proyectoId = (SELECT ProyectoId FROM @tblMatrizPresupuestoDevengado WHERE NumeroRow = @numeroRowComponente)
		
		-- Obtenemos el monto total del proyecto 
		SET @montoAnualProyecto = (SELECT MontoAnual FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId)

		-- Obtenemos el porcentaje del componente
		SET @porcentajeComponente = (SELECT PorcentajeProyecto FROM @tblMatrizPresupuestoDevengado WHERE  MIRIndicadorId =  @componenteId)
		
		-- Calculamos el monto anual para el componente
		SET @montoAnualComponente = ROUND( (SELECT ISNULL(MontoAnual,0) FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) * (SELECT (PorcentajeProyecto / 100) FROM @tblMatrizPresupuestoDevengado WHERE NumeroRow = @numeroRowComponente), 2 )
		
		-- Actualizamos el monto total anual del componente tomando en cuenta ya los ajustes al devengado del proyecto
		UPDATE @tblMatrizPresupuestoDevengado SET Anual = @montoAnualComponente WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Enero para el componente
		UPDATE @tblMatrizPresupuestoDevengado 
		SET Enero = CASE WHEN ROUND((MP.Enero * (@porcentajeComponente / 100)),2) <= ROUND(MP.CorteEnero * (@porcentajeComponente / 100), 2) THEN ROUND((MP.Enero * (@porcentajeComponente / 100)),2) ELSE ROUND(MP.CorteEnero * (@porcentajeComponente / 100), 2) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Febrero para el componente
		UPDATE @tblMatrizPresupuestoDevengado 
		SET Febrero = CASE WHEN ROUND((MP.Febrero * (@porcentajeComponente / 100)),2) <= (ROUND(MP.CorteFebrero * (@porcentajeComponente / 100), 2) - PD.Enero) THEN ROUND((MP.Febrero * (@porcentajeComponente / 100)),2) ELSE (ROUND(MP.CorteFebrero * (@porcentajeComponente / 100), 2) - PD.Enero) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Marzo para el componente
		UPDATE @tblMatrizPresupuestoDevengado 
		SET Marzo = CASE WHEN ROUND((MP.Marzo * (@porcentajeComponente / 100)),2) <= (ROUND(MP.CorteMarzo * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero)) THEN ROUND((MP.Marzo * (@porcentajeComponente / 100)),2) ELSE (ROUND(MP.CorteMarzo * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Abril para el componente
		UPDATE @tblMatrizPresupuestoDevengado 
		SET Abril = CASE WHEN ROUND((MP.Abril * (@porcentajeComponente / 100)),2) <= (ROUND(MP.CorteAbril * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero + PD.Marzo)) THEN ROUND((MP.Abril * (@porcentajeComponente / 100)),2) ELSE (ROUND(MP.CorteAbril * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero + PD.Marzo)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Mayo para el componente
		UPDATE @tblMatrizPresupuestoDevengado 
		SET Mayo = CASE WHEN ROUND((MP.Mayo * (@porcentajeComponente / 100)),2) <= (ROUND(MP.CorteMayo * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril)) THEN ROUND((MP.Mayo * (@porcentajeComponente / 100)),2) ELSE (ROUND(MP.CorteMayo * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId
		
		-- Actualizamos el monto de Junio para el componente
		UPDATE @tblMatrizPresupuestoDevengado 
		SET Junio = CASE WHEN ROUND((MP.Junio * (@porcentajeComponente / 100)),2) <= (ROUND(MP.CorteJunio * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo)) THEN ROUND((MP.Junio * (@porcentajeComponente / 100)),2) ELSE (ROUND(MP.CorteJunio * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId		
		
		-- Actualizamos el monto de Julio para el componente
		UPDATE @tblMatrizPresupuestoDevengado 
		SET Julio = CASE WHEN ROUND((MP.Julio * (@porcentajeComponente / 100)),2) <= (ROUND(MP.CorteJulio * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio)) THEN ROUND((MP.Julio * (@porcentajeComponente / 100)),2) ELSE (ROUND(MP.CorteJulio * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Agosto para el componente
		UPDATE @tblMatrizPresupuestoDevengado 
		SET Agosto = CASE WHEN ROUND((MP.Agosto * (@porcentajeComponente / 100)),2) <= (ROUND(MP.CorteAgosto * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio)) THEN ROUND((MP.Agosto * (@porcentajeComponente / 100)),2) ELSE (ROUND(MP.CorteAgosto * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Septiembre para el componente
		UPDATE @tblMatrizPresupuestoDevengado 
		SET Septiembre = CASE WHEN ROUND((MP.Septiembre * (@porcentajeComponente / 100)),2) <= (ROUND(MP.CorteSeptiembre * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio + PD.Agosto)) THEN ROUND((MP.Septiembre * (@porcentajeComponente / 100)),2) ELSE (ROUND(MP.CorteSeptiembre * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio + PD.Agosto)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Octubre para el componente
		UPDATE @tblMatrizPresupuestoDevengado 
		SET Octubre = CASE WHEN ROUND((MP.Octubre * (@porcentajeComponente / 100)),2) <= (ROUND(MP.CorteOctubre * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio + PD.Agosto + PD.Septiembre)) THEN ROUND((MP.Octubre * (@porcentajeComponente / 100)),2) ELSE (ROUND(MP.CorteOctubre * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio + PD.Agosto + PD.Septiembre)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Noviembre para el componente
		UPDATE @tblMatrizPresupuestoDevengado 
		SET Noviembre = CASE WHEN ROUND((MP.Noviembre * (@porcentajeComponente / 100)),2) <= (ROUND(MP.CorteNoviembre * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio + PD.Agosto + PD.Septiembre + PD.Octubre)) THEN ROUND((MP.Noviembre * (@porcentajeComponente / 100)),2) ELSE (ROUND(MP.CorteNoviembre * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio + PD.Agosto + PD.Septiembre + PD.Octubre)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Diciembre para el componente
		UPDATE @tblMatrizPresupuestoDevengado 
		SET Diciembre = CASE WHEN ROUND((MP.Diciembre * (@porcentajeComponente / 100)),2) <= (ROUND(MP.CorteDiciembre * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio + PD.Agosto + PD.Septiembre + PD.Octubre + PD.Noviembre)) THEN ROUND((MP.Diciembre * (@porcentajeComponente / 100)),2) ELSE (ROUND(MP.CorteDiciembre * (@porcentajeComponente / 100), 2) - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio + PD.Agosto + PD.Septiembre + PD.Octubre + PD.Noviembre)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId
									
		-- Obtenemos todas las actividades relacionadas al componente
		SET @iteradorActividades = 1
		SET @numeroActividades =  (SELECT COUNT(*) FROM @tblMatrizPresupuestoDevengado WHERE MIRIndicadorComponenteId = @componenteId)
		SET @numeroRowActividad = (SELECT MIN(NumeroRow) FROM @tblMatrizPresupuestoDevengado WHERE MIRIndicadorComponenteId = @componenteId)

		-- Iteramos por cada Actividad encontrada, para calcular el monto del mes de la actividad
		WHILE (@iteradorActividades <= @numeroActividades)
		BEGIN

			--Obtenemos el porcentaje de la actividad que aplicara del monto total del proyecto en el mes que se esta evaluando 
			SET @porcentajeActividad = (SELECT PorcentajeActividad FROM @tblMatrizPresupuestoDevengado WHERE NumeroRow = @numeroRowActividad )
			
			----Si es la ultima actividad, hacemos el calculo por diferencias, para que no haya problema de centavos
			--IF(@iteradorActividades = @numeroActividades)
			--BEGIN
			--	--Calculamos el monto Anual de la actividad
			--	SET @montoAnualActividad = @montoAnualComponente - @sumaMontoAnualActividades

			--	--Calculamos los montos de cada mes para la actividad que se esta evaluando por diferencia
			--	UPDATE @tblMatrizPresupuestoDevengado
			--	SET Enero		= CASE WHEN Temp.Enero = 0 THEN Resultados.Enero ELSE [@tblMatrizPresupuestoDevengado].Enero END,
			--		Febrero		= CASE WHEN Temp.Febrero = 0 THEN Resultados.Febrero ELSE [@tblMatrizPresupuestoDevengado].Febrero END,
			--		Marzo		= CASE WHEN Temp.Marzo = 0 THEN Resultados.Marzo ELSE [@tblMatrizPresupuestoDevengado].Marzo END,
			--		Abril		= CASE WHEN Temp.Abril = 0 THEN Resultados.Abril ELSE [@tblMatrizPresupuestoDevengado].Abril END,
			--		Mayo		= CASE WHEN Temp.Mayo = 0 THEN Resultados.Mayo ELSE [@tblMatrizPresupuestoDevengado].Mayo END,
			--		Junio		= CASE WHEN Temp.Junio = 0 THEN Resultados.Junio ELSE [@tblMatrizPresupuestoDevengado].Junio END,
			--		Julio		= CASE WHEN Temp.Julio = 0 THEN Resultados.Julio ELSE [@tblMatrizPresupuestoDevengado].Julio END,
			--		Agosto		= CASE WHEN Temp.Agosto = 0 THEN Resultados.Agosto ELSE [@tblMatrizPresupuestoDevengado].Agosto END,
			--		Septiembre  = CASE WHEN Temp.Septiembre = 0 THEN Resultados.Septiembre ELSE [@tblMatrizPresupuestoDevengado].Septiembre END,
			--		Octubre		= CASE WHEN Temp.Octubre = 0 THEN Resultados.Octubre ELSE [@tblMatrizPresupuestoDevengado].Octubre END,
			--		Noviembre	= CASE WHEN Temp.Noviembre = 0 THEN Resultados.Noviembre ELSE [@tblMatrizPresupuestoDevengado].Noviembre END,
			--		Diciembre	= Resultados.Diciembre,
			--		Anual = @montoAnualActividad
			--	FROM (
			--			SELECT  Componente.Enero - Actividades.Enero AS Enero,
			--					Componente.Febrero - Actividades.Febrero AS Febrero,
			--					Componente.Marzo - Actividades.Marzo AS Marzo,
			--					Componente.Abril - Actividades.Abril AS Abril,
			--					Componente.Mayo - Actividades.Mayo AS Mayo,
			--					Componente.Junio - Actividades.Junio AS Junio,
			--					Componente.Julio - Actividades.Julio AS Julio,
			--					Componente.Agosto - Actividades.Agosto AS Agosto,
			--					Componente.Septiembre - Actividades.Septiembre AS Septiembre,
			--					Componente.Octubre - Actividades.Octubre AS Octubre,
			--					Componente.Noviembre - Actividades.Noviembre AS Noviembre,
			--					Componente.Diciembre - Actividades.Diciembre AS Diciembre
			--			FROM (						
			--					SELECT  SUM (Actividades.Enero) AS Enero,
			--							SUM (Actividades.Febrero) AS Febrero,
			--							SUM (Actividades.Marzo) AS Marzo,
			--							SUM (Actividades.Abril) AS Abril,
			--							SUM (Actividades.Mayo) AS Mayo,
			--							SUM (Actividades.Junio) AS Junio,
			--							SUM (Actividades.Julio) AS Julio,
			--							SUM (Actividades.Agosto) AS Agosto,
			--							SUM (Actividades.Septiembre) AS Septiembre,
			--							SUM (Actividades.Octubre) AS Octubre,
			--							SUM (Actividades.Noviembre) AS Noviembre,
			--							SUM (Actividades.Diciembre) AS Diciembre,
			--							MIRIndicadorComponenteId			 
			--					FROM @tblMatrizPresupuestoDevengado Actividades
			--					WHERE Actividades.MIRIndicadorComponenteId = @componenteId AND NumeroRow <> @numeroRowActividad
			--					GROUP BY Actividades.MIRIndicadorComponenteId	
			--			) Actividades
			--			INNER JOIN ( SELECT * FROM @tblMatrizPresupuestoDevengado  WHERE MIRIndicadorId = @componenteId) Componente ON Componente.MIRIndicadorId = Actividades.MIRIndicadorComponenteId
			--	) Resultados
			--	INNER JOIN @tblMatrizPresupuestoDevengadoTemp Temp ON Temp.MIRIndicadorId =  @componenteId
			--	WHERE  [@tblMatrizPresupuestoDevengado].NumeroRow = @numeroRowActividad

			--END
			--ELSE
   --         BEGIN
 				
				--Calculamos los montos de cada mes para la actividad que se esta evaluando
				UPDATE @tblMatrizPresupuestoDevengado
				SET Enero		= CASE WHEN Temp.Enero = 0 THEN ROUND (( MP.Enero * (@porcentajeActividad / 100 )), 2) ELSE [@tblMatrizPresupuestoDevengado].Enero END,
					Febrero		= CASE WHEN Temp.Febrero = 0 THEN ROUND (( MP.Febrero * (@porcentajeActividad / 100 )), 2) ELSE [@tblMatrizPresupuestoDevengado].Febrero END,
					Marzo		= CASE WHEN Temp.Marzo = 0 THEN ROUND (( MP.Marzo * (@porcentajeActividad / 100 )), 2) ELSE [@tblMatrizPresupuestoDevengado].Marzo END,
					Abril		= CASE WHEN Temp.Abril = 0 THEN ROUND (( MP.Abril * (@porcentajeActividad / 100 )), 2) ELSE [@tblMatrizPresupuestoDevengado].Abril END,
					Mayo		= CASE WHEN Temp.Mayo = 0 THEN ROUND (( MP.Mayo * (@porcentajeActividad / 100 )), 2) ELSE [@tblMatrizPresupuestoDevengado].Mayo END,
					Junio		= CASE WHEN Temp.Junio = 0 THEN ROUND (( MP.Junio * (@porcentajeActividad / 100 )), 2) ELSE [@tblMatrizPresupuestoDevengado].Junio END,
					Julio		= CASE WHEN Temp.Julio = 0 THEN  ROUND (( MP.Julio * (@porcentajeActividad / 100 )), 2) ELSE [@tblMatrizPresupuestoDevengado].Julio END,
					Agosto		= CASE WHEN Temp.Agosto = 0 THEN ROUND (( MP.Agosto * (@porcentajeActividad / 100 )), 2) ELSE [@tblMatrizPresupuestoDevengado].Agosto END,
					Septiembre	= CASE WHEN Temp.Septiembre = 0 THEN ROUND (( MP.Septiembre * (@porcentajeActividad / 100 )), 2) ELSE [@tblMatrizPresupuestoDevengado].Septiembre END,
					Octubre		= CASE WHEN Temp.Octubre = 0 THEN ROUND (( MP.Octubre * (@porcentajeActividad / 100 )), 2) ELSE [@tblMatrizPresupuestoDevengado].Octubre END,
					Noviembre	= CASE WHEN Temp.Noviembre = 0 THEN  ROUND (( MP.Noviembre * (@porcentajeActividad / 100 )), 2) ELSE [@tblMatrizPresupuestoDevengado].Noviembre END,
					Diciembre	= CASE WHEN Temp.Diciembre = 0 THEN  ROUND (( MP.Diciembre * (@porcentajeActividad / 100 )), 2) ELSE [@tblMatrizPresupuestoDevengado].Diciembre END
				FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @ProyectoId) MP
				INNER JOIN @tblMatrizPresupuestoDevengadoTemp Temp ON Temp.MIRIndicadorId =  @componenteId
				WHERE [@tblMatrizPresupuestoDevengado].NumeroRow = @numeroRowActividad

				--Calculamos el Monto Anual de la actividad
				UPDATE @tblMatrizPresupuestoDevengado
				SET Anual = Totales.TotalAnual
				FROM(
					SELECT	Enero + Febrero + Marzo + Abril + Mayo + Junio + Julio + Agosto + Septiembre + Octubre + Noviembre + Diciembre AS TotalAnual
					FROM @tblMatrizPresupuestoDevengado WHERE NumeroRow = @numeroRowActividad
				) AS Totales
				WHERE NumeroRow = @numeroRowActividad

			--END
			
			SET @sumaMontoAnualActividades += @montoAnualActividad
			SET @numeroRowActividad += 1
			SET @iteradorActividades += 1
		END
	END
	
	--Si la relacion del componente es ACTIVIDAD - PROYECTO
    ELSE IF(@tipoComponenteId = @TIPO_RELACION_ACTIVIDAD_PROYECTO)
	BEGIN

		DECLARE @montoComponente DECIMAL(18,2) = 0
		DECLARE @montoCorteComponente DECIMAL (18,2) = 0
		SET @montoAnualComponente = (SELECT SUM( ROUND(MP.MontoAnual * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
									INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		-- Actualizamos el monto total anual del componente tomando en cuenta ya los ajustes al devengado del proyecto
		UPDATE @tblMatrizPresupuestoDevengado SET Anual = @montoAnualComponente WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Enero para el componente
		SET @montoComponente = (SELECT SUM( ROUND(MP.Enero * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		SET @montoCorteComponente = (SELECT SUM( ROUND(MP.CorteEnero * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		UPDATE @tblMatrizPresupuestoDevengado 
		SET Enero = CASE WHEN @montoComponente <= @montoCorteComponente THEN @montoComponente ELSE @montoCorteComponente END		
		WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Febrero para el componente
		SET @montoComponente = (SELECT SUM( ROUND(MP.Febrero * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		SET @montoCorteComponente = (SELECT SUM( ROUND(MP.CorteFebrero * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		UPDATE @tblMatrizPresupuestoDevengado 
		SET Febrero = CASE WHEN @montoComponente <= (@montoCorteComponente - PD.Enero) THEN @montoComponente ELSE (MP.CorteFebrero - PD.Enero) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Marzo para el componente
		SET @montoComponente = (SELECT SUM( ROUND(MP.Marzo * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		SET @montoCorteComponente = (SELECT SUM( ROUND(MP.CorteMarzo * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		UPDATE @tblMatrizPresupuestoDevengado 
		SET Marzo = CASE WHEN @montoComponente <= (@montoCorteComponente - (PD.Enero + PD.Febrero)) THEN @montoComponente ELSE (@montoCorteComponente - (PD.Enero + PD.Febrero)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Abril para el componente
		SET @montoComponente = (SELECT SUM( ROUND(MP.Abril * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		SET @montoCorteComponente = (SELECT SUM( ROUND(MP.CorteAbril * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		UPDATE @tblMatrizPresupuestoDevengado 
		SET Abril = CASE WHEN @montoComponente <= (@montoCorteComponente - (PD.Enero + PD.Febrero + PD.Marzo)) THEN @montoComponente ELSE (@montoCorteComponente - (PD.Enero + PD.Febrero + PD.Marzo)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Mayo para el componente
		SET @montoComponente = (SELECT SUM( ROUND(MP.Mayo * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		SET @montoCorteComponente = (SELECT SUM( ROUND(MP.CorteMayo * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		UPDATE @tblMatrizPresupuestoDevengado 
		SET Mayo = CASE WHEN @montoComponente <= (@montoCorteComponente - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril)) THEN @montoComponente ELSE (@montoCorteComponente - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId
		
		-- Actualizamos el monto de Junio para el componente
		SET @montoComponente = (SELECT SUM( ROUND(MP.Junio * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		SET @montoCorteComponente = (SELECT SUM( ROUND(MP.CorteJunio * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		UPDATE @tblMatrizPresupuestoDevengado 
		SET Junio = CASE WHEN @montoComponente <= (@montoCorteComponente - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo)) THEN @montoComponente ELSE (@montoCorteComponente - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId		
		
		-- Actualizamos el monto de Julio para el componente
		SET @montoComponente = (SELECT SUM( ROUND(MP.Julio * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		SET @montoCorteComponente = (SELECT SUM( ROUND(MP.CorteJulio * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		UPDATE @tblMatrizPresupuestoDevengado 
		SET Julio = CASE WHEN @montoComponente <= (@montoCorteComponente - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio)) THEN @montoComponente ELSE (@montoCorteComponente - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Agosto para el componente
		SET @montoComponente = (SELECT SUM( ROUND(MP.Agosto * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		SET @montoCorteComponente = (SELECT SUM( ROUND(MP.CorteAgosto * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		UPDATE @tblMatrizPresupuestoDevengado 
		SET Agosto = CASE WHEN @montoComponente <= (@montoCorteComponente - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio)) THEN @montoComponente ELSE (@montoCorteComponente - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Septiembre para el componente
		SET @montoComponente = (SELECT SUM( ROUND(MP.Septiembre * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		SET @montoCorteComponente = (SELECT SUM( ROUND(MP.CorteSeptiembre * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		UPDATE @tblMatrizPresupuestoDevengado 
		SET Septiembre = CASE WHEN @montoComponente <= (@montoCorteComponente - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio + PD.Agosto)) THEN @montoComponente ELSE (@montoCorteComponente - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio + PD.Agosto)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Octubre para el componente
		SET @montoComponente = (SELECT SUM( ROUND(MP.Octubre * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		SET @montoCorteComponente = (SELECT SUM( ROUND(MP.CorteOctubre * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		UPDATE @tblMatrizPresupuestoDevengado 
		SET Octubre = CASE WHEN @montoComponente <= (@montoCorteComponente - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio + PD.Agosto + PD.Septiembre)) THEN @montoComponente ELSE (@montoCorteComponente - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio + PD.Agosto + PD.Septiembre)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Noviembre para el componente
		SET @montoComponente = (SELECT SUM( ROUND(MP.Noviembre * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		SET @montoCorteComponente = (SELECT SUM( ROUND(MP.CorteNoviembre * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		UPDATE @tblMatrizPresupuestoDevengado 
		SET Noviembre = CASE WHEN @montoComponente <= (@montoCorteComponente- (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio + PD.Agosto + PD.Septiembre + PD.Octubre)) THEN @montoComponente ELSE (@montoCorteComponente - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio + PD.Agosto + PD.Septiembre + PD.Octubre)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId

		-- Actualizamos el monto de Diciembre para el componente
		SET @montoComponente = (SELECT SUM( ROUND(MP.Diciembre * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		SET @montoCorteComponente = (SELECT SUM( ROUND(MP.CorteDiciembre * (PorcentajeProyecto / 100 ),2) )
									 FROM (
											SELECT ProyectoId, SUM(PorcentajeProyecto) AS PorcentajeProyecto
											FROM @tblMatrizPresupuestoDevengado 
											WHERE MIRIndicadorComponenteId = @componenteId
											GROUP BY ProyectoId
									) Proyectos 
								INNER JOIN @tblMontoProyectos MP ON MP.ProyectoId = Proyectos.ProyectoId )

		UPDATE @tblMatrizPresupuestoDevengado 
		SET Diciembre = CASE WHEN @montoComponente <= (@montoCorteComponente - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio + PD.Agosto + PD.Septiembre + PD.Octubre + PD.Noviembre)) THEN @montoComponente ELSE (@montoCorteComponente - (PD.Enero + PD.Febrero + PD.Marzo + PD.Abril + PD.Mayo + PD.Junio + PD.Julio + PD.Agosto + PD.Septiembre + PD.Octubre + PD.Noviembre)) END
		FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) MP
		INNER JOIN @tblMatrizPresupuestoDevengado PD ON PD.NumeroRow = @numeroRowComponente
		WHERE MIRIndicadorId = @componenteId

	    --Obtenemos todas las actividades relacionadas al componente
		SET @iteradorActividades = 1
		SET @numeroActividades =  (SELECT COUNT(*) FROM @tblMatrizPresupuestoDevengado WHERE MIRIndicadorComponenteId = @componenteId)
		SET @numeroRowActividad = (SELECT MIN(NumeroRow) FROM @tblMatrizPresupuestoDevengado WHERE MIRIndicadorComponenteId = @componenteId)
		
		WHILE (@iteradorActividades <= @numeroActividades)
		BEGIN

			SET @proyectoId = (SELECT ProyectoId FROM @tblMatrizPresupuestoDevengado WHERE NumeroRow = @numeroRowActividad)

			--Obtenemos el porcentaje de la actividad que aplicara del monto total del proyecto en el mes que se esta evaluando 
			SET @porcentajeActividad = (SELECT PorcentajeProyecto FROM @tblMatrizPresupuestoDevengado WHERE NumeroRow = @numeroRowActividad )		

			-- Obtenemos el monto anual de la actividad
			--SET @montoAnualActividad = ROUND( (SELECT MontoAnual FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) * (@porcentajeActividad / 100) , 2 )

			--Calculamos el monto de cada mes para la actividad que se esta evaluando
			UPDATE @tblMatrizPresupuestoDevengado
			SET Enero		= CASE WHEN Temp.Enero = 0 THEN ROUND (( MP.Enero * (@porcentajeActividad / 100 )), 2) ELSE [@tblMatrizPresupuestoDevengado].Enero END ,
				Febrero		= CASE WHEN Temp.Febrero = 0 THEN ROUND (( MP.Febrero * (@porcentajeActividad / 100 )), 2)  ELSE [@tblMatrizPresupuestoDevengado].Febrero END,
				Marzo		= CASE WHEN Temp.Marzo = 0 THEN ROUND (( MP.Marzo * (@porcentajeActividad / 100 )), 2)  ELSE [@tblMatrizPresupuestoDevengado].Marzo END,
				Abril		= CASE WHEN Temp.Abril = 0 THEN ROUND (( MP.Abril * (@porcentajeActividad / 100 )), 2)  ELSE [@tblMatrizPresupuestoDevengado].Abril END,
				Mayo		= CASE WHEN Temp.Mayo = 0 THEN ROUND (( MP.Mayo * (@porcentajeActividad / 100 )), 2)  ELSE [@tblMatrizPresupuestoDevengado].Mayo END,
				Junio		= CASE WHEN Temp.Junio = 0 THEN ROUND (( MP.Junio * (@porcentajeActividad / 100 )), 2)  ELSE [@tblMatrizPresupuestoDevengado].Junio END,
				Julio		= CASE WHEN Temp.Julio = 0 THEN ROUND (( MP.Julio * (@porcentajeActividad / 100 )), 2)  ELSE [@tblMatrizPresupuestoDevengado].Julio END,
				Agosto		= CASE WHEN Temp.Agosto = 0 THEN ROUND (( MP.Agosto * (@porcentajeActividad / 100 )), 2)  ELSE [@tblMatrizPresupuestoDevengado].Agosto END,
				Septiembre	= CASE WHEN Temp.Septiembre = 0 THEN ROUND (( MP.Septiembre * (@porcentajeActividad / 100 )), 2)  ELSE [@tblMatrizPresupuestoDevengado].Septiembre END,
				Octubre		= CASE WHEN Temp.Octubre = 0 THEN ROUND (( MP.Octubre * (@porcentajeActividad / 100 )), 2)  ELSE [@tblMatrizPresupuestoDevengado].Octubre END,
				Noviembre	= CASE WHEN Temp.Noviembre = 0 THEN ROUND (( MP.Noviembre * (@porcentajeActividad / 100 )), 2)  ELSE [@tblMatrizPresupuestoDevengado].Noviembre END,
				Diciembre   = CASE WHEN Temp.Diciembre = 0 THEN ROUND (( MP.Diciembre * (@porcentajeActividad / 100 )), 2)  ELSE [@tblMatrizPresupuestoDevengado].Diciembre END
			FROM (SELECT * FROM @tblMontoProyectos WHERE ProyectoId = @ProyectoId) MP
			INNER JOIN @tblMatrizPresupuestoDevengadoTemp Temp ON Temp.MIRIndicadorId =  @componenteId
			WHERE [@tblMatrizPresupuestoDevengado].NumeroRow = @numeroRowActividad

			--Calculamos el Monto Anual de la actividad
			UPDATE @tblMatrizPresupuestoDevengado
			SET Anual = Totales.TotalAnual
			FROM(
				SELECT	Enero + Febrero + Marzo + Abril + Mayo + Junio + Julio + Agosto + Septiembre + Octubre + Noviembre + Diciembre AS TotalAnual
				FROM @tblMatrizPresupuestoDevengado WHERE NumeroRow = @numeroRowActividad
			) AS Totales
			WHERE NumeroRow = @numeroRowActividad

			-- Si es la ultima actividad, calculamos el monto total anual del componente 
			--IF(@iteradorActividades = @numeroActividades)
			--BEGIN
			--    UPDATE @tblMatrizPresupuestoDevengado
			--	SET Enero = Resultado.Enero,
			--		Febrero = Resultado.Febrero,
			--		Marzo = Resultado.Marzo,
			--		Abril = Resultado.Abril,
			--		Mayo = Resultado.Mayo,
			--		Junio = Resultado.Junio,
			--		Julio = Resultado.Julio,
			--		Agosto = Resultado.Agosto,
			--		Septiembre = Resultado.Septiembre,
			--		Octubre = Resultado.Octubre,
			--		Noviembre = Resultado.Noviembre,
			--		Diciembre = Resultado.Diciembre,
			--		Anual = Resultado.Anual
			--	FROM (
			--			SELECT SUM(Enero) AS Enero,
			--				   SUM(Febrero) AS Febrero,
			--				   SUM(Marzo) AS Marzo,
			--				   SUM(Abril) AS Abril,
			--				   SUM(Mayo) AS Mayo,
			--				   SUM(Junio) AS Junio,
			--				   SUM(Julio) AS Julio,
			--				   SUM(Agosto) AS Agosto,
			--				   SUM(Septiembre) AS Septiembre,
			--				   SUM(Octubre) AS Octubre,
			--				   SUM(Noviembre) AS Noviembre,
			--				   SUM(Diciembre) AS Diciembre,
			--				   SUM(Anual) AS Anual
			--			FROM @tblMatrizPresupuestoDevengado
			--			WHERE MIRIndicadorComponenteId = @componenteId
			--			GROUP BY MIRIndicadorComponenteId
			--	) AS Resultado
			--	WHERE NumeroRow = @numeroRowComponente
			--END

			SET @numeroRowActividad += 1
			SET @iteradorActividades += 1
		END
	END
	SET @iteradorComponentes += 1 
	SET @numeroRowComponente += (@numeroActividades + 1) 
END

SELECT ConfiguracionPresupuestoDetalleId,
	   ConfiguracionPresupuestoId,
       MIRIndicadorId,
	   ISNULL(MIRIndicadorComponenteId, MIRIndicadorId) AS MIRIndicadorComponenteId,
       NombreComponente,
	   NombreActividad,
       TipoComponenteId,
       NivelIndicadorId,
       Enero,
       Febrero,
       Marzo,
       Abril,
       Mayo,
       Junio,
       Julio,
       Agosto,
       Septiembre,
       Octubre,
       Noviembre,
       Diciembre,
       Anual,
	   ISNULL(PorcentajeProyecto, PorcentajeActividad) AS Porcentaje
FROM @tblMatrizPresupuestoDevengado 
ORDER BY NumeroRow

END

