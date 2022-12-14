SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MItblMatrizIndicadorResultadoIndicador](
	[MIRIndicadorId] [int] IDENTITY(1,1) NOT NULL,
	[MIRId] [int] NOT NULL,
	[NivelIndicadorId] [int] NOT NULL,
	[NombreIndicador] [varchar](500) NOT NULL,
	[ResumenNarrativo] [varchar](max) NOT NULL,
	[DefinicionIndicadro] [varchar](max) NOT NULL,
	[TipoIndicadorId] [int] NOT NULL,
	[DimensionId] [int] NOT NULL,
	[UnidadMedidaId] [int] NOT NULL,
	[FrecuenciaMedicionId] [int] NOT NULL,
	[SentidoId] [int] NOT NULL,
	[TipoComponenteId] [int] NULL,
	[MIRIndicadorComponenteId] [int] NULL,
	[ProyectoId] [varchar](6) NULL,
	[PorcentajeProyecto] [decimal](18, 2) NULL,
	[MontoProyecto] [decimal](18, 2) NULL,
	[PorcentajeActividad] [decimal](18, 2) NULL,
	[MontoActividad] [decimal](18, 2) NULL,
	[AnioBase] [varchar](4) NOT NULL,
	[ValorBase] [decimal](18, 2) NOT NULL,
	[AceptableDesde] [decimal](18, 2) NOT NULL,
	[AceptableHasta] [decimal](18, 2) NOT NULL,
	[ConRiesgoDesde] [decimal](18, 2) NOT NULL,
	[ConRiesgoHasta] [decimal](18, 2) NOT NULL,
	[CriticoPorDebajo] [decimal](18, 2) NOT NULL,
	[CriticoPorEncima] [decimal](18, 2) NOT NULL,
	[FormulaId] [int] NOT NULL,
	[DescripcionFormula] [varchar](max) NOT NULL,
	[DescripcionVariable1] [varchar](200) NOT NULL,
	[DescripcionVariable2] [varchar](200) NOT NULL,
	[DescripcionVariable3] [varchar](200) NOT NULL,
	[DescripcionVariable4] [varchar](200) NOT NULL,
	[FuenteInformacion] [varchar](max) NOT NULL,
	[MedioVerificacion] [varchar](max) NOT NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_MItblMatrizIndicadorResultadoIndicador] PRIMARY KEY CLUSTERED 
(
	[MIRIndicadorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MItblMatrizIndicadorResultadoIndicadorMeta]    Script Date: 23/04/2021 09:22:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MItblMatrizIndicadorResultadoIndicadorMeta](
	[MIRIndicadorMetaId] [int] IDENTITY(1,1) NOT NULL,
	[MIRIndicadorId] [int] NOT NULL,
	[Etiqueta] [varchar](100) NOT NULL,
	[Valor] [decimal](18, 2) NOT NULL,
	[Orden] [int] NOT NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_MItblMatrizIndicadorResultadoIndicadorMeta] PRIMARY KEY CLUSTERED 
(
	[MIRIndicadorMetaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MItblMatrizIndicadorResultadoIndicador] ADD  CONSTRAINT [DF_MItblMatrizIndicadorResultadoIndicador_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[MItblMatrizIndicadorResultadoIndicadorMeta] ADD  CONSTRAINT [DF_MItblMatrizIndicadorResultadoIndicadorMeta_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
