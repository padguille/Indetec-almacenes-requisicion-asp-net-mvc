

DELETE FROM GRtblMenuPrincipal
GO

SET IDENTITY_INSERT [dbo].[GRtblMenuPrincipal] ON 
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (1, N'Compras', N'Menú Compras', 6, NULL, 8, NULL, NULL, 0, 1, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (2, N'Catálogos', N'SubMenú Catálogos', 98, 1, 8, NULL, N'icon ion-gear-a', 0, 1, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (4, N'Configuración Montos Compras', N'Ficha Configuracion Montos Compras', 7, 2, 8, N'compras/catalogos/configuracionmontocompra', NULL, 1, 1, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (5, N'Prospectos Proveedor', N'Ficha Prospectos Proveedor', 7, 2, 8, N'compras/catalogos/proveedoresprospectos', NULL, 1, 2, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (6, N'Configuración Áreas', N'Ficha Configuracion Areas', 7, 2, 8, N'compras/catalogos/proveedoresprospectos', NULL, 1, 3, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (7, N'Requisiciones', N'SubMenú Requisiciones', 98, 1, 8, NULL, N'icon ion-gear-a', 0, 2, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (8, N'Requisición Material', N'Ficha de Requisicion de Material', 7, 7, 8, N'compras/requisiciones/requisicionmaterial', NULL, 1, 1, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (9, N'Requisición por Surtir', N'Ficha de Requisicion por surtir', 7, 7, 8, N'compras/requisiciones/requisicionporsurtir', NULL, 1, 2, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (10, N'Requisición por Comprar', N'Ficha de Requisicion por comprar', 7, 7, 8, N'compras/requisiciones/requisicionporcomprar', NULL, 1, 3, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (11, N'Compras', N'SubMenú Compras', 98, 1, 8, NULL, N'icon ion-gear-a', 0, 3, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (12, N'Orden de Compra', N'Ficha Orden de Compra', 7, 11, 8, N'compras/compras/ordencompra', NULL, 1, 1, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (13, N'Recibo de OC', N'Ficha Recibo Orden de Compra', 7, 11, 8, N'compras/compras/ordencomprarecibo', NULL, 1, 2, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (14, N'Cancelación Recibo OC', N'Ficha de Cancelacion de Recibo de Orden de Compra', 7, 11, 8, N'compras/compras/ordencompracancelacionrecibo', NULL, 1, 3, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (15, N'Inventarios', N'Menú Inventarios', 6, NULL, 8, NULL, NULL, 0, 2, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (16, N'Catálogos', N'SubMenú Catálogos', 98, 15, 8, NULL, N'icon ion-gear-a', 0, 1, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (17, N'Conceptos Ajuste Inventario', N'Ficha Conceptos Ajustes de Inventario', 7, 16, 8, N'inventarios/catalogos/conceptoajusteinventario', NULL, 1, 1, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (18, N'Inventarios', N'SubMenú Inventarios', 98, 15, 8, NULL, N'icon ion-gear-a', 0, 2, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (19, N'Inventario Físico', N'Ficha de Inventario Fisico', 7, 18, 8, N'inventarios/inventarios/inventariosfisicos', NULL, 1, 1, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (20, N'Ajuste de Inventario', N'Ficha de Ajuste de Inventario', 7, 18, 8, N'inventarios/inventarios/inventariosajustes', NULL, 1, 2, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (21, N'Reportes', N'SubMenú Reportes', 98, 15, 8, NULL, N'icon ion-gear-a', 0, 3, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (22, N'Kardex', N'Reporte Kardex', 7, 21, 8, N'inventarios/reportes/reportekardex', NULL, 1, 1, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (23, N'Existencias', N'Reporte Existencias', 7, 21, 8, N'inventarios/reportes/reporteexistencias', NULL, 1, 2, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (24, N'MIR', N'Menú MIR', 6, NULL, 8, NULL, NULL, 0, 3, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (25, N'Catálogos', N'SubMenú Catálogos', 98, 24, 8, NULL, N'icon ion-gear-a', 0, 1, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (26, N'Tipo de Indicador', N'Ficha Tipo Indicador', 7, 25, 8, N'mir/catalogos/tipoindicador', NULL, 1, 1, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (27, N'Dimensión', N'Ficha Dimension', 7, 25, 8, N'mir/catalogos/dimension', NULL, 1, 2, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (28, N'Plan de Desarollo', N'Ficha Plan de Desarollo', 7, 25, 8, N'mir/catalogos/plandesarollo', NULL, 1, 3, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (29, N'Fórmulas a Unidades de Medida', N'Ficha Formulas a Unidades de Medida', 7, 25, 8, N'mir/catalogos/unidadmedida', NULL, 1, 4, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (30, N'Control Periodos', N'Ficha de Control de Periodo', 7, 25, 8, N'mir/catalogos/controlperiodo', NULL, 1, 5, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (31, N'Sentido del Indicador', N'Ficha Sentido del Indicador', 7, 25, 8, N'mir/catalogos/sentidoindicador', NULL, 1, 6, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (32, N'Frecuencia de Medición', N'Ficha Frecuencia de Medicion', 7, 25, 8, N'mir/catalogos/frecuenciamedicion', NULL, 1, 7, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (33, N'MIR', N'SubMenú MIR', 98, 24, 8, NULL, N'icon ion-gear-a', 0, 2, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (34, N'MIR', N'Ficha MIR', 7, 33, 8, N'mir/mir/matrizindicadorresultado', NULL, 1, 1, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (35, N'Configuración Presupuestos', N'Ficha de Configuracion de Prespuestos', 7, 33, 8, N'mir/mir/matrizconfiguracionpresupuestal', NULL, 1, 2, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (36, N'Seguimiento a Variables', N'Ficha de Seguimiento a Variables', 7, 33, 8, N'mir/mir/matrizconfiguracionpresupuestalseguimientovariable', NULL, 1, 3, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (37, N'Reportes', N'SubMenú Reportes', 98, 24, 8, NULL, N'icon ion-gear-a', 0, 3, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (38, N'MIR', N'Reporte MIR', 7, 37, 8, N'mir/reportes/reportematrizindicadorresultado', NULL, 1, 1, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (39, N'Indicadores de Variables', N'Reporte Indicadores de Variables', 7, 37, 8, N'mir/reportes/reportevariableindicador', NULL, 1, 2, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (40, N'Seguimiento de Indicadores de Desempeño', N'Reporte Seguimiento de Indicadores de Desempeño', 7, 37, 8, N'mir/reportes/reporteseguimientoindicadordesempenio', NULL, 1, 3, 1)
GO
INSERT [dbo].[GRtblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (41, N'Ficha Tecnica Indicador', N'Reporte Ficha Tecnica Indicador', 7, 37, 8, N'mir/reportes/40	Seguimiento de Indicadores de Desempeño	Reporte Seguimiento de Indicadores de Desempeño	7	37	8	mir/reportes/reporteseguimientoindicadordesempenio	NULL	True	3	1	<Binary data>', NULL, 1, 4, 1)
GO
SET IDENTITY_INSERT [dbo].[GRtblMenuPrincipal] OFF
GO
