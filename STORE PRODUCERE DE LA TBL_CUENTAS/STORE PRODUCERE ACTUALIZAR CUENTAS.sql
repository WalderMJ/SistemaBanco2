
-- =============================================
-- Author:		Walder Mayen Juan
-- Create date: 16/02/2025
-- Description:	Actualizacion de la tabla cuentas 
-- =============================================
CREATE PROCEDURE usp_cuentas_editar 
	@CodigoCuenta int,
	@CodigoCliente int,
	@NumeroCuentas varchar(100),
	@TipoCuenta varchar(50),
	@Saldo decimal(10,2),
	@FechaApertura datetime,
	@Estado varchar (50)
AS
BEGIN
	update tbl_cuentas
	set 
		CodigoCliente = @CodigoCliente,
	 NumeroCuenta = @NumeroCuentas,
	 TipoCuenta= @TipoCuenta,
	 Saldo = @Saldo,
	 FechaApertura = @FechaApertura,
	 Estado =@Estado
	 where CodigoCuenta = @CodigoCuenta;
END
