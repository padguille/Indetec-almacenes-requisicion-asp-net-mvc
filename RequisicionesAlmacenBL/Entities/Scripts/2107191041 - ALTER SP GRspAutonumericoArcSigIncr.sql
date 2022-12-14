SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[GRspAutonumericoArcSigIncr]
AS
	UPDATE GRtblControlMaestro
	SET Valor = CAST((CAST(Valor AS bigint) + 1) AS nvarchar(max))
	WHERE Control = 'IdAutonumericoArchivo'

	SELECT [dbo].[GRfnGetCodigoFormateadoAutonumerico] ([dbo].[GRfnConvertToBase] (CAST(Valor AS bigint),32))
	FROM GRtblControlMaestro
	WHERE Control = 'IdAutonumericoArchivo'