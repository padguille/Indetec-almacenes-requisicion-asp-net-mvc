SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Angel Hernández
-- Updated by: César Hdez
-- Created: 16/05/2019
-- Updated: 23/03/2020
-- Description:	Funcion que Retorna la ruta donde se debe guardar un archivo
-- Nota: El orden de los elementos del parámetro @ids debe ser de las hojas
--			a la raiz, es decir, si la ruta es
--			/ASPIRANTES/<agrupador_aspirante>/<id_convocatoria>/<id_actividad>,
--			el parámetro @ids quedaráa de la siguiente forma:
--			dbo.fn_getRutaArchivo(2,'[<id_actividad>,<id_convocatoria>,<id_aspirante>]')
-- Example: SELECT dbo.fn_getRutaArchivo(2,'[23,10,3042]')
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[GRfnGetRutaArchivo](@origen int, @ids nvarchar(max))
RETURNS NVARCHAR(MAX)
AS
BEGIN

	DECLARE @referenciaId int;
	DECLARE @esNombreCalculado bit;
	DECLARE @tipoCalculo int;
	DECLARE @nombreCarpeta nvarchar(50);

	DECLARE @idActual int;
	DECLARE @elementosPorAgrupador int;

	DECLARE @rutaCalculada nvarchar(MAX) = '';

	DECLARE @tablaTMP table (ID INT IDENTITY(1,1) , VALOR nvarchar(MAX), PRIMARY KEY (ID));

	WITH MenuPrincipalCTE (ORDEN,JSON_INDEX, AEC_EstructuraId, AEC_NombreCarpeta, AEC_AEC_EstructuraReferenciaId,VALOR)
		AS
		(
			SELECT
				0 as ORDEN,
				CASE
					WHEN NombreCalculado = 1 THEN
						1
					ELSE
						0
				END AS JSON_INDEX,
				EstructuraCarpetaId,
				NombreCarpeta,
				EstructuraReferenciaId,
				CASE
					WHEN NombreCalculado = 1 THEN
						COALESCE(NombreCarpeta,'') + dbo.GRfnGetCodigoFormateadoAutonumerico(dbo.GRfnConvertToBase(CAST((JSON_VALUE(@ids,CONCAT('$[',0,']'))) AS bigint),32))
					ELSE
						COALESCE(NombreCarpeta,'')
				END AS VALOR
			FROM GRtblArchivoEstructuraCarpeta
			WHERE OrigenArchivoId = @origen
			
			UNION ALL
			
			SELECT
				MenuPrincipalCTE.ORDEN + 1 AS ORDEN,
				CASE
					WHEN tbl.NombreCalculado = 1 THEN
						MenuPrincipalCTE.JSON_INDEX + 1
					ELSE
						MenuPrincipalCTE.JSON_INDEX
				END AS JSON_INDEX,
				tbl.EstructuraCarpetaId,
				tbl.NombreCarpeta,
				tbl.EstructuraReferenciaId,
				CASE
					WHEN tbl.NombreCalculado = 1 THEN
						COALESCE(tbl.NombreCarpeta,'') + dbo.GRfnGetCodigoFormateadoAutonumerico(dbo.GRfnConvertToBase(CAST((JSON_VALUE(@ids,CONCAT('$[',MenuPrincipalCTE.JSON_INDEX,']'))) AS bigint),32))
					ELSE
						COALESCE(tbl.NombreCarpeta,'')
				END AS VALOR
			FROM GRtblArchivoEstructuraCarpeta AS tbl
			INNER JOIN MenuPrincipalCTE ON tbl.EstructuraCarpetaId = MenuPrincipalCTE.AEC_AEC_EstructuraReferenciaId
		)	
		
		--select @rutaCalculada = (STRING_AGG(VALOR,'/') WITHIN GROUP (ORDER BY ORDEN DESC)) from MenuPrincipalCTE
		INSERT @tablaTMP
		select VALOR from MenuPrincipalCTE ORDER BY ORDEN DESC

		select @rutaCalculada = STRING_AGG(COALESCE(VALOR,''),'/') from @tablaTMP

	RETURN @rutaCalculada;

END