SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[ARspActualizaEstatusRequisicionMaterialSurtimiento]
	@requisicionId INT
AS
/* ****************************************************************
 * ARspActualizaEstatusRequisicionMaterialSurtimiento
 * ****************************************************************
 * Descripción: Procedimiento para actualizar el Estatus de una Requisición
						 de Material y sus detalles 
 *
 * autor: 	Javier Elías
 * Fecha: 	24.06.2021
 * Versión: 1.0.0
 *****************************************************************
 * PARAMETROS DE ENTRADA: RequisicionId
 * PARAMETROS DE SALIDA:
 *****************************************************************
*/ 
UPDATE detalle SET EstatusId =
       CASE Cantidad - ISNULL(CantidadMovimiento, 0) WHEN 0 THEN 28 -- Completa
       WHEN Cantidad THEN 26 -- Pendiente por surtir
       ELSE 27 -- SurtidoParcial
       END,
	   FechaUltimaModificacion = GETDATE()
FROM ARtblRequisicionMaterialDetalle AS detalle
     LEFT JOIN
	 (
		SELECT ReferenciaMovtoId,
			   SUM(CantidadMovimiento) AS CantidadMovimiento
		FROM ARtblInventarioMovimiento
		WHERE TipoMovimientoId = 63 -- Requisición Material Surtimiento
		GROUP BY ReferenciaMovtoId
	 ) AS movimientos ON detalle.RequisicionMaterialDetalleId = movimientos.ReferenciaMovtoId
WHERE RequisicionMaterialId = @requisicionId
		AND detalle.EstatusId IN(26, 27) -- Pendiente por surtir, Surtido parcial

UPDATE requisicion SET EstatusId = 
       CASE WHEN detalles.Contador - ISNULL(completos.Contador, 0) = 0 THEN 28 -- Completa
       ELSE EstatusId END,
	   FechaUltimaModificacion = GETDATE()
FROM ARtblRequisicionMaterial AS requisicion
     INNER JOIN
	 (
		SELECT RequisicionMaterialId,
				COUNT(RequisicionMaterialDetalleId) AS Contador
		FROM ARtblRequisicionMaterialDetalle		
		WHERE EstatusId NOT IN(31, 24) -- Borrada, Rechazada
		GROUP BY RequisicionMaterialId
	 ) AS detalles ON requisicion.RequisicionMaterialId = detalles.RequisicionMaterialId
	 LEFT JOIN 
	 (
		SELECT RequisicionMaterialId,
				COUNT(RequisicionMaterialDetalleId) AS Contador
		FROM ARtblRequisicionMaterialDetalle		
		WHERE EstatusId = 28 -- Completa
		GROUP BY RequisicionMaterialId
	 ) AS completos ON requisicion.RequisicionMaterialId = completos.RequisicionMaterialId
WHERE requisicion.RequisicionMaterialId = @requisicionId