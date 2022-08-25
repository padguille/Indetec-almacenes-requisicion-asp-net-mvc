SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================
-- Author:		Javier El�as
-- Create date: 16/02/2021
-- Modified date: 19/08/2022
-- Description:	Procesador de Inventarios
-- ==============================================
CREATE OR ALTER PROCEDURE [dbo].[ARspProcesadorInventarios]
	@TipoMovimientoId INT,
	@MotivoMovto VARCHAR(MAX),	
	@CreadoPorId INT,
	@InsertarAgrupador BIT,
	@ReferenciaMovtoId INT,
	@PolizaId INT,
	@NumeroOficio VARCHAR(25),
	@Observaciones VARCHAR(2000),
	@Movimientos ARudtInventarioMovimiento READONLY
AS
BEGIN
		SET NOCOUNT ON;

		--THROWS
		DECLARE @mensaje VARCHAR(MAX) = 'No es posible afectar el inventario. '

		DECLARE @51000 VARCHAR(MAX) = @mensaje + 'El art�culo [@Producto] con cuenta presupuestal [@CuentaPresupuestalId] no puede tener existencia negativa.'
		DECLARE @51001 VARCHAR(MAX) = @mensaje + 'Existe un inventario iniciado para el almac�n [@Almacen].'
		DECLARE @51002 VARCHAR(MAX) = @mensaje + 'Es necesario realizar la Configuraci�n de Fechas correspondiente.'
		DECLARE @51003 VARCHAR(MAX) = @mensaje + 'La Fecha de Operaci�n no puede ser menor al @FechaMinima'
		DECLARE @51004 VARCHAR(MAX) = @mensaje + 'No existe un periodo abierto para realizar el movimiento.'
		DECLARE @51005 VARCHAR(MAX) = @mensaje + 'La Fecha de Operaci�n no puede ser mayor a la fecha actual.'

		-- Obtenemos la Fecha de Operaci�n para registrar los movimientos
		DECLARE @fechaSistema DATE = ( SELECT TOP 1 CASE WHEN TipoConfiguracionFechaId = 137 THEN FechaOperacion ELSE GETDATE() END FROM GRtblConfiguracionEnte WHERE EstatusId = 1 )
		DECLARE @fechaOperacion DATETIME = ( CONVERT(CHAR(8), @fechaSistema, 112) + ' ' + CONVERT(CHAR(8), GETDATE(), 108) )
		DECLARE @fechaMinima DATETIME = ( SELECT MAX(FechaCreacion) FROM ARtblInventarioMovimiento )
		DECLARE @periodoAbierto INT = ( SELECT COUNT(Ejercicio) FROM tblAdministracionPeriodo WHERE Ejercicio = YEAR(@fechaOperacion) AND Mes = MONTH(@fechaOperacion) AND TipoPoliza = 'P' AND Status = 1 )

		--Validamos las Fechas
		IF ( @fechaOperacion IS NULL )
		BEGIN 
			SET @mensaje = @51002;
			THROW 51002, @mensaje, 1;
		END

		ELSE IF ( @fechaOperacion > GETDATE() )
		BEGIN 
			SET @mensaje = @51005;
			THROW 51005, @mensaje, 1;
		END

		ELSE IF ( @periodoAbierto = 0 )
		BEGIN 
			SET @mensaje = @51004;
			THROW 51004, @mensaje, 1;
		END

		ELSE IF ( @fechaMinima IS NOT NULL AND CONVERT(DATE, @fechaOperacion) < CONVERT(DATE, @fechaMinima) )
		BEGIN 
			SET @mensaje = REPLACE(@51003, '@FechaMinima', CONVERT(VARCHAR, @fechaMinima, 103));
			THROW 51003, @mensaje, 1;
		END

		--Creamos el Id del Inventario Agrupador
		DECLARE @InventarioMovtoAgrupadorId INT = NULL

		--Si se va a usar un agrupador se inserta el registro en la tabla y se obtiene el Id
		IF ( @InsertarAgrupador = 1 AND (@ReferenciaMovtoId IS NULL OR @ReferenciaMovtoId != -1) )
		BEGIN

				DECLARE @ejercicio INT = ( SELECT YEAR(@fechaOperacion) )
				DECLARE @autonumerico VARCHAR(20)
				
				--Obtenemos el Autonumerico del Agrupador
				EXECUTE GRspAutonumericoSigIncr 'Inventario Movimiento Agrupador', @ejercicio, @autonumerico OUTPUT
				
				DECLARE @tmp TABLE(id INT)

				--Insertamos el registro Agrupador
				INSERT INTO ARtblInventarioMovimientoAgrupador
				(
					--InventarioMovtoAgrupadorId - this column value is auto-generated
					CodigoAgrupador,
					TipoMovimientoId,
					ReferenciaMovtoId,
					PolizaId,
					NumeroOficio,
					Observaciones,
					FechaCreacion,
					CreadoPorId
				)
				OUTPUT INSERTED.InventarioMovtoAgrupadorId INTO @tmp
				VALUES
				(
					-- InventarioMovtoAgrupadorId - int
					@autonumerico, -- CodigoAgrupador - varchar
					@TipoMovimientoId, -- TipoMovimientoId - int
					@ReferenciaMovtoId, -- ReferenciaMovtoId - int
					@PolizaId, -- PolizaId - int
					@NumeroOficio, -- CodigoAgrupador - varchar
					@Observaciones, -- CodigoAgrupador - varchar
					@fechaOperacion, -- FechaCreacion - datetime
					@CreadoPorId -- CreadoPorId - int
				)

				--Obtenemos el Id del Agrupador insertado
				SELECT @InventarioMovtoAgrupadorId = id FROM @tmp
		END
		
		--Tabla temporal para recorrer los Movimientos
		DECLARE @movimientosTemp TABLE ( AlmacenProductoId INT, CantidadMovimiento DECIMAL(28, 10), CostoUnitario MONEY, ReferenciaMovtoId INT, Contador INT )

		INSERT INTO @movimientosTemp
		SELECT AlmacenProductoId, CantidadMovimiento, CostoUnitario, ReferenciaMovtoId, ROW_NUMBER() OVER (ORDER BY ReferenciaMovtoId, CantidadMovimiento) FROM @Movimientos

		DECLARE @contadorMovimientos INT = ( SELECT COUNT(AlmacenProductoId) FROM @movimientosTemp )
		DECLARE @contador INT = 1

		--Recorremos la tabla temporal
		WHILE ( @contador <= @contadorMovimientos )
		BEGIN				
				DECLARE @AlmacenProductoId INT
				DECLARE @CantidadMovimiento DECIMAL(28, 10)
				DECLARE @CostoUnitario MONEY
				DECLARE @ReferenciaMovtoIdDetalle INT

				--Obtenemos los datos del movimiento
				SELECT @AlmacenProductoId = AlmacenProductoId, @CantidadMovimiento = CantidadMovimiento, @CostoUnitario = CostoUnitario, @ReferenciaMovtoIdDetalle = ReferenciaMovtoId FROM @movimientosTemp WHERE Contador = @contador

				DECLARE @Producto VARCHAR(250)
				DECLARE @CuentaPresupuestalId INT
				DECLARE @UnidadMedidaId INT
				DECLARE @TipoCostoArticuloId INT
				DECLARE @CostoPromedio MONEY
				DECLARE @CantidadAntesMovto DECIMAL(28, 10)
				DECLARE @Almacen VARCHAR (100)

				--Buscamos si existe un Inventario F�sico iniciado
				SELECT @Almacen = almacen.Nombre
				FROM ARtblInventarioFisico AS inventario
					 INNER JOIN ARtblAlmacenProducto AS ap ON inventario.AlmacenId = ap.AlmacenId AND ap.AlmacenProductoId = @AlmacenProductoId
					 INNER JOIN tblAlmacen AS almacen ON inventario.AlmacenId = almacen.AlmacenId
				WHERE inventario.EstatusId = 32 -- En Proceso
					  AND inventario.InventarioFisicoId != CASE WHEN @TipoMovimientoId = 35	/*Inventario F�sico*/ THEN @ReferenciaMovtoId ELSE -1 END

				--Validamos que el inventario no est� iniciado
				IF ( @Almacen IS NOT NULL )
				BEGIN
					SET @mensaje = (REPLACE(@51001, '@Almacen', @Almacen));
					THROW 51001, @mensaje, 1;
				END

				--Buscamos los datos del producto a afectar
				SELECT @Producto = producto.Descripcion,
						@CuentaPresupuestalId = CuentaPresupuestalId,
						@UnidadMedidaId = UnidadDeMedidaId,
						@TipoCostoArticuloId = 110, -- Promedio
						@CostoPromedio = CostoPromedio,
						@CantidadAntesMovto = Cantidad
				FROM ARtblAlmacenProducto AS almacen
						INNER JOIN tblProducto AS producto ON almacen.ProductoId = producto.ProductoId
				WHERE almacen.AlmacenProductoId = @AlmacenProductoId

				--Validamos que el inventario no pueda ajustar a existencia negativa
				IF ( (@CantidadAntesMovto + @CantidadMovimiento) < 0 )
				BEGIN 
					SET @mensaje = (REPLACE(REPLACE(@51000, '@Producto', @Producto), '@CuentaPresupuestalId', @CuentaPresupuestalId));
					THROW 51000, @mensaje, 1;
				END

				--Insertamos el Movimiento
				INSERT INTO ARtblInventarioMovimiento
				(
					--InventarioMovtoId - this column value is auto-generated
					InventarioMovtoAgrupadorId,
					AlmacenProductoId,
					UnidadMedidaId,
					CantidadMovimiento,
					TipoMovimientoId,
					CantidadAntesMovto,
					TipoCostoArticuloId,
					CostoUnitario,
					CostoPromedio,
					MotivoMovto,
					ReferenciaMovtoId,
					FechaCreacion,
					CreadoPorId
				)
				VALUES
				(
					@InventarioMovtoAgrupadorId,
					@AlmacenProductoId,
					@UnidadMedidaId,
					@CantidadMovimiento,
					@TipoMovimientoId,
					@CantidadAntesMovto,
					@TipoCostoArticuloId,
					ISNULL(@CostoUnitario, @CostoPromedio),
					@CostoPromedio,
					ISNULL(@MotivoMovto, ''),
					@ReferenciaMovtoIdDetalle,
					@fechaOperacion,
					@CreadoPorId
				)

				--Actualizamos la cantidad en la tabla de tblAlmacenProducto
				UPDATE ARtblAlmacenProducto SET Cantidad = @CantidadAntesMovto + @CantidadMovimiento, FechaUltimaModificacion = GETDATE(), ModificadoPorId = @CreadoPorId WHERE AlmacenProductoId = @AlmacenProductoId

				--Aumentamos el contador para recorrer
				SET @contador = @contador + 1
		END

		--Regresamos el Id del Inventario Agrupador insertado
		SELECT ISNULL(@InventarioMovtoAgrupadorId, -1)
END
GO