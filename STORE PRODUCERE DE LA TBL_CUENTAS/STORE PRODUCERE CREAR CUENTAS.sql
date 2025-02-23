
-- =============================================
-- Author:		WALDER MAYEN JUAN
-- Create date: 21/02/2025
-- Description:	STORED PROCEDURES AGREGA DATOS EN LA TABLA CUENTAS
-- =============================================
CREATE PROCEDURE usp_cuentas_crear 
	@CodigoCliente int,
	@NumeroCuentas varchar(100),
	@TipoCuenta varchar(50),
	@Saldo decimal(10,2),
	@FechaApertura date,
	@Estado varchar (50)

AS
BEGIN
	
	SET NOCOUNT ON;
	insert into tbl_cuentas 
	(
	 CodigoCliente,
	 NumeroCuenta,
	 TipoCuenta,
	 Saldo,
	 FechaApertura,
	 Estado
	)
	values
	(
	@CodigoCliente ,
	@NumeroCuentas ,
	@TipoCuenta ,
	@Saldo ,
	@FechaApertura ,
	@Estado 
	)
END

