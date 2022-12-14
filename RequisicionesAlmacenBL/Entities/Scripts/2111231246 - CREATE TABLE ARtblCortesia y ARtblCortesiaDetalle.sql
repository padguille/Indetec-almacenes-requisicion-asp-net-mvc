SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARtblCortesia](
	[CortesiaId] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](20) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[ProveedorId] [int] NOT NULL,
	[AlmacenId] [varchar](4) NOT NULL,
	[OrdenCompraId] [int] NULL,
	[Comentarios] [nvarchar](2000) NULL,
	[AfectaCostoPromedio] [bit] NULL,
	[TotalCortesia] [float] NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ARtblCortesia] PRIMARY KEY CLUSTERED 
(
	[CortesiaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ARtblCortesiaDetalle]    Script Date: 23/11/2021 12:45:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARtblCortesiaDetalle](
	[CortesiaDetalleId] [int] IDENTITY(1,1) NOT NULL,
	[CortesiaId] [int] NOT NULL,
	[NumeroPartida] [int] NOT NULL,
	[ProductoId] [varchar](10) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[CuentaPresupuestalEgrId] [int] NOT NULL,
	[UnidadMedidaId] [int] NOT NULL,
	[Cantidad] [float] NOT NULL,
	[PrecioUnitario] [float] NOT NULL,
	[TotalPartida] [float] NOT NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ARtblCortesiaDetalle] PRIMARY KEY CLUSTERED 
(
	[CortesiaDetalleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ARtblCortesia] ADD  CONSTRAINT [DF_ARtblCortesia_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[ARtblCortesiaDetalle] ADD  CONSTRAINT [DF_ARtblCortesiaDetalle_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[ARtblCortesia]  WITH CHECK ADD  CONSTRAINT [FK_ARtblCortesia_GRtblControlMaestro] FOREIGN KEY([EstatusId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[ARtblCortesia] CHECK CONSTRAINT [FK_ARtblCortesia_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[ARtblCortesia]  WITH CHECK ADD  CONSTRAINT [FK_ARtblCortesia_GRtblUsuario] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[ARtblCortesia] CHECK CONSTRAINT [FK_ARtblCortesia_GRtblUsuario]
GO
ALTER TABLE [dbo].[ARtblCortesia]  WITH CHECK ADD  CONSTRAINT [FK_ARtblCortesia_GRtblUsuario1] FOREIGN KEY([ModificadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[ARtblCortesia] CHECK CONSTRAINT [FK_ARtblCortesia_GRtblUsuario1]
GO
ALTER TABLE [dbo].[ARtblCortesia]  WITH CHECK ADD  CONSTRAINT [FK_ARtblCortesia_tblAlmacen] FOREIGN KEY([AlmacenId])
REFERENCES [dbo].[tblAlmacen] ([AlmacenId])
GO
ALTER TABLE [dbo].[ARtblCortesia] CHECK CONSTRAINT [FK_ARtblCortesia_tblAlmacen]
GO
ALTER TABLE [dbo].[ARtblCortesia]  WITH CHECK ADD  CONSTRAINT [FK_ARtblCortesia_tblOrdenCompra] FOREIGN KEY([OrdenCompraId])
REFERENCES [dbo].[tblOrdenCompra] ([OrdenCompraId])
GO
ALTER TABLE [dbo].[ARtblCortesia] CHECK CONSTRAINT [FK_ARtblCortesia_tblOrdenCompra]
GO
ALTER TABLE [dbo].[ARtblCortesia]  WITH CHECK ADD  CONSTRAINT [FK_ARtblCortesia_tblProveedor] FOREIGN KEY([ProveedorId])
REFERENCES [dbo].[tblProveedor] ([ProveedorId])
GO
ALTER TABLE [dbo].[ARtblCortesia] CHECK CONSTRAINT [FK_ARtblCortesia_tblProveedor]
GO
ALTER TABLE [dbo].[ARtblCortesiaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ARtblCortesiaDetalle_ARtblCortesia] FOREIGN KEY([CortesiaId])
REFERENCES [dbo].[ARtblCortesia] ([CortesiaId])
GO
ALTER TABLE [dbo].[ARtblCortesiaDetalle] CHECK CONSTRAINT [FK_ARtblCortesiaDetalle_ARtblCortesia]
GO
ALTER TABLE [dbo].[ARtblCortesiaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ARtblCortesiaDetalle_GRtblControlMaestro] FOREIGN KEY([EstatusId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[ARtblCortesiaDetalle] CHECK CONSTRAINT [FK_ARtblCortesiaDetalle_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[ARtblCortesiaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ARtblCortesiaDetalle_GRtblUsuario] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[ARtblCortesiaDetalle] CHECK CONSTRAINT [FK_ARtblCortesiaDetalle_GRtblUsuario]
GO
ALTER TABLE [dbo].[ARtblCortesiaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ARtblCortesiaDetalle_GRtblUsuario1] FOREIGN KEY([ModificadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[ARtblCortesiaDetalle] CHECK CONSTRAINT [FK_ARtblCortesiaDetalle_GRtblUsuario1]
GO
ALTER TABLE [dbo].[ARtblCortesiaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ARtblCortesiaDetalle_tblCuentaPresupuestalEgr] FOREIGN KEY([CuentaPresupuestalEgrId])
REFERENCES [dbo].[tblCuentaPresupuestalEgr] ([CuentaPresupuestalEgrId])
GO
ALTER TABLE [dbo].[ARtblCortesiaDetalle] CHECK CONSTRAINT [FK_ARtblCortesiaDetalle_tblCuentaPresupuestalEgr]
GO
ALTER TABLE [dbo].[ARtblCortesiaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ARtblCortesiaDetalle_tblProducto] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[tblProducto] ([ProductoId])
GO
ALTER TABLE [dbo].[ARtblCortesiaDetalle] CHECK CONSTRAINT [FK_ARtblCortesiaDetalle_tblProducto]
GO
ALTER TABLE [dbo].[ARtblCortesiaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ARtblCortesiaDetalle_tblUnidadDeMedida] FOREIGN KEY([UnidadMedidaId])
REFERENCES [dbo].[tblUnidadDeMedida] ([UnidadDeMedidaId])
GO
ALTER TABLE [dbo].[ARtblCortesiaDetalle] CHECK CONSTRAINT [FK_ARtblCortesiaDetalle_tblUnidadDeMedida]
GO
