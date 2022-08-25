SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[spConsultaMatrizIndicadorResultado]
	@mirId INT
AS
/* ****************************************************************
 * spConsultaMatrizIndicadorResultado
 * ****************************************************************
 * Descripción: Buscamos el objeto de Matriz Indicador Resultado por el ID.
 * Autor: Rene Carrillo
 * Fecha: 08.06.2021
 * Versión: 1.0.0
 *****************************************************************
 * PARAMETROS DE ENTRADA: MIRId
 * PARAMETROS DE SALIDA: MIRId, Codigo, ProgramaPresupuestario
 *****************************************************************
*/ 
SELECT
	mir.MIRId, 
	mir.Codigo, 
	pg.Nombre AS ProgramaPresupuestario
FROM
	dbo.MItblMatrizIndicadorResultado AS mir 
	INNER JOIN SACG0000001.dbo.tblProgramaGobierno AS pg ON mir.ProgramaPresupuestarioId = pg.ProgramaGobiernoId
WHERE 
	mir.MIRId = @mirId AND mir.EstatusId = 1