DROP TABLE IF EXISTS [dbo].[ARtblInventarioMovimientoAgrupador]
GO

DROP TABLE IF EXISTS [dbo].[ARtblInventarioMovimiento]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARtblInventarioMovimiento](
	[InventarioMovtoId] [bigint] IDENTITY(1,1) NOT NULL,
	[InventarioMovtoAgrupadorId] [int] NULL,
	[AlmacenProductoId] [int] NOT NULL,
	[UnidadMedidaId] [int] NOT NULL,
	[CantidadMovimiento] [decimal](28, 10) NOT NULL,
	[TipoMovimientoId] [int] NOT NULL,
	[CantidadAntesMovto] [decimal](28, 10) NOT NULL,
	[TipoCostoArticuloId] [int] NOT NULL,
	[ValorContableAntesMovto] [money] NOT NULL,
	[MotivoMovto] [varchar](max) NOT NULL,
	[ReferenciaMovtoId] [bigint] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ARtblInventarioMovimiento] PRIMARY KEY CLUSTERED 
(
	[InventarioMovtoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARtblInventarioMovimientoAgrupador](
	[InventarioMovtoAgrupadorId] [int] IDENTITY(1,1) NOT NULL,
	[CodigoAgrupador] [varchar](20) NOT NULL,
	[TipoMovimientoId] [int] NOT NULL,
	[ReferenciaMovtoId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ARtblInventarioMovimientoAgrupador] PRIMARY KEY CLUSTERED 
(
	[InventarioMovtoAgrupadorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ARtblInventarioMovimiento] ADD  CONSTRAINT [DF_ARtblInventarioMovimiento_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[ARtblInventarioMovimientoAgrupador] ADD  CONSTRAINT [DF_ARtblInventarioMovimientoAgrupador_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[ARtblInventarioMovimiento]  WITH CHECK ADD  CONSTRAINT [FK_ARtblInventarioMovimiento_ARtblAlmacenProducto] FOREIGN KEY([AlmacenProductoId])
REFERENCES [dbo].[ARtblAlmacenProducto] ([AlmacenProductoId])
GO
ALTER TABLE [dbo].[ARtblInventarioMovimiento] CHECK CONSTRAINT [FK_ARtblInventarioMovimiento_ARtblAlmacenProducto]
GO
ALTER TABLE [dbo].[ARtblInventarioMovimiento]  WITH CHECK ADD  CONSTRAINT [FK_ARtblInventarioMovimiento_GRtblControlMaestro] FOREIGN KEY([TipoMovimientoId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[ARtblInventarioMovimiento] CHECK CONSTRAINT [FK_ARtblInventarioMovimiento_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[ARtblInventarioMovimiento]  WITH CHECK ADD  CONSTRAINT [FK_ARtblInventarioMovimiento_GRtblControlMaestro1] FOREIGN KEY([TipoCostoArticuloId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[ARtblInventarioMovimiento] CHECK CONSTRAINT [FK_ARtblInventarioMovimiento_GRtblControlMaestro1]
GO
ALTER TABLE [dbo].[ARtblInventarioMovimiento]  WITH CHECK ADD  CONSTRAINT [FK_ARtblInventarioMovimiento_GRtblUsuario] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[ARtblInventarioMovimiento] CHECK CONSTRAINT [FK_ARtblInventarioMovimiento_GRtblUsuario]
GO
ALTER TABLE [dbo].[ARtblInventarioMovimiento]  WITH CHECK ADD  CONSTRAINT [FK_ARtblInventarioMovimiento_tblUnidadDeMedida] FOREIGN KEY([UnidadMedidaId])
REFERENCES [dbo].[tblUnidadDeMedida] ([UnidadDeMedidaId])
GO
ALTER TABLE [dbo].[ARtblInventarioMovimiento] CHECK CONSTRAINT [FK_ARtblInventarioMovimiento_tblUnidadDeMedida]
GO
ALTER TABLE [dbo].[ARtblInventarioMovimientoAgrupador]  WITH CHECK ADD  CONSTRAINT [FK_ARtblInventarioMovimientoAgrupador_GRtblControlMaestro] FOREIGN KEY([TipoMovimientoId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[ARtblInventarioMovimientoAgrupador] CHECK CONSTRAINT [FK_ARtblInventarioMovimientoAgrupador_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[ARtblInventarioMovimientoAgrupador]  WITH CHECK ADD  CONSTRAINT [FK_ARtblInventarioMovimientoAgrupador_GRtblUsuario] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[ARtblInventarioMovimientoAgrupador] CHECK CONSTRAINT [FK_ARtblInventarioMovimientoAgrupador_GRtblUsuario]
GO