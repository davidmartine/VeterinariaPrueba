USE [master]
GO
/****** Object:  Database [Veterinaria]    Script Date: 29/04/2021 6:29:08 p. m. ******/
CREATE DATABASE [Veterinaria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Veterinaria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Veterinaria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Veterinaria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Veterinaria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Veterinaria] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Veterinaria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Veterinaria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Veterinaria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Veterinaria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Veterinaria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Veterinaria] SET ARITHABORT OFF 
GO
ALTER DATABASE [Veterinaria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Veterinaria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Veterinaria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Veterinaria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Veterinaria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Veterinaria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Veterinaria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Veterinaria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Veterinaria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Veterinaria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Veterinaria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Veterinaria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Veterinaria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Veterinaria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Veterinaria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Veterinaria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Veterinaria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Veterinaria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Veterinaria] SET  MULTI_USER 
GO
ALTER DATABASE [Veterinaria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Veterinaria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Veterinaria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Veterinaria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Veterinaria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Veterinaria] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Veterinaria] SET QUERY_STORE = OFF
GO
USE [Veterinaria]
GO
/****** Object:  User [admin]    Script Date: 29/04/2021 6:29:08 p. m. ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 29/04/2021 6:29:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Documento] [int] NULL,
	[Tipo_Documento] [varchar](20) NULL,
	[Nombre] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[Telefono] [int] NULL,
	[Direccion] [varchar](100) NULL,
	[Ciudad] [varchar](50) NULL,
	[Corrreo] [varchar](50) NULL,
	[Tipo] [varchar](20) NULL,
	[Observacion] [varchar](max) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 29/04/2021 6:29:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consulta](
	[Id_Consulta] [int] IDENTITY(1,1) NOT NULL,
	[Id_Mascota] [int] NULL,
	[Fecha] [date] NULL,
	[Sintomas] [varchar](max) NULL,
	[Diagnostico] [varchar](max) NULL,
 CONSTRAINT [PK_Consulta] PRIMARY KEY CLUSTERED 
(
	[Id_Consulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 29/04/2021 6:29:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Id_Login] [int] IDENTITY(1,1) NOT NULL,
	[Id_Usuario] [int] NULL,
	[Usuario] [varchar](50) NULL,
	[Clave] [varchar](50) NULL,
	[Rol] [nchar](10) NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[Id_Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mascota]    Script Date: 29/04/2021 6:29:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mascota](
	[id_Mascota] [int] IDENTITY(1,1) NOT NULL,
	[Id_Cliente] [int] NULL,
	[Tipo_mascota] [varchar](50) NULL,
	[Raza] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Edad] [varchar](50) NULL,
	[Observacion] [varchar](max) NULL,
 CONSTRAINT [PK_Mascota] PRIMARY KEY CLUSTERED 
(
	[id_Mascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 29/04/2021 6:29:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamentos](
	[Id_Medicamento] [int] NOT NULL,
	[Id_Usuario] [int] NULL,
	[Id_Cliente] [int] NULL,
	[id_Mascota] [int] NULL,
	[Medicamentos] [varchar](max) NULL,
 CONSTRAINT [PK_Medicamentos_1] PRIMARY KEY CLUSTERED 
(
	[Id_Medicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 29/04/2021 6:29:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[Id_Persona] [int] IDENTITY(1,1) NOT NULL,
	[Documento] [int] NULL,
	[Tipo_Documento] [varchar](20) NULL,
	[Nombre] [varchar](50) NULL,
	[Apellidos] [varchar](100) NULL,
	[Telefono] [int] NULL,
	[Direccion] [varchar](100) NULL,
	[Ciudad] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[Id_Persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Mascota] FOREIGN KEY([Id_Mascota])
REFERENCES [dbo].[Mascota] ([id_Mascota])
GO
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_Mascota]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Persona] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Persona] ([Id_Persona])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Persona]
GO
ALTER TABLE [dbo].[Mascota]  WITH CHECK ADD  CONSTRAINT [FK_Mascota_Cliente] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Cliente] ([Id_Cliente])
GO
ALTER TABLE [dbo].[Mascota] CHECK CONSTRAINT [FK_Mascota_Cliente]
GO
ALTER TABLE [dbo].[Medicamentos]  WITH CHECK ADD  CONSTRAINT [FK_Medicamentos_Cliente] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Cliente] ([Id_Cliente])
GO
ALTER TABLE [dbo].[Medicamentos] CHECK CONSTRAINT [FK_Medicamentos_Cliente]
GO
ALTER TABLE [dbo].[Medicamentos]  WITH CHECK ADD  CONSTRAINT [FK_Medicamentos_Mascota] FOREIGN KEY([id_Mascota])
REFERENCES [dbo].[Mascota] ([id_Mascota])
GO
ALTER TABLE [dbo].[Medicamentos] CHECK CONSTRAINT [FK_Medicamentos_Mascota]
GO
ALTER TABLE [dbo].[Medicamentos]  WITH CHECK ADD  CONSTRAINT [FK_Medicamentos_Persona] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Persona] ([Id_Persona])
GO
ALTER TABLE [dbo].[Medicamentos] CHECK CONSTRAINT [FK_Medicamentos_Persona]
GO
USE [master]
GO
ALTER DATABASE [Veterinaria] SET  READ_WRITE 
GO
