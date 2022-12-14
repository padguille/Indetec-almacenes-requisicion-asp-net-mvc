SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObjetoGastoAlmacenProductos]
	@almacenId AS VARCHAR(4),
	@objetoGastoId AS VARCHAR(8)
AS
/* ************************************************************
 * spObjetoGastoAlmacenProductos
 * ************************************************************ 
 * Descripción: Procedimiento para Obtener productos de un Almacén y 
*						 Objeto Gasto específicos para el combo de Productos en la
*						 Ficha de Inventarios Físicos.
 *
 * autor: 	Javier Elías
 * Fecha: 	04.02.2021
 * Versión: 1.0.0
 **************************************************************
 * PARAMETROS DE ENTRADA: AlmacenId, ObjetoGastoId
 * PARAMETROS DE SALIDA:   
 **************************************************************
*/ 
SELECT DISTINCT
       productos.*
FROM tblProducto AS productos
     INNER JOIN RequisicionesAlmacenDatos.dbo.tblAlmacenProducto AS almacen ON productos.ProductoId = almacen.ProductoId
                                                                               AND AlmacenId = @almacenId
                                                                               AND Borrado = 0
WHERE ObjetoGastoId = @objetoGastoId
      AND Status = 'A'
ORDER BY ProductoId