
-- =============================================
-- Author:		Walder Mayen Juan
-- Create date: 16/02/2025
-- Description:	ELIMINAR DE LA TABLA CUENTAS
-- =============================================
CREATE PROCEDURE ups_cuentas_eliminar 
	(
	@CodigoCuenta int
	)
AS
BEGIN
	
	SET NOCOUNT ON;
	delete tbl_cuentas
	where CodigoCuenta = @CodigoCuenta
END
GO

