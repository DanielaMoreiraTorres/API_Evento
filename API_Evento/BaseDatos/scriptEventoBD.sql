USE [master]
GO
/****** Object:  Database [prueba_evento]    Script Date: 14/03/2025 21:40:22 ******/
CREATE DATABASE [prueba_evento]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'prueba_evento', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\prueba_evento.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'prueba_evento_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\prueba_evento_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [prueba_evento] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [prueba_evento].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [prueba_evento] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [prueba_evento] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [prueba_evento] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [prueba_evento] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [prueba_evento] SET ARITHABORT OFF 
GO
ALTER DATABASE [prueba_evento] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [prueba_evento] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [prueba_evento] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [prueba_evento] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [prueba_evento] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [prueba_evento] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [prueba_evento] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [prueba_evento] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [prueba_evento] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [prueba_evento] SET  DISABLE_BROKER 
GO
ALTER DATABASE [prueba_evento] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [prueba_evento] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [prueba_evento] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [prueba_evento] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [prueba_evento] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [prueba_evento] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [prueba_evento] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [prueba_evento] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [prueba_evento] SET  MULTI_USER 
GO
ALTER DATABASE [prueba_evento] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [prueba_evento] SET DB_CHAINING OFF 
GO
ALTER DATABASE [prueba_evento] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [prueba_evento] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [prueba_evento] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [prueba_evento] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [prueba_evento] SET QUERY_STORE = ON
GO
ALTER DATABASE [prueba_evento] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [prueba_evento]
GO
/****** Object:  Table [dbo].[evento]    Script Date: 14/03/2025 21:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[lugar] [nvarchar](200) NOT NULL,
	[descripcion] [nvarchar](max) NULL,
	[precio] [decimal](18, 2) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_evento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[evento] ON 

INSERT [dbo].[evento] ([id], [fecha], [lugar], [descripcion], [precio], [activo]) VALUES (4, CAST(N'2025-03-15T00:00:00.000' AS DateTime), N'Quito', N'test', CAST(20.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[evento] ([id], [fecha], [lugar], [descripcion], [precio], [activo]) VALUES (5, CAST(N'2025-03-17T00:00:00.000' AS DateTime), N'Guayaquil', N'desc', CAST(10.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[evento] ([id], [fecha], [lugar], [descripcion], [precio], [activo]) VALUES (6, CAST(N'2025-03-16T00:00:00.000' AS DateTime), N'Quito', N'asd', CAST(5.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[evento] ([id], [fecha], [lugar], [descripcion], [precio], [activo]) VALUES (7, CAST(N'2025-03-21T00:00:00.000' AS DateTime), N'Quito', N'asdfg', CAST(8.99 AS Decimal(18, 2)), 0)
SET IDENTITY_INSERT [dbo].[evento] OFF
GO
USE [master]
GO
ALTER DATABASE [prueba_evento] SET  READ_WRITE 
GO
