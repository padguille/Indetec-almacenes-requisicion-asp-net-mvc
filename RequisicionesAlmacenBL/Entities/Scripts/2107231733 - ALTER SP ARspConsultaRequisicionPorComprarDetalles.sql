SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[ARspConsultaRequisicionPorComprarDetalles]
AS
/* ****************************************************************
 * ARspConsultaRequisicionPorComprarDetalles
 * ****************************************************************
 * Descripción: Procedimiento para Obtener los detalles de una Requisición
 *						 Pendiente por Comprar de la Ficha Requisición Material.
 *
 * autor: 	Javier Elías
 * Fecha: 	01.07.2021
 * Versión: 1.0.0
 *****************************************************************
 * PARAMETROS DE ENTRADA:
 * PARAMETROS DE SALIDA:
 *****************************************************************
*/ 
SELECT RequisicionMaterialDetalleId,
       CodigoRequisicion AS Solicitud,
       dbo.GRfnGetFechaConFormato(FechaRequisicion, 0) AS Fecha,
       dbo.RHfnGetNombreCompletoEmpleado(usuario.EmpleadoId) AS Usuario,	   
       area.Nombre AS Area,
	   almacen.AlmacenId,
       almacen.Nombre AS Almacen,
	   unidadAdministrativa.DependenciaId AS UnidadAdministrativaId,
       unidadAdministrativa.Nombre AS UnidadAdministrativa,
	   proyecto.ProyectoId,
       proyecto.Nombre AS Proyecto,
	   tipoGasto.TipoGastoId,
       tipoGasto.Nombre AS TipoGasto,
	   producto.ProductoId,
	   producto.ProductoId + ' - ' + detalle.Descripcion AS Producto,
	   um.Descripcion AS UM,
	   CostoUnitario,
	   impuesto.Nombre AS Impuesto,
	   impuesto.Porcentaje AS ImpuestoPorcentaje,
	   Cantidad AS CantidadSolicitada,
	   ISNULL(Surtida, 0) AS CantidadSurtida,
	   existencia.Existencia,
	   CONVERT(DECIMAL(28, 10), 0) AS ExistenciaMinima,  --- ESTO SE TIENE QUE CAMBIAR
	   CONVERT(DECIMAL(28, 10), NULL) AS CantidadComprar,
	   CONVERT(DECIMAL(28, 10), NULL) AS Total,
	   Comentarios,
	   CONVERT(VARCHAR (6), NULL) AS FuenteFinanciamientoId,
	   CONVERT(INT, NULL) AS ProveedorId,
	   detalle.EstatusId,
	   estatus.Valor AS Estatus,	  
	   CONVERT(BIT, 0) AS Revision,
	   CONVERT(BIT, 0) AS Comprar,
	   CONVERT(BIT, 0) AS Rechazar,
	   CONVERT(VARCHAR(2000), NULL) AS Motivo
FROM ARtblRequisicionMaterial AS requisicion
     INNER JOIN ARtblRequisicionMaterialDetalle AS detalle ON requisicion.RequisicionMaterialId = detalle.RequisicionMaterialId AND detalle.EstatusId IN (27, 62) -- Surtido parcial, Por Comprar
	 INNER JOIN tblProducto AS producto ON detalle.ProductoId = producto.ProductoId
	 INNER JOIN tblTarifaImpuesto AS impuesto ON producto.TarifaImpuestoId = impuesto.TarifaImpuestoId
     INNER JOIN GRtblUsuario AS usuario ON requisicion.CreadoPorId = UsuarioId
	 INNER JOIN tblAlmacen AS almacen ON detalle.AlmacenId  = almacen.AlmacenId
     INNER JOIN tblDependencia AS area ON requisicion.AreaId = area.DependenciaId
     INNER JOIN tblDependencia AS unidadAdministrativa ON detalle.UnidadAdministrativaId = unidadAdministrativa.DependenciaId
     INNER JOIN tblProyecto AS proyecto ON detalle.ProyectoId = proyecto.ProyectoId
     INNER JOIN tblTipoGasto AS tipoGasto ON detalle.TipoGastoId = tipoGasto.TipoGastoId
	 INNER JOIN tblUnidadDeMedida AS um ON detalle.UnidadMedidaId = um.UnidadDeMedidaId
	 INNER JOIN GRtblControlMaestro AS estatus ON detalle.EstatusId = estatus.ControlId
	 OUTER APPLY 
	 (
		SELECT SUM(CantidadMovimiento) AS Surtida
		FROM ARtblInventarioMovimiento
		WHERE TipoMovimientoId = 63 -- Requisición Material Surtimiento
				AND ReferenciaMovtoId = detalle.RequisicionMaterialDetalleId
	 ) AS surtimiento
	 CROSS APPLY 
	 (
			SELECT SUM(Cantidad) AS Existencia
			FROM ARtblAlmacenProducto AS almacenProducto
				 INNER JOIN tblCuentaPresupuestalEgr AS cuentaPresupuestal ON almacenProducto.CuentaPresupuestalId = cuentaPresupuestal.CuentaPresupuestalEgrId
			WHERE almacenProducto.AlmacenId = detalle.AlmacenId
				  AND almacenProducto.ProductoId = detalle.ProductoId
				  AND cuentaPresupuestal.DependenciaId = detalle.UnidadAdministrativaId
				  AND cuentaPresupuestal.ProyectoId = detalle.ProyectoId
				  AND cuentaPresupuestal.TipoGastoId = detalle.TipoGastoId
				  AND almacenProducto.Borrado = 0
	  ) AS existencia
WHERE requisicion.EstatusId IN (27, 30, 61, 62) -- Surtido parcial, Activa, Autorizada, Por Comprar