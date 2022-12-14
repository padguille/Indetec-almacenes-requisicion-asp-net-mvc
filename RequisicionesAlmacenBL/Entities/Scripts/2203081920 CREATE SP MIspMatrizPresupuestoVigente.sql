SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================
-- Author:		Alonso Soto
-- Create date: 01/03/2022
-- Description:	SP para obtener la matriz de presupuesto vigente
-- =============================================================
CREATE OR ALTER PROCEDURE [dbo].[MIspConsultaMatrizPresupuestoVigente]
	@mirID INT
AS
BEGIN

DECLARE @NIVEL_INDICADOR_COMPONENTE INT = 42
DECLARE @NIVEL_INDICADOR_ACTIVIDAD INT = 43
DECLARE @TIPO_RELACION_ACTIVIDAD_PROYECTO INT = 54
DECLARE @TIPO_RELACION_COMPONENTE_PROYECTO INT = 55
DECLARE @TIPO_PRESUPUESTO_POR_EJERCER INT = 56

DECLARE @ejercicio INT
DECLARE @proyectosID NVARCHAR(2000)
DECLARE @fechaInicio NVARCHAR(50)
DECLARE @fechaFin NVARCHAR(50)
DECLARE @tblMontoProyectos TABLE (ProyectoId NVARCHAR(6), Nombre NVARCHAR(250), PresupuestoVigente MONEY, PresupuestoDevengado MONEY)

DECLARE @tblMatrizPresupuestoVigente TABLE (
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
    MontoTotalAsignado DECIMAL(18,2),
	NumeroRow INT
	)


SET @proyectosID = ''

SELECT @proyectosID = CASE WHEN  @proyectosID = '' THEN ProyectoId ELSE @proyectosID + COALESCE(',' + ProyectoId, '') END
FROM (
	SELECT DISTINCT MIRI.ProyectoId
	FROM MItblMatrizIndicadorResultado MIR
	INNER JOIN MItblMatrizIndicadorResultadoIndicador MIRI ON MIRI.MIRId = MIR.MIRId
	WHERE NivelIndicadorId IN (42, 43) AND 
		  MIRI.EstatusId = 1 AND 
		  MIRI.ProyectoId IS NOT NULL AND
		  MIR.MIRId = @mirID
) AS Proyectos

SET @proyectosID = 'WHERE ProyectoId IN (' + @proyectosID + ')' 
SET @ejercicio = (SELECT Ejercicio FROM MItblMatrizIndicadorResultado WHERE MIRId = @mirID)
SET @fechaInicio = CONCAT('01/01/', @ejercicio)
SET @fechaFin = CONCAT('31/12/', @ejercicio)

INSERT INTO @tblMontoProyectos
EXEC dbo.Rep_Proyecto @fechaInicio, @fechaFin, @proyectosID   

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
		

INSERT INTO @tblMatrizPresupuestoVigente
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
		MCPD.Enero,
		MCPD.Febrero,
		MCPD.Marzo,
		MCPD.Abril,
		MCPD.Mayo,
		MCPD.Junio,
		MCPD.Julio,
		MCPD.Agosto,
		MCPD.Septiembre,
		MCPD.Octubre,
		MCPD.Noviembre,
		MCPD.Diciembre,
		ISNULL(MCPD.Anual,0),
		ISNULL(MCPD.Enero, 0) + ISNULL(MCPD.Febrero, 0) + ISNULL(MCPD.Marzo, 0) + ISNULL(MCPD.Abril, 0) + ISNULL(MCPD.Mayo, 0)+ ISNULL(MCPD.Junio, 0) +
		ISNULL(MCPD.Julio, 0) + ISNULL(MCPD.Agosto, 0) + ISNULL(MCPD.Septiembre, 0) + ISNULL(MCPD.Octubre, 0) + ISNULL(MCPD.Noviembre, 0) + ISNULL(MCPD.Diciembre, 0) AS MontoTotalAsignado, 
		ROW_NUMBER() OVER(ORDER BY Orden)
FROM MIREstructuraCTE 
LEFT JOIN @tblMontoProyectos MP ON MP.ProyectoId = MIREstructuraCTE.ProyectoId
LEFT JOIN ( SELECT  MCPD.*
			FROM MItblMatrizConfiguracionPresupuestal MCP
			INNER JOIN dbo.MItblMatrizConfiguracionPresupuestalDetalle MCPD ON MCPD.ConfiguracionPresupuestoId = MCP.ConfiguracionPresupuestoId
			WHERE  MCP.ClasificadorId = @TIPO_PRESUPUESTO_POR_EJERCER
		  ) MCPD ON MCPD.MIRIndicadorId = MIREstructuraCTE.MIRIndicadorId

DECLARE @numeroComponentes INT
DECLARE @numeroActividades INT
DECLARE @numeroRowComponente INT 
DECLARE @numeroRowActividad INT

DECLARE @componenteId INT
DECLARE @tipoComponenteId INT
DECLARE @ultimoMesCapturado INT

DECLARE @iteradorComponentes INT
DECLARE @iteradorActividades INT

DECLARE @proyectoId VARCHAR(6)
DECLARE @montoAnualProyecto DECIMAL(18,2)
DECLARE @montoAnualActividad DECIMAL(18,2)
DECLARE @montoTotalComponenteAsignado DECIMAL(18,2)
DECLARE @montoTotalActividadAsignado DECIMAL(18,2)
DECLARE @montoComponenteSiguienteMes DECIMAL(18,2)
DECLARE @montoActividadSiguienteMes DECIMAL(18,2)
DECLARE @sumaPorcentajeActividades DECIMAL(18,2)
DECLARE @sumaMontoActividades DECIMAL(18,2)
DECLARE @sumaMontoAnualActividades DECIMAL(18,2)
DECLARE @numeroMesesPorAsignar INT
DECLARE @porcentajeActividad DECIMAL(18,2)

SET @numeroComponentes =  (SELECT COUNT(*) FROM @tblMatrizPresupuestoVigente WHERE NivelIndicadorId = @NIVEL_INDICADOR_COMPONENTE)

SET @iteradorComponentes = 1
SET @numeroRowComponente = 1

WHILE (@iteradorComponentes <= @numeroComponentes)
BEGIN

	-- Inicializamos variables
	SET @sumaMontoActividades = 0
	SET @sumaMontoAnualActividades = 0
	SET @montoAnualProyecto = 0 
	SET @montoComponenteSiguienteMes = 0
	SET @montoActividadSiguienteMes = 0

	SET @componenteId = (SELECT MIRIndicadorId FROM @tblMatrizPresupuestoVigente WHERE NumeroRow = @numeroRowComponente)
	SET @tipoComponenteId = (SELECT TipoComponenteId FROM @tblMatrizPresupuestoVigente WHERE NumeroRow = @numeroRowComponente)

	SET @ultimoMesCapturado = (SELECT COALESCE( CASE WHEN Enero		 IS NULL THEN 0 ELSE NULL END,
												CASE WHEN Febrero	 IS NULL THEN 1 ELSE NULL END, 
												CASE WHEN Marzo		 IS NULL THEN 2 ELSE NULL END, 
												CASE WHEN Abril		 IS NULL THEN 3 ELSE NULL END, 
												CASE WHEN Mayo		 IS NULL THEN 4 ELSE NULL END, 
												CASE WHEN Junio		 IS NULL THEN 5 ELSE NULL END, 
												CASE WHEN Julio		 IS NULL THEN 6 ELSE NULL END, 
												CASE WHEN Agosto     IS NULL THEN 7 ELSE NULL END, 
												CASE WHEN Septiembre IS NULL THEN 8 ELSE NULL END, 
												CASE WHEN Octubre	 IS NULL THEN 9 ELSE NULL END, 
												CASE WHEN Noviembre	 IS NULL THEN 10 ELSE NULL END, 
												CASE WHEN Diciembre	 IS NULL THEN 11 ELSE NULL END )
							   FROM @tblMatrizPresupuestoVigente
							   WHERE MIRIndicadorId = @componenteId)

	 SET @numeroMesesPorAsignar = 12 - @ultimoMesCapturado

	--Si la relacion del componente es COMPONENTE - PROYECTO
    IF(@tipoComponenteId = @TIPO_RELACION_COMPONENTE_PROYECTO)
	BEGIN
		-- Obtenemos el ID del proyecto del Componente
		SET @proyectoId = (SELECT ProyectoId FROM @tblMatrizPresupuestoVigente WHERE NumeroRow = @numeroRowComponente)
		
		-- Calculamos el monto anual para el componente
		SET @montoAnualProyecto = ROUND( (SELECT ISNULL(PresupuestoVigente,0) FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) * (SELECT (PorcentajeProyecto / 100) FROM @tblMatrizPresupuestoVigente WHERE NumeroRow = @numeroRowComponente), 2 )
		
		-- Actualizamos el monto total anual del componente tomando en cuenta ya los ajustes al presupuesto del proyecto
	    UPDATE @tblMatrizPresupuestoVigente SET Anual = @montoAnualProyecto WHERE MIRIndicadorId = @componenteId

		-- Obtenemos cuanto se ha asignado del monto total del proyecto sumando todos los meses guardados
		SET @montoTotalComponenteAsignado = (SELECT MontoTotalAsignado FROM @tblMatrizPresupuestoVigente WHERE NumeroRow = @numeroRowComponente)
		
		-- Obtenemos la suma de los porcentajes de las actividades para saber que porcentaje se va a tomar del total del proyecto del componente
		-- que en teoria esta suma debe ser igual al porcentaje guardado para el componente
		SET @sumaPorcentajeActividades = (SELECT SUM(PorcentajeActividad) FROM @tblMatrizPresupuestoVigente WHERE  MIRIndicadorComponenteId =  @componenteId)

		-- Calculamos el monto del mes del componente con base al monto anual del proyecto y lo ya asignado
		SET @montoComponenteSiguienteMes = ROUND((((@montoAnualProyecto * (@sumaPorcentajeActividades / 100 )) - @montoTotalComponenteAsignado) / @numeroMesesPorAsignar ) , 2)

	    -- Obtenemos todas las actividades relacionadas al componente
		SET @iteradorActividades = 1
		SET @numeroActividades =  (SELECT COUNT(*) FROM @tblMatrizPresupuestoVigente WHERE MIRIndicadorComponenteId = @componenteId)
		SET @numeroRowActividad = (SELECT MIN(NumeroRow) FROM @tblMatrizPresupuestoVigente WHERE MIRIndicadorComponenteId = @componenteId)


		-- Iteramos por cada Actividad encontrada, para calcular el monto del mes de la actividad
		WHILE (@iteradorActividades <= @numeroActividades)
		BEGIN
		    
			--Obtenemos el monto asignado de esta actividad, que seria la suma de todos los meses guardados
			SET @montoTotalActividadAsignado = (SELECT MontoTotalAsignado FROM @tblMatrizPresupuestoVigente WHERE NumeroRow = @numeroRowActividad )

			--Obtenemos el porcentaje de la actividad que aplicara del monto total del componente en el mes que se esta evaluando 
			SET @porcentajeActividad = (SELECT PorcentajeActividad FROM @tblMatrizPresupuestoVigente WHERE NumeroRow = @numeroRowActividad )
			
			-- Calculamos el monto anual de la actividad y el monto del mes que se esta evaluando			
			-- Si es la ultima actividad, el monto de la actividad sera la diferencia del @montoComponenteSiguienteMes menos las sumas de las otras actividades del componente
			IF(@iteradorActividades = @numeroActividades)
			BEGIN

				-- Calculamos el monto anual de la actividad con base al porcentaje configurado
				SET @montoAnualActividad = ROUND(@montoAnualProyecto * (@sumaPorcentajeActividades / 100) - @sumaMontoAnualActividades, 2) --  CASE WHEN @sumaPorcentajeActividades = 100 THEN @montoAnualProyecto - @sumaMontoAnualActividades ELSE ROUND(@montoAnualProyecto * (@porcentajeActividad / 100), 2) END

				-- Calculamos el monto mensual de la actividad ya solo sacando las diferencias para no tener problemas de centavos
				SET @montoActividadSiguienteMes = @montoComponenteSiguienteMes - @sumaMontoActividades                
			END
			ELSE
            BEGIN
				-- Calculamos el monto anual de la actividad con base al porcentaje configurado
				SET @montoAnualActividad = ROUND(@montoAnualProyecto * (@porcentajeActividad / 100), 2)

				-- Calculamos el monto mensual de la actividad con base al porcentaje configurado
				SET @montoActividadSiguienteMes =  ROUND((@montoAnualActividad - @montoTotalActividadAsignado) / @numeroMesesPorAsignar, 2)         
            END
			
			--Actualizamos el monto anual de la actividad
			UPDATE @tblMatrizPresupuestoVigente SET Anual = @montoAnualActividad WHERE NumeroRow = @numeroRowActividad

			IF @ultimoMesCapturado = 0
				UPDATE @tblMatrizPresupuestoVigente SET Enero = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 1
				UPDATE @tblMatrizPresupuestoVigente SET Febrero = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 2
				UPDATE @tblMatrizPresupuestoVigente SET Marzo = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 3
				UPDATE @tblMatrizPresupuestoVigente SET Abril = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 4
				UPDATE @tblMatrizPresupuestoVigente SET Mayo = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 5
				UPDATE @tblMatrizPresupuestoVigente SET Junio = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 6
				UPDATE @tblMatrizPresupuestoVigente SET Julio = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 7
				UPDATE @tblMatrizPresupuestoVigente SET Agosto = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 8
				UPDATE @tblMatrizPresupuestoVigente SET Septiembre = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 9
				UPDATE @tblMatrizPresupuestoVigente SET Octubre = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 10
				UPDATE @tblMatrizPresupuestoVigente SET Noviembre = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 11
				UPDATE @tblMatrizPresupuestoVigente SET Diciembre = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad

			SET @sumaMontoAnualActividades += @montoAnualActividad
			SET @sumaMontoActividades += @montoActividadSiguienteMes
			SET @numeroRowActividad += 1
			SET @iteradorActividades += 1
		END
	END

	--Si la relacion del componente es ACTIVIDAD - PROYECTO
    ELSE IF(@tipoComponenteId = @TIPO_RELACION_ACTIVIDAD_PROYECTO)
	BEGIN
	    --Obtenemos todas las actividades relacionadas al componente
		SET @iteradorActividades = 1
		SET @numeroActividades =  (SELECT COUNT(*) FROM @tblMatrizPresupuestoVigente WHERE MIRIndicadorComponenteId = @componenteId)
		SET @numeroRowActividad = (SELECT MIN(NumeroRow) FROM @tblMatrizPresupuestoVigente WHERE MIRIndicadorComponenteId = @componenteId)
		
		WHILE (@iteradorActividades <= @numeroActividades)
		BEGIN

			SET @proyectoId = (SELECT ProyectoId FROM @tblMatrizPresupuestoVigente WHERE NumeroRow = @numeroRowActividad)

			--Obtenemos el porcentaje de la actividad que aplicara del monto total del componente en el mes que se esta evaluando 
			SET @porcentajeActividad = (SELECT PorcentajeProyecto FROM @tblMatrizPresupuestoVigente WHERE NumeroRow = @numeroRowActividad )		

			-- Obtenemos el monto anual de la actividad
			SET @montoAnualActividad = ROUND( (SELECT ISNULL(PresupuestoVigente,0) FROM @tblMontoProyectos WHERE ProyectoId = @proyectoId) * (@porcentajeActividad / 100) , 2 )

			-- Obtenemos el mono total de la actividad asignado
			SET @montoTotalActividadAsignado = (SELECT MontoTotalAsignado FROM @tblMatrizPresupuestoVigente WHERE NumeroRow = @numeroRowActividad)

			--Actualizamos el monto anual de la actividad
			UPDATE @tblMatrizPresupuestoVigente SET Anual = @montoAnualActividad WHERE NumeroRow = @numeroRowActividad

			SET @montoAnualProyecto += @montoAnualActividad
			
			-- Calculamos el monto mensual de la actividad con base al porcentaje configurado
			SET @montoActividadSiguienteMes = ROUND((@montoAnualActividad - @montoTotalActividadAsignado) / @numeroMesesPorAsignar, 2)    

			IF @ultimoMesCapturado = 0
				UPDATE @tblMatrizPresupuestoVigente SET Enero = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 1
				UPDATE @tblMatrizPresupuestoVigente SET Febrero = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 2
				UPDATE @tblMatrizPresupuestoVigente SET Marzo = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 3
				UPDATE @tblMatrizPresupuestoVigente SET Abril = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 4
				UPDATE @tblMatrizPresupuestoVigente SET Mayo = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 5
				UPDATE @tblMatrizPresupuestoVigente SET Junio = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 6
				UPDATE @tblMatrizPresupuestoVigente SET Julio = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 7
				UPDATE @tblMatrizPresupuestoVigente SET Agosto = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 8
				UPDATE @tblMatrizPresupuestoVigente SET Septiembre = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 9
				UPDATE @tblMatrizPresupuestoVigente SET Octubre = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 10
				UPDATE @tblMatrizPresupuestoVigente SET Noviembre = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad
			ELSE IF @ultimoMesCapturado = 11
				UPDATE @tblMatrizPresupuestoVigente SET Diciembre = @montoActividadSiguienteMes WHERE NumeroRow = @numeroRowActividad			

			-- Si es la ultima actividad, calculamos el monto total anual del componente
			IF(@iteradorActividades = @numeroActividades)
			BEGIN
			    UPDATE @tblMatrizPresupuestoVigente SET Anual = @montoAnualProyecto WHERE NumeroRow = @numeroRowComponente
			END

			SET @sumaMontoActividades += @montoActividadSiguienteMes
			SET @montoComponenteSiguienteMes = @sumaMontoActividades
			SET @numeroRowActividad += 1
			SET @iteradorActividades += 1
		END
	END

	IF @ultimoMesCapturado = 0
		UPDATE @tblMatrizPresupuestoVigente SET Enero = @montoComponenteSiguienteMes WHERE NumeroRow = @numeroRowComponente
	ELSE IF @ultimoMesCapturado = 1
		UPDATE @tblMatrizPresupuestoVigente SET Febrero = @montoComponenteSiguienteMes WHERE NumeroRow = @numeroRowComponente
	ELSE IF @ultimoMesCapturado = 2
		UPDATE @tblMatrizPresupuestoVigente SET Marzo = @montoComponenteSiguienteMes WHERE NumeroRow = @numeroRowComponente
	ELSE IF @ultimoMesCapturado = 3
		UPDATE @tblMatrizPresupuestoVigente SET Abril = @montoComponenteSiguienteMes WHERE NumeroRow = @numeroRowComponente
	ELSE IF @ultimoMesCapturado = 4
		UPDATE @tblMatrizPresupuestoVigente SET Mayo = @montoComponenteSiguienteMes WHERE NumeroRow = @numeroRowComponente
	ELSE IF @ultimoMesCapturado = 5
		UPDATE @tblMatrizPresupuestoVigente SET Junio = @montoComponenteSiguienteMes WHERE NumeroRow = @numeroRowComponente
	ELSE IF @ultimoMesCapturado = 6
		UPDATE @tblMatrizPresupuestoVigente SET Julio = @montoComponenteSiguienteMes WHERE NumeroRow = @numeroRowComponente
	ELSE IF @ultimoMesCapturado = 7
		UPDATE @tblMatrizPresupuestoVigente SET Agosto = @montoComponenteSiguienteMes WHERE NumeroRow = @numeroRowComponente
	ELSE IF @ultimoMesCapturado = 8
		UPDATE @tblMatrizPresupuestoVigente SET Septiembre = @montoComponenteSiguienteMes WHERE NumeroRow = @numeroRowComponente
	ELSE IF @ultimoMesCapturado = 9
		UPDATE @tblMatrizPresupuestoVigente SET Octubre = @montoComponenteSiguienteMes WHERE NumeroRow = @numeroRowComponente
	ELSE IF @ultimoMesCapturado = 10
		UPDATE @tblMatrizPresupuestoVigente SET Noviembre = @montoComponenteSiguienteMes WHERE NumeroRow = @numeroRowComponente
	ELSE IF @ultimoMesCapturado = 11
		UPDATE @tblMatrizPresupuestoVigente SET Diciembre = @montoComponenteSiguienteMes WHERE NumeroRow = @numeroRowComponente

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
	   ISNULL(Enero, 0) + ISNULL(Febrero, 0) + ISNULL(Marzo, 0) + ISNULL(Abril, 0) + ISNULL(Mayo, 0)+ ISNULL(Junio, 0) +
	   ISNULL(Julio, 0) + ISNULL(Agosto, 0) + ISNULL(Septiembre, 0) + ISNULL(Octubre, 0) + ISNULL(Noviembre, 0) + ISNULL(Diciembre, 0) AS Asignado, 
       Anual,
	   ISNULL(PorcentajeProyecto, PorcentajeActividad) AS Porcentaje
FROM @tblMatrizPresupuestoVigente 
--WHERE NivelIndicadorId <> @NIVEL_INDICADOR_COMPONENTE
ORDER BY NumeroRow
END
