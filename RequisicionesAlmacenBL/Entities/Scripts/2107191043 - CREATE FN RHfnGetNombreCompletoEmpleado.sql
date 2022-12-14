CREATE OR ALTER FUNCTION [dbo].[RHfnGetNombreCompletoEmpleado](@empleado_id INT)
RETURNS NVARCHAR(255)
AS
     BEGIN
         DECLARE @respuesta NVARCHAR(255)

         SET @respuesta =
		(
			SELECT Nombre + ' ' + PrimerApellido + ISNULL(' ' + SegundoApellido, '')
			FROM RHtblEmpleado
			WHERE EmpleadoId = @empleado_id
		)
         
		 RETURN @respuesta
     END