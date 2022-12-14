
ALTER TABLE [dbo].[GRtblMenuPrincipal] DROP CONSTRAINT [FK_GRtblMenuPrincipal_GRtblControlMaestro]
GO
/****** Object:  Table [dbo].[GRtblMenuPrincipal]    Script Date: 21/10/2021 01:34:31 p. m. ******/
DROP TABLE [dbo].[GRtblMenuPrincipal]
GO
/****** Object:  Table [dbo].[GRtblMenuPrincipal]    Script Date: 21/10/2021 01:34:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRtblMenuPrincipal](
	[NodoMenuId] [int] IDENTITY(1,1) NOT NULL,
	[Etiqueta] [varchar](100) NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[TipoNodoId] [int] NOT NULL,
	[NodoPadreId] [int] NULL,
	[SistemaAccesoId] [int] NOT NULL,
	[Url] [varchar](255) NULL,
	[Icono] [varchar](50) NULL,
	[AdmitePermiso] [bit] NOT NULL,
	[Orden] [tinyint] NOT NULL,
	[EstatusId] [int] NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_GRtblMenuPrincipal] PRIMARY KEY CLUSTERED 
(
	[NodoMenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRtblRol]    Script Date: 21/10/2021 01:34:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRtblRol](
	[RolId] [tinyint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_GRtblRol] PRIMARY KEY CLUSTERED 
(
	[RolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRtblRolMenu]    Script Date: 21/10/2021 01:34:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRtblRolMenu](
	[RolMenuId] [int] IDENTITY(1,1) NOT NULL,
	[RolId] [tinyint] NOT NULL,
	[NodoMenuId] [int] NOT NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_GRtblRolMenu] PRIMARY KEY CLUSTERED 
(
	[RolMenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GRtblRol] ADD  CONSTRAINT [DF_GRtblRol_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[GRtblRolMenu] ADD  CONSTRAINT [DF_GRtblRolMenu_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[GRtblMenuPrincipal]  WITH CHECK ADD  CONSTRAINT [FK_GRtblMenuPrincipal_GRtblControlMaestro] FOREIGN KEY([EstatusId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[GRtblMenuPrincipal] CHECK CONSTRAINT [FK_GRtblMenuPrincipal_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[GRtblRol]  WITH CHECK ADD  CONSTRAINT [FK_GRtblRol_GRtblControlMaestro] FOREIGN KEY([EstatusId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[GRtblRol] CHECK CONSTRAINT [FK_GRtblRol_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[GRtblRol]  WITH CHECK ADD  CONSTRAINT [FK_GRtblRol_GRtblUsuario] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[GRtblRol] CHECK CONSTRAINT [FK_GRtblRol_GRtblUsuario]
GO
ALTER TABLE [dbo].[GRtblRol]  WITH CHECK ADD  CONSTRAINT [FK_GRtblRol_GRtblUsuario1] FOREIGN KEY([ModificadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[GRtblRol] CHECK CONSTRAINT [FK_GRtblRol_GRtblUsuario1]
GO
ALTER TABLE [dbo].[GRtblRolMenu]  WITH CHECK ADD  CONSTRAINT [FK_GRtblRolMenu_GRtblControlMaestro] FOREIGN KEY([EstatusId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[GRtblRolMenu] CHECK CONSTRAINT [FK_GRtblRolMenu_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[GRtblRolMenu]  WITH CHECK ADD  CONSTRAINT [FK_GRtblRolMenu_GRtblMenuPrincipal] FOREIGN KEY([NodoMenuId])
REFERENCES [dbo].[GRtblMenuPrincipal] ([NodoMenuId])
GO
ALTER TABLE [dbo].[GRtblRolMenu] CHECK CONSTRAINT [FK_GRtblRolMenu_GRtblMenuPrincipal]
GO
ALTER TABLE [dbo].[GRtblRolMenu]  WITH CHECK ADD  CONSTRAINT [FK_GRtblRolMenu_GRtblRol] FOREIGN KEY([RolId])
REFERENCES [dbo].[GRtblRol] ([RolId])
GO
ALTER TABLE [dbo].[GRtblRolMenu] CHECK CONSTRAINT [FK_GRtblRolMenu_GRtblRol]
GO
ALTER TABLE [dbo].[GRtblRolMenu]  WITH CHECK ADD  CONSTRAINT [FK_GRtblRolMenu_GRtblUsuario] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[GRtblRolMenu] CHECK CONSTRAINT [FK_GRtblRolMenu_GRtblUsuario]
GO
ALTER TABLE [dbo].[GRtblRolMenu]  WITH CHECK ADD  CONSTRAINT [FK_GRtblRolMenu_GRtblUsuario1] FOREIGN KEY([ModificadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[GRtblRolMenu] CHECK CONSTRAINT [FK_GRtblRolMenu_GRtblUsuario1]
GO
