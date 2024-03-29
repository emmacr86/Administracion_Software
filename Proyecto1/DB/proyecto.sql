USE [master]
GO
/****** Object:  Database [proyecto]    Script Date: 26/3/2019 04:23:31 ******/
CREATE DATABASE [proyecto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'proyecto_factura', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\proyecto_factura.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'proyecto_factura_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\proyecto_factura_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [proyecto] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [proyecto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [proyecto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [proyecto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [proyecto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [proyecto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [proyecto] SET ARITHABORT OFF 
GO
ALTER DATABASE [proyecto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [proyecto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [proyecto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [proyecto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [proyecto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [proyecto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [proyecto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [proyecto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [proyecto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [proyecto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [proyecto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [proyecto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [proyecto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [proyecto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [proyecto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [proyecto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [proyecto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [proyecto] SET RECOVERY FULL 
GO
ALTER DATABASE [proyecto] SET  MULTI_USER 
GO
ALTER DATABASE [proyecto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [proyecto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [proyecto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [proyecto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [proyecto] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'proyecto', N'ON'
GO
ALTER DATABASE [proyecto] SET QUERY_STORE = OFF
GO
USE [proyecto]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [proyecto]
GO
/****** Object:  Table [dbo].[escenario]    Script Date: 26/3/2019 04:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[escenario](
	[idproyecto] [int] NOT NULL,
	[escenario] [int] NOT NULL,
	[prioridad] [nvarchar](20) NOT NULL,
	[descripcion] [nvarchar](20) NOT NULL,
	[notas] [nvarchar](20) NOT NULL,
	[pedido] [nvarchar](20) NOT NULL,
	[servicio] [nvarchar](20) NOT NULL,
	[cuenta] [nvarchar](20) NOT NULL,
	[estado] [nvarchar](20) NOT NULL,
	[ejecutor] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_escenario] PRIMARY KEY CLUSTERED 
(
	[escenario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pasos]    Script Date: 26/3/2019 04:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pasos](
	[escenario] [int] NOT NULL,
	[paso] [int] NOT NULL,
	[descripcion] [nvarchar](20) NOT NULL,
	[resultado] [nvarchar](20) NOT NULL,
	[avance] [int] NOT NULL,
 CONSTRAINT [PK_pasos] PRIMARY KEY CLUSTERED 
(
	[paso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proyecto]    Script Date: 26/3/2019 04:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proyecto](
	[idproyecto] [int] IDENTITY(1,1) NOT NULL,
	[requerimiento] [nvarchar](20) NOT NULL,
	[descripcion] [nvarchar](20) NOT NULL,
	[tpo] [nvarchar](20) NOT NULL,
	[fecha] [date] NOT NULL,
	[gestor] [nvarchar](20) NOT NULL,
	[ambiente] [nvarchar](20) NOT NULL,
	[ejecutor] [nvarchar](20) NOT NULL,
	[creacion] [int] NOT NULL,
 CONSTRAINT [PK_proyecto] PRIMARY KEY CLUSTERED 
(
	[idproyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[escenario]  WITH CHECK ADD  CONSTRAINT [FK_escenario_proyecto] FOREIGN KEY([idproyecto])
REFERENCES [dbo].[proyecto] ([idproyecto])
GO
ALTER TABLE [dbo].[escenario] CHECK CONSTRAINT [FK_escenario_proyecto]
GO
ALTER TABLE [dbo].[pasos]  WITH CHECK ADD  CONSTRAINT [FK_pasos_escenario] FOREIGN KEY([escenario])
REFERENCES [dbo].[escenario] ([escenario])
GO
ALTER TABLE [dbo].[pasos] CHECK CONSTRAINT [FK_pasos_escenario]
GO
USE [master]
GO
ALTER DATABASE [proyecto] SET  READ_WRITE 
GO
