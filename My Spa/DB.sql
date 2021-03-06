USE [master]
GO
/****** Object:  Database [Spa]    Script Date: 10/13/2019 4:18:34 PM ******/
CREATE DATABASE [Spa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Spa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Spa.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Spa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Spa_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Spa] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Spa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Spa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Spa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Spa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Spa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Spa] SET ARITHABORT OFF 
GO
ALTER DATABASE [Spa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Spa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Spa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Spa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Spa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Spa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Spa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Spa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Spa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Spa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Spa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Spa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Spa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Spa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Spa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Spa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Spa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Spa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Spa] SET  MULTI_USER 
GO
ALTER DATABASE [Spa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Spa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Spa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Spa] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Spa] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Spa]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 10/13/2019 4:18:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[address] [varchar](max) NULL,
	[city] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[email] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 10/13/2019 4:18:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] NOT NULL,
	[title] [varchar](200) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[info] [varchar](max) NOT NULL,
	[date] [date] NOT NULL,
	[price] [float] NOT NULL,
	[alias] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/13/2019 4:18:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [nchar](10) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](max) NULL,
	[introduction] [varchar](max) NOT NULL,
	[img] [varchar](max) NOT NULL,
	[isOwner] [bit] NOT NULL,
	[title] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Introduce]    Script Date: 10/13/2019 4:18:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Introduce](
	[id] [int] NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[date] [datetime] NOT NULL,
	[img] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Introduce] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Service]    Script Date: 10/13/2019 4:18:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Service](
	[id] [int] NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[intro] [varchar](max) NOT NULL,
	[img] [varchar](max) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Time]    Script Date: 10/13/2019 4:18:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Time](
	[day] [varchar](20) NOT NULL,
	[startTime] [varchar](20) NULL,
	[endTime] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Treatment]    Script Date: 10/13/2019 4:18:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Treatment](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[serviceId] [int] NOT NULL,
	[infor] [varchar](max) NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_Treatment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Contact] ([address], [city], [country], [Phone], [email]) VALUES (NULL, NULL, NULL, N'12345', N'

your-email@your-email.com ')
INSERT [dbo].[Course] ([id], [title], [description], [info], [date], [price], [alias]) VALUES (1, N'Lorem ipsum dolor sit amet', N'This subject is an excellent introduction to the basic concepts of massage including posture, draping, positioning, hygiene and hand techniques. It is a great way of helping you to decide on your dream career - it can really be an inspiration! Or, you may just want to learn something new to practice on family and friends!', N'Demonstraverunt lectores', CAST(N'2013-08-15' AS Date), 111, N'Introductory Massage')
INSERT [dbo].[Course] ([id], [title], [description], [info], [date], [price], [alias]) VALUES (2, N'Eodem modo typi', N'We use a unique flexible training system to maximise the value you get from your learning. As well as meeting all government guidelines, our training allows you to learn at your own pace by choosing part-time, full-time or correspondence', N'Lorem ipsum dolor sit amet', CAST(N'2013-08-28' AS Date), 222, N'Certificate Course')
INSERT [dbo].[Employee] ([id], [name], [phone], [email], [introduction], [img], [isOwner], [title]) VALUES (N'1         ', N'Charlotte Robert', N'123-123-1234', N'health@123health.com', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed
                                                    diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', N'./Employees - www.simplesite.com_us-123health_files/i283445314494044460._szw480h1280_.jpg', 1, N'Masseur and sports masseur<br>(Medical and physiotherapist examined)')
INSERT [dbo].[Employee] ([id], [name], [phone], [email], [introduction], [img], [isOwner], [title]) VALUES (N'2         ', N'Louise Richard', NULL, NULL, N'Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum
                                                        est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima.', N'./Employees - www.simplesite.com_us-123health_files/i283445314494044470._szw480h1280_.jpg', 0, N'Aroma therapist')
INSERT [dbo].[Introduce] ([id], [Title], [description], [date], [img]) VALUES (1, N'Aromatherapy Means "Treatment Using Scents"', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', CAST(N'2019-10-16 00:00:00.000' AS DateTime), N'./Welcome - www.simplesite.com_us-123health_files/i283445314524568923._rsw480h360_szw480h360_.jpg')
INSERT [dbo].[Introduce] ([id], [Title], [description], [date], [img]) VALUES (2, N'Hot Stone Massage - A Variation On Classic Massage Therapy', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit.', CAST(N'2019-10-15 00:00:00.000' AS DateTime), N'./Welcome - www.simplesite.com_us-123health_files/i283445314491420783._rsw480h360_szw480h360_.jpg')
INSERT [dbo].[Introduce] ([id], [Title], [description], [date], [img]) VALUES (3, N'Massage - Effect On Both Body And Mind', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit.', CAST(N'2019-10-14 00:00:00.000' AS DateTime), N'./Welcome - www.simplesite.com_us-123health_files/i283445314489630203._rsw480h360_szw480h360_.jpg')
INSERT [dbo].[Service] ([id], [Title], [intro], [img]) VALUES (1, N'The Balance &amp; Harmony of Body and Mind', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip
 ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate.&nbsp;', N'./Therapy and Massage - www.simplesite.com_us-123health_files/i283445314541983971._szw480h1280_.jpg')
INSERT [dbo].[Service] ([id], [Title], [intro], [img]) VALUES (2, N'Hot Stone Massage', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip
 ex ea commodo consequat.&nbsp;odem modo typi, qui nunc nobis videntur.', N'./Therapy and Massage - www.simplesite.com_us-123health_files/i283445314494038717._szw480h1280_.jpg')
INSERT [dbo].[Service] ([id], [Title], [intro], [img]) VALUES (3, N'Therapeutic Massage', N'Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit
 litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', N'./Therapy and Massage - www.simplesite.com_us-123health_files/i283445314494040127._szw480h1280_.jpg')
INSERT [dbo].[Time] ([day], [startTime], [endTime]) VALUES (N'Monday', N'9', N'15')
INSERT [dbo].[Time] ([day], [startTime], [endTime]) VALUES (N'Tuesday', N'9', N'15')
INSERT [dbo].[Time] ([day], [startTime], [endTime]) VALUES (N'Wednesday ', NULL, NULL)
INSERT [dbo].[Time] ([day], [startTime], [endTime]) VALUES (N'Thursday ', N'9', N'15')
INSERT [dbo].[Time] ([day], [startTime], [endTime]) VALUES (N'Friday ', N'9', N'14')
INSERT [dbo].[Treatment] ([id], [name], [serviceId], [infor], [price]) VALUES (1, N'Lorem ipsum dolor sit amet', 1, N'20 minutes', 11)
INSERT [dbo].[Treatment] ([id], [name], [serviceId], [infor], [price]) VALUES (2, N'Demonstraverunt lectores', 2, N'40 minutes', 22)
INSERT [dbo].[Treatment] ([id], [name], [serviceId], [infor], [price]) VALUES (3, N'Eodem modo typi', 3, N'1 hour', 33)
INSERT [dbo].[Treatment] ([id], [name], [serviceId], [infor], [price]) VALUES (4, N'Demonstraverunt lectores', 2, N'30 minutes', 44)
INSERT [dbo].[Treatment] ([id], [name], [serviceId], [infor], [price]) VALUES (5, N'Lorem ipsum dolor sit amet', 1, N'30 minutes', 55)
ALTER TABLE [dbo].[Treatment]  WITH CHECK ADD  CONSTRAINT [FK_Treatment_Service] FOREIGN KEY([serviceId])
REFERENCES [dbo].[Service] ([id])
GO
ALTER TABLE [dbo].[Treatment] CHECK CONSTRAINT [FK_Treatment_Service]
GO
USE [master]
GO
ALTER DATABASE [Spa] SET  READ_WRITE 
GO
