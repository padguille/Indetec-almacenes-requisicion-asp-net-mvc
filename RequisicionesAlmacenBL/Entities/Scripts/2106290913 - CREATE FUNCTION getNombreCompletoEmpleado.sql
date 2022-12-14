SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER FUNCTION [dbo].[getNombreCompletoEmpleado](@empleadoId INT)
RETURNS NVARCHAR(200)
AS
	BEGIN
		DECLARE @nombreCompleto NVARCHAR(200) = ( SELECT Nombre + ' ' + ApellidoPaterno + ISNULL(' ' + ApellidoMaterno, '') FROM tblEmpleado WHERE EmpleadoId = @empleadoId )

		RETURN @nombreCompleto
	END