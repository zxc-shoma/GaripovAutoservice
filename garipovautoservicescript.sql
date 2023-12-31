USE [master]
GO
/****** Object:  Database [garipov_autoservice]    Script Date: 26.09.2023 14:24:58 ******/
CREATE DATABASE [garipov_autoservice]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'garipov_autoservice', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\garipov_autoservice.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'garipov_autoservice_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\garipov_autoservice_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [garipov_autoservice].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [garipov_autoservice] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [garipov_autoservice] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [garipov_autoservice] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [garipov_autoservice] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [garipov_autoservice] SET ARITHABORT OFF 
GO
ALTER DATABASE [garipov_autoservice] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [garipov_autoservice] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [garipov_autoservice] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [garipov_autoservice] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [garipov_autoservice] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [garipov_autoservice] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [garipov_autoservice] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [garipov_autoservice] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [garipov_autoservice] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [garipov_autoservice] SET  DISABLE_BROKER 
GO
ALTER DATABASE [garipov_autoservice] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [garipov_autoservice] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [garipov_autoservice] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [garipov_autoservice] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [garipov_autoservice] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [garipov_autoservice] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [garipov_autoservice] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [garipov_autoservice] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [garipov_autoservice] SET  MULTI_USER 
GO
ALTER DATABASE [garipov_autoservice] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [garipov_autoservice] SET DB_CHAINING OFF 
GO
ALTER DATABASE [garipov_autoservice] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [garipov_autoservice] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [garipov_autoservice] SET DELAYED_DURABILITY = DISABLED 
GO
USE [garipov_autoservice]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 26.09.2023 14:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client_a_import]    Script Date: 26.09.2023 14:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client_a_import](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [date] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_client_a_import] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 26.09.2023 14:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 26.09.2023 14:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 26.09.2023 14:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 26.09.2023 14:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 26.09.2023 14:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 26.09.2023 14:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 26.09.2023 14:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service_a_import]    Script Date: 26.09.2023 14:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_a_import](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [decimal](18, 0) NOT NULL,
	[DurationlnSeconds] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](100) NULL,
 CONSTRAINT [PK_service_a_import] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 26.09.2023 14:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 26.09.2023 14:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 26.09.2023 14:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[client_a_import] ON 

INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (1, N'Мишина', N'Иветта', N'Андреевна', CAST(N'2002-10-05' AS Date), CAST(N'2016-01-24' AS Date), N'aukjan@yahoo.com', N'7(3926)244-81-96 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (2, N'Суворова', N'Божена', N'Анатольевна', CAST(N'1981-03-09' AS Date), CAST(N'2016-01-28' AS Date), N'attwood@aol.com', N'7(347)895-86-57 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (3, N'Белозёрова', N'Диана', N'Антоновна', CAST(N'1989-02-27' AS Date), CAST(N'2017-01-30' AS Date), N'dialworld@aol.com', N'7(9900)174-59-87 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (4, N'Дементьева', N'Эдита', N'Онисимовна', CAST(N'1975-09-17' AS Date), CAST(N'2018-11-24' AS Date), N'frosal@hotmail.com', N'7(198)922-28-76 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (5, N'Блинов', N'Евгений', N'Мэлсович', CAST(N'1994-01-05' AS Date), CAST(N'2017-05-07' AS Date), N'moxfulder@outlook.com', N'7(0852)321-82-64 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (6, N'Морозов', N'Наум', N'Валерьянович', CAST(N'1985-07-04' AS Date), CAST(N'2016-05-02' AS Date), N'salesgeek@mac.com', N'7(636)050-96-13 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (7, N'Попова', N'Харита', N'Якуновна', CAST(N'1997-12-16' AS Date), CAST(N'2016-07-05' AS Date), N'firstpr@verizon.net', N'7(335)386-81-06 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (8, N'Крюков', N'Наум', N'Ильяович', CAST(N'1993-11-17' AS Date), CAST(N'2017-02-01' AS Date), N'floxy@hotmail.com', N'7(81)657-88-92 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (9, N'Крюкова', N'Авигея', N'Святославовна', CAST(N'2000-08-10' AS Date), CAST(N'2018-01-03' AS Date), N'simone@gmail.com', N'7(499)318-88-53 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (10, N'Беляева', N'Сабрина', N'Федосеевна', CAST(N'1972-07-26' AS Date), CAST(N'2017-06-14' AS Date), N'agapow@gmail.com', N'7(6580)534-32-58 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (11, N'Медведев', N'Святослав', N'Юлианович', CAST(N'1972-10-04' AS Date), CAST(N'2018-10-13' AS Date), N'hllam@comcast.net', N'7(3520)435-21-20 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (12, N'Блохин', N'Пантелеймон', N'Феликсович', CAST(N'1978-03-06' AS Date), CAST(N'2018-02-14' AS Date), N'balchen@comcast.net', N'7(9524)556-48-98 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (13, N'Горбачёва', N'Никки', N'Еремеевна', CAST(N'1987-04-21' AS Date), CAST(N'2018-08-16' AS Date), N'chinthaka@att.net', N'7(94)789-69-20 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (14, N'Архипова', N'Прасковья', N'Валерьевна', CAST(N'1979-01-09' AS Date), CAST(N'2018-07-23' AS Date), N'cgcra@live.com', N'7(86)540-10-21 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (15, N'Андреева', N'Патрисия', N'Валерьевна', CAST(N'1993-11-18' AS Date), CAST(N'2016-07-17' AS Date), N'jigsaw@aol.com', N'7(9648)953-81-26 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (16, N'Горшкова', N'Марта', N'Иосифовна', CAST(N'2001-02-13' AS Date), CAST(N'2016-08-04' AS Date), N'gbacon@mac.com', N'7(544)650-59-03 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (17, N'Орлова', N'Влада', N'Мартыновна', CAST(N'1990-06-26' AS Date), CAST(N'2016-03-21' AS Date), N'rnelson@yahoo.ca', N'7(2506)433-38-35 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (18, N'Ершов', N'Глеб', N'Федорович', CAST(N'1970-06-14' AS Date), CAST(N'2016-09-14' AS Date), N'sjava@aol.com', N'7(2608)298-40-82 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (19, N'Быкова', N'Тала', N'Георгьевна', CAST(N'2000-02-22' AS Date), CAST(N'2016-08-13' AS Date), N'ganter@optonline.net', N'7(13)915-53-53 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (20, N'Новиков', N'Адриан', N'Аркадьевич', CAST(N'1974-01-15' AS Date), CAST(N'2018-11-23' AS Date), N'multiplx@verizon.net', N'7(70)572-33-62 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (21, N'Филатов', N'Аристарх', N'Дмитриевич', CAST(N'1989-05-29' AS Date), CAST(N'2017-01-11' AS Date), N'hampton@att.net', N'7(696)235-29-24 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (22, N'Анисимова', N'Тамара', N'Витальевна', CAST(N'1988-06-16' AS Date), CAST(N'2016-02-25' AS Date), N'schwaang@mac.com', N'7(66)128-04-10 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (23, N'Кудряшов', N'Аверкий', N'Константинович', CAST(N'1991-07-26' AS Date), CAST(N'2018-03-08' AS Date), N'nanop@msn.com', N'7(88)732-96-30 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (24, N'Колобов', N'Орест', N'Юлианович', CAST(N'2001-07-14' AS Date), CAST(N'2017-01-01' AS Date), N'parkes@verizon.net', N'7(1680)508-58-26 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (25, N'Кузьмина', N'Дэнна', N'Витальевна', CAST(N'1993-08-24' AS Date), CAST(N'2016-03-27' AS Date), N'nichoj@mac.com', N'7(9940)977-45-73 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (26, N'Александров', N'Станислав', N'Эдуардович', CAST(N'1981-07-04' AS Date), CAST(N'2018-11-08' AS Date), N'bigmauler@aol.com', N'7(18)164-05-12 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (27, N'Андреев', N'Станислав', N'Максович', CAST(N'1975-10-10' AS Date), CAST(N'2017-12-26' AS Date), N'budinger@mac.com', N'7(02)993-91-28 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (28, N'Дроздов', N'Вольдемар', N'Артемович', CAST(N'1976-02-07' AS Date), CAST(N'2017-07-18' AS Date), N'smpeters@me.com', N'7(307)456-99-05 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (29, N'Абрамов', N'Станислав', N'Филатович', CAST(N'1989-05-18' AS Date), CAST(N'2016-12-08' AS Date), N'solomon@att.net', N'7(6545)478-87-79 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (30, N'Гусева', N'Роза', N'Дмитриевна', CAST(N'1999-02-13' AS Date), CAST(N'2017-12-12' AS Date), N'martyloo@live.com', N'7(23)064-51-84 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (31, N'Лазарев', N'Алексей', N'Богданович', CAST(N'1977-03-10' AS Date), CAST(N'2017-01-02' AS Date), N'claesjac@me.com', N'7(0055)737-37-48 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (32, N'Большаков', N'Вадим', N'Данилович', CAST(N'1970-05-15' AS Date), CAST(N'2018-08-04' AS Date), N'uncle@gmail.com', N'7(386)641-13-37 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (33, N'Ефремов', N'Витольд', N'Авксентьевич', CAST(N'1975-12-02' AS Date), CAST(N'2018-04-09' AS Date), N'kwilliams@yahoo.ca', N'7(93)922-14-03 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (34, N'Игнатов', N'Захар', N'Павлович', CAST(N'1998-10-07' AS Date), CAST(N'2017-11-10' AS Date), N'dieman@icloud.com', N'7(578)574-73-36 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (35, N'Калашников', N'Артур', N'Юрьевич', CAST(N'1972-12-13' AS Date), CAST(N'2017-08-20' AS Date), N'oevans@aol.com', N'7(147)947-47-21 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (36, N'Овчинникова', N'Лаура', N'Еремеевна', CAST(N'1992-04-03' AS Date), CAST(N'2018-11-24' AS Date), N'carcus@yahoo.ca', N'7(85)829-33-79 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (37, N'Голубев', N'Иосиф', N'Тимофеевич', CAST(N'1982-05-06' AS Date), CAST(N'2018-08-18' AS Date), N'smcnabb@att.net', N'7(78)972-73-11 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (38, N'Галкин', N'Эрик', N'Онисимович', CAST(N'1975-01-18' AS Date), CAST(N'2016-07-19' AS Date), N'snunez@verizon.net', N'7(759)873-77-39 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (39, N'Некрасов', N'Варлам', N'Михайлович', CAST(N'2000-11-12' AS Date), CAST(N'2017-12-03' AS Date), N'dogdude@verizon.net', N'7(019)258-06-35 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (40, N'Федотов', N'Осип', N'Анатольевич', CAST(N'1971-04-13' AS Date), CAST(N'2018-07-23' AS Date), N'breegster@hotmail.com', N'7(590)702-33-06 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (41, N'Смирнов', N'Мартын', N'Арсеньевич', CAST(N'1996-06-25' AS Date), CAST(N'2017-02-07' AS Date), N'haddawy@live.com', N'7(6251)589-02-43 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (42, N'Копылов', N'Касьян', N'Робертович', CAST(N'1983-08-04' AS Date), CAST(N'2018-03-18' AS Date), N'crobles@sbcglobal.net', N'7(5774)679-82-06 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (43, N'Дмитриева', N'Элина', N'Даниловна', CAST(N'1988-12-10' AS Date), CAST(N'2017-02-11' AS Date), N'vmalik@live.com', N'7(787)140-48-84 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (44, N'Бирюкова', N'Инара', N'Улебовна', CAST(N'1978-07-21' AS Date), CAST(N'2017-10-01' AS Date), N'smpeters@hotmail.com', N'7(098)346-50-58 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (45, N'Васильев', N'Оскар', N'Богданович', CAST(N'1971-01-30' AS Date), CAST(N'2017-05-28' AS Date), N'miturria@verizon.net', N'7(585)801-94-29 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (46, N'Киселёв', N'Устин', N'Яковлевич', CAST(N'1985-01-08' AS Date), CAST(N'2018-06-21' AS Date), N'dalamb@verizon.net', N'7(83)334-52-76 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (47, N'Кузьмин', N'Леонтий', N'Валерьянович', CAST(N'2000-05-05' AS Date), CAST(N'2017-10-12' AS Date), N'msloan@hotmail.com', N'7(1340)148-90-68 ', N'м', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (48, N'Ефимова', N'Магда', N'Платоновна', CAST(N'1995-08-16' AS Date), CAST(N'2017-08-01' AS Date), N'rbarreira@me.com', N'7(9261)386-15-92 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (49, N'Воронова', N'Изабелла', N'Вячеславовна', CAST(N'1999-09-24' AS Date), CAST(N'2017-12-21' AS Date), N'kildjean@sbcglobal.net', N'7(17)433-44-98 ', N'ж', NULL)
INSERT [dbo].[client_a_import] ([ID], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (50, N'Волков', N'Людвиг', N'Витальевич', CAST(N'1977-12-27' AS Date), CAST(N'2016-04-27' AS Date), N'jrkorson@msn.com', N'7(8459)592-05-58 ', N'м', NULL)
SET IDENTITY_INSERT [dbo].[client_a_import] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'ж', N'Женский')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'м', N'Мужской')
GO
SET IDENTITY_INSERT [dbo].[service_a_import] ON 

INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (1, N'Замена жидкости в кондиционере', CAST(3040 AS Decimal(18, 0)), N'8 час', NULL, 25, N'Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (2, N'Ремонт и замена коллектора', CAST(2770 AS Decimal(18, 0)), N'150 мин', NULL, 15, N'Услуги автосервиса\Выхлопная система.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (3, N'Замена актуатора сцепления', CAST(4100 AS Decimal(18, 0)), N'330 мин', NULL, 15, N'Услуги автосервиса\Сцепление.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (4, N'Замена жидкости ГУР', CAST(2380 AS Decimal(18, 0)), N'9 час', NULL, 20, N'Услуги автосервиса\ГУР.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (5, N'Заправка кондиционеров', CAST(4860 AS Decimal(18, 0)), N'2 час', NULL, 5, N'Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (6, N'Замена масла в вариаторе', CAST(4720 AS Decimal(18, 0)), N'2 час', NULL, 5, N'Услуги автосервиса\Вариатор.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (7, N'Ремонт двигателя', CAST(2470 AS Decimal(18, 0)), N'4 час', NULL, 25, N'Услуги автосервиса\Двигатель.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (8, N'Замена заднего сальника АКПП', CAST(1510 AS Decimal(18, 0)), N'390 мин', NULL, 25, N'Услуги автосервиса\АКПП.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (9, N'Покраска', CAST(2370 AS Decimal(18, 0)), N'2 час', NULL, 15, N'Услуги автосервиса\Дополнительные услуги.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (10, N'Мойка колес', CAST(3490 AS Decimal(18, 0)), N'570 мин', NULL, 0, N'Услуги автосервиса\Шиномонтаж.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (11, N'Замена прокладки впускного-выпуского коллектора', CAST(2980 AS Decimal(18, 0)), N'3 час', NULL, 0, N'Услуги автосервиса\Выхлопная система.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (12, N'Диагностика работы двигателя', CAST(2760 AS Decimal(18, 0)), N'150 мин', NULL, 10, N'Услуги автосервиса\Двигатель.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (13, N'Установка сигнализации', CAST(1760 AS Decimal(18, 0)), N'4 час', NULL, 0, N'Услуги автосервиса\Электрика.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (14, N'Замена компрессора кондиционера', CAST(2720 AS Decimal(18, 0)), N'270 мин', NULL, 10, N'Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (15, N'Замена ремня привода ГУР', CAST(3350 AS Decimal(18, 0)), N'10 час', NULL, 0, N'Услуги автосервиса\ГУР.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (16, N'Замена тормозных колодок', CAST(4260 AS Decimal(18, 0)), N'8 час', NULL, 5, N'Услуги автосервиса\Техническое обслуживание.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (17, N'Замена масла', CAST(1430 AS Decimal(18, 0)), N'510 мин', NULL, 25, N'Услуги автосервиса\Техническое обслуживание.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (18, N'Замена цепи ГРМ', CAST(4570 AS Decimal(18, 0)), N'6 час', NULL, 20, N'Услуги автосервиса\Двигатель.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (19, N'Замена бензонасоса', CAST(1780 AS Decimal(18, 0)), N'4 час', NULL, 10, N'Услуги автосервиса\Топливная система.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (20, N'Ремонт приводного вала', CAST(4520 AS Decimal(18, 0)), N'210 мин', NULL, 5, N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (21, N'Замена подшипника компрессора кондиционера', CAST(1110 AS Decimal(18, 0)), N'330 мин', NULL, 20, N'Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (22, N'Снятие и установка колес', CAST(3130 AS Decimal(18, 0)), N'390 мин', NULL, 0, N'Услуги автосервиса\Шиномонтаж.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (23, N'Замена лямбда зонда', CAST(770 AS Decimal(18, 0)), N'270 мин', NULL, 5, N'Услуги автосервиса\Выхлопная система.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (24, N'Замена привода в сборе', CAST(3890 AS Decimal(18, 0)), N'8 час', NULL, 15, N'Услуги автосервиса\transmission.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (25, N'Замена трубки кондиционера', CAST(2810 AS Decimal(18, 0)), N'3 час', NULL, 15, N'Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (26, N'Замена ремня кондиционера', CAST(4650 AS Decimal(18, 0)), N'8 час', NULL, 0, N'Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (27, N'Замена охлаждающей жидкости', CAST(1590 AS Decimal(18, 0)), N'210 мин', NULL, 0, N'Услуги автосервиса\Техническое обслуживание.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (28, N'Замена троса сцепления', CAST(4460 AS Decimal(18, 0)), N'8 час', NULL, 5, N'Услуги автосервиса\Сцепление.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (29, N'Замена масла в МКПП', CAST(4490 AS Decimal(18, 0)), N'9 час', NULL, 20, N'Услуги автосервиса\КПП.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (30, N'Замена рулевой рейки', CAST(4840 AS Decimal(18, 0)), N'570 мин', NULL, 25, N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (31, N'Ремонт дисков', CAST(3860 AS Decimal(18, 0)), N'270 мин', NULL, 10, N'Услуги автосервиса\Шиномонтаж.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (32, N'Замена масла заднего редуктора (моста)', CAST(840 AS Decimal(18, 0)), N'7 час', NULL, 25, N'Услуги автосервиса\transmission.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (33, N'Замена подшипника задней ступицы', CAST(1860 AS Decimal(18, 0)), N'270 мин', NULL, 25, N'Услуги автосервиса\transmission.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (34, N'Восстановление рулевых реек', CAST(1020 AS Decimal(18, 0)), N'2 час', NULL, 20, N'Услуги автосервиса\Подвеска.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (35, N'Замена рулевой тяги', CAST(570 AS Decimal(18, 0)), N'3 час', NULL, 0, N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (36, N'Ремонт и замена гидроблока АКПП', CAST(2040 AS Decimal(18, 0)), N'270 мин', NULL, 0, N'Услуги автосервиса\АКПП.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (37, N'Замена масла раздаточной коробки', CAST(2070 AS Decimal(18, 0)), N'510 мин', NULL, 0, N'Услуги автосервиса\transmission.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (38, N'Диагностика кондиционера', CAST(2590 AS Decimal(18, 0)), N'10 час', NULL, 10, N'Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (39, N'Ремонт и замена катализатора', CAST(500 AS Decimal(18, 0)), N'270 мин', NULL, 25, N'Услуги автосервиса\Выхлопная система.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (40, N'Замена гофры глушителя', CAST(760 AS Decimal(18, 0)), N'270 мин', NULL, 25, N'Услуги автосервиса\Выхлопная система.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (41, N'Замена ремня ГРМ', CAST(4630 AS Decimal(18, 0)), N'150 мин', NULL, 25, N'Услуги автосервиса\Двигатель.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (42, N'Ремонт редуктора', CAST(870 AS Decimal(18, 0)), N'8 час', NULL, 15, N'Услуги автосервиса\КПП.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (43, N'Замена электромагнитного клапана без снятия ТНВД', CAST(4610 AS Decimal(18, 0)), N'450 мин', NULL, 10, N'Услуги автосервиса\diz.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (44, N'Вулканизация шин', CAST(540 AS Decimal(18, 0)), N'330 мин', NULL, 20, N'Услуги автосервиса\Шиномонтаж.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (45, N'Ремонт стартера', CAST(2680 AS Decimal(18, 0)), N'8 час', NULL, 0, N'Услуги автосервиса\Электрика.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (46, N'Ремонт коробки передач', CAST(1850 AS Decimal(18, 0)), N'450 мин', NULL, 25, N'Услуги автосервиса\КПП.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (47, N'Жидкостная промывка топливной системы', CAST(3620 AS Decimal(18, 0)), N'6 час', NULL, 15, N'Услуги автосервиса\Топливная система.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (48, N'Ремонт генератора', CAST(1700 AS Decimal(18, 0)), N'210 мин', NULL, 20, N'Услуги автосервиса\Электрика.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (49, N'Замена масла АКПП', CAST(2430 AS Decimal(18, 0)), N'450 мин', NULL, 25, N'Услуги автосервиса\АКПП.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (50, N'Диагностика трансмиссии', CAST(2790 AS Decimal(18, 0)), N'2 час', NULL, 20, N'Услуги автосервиса\transmission.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (51, N'Монтаж и снятие шин с диска', CAST(3990 AS Decimal(18, 0)), N'10 час', NULL, 15, N'Услуги автосервиса\Шиномонтаж.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (52, N'Замена подшипника передней ступицы', CAST(4020 AS Decimal(18, 0)), N'330 мин', NULL, 15, N'Услуги автосервиса\transmission.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (53, N'Замена главного цилиндра сцепления', CAST(4910 AS Decimal(18, 0)), N'150 мин', NULL, 5, N'Услуги автосервиса\Сцепление.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (54, N'Установка автомагнитолы', CAST(3210 AS Decimal(18, 0)), N'270 мин', NULL, 0, N'Услуги автосервиса\Электрика.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (55, N'Диагностика рулевых тяг', CAST(1680 AS Decimal(18, 0)), N'3 час', NULL, 5, N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (56, N'Замена радиатора кондиционера', CAST(1770 AS Decimal(18, 0)), N'9 час', NULL, 0, N'Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (57, N'Замена тормозной жидкости', CAST(2200 AS Decimal(18, 0)), N'6 час', NULL, 10, N'Услуги автосервиса\Техническое обслуживание.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (58, N'Ремонт рулевого управления', CAST(3440 AS Decimal(18, 0)), N'2 час', NULL, 20, N'Услуги автосервиса\Подвеска.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (59, N'Замена заднего редуктора', CAST(2240 AS Decimal(18, 0)), N'330 мин', NULL, 25, N'Услуги автосервиса\transmission.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (60, N'Дефектация CVT', CAST(1830 AS Decimal(18, 0)), N'3 час', NULL, 5, N'Услуги автосервиса\Вариатор.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (61, N'Замена карданного вала', CAST(4450 AS Decimal(18, 0)), N'2 час', NULL, 0, N'Услуги автосервиса\transmission.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (62, N'Замена сцепления', CAST(4320 AS Decimal(18, 0)), N'330 мин', NULL, 0, N'Услуги автосервиса\КПП.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (63, N'Установка системы автозапуска', CAST(3620 AS Decimal(18, 0)), N'9 час', NULL, 0, N'Услуги автосервиса\Электрика.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (64, N'Замена опоры АКПП', CAST(2540 AS Decimal(18, 0)), N'5 час', NULL, 10, N'Услуги автосервиса\АКПП.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (65, N'Ремонт бензонасоса', CAST(500 AS Decimal(18, 0)), N'210 мин', NULL, 15, N'Услуги автосервиса\Топливная система.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (66, N'Замена масла переднего редуктора (моста)', CAST(3950 AS Decimal(18, 0)), N'9 час', NULL, 5, N'Услуги автосервиса\transmission.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (67, N'Ремонт подвесного подшипника', CAST(4440 AS Decimal(18, 0)), N'7 час', NULL, 25, N'Услуги автосервиса\transmission.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (68, N'Тестирование форсунок (стенд)', CAST(1600 AS Decimal(18, 0)), N'6 час', NULL, 0, N'Услуги автосервиса\Топливная система.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (69, N'Диагностика сцепления', CAST(4210 AS Decimal(18, 0)), N'6 час', NULL, 20, N'Услуги автосервиса\Сцепление.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (70, N'Замена ступицы в сборе', CAST(4250 AS Decimal(18, 0)), N'150 мин', NULL, 20, N'Услуги автосервиса\transmission.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (71, N'Антибактериальная обработка кондиционера', CAST(4580 AS Decimal(18, 0)), N'450 мин', NULL, 20, N'Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (72, N'Ремонт глушителя', CAST(2100 AS Decimal(18, 0)), N'150 мин', NULL, 25, N'Услуги автосервиса\Выхлопная система.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (73, N'Диагностика рулевого редуктора', CAST(2930 AS Decimal(18, 0)), N'3 час', NULL, 10, N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (74, N'Диагностика подвески', CAST(1460 AS Decimal(18, 0)), N'330 мин', NULL, 0, N'Услуги автосервиса\Подвеска.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (75, N'Замена свечей', CAST(2240 AS Decimal(18, 0)), N'2 час', NULL, 10, N'Услуги автосервиса\Техническое обслуживание.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (76, N'Диагностика инжектора', CAST(3390 AS Decimal(18, 0)), N'330 мин', NULL, 5, N'Услуги автосервиса\Топливная система.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (77, N'Комплексная диагностика автомобиля', CAST(1120 AS Decimal(18, 0)), N'10 час', NULL, 0, N'Услуги автосервиса\Техническое обслуживание.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (78, N'Ремонт раздаточной коробки', CAST(3610 AS Decimal(18, 0)), N'10 час', NULL, 5, N'Услуги автосервиса\КПП.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (79, N'Удаление катализатора', CAST(1930 AS Decimal(18, 0)), N'510 мин', NULL, 10, N'Услуги автосервиса\Дополнительные услуги.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (80, N'Снятие/установка форсунок', CAST(1470 AS Decimal(18, 0)), N'5 час', NULL, 25, N'Услуги автосервиса\diz.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (81, N'Развал-схождение', CAST(3890 AS Decimal(18, 0)), N'3 час', NULL, 0, N'Услуги автосервиса\Подвеска.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (82, N'Замена выжимного подшипника', CAST(2250 AS Decimal(18, 0)), N'10 час', NULL, 5, N'Услуги автосервиса\Сцепление.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (83, N'Чистка форсунок ультразвуком', CAST(3920 AS Decimal(18, 0)), N'4 час', NULL, 5, N'Услуги автосервиса\Топливная система.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (84, N'Ремонт компрессора кондиционера', CAST(4760 AS Decimal(18, 0)), N'150 мин', NULL, 25, N'Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (85, N'Замена цилиндра сцепления', CAST(810 AS Decimal(18, 0)), N'8 час', NULL, 25, N'Услуги автосервиса\Сцепление.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (86, N'Ремонт подвески (ходовой)', CAST(680 AS Decimal(18, 0)), N'3 час', NULL, 5, N'Услуги автосервиса\Подвеска.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (87, N'Замена фильтров', CAST(530 AS Decimal(18, 0)), N'210 мин', NULL, 15, N'Услуги автосервиса\Техническое обслуживание.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (88, N'Кузовной ремонт', CAST(2750 AS Decimal(18, 0)), N'150 мин', NULL, 5, N'Услуги автосервиса\Дополнительные услуги.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (89, N'Замена прокладки приемной трубки', CAST(4680 AS Decimal(18, 0)), N'570 мин', NULL, 20, N'Услуги автосервиса\Выхлопная система.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (90, N'Диагностика выхлопной системы автомобиля', CAST(2550 AS Decimal(18, 0)), N'3 час', NULL, 25, N'Услуги автосервиса\Выхлопная система.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (91, N'Балансировка колес', CAST(4690 AS Decimal(18, 0)), N'390 мин', NULL, 25, N'Услуги автосервиса\Шиномонтаж.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (92, N'Ремонт автоэлектрики', CAST(4230 AS Decimal(18, 0)), N'450 мин', NULL, 10, N'Услуги автосервиса\Электрика.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (93, N'ТО с сохранением гарантии', CAST(4300 AS Decimal(18, 0)), N'270 мин', NULL, 20, N'Услуги автосервиса\Техническое обслуживание.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (94, N'Ремонт карданного вала', CAST(780 AS Decimal(18, 0)), N'210 мин', NULL, 5, N'Услуги автосервиса\transmission.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (95, N'Ремонт сцепления', CAST(3290 AS Decimal(18, 0)), N'10 час', NULL, 25, N'Услуги автосервиса\КПП.png')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (96, N'Замена кулисы АКПП', CAST(3250 AS Decimal(18, 0)), N'6 час', NULL, 10, N'Услуги автосервиса\АКПП.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (97, N'Ремонт кронштейна глушителя', CAST(1410 AS Decimal(18, 0)), N'570 мин', NULL, 0, N'Услуги автосервиса\Выхлопная система.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (98, N'Замена сальника привода', CAST(3820 AS Decimal(18, 0)), N'570 мин', NULL, 15, N'Услуги автосервиса\transmission.jpg')
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (99, N'Замена пыльника шруса', CAST(4730 AS Decimal(18, 0)), N'5 час', NULL, 0, N'Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg')
GO
INSERT [dbo].[service_a_import] ([ID], [Title], [Cost], [DurationlnSeconds], [Description], [Discount], [MainImagePath]) VALUES (100, N'Замена маховика', CAST(2400 AS Decimal(18, 0)), N'10 час', NULL, 25, N'Услуги автосервиса\Сцепление.jpg')
SET IDENTITY_INSERT [dbo].[service_a_import] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[client_a_import]  WITH CHECK ADD  CONSTRAINT [FK_client_a_import_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[client_a_import] CHECK CONSTRAINT [FK_client_a_import_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_client_a_import] FOREIGN KEY([ID])
REFERENCES [dbo].[client_a_import] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_client_a_import]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_service_a_import] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[service_a_import] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_service_a_import]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_service_a_import] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[service_a_import] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_service_a_import]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_client_a_import] FOREIGN KEY([ClientID])
REFERENCES [dbo].[client_a_import] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_client_a_import]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [garipov_autoservice] SET  READ_WRITE 
GO
