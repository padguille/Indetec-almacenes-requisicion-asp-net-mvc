SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[ARspConsultaInvitacionArticulosPorConvertir]
AS
-- ============================================================
-- Author:		Javier Elías
-- Create date: 27/10/2021
-- Modified date: 23/08/2022
-- Description:	Procedimiento para Obtener las Invitaciones y los Artículos
--						que se van a convertir en una Invitación de Compra.
-- ============================================================
SELECT CONVERT(INT, -1 * ROW_NUMBER() OVER(ORDER BY invitacion.InvitacionArticuloId, detalle.InvitacionArticuloDetalleId)) AS InvitacionCompraDetalleId,
       -1 * CONVERT(INT, CONVERT(VARCHAR(10), invitacion.ProveedorId) + invitacion.AlmacenId + CONVERT(VARCHAR(10), invitacion.TipoCompraId)) AS InvitacionCompraId,
	   invitacion.InvitacionArticuloId,
	   InvitacionArticuloDetalleId,

	   requisicion.CodigoRequisicion AS Requisicion,
	   dbo.GRfnGetFechaConFormato(requisicion.FechaRequisicion, 0) AS FechaRegistro,

	   proveedor.ProveedorId,
	   proveedor.RazonSocial AS Proveedor,
	   almacen.AlmacenId,
	   almacen.Nombre AS Almacen,
	   invitacion.TipoCompraId AS TipoCompraId,
	   tipoCompra.Valor AS TipoCompra,
       
       TarifaImpuestoId,
       detalle.ProductoId,
       detalle.Descripcion,
	   detalle.ProductoId + ' - ' + detalle.Descripcion AS Producto,
	   CuentaPresupuestalEgrId,
       detalle.Cantidad,
       Costo,
       Importe,
       IEPS,
       Ajuste,
       IVA,
       ISH,
       RetencionISR,
       RetencionCedular,
       RetencionIVA,
       TotalPresupuesto,
       Total,

	   invitacion.Timestamp AS InvitacionTimestamp,
	   detalle.Timestamp AS DetalleTimestamp,
	   CONVERT(BIT, 0) AS Seleccionado
FROM ARtblInvitacionArticulo AS invitacion
     INNER JOIN ARtblInvitacionArticuloDetalle AS detalle ON invitacion.InvitacionArticuloId = detalle.InvitacionArticuloId AND detalle.EstatusId = 101	-- Por Invitar
	 INNER JOIN ARtblRequisicionMaterialDetalle AS requisicionDetalle ON detalle.RequisicionMaterialDetalleId = requisicionDetalle.RequisicionMaterialDetalleId
	 INNER JOIN ARtblRequisicionMaterial AS requisicion ON requisicionDetalle.RequisicionMaterialId = requisicion.RequisicionMaterialId
	 INNER JOIN tblProveedor AS proveedor ON invitacion.ProveedorId = proveedor.ProveedorId	
	 INNER JOIN tblAlmacen AS almacen ON invitacion.AlmacenId = almacen.AlmacenId
	 INNER JOIN GRtblControlMaestro AS tipoCompra ON invitacion.TipoCompraId = tipoCompra.ControlId
WHERE invitacion.EstatusId = 99 -- Activa
ORDER BY invitacion.InvitacionArticuloId,
         detalle.InvitacionArticuloDetalleId
