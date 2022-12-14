
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRtblAlerta](
	[AlertaId] [bigint] IDENTITY(1,1) NOT NULL,
	[AlertaDefinicionId] [int] NOT NULL,
	[ReferenciaProcesoId] [int] NOT NULL,
	[CodigoTramite] [nvarchar](50) NULL,
	[TextoRepresentativo] [nvarchar](255) NULL,
	[EstatusId] [int] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaFinalizacion] [datetime] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_GRtblAlerta] PRIMARY KEY CLUSTERED 
(
	[AlertaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRtblAlertaAutorizacion]    Script Date: 26/01/2022 01:45:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRtblAlertaAutorizacion](
	[AlertaAutorizacionId] [bigint] IDENTITY(1,1) NOT NULL,
	[AlertaId] [bigint] NOT NULL,
	[EmpleadoId] [int] NOT NULL,
	[EstatusId] [int] NOT NULL,
	[MotivoRechazo] [nvarchar](2000) NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaAtendido] [datetime] NULL,
	[Vista] [bit] NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_GRtblAlertaAutorizacion] PRIMARY KEY CLUSTERED 
(
	[AlertaAutorizacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRtblAlertaConfiguracion]    Script Date: 26/01/2022 01:45:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRtblAlertaConfiguracion](
	[AlertaConfiguracionId] [int] IDENTITY(1,1) NOT NULL,
	[AlertaEtapaAccionId] [int] NOT NULL,
	[EmpleadoId] [int] NULL,
	[FiguraId] [int] NULL,
	[TipoNotificacionId] [int] NOT NULL,
	[EnPlataforma] [bit] NOT NULL,
	[EnCorreoElectronico] [bit] NOT NULL,
	[Sistema] [bit] NOT NULL,
	[EstatusId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[CreadoPorId] [int] NOT NULL,
	[FechaUltimaModificacion] [datetime] NULL,
	[ModificadoPorId] [int] NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_GRtblAlertaConfiguracion] PRIMARY KEY CLUSTERED 
(
	[AlertaConfiguracionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRtblAlertaDefinicion]    Script Date: 26/01/2022 01:45:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRtblAlertaDefinicion](
	[AlertaDefinicionId] [int] IDENTITY(1,1) NOT NULL,
	[NombreCorto] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](255) NULL,
	[AlertaEtapaAccionId] [int] NOT NULL,
	[NodoMenuId] [int] NOT NULL,
	[RutaAccion] [nvarchar](100) NULL,
	[TablaReferencia] [nvarchar](100) NULL,
	[CampoId] [nvarchar](50) NULL,
	[CampoCodigo] [nvarchar](50) NULL,
	[CampoEstadoRegistro] [nvarchar](50) NULL,
	[NuevoEstado] [int] NULL,
	[CambiarEstatusATramite] [bit] NOT NULL,
	[EtapaAccionAlAutorizarId] [int] NULL,
	[EtapaAccionAlRechazarId] [int] NULL,
	[EtapaAccionAlRevisionId] [int] NULL,
	[Borrado] [bit] NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
	[RutaAccionNodoMenuId] [int] NOT NULL,
 CONSTRAINT [PK_GRtblAlertaDefinicion] PRIMARY KEY CLUSTERED 
(
	[AlertaDefinicionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRtblAlertaEtapaAccion]    Script Date: 26/01/2022 01:45:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRtblAlertaEtapaAccion](
	[AlertaEtapaAccionId] [int] IDENTITY(1,1) NOT NULL,
	[EtapaId] [int] NOT NULL,
	[AccionId] [int] NOT NULL,
	[PermiteAutorizacion] [bit] NOT NULL,
	[PermiteNotificacion] [bit] NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_GRtblListadoAlertaEtapaAccion] PRIMARY KEY CLUSTERED 
(
	[AlertaEtapaAccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRtblAlertaNotificacion]    Script Date: 26/01/2022 01:45:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRtblAlertaNotificacion](
	[AlertaNotificacionId] [bigint] IDENTITY(1,1) NOT NULL,
	[AlertaId] [bigint] NOT NULL,
	[EmpleadoId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaAtendido] [datetime] NULL,
	[Vista] [bit] NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_GRtblAlertaNotificacion] PRIMARY KEY CLUSTERED 
(
	[AlertaNotificacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GRtblAlerta] ADD  CONSTRAINT [DF_GRtblAlerta_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[GRtblAlertaAutorizacion] ADD  CONSTRAINT [DF_GRtblAlertaAutorizacion_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[GRtblAlertaConfiguracion] ADD  CONSTRAINT [DF_GRtblAlertaConfiguracion_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[GRtblAlertaNotificacion] ADD  CONSTRAINT [DF_GRtblAlertaNotificacion_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[GRtblAlerta]  WITH CHECK ADD  CONSTRAINT [FK_GRtblAlerta_GRtblControlMaestro] FOREIGN KEY([EstatusId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[GRtblAlerta] CHECK CONSTRAINT [FK_GRtblAlerta_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[GRtblAlerta]  WITH CHECK ADD  CONSTRAINT [FK_GRtblAlerta_GRtblUsuario] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[GRtblAlerta] CHECK CONSTRAINT [FK_GRtblAlerta_GRtblUsuario]
GO
ALTER TABLE [dbo].[GRtblAlerta]  WITH CHECK ADD  CONSTRAINT [FK_GRtblAlerta_tblAlertaDefinicion] FOREIGN KEY([AlertaDefinicionId])
REFERENCES [dbo].[GRtblAlertaDefinicion] ([AlertaDefinicionId])
GO
ALTER TABLE [dbo].[GRtblAlerta] CHECK CONSTRAINT [FK_GRtblAlerta_tblAlertaDefinicion]
GO
ALTER TABLE [dbo].[GRtblAlertaAutorizacion]  WITH CHECK ADD  CONSTRAINT [FK_GRtblAlertaAutorizacion_GRtblAlerta] FOREIGN KEY([AlertaId])
REFERENCES [dbo].[GRtblAlerta] ([AlertaId])
GO
ALTER TABLE [dbo].[GRtblAlertaAutorizacion] CHECK CONSTRAINT [FK_GRtblAlertaAutorizacion_GRtblAlerta]
GO
ALTER TABLE [dbo].[GRtblAlertaAutorizacion]  WITH CHECK ADD  CONSTRAINT [FK_GRtblAlertaAutorizacion_GRtblControlMaestro] FOREIGN KEY([EstatusId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[GRtblAlertaAutorizacion] CHECK CONSTRAINT [FK_GRtblAlertaAutorizacion_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[GRtblAlertaAutorizacion]  WITH CHECK ADD  CONSTRAINT [FK_GRtblAlertaAutorizacion_RHtblEmpleado] FOREIGN KEY([EmpleadoId])
REFERENCES [dbo].[RHtblEmpleado] ([EmpleadoId])
GO
ALTER TABLE [dbo].[GRtblAlertaAutorizacion] CHECK CONSTRAINT [FK_GRtblAlertaAutorizacion_RHtblEmpleado]
GO
ALTER TABLE [dbo].[GRtblAlertaConfiguracion]  WITH CHECK ADD  CONSTRAINT [FK_GRtblAlertaConfiguracion_GRtblAlertaEtapaAccion] FOREIGN KEY([AlertaEtapaAccionId])
REFERENCES [dbo].[GRtblAlertaEtapaAccion] ([AlertaEtapaAccionId])
GO
ALTER TABLE [dbo].[GRtblAlertaConfiguracion] CHECK CONSTRAINT [FK_GRtblAlertaConfiguracion_GRtblAlertaEtapaAccion]
GO
ALTER TABLE [dbo].[GRtblAlertaConfiguracion]  WITH CHECK ADD  CONSTRAINT [FK_GRtblAlertaConfiguracion_GRtblControlMaestro] FOREIGN KEY([TipoNotificacionId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[GRtblAlertaConfiguracion] CHECK CONSTRAINT [FK_GRtblAlertaConfiguracion_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[GRtblAlertaConfiguracion]  WITH CHECK ADD  CONSTRAINT [FK_GRtblAlertaConfiguracion_GRtblControlMaestro1] FOREIGN KEY([EstatusId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[GRtblAlertaConfiguracion] CHECK CONSTRAINT [FK_GRtblAlertaConfiguracion_GRtblControlMaestro1]
GO
ALTER TABLE [dbo].[GRtblAlertaConfiguracion]  WITH CHECK ADD  CONSTRAINT [FK_GRtblAlertaConfiguracion_GRtblControlMaestro2] FOREIGN KEY([FiguraId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[GRtblAlertaConfiguracion] CHECK CONSTRAINT [FK_GRtblAlertaConfiguracion_GRtblControlMaestro2]
GO
ALTER TABLE [dbo].[GRtblAlertaConfiguracion]  WITH CHECK ADD  CONSTRAINT [FK_GRtblAlertaConfiguracion_GRtblUsuario] FOREIGN KEY([CreadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[GRtblAlertaConfiguracion] CHECK CONSTRAINT [FK_GRtblAlertaConfiguracion_GRtblUsuario]
GO
ALTER TABLE [dbo].[GRtblAlertaConfiguracion]  WITH CHECK ADD  CONSTRAINT [FK_GRtblAlertaConfiguracion_GRtblUsuario1] FOREIGN KEY([ModificadoPorId])
REFERENCES [dbo].[GRtblUsuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[GRtblAlertaConfiguracion] CHECK CONSTRAINT [FK_GRtblAlertaConfiguracion_GRtblUsuario1]
GO
ALTER TABLE [dbo].[GRtblAlertaConfiguracion]  WITH CHECK ADD  CONSTRAINT [FK_GRtblAlertaConfiguracion_RHtblEmpleado] FOREIGN KEY([EmpleadoId])
REFERENCES [dbo].[RHtblEmpleado] ([EmpleadoId])
GO
ALTER TABLE [dbo].[GRtblAlertaConfiguracion] CHECK CONSTRAINT [FK_GRtblAlertaConfiguracion_RHtblEmpleado]
GO
ALTER TABLE [dbo].[GRtblAlertaDefinicion]  WITH CHECK ADD  CONSTRAINT [FK_GRtblAlertaDefinicion_GRtblAlertaEtapaAccion] FOREIGN KEY([AlertaEtapaAccionId])
REFERENCES [dbo].[GRtblAlertaEtapaAccion] ([AlertaEtapaAccionId])
GO
ALTER TABLE [dbo].[GRtblAlertaDefinicion] CHECK CONSTRAINT [FK_GRtblAlertaDefinicion_GRtblAlertaEtapaAccion]
GO
ALTER TABLE [dbo].[GRtblAlertaDefinicion]  WITH CHECK ADD  CONSTRAINT [FK_GRtblAlertaDefinicion_GRtblMenuPrincipal] FOREIGN KEY([NodoMenuId])
REFERENCES [dbo].[GRtblMenuPrincipal] ([NodoMenuId])
GO
ALTER TABLE [dbo].[GRtblAlertaDefinicion] CHECK CONSTRAINT [FK_GRtblAlertaDefinicion_GRtblMenuPrincipal]
GO
ALTER TABLE [dbo].[GRtblAlertaEtapaAccion]  WITH CHECK ADD  CONSTRAINT [FK_GRtblAlertaEtapaAccion_GRtblControlMaestro] FOREIGN KEY([EtapaId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[GRtblAlertaEtapaAccion] CHECK CONSTRAINT [FK_GRtblAlertaEtapaAccion_GRtblControlMaestro]
GO
ALTER TABLE [dbo].[GRtblAlertaEtapaAccion]  WITH CHECK ADD  CONSTRAINT [FK_GRtblAlertaEtapaAccion_GRtblControlMaestro1] FOREIGN KEY([AccionId])
REFERENCES [dbo].[GRtblControlMaestro] ([ControlId])
GO
ALTER TABLE [dbo].[GRtblAlertaEtapaAccion] CHECK CONSTRAINT [FK_GRtblAlertaEtapaAccion_GRtblControlMaestro1]
GO
ALTER TABLE [dbo].[GRtblAlertaNotificacion]  WITH CHECK ADD  CONSTRAINT [FK_GRtblAlertaNotificacion_GRtblAlerta] FOREIGN KEY([AlertaId])
REFERENCES [dbo].[GRtblAlerta] ([AlertaId])
GO
ALTER TABLE [dbo].[GRtblAlertaNotificacion] CHECK CONSTRAINT [FK_GRtblAlertaNotificacion_GRtblAlerta]
GO
ALTER TABLE [dbo].[GRtblAlertaNotificacion]  WITH CHECK ADD  CONSTRAINT [FK_GRtblAlertaNotificacion_RHtblEmpleado] FOREIGN KEY([EmpleadoId])
REFERENCES [dbo].[RHtblEmpleado] ([EmpleadoId])
GO
ALTER TABLE [dbo].[GRtblAlertaNotificacion] CHECK CONSTRAINT [FK_GRtblAlertaNotificacion_RHtblEmpleado]
GO
/****** Object:  StoredProcedure [dbo].[GRspAutorizarAlerta]    Script Date: 26/01/2022 01:45:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alonso Soto
-- Create date: 11/01/2022
-- Description:	SP para autorizar una Alerta
-- =============================================
CREATE PROCEDURE [dbo].[GRspAutorizarAlerta] 
	@accionId int,
	@creadoPorId INT,
	@alertaId BIGINT,
	@valorSalida NVARCHAR(MAX) OUTPUT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	EXEC GRspProcesadorDeAlertas @accionId = @accionId,
							    @creadoPorId = @creadoPorId,
							    @alertaId = @alertaId,
							    @valorSalida = @valorSalida OUTPUT
END
GO
/****** Object:  StoredProcedure [dbo].[GRspCancelarAlertas]    Script Date: 26/01/2022 01:45:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alonso Soto
-- Create date: 11/01/2022
-- Description:	SP para cancelar alertas
-- =============================================
CREATE PROCEDURE [dbo].[GRspCancelarAlertas] 
	@accionId INT,
	@alertaDefinicionId INT,
	@referenciaProcesoId INT,
	@valorSalida NVARCHAR(MAX) OUTPUT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	EXEC GRspProcesadorDeAlertas @accionId = @accionId,
							    @alertaDefinicionId = @alertaDefinicionId,
							    @referenciaProcesoId = @referenciaProcesoId,
							    @valorSalida = @valorSalida OUTPUT
END
GO
/****** Object:  StoredProcedure [dbo].[GRspIniciarAlerta]    Script Date: 26/01/2022 01:45:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alonso Soto
-- Create date: 11/01/2022
-- Description:	SP para iniciar una alerta
-- =============================================
CREATE PROCEDURE [dbo].[GRspIniciarAlerta] 
	@accionId int,
	@alertaDefinicionId int = null,
	@referenciaProcesoId int = null,
	@codigoTramite nvarchar(50) = null,
	@textoRepresentativo nvarchar(255) = null,
	@creadoPorId INT = NULL,
	@valorSalida NVARCHAR(500) OUTPUT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	EXEC GRspProcesadorDeAlertas @accionId = @accionId
							   ,@alertaDefinicionId = @alertaDefinicionId
							   ,@referenciaProcesoId = @referenciaProcesoId
							   ,@codigoTramite = @codigoTramite
							   ,@textoRepresentativo = @textoRepresentativo
							   ,@creadoPorId = @creadoPorId
							   ,@valorSalida = @valorSalida OUTPUT
END
GO
/****** Object:  StoredProcedure [dbo].[GRspOcultarAlertas]    Script Date: 26/01/2022 01:45:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alonso Soto
-- Create date: 11/01/2022
-- Description:	SP para ocultar alertas del usuario
-- =============================================
CREATE PROCEDURE [dbo].[GRspOcultarAlertas] 
	@accionId int,
	@creadoPorId INT,
	@alertasId NVARCHAR(MAX),
	@valorSalida NVARCHAR(MAX) OUTPUT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	EXEC GRspProcesadorDeAlertas @accionId = @accionId,
							    @creadoPorId = @creadoPorId,
							    @alertasId = @alertasId,
							    @valorSalida = @valorSalida OUTPUT
END
GO
/****** Object:  StoredProcedure [dbo].[GRspProcesadorDeAlertas]    Script Date: 26/01/2022 01:45:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alonso Soto
-- Create date: 11/01/2022
-- Description:	Procesador de Alertas
-- =============================================
CREATE PROCEDURE [dbo].[GRspProcesadorDeAlertas] 
	@accionId int,
	@alertaDefinicionId INT = NULL,
	@referenciaProcesoId INT = NULL,
	@codigoTramite nvarchar(50) = NULL,
	@textoRepresentativo nvarchar(255) = NULL,
	@creadoPorId INT = NULL,
	@alertaId BIGINT = NULL,
	@motivo NVARCHAR(2000) = NULL,
	@alertasId NVARCHAR(MAX) = NULL,
	@valorSalida NVARCHAR(MAX) OUTPUT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @ACCION_INICIAR_ALERTA_ID INT = 112
	DECLARE @ACCION_AUTORIZAR_ALERTA_ID INT = 113
	DECLARE @ACCION_REVISION_ALERTA_ID INT = 114
	DECLARE @ACCION_RECHAZAR_ALERTA_ID INT = 115
	DECLARE @ACCION_OCULTAR_ALERTAS_ID INT = 117
			
	DECLARE @ESTATUS_ALERTA_EN_PROCESO_ID  INT = 118
	DECLARE @ESTATUS_ALERTA_RECHAZADA_ID   INT = 119
	DECLARE @ESTATUS_ALERTA_EN_REVISION_ID INT = 120
	DECLARE @ESTATUS_ALERTA_FINALIZADA_ID  INT = 121

	DECLARE @TIPO_NOTIFICACION_AUTORIZACION_ID INT = 122
	DECLARE @TIPO_NOTIFICACION_NOTIFICACION_ID INT = 123

	--DECLARE @ALERTA_DEFINICION_SOLICITUD_VIATICOS_AUTORIZACION_ID INT = 1
	--DECLARE @ALERTA_DEFINICION_SOLICITUD_VIATICOS_CANCELACION_ID INT = 2
	--DECLARE @ALERTA_DEFINICION_SOLICITUD_VIATICOS_AUTORIZADA_ID INT = 3
	--DECLARE @ALERTA_DEFINICION_SOLICITUD_VIATICOS_RECHAZADA_ID INT = 4
	--DECLARE @ALERTA_DEFINICION_SOLICITUD_VIATICOS_REVISION_ID INT = 5
	--DECLARE @ALERTA_DEFINICION_ASIGNACION_VIATICOS_ID INT = 6
	--DECLARE @ALERTA_DEFINICION_ASIGNACION_VIATICOS_REVISION_ID INT = 7
	--DECLARE @ALERTA_DEFINICION_INFORME_COMPROBACION_FINALIZAR_ID INT = 8
	--DECLARE @ALERTA_DEFINICION_REVISION_FINALIZADA_ID INT = 9
 --   DECLARE @ALERTA_DEFINICION_REVISION_REVISION_VALIDACION_ID INT = 10
 --   DECLARE @ALERTA_DEFINICION_REVISION_VALIDACION_AUTORIZACION_ID INT = 11
 --   DECLARE @ALERTA_DEFINICION_REVISION_VALIDACION_REVISION_ID INT = 12
	
	BEGIN TRY
		--BEGIN TRANSACTION

			DECLARE @alertaTempId BIGINT
			DECLARE @estatusActualAlertaId INT
			DECLARE @empleadoId INT

			DECLARE @actualizarEstatus BIT
			DECLARE @nombreTabla NVARCHAR(100)
			DECLARE @nombreCampoId NVARCHAR(50)
			DECLARE @nombreCampoEstatus NVARCHAR(50)
			DECLARE @valorEstatus INT 
			DECLARE @updateQuery NVARCHAR(MAX)

			DECLARE @tblEmpleadosANotificar TABLE (EmpleadoId INT,
													figuraId INT,
													TipoNotificacionId INT, 
													MedioCorreoElectronico BIT,
													medioPlataforma BIT
													)
			DECLARE @contadorEmpleadosANotificar INT
			DECLARE @contadorFigurasSinEmpleado INT
			DECLARE @permiteAutorizacion BIT
			DECLARE @permiteNotificacion BIT 
			DECLARE @empleadosParaAutorizar INT
			DECLARE @empleadosParaNotificar INT
			DECLARE @contadorEmpleadosNoActivos INT

			--THROWS
			DECLARE @mensaje VARCHAR(MAX) = 'No es posible ' + CASE @accionId 
																				WHEN @ACCION_INICIAR_ALERTA_ID THEN 'Iniciar la Alerta. ' 
																				WHEN @ACCION_AUTORIZAR_ALERTA_ID THEN 'Autorizar el trámite. ' 
																				WHEN @ACCION_REVISION_ALERTA_ID THEN 'Enviar a Revisión el trámite. ' 
																				WHEN @ACCION_RECHAZAR_ALERTA_ID THEN 'Rechazar el trámite. ' 
																			END			
			DECLARE @51000 VARCHAR(MAX) = @mensaje + 'Ya existe un proceso de Alerta Iniciado.'
			DECLARE @51001 VARCHAR(MAX) = @mensaje + 'No existen Empleados configurados a los que Notificar.'
			DECLARE @51002 VARCHAR(MAX) = @mensaje + 'No se encontró Jefe Inmediato al que Notificar, favor de revisar la Configuración de Alertas.'
			DECLARE @51003 VARCHAR(MAX) = @mensaje + 'No existen Empleados configurados para Autorizar.'
			DECLARE @51004 VARCHAR(MAX) = @mensaje + 'No existen Empleados configurados para Notificar.'
			DECLARE @51005 VARCHAR(MAX) = @mensaje + 'Existen Empleados configurados para recibir Alertas que no estan ACTIVOS.'
			DECLARE @51006 VARCHAR(MAX) = @mensaje + 'Alerta no encontrada.'
			DECLARE @51007 VARCHAR(MAX) = @mensaje + 'La alerta ya fue atendida por otro Usuario.'
			DECLARE @51008 VARCHAR(MAX) = @mensaje + 'El Usuario no tiene permisos.'
			DECLARE @51009 VARCHAR(MAX) = @mensaje + 'La alerta ya ha sido cancelada.'
			DECLARE @51010 VARCHAR(MAX) = @mensaje + 'La alerta ya ha sido rechazada.'

			-- Accion Iniciar Alerta
			IF (@accionId = @ACCION_INICIAR_ALERTA_ID)
			BEGIN 
				-- Validamos que:
				-- 1.- No se haya iniciado ya una alerta para el mismo registro
				DECLARE @contadorAlertas INT = 
				(SELECT COUNT(*) 
				 FROM GRtblAlerta 
				 WHERE ReferenciaProcesoId = @referenciaProcesoId AND 
					   AlertaDefinicionId = @alertaDefinicionId AND
					   EstatusId = @ESTATUS_ALERTA_EN_PROCESO_ID
				)

				--Si ya se habia iniciado la alerta, lanzar error
				IF (@contadorAlertas > 0)
					THROW 51000, @51000, 1;				

				-- 2.- Que se haya configurado a alguien para notificar
				INSERT INTO @tblEmpleadosANotificar
				SELECT empleadoId,
						figuraId,
						tipoNotificacionId,
						medioCorreoElectronico,
						medioPlataforma 
				FROM GRfnGetEmpleadosANotificarAlertas(@alertaDefinicionId, @referenciaProcesoId)

				--Obtenemos el numero de empleado a notificar
				SET @contadorEmpleadosANotificar = (SELECT COUNT(*) FROM @tblEmpleadosANotificar)

				--Si no hay ningun empleado configurado para notificar, lanzar error
				IF(@contadorEmpleadosANotificar = 0)
					THROW 51001, @51001, 1;

				--Si hay alguno configurado, validar
				ELSE
				BEGIN					

					--2.1 Que las figuras que aparecen en la configuracion, si se hayan podido ligar a un Empleado, es decir, si en la configuracion
					--de la alerta aparece una figura Jefe Inmediato, verificamos que se haya podido encontrar el Empleado que figura como 
					--Jefe Inmediato para la autorizacion o notificacion.
					SET @contadorFigurasSinEmpleado = (SELECT COUNT(*) FROM @tblEmpleadosANotificar WHERE empleadoId IS NULL AND figuraId IS NOT NULL) 
					IF(@contadorFigurasSinEmpleado > 0)
						THROW 51002, @51002, 1;

					--2.2 Que el empleado configurado sea para el tipo correcto de notificacion de alerta, es decir, que si es una alerta de Tipo Autorizacion
					--exista algun empleado configurado para Autorizar o si el tipo de alerta es de tipo Notificacion haya algun empleado configurado para 
					--recibir la notificacion.
					SELECT @permiteAutorizacion = PermiteAutorizacion, @permiteNotificacion = PermiteNotificacion 
					FROM  GRtblAlertaDefinicion 
							INNER JOIN GRtblAlertaEtapaAccion ON GRtblAlertaDefinicion.AlertaEtapaAccionId = GRtblAlertaEtapaAccion.AlertaEtapaAccionId
					WHERE AlertaDefinicionId = @alertaDefinicionId

					--Si permiteAutorizacion = true, quiere decir, que el tipo de Alerta es Tipo Autorizacion, por lo que en la tabla temporal @tblEmpleadosNotificacion
					--debe existir algun empleado configurado para Autorizar la alerta
					IF(@permiteAutorizacion = 1)
					BEGIN
						SET @empleadosParaAutorizar = (SELECT COUNT(*) FROM @tblEmpleadosANotificar WHERE TipoNotificacionId = @TIPO_NOTIFICACION_AUTORIZACION_ID)
						IF(@empleadosParaAutorizar = 0)
							THROW 51003, @51003, 1;
					END

					--Si @permiteAutorizacion = 0 AND @permiteNotificacion = 1, quiere decir, que el tip de Alerta es de Tipo Notificacion, por lo que en la tabla 
					-- temporal @tblEmpleadosNotificacion debe existir algun empleado configurado para Recibir la alerta
					ELSE IF(@permiteAutorizacion = 0 AND @permiteNotificacion = 1)
					BEGIN
						SET @empleadosParaNotificar = (SELECT COUNT(*) FROM @tblEmpleadosANotificar WHERE TipoNotificacionId = @TIPO_NOTIFICACION_NOTIFICACION_ID)
						IF(@empleadosParaNotificar = 0)
							THROW 51004, @51004, 1;
					END

					--2.3 Que los empleados configurados para recibir las notificaciones esten ACTIVOS
					SET @contadorEmpleadosNoActivos = (
						SELECT COUNT(*) 
						FROM @tblEmpleadosANotificar tblEmpleadosANotificar
						INNER JOIN RHtblEmpleado ON tblEmpleadosANotificar.EmpleadoId = RHtblEmpleado.EmpleadoId
						WHERE RHtblEmpleado.EstatusId <> 1000000
					)

					IF(@contadorEmpleadosNoActivos > 0)
						THROW 51005, @51005, 1;
						
					--Si pasó todas las validaciones, generamos la Alerta y notificamos a todos los empleados configurados
					INSERT INTO GRtblAlerta (AlertaDefinicionId, ReferenciaProcesoId, CodigoTramite, TextoRepresentativo, EstatusId, CreadoPorId, FechaCreacion, FechaFinalizacion)
					VALUES(@alertaDefinicionId, @referenciaProcesoId, @codigoTramite, @textoRepresentativo, CASE WHEN @permiteAutorizacion = 1 THEN  @ESTATUS_ALERTA_EN_PROCESO_ID ELSE @ESTATUS_ALERTA_FINALIZADA_ID END, @creadoPorId, GETDATE(), CASE WHEN @permiteAutorizacion = 0 THEN GETDATE() ELSE NULL END)

					--Recuperamos el Id de la Alerta que se genero
					SET @alertaId = (SELECT SCOPE_IDENTITY())

					--Creamos los registros en Alertas Autorizaciones con los empleados que esten configurados para Autorizar
					INSERT INTO GRtblAlertaAutorizacion (AlertaId, EmpleadoId, EstatusId, MotivoRechazo, FechaCreacion, FechaAtendido, Vista)
					SELECT DISTINCT @alertaId, EmpleadoId, @ESTATUS_ALERTA_EN_PROCESO_ID, NULL, GETDATE(), NULL, 0
					FROM @tblEmpleadosANotificar 
					WHERE TipoNotificacionId = @TIPO_NOTIFICACION_AUTORIZACION_ID AND
							medioPlataforma = 1 AND
							empleadoId IS NOT NULL 

					--Creamos los registros en Alertas Notificaciones con los empleados que esten configurados para ser Notificados
					INSERT INTO GRtblAlertaNotificacion (AlertaId, EmpleadoId, FechaCreacion, FechaAtendido, Vista)
					SELECT DISTINCT @alertaId, EmpleadoId, GETDATE(), NULL, 0
					FROM @tblEmpleadosANotificar 
					WHERE TipoNotificacionId = @TIPO_NOTIFICACION_NOTIFICACION_ID AND
							medioPlataforma = 1 AND
							empleadoId IS NOT NULL 

					--Si la configuracion de la alerta dice que debemos actualizar el estatus del tramite, actualizamos el estatus
					SELECT @actualizarEstatus = CambiarEstatusATramite, 
							@nombreTabla = TablaReferencia, 
							@nombreCampoId = CampoId,
							@nombreCampoEstatus = CampoEstadoRegistro,
							@valorEstatus = NuevoEstado
					FROM GRtblAlertaDefinicion 
					WHERE AlertaDefinicionId = @alertaDefinicionId

					--Si debemos actualizar el estatus del tramite
					IF(@actualizarEstatus = 1)
					BEGIN
						SET @updateQuery = ' UPDATE ' + @nombreTabla + 
											' SET ' + @nombreCampoEstatus + ' = ' + CAST(@valorEstatus AS NVARCHAR(100)) + 
											' WHERE ' + @nombreCampoId + ' = ' + CAST(@referenciaProcesoId AS NVARCHAR(100))
						EXEC(@updateQuery)
 					END

					--Verifiar si se autoriza automáticamente
					IF ( @permiteAutorizacion = 1 )
					BEGIN
						--Buscar al usuario en la tabla de usuarios a autorizar 
						DECLARE @permiteAutorizacionAutomatica BIT = (
							SELECT CASE WHEN COUNT(tmp.EmpleadoId) > 0 THEN 1 ELSE 0 END
							FROM @tblEmpleadosANotificar AS tmp
									INNER JOIN tblSolicitudViatico AS solicitud ON tmp.EmpleadoId = solicitud.EmpleadoId AND solicitud.SolicitudViaticoId = @referenciaProcesoId
							WHERE TipoNotificacionId = @TIPO_NOTIFICACION_AUTORIZACION_ID
						)

						IF ( @permiteAutorizacionAutomatica = 1 )
						BEGIN
							EXEC dbo.sp_AutorizarAlerta
									@accionId = @ACCION_AUTORIZAR_ALERTA_ID,
									@creadoPorId = @creadoPorId,
									@alertaId = @alertaId,
									@valorSalida = @valorSalida OUTPUT
						END
					END

					--Obtenemos el id de la alerta como valor de salida
					SET @valorSalida = ISNULL(@valorSalida, @alertaId)
				END
			END 
			
			-- Accion Autorizar, Revision o Rechazar Alerta
			ELSE IF (@accionId = @ACCION_AUTORIZAR_ALERTA_ID OR 
			         @accionId = @ACCION_REVISION_ALERTA_ID OR 
					 @accionId = @ACCION_RECHAZAR_ALERTA_ID)
			BEGIN
				SELECT @alertaTempId = AlertaId, @estatusActualAlertaId = EstatusId FROM GRtblAlerta WHERE AlertaId = @alertaId
				SELECT @empleadoId = EmpleadoId FROM GRtblUsuario WHERE UsuarioId = @creadoPorId

				--Verificamos que exista la Alerta a Autorizar
				IF(@alertaTempId IS NULL)
					THROW 51006, @51006, 1;

				--Verificamos que la alerta que se pretende autorizar no haya cambiado ya su Estatus o que no se encuentre Vigente
				IF(@estatusActualAlertaId <> @ESTATUS_ALERTA_EN_PROCESO_ID) 
					THROW 51007, @51007, 1;

				SELECT @alertaDefinicionId = AlertaDefinicionId,
					   @referenciaProcesoId = ReferenciaProcesoId 
				FROM GRtblAlerta 
				WHERE AlertaId = @alertaId

				--Obtenemos la nueva AlertaDefinicionId para saber si hay que realizar alguna nueva accion al Autorizar/Rechazar/Revision el tramite
				SET @alertaDefinicionId = (SELECT nuevo.AlertaDefinicionId
										   FROM GRtblAlerta AS alerta
												INNER JOIN GRtblAlertaDefinicion AS original ON alerta.AlertaDefinicionId = original.AlertaDefinicionId
												INNER JOIN GRtblAlertaDefinicion AS nuevo ON nuevo.AlertaEtapaAccionId = CASE @accionId 
																																											WHEN @ACCION_AUTORIZAR_ALERTA_ID THEN original.EtapaAccionAlAutorizarId
																																											WHEN @ACCION_REVISION_ALERTA_ID THEN original.EtapaAccionAlRevisionId
																																											WHEN @ACCION_RECHAZAR_ALERTA_ID THEN original.EtapaAccionAlRechazarId END
										   WHERE AlertaId = @alertaId AND
											     original.Borrado = 0 AND
												 nuevo.Borrado = 0)

				--Si pasó todas las validaciones, se cambia el estatus de la alerta tanto del detalle como de la cabecera
				UPDATE GRtblAlertaAutorizacion
				SET EstatusId = CASE @accionId WHEN @ACCION_AUTORIZAR_ALERTA_ID THEN @ESTATUS_ALERTA_FINALIZADA_ID WHEN @ACCION_REVISION_ALERTA_ID THEN @ESTATUS_ALERTA_EN_REVISION_ID WHEN @ACCION_RECHAZAR_ALERTA_ID THEN @ESTATUS_ALERTA_RECHAZADA_ID END,
					MotivoRechazo = CASE WHEN @accionId = @ACCION_AUTORIZAR_ALERTA_ID THEN NULL ELSE @motivo END,
					FechaAtendido = GETDATE()
				WHERE AlertaId = @alertaId AND
					  EmpleadoId IN ( SELECT EmpleadoId FROM tblUsuario INNER JOIN GRfnGetUsuariosTempANotificarAlertas(@creadoPorId) AS usuarios ON tblUsuario.UsuarioId = usuarios.usuarioId )

				UPDATE GRtblAlerta
				SET EstatusId = CASE @accionId WHEN @ACCION_AUTORIZAR_ALERTA_ID THEN @ESTATUS_ALERTA_FINALIZADA_ID WHEN @ACCION_REVISION_ALERTA_ID THEN @ESTATUS_ALERTA_EN_REVISION_ID WHEN @ACCION_RECHAZAR_ALERTA_ID THEN @ESTATUS_ALERTA_RECHAZADA_ID END,
					FechaFinalizacion = GETDATE()
				WHERE AlertaId = @alertaId

				--Si la configuracion de la alerta dice que debemos actualizar el estatus del tramite, actualizamos el estatus
				SELECT  @actualizarEstatus = CambiarEstatusATramite, 
						@nombreTabla = TablaReferencia, 
						@nombreCampoId = CampoId,
						@nombreCampoEstatus = CampoEstadoRegistro,
						@valorEstatus = NuevoEstado
				FROM GRtblAlertaDefinicion 
				WHERE AlertaDefinicionId = @alertaDefinicionId

				--Si debemos actualizar el estatus del tramite
				IF(@actualizarEstatus = 1)
				BEGIN
					SET @updateQuery = ' UPDATE ' + @nombreTabla + 
									   ' SET ' + @nombreCampoEstatus + ' = ' + CAST(@valorEstatus AS NVARCHAR(100)) + 
									   ' WHERE ' + @nombreCampoId + ' = ' + CAST(@referenciaProcesoId AS NVARCHAR(100))
					EXEC(@updateQuery)
 				END

				--Si hay alguna accion que realizar al Autorizar/Rechazar/Revision el tramite
				IF(@alertaDefinicionId IS NOT NULL)
				BEGIN

					SELECT @codigoTramite = CodigoTramite
					FROM dbo.GRtblAlerta WHERE AlertaId = @alertaId

					--Creamos el texto Representativo
					IF(@accionId = @ACCION_AUTORIZAR_ALERTA_ID)
						SET @textoRepresentativo = 'Solicitud: ' + @codigoTramite + ', Estatus: Autorizado'
					ELSE IF (@accionId = @ACCION_REVISION_ALERTA_ID)
						SET @textoRepresentativo = 'Solicitud: ' + @codigoTramite + ', Estatus: En Revisión, Motivo: ' + @motivo
					ELSE IF (@accionId = @ACCION_RECHAZAR_ALERTA_ID )
						SET @textoRepresentativo = 'Solicitud: ' + @codigoTramite + ', Estatus: Rechazado, Motivo: ' + @motivo

					--E Iniciamos una nueva Alerta
					EXEC dbo.GRspIniciarAlerta @accionId = @ACCION_INICIAR_ALERTA_ID ,  
					                          @alertaDefinicionId = @alertaDefinicionId,
					                          @referenciaProcesoId = @referenciaProcesoId,
					                          @codigoTramite = @codigoTramite,
					                          @textoRepresentativo = @textoRepresentativo,
					                          @creadoPorId = @creadoPorId,
					                          @valorSalida = @valorSalida OUTPUT
					
					--Obtenemos el id de la alerta como valor de salida
					SET @valorSalida = ISNULL(@valorSalida, @alertaId)
				END		
			END

			--Accion Ocultar Alertas
			ELSE IF (@accionId = @ACCION_OCULTAR_ALERTAS_ID)
			BEGIN
				DECLARE @empleados TABLE ( empleadoId INT )
				INSERT INTO @empleados
				SELECT EmpleadoId
				FROM GRtblUsuario
					 INNER JOIN GRfnGetUsuariosTempANotificarAlertas(@creadoPorId) AS usuarios ON tblUsuario.UsuarioId = usuarios.usuarioId

				DECLARE @usuarios VARCHAR(100)
				SELECT @usuarios = REPLACE(STUFF(
				(
					SELECT ','+CAST(empleadoId AS NVARCHAR(100))
					FROM @empleados
					ORDER BY empleadoId FOR XML PATH('')
				), 1, 1, ''), ',', ', ')

				-- SELECT @empleadoId = EmpleadoId FROM tblUsuario WHERE UsuarioId = @creadoPorId
				SET @updateQuery = ' UPDATE GRtblAlertaNotificacion' +
				                   ' SET FechaAtendido = getDate(), ' +
								   '     Vista = 1 ' +
								   ' WHERE AlertaId IN (' + @alertasId + ') AND ' +
								   '       EmpleadoId IN (' + @usuarios + ')'-- + CAST(@empleadoId AS NVARCHAR(100))
				EXEC (@updateQuery)         
			END

		--COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		--ROLLBACK TRANSACTION;
		THROW;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[GRspRevisionRechazarAlerta]    Script Date: 26/01/2022 01:45:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alonso Soto
-- Create date: <Create Date,,>
-- Description:	SP para Rechazar/Revision una alerta
-- =============================================
CREATE PROCEDURE [dbo].[GRspRevisionRechazarAlerta] 
	@accionId int,
	@creadoPorId INT,
	@alertaId BIGINT,
	@motivo NVARCHAR(2000),
	@valorSalida NVARCHAR(MAX) OUTPUT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	EXEC sp_ProcesadorDeAlertas @accionId = @accionId,
							    @creadoPorId = @creadoPorId,
							    @alertaId = @alertaId,
								@motivo = @motivo,
							    @valorSalida = @valorSalida OUTPUT
END
GO
