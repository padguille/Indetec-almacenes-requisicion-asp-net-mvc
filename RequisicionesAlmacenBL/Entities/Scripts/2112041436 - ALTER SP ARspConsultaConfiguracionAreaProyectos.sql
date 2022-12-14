SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[ARspConsultaConfiguracionAreaProyectos]
	@configuracionAreaId INT
AS
-- ==============================================================
-- Author:		Javier Elías
-- Create date: 12/05/2021
-- Modified date: 04/12/2021
-- Description:	Procedimiento para Obtener los registros que se van a
--						agregar a los detalles de la Ficha Configuración de Áreas.
-- ==============================================================
SELECT * 
FROM (
	SELECT DISTINCT
		   dependencia.DependenciaId + 1000000 AS idPd,
		   0 AS PadreId,
		   dependencia.DependenciaId + 0 AS DependenciaId,
		   0 AS ProyectoId,
		   dependencia.DependenciaId + ' - ' + dependencia.Nombre AS Nombre,
		   CONVERT(BIT, 0) AS Seleccionado
	FROM tblDependencia AS dependencia
		 INNER JOIN tblProyecto_Dependencia AS dependenciaProyecto ON dependencia.DependenciaId = dependenciaProyecto.DependenciaId

	UNION ALL

	SELECT idPd,
		   DependenciaId + 1000000 AS PadreId,
		   DependenciaId + 0 AS DependenciaId,
		   proyecto.ProyectoId AS ProyectoId,
		   proyecto.ProyectoId + ' - ' + proyecto.Nombre AS Nombre,
		   CONVERT(BIT, CASE WHEN detallesConfiguracion.ConfiguracionAreaProyectoId IS NULL THEN 0 ELSE 1 END) AS Seleccionado
	FROM tblProyecto_Dependencia AS proyectoDependencia
		 INNER JOIN tblProyecto AS proyecto ON proyectoDependencia.ProyectoId = proyecto.ProyectoId
		 LEFT JOIN ARtblControlMaestroConfiguracionAreaProyecto AS detallesConfiguracion ON proyectoDependencia.idPD = detallesConfiguracion.ProyectoDependenciaId AND detallesConfiguracion.ConfiguracionAreaId = @configuracionAreaId AND detallesConfiguracion.Borrado = 0
) AS todo
ORDER BY Nombre