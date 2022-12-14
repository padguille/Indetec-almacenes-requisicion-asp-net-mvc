SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblControlMaestroTipoIndicador](
	[TipoIndicadorId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Borrado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_tblTipoIndicador] PRIMARY KEY CLUSTERED 
(
	[TipoIndicadorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblControlMaestroTipoIndicadorNivel]    Script Date: 10/03/2021 01:38:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblControlMaestroTipoIndicadorNivel](
	[TipoIndicadorNivelId] [int] IDENTITY(1,1) NOT NULL,
	[TipoIndicadorId] [int] NOT NULL,
	[NivelId] [int] NOT NULL,
	[Borrado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_tblTipoIndicadorNivel] PRIMARY KEY CLUSTERED 
(
	[TipoIndicadorNivelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblControlMaestroTipoIndicador] ADD  CONSTRAINT [DF_tblTipoIndicador_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[tblControlMaestroTipoIndicadorNivel] ADD  CONSTRAINT [DF_tblTipoIndicadorNivel_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
