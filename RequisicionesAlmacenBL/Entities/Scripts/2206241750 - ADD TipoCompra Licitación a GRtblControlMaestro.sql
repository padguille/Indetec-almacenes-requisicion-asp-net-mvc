SET IDENTITY_INSERT GRtblControlMaestro ON
INSERT INTO GRtblControlMaestro
(
    ControlId,
    Control,
    Valor,
    Sistema,
    Activo,
    ControlSencillo,
    FechaCreacion
)
VALUES
(132, 'TipoCompra', 'Licitaci�n', 1, 1, 0, GETDATE())
SET IDENTITY_INSERT GRtblControlMaestro OFF
GO

ALTER TABLE ARtblInvitacionArticulo ADD TipoCompraId INT NULL
GO

UPDATE ARtblInvitacionArticulo SET TipoCompraId = 5 -- Invitaci�n compra
GO

ALTER TABLE ARtblInvitacionArticulo ALTER COLUMN TipoCompraId INT NOT NULL
GO

ALTER TABLE ARtblInvitacionArticulo  WITH CHECK ADD  CONSTRAINT FK_TipoCompraId FOREIGN KEY(TipoCompraId)
REFERENCES GRtblControlMaestro (ControlId)
GO

ALTER TABLE ARtblInvitacionArticulo CHECK CONSTRAINT FK_TipoCompraId
GO