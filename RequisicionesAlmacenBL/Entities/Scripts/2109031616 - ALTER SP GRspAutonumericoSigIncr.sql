SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[GRspAutonumericoSigIncr] @nombre VARCHAR(500), @ejercicio INT, @valorSalida VARCHAR(20) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	 SET @ejercicio = CASE WHEN @ejercicio = -1 THEN NULL ELSE @ejercicio END

	 SELECT @valorSalida = Prefijo+ISNULL(CAST(Ejercicio AS VARCHAR(4)), '')+RIGHT('00000000000000000000'+ISNULL(CAST(Siguiente AS VARCHAR(20)), ''), Ceros)
     FROM GRtblAutonumerico
     WHERE Nombre = @nombre
		AND ISNULL(Ejercicio, 0) = ISNULL(@ejercicio, 0)
		AND Activo = 1

     UPDATE GRtblAutonumerico SET Siguiente = Siguiente + 1 WHERE Nombre = @nombre AND ISNULL(Ejercicio, 0) = ISNULL(@ejercicio, 0)

END