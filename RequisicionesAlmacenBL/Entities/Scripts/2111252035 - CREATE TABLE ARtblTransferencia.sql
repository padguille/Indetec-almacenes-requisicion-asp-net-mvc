SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARtblTransferencia](
	[TransferenciaId] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](20) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[AlmacenOrigenId] [varchar](4) NOT NULL,
	[Comentarios] [nvarchar](2000) NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ARtblTransferencia] PRIMARY KEY CLUSTERED 
(
	[TransferenciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ARtblTransferenciaMovto]    Script Date: 25/11/2021 08:35:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARtblTransferenciaMovto](
	[TransferenciaMovtoId] [int] IDENTITY(1,1) NOT NULL,
	[TransferenciaId] [int] NOT NULL,
	[NumeroLinea] [int] NULL,
	[ProductoId] [varchar](10) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[Cantidad] [float] NOT NULL,
	[UnidadMedidaId] [int] NOT NULL,
	[AlmacenProductoOrigenId] [int] NOT NULL,
	[AlmacenProductoDestinoId] [int] NOT NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ARtblTransferenciaMovto] PRIMARY KEY CLUSTERED 
(
	[TransferenciaMovtoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ARtblTransferencia] ADD  CONSTRAINT [DF_ARtblTransferencia_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[ARtblTransferenciaMovto] ADD  CONSTRAINT [DF_ARtblTransferenciaMovto_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[ARtblTransferencia]  WITH CHECK ADD  CONSTRAINT [FK_ARtblTransferencia_GRtblControlMaestro] FOREIGN KEY([EstatusId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[ARtblTransferencia] CHECK CONSTRAINT [FK_ARtblTransferencia_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[ARtblTransferencia]  WITH CHECK ADD  CONSTRAINT [FK_ARtblTransferencia_GRtblUsuario] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[ARtblTransferencia] CHECK CONSTRAINT [FK_ARtblTransferencia_GRtblUsuario]
GO
ALTER TABLE [dbo].[ARtblTransferencia]  WITH CHECK ADD  CONSTRAINT [FK_ARtblTransferencia_GRtblUsuario1] FOREIGN KEY([ModificadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[ARtblTransferencia] CHECK CONSTRAINT [FK_ARtblTransferencia_GRtblUsuario1]
GO
ALTER TABLE [dbo].[ARtblTransferencia]  WITH CHECK ADD  CONSTRAINT [FK_ARtblTransferencia_tblAlmacen] FOREIGN KEY([AlmacenOrigenId])
REFERENCES [dbo].[tblAlmacen] ([AlmacenId])
GO
ALTER TABLE [dbo].[ARtblTransferencia] CHECK CONSTRAINT [FK_ARtblTransferencia_tblAlmacen]
GO
ALTER TABLE [dbo].[ARtblTransferenciaMovto]  WITH CHECK ADD  CONSTRAINT [FK_ARtblTransferenciaMovto_ARtblAlmacenProducto] FOREIGN KEY([AlmacenProductoOrigenId])
REFERENCES [dbo].[ARtblAlmacenProducto] ([AlmacenProductoId])
GO
ALTER TABLE [dbo].[ARtblTransferenciaMovto] CHECK CONSTRAINT [FK_ARtblTransferenciaMovto_ARtblAlmacenProducto]
GO
ALTER TABLE [dbo].[ARtblTransferenciaMovto]  WITH CHECK ADD  CONSTRAINT [FK_ARtblTransferenciaMovto_ARtblAlmacenProducto1] FOREIGN KEY([AlmacenProductoDestinoId])
REFERENCES [dbo].[ARtblAlmacenProducto] ([AlmacenProductoId])
GO
ALTER TABLE [dbo].[ARtblTransferenciaMovto] CHECK CONSTRAINT [FK_ARtblTransferenciaMovto_ARtblAlmacenProducto1]
GO
ALTER TABLE [dbo].[ARtblTransferenciaMovto]  WITH CHECK ADD  CONSTRAINT [FK_ARtblTransferenciaMovto_ARtblTransferencia] FOREIGN KEY([TransferenciaId])
REFERENCES [dbo].[ARtblTransferencia] ([TransferenciaId])
GO
ALTER TABLE [dbo].[ARtblTransferenciaMovto] CHECK CONSTRAINT [FK_ARtblTransferenciaMovto_ARtblTransferencia]
GO
ALTER TABLE [dbo].[ARtblTransferenciaMovto]  WITH CHECK ADD  CONSTRAINT [FK_ARtblTransferenciaMovto_GRtblControlMaestro] FOREIGN KEY([EstatusId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[ARtblTransferenciaMovto] CHECK CONSTRAINT [FK_ARtblTransferenciaMovto_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[ARtblTransferenciaMovto]  WITH CHECK ADD  CONSTRAINT [FK_ARtblTransferenciaMovto_GRtblUsuario] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[ARtblTransferenciaMovto] CHECK CONSTRAINT [FK_ARtblTransferenciaMovto_GRtblUsuario]
GO
ALTER TABLE [dbo].[ARtblTransferenciaMovto]  WITH CHECK ADD  CONSTRAINT [FK_ARtblTransferenciaMovto_GRtblUsuario1] FOREIGN KEY([ModificadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[ARtblTransferenciaMovto] CHECK CONSTRAINT [FK_ARtblTransferenciaMovto_GRtblUsuario1]
GO
ALTER TABLE [dbo].[ARtblTransferenciaMovto]  WITH CHECK ADD  CONSTRAINT [FK_ARtblTransferenciaMovto_tblProducto] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[tblProducto] ([ProductoId])
GO
ALTER TABLE [dbo].[ARtblTransferenciaMovto] CHECK CONSTRAINT [FK_ARtblTransferenciaMovto_tblProducto]
GO
ALTER TABLE [dbo].[ARtblTransferenciaMovto]  WITH CHECK ADD  CONSTRAINT [FK_ARtblTransferenciaMovto_tblUnidadDeMedida] FOREIGN KEY([UnidadMedidaId])
REFERENCES [dbo].[tblUnidadDeMedida] ([UnidadDeMedidaId])
GO
ALTER TABLE [dbo].[ARtblTransferenciaMovto] CHECK CONSTRAINT [FK_ARtblTransferenciaMovto_tblUnidadDeMedida]
GO
