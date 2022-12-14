SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spConsultaPlanNacionalDesarrolloEstructuras]
	@planNacionalDesarrolloId INT
AS
/* ****************************************************************
 * spConsultaPlanNacionalDesarrolloEstructuras
 * ****************************************************************
 * Descripción: Procedimiento para Obtener los registros que se van a
 *						 agregar a los detalles de la Ficha Plan Nacional de Desarrollo.
 *
 * autor: 	Javier Elías
 * Fecha: 	17.03.2021
 * Versión: 1.0.0
 *****************************************************************
 * PARAMETROS DE ENTRADA: PlanNacionalDesarrolloId
 * PARAMETROS DE SALIDA:   
 *****************************************************************
*/ 
SELECT *
FROM
(
    SELECT ControlId - 40 AS PlanNacionalDesarrolloEstructuraId,
           @planNacionalDesarrolloId AS PlanNacionalDesarrolloId,
           ControlId AS NivelGobiernoId,
           0 AS EstructuraPadreId,
           Valor AS Nombre,
           '' AS Etiqueta,
           CAST(ROW_NUMBER() OVER(ORDER BY ControlId) AS INT) AS Orden,
		   1 AS EstatusId, --1 Activo
		   0 AS CreadoPorId,
		   GETDATE() AS FechaCreacion,
		   NULL AS FechaUltimaModificacion,
		   NULL AS ModificadoPorId,
		   NULL AS Timestamp
    FROM tblControlMaestro
    WHERE Control = 'NivelGobierno'
          AND Activo = 1
    
	UNION ALL
    
	SELECT PlanNacionalDesarrolloEstructuraId,
		   PlanNacionalDesarrolloId,
		   NivelGobiernoId,
		   ISNULL(EstructuraPadreId, NivelGobiernoId - 40) AS EstructuraPadreId,
		   Nombre,
		   Etiqueta,
		   Orden,
		   EstatusId,
		   CreadoPorId,
		   FechaCreacion,
		   FechaUltimaModificacion,
		   ModificadoPorId,
		   Timestamp
	FROM tblPlanNacionalDesarrolloEstructura AS estructura
	WHERE PlanNacionalDesarrolloId = @planNacionalDesarrolloId
		  AND EstatusId = 1 --Estatus Activo
) AS todo
ORDER BY EstructuraPadreId,
         PlanNacionalDesarrolloEstructuraId
		 --Orden