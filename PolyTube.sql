﻿CREATE DATABASE [PolyTube]
GO
USE [PolyTube]
GO

CREATE TABLE [dbo].[FAVORITE](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[USERID] [nvarchar](10) NOT NULL,
	[VIDEO] [nvarchar](10) NOT NULL,
	[LIKEDATE] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHARES](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[USERID] [nvarchar](10) NOT NULL,
	[VIDEO] [nvarchar](10) NOT NULL,
	[EMAIL] [nvarchar](50) NOT NULL,
	[SHAREDATE] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[ID] [nvarchar](10) NOT NULL,
	[PASSWORDS] [nvarchar](30) NOT NULL,
	[EMAIL] [nvarchar](50) NOT NULL,
	[FULLNAME] [nvarchar](40) NOT NULL,
	[ADMIN] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIDEO](
	[ID] [nvarchar](10) NOT NULL,
	[TITLE] [nvarchar](50) NOT NULL,
	[POSTER] [nvarchar](50) NOT NULL,
	[VIEWS] [int] NOT NULL,
	[DISCRIPTIONS] [nvarchar](max) NULL,
	[HREF] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FAVORITE] ON 
INSERT [dbo].[FAVORITE] ([ID], [USERID], [VIDEO], [LIKEDATE]) VALUES (13, N'admin@123', N'VD03', CAST(N'2023-04-11' AS Date))
SET IDENTITY_INSERT [dbo].[FAVORITE] OFF




GO
SET IDENTITY_INSERT [dbo].[SHARES] ON 
INSERT [dbo].[SHARES] ([ID], [USERID], [VIDEO], [EMAIL], [SHAREDATE]) VALUES (3, N'admin@123', N'VD05', N'thanhtmps25076@fpt.edu.vn', CAST(N'2023-04-11' AS Date))
INSERT [dbo].[SHARES] ([ID], [USERID], [VIDEO], [EMAIL], [SHAREDATE]) VALUES (4, N'admin@123', N'VD04', N'thanhtmps25076@fpt.edu.vn', CAST(N'2023-04-11' AS Date))
SET IDENTITY_INSERT [dbo].[SHARES] OFF



GO
INSERT [dbo].[USERS] ([ID], [PASSWORDS], [EMAIL], [FULLNAME], [ADMIN]) VALUES (N'admin@123', N'123', N'ThanhMT@gmail.com', N'Trần Mạnh Thành', 1)

GO
INSERT [dbo].[VIDEO] ([ID], [TITLE], [POSTER], [VIEWS], [DISCRIPTIONS], [HREF]) VALUES (N'VD01', N'TỪ ĐÓ - PHAN MẠNH QUỲNH |MẮT BIẾC OST', N'/templates/user/img2/VD01.jpg', 39, N'OST Mắt Biếc. Sáng tác và trình bày: Phan Mạnh Quỳnh Hoà âm,...', N'HsgTIMDA6ps')
GO
