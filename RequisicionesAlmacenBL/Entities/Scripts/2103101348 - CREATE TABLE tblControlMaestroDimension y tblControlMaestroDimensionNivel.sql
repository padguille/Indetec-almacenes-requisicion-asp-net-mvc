SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblControlMaestroDimension](
	[DimensionId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Borrado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_tblControlMaestroDimension] PRIMARY KEY CLUSTERED 
(
	[DimensionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblControlMaestroDimensionNivel]    Script Date: 10/03/2021 01:47:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblControlMaestroDimensionNivel](
	[DimensionNivelId] [int] IDENTITY(1,1) NOT NULL,
	[DimensionId] [int] NOT NULL,
	[NivelId] [int] NOT NULL,
	[Borrado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_tblControlMaestroDimensionNivel] PRIMARY KEY CLUSTERED 
(
	[DimensionNivelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblControlMaestroDimension] ADD  CONSTRAINT [DF_tblControlMaestroDimension_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[tblControlMaestroDimensionNivel] ADD  CONSTRAINT [DF_tblControlMaestroDimensionNivel_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
