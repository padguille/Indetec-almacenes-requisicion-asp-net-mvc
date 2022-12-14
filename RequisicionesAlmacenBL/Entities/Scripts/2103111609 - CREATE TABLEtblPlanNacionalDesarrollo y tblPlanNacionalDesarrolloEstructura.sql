SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MItblPlanDesarrollo](
	[PlanDesarolloId] [int] IDENTITY(1,1) NOT NULL,
	[NombrePlan] [varchar](max) NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[FechaFin] [datetime] NOT NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_MItbPlanDesarrollo] PRIMARY KEY CLUSTERED 
(
	[PlanDesarolloId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPlanNacionalDesarrolloEstructura]    Script Date: 12/03/2021 10:02:48 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MItblPlanDesarrolloEstructura](
	[PlanDesarrolloEstructuraId] [int] IDENTITY(1,1) NOT NULL,
	[PlanDesarrolloId] [int] NOT NULL,
	[NivelGobiernoId] [int] NOT NULL,
	[EstructuraPadreId] [int] NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Etiqueta] [varchar](150) NOT NULL,
	[Orden] [int] NOT NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_MItblPlanDesarrolloEstructura] PRIMARY KEY CLUSTERED 
(
	[PlanDesarrolloEstructuraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MItblPlanDesarrollo] ADD  CONSTRAINT [DF_MItbPlanNacionalDesarrollo_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[MItblPlanDesarrolloEstructura] ADD  CONSTRAINT [DF_MItblPlanNacionalDesarrolloEstructura_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
