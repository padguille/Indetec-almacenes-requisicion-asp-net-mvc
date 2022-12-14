SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* ************************************************************
 * spObjetoGastoAlmacenProductos
 * ************************************************************ 
 * Descripción: Procedimiento para Obtener productos de un Almacén y 
*						 Objeto Gasto específicos para el combo de Productos en la
*						 Ficha de Inventarios Físicos.
 *
 * autor: 	Javier Elías
 * Fecha: 	04.02.2021
 * Fecha modificación: 23.07.2021
 * Versión: 1.0.0
 **************************************************************
 * PARAMETROS DE ENTRADA: AlmacenId, ObjetoGastoId
 * PARAMETROS DE SALIDA:   
 **************************************************************
*/ 
CREATE OR ALTER PROCEDURE [dbo].[ARspObjetoGastoAlmacenProductos]
	@almacenId AS VARCHAR(4),
	@objetoGastoId AS VARCHAR(4000)
AS

SELECT DISTINCT
       productos.*
FROM tblProducto AS productos
     INNER JOIN ARtblAlmacenProducto AS almacen ON productos.ProductoId = almacen.ProductoId
                                                                               AND AlmacenId = @almacenId
                                                                               AND Borrado = 0
WHERE Status = 'A'
      AND ObjetoGastoId IN ( SELECT splitdata FROM GRfnSplitString(@objetoGastoId, ',') WHERE RTRIM(splitdata) <> '' )
ORDER BY ProductoId