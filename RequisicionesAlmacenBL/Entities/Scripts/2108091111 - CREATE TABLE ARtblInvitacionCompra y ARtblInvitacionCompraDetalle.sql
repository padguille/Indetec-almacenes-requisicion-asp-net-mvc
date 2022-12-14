SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARtblInvitacionCompra](
	[InvitacionCompraId] [int] IDENTITY(1,1) NOT NULL,
	[CodigoInvitacion] [varchar](20) NOT NULL,
	[ProveedorId] [int] NOT NULL,
	[AlmacenId] [varchar](4) NOT NULL,
	[Ejercicio] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[MontoInvitacion] [money] NOT NULL,
	[Observacion] [varchar](1000) NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ARInvitacionCompra] PRIMARY KEY CLUSTERED 
(
	[InvitacionCompraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ARtblInvitacionCompraDetalle]    Script Date: 09/08/2021 11:10:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARtblInvitacionCompraDetalle](
	[InvitacionCompraDetalleId] [int] IDENTITY(1,1) NOT NULL,
	[InvitacionCompraId] [int] NOT NULL,
	[TarifaImpuestoId] [varchar](10) NOT NULL,
	[ProductoId] [varchar](10) NOT NULL,
	[CuentaPresupuestalEgrId] [int] NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[Cantidad] [float] NOT NULL,
	[Costo] [money] NOT NULL,
	[Importe] [money] NOT NULL,
	[IEPS] [float] NOT NULL,
	[Ajuste] [float] NOT NULL,
	[IVA] [float] NOT NULL,
	[ISH] [float] NOT NULL,
	[RetencionISR] [float] NOT NULL,
	[RetencionCedular] [float] NOT NULL,
	[RetencionIVA] [float] NOT NULL,
	[TotalPresupuesto] [float] NOT NULL,
	[Total] [float] NOT NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ARInvitacionCompraDetalle] PRIMARY KEY CLUSTERED 
(
	[InvitacionCompraDetalleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompra] ADD  CONSTRAINT [DF_ARInvitacionCompra_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle] ADD  CONSTRAINT [DF_ARInvitacionCompraDetalle_Cantidad]  DEFAULT ((0)) FOR [Cantidad]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle] ADD  CONSTRAINT [DF_ARInvitacionCompraDetalle_Costo]  DEFAULT ((0)) FOR [Costo]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle] ADD  CONSTRAINT [DF_ARInvitacionCompraDetalle_Importe]  DEFAULT ((0.00)) FOR [Importe]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle] ADD  CONSTRAINT [DF_ARInvitacionCompraDetalle_IEPS]  DEFAULT ((0)) FOR [IEPS]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle] ADD  CONSTRAINT [DF_ARInvitacionCompraDetalle_Ajuste]  DEFAULT ((0)) FOR [Ajuste]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle] ADD  CONSTRAINT [DF_ARInvitacionCompraDetalle_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompra]  WITH CHECK ADD  CONSTRAINT [FK_ARInvitacionCompra_GRtblControlMaestro] FOREIGN KEY([EstatusId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[ARtblInvitacionCompra] CHECK CONSTRAINT [FK_ARInvitacionCompra_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompra]  WITH CHECK ADD  CONSTRAINT [FK_ARInvitacionCompra_GRtblUsuario] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[ARtblInvitacionCompra] CHECK CONSTRAINT [FK_ARInvitacionCompra_GRtblUsuario]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompra]  WITH CHECK ADD  CONSTRAINT [FK_ARInvitacionCompra_GRtblUsuario1] FOREIGN KEY([ModificadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[ARtblInvitacionCompra] CHECK CONSTRAINT [FK_ARInvitacionCompra_GRtblUsuario1]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompra]  WITH CHECK ADD  CONSTRAINT [FK_ARInvitacionCompra_tblAlmacen] FOREIGN KEY([AlmacenId])
REFERENCES [dbo].[tblAlmacen] ([AlmacenId])
GO
ALTER TABLE [dbo].[ARtblInvitacionCompra] CHECK CONSTRAINT [FK_ARInvitacionCompra_tblAlmacen]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompra]  WITH CHECK ADD  CONSTRAINT [FK_ARInvitacionCompra_tblProveedor] FOREIGN KEY([ProveedorId])
REFERENCES [dbo].[tblProveedor] ([ProveedorId])
GO
ALTER TABLE [dbo].[ARtblInvitacionCompra] CHECK CONSTRAINT [FK_ARInvitacionCompra_tblProveedor]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ARInvitacionCompraDetalle_ARInvitacionCompra] FOREIGN KEY([InvitacionCompraId])
REFERENCES [dbo].[ARtblInvitacionCompra] ([InvitacionCompraId])
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle] CHECK CONSTRAINT [FK_ARInvitacionCompraDetalle_ARInvitacionCompra]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ARInvitacionCompraDetalle_GRtblControlMaestro] FOREIGN KEY([EstatusId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle] CHECK CONSTRAINT [FK_ARInvitacionCompraDetalle_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ARInvitacionCompraDetalle_GRtblUsuario] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle] CHECK CONSTRAINT [FK_ARInvitacionCompraDetalle_GRtblUsuario]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ARInvitacionCompraDetalle_GRtblUsuario1] FOREIGN KEY([ModificadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle] CHECK CONSTRAINT [FK_ARInvitacionCompraDetalle_GRtblUsuario1]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ARInvitacionCompraDetalle_tblCuentaPresupuestalEgr] FOREIGN KEY([CuentaPresupuestalEgrId])
REFERENCES [dbo].[tblCuentaPresupuestalEgr] ([CuentaPresupuestalEgrId])
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle] CHECK CONSTRAINT [FK_ARInvitacionCompraDetalle_tblCuentaPresupuestalEgr]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ARInvitacionCompraDetalle_tblProducto] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[tblProducto] ([ProductoId])
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle] CHECK CONSTRAINT [FK_ARInvitacionCompraDetalle_tblProducto]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ARInvitacionCompraDetalle_tblTarifaImpuesto] FOREIGN KEY([TarifaImpuestoId])
REFERENCES [dbo].[tblTarifaImpuesto] ([TarifaImpuestoId])
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraDetalle] CHECK CONSTRAINT [FK_ARInvitacionCompraDetalle_tblTarifaImpuesto]
GO
