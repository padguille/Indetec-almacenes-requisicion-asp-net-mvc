UPDATE GRtblMenuPrincipal SET Etiqueta = 'Solicitud de Materiales', Descripcion = 'Ficha de Solicitud de Materiales' WHERE NodoMenuId = 8
GO

UPDATE GRtblMenuPrincipal SET Etiqueta = REPLACE(Etiqueta, 'Requisici�n', 'Solicitudes'), Descripcion = REPLACE(Descripcion, 'Requisici�n', 'Solicitud') WHERE NodoMenuId IN (9, 10)
GO