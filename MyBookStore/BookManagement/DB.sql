USE [master]
GO
/****** Object:  Database [BookDB]    Script Date: 11/28/2019 8:38:02 PM ******/
CREATE DATABASE [BookDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BookDB.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BookDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BookDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BookDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookDB] SET  MULTI_USER 
GO
ALTER DATABASE [BookDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BookDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BookDB]
GO
/****** Object:  Table [dbo].[tbl_Book]    Script Date: 11/28/2019 8:38:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Book](
	[bookID] [varchar](10) NOT NULL,
	[bookTitle] [nvarchar](50) NOT NULL,
	[image] [nvarchar](50) NOT NULL,
	[categoryID] [nvarchar](50) NOT NULL,
	[author] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[importDate] [date] NOT NULL CONSTRAINT [DF__tbl_Book__import__37A5467C]  DEFAULT (getdate()),
	[isActive] [bit] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK__tbl_Book__8BE5A12D2DF2738F] PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Category]    Script Date: 11/28/2019 8:38:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Category](
	[categoryID] [nvarchar](50) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__tbl_Cate__23CAF1F864F08A5E] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Discount]    Script Date: 11/28/2019 8:38:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Discount](
	[discountCode] [nvarchar](50) NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
	[discountPercent] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK__tbl_Disc__3D87979B17F6C23B] PRIMARY KEY CLUSTERED 
(
	[discountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Order]    Script Date: 11/28/2019 8:38:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
	[totalPrice] [float] NOT NULL,
	[shoppingDate] [datetime] NOT NULL CONSTRAINT [DF_tbl_Cart_shoppingDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_tbl_Cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_OrderDetail]    Script Date: 11/28/2019 8:38:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_OrderDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[BookId] [varchar](10) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_tbl_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Role]    Script Date: 11/28/2019 8:38:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Role](
	[roleID] [nvarchar](50) NOT NULL,
	[roleName] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Role] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 11/28/2019 8:38:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[userID] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[roleID] [nvarchar](50) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tbl_Book] ([bookID], [bookTitle], [image], [categoryID], [author], [price], [importDate], [isActive], [description], [quantity]) VALUES (N'B01', N'Doreamon v3', N'5.jpg', N'1', N'BInBIn', 100, CAST(N'2019-11-15' AS Date), 0, N'comic book ahihihih', 10)
INSERT [dbo].[tbl_Book] ([bookID], [bookTitle], [image], [categoryID], [author], [price], [importDate], [isActive], [description], [quantity]) VALUES (N'B02', N'AAAA', N'2.jpg', N'2', N'Hieu Ngao', 10, CAST(N'2019-06-02' AS Date), 1, N'ahihi', 1)
INSERT [dbo].[tbl_Book] ([bookID], [bookTitle], [image], [categoryID], [author], [price], [importDate], [isActive], [description], [quantity]) VALUES (N'B03', N'Camp Rock', N'1.jpg', N'1', N'ahihihi', 1000, CAST(N'2019-06-02' AS Date), 1, N'ahuhu vlll', 9)
INSERT [dbo].[tbl_Book] ([bookID], [bookTitle], [image], [categoryID], [author], [price], [importDate], [isActive], [description], [quantity]) VALUES (N'B04', N'CCCC', N'4.jpg', N'3', N'Hieu moazz', 10, CAST(N'2019-02-06' AS Date), 1, N'AHAHAH', 10)
INSERT [dbo].[tbl_Book] ([bookID], [bookTitle], [image], [categoryID], [author], [price], [importDate], [isActive], [description], [quantity]) VALUES (N'B111', N'2hy8uguh', N'3.jpg', N'1', N'rtdrghgj', 100, CAST(N'2019-11-27' AS Date), 1, N'cvbnnnnn', 11)
INSERT [dbo].[tbl_Book] ([bookID], [bookTitle], [image], [categoryID], [author], [price], [importDate], [isActive], [description], [quantity]) VALUES (N'B92', N'AAAAA', N'4.jpg', N'1', N'Hieuxinhdep', 100, CAST(N'2019-11-27' AS Date), 0, N'ddd', 21)
INSERT [dbo].[tbl_Category] ([categoryID], [categoryName]) VALUES (N'1', N'Romantic')
INSERT [dbo].[tbl_Category] ([categoryID], [categoryName]) VALUES (N'2', N'Drama')
INSERT [dbo].[tbl_Category] ([categoryID], [categoryName]) VALUES (N'3', N'Horror')
INSERT [dbo].[tbl_Category] ([categoryID], [categoryName]) VALUES (N'4', N'Physical')
INSERT [dbo].[tbl_Category] ([categoryID], [categoryName]) VALUES (N'5', N'Science')
INSERT [dbo].[tbl_Discount] ([discountCode], [userID], [isActive], [discountPercent], [createDate]) VALUES (N'AAA16', N'SE02', 1, 10, CAST(N'2019-11-28 20:11:06.437' AS DateTime))
INSERT [dbo].[tbl_Discount] ([discountCode], [userID], [isActive], [discountPercent], [createDate]) VALUES (N'hieu', N'SE01', 1, 20, CAST(N'1999-10-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_Discount] ([discountCode], [userID], [isActive], [discountPercent], [createDate]) VALUES (N'thanh', N'SE01', 0, 20, CAST(N'1999-10-23 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_Order] ON 

INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (1, N'SE01', 1, CAST(N'2019-10-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (2, N'SE02', 2220, CAST(N'2019-11-28 15:17:20.077' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (3, N'SE02', 200, CAST(N'2019-11-28 15:19:32.947' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (4, N'SE02', 1110, CAST(N'2019-11-28 15:22:00.603' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (5, N'SE02', 1010, CAST(N'2019-11-28 15:56:05.907' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (6, N'SE02', 1080, CAST(N'2019-11-28 15:57:41.050' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (7, N'SE02', 1010, CAST(N'2019-11-28 15:58:35.100' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (8, N'SE02', 1010, CAST(N'2019-11-28 15:58:35.373' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (9, N'SE02', 3000, CAST(N'2019-11-28 16:01:09.927' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (10, N'SE02', 1010, CAST(N'2019-11-28 16:02:57.023' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (11, N'se02', 1100, CAST(N'2019-11-28 16:12:20.627' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (12, N'se02', 1100, CAST(N'2019-11-28 16:16:09.723' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (13, N'se02', 1100, CAST(N'2019-11-28 16:17:53.037' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (14, N'se02', 1100, CAST(N'2019-11-28 16:19:11.840' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (15, N'se02', 1100, CAST(N'2019-11-28 16:20:24.970' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (16, N'se02', 1100, CAST(N'2019-11-28 16:23:41.143' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (17, N'se02', 1200, CAST(N'2019-11-28 16:24:17.420' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (18, N'se02', 1200, CAST(N'2019-11-28 16:25:21.847' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (19, N'SE02', 1010, CAST(N'2019-11-28 16:26:11.103' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (20, N'SE02', 1110, CAST(N'2019-11-28 16:38:51.413' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (21, N'SE02', 1120, CAST(N'2019-11-28 16:40:36.343' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (22, N'SE02', 2100, CAST(N'2019-11-28 16:42:30.010' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (23, N'SE02', 100, CAST(N'2019-11-28 16:43:49.763' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (24, N'SE02', 1010, CAST(N'2019-11-28 16:48:39.450' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (25, N'SE02', 2000, CAST(N'2019-11-28 16:50:37.593' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (26, N'SE02', 1000, CAST(N'2019-11-28 16:51:13.107' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (27, N'SE02', 2000, CAST(N'2019-11-28 16:54:11.807' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (28, N'SE02', 4000, CAST(N'2019-11-28 16:55:31.057' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (29, N'SE02', 1010, CAST(N'2019-11-28 16:55:55.190' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (30, N'SE02', 1000, CAST(N'2019-11-28 16:57:02.783' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (31, N'SE02', 1000, CAST(N'2019-11-28 16:59:55.447' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (32, N'SE02', 10, CAST(N'2019-11-28 18:43:51.110' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (33, N'SE02', 1012430, CAST(N'2019-11-28 19:02:12.730' AS DateTime))
INSERT [dbo].[tbl_Order] ([id], [userID], [totalPrice], [shoppingDate]) VALUES (34, N'SE07', 1000, CAST(N'2019-11-28 20:30:36.367' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_Order] OFF
SET IDENTITY_INSERT [dbo].[tbl_OrderDetail] ON 

INSERT [dbo].[tbl_OrderDetail] ([ID], [OrderId], [BookId], [Title], [Quantity], [Price]) VALUES (3, 1, N'B01', N'dsd', 1, 1)
INSERT [dbo].[tbl_OrderDetail] ([ID], [OrderId], [BookId], [Title], [Quantity], [Price]) VALUES (11, 31, N'B03', N'Camp Rock', 1, 1000)
INSERT [dbo].[tbl_OrderDetail] ([ID], [OrderId], [BookId], [Title], [Quantity], [Price]) VALUES (12, 32, N'B02', N'AAAA', 1, 10)
INSERT [dbo].[tbl_OrderDetail] ([ID], [OrderId], [BookId], [Title], [Quantity], [Price]) VALUES (13, 33, N'B03', N'Camp Rock', 1000, 1000000)
INSERT [dbo].[tbl_OrderDetail] ([ID], [OrderId], [BookId], [Title], [Quantity], [Price]) VALUES (14, 33, N'B04', N'CCCC', 1233, 12330)
INSERT [dbo].[tbl_OrderDetail] ([ID], [OrderId], [BookId], [Title], [Quantity], [Price]) VALUES (15, 33, N'B92', N'AAAAA', 1, 100)
INSERT [dbo].[tbl_OrderDetail] ([ID], [OrderId], [BookId], [Title], [Quantity], [Price]) VALUES (16, 34, N'B03', N'Camp Rock', 1, 1000)
SET IDENTITY_INSERT [dbo].[tbl_OrderDetail] OFF
INSERT [dbo].[tbl_Role] ([roleID], [roleName]) VALUES (N'1', N'admin')
INSERT [dbo].[tbl_Role] ([roleID], [roleName]) VALUES (N'2', N'user')
INSERT [dbo].[tbl_User] ([userID], [password], [roleID], [userName], [isActive]) VALUES (N'SE01', N'123', N'1', N'Hieu', 1)
INSERT [dbo].[tbl_User] ([userID], [password], [roleID], [userName], [isActive]) VALUES (N'SE02', N'123', N'2', N'Thanh', 1)
INSERT [dbo].[tbl_User] ([userID], [password], [roleID], [userName], [isActive]) VALUES (N'SE03', N'123', N'1', N'Minh', 0)
INSERT [dbo].[tbl_User] ([userID], [password], [roleID], [userName], [isActive]) VALUES (N'SE05', N'123', N'1', N'Hieu123', 1)
INSERT [dbo].[tbl_User] ([userID], [password], [roleID], [userName], [isActive]) VALUES (N'SE06', N'123', N'2', N'Minh Thanh', 1)
INSERT [dbo].[tbl_User] ([userID], [password], [roleID], [userName], [isActive]) VALUES (N'SE07', N'123', N'2', N'dunmapdit', 1)
ALTER TABLE [dbo].[tbl_Book]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Book_tbl_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tbl_Category] ([categoryID])
GO
ALTER TABLE [dbo].[tbl_Book] CHECK CONSTRAINT [FK_tbl_Book_tbl_Category]
GO
ALTER TABLE [dbo].[tbl_Discount]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Discount_tbl_User] FOREIGN KEY([userID])
REFERENCES [dbo].[tbl_User] ([userID])
GO
ALTER TABLE [dbo].[tbl_Discount] CHECK CONSTRAINT [FK_tbl_Discount_tbl_User]
GO
ALTER TABLE [dbo].[tbl_Order]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Cart_tbl_User] FOREIGN KEY([userID])
REFERENCES [dbo].[tbl_User] ([userID])
GO
ALTER TABLE [dbo].[tbl_Order] CHECK CONSTRAINT [FK_tbl_Cart_tbl_User]
GO
ALTER TABLE [dbo].[tbl_OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_OrderDetail_tbl_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[tbl_Book] ([bookID])
GO
ALTER TABLE [dbo].[tbl_OrderDetail] CHECK CONSTRAINT [FK_tbl_OrderDetail_tbl_Book]
GO
ALTER TABLE [dbo].[tbl_OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_OrderDetail_tbl_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[tbl_Order] ([id])
GO
ALTER TABLE [dbo].[tbl_OrderDetail] CHECK CONSTRAINT [FK_tbl_OrderDetail_tbl_Order]
GO
ALTER TABLE [dbo].[tbl_User]  WITH CHECK ADD  CONSTRAINT [FK_tbl_User_tbl_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[tbl_Role] ([roleID])
GO
ALTER TABLE [dbo].[tbl_User] CHECK CONSTRAINT [FK_tbl_User_tbl_Role]
GO
USE [master]
GO
ALTER DATABASE [BookDB] SET  READ_WRITE 
GO
