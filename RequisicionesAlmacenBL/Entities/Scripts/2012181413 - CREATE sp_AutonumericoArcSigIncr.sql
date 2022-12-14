SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AutonumericoArcSigIncr]
AS
	UPDATE tblControlMaestro
	SET Valor = CAST((CAST(Valor AS bigint) + 1) AS nvarchar(max))
	WHERE Control = 'IdAutonumericoArchivo'

	SELECT [dbo].[fn_getCodigoFormateadoAutonumerico] ([dbo].[fn_ConvertToBase] (CAST(Valor AS bigint),32))
	FROM tblControlMaestro
	WHERE Control = 'IdAutonumericoArchivo'