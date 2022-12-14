SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* ****************************************************************
 * MIspRptLibroConsultaPlanDesarrolloEstructura
 * ****************************************************************
 * Descripción: Consulta para obtener los datos de Plan Desarrollo Estructura para el reporte.
 * Autor: Rene Carrillo
 * Fecha: 19.08.2021
 * Versión: 1.0.0
 *****************************************************************
 * PARAMETROS DE ENTRADA: PlanDesarrolloId
 * PARAMETROS DE SALIDA: *
 *****************************************************************
*/

ALTER   PROCEDURE [dbo].[MIspRptLibroConsultaPlanDesarrolloEstructura]
	@PlanDesarrolloEstructuraId INT
AS


	WITH CTEEstructuraPlanDesarrollo(PlanDesarolloEstructuraId, EstructuraPadreId, Etiqueta, Nombre, Orden) AS   
	(  
		SELECT PlanDesarrolloEstructuraId, 
		       EstructuraPadreId, 
			   Etiqueta, 
			   Nombre,
			   0 AS Orden 
		FROM MItblPlanDesarrolloEstructura pde 
		WHERE pde.PlanDesarrolloEstructuraId = @PlanDesarrolloEstructuraId
		
		UNION ALL  
		
		SELECT pde.PlanDesarrolloEstructuraId, 
		       pde.EstructuraPadreId, 
			   pde.Etiqueta, 
			   pde.Nombre,
			   cte.Orden + 1
		FROM MItblPlanDesarrolloEstructura pde 
		INNER JOIN CTEEstructuraPlanDesarrollo cte ON pde.PlanDesarrolloEstructuraId = cte.EstructuraPadreId
		
	)  

	SELECT CONCAT(Etiqueta, ': ', Nombre) AS NombreNivel, Orden
	FROM CTEEstructuraPlanDesarrollo
	ORDER BY Orden DESC

