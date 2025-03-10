USE [master]
GO
/****** Object:  Database [DB_BANCO]    Script Date: 24/02/2025 20:29:19 ******/
CREATE DATABASE [DB_BANCO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_BANCO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DB_BANCO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_BANCO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DB_BANCO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DB_BANCO] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_BANCO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_BANCO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_BANCO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_BANCO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_BANCO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_BANCO] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_BANCO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_BANCO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_BANCO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_BANCO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_BANCO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_BANCO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_BANCO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_BANCO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_BANCO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_BANCO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_BANCO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_BANCO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_BANCO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_BANCO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_BANCO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_BANCO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_BANCO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_BANCO] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_BANCO] SET  MULTI_USER 
GO
ALTER DATABASE [DB_BANCO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_BANCO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_BANCO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_BANCO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_BANCO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_BANCO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_BANCO', N'ON'
GO
ALTER DATABASE [DB_BANCO] SET QUERY_STORE = ON
GO
ALTER DATABASE [DB_BANCO] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DB_BANCO]
GO
/****** Object:  Table [dbo].[tbl_cuentas]    Script Date: 24/02/2025 20:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cuentas](
	[CodigoCuenta] [int] IDENTITY(1,1) NOT NULL,
	[CodigoCliente] [int] NOT NULL,
	[NumeroCuenta] [nvarchar](50) NOT NULL,
	[TipoCuenta] [nvarchar](50) NULL,
	[Saldo] [decimal](10, 2) NULL,
	[FechaApertura] [datetime] NULL,
	[Estado] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Cuentas]    Script Date: 24/02/2025 20:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_Cuentas] as
select * from tbl_cuentas;
GO
/****** Object:  View [dbo].[vw_Cuentas5Campos]    Script Date: 24/02/2025 20:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_Cuentas5Campos] as
select 
CodigoCuenta,
NumeroCuenta,
TipoCuenta,
Estado,
Saldo
from tbl_cuentas;
GO
/****** Object:  Table [dbo].[tbl_clientes]    Script Date: 24/02/2025 20:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_clientes](
	[CodigoCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](255) NULL,
	[Departamento] [nvarchar](100) NULL,
	[Pais] [nvarchar](100) NULL,
	[Categoria] [nvarchar](50) NULL,
	[Estado] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_cliente_cuentas]    Script Date: 24/02/2025 20:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_cliente_cuentas] as
select 
cl.CodigoCliente,
cl.Nombre,
ct.CodigoCuenta,
ct.NumeroCuenta,
ct.Estado,
ct.Saldo
from tbl_cuentas ct
inner join tbl_clientes  cl
on ct.CodigoCliente = cl.CodigoCliente;
GO
/****** Object:  View [dbo].[vw_clientesCuentasinactivos]    Script Date: 24/02/2025 20:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_clientesCuentasinactivos] as
select 
cl.CodigoCliente,
cl.Nombre,
ct.CodigoCuenta,
ct.NumeroCuenta,
ct.TipoCuenta,
ct.Estado,
ct.Saldo
from tbl_cuentas ct
inner join tbl_clientes  cl
on ct.CodigoCliente = cl.CodigoCliente
where ct.Estado = 'inactivo'
and
Saldo > 600
GO
/****** Object:  Table [dbo].[tbl_movimientos]    Script Date: 24/02/2025 20:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_movimientos](
	[CodigoMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[CodigoCuenta] [int] NOT NULL,
	[TipoTransaccion] [nvarchar](50) NULL,
	[Monto] [decimal](10, 2) NOT NULL,
	[Moneda] [nvarchar](10) NOT NULL,
	[Estado] [nvarchar](15) NULL,
	[FechaTransaccion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_pagos]    Script Date: 24/02/2025 20:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pagos](
	[CodigoPago] [int] IDENTITY(1,1) NOT NULL,
	[CodigoPrestamo] [int] NULL,
	[CodigoTarjeta] [int] NULL,
	[CodigoCuenta] [int] NULL,
	[Monto] [decimal](10, 2) NOT NULL,
	[MonedaPago] [nvarchar](10) NOT NULL,
	[FechaPago] [datetime] NULL,
	[Estado] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_prestamos]    Script Date: 24/02/2025 20:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_prestamos](
	[CodigoPrestamo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoCliente] [int] NOT NULL,
	[MotivoPrestamo] [nvarchar](255) NULL,
	[Monto] [decimal](10, 2) NOT NULL,
	[Moneda] [nvarchar](10) NOT NULL,
	[TasaInteres] [decimal](5, 2) NULL,
	[PlazoMeses] [int] NULL,
	[FechaPrestamo] [datetime] NULL,
	[Estado] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoPrestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_tarjetas]    Script Date: 24/02/2025 20:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_tarjetas](
	[CodigoTarjeta] [int] IDENTITY(1,1) NOT NULL,
	[CodigoCliente] [int] NOT NULL,
	[NumeroTarjeta] [nvarchar](50) NOT NULL,
	[TipoTarjeta] [nvarchar](50) NULL,
	[CategoriaTarjeta] [nvarchar](50) NULL,
	[FechaExpiracion] [datetime] NULL,
	[CVV] [nvarchar](4) NULL,
	[Monto] [decimal](10, 2) NULL,
	[Moneda] [nvarchar](10) NOT NULL,
	[Estado] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_usuarios]    Script Date: 24/02/2025 20:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_usuarios](
	[CodigoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioSistema] [nvarchar](100) NOT NULL,
	[ClaveSistema] [nvarchar](255) NOT NULL,
	[Estado] [nvarchar](15) NULL,
	[FechaCreacion] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_cuentas] ADD  DEFAULT ((0)) FOR [Saldo]
GO
ALTER TABLE [dbo].[tbl_tarjetas] ADD  DEFAULT ((0)) FOR [Monto]
GO
ALTER TABLE [dbo].[tbl_cuentas]  WITH CHECK ADD FOREIGN KEY([CodigoCliente])
REFERENCES [dbo].[tbl_clientes] ([CodigoCliente])
GO
ALTER TABLE [dbo].[tbl_movimientos]  WITH CHECK ADD FOREIGN KEY([CodigoCuenta])
REFERENCES [dbo].[tbl_cuentas] ([CodigoCuenta])
GO
ALTER TABLE [dbo].[tbl_pagos]  WITH CHECK ADD FOREIGN KEY([CodigoPrestamo])
REFERENCES [dbo].[tbl_prestamos] ([CodigoPrestamo])
GO
ALTER TABLE [dbo].[tbl_pagos]  WITH CHECK ADD FOREIGN KEY([CodigoTarjeta])
REFERENCES [dbo].[tbl_tarjetas] ([CodigoTarjeta])
GO
ALTER TABLE [dbo].[tbl_pagos]  WITH CHECK ADD FOREIGN KEY([CodigoCuenta])
REFERENCES [dbo].[tbl_cuentas] ([CodigoCuenta])
GO
ALTER TABLE [dbo].[tbl_prestamos]  WITH CHECK ADD FOREIGN KEY([CodigoCliente])
REFERENCES [dbo].[tbl_clientes] ([CodigoCliente])
GO
ALTER TABLE [dbo].[tbl_tarjetas]  WITH CHECK ADD FOREIGN KEY([CodigoCliente])
REFERENCES [dbo].[tbl_clientes] ([CodigoCliente])
GO
/****** Object:  StoredProcedure [dbo].[ups_clientes_eliminar]    Script Date: 24/02/2025 20:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Walder Mayen Juan
-- Create date: 16/02/2025
-- Description:	ELIMINAR
-- =============================================
CREATE PROCEDURE [dbo].[ups_clientes_eliminar]
	-- Add the parameters for the stored procedure here
	(
	@Codigo int

	)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete tbl_clientes
	where CodigoCliente = @Codigo

	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[ups_cuentas_eliminar]    Script Date: 24/02/2025 20:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Walder Mayen Juan
-- Create date: 16/02/2025
-- Description:	ELIMINAR DE LA TABLA CUENTAS
-- =============================================
CREATE PROCEDURE [dbo].[ups_cuentas_eliminar] 
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
/****** Object:  StoredProcedure [dbo].[usp_clientes_crear]    Script Date: 24/02/2025 20:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		WALDER MAYEN JUAN
-- Create date: 16/02/2025
-- Description:	STORED PROCEDURES AGREGA DATOS 
-- =============================================
CREATE PROCEDURE [dbo].[usp_clientes_crear] 
	--parametro de entrada, 
	@Nombre varchar (100),
	@Direccion varchar (255),
	@Departamento varchar (100),
	@Pais varchar (100),
	@Categoria varchar (50),
	@Estado varchar (15)
	
AS
BEGIN

SET NOCOUNT ON;

	insert into tbl_clientes
	(
	Nombre,
	Direccion,
	Departamento,
	Pais,
	Categoria,
	Estado
	) values
	(
	@Nombre,
	@Direccion,
	@Departamento,
	@Pais,
	@Categoria,
	@Estado
	)
	
	SELECT @@ROWCOUNT;
    
END
GO
/****** Object:  StoredProcedure [dbo].[usp_clientes_editar]    Script Date: 24/02/2025 20:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Walder Mayen Juan
-- Create date: 16/02/2025
-- Description:	Actualizacion 
-- =============================================
CREATE PROCEDURE [dbo].[usp_clientes_editar]
	-- Add the parameters for the stored procedure here
	(
	@Codigo int,
	@Nombre varchar (100),
	@Direccion varchar (255),
	@Departamento varchar (100),
	@Pais varchar (100),
	@Categoria varchar (50),
	@Estado varchar (15)
	)


AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_clientes
	set Nombre = @Nombre,
		Direccion = @Direccion,
		Departamento = @Departamento,
		Pais = @Pais,
		Categoria = @Categoria,
		Estado = @Estado
		where CodigoCliente = @Codigo

		SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_clientes_mostrar]    Script Date: 24/02/2025 20:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Walder Mayen
-- Create date: 2025-02-09
-- Description:	store procedure para mostrar los clientes de la tabla tbl_clientes
-- =============================================
CREATE PROCEDURE [dbo].[usp_clientes_mostrar] 
	
AS
BEGIN
	
	SET NOCOUNT ON;

    select 
		CodigoCliente as 'codigocliente',
		Nombre,
		Direccion,
		Departamento,
		Pais,
		Categoria,
		Estado
	from tbl_clientes;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_cuentas_crear]    Script Date: 24/02/2025 20:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		WALDER MAYEN JUAN
-- Create date: 21/02/2025
-- Description:	STORED PROCEDURES AGREGA DATOS EN LA TABLA CUENTAS
-- =============================================
CREATE PROCEDURE [dbo].[usp_cuentas_crear] 
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
GO
/****** Object:  StoredProcedure [dbo].[usp_cuentas_editar]    Script Date: 24/02/2025 20:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Walder Mayen Juan
-- Create date: 16/02/2025
-- Description:	Actualizacion de la tabla cuentas 
-- =============================================
CREATE PROCEDURE [dbo].[usp_cuentas_editar] 
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
GO
/****** Object:  StoredProcedure [dbo].[usp_cuentas_mostrar]    Script Date: 24/02/2025 20:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_cuentas_mostrar] 
	
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
GO
USE [master]
GO
ALTER DATABASE [DB_BANCO] SET  READ_WRITE 
GO
