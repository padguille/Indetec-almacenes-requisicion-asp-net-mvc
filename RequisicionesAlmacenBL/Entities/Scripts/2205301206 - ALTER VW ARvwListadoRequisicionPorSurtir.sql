SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER VIEW [dbo].[ARvwListadoRequisicionPorSurtir]
AS
-- =======================================================================
-- Author:		Javier El�as
-- Create date: 22/06/2021
-- Modified date: 27/05/2022
-- Description:	View para obtener el Listado de Requisiciones Pendientes por Autorizar
-- =======================================================================
SELECT requisicion.RequisicionMaterialId,
       CodigoRequisicion,
       dbo.GRfnGetFechaConFormato(FechaRequisicion, 0) AS Fecha,
       dbo.RHfnGetNombreCompletoEmpleado(empleado.EmpleadoId) AS CreadoPor,
       area.DependenciaId + ' - ' + area.Nombre AS Area,
       Total AS Monto,
       requisicion.EstatusId,
       estatus.Valor AS Estatus
FROM ARtblRequisicionMaterial AS requisicion   
     INNER JOIN GRtblUsuario AS usuario ON requisicion.CreadoPorId = UsuarioId
	 INNER JOIN RHtblEmpleado AS empleado ON usuario.EmpleadoId = empleado.EmpleadoId
     INNER JOIN tblDependencia AS area ON AreaId = DependenciaId
	 INNER JOIN GRtblControlMaestro AS estatus ON requisicion.EstatusId = ControlId
     INNER JOIN
	 (
		SELECT RequisicionMaterialId,
				SUM(TotalPartida) AS Total
		FROM ARtblRequisicionMaterialDetalle
		WHERE EstatusId IN (88, 84, 90, 83, 80) -- Revisi�n, Por surtir, Surtido parcial, Por Comprar, En almac�n
		GROUP BY RequisicionMaterialId
	 ) AS detalles ON requisicion.RequisicionMaterialId = detalles.RequisicionMaterialId
WHERE requisicion.EstatusId IN (64, 68, 67) -- Autorizada, En Proceso, En almac�n
GO