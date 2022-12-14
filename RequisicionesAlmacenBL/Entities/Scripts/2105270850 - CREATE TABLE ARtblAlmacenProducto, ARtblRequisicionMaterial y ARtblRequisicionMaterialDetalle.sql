SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARtblAlmacenProducto](
	[AlmacenProductoId] [int] IDENTITY(1,1) NOT NULL,
	[ProductoId] [varchar](10) NOT NULL,
	[AlmacenId] [varchar](4) NOT NULL,
	[CuentaPresupuestalId] [int] NOT NULL,
	[Cantidad] [decimal](28, 10) NOT NULL,
	[Borrado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ARtblAlmacenProducto] PRIMARY KEY CLUSTERED 
(
	[AlmacenProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ARtblRequisicionMaterial]    Script Date: 27/05/2021 08:51:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARtblRequisicionMaterial](
	[RequisicionMaterialId] [int] IDENTITY(1,1) NOT NULL,
	[CodigoRequisicion] [varchar](20) NOT NULL,
	[FechaRequisicion] [datetime] NOT NULL,
	[AreaId] [varchar](6) NOT NULL,
	[UnidadAdministrativaId] [varchar](6) NULL,
	[ProyectoId] [varchar](6) NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ARtblRequisicionMaterial] PRIMARY KEY CLUSTERED 
(
	[RequisicionMaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ARtblRequisicionMaterialDetalle]    Script Date: 27/05/2021 08:51:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARtblRequisicionMaterialDetalle](
	[RequisicionMaterialDetalleId] [int] IDENTITY(1,1) NOT NULL,
	[RequisicionMaterialId] [int] NOT NULL,
	[AlmacenProductoId] [int] NOT NULL,
	[AlmacenId] [varchar](4) NOT NULL,
	[UnidadAdministrativaId] [varchar](6) NOT NULL,
	[ProyectoId] [varchar](6) NOT NULL,
	[FuenteFinanciamientoId] [varchar](6) NOT NULL,
	[TipoGastoId] [varchar](1) NOT NULL,
	[ProductoId] [varchar](10) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[CuentaPresupuestalId] [int] NOT NULL,
	[UnidadMedidaId] [int] NOT NULL,
	[CostoUnitario] [money] NOT NULL,
	[Cantidad] [decimal](28, 10) NOT NULL,
	[TotalPartida] [money] NOT NULL,
	[Comentarios] [varchar](max) NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ARtblRequisicionMaterialDetalle] PRIMARY KEY CLUSTERED 
(
	[RequisicionMaterialDetalleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ARtblAlmacenProducto] ADD  CONSTRAINT [DF_ARtblAlmacenProducto_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[ARtblRequisicionMaterial] ADD  CONSTRAINT [DF_ARtblRequisicionMaterial_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[ARtblRequisicionMaterialDetalle] ADD  CONSTRAINT [DF_ARtblRequisicionMaterialDetalle_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
