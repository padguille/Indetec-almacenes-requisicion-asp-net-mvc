SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[ARspGetFechaConFormato] @date DATETIME, @mostrarHoras BIT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT dbo.getFechaConFormato(@date, @mostrarHoras) AS ValorSalida

END