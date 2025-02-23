
-- =============================================
-- Author:		Walder Mayen
-- Create date: 2025-02-09
-- Description:	store procedure para mostrar cuentas de la tabla tbl_cuentas
-- ==============================================
CREATE PROCEDURE usp_cuentas_mostrar 
	
AS
BEGIN
	
	SET NOCOUNT ON;

    select 
	CodigoCuenta,
	CodigoCliente,
	NumeroCuenta,
	TipoCuenta,
	Saldo,
	FechaApertura,
	Estado
	from tbl_cuentas
END

