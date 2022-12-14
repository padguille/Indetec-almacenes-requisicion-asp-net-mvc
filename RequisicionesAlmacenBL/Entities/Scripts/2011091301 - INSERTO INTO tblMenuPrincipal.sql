SET IDENTITY_INSERT [dbo].[tblMenuPrincipal] ON 
GO
INSERT [dbo].[tblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (1, N'Compras', N'Menú Compras', 6, NULL, 8, NULL, N'icon ion-ios-copy-outline', 0, 1, 1)
GO
INSERT [dbo].[tblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (2, N'Catálogos', N'SubMenu Catálogos', 6, 1, 8, NULL, NULL, 0, 1, 1)
GO
INSERT [dbo].[tblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (4, N'Configuración Montos Compras', N'Ficha Configuracio Montos Compras', 7, 2, 8, N'compras/catalogos/ConfiguracionMontosCompra', N'icon ion-ios-copy-outline', 1, 1, 1)
GO
INSERT [dbo].[tblMenuPrincipal] ([NodoMenuId], [Etiqueta], [Descripcion], [TipoNodoId], [NodoPadreId], [SistemaAccesoId], [Url], [Icono], [AdmitePermiso], [Orden], [EstatusId]) VALUES (5, N'Prospectos Proveedor', N'Ficha Prospectos Proveedor', 7, 2, 8, N'compras/catalogos/proveedoresProspectos', N'icon ion-ios-copy-outline', 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tblMenuPrincipal] OFF
GO
