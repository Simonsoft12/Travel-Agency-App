USE [master]
GO
/****** Object:  Database [NetDB]    Script Date: 09.06.2020 16:39:05 ******/
CREATE DATABASE [NetDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NetDB', FILENAME = N'C:\Users\Simon\Desktop\.NET Project\DB\NetDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NetDB_log', FILENAME = N'C:\Users\Simon\Desktop\.NET Project\DB\NetDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NetDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NetDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NetDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NetDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NetDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NetDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NetDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [NetDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NetDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NetDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NetDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NetDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NetDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NetDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NetDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NetDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NetDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NetDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NetDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NetDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NetDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NetDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NetDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NetDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NetDB] SET RECOVERY FULL 
GO
ALTER DATABASE [NetDB] SET  MULTI_USER 
GO
ALTER DATABASE [NetDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NetDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NetDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NetDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NetDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NetDB', N'ON'
GO
ALTER DATABASE [NetDB] SET QUERY_STORE = OFF
GO
USE [NetDB]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[client_id] [bigint] IDENTITY(1,1) NOT NULL,
	[client_fname] [nvarchar](50) NOT NULL,
	[client_lname] [nvarchar](50) NOT NULL,
	[client_phone] [nvarchar](50) NOT NULL,
	[client_address] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destinations]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destinations](
	[dest_id] [bigint] IDENTITY(1,1) NOT NULL,
	[dest_name] [nvarchar](50) NOT NULL,
	[dest_phone] [nvarchar](50) NOT NULL,
	[dest_address] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dest_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[username] [nvarchar](10) NULL,
	[password] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [bigint] IDENTITY(1,1) NOT NULL,
	[client_id] [bigint] NOT NULL,
	[dest_id] [bigint] NOT NULL,
	[order_from] [datetime] NULL,
	[order_to] [datetime] NULL,
	[price] [bigint] NULL,
	[order_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[deleteClient]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[deleteClient](
	@CLIENT_ID bigint
)
AS
BEGIN 
      DELETE FROM dbo.Clients  
      WHERE  client_id = @CLIENT_ID   
END  
GO
/****** Object:  StoredProcedure [dbo].[deleteDestination]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[deleteDestination](
	@DEST_ID bigint
)
AS
BEGIN 
      DELETE FROM dbo.Destinations  
      WHERE  dest_id = @DEST_ID   
END  
GO
/****** Object:  StoredProcedure [dbo].[deleteOrder]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[deleteOrder](
	@ORDER_ID bigint
)
AS
BEGIN 
      DELETE FROM dbo.Orders  
      WHERE  order_id = @ORDER_ID   
END  
GO
/****** Object:  StoredProcedure [dbo].[insertClient]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[insertClient](
	@CLIENT_FNAME nvarchar(50),
	@CLIENT_LNAME nvarchar(50),
	@CLIENT_PHONE nvarchar(50),
	@CLIENT_ADDRESS nvarchar(50)
)
AS
BEGIN
INSERT INTO dbo.Clients(
	[client_fname],
	[client_lname],
	[client_phone],
	[client_address]
)VALUES(
	@CLIENT_FNAME,
	@CLIENT_LNAME,
	@CLIENT_PHONE,
	@CLIENT_ADDRESS
)
END
GO
/****** Object:  StoredProcedure [dbo].[insertDestination]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[insertDestination](
	@DEST_NAME nvarchar(50),
	@DEST_PHONE nvarchar(50),
	@DEST_ADDRESS nvarchar(50)
)
AS
BEGIN
INSERT INTO dbo.Destinations(
	[dest_name],
	[dest_phone],
	[dest_address]
)VALUES(
	@DEST_NAME,
	@DEST_PHONE,
	@DEST_ADDRESS
)
END
GO
/****** Object:  StoredProcedure [dbo].[insertOrder]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[insertOrder](
	@CLIENT_ID bigint,
	@DEST_ID bigint,
	@ORDER_FROM datetime,
	@ORDER_TO datetime,
	@PRICE bigint,
	@ORDER_DATE datetime
)
AS
BEGIN
INSERT INTO dbo.Orders(
	[client_id],
	[dest_id],
	[order_from],
	[order_to],
	[price],
	[order_date]
)VALUES(
	@CLIENT_ID,
	@DEST_ID,
	@ORDER_FROM,
	@ORDER_TO,
	@PRICE,
	@ORDER_DATE
)
END
GO
/****** Object:  StoredProcedure [dbo].[selectClient]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[selectClient](
	@CLIENT_ID bigint
)
AS
BEGIN
SELECT * FROM dbo.clients
WHERE client_id = @CLIENT_ID 
END
GO
/****** Object:  StoredProcedure [dbo].[selectClientOrders]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[selectClientOrders](
	@CLIENT_ID bigint
)
AS
BEGIN
SELECT * FROM dbo.Orders
WHERE client_id = @CLIENT_ID 
END
GO
/****** Object:  StoredProcedure [dbo].[selectClients]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[selectClients]
AS
SELECT * FROM dbo.clients
GO
/****** Object:  StoredProcedure [dbo].[selectDestination]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[selectDestination](
	@DEST_NAME nvarchar(50)
)
AS
BEGIN
SELECT * FROM dbo.Destinations
WHERE dest_name = @DEST_NAME 
END
GO
/****** Object:  StoredProcedure [dbo].[selectDestinations]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[selectDestinations]
AS
SELECT * FROM dbo.destinations
GO
/****** Object:  StoredProcedure [dbo].[selectFullClientOrders]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[selectFullClientOrders](
	@CLIENT_ID bigint,
	@DEST_ID bigint
)
AS
BEGIN
	SELECT C.client_fname, C.client_lname, C.client_address, C.client_phone, D.dest_name, D.dest_phone, D.dest_address, O.order_from, O.order_to
	FROM dbo.Orders O
	Join Clients C on C.client_id = O.client_id
	Join Destinations D on D.dest_id = O.dest_id
	WHERE O.client_id = @CLIENT_ID 
	AND O.dest_id = @DEST_ID
END
GO
/****** Object:  StoredProcedure [dbo].[selectOrders]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[selectOrders]
AS
SELECT * FROM dbo.orders
GO
/****** Object:  StoredProcedure [dbo].[updateClient]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[updateClient](
	@CLIENT_ID bigint,
	@CLIENT_FNAME nvarchar(50),
	@CLIENT_LNAME nvarchar(50),
	@CLIENT_PHONE nvarchar(50),
	@CLIENT_ADDRESS nvarchar(50)
)
AS
BEGIN
UPDATE dbo.Clients  
            SET    client_fname = @CLIENT_FNAME,  
                   client_lname = @CLIENT_LNAME,  
                   client_phone = @CLIENT_PHONE,  
                   client_address = @CLIENT_ADDRESS  
            WHERE  client_id = @CLIENT_ID  
END 
GO
/****** Object:  StoredProcedure [dbo].[updateDestination]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[updateDestination](
	@DEST_ID bigint,
	@DEST_NAME nvarchar(50),
	@DEST_PHONE nvarchar(50),
	@DEST_ADDRESS nvarchar(50)
)
AS
BEGIN
UPDATE dbo.Destinations  
            SET    dest_name = @DEST_NAME,  
                   dest_phone = @DEST_PHONE,  
                   dest_address = @DEST_ADDRESS  
            WHERE  dest_id = @DEST_ID  
END  
GO
/****** Object:  StoredProcedure [dbo].[updateOrder]    Script Date: 09.06.2020 16:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[updateOrder](
	@ORDER_ID bigint,
	@CLIENT_ID bigint,
	@DEST_ID bigint,
	@ORDER_FROM date,
	@ORDER_TO date
)
AS
BEGIN
UPDATE dbo.Orders  
            SET    client_id = @CLIENT_ID, 
                   dest_id = @DEST_ID,
				   order_from = @ORDER_FROM,
				   order_to = @ORDER_TO
            WHERE  order_id = @ORDER_ID  
END 
GO
USE [master]
GO
ALTER DATABASE [NetDB] SET  READ_WRITE 
GO
