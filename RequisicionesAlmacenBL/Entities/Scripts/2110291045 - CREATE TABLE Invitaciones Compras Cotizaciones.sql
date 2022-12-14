SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtblInvitacionCompraDetallePrecioProveedor](
	[InvitacionCompraDetallePrecioProveedorId] [bigint] IDENTITY(1,1) NOT NULL,
	[InvitacionCompraDetalleId] [int] NOT NULL,
	[ProveedorId] [int] NOT NULL,
	[PrecioArticulo] [money] NOT NULL,
	[Ganador] [bit] NULL,
	[Comentario] [nvarchar](1000) NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ArtblInvitacionCompraDetallePrecioProveedor] PRIMARY KEY CLUSTERED 
(
	[InvitacionCompraDetallePrecioProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ARtblInvitacionCompraProveedor]    Script Date: 29/10/2021 10:44:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARtblInvitacionCompraProveedor](
	[InvitacionCompraProveedorId] [int] IDENTITY(1,1) NOT NULL,
	[InvitacionCompraId] [int] NOT NULL,
	[ProveedorId] [int] NOT NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ARtblInvitacionCompraProveedor] PRIMARY KEY CLUSTERED 
(
	[InvitacionCompraProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArtblInvitacionCompraProveedorCotizacion]    Script Date: 29/10/2021 10:44:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtblInvitacionCompraProveedorCotizacion](
	[InvitacionCompraProveedorCotizacionId] [int] IDENTITY(1,1) NOT NULL,
	[InvitacionCompraProveedorId] [int] NOT NULL,
	[CotizacionId] [uniqueidentifier] NOT NULL,
	[FechaCotizacion] [datetime] NOT NULL,
	[Comentario] [nvarchar](1000) NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ArtblInvitacionCompraProveedorCotizacion] PRIMARY KEY CLUSTERED 
(
	[InvitacionCompraProveedorCotizacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArtblInvitacionCompraDetallePrecioProveedor] ADD  CONSTRAINT [DF_ArtblInvitacionCompraDetallePrecioProveedor_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraProveedor] ADD  CONSTRAINT [DF_ARtblInvitacionCompraProveedor_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[ArtblInvitacionCompraProveedorCotizacion] ADD  CONSTRAINT [DF_ArtblInvitacionCompraProveedorCotizacion_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[ArtblInvitacionCompraDetallePrecioProveedor]  WITH CHECK ADD  CONSTRAINT [FK_ArtblInvitacionCompraDetallePrecioProveedor_ARtblInvitacionCompraDetalle] FOREIGN KEY([InvitacionCompraDetalleId])
REFERENCES [dbo].[ARtblInvitacionCompraDetalle] ([InvitacionCompraDetalleId])
GO
ALTER TABLE [dbo].[ArtblInvitacionCompraDetallePrecioProveedor] CHECK CONSTRAINT [FK_ArtblInvitacionCompraDetallePrecioProveedor_ARtblInvitacionCompraDetalle]
GO
ALTER TABLE [dbo].[ArtblInvitacionCompraDetallePrecioProveedor]  WITH CHECK ADD  CONSTRAINT [FK_ArtblInvitacionCompraDetallePrecioProveedor_GRtblControlMaestro] FOREIGN KEY([EstatusId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[ArtblInvitacionCompraDetallePrecioProveedor] CHECK CONSTRAINT [FK_ArtblInvitacionCompraDetallePrecioProveedor_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[ArtblInvitacionCompraDetallePrecioProveedor]  WITH CHECK ADD  CONSTRAINT [FK_ArtblInvitacionCompraDetallePrecioProveedor_tblProveedor] FOREIGN KEY([ProveedorId])
REFERENCES [dbo].[tblProveedor] ([ProveedorId])
GO
ALTER TABLE [dbo].[ArtblInvitacionCompraDetallePrecioProveedor] CHECK CONSTRAINT [FK_ArtblInvitacionCompraDetallePrecioProveedor_tblProveedor]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraProveedor]  WITH CHECK ADD  CONSTRAINT [FK_ARtblInvitacionCompraProveedor_ARtblInvitacionCompra] FOREIGN KEY([InvitacionCompraId])
REFERENCES [dbo].[ARtblInvitacionCompra] ([InvitacionCompraId])
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraProveedor] CHECK CONSTRAINT [FK_ARtblInvitacionCompraProveedor_ARtblInvitacionCompra]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraProveedor]  WITH CHECK ADD  CONSTRAINT [FK_ARtblInvitacionCompraProveedor_GRtblControlMaestro] FOREIGN KEY([EstatusId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraProveedor] CHECK CONSTRAINT [FK_ARtblInvitacionCompraProveedor_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraProveedor]  WITH CHECK ADD  CONSTRAINT [FK_ARtblInvitacionCompraProveedor_GRtblUsuario] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraProveedor] CHECK CONSTRAINT [FK_ARtblInvitacionCompraProveedor_GRtblUsuario]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraProveedor]  WITH CHECK ADD  CONSTRAINT [FK_ARtblInvitacionCompraProveedor_GRtblUsuario1] FOREIGN KEY([ModificadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraProveedor] CHECK CONSTRAINT [FK_ARtblInvitacionCompraProveedor_GRtblUsuario1]
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraProveedor]  WITH CHECK ADD  CONSTRAINT [FK_ARtblInvitacionCompraProveedor_tblProveedor] FOREIGN KEY([ProveedorId])
REFERENCES [dbo].[tblProveedor] ([ProveedorId])
GO
ALTER TABLE [dbo].[ARtblInvitacionCompraProveedor] CHECK CONSTRAINT [FK_ARtblInvitacionCompraProveedor_tblProveedor]
GO
ALTER TABLE [dbo].[ArtblInvitacionCompraProveedorCotizacion]  WITH CHECK ADD  CONSTRAINT [FK_ArtblInvitacionCompraProveedorCotizacion_ARtblInvitacionCompraProveedor] FOREIGN KEY([InvitacionCompraProveedorId])
REFERENCES [dbo].[ARtblInvitacionCompraProveedor] ([InvitacionCompraProveedorId])
GO
ALTER TABLE [dbo].[ArtblInvitacionCompraProveedorCotizacion] CHECK CONSTRAINT [FK_ArtblInvitacionCompraProveedorCotizacion_ARtblInvitacionCompraProveedor]
GO
ALTER TABLE [dbo].[ArtblInvitacionCompraProveedorCotizacion]  WITH CHECK ADD  CONSTRAINT [FK_ArtblInvitacionCompraProveedorCotizacion_GRtblArchivo] FOREIGN KEY([CotizacionId])
REFERENCES [dbo].[GRtblArchivo] ([ArchivoId])
GO
ALTER TABLE [dbo].[ArtblInvitacionCompraProveedorCotizacion] CHECK CONSTRAINT [FK_ArtblInvitacionCompraProveedorCotizacion_GRtblArchivo]
GO
ALTER TABLE [dbo].[ArtblInvitacionCompraProveedorCotizacion]  WITH CHECK ADD  CONSTRAINT [FK_ArtblInvitacionCompraProveedorCotizacion_GRtblControlMaestro] FOREIGN KEY([EstatusId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[ArtblInvitacionCompraProveedorCotizacion] CHECK CONSTRAINT [FK_ArtblInvitacionCompraProveedorCotizacion_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[ArtblInvitacionCompraProveedorCotizacion]  WITH CHECK ADD  CONSTRAINT [FK_ArtblInvitacionCompraProveedorCotizacion_GRtblUsuario] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[ArtblInvitacionCompraProveedorCotizacion] CHECK CONSTRAINT [FK_ArtblInvitacionCompraProveedorCotizacion_GRtblUsuario]
GO
ALTER TABLE [dbo].[ArtblInvitacionCompraProveedorCotizacion]  WITH CHECK ADD  CONSTRAINT [FK_ArtblInvitacionCompraProveedorCotizacion_GRtblUsuario1] FOREIGN KEY([ModificadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[ArtblInvitacionCompraProveedorCotizacion] CHECK CONSTRAINT [FK_ArtblInvitacionCompraProveedorCotizacion_GRtblUsuario1]
GO
