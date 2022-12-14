SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MItblMatrizIndicadorResultado](
	[MIRId] [int] IDENTITY(1,1) NOT NULL,
	[Ejercicio] [varchar](4) NOT NULL,
	[PlanNacionalDesarolloId] [int] NOT NULL,
	[PoblacionObjetivo] [varchar](max) NULL,
	[ProgramaPresupuestarioId] [varchar](6) NOT NULL,
	[FechaFinConfiguracion] [datetime] NOT NULL,
	[PlanNacionalDesarrolloEstructuraId] [int] NOT NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_MItblMatrizIndicadorResultado] PRIMARY KEY CLUSTERED 
(
	[MIRId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MItblMatrizIndicadorResultado] ADD  CONSTRAINT [DF_MItblMatrizIndicadorResultado_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
