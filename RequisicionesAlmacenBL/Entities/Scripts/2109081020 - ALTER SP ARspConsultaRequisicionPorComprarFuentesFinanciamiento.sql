SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[ARspConsultaRequisicionPorComprarFuentesFinanciamiento]
AS
-- =======================================================================
-- Author:		Javier Elías
-- Create date: 29/07/2021
-- Modified date: 08/09/2021
-- Description:	Procedimiento para Obtener las Fuentes de Financiamiento
--						para una Requisición Pendiente por Comprar.
-- =======================================================================
SELECT DISTINCT
	   CuentaPresupuestalEgrId,
	   detalle.ProductoId,
       detalle.AlmacenId,
       detalle.UnidadAdministrativaId,
	   detalle.ProyectoId,       
       detalle.TipoGastoId,
       ff.RamoId,
       ff.Nombre
FROM ARtblRequisicionMaterialDetalle AS detalle
     INNER JOIN ARtblAlmacenProducto AS ap ON detalle.ProductoId = ap.ProductoId
                                              AND detalle.AlmacenId = ap.AlmacenId
                                              AND ap.Borrado = 0
     INNER JOIN tblCuentaPresupuestalEgr AS cp ON ap.CuentaPresupuestalId = cp.CuentaPresupuestalEgrId
                                                  AND detalle.UnidadAdministrativaId = cp.DependenciaId
												  AND detalle.ProyectoId = cp.ProyectoId                                                  
                                                  AND detalle.TipoGastoId = cp.TipoGastoId
     INNER JOIN tblRamo AS ff ON cp.RamoId = ff.RamoId
WHERE detalle.EstatusId IN (84, 90, 83) -- Por surtir, Surtido parcial, Por Comprar
ORDER BY detalle.ProductoId,
         detalle.AlmacenId,
         detalle.UnidadAdministrativaId,
		 detalle.ProyectoId,         
         detalle.TipoGastoId,
         ff.RamoId