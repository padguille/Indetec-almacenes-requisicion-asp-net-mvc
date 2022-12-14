DROP PROCEDURE IF EXISTS spConsultaInventarioFisicoDetalles
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultaInventarioFisicoDetalles]
	@inventarioFisicoId INT
AS
/* ************************************************************
 * spConsultaExistenciaAlmacen
 * ************************************************************ 
 * Descripción: Procedimiento para Obtener los registros que se van a
 *						 agregar a los detalles de la Ficha Inventario Físico.
 *
 * autor: 	Javier Elías
 * Fecha: 	09.02.2021
 * Versión: 1.0.0
 **************************************************************
 * PARAMETROS DE ENTRADA: InventarioFisicoId
 * PARAMETROS DE SALIDA:   
 **************************************************************
*/ 
SELECT detalle.InventarioFisicoDetalleId,
       detalle.AlmacenProductoId,
	   detalle.ProductoId,
       Producto,
	   UnidadDeMedidaId,
	   UnidadDeMedida,
       CostoPromedio,
       CuentaPresupuestalId,
       ProyectoId,
       Proyecto,
       FuenteFinanciamientoId,
       FuenteFinanciamiento,
       UnidadAdministrativaId,
       UnidadAdministrativa,
       TipoGastoId,
       TipoGasto,
       Existencia,
       Conteo,
	   Conteo - Existencia AS CantidadAjuste,
	   (Conteo - Existencia) * CostoPromedio AS CostoMovimiento,
       MotivoAjuste
FROM tblInventarioFisico AS inventario
     INNER JOIN tblInventarioFisicoDetalle AS detalle ON inventario.InventarioFisicoId = detalle.InventarioFisicoId AND detalle.Borrado = 0
     INNER JOIN tblAlmacenProducto AS almacen ON detalle.AlmacenProductoId = almacen.AlmacenProductoId
WHERE inventario.EstatusId != 34 -- Estatus En Proceso o Terminado
      AND inventario.InventarioFisicoId = @inventarioFisicoId
ORDER BY ProyectoId,
        FuenteFinanciamientoId,
        UnidadAdministrativaId,
        TipoGastoId,
        ProductoId,
        CuentaPresupuestalId