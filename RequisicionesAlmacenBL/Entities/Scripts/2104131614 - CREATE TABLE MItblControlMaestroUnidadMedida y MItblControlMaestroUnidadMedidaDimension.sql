SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MItblControlMaestroUnidadMedida](
	[UnidadMedidaId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[Borrado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_MItblControlMaestroUnidadMedida] PRIMARY KEY CLUSTERED 
(
	[UnidadMedidaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MItblControlMaestroUnidadMedidaDimension]    Script Date: 13/04/2021 04:18:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MItblControlMaestroUnidadMedidaDimension](
	[UnidadMedidaDimensionId] [int] IDENTITY(1,1) NOT NULL,
	[UnidadMedidaId] [int] NOT NULL,
	[DimensionId] [int] NOT NULL,
	[Borrado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_MItblControlMaestroUnidadMedidaDimension] PRIMARY KEY CLUSTERED 
(
	[UnidadMedidaDimensionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MItblControlMaestroUnidadMedida] ADD  CONSTRAINT [DF_MItblControlMaestroUnidadMedida_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[MItblControlMaestroUnidadMedidaDimension] ADD  CONSTRAINT [DF_MItblControlMaestroUnidadMedidaDimension_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
