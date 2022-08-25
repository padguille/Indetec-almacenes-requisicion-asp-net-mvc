UPDATE GRtblMenuPrincipal
  SET
      NodoPadreId = 21,
	  Etiqueta = 'Salida de Almac�n',
      Descripcion = 'Reporte de Salida de Almac�n',
      Url = 'almacenes/reportes/reportesurtidomateriales',
	  Orden = 4,
	  AdmitePermiso = 1
WHERE NodoMenuId = 61
GO

SET IDENTITY_INSERT GRtblMenuPrincipal ON
INSERT INTO GRtblMenuPrincipal
(
    NodoMenuId, -- this column value is auto-generated
    Etiqueta,
    Descripcion,
    TipoNodoId,
    NodoPadreId,
    SistemaAccesoId,
    Url,
    Icono,
    AdmitePermiso,
    Orden,
    EstatusId,
    Timestamp
)
VALUES
(
    62, --NodoMenuId - int
    'Entrada a Almac�n', -- Etiqueta - varchar
    'Reporte de Entrada a Almac�n', -- Descripcion - varchar
    7, -- TipoNodoId - int
    21, -- NodoPadreId - int
    8, -- SistemaAccesoId - int
    'almacenes/reportes/reporterecibooc', -- Url - varchar
    NULL, -- Icono - varchar
    1, -- AdmitePermiso - bit
    5, -- Orden - tinyint
	1, -- EstatusId - int
    NULL -- Timestamp - timestamp
),
(
    63, --NodoMenuId - int
    'Libro de Almac�n', -- Etiqueta - varchar
    'Reporte de Libro de Almac�n', -- Descripcion - varchar
    7, -- TipoNodoId - int
    21, -- NodoPadreId - int
    8, -- SistemaAccesoId - int
    'almacenes/reportes/reportelibroalmacen', -- Url - varchar
    NULL, -- Icono - varchar
    1, -- AdmitePermiso - bit
    3, -- Orden - tinyint
	1, -- EstatusId - int
    NULL -- Timestamp - timestamp
)
SET IDENTITY_INSERT GRtblMenuPrincipal OFF