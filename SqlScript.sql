USE [RestaurantDB]
GO
/****** Object:  Schema [Master]    Script Date: 5/29/2021 8:29:03 PM ******/
CREATE SCHEMA [Master]
GO
/****** Object:  Schema [Order]    Script Date: 5/29/2021 8:29:03 PM ******/
CREATE SCHEMA [Order]
GO
/****** Object:  UserDefinedTableType [dbo].[EmpTableType]    Script Date: 5/29/2021 8:29:03 PM ******/
CREATE TYPE [dbo].[EmpTableType] AS TABLE(
	[Id] [int] NULL,
	[Name] [varchar](10) NULL,
	[Gender] [char](1) NULL
)
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5/29/2021 8:29:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] NULL,
	[Name] [varchar](10) NULL,
	[Gender] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[Customer]    Script Date: 5/29/2021 8:29:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[Item]    Script Date: 5/29/2021 8:29:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Item](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nchar](10) NOT NULL,
	[ItemPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[PaymentType]    Script Date: 5/29/2021 8:29:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[PaymentType](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentTypeName] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Order].[Order]    Script Date: 5/29/2021 8:29:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Order].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[OrderNumber] [varchar](250) NOT NULL,
	[OrderDate] [smalldatetime] NOT NULL,
	[PaymentTotal] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Order].[OrderDetail]    Script Date: 5/29/2021 8:29:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Order].[OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[ItemPrice] [decimal](18, 0) NOT NULL,
	[Qty] [int] NOT NULL,
	[Discount] [decimal](18, 0) NOT NULL,
	[Total] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Order].[Transaction]    Script Date: 5/29/2021 8:29:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Order].[Transaction](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[TransactionDate] [smalldatetime] NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Order].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [Order].[Order] ([OrderId])
GO
ALTER TABLE [Order].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
/****** Object:  StoredProcedure [dbo].[spInsertEmployee]    Script Date: 5/29/2021 8:29:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create Procedure [dbo].[spInsertEmployee]
   @EmpTableType EmpTableType ReadOnly
   as
   begin
      Insert into Employee Select * from @EmpTableType
   End
GO
