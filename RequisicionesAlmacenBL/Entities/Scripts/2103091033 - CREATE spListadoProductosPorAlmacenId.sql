DROP PROCEDURE IF EXISTS spListadoProductosPorAlmacenId
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListadoProductosPorAlmacenId]
	@almacenId VARCHAR(4)
AS
/* ************************************************************
 * spConsultaInventarioAjusteDetalles
 * ************************************************************ 
 * Descripción: Procedimiento para Obtener los registros que se van a
 *						 mostrar en el combo de productos de la Ficha Inventario Ajuste.
 *
 * autor: 	Javier Elías
 * Fecha: 	01.03.2021
 * Versión: 1.0.0
 **************************************************************
 * PARAMETROS DE ENTRADA: AlmacenId
 * PARAMETROS DE SALIDA:   
 **************************************************************
*/ 
SELECT AlmacenProductoId,
       fuenteFinanciamiento.RamoId AS FuenteFinanciamientoId,
	   fuenteFinanciamiento.RamoId + ' - ' + fuenteFinanciamiento.Nombre AS FuenteFinanciamiento,
       proyecto.ProyectoId,
       proyecto.ProyectoId + ' - ' + proyecto.Nombre AS Proyecto,
       unidadAdministrativa.DependenciaId AS UnidadAdministrativaId,
       unidadAdministrativa.DependenciaId + ' - ' + UnidadAdministrativa.Nombre AS UnidadAdministrativa,
	   tipoGasto.TipoGastoId,
       tipoGasto.TipoGastoId + ' - ' + tipoGasto.Nombre AS TipoGasto,
       producto.ProductoId,
       producto.ProductoId + ' - ' + producto.Descripcion AS Producto,
       um.UnidadDeMedidaId,
       um.Descripcion AS UnidadDeMedida,
       CuentaPresupuestalId,
       CostoPromedio,
       Cantidad AS ExistenciaActual
FROM tblProducto AS producto
     INNER JOIN RequisicionesAlmacenDatos.dbo.tblAlmacenProducto AS almacen ON producto.ProductoId = almacen.ProductoId AND AlmacenId = @almacenId
     INNER JOIN tblCuentaPresupuestalEgr AS cuenta ON almacen.CuentaPresupuestalId = cuenta.CuentaPresupuestalEgrId
     INNER JOIN tblRamo AS fuenteFinanciamiento ON cuenta.RamoId = fuenteFinanciamiento.RamoId
     INNER JOIN tblProyecto AS proyecto ON cuenta.ProyectoId = proyecto.ProyectoId
     INNER JOIN tblDependencia AS unidadAdministrativa ON cuenta.DependenciaId = unidadAdministrativa.DependenciaId
     INNER JOIN tblTipoGasto AS tipoGasto ON cuenta.TipoGastoId = tipoGasto.TipoGastoId
     INNER JOIN tblUnidadDeMedida AS um ON producto.UnidadDeMedidaId = um.UnidadDeMedidaId
ORDER BY producto.ProductoId