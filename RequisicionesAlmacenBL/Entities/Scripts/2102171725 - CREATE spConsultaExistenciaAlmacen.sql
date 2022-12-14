DROP PROCEDURE IF EXISTS spConsultaExistenciaAlmacen
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultaExistenciaAlmacen]
	@almacenId AS VARCHAR(4),
	@productosIds AS VARCHAR(MAX)
AS
/* ************************************************************
 * spConsultaExistenciaAlmacen
 * ************************************************************ 
 * Descripción: Procedimiento para Obtener los registros que se van a
 *						 agregar a los detalles de la Ficha Inventario Físico.
 *
 * autor: 	Javier Elías
 * Fecha: 	05.02.2021
 * Versión: 1.0.0
 **************************************************************
 * PARAMETROS DE ENTRADA: AlmacenId, ProductosIds
 * PARAMETROS DE SALIDA:   
 **************************************************************
*/ 
SELECT 0 AS InventarioFisicoDetalleId,
       AlmacenProductoId,
	   producto.ProductoId,
	   producto.ProductoId + ' - ' + producto.Descripcion AS Producto,
	   um.UnidadDeMedidaId,
	   um.Descripcion AS UnidadDeMedida,
	   CostoPromedio,
	   CuentaPresupuestalId,
	   proyecto.ProyectoId AS ProyectoId,
	   proyecto.ProyectoId + ' - ' + proyecto.Nombre AS Proyecto,
	   ramo.RamoId AS FuenteFinanciamientoId,
	   ramo.RamoId + ' - ' + ramo.Nombre AS FuenteFinanciamiento,
	   dependencia.DependenciaId AS UnidadAdministrativaId,
	   dependencia.Nombre + ' - ' + dependencia.Nombre AS UnidadAdministrativa,
	   gasto.TipoGastoId AS TipoGastoId,
       gasto.TipoGastoId + ' - ' + gasto.Nombre AS TipoGasto,
	   Cantidad AS Existencia,
       NULL AS Conteo,
	   '' AS MotivoAjuste
FROM tblProducto AS producto
     INNER JOIN tblUnidadDeMedida AS um ON producto.UnidadDeMedidaId = um.UnidadDeMedidaId
	 INNER JOIN RequisicionesAlmacenDatos.dbo.tblAlmacenProducto AS almacen ON producto.ProductoId = almacen.ProductoId AND AlmacenId = @almacenId AND Borrado = 0
	 INNER JOIN tblCuentaPresupuestalEgr AS cuenta ON almacen.CuentaPresupuestalId = cuenta.CuentaPresupuestalEgrId
	 INNER JOIN tblProyecto AS proyecto ON cuenta.ProyectoId = proyecto.ProyectoId
	 INNER JOIN tblRamo AS ramo ON cuenta.RamoId = ramo.RamoId
	 INNER JOIN tblDependencia AS dependencia ON cuenta.DependenciaId = dependencia.DependenciaId
	 INNER JOIN tblTipoGasto AS gasto ON cuenta.TipoGastoId = gasto.TipoGastoId
WHERE Status = 'A'
	  AND producto.ProductoId IN (SELECT * FROM fnSplitString(@productosIds, ','))
ORDER BY ProyectoId,
         FuenteFinanciamientoId,
		 UnidadAdministrativaId,
		 TipoGastoId,
		 ProductoId,
		 CuentaPresupuestalId