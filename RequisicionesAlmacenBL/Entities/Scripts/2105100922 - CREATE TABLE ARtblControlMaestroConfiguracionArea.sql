SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARtblControlMaestroConfiguracionArea](
	[ConfiguracionAreaId] [int] IDENTITY(1,1) NOT NULL,
	[AreaId] [varchar](6) NOT NULL,
	[Comentarios] [varchar](max) NULL,
	[Borrado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ARtblControlMaestroConfiguracionArea] PRIMARY KEY CLUSTERED 
(
	[ConfiguracionAreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ARtblControlMaestroConfiguracionAreaProyecto]    Script Date: 11/05/2021 09:17:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARtblControlMaestroConfiguracionAreaProyecto](
	[ConfiguracionAreaProyectoId] [int] IDENTITY(1,1) NOT NULL,
	[ConfiguracionAreaId] [int] NOT NULL,
	[ProyectoDependenciaId] [int] NOT NULL,
	[Borrado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ARtblControlMaestroConfiguracionAreaProyecto] PRIMARY KEY CLUSTERED 
(
	[ConfiguracionAreaProyectoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ARtblControlMaestroConfiguracionArea] ADD  CONSTRAINT [DF_ARtblControlMaestroConfiguracionArea_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[ARtblControlMaestroConfiguracionAreaProyecto] ADD  CONSTRAINT [DF_ARtblControlMaestroConfiguracionAreaProyecto_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
