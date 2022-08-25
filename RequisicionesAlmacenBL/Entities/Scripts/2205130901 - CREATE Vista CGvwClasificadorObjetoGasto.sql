SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[CGvwClasificadorObjetoGasto]
AS
SELECT 2100 AS COGCodigo, 'MATERIALES DE ADMINISTRACI�N, EMISI�N DE DOCUMENTOS Y ART�CULOS OFICIALES' AS COG, '1151-1' AS CuentaAlmacenCodigo, 'Materiales de Administraci�n, Emisi�n de Documentos y Art�culos Oficiales' AS CuentaAlmacen,  '5121' AS CuentaGastoCodigo, 'Materiales de Administraci�n, Emisi�n de documentos y Art�culos Oficiales' AS CuentaGasto UNION
SELECT 2200 AS COGCodigo, 'ALIMENTOS Y UTENSILIOS' AS COG, '1151-2' AS CuentaAlmacenCodigo, 'Alimentos y Utensilios' AS CuentaAlmacen,  '5122' AS CuentaGastoCodigo, 'Alimentos y Utensilios' AS CuentaGasto UNION
SELECT 2400 AS COGCodigo, 'MATERIALES Y ART�CULOS DE CONSTRUCCI�N Y DE REPARACI�N' AS COG, '1151-3' AS CuentaAlmacenCodigo, 'Materiales y Art�culos de Construcci�n y de Reparaci�n' AS CuentaAlmacen,  '5124' AS CuentaGastoCodigo, 'Materiales y Art�culos de Construcci�n y de Reparaci�n' AS CuentaGasto UNION
SELECT 2500 AS COGCodigo, 'PRODUCTOS QU�MICOS, FARMAC�UTICOS Y DE LABORATORIO' AS COG, '1151-4' AS CuentaAlmacenCodigo, 'Productos Qu�micos, Farmac�uticos y de Laboratorio' AS CuentaAlmacen,  '5125' AS CuentaGastoCodigo, 'Productos Qu�micos, Farmac�uticos y de Laboratorio' AS CuentaGasto UNION
SELECT 2600 AS COGCodigo, 'COMBUSTIBLES, LUBRICANTES Y ADITIVOS' AS COG, '1151-5' AS CuentaAlmacenCodigo, 'Combustibles, Lubricantes y Aditivos' AS CuentaAlmacen,  '5126' AS CuentaGastoCodigo, 'Combustibles, Lubricantes y Aditivos' AS CuentaGasto UNION
SELECT 2700 AS COGCodigo, 'VESTUARIO, BLANCOS, PRENDAS DE PROTECCI�N Y ART�CULOS DEPORTIVOS' AS COG, '1151-6' AS CuentaAlmacenCodigo, 'Vestuario, Blancos, Prendas de Protecci�n y Art�culos Deportivos' AS CuentaAlmacen,  '5127' AS CuentaGastoCodigo, 'Vestuario, Blancos, Prendas de Protecci�n y Art�culos Deportivos' AS CuentaGasto UNION
SELECT 2800 AS COGCodigo, 'MATERIALES Y SUMINISTROS PARA SEGURIDAD' AS COG, '1151-7' AS CuentaAlmacenCodigo, 'Materiales y Suministros de Seguridad' AS CuentaAlmacen,  '5128' AS CuentaGastoCodigo, 'Materiales y Suministros de Seguridad' AS CuentaGasto UNION
SELECT 2900 AS COGCodigo, 'HERRAMIENTAS, REFACCIONES Y ACCESORIOS MENORES' AS COG, '1151-8' AS CuentaAlmacenCodigo, 'Herramientas, Refacciones y Accesorios Menores para Consumo' AS CuentaAlmacen,  '5129' AS CuentaGastoCodigo, 'Herramientas, Refacciones y Accesorios Menores para Consumo' AS CuentaGasto 

GO

