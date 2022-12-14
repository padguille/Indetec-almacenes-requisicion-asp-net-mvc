SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MItblControlMaestroFrecuenciaMedicion](
	[FrecuenciaMedicionId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Borrado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_MItblControlMaestroFrecuenciaMedicion] PRIMARY KEY CLUSTERED 
(
	[FrecuenciaMedicionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MItblControlMaestroFrecuenciaMedicionNivel]    Script Date: 27/07/2021 01:09:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MItblControlMaestroFrecuenciaMedicionNivel](
	[FrecuenciaMedicionNivelId] [int] IDENTITY(1,1) NOT NULL,
	[FrecuenciaMedicionId] [int] NOT NULL,
	[NivelId] [int] NOT NULL,
	[Borrado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_MItblControlMaestroFrecuenciaMedicionNivel] PRIMARY KEY CLUSTERED 
(
	[FrecuenciaMedicionNivelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MItblControlMaestroFrecuenciaMedicion] ADD  CONSTRAINT [DF_MItblControlMaestroFrecuenciaMedicion_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[MItblControlMaestroFrecuenciaMedicionNivel] ADD  CONSTRAINT [DF_MItblControlMaestroFrecuenciaMedicionNivel_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[MItblControlMaestroFrecuenciaMedicion]  WITH CHECK ADD  CONSTRAINT [FK_MItblControlMaestroFrecuenciaMedicion_GRtblUsuario] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[MItblControlMaestroFrecuenciaMedicion] CHECK CONSTRAINT [FK_MItblControlMaestroFrecuenciaMedicion_GRtblUsuario]
GO
ALTER TABLE [dbo].[MItblControlMaestroFrecuenciaMedicion]  WITH CHECK ADD  CONSTRAINT [FK_MItblControlMaestroFrecuenciaMedicion_GRtblUsuario1] FOREIGN KEY([ModificadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[MItblControlMaestroFrecuenciaMedicion] CHECK CONSTRAINT [FK_MItblControlMaestroFrecuenciaMedicion_GRtblUsuario1]
GO
ALTER TABLE [dbo].[MItblControlMaestroFrecuenciaMedicionNivel]  WITH CHECK ADD  CONSTRAINT [FK_MItblControlMaestroFrecuenciaMedicionNivel_GRtblControlMaestro] FOREIGN KEY([NivelId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[MItblControlMaestroFrecuenciaMedicionNivel] CHECK CONSTRAINT [FK_MItblControlMaestroFrecuenciaMedicionNivel_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[MItblControlMaestroFrecuenciaMedicionNivel]  WITH CHECK ADD  CONSTRAINT [FK_MItblControlMaestroFrecuenciaMedicionNivel_GRtblUsuario] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[MItblControlMaestroFrecuenciaMedicionNivel] CHECK CONSTRAINT [FK_MItblControlMaestroFrecuenciaMedicionNivel_GRtblUsuario]
GO
ALTER TABLE [dbo].[MItblControlMaestroFrecuenciaMedicionNivel]  WITH CHECK ADD  CONSTRAINT [FK_MItblControlMaestroFrecuenciaMedicionNivel_GRtblUsuario1] FOREIGN KEY([ModificadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[MItblControlMaestroFrecuenciaMedicionNivel] CHECK CONSTRAINT [FK_MItblControlMaestroFrecuenciaMedicionNivel_GRtblUsuario1]
GO
ALTER TABLE [dbo].[MItblControlMaestroFrecuenciaMedicionNivel]  WITH CHECK ADD  CONSTRAINT [FK_MItblControlMaestroFrecuenciaMedicionNivel_MItblControlMaestroFrecuenciaMedicion] FOREIGN KEY([FrecuenciaMedicionId])
REFERENCES [dbo].[MItblControlMaestroFrecuenciaMedicion] ([FrecuenciaMedicionId])
GO
ALTER TABLE [dbo].[MItblControlMaestroFrecuenciaMedicionNivel] CHECK CONSTRAINT [FK_MItblControlMaestroFrecuenciaMedicionNivel_MItblControlMaestroFrecuenciaMedicion]
GO
