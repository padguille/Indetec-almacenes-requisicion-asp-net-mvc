

DROP TABLE MItblMatrizIndicadorResultadoIndicadorFormulaVariable
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MItblMatrizConfiguracionPresupuestalSeguimientoVariable](
	[MIRSeguimientoVariableId] [int] IDENTITY(1,1) NOT NULL,
	[MIRIndicadorFormulaVariableId] [int] NOT NULL,
	[Enero] [money] NULL,
	[Febrero] [money] NULL,
	[Marzo] [money] NULL,
	[Abril] [money] NULL,
	[Mayo] [money] NULL,
	[Junio] [money] NULL,
	[Julio] [money] NULL,
	[Agosto] [money] NULL,
	[Septiembre] [money] NULL,
	[Octubre] [money] NULL,
	[Noviembre] [money] NULL,
	[Diciembre] [money] NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_MItblMatrizConfiguracionPresupuestalSeguimientoVariable] PRIMARY KEY CLUSTERED 
(
	[MIRSeguimientoVariableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MItblMatrizIndicadorResultadoIndicadorFormulaVariable]    Script Date: 19/07/2021 12:31:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MItblMatrizIndicadorResultadoIndicadorFormulaVariable](
	[MIRIndicadorFormulaVariableId] [int] IDENTITY(1,1) NOT NULL,
	[MIRIndicadorId] [int] NOT NULL,
	[UnidadMedidaFormulaVariableId] [int] NOT NULL,
	[DescripcionVariable] [varchar](500) NOT NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_MItblMatrizIndicadorResultadoIndicadorVariable] PRIMARY KEY CLUSTERED 
(
	[MIRIndicadorFormulaVariableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MItblMatrizConfiguracionPresupuestalSeguimientoVariable] ADD  CONSTRAINT [DF_MItblMatrizConfiguracionPresupuestalSeguimientoVariable_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[MItblMatrizIndicadorResultadoIndicadorFormulaVariable] ADD  CONSTRAINT [DF_MItblMatrizIndicadorResultadoIndicadorVariable_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[MItblMatrizConfiguracionPresupuestalSeguimientoVariable]  WITH CHECK ADD  CONSTRAINT [FK_MItblMatrizConfiguracionPresupuestalSeguimientoVariable_GRtblControlMaestro] FOREIGN KEY([EstatusId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[MItblMatrizConfiguracionPresupuestalSeguimientoVariable] CHECK CONSTRAINT [FK_MItblMatrizConfiguracionPresupuestalSeguimientoVariable_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[MItblMatrizConfiguracionPresupuestalSeguimientoVariable]  WITH CHECK ADD  CONSTRAINT [FK_MItblMatrizConfiguracionPresupuestalSeguimientoVariable_GRtblUsuario] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[MItblMatrizConfiguracionPresupuestalSeguimientoVariable] CHECK CONSTRAINT [FK_MItblMatrizConfiguracionPresupuestalSeguimientoVariable_GRtblUsuario]
GO
ALTER TABLE [dbo].[MItblMatrizConfiguracionPresupuestalSeguimientoVariable]  WITH CHECK ADD  CONSTRAINT [FK_MItblMatrizConfiguracionPresupuestalSeguimientoVariable_GRtblUsuario1] FOREIGN KEY([ModificadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[MItblMatrizConfiguracionPresupuestalSeguimientoVariable] CHECK CONSTRAINT [FK_MItblMatrizConfiguracionPresupuestalSeguimientoVariable_GRtblUsuario1]
GO
ALTER TABLE [dbo].[MItblMatrizConfiguracionPresupuestalSeguimientoVariable]  WITH CHECK ADD  CONSTRAINT [FK_MItblMatrizConfiguracionPresupuestalSeguimientoVariable_MItblMatrizIndicadorResultadoIndicadorFormulaVariable] FOREIGN KEY([MIRIndicadorFormulaVariableId])
REFERENCES [dbo].[MItblMatrizIndicadorResultadoIndicadorFormulaVariable] ([MIRIndicadorFormulaVariableId])
GO
ALTER TABLE [dbo].[MItblMatrizConfiguracionPresupuestalSeguimientoVariable] CHECK CONSTRAINT [FK_MItblMatrizConfiguracionPresupuestalSeguimientoVariable_MItblMatrizIndicadorResultadoIndicadorFormulaVariable]
GO
ALTER TABLE [dbo].[MItblMatrizIndicadorResultadoIndicadorFormulaVariable]  WITH CHECK ADD  CONSTRAINT [FK_MItblMatrizIndicadorResultadoIndicadorFormulaVariable_GRtblControlMaestro] FOREIGN KEY([EstatusId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[MItblMatrizIndicadorResultadoIndicadorFormulaVariable] CHECK CONSTRAINT [FK_MItblMatrizIndicadorResultadoIndicadorFormulaVariable_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[MItblMatrizIndicadorResultadoIndicadorFormulaVariable]  WITH CHECK ADD  CONSTRAINT [FK_MItblMatrizIndicadorResultadoIndicadorFormulaVariable_GRtblUsuario] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[MItblMatrizIndicadorResultadoIndicadorFormulaVariable] CHECK CONSTRAINT [FK_MItblMatrizIndicadorResultadoIndicadorFormulaVariable_GRtblUsuario]
GO
ALTER TABLE [dbo].[MItblMatrizIndicadorResultadoIndicadorFormulaVariable]  WITH CHECK ADD  CONSTRAINT [FK_MItblMatrizIndicadorResultadoIndicadorFormulaVariable_GRtblUsuario1] FOREIGN KEY([ModificadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[MItblMatrizIndicadorResultadoIndicadorFormulaVariable] CHECK CONSTRAINT [FK_MItblMatrizIndicadorResultadoIndicadorFormulaVariable_GRtblUsuario1]
GO
ALTER TABLE [dbo].[MItblMatrizIndicadorResultadoIndicadorFormulaVariable]  WITH CHECK ADD  CONSTRAINT [FK_MItblMatrizIndicadorResultadoIndicadorFormulaVariable_MItblControlMaestroUnidadMedidaFormulaVariable] FOREIGN KEY([UnidadMedidaFormulaVariableId])
REFERENCES [dbo].[MItblControlMaestroUnidadMedidaFormulaVariable] ([UnidadMedidaFormulaVariableId])
GO
ALTER TABLE [dbo].[MItblMatrizIndicadorResultadoIndicadorFormulaVariable] CHECK CONSTRAINT [FK_MItblMatrizIndicadorResultadoIndicadorFormulaVariable_MItblControlMaestroUnidadMedidaFormulaVariable]
GO
ALTER TABLE [dbo].[MItblMatrizIndicadorResultadoIndicadorFormulaVariable]  WITH CHECK ADD  CONSTRAINT [FK_MItblMatrizIndicadorResultadoIndicadorFormulaVariable_MItblMatrizIndicadorResultadoIndicador] FOREIGN KEY([MIRIndicadorId])
REFERENCES [dbo].[MItblMatrizIndicadorResultadoIndicador] ([MIRIndicadorId])
GO
ALTER TABLE [dbo].[MItblMatrizIndicadorResultadoIndicadorFormulaVariable] CHECK CONSTRAINT [FK_MItblMatrizIndicadorResultadoIndicadorFormulaVariable_MItblMatrizIndicadorResultadoIndicador]
GO
