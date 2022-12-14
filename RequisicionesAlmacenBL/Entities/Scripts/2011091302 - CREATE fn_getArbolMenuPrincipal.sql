SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO


/* Procedimiento para obtener un Arbol con los nodos que corresponden al Menu Principal del sistema
 * Creado: 09/11/2020
 * Creado Por: Alonso Soto
 * Version: 1.00.00 */

ALTER FUNCTION [dbo].[fn_getArbolMenuPrincipal]()
Returns @Tree Table(NodoMenuId INT PRIMARY KEY NOT NULL,
					Etiqueta varchar(100) NOT NULL,
					Descripcion varchar(255) NULL,
					TipoNodoId INT NOT NULL,
					NodoPadreId INT NULL,
					SistemaAccesoId INT NOT NULL,
					Url varchar(255) NULL,
					Icono varchar(50) NULL,
					AdmitePermiso BIT NOT NULL,
					Orden TINYINT NOT NULL,
					EstatusId INT NOT NULL,
					[Timestamp] BINARY NOT NULL
		   )
	AS
	BEGIN		
		WITH MenuPrincipalCTE (NodoMenuId, Etiqueta, Descripcion, TipoNodoId, NodoPadreId, SistemaAccesoId, Url, Icono, AdmitePermiso, Orden, EstatusId, Ordenamiento, Timestamp)
		AS
		(
			SELECT NodoMenuId,
				   Etiqueta,
				   Descripcion,
				   TipoNodoId,
				   NodoPadreId,
				   SistemaAccesoId,
				   Url,
				   Icono,
				   AdmitePermiso,
				   Orden,
				   EstatusId,
				   CAST(RIGHT('00000' + Ltrim(Rtrim(ROW_NUMBER() OVER(ORDER BY Orden))),5) AS VARCHAR(255)) AS Ordenamiento,
				   Timestamp
			FROM tblMenuPrincipal 
			WHERE NodoPadreId IS NULL AND EstatusId = 1

			UNION ALL
		    
			SELECT tbl.NodoMenuId,
				   tbl.Etiqueta,
				   tbl.Descripcion,
				   tbl.TipoNodoId,
				   tbl.NodoPadreId,
				   tbl.SistemaAccesoId,
				   tbl.Url,
				   tbl.Icono,
				   tbl.AdmitePermiso,
				   tbl.Orden,
				   tbl.EstatusId,
				   CAST(MenuPrincipalCTE.Ordenamiento + '.' + RIGHT('00000' + Ltrim(Rtrim(ROW_NUMBER() OVER(ORDER BY tbl.Orden))),5) AS VARCHAR(255)) AS Ordenamiento,
				   tbl.Timestamp
			FROM tblMenuPrincipal tbl
			INNER JOIN MenuPrincipalCTE ON tbl.NodoPadreId = MenuPrincipalCTE.NodoMenuId
			WHERE tbl.EstatusId = 1
		)	

		INSERT INTO @Tree 
		SELECT NodoMenuId, Etiqueta, Descripcion, TipoNodoId, NodoPadreId, SistemaAccesoId, Url, Icono, AdmitePermiso, Orden, EstatusId, Timestamp
		FROM MenuPrincipalCTE
		ORDER BY Ordenamiento	
		RETURN 
	END
