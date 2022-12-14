SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRtblPermisoFicha](
	[PermisoFichaId] [int] IDENTITY(1,1) NOT NULL,
	[Etiqueta] [varchar](200) NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
	[NodoMenuId] [int] NOT NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_GRtblPermisoFicha] PRIMARY KEY CLUSTERED 
(
	[PermisoFichaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRtblUsarioPermiso]    Script Date: 09/11/2021 09:43:16 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRtblUsarioPermiso](
	[UsuarioPermisoId] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[PermisoFichaId] [int] NOT NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_GRtblUsarioPermiso] PRIMARY KEY CLUSTERED 
(
	[UsuarioPermisoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GRtblPermisoFicha] ADD  CONSTRAINT [DF_GRtblPermisoFicha_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[GRtblUsarioPermiso] ADD  CONSTRAINT [DF_GRtblUsarioPermiso_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[GRtblPermisoFicha]  WITH CHECK ADD  CONSTRAINT [FK_GRtblPermisoFicha_GRtblControlMaestro] FOREIGN KEY([EstatusId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[GRtblPermisoFicha] CHECK CONSTRAINT [FK_GRtblPermisoFicha_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[GRtblPermisoFicha]  WITH CHECK ADD  CONSTRAINT [FK_GRtblPermisoFicha_GRtblMenuPrincipal] FOREIGN KEY([NodoMenuId])
REFERENCES [dbo].[GRtblMenuPrincipal] ([NodoMenuId])
GO
ALTER TABLE [dbo].[GRtblPermisoFicha] CHECK CONSTRAINT [FK_GRtblPermisoFicha_GRtblMenuPrincipal]
GO
ALTER TABLE [dbo].[GRtblPermisoFicha]  WITH CHECK ADD  CONSTRAINT [FK_GRtblPermisoFicha_GRtblUsuario] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[GRtblPermisoFicha] CHECK CONSTRAINT [FK_GRtblPermisoFicha_GRtblUsuario]
GO
ALTER TABLE [dbo].[GRtblPermisoFicha]  WITH CHECK ADD  CONSTRAINT [FK_GRtblPermisoFicha_GRtblUsuario1] FOREIGN KEY([ModificadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[GRtblPermisoFicha] CHECK CONSTRAINT [FK_GRtblPermisoFicha_GRtblUsuario1]
GO
ALTER TABLE [dbo].[GRtblUsarioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_GRtblUsarioPermiso_GRtblControlMaestro] FOREIGN KEY([EstatusId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[GRtblUsarioPermiso] CHECK CONSTRAINT [FK_GRtblUsarioPermiso_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[GRtblUsarioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_GRtblUsarioPermiso_GRtblPermisoFicha] FOREIGN KEY([PermisoFichaId])
REFERENCES [dbo].[GRtblPermisoFicha] ([PermisoFichaId])
GO
ALTER TABLE [dbo].[GRtblUsarioPermiso] CHECK CONSTRAINT [FK_GRtblUsarioPermiso_GRtblPermisoFicha]
GO
ALTER TABLE [dbo].[GRtblUsarioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_GRtblUsarioPermiso_GRtblUsuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[GRtblUsarioPermiso] CHECK CONSTRAINT [FK_GRtblUsarioPermiso_GRtblUsuario]
GO
ALTER TABLE [dbo].[GRtblUsarioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_GRtblUsarioPermiso_GRtblUsuario1] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[GRtblUsarioPermiso] CHECK CONSTRAINT [FK_GRtblUsarioPermiso_GRtblUsuario1]
GO
ALTER TABLE [dbo].[GRtblUsarioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_GRtblUsarioPermiso_GRtblUsuario2] FOREIGN KEY([ModificadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[GRtblUsarioPermiso] CHECK CONSTRAINT [FK_GRtblUsarioPermiso_GRtblUsuario2]
GO
