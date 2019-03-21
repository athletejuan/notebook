DROP DATABASE [PurchasingSystem]
CREATE DATABASE  [PurchasingSystem]
GO
USE [PurchasingSystem]
GO
/****** Object:  Table [dbo].[PO_EMPLOYEER]    Script Date: 2019-02-11 오후 3:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PO_EMPLOYEER](
	[EMP_NO] [int] NOT NULL,
	[EMP_NAME] [char](12) NOT NULL,
	[EMP_DEP] [char](20) NOT NULL,
	[EMP_PHONE] [char](12) NOT NULL,
	[EMP_LEVEL] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EMP_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PO_ITEM]    Script Date: 2019-02-11 오후 3:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PO_ITEM](
	[ITEM_NO] [char](5) NOT NULL,
	[ITEM_NAME] [char](40) NOT NULL,
	[UNIT_PRICE] [int] NOT NULL,
	[ITEM_UNIT] [char](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ITEM_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PO_ORDER_DETAIL]    Script Date: 2019-02-11 오후 3:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PO_ORDER_DETAIL](
	[ORD_NO] [char](8) NOT NULL,
	[LINE_NO] [int] NOT NULL,
	[ITEM_NO] [char](5) NULL,
	[ORD_QTY] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ORD_NO] ASC,
	[LINE_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PO_ORDER_HEADER]    Script Date: 2019-02-11 오후 3:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PO_ORDER_HEADER](
	[ORD_NO] [char](8) NOT NULL,
	[ORD_DATE] [date] NOT NULL,
	[DUE_DATE] [date] NOT NULL,
	[SUP_NO] [char](4) NULL,
	[ORD_EMP] [int] NOT NULL,
	[DELV_DATE] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ORD_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PO_SUPPLIER]    Script Date: 2019-02-11 오후 3:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PO_SUPPLIER](
	[SUP_NO] [char](4) NOT NULL,
	[SUP_NAME] [char](40) NOT NULL,
	[SUP_ADDR] [char](40) NOT NULL,
	[SUP_PHONE] [char](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SUP_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[PO_EMPLOYEER] ([EMP_NO], [EMP_NAME], [EMP_DEP], [EMP_PHONE], [EMP_LEVEL]) VALUES (11111, N'신승훈      ', N'구매팀              ', N'548-2792    ', N'과장      ')
INSERT [dbo].[PO_EMPLOYEER] ([EMP_NO], [EMP_NAME], [EMP_DEP], [EMP_PHONE], [EMP_LEVEL]) VALUES (22222, N'박찬호      ', N'홍보부              ', N'548-2792    ', N'대리      ')
INSERT [dbo].[PO_EMPLOYEER] ([EMP_NO], [EMP_NAME], [EMP_DEP], [EMP_PHONE], [EMP_LEVEL]) VALUES (33333, N'강명훈      ', N'구매팀              ', N'548-2792    ', N'사원      ')
INSERT [dbo].[PO_EMPLOYEER] ([EMP_NO], [EMP_NAME], [EMP_DEP], [EMP_PHONE], [EMP_LEVEL]) VALUES (44444, N'한득구      ', N'외자팀              ', N'548-2792    ', N'대리      ')
INSERT [dbo].[PO_EMPLOYEER] ([EMP_NO], [EMP_NAME], [EMP_DEP], [EMP_PHONE], [EMP_LEVEL]) VALUES (55555, N'만득이      ', N'구매팀              ', N'548-2792    ', N'과장      ')
INSERT [dbo].[PO_EMPLOYEER] ([EMP_NO], [EMP_NAME], [EMP_DEP], [EMP_PHONE], [EMP_LEVEL]) VALUES (66666, N'윤희경      ', N'구매팀              ', N'548-2792    ', N'사원      ')
INSERT [dbo].[PO_ITEM] ([ITEM_NO], [ITEM_NAME], [UNIT_PRICE], [ITEM_UNIT]) VALUES (N'IT001', N'CONTROLLER                              ', 115000, N'SET')
INSERT [dbo].[PO_ITEM] ([ITEM_NO], [ITEM_NAME], [UNIT_PRICE], [ITEM_UNIT]) VALUES (N'IT002', N'SWITCH                                  ', 5000, N'EA ')
INSERT [dbo].[PO_ITEM] ([ITEM_NO], [ITEM_NAME], [UNIT_PRICE], [ITEM_UNIT]) VALUES (N'IT003', N'CC TV                                   ', 210000, N'EA ')
INSERT [dbo].[PO_ITEM] ([ITEM_NO], [ITEM_NAME], [UNIT_PRICE], [ITEM_UNIT]) VALUES (N'IT004', N'AIR FILTER                              ', 15000, N'EA ')
INSERT [dbo].[PO_ITEM] ([ITEM_NO], [ITEM_NAME], [UNIT_PRICE], [ITEM_UNIT]) VALUES (N'IT005', N'DIODE                                   ', 10000, N'BOX')
INSERT [dbo].[PO_ITEM] ([ITEM_NO], [ITEM_NAME], [UNIT_PRICE], [ITEM_UNIT]) VALUES (N'IT006', N'TRANSISTER                              ', 14000, N'BOX')
INSERT [dbo].[PO_ITEM] ([ITEM_NO], [ITEM_NAME], [UNIT_PRICE], [ITEM_UNIT]) VALUES (N'IT007', N'CONDENSOR                               ', 5000, N'BOX')
INSERT [dbo].[PO_ITEM] ([ITEM_NO], [ITEM_NAME], [UNIT_PRICE], [ITEM_UNIT]) VALUES (N'IT008', N'WIRE                                    ', 5500, N'ROL')
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971201', 1, N'IT001', 100)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971201', 2, N'IT002', 1100)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971201', 3, N'IT003', 150)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971202', 1, N'IT004', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971202', 2, N'IT005', 1)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971203', 1, N'IT006', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971203', 2, N'IT007', 50)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971203', 3, N'IT008', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971203', 4, N'IT001', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971204', 1, N'IT002', 1)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971205', 1, N'IT003', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971205', 2, N'IT004', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971205', 3, N'IT005', 140)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971206', 1, N'IT006', 120)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971206', 2, N'IT008', 1)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971207', 1, N'IT001', 12)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971208', 1, N'IT002', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971209', 1, N'IT003', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971210', 1, N'IT004', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971210', 2, N'IT005', 12)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971210', 3, N'IT006', 16)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971210', 4, N'IT007', 18)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971211', 1, N'IT008', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971211', 2, N'IT001', 1)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971211', 3, N'IT002', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971212', 1, N'IT004', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971212', 2, N'IT007', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971212', 3, N'IT001', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971212', 4, N'IT003', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971213', 1, N'IT008', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971213', 2, N'IT001', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971213', 3, N'IT005', 130)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971213', 4, N'IT007', 120)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971214', 1, N'IT002', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971214', 2, N'IT005', 110)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971214', 3, N'IT007', 100)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971215', 1, N'IT001', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971215', 2, N'IT001', 170)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971216', 1, N'IT002', 10)
INSERT [dbo].[PO_ORDER_DETAIL] ([ORD_NO], [LINE_NO], [ITEM_NO], [ORD_QTY]) VALUES (N'19971216', 2, N'IT005', 190)
INSERT [dbo].[PO_ORDER_HEADER] ([ORD_NO], [ORD_DATE], [DUE_DATE], [SUP_NO], [ORD_EMP], [DELV_DATE]) VALUES (N'19971201', CAST(N'1997-12-01' AS Date), CAST(N'1997-12-15' AS Date), N'S001', 11111, CAST(N'1997-12-15' AS Date))
INSERT [dbo].[PO_ORDER_HEADER] ([ORD_NO], [ORD_DATE], [DUE_DATE], [SUP_NO], [ORD_EMP], [DELV_DATE]) VALUES (N'19971202', CAST(N'1997-12-01' AS Date), CAST(N'1997-12-15' AS Date), N'S002', 11111, CAST(N'1997-12-16' AS Date))
INSERT [dbo].[PO_ORDER_HEADER] ([ORD_NO], [ORD_DATE], [DUE_DATE], [SUP_NO], [ORD_EMP], [DELV_DATE]) VALUES (N'19971203', CAST(N'1997-12-02' AS Date), CAST(N'1997-12-20' AS Date), N'S003', 33333, CAST(N'1997-12-20' AS Date))
INSERT [dbo].[PO_ORDER_HEADER] ([ORD_NO], [ORD_DATE], [DUE_DATE], [SUP_NO], [ORD_EMP], [DELV_DATE]) VALUES (N'19971204', CAST(N'1997-12-02' AS Date), CAST(N'1997-12-25' AS Date), N'S004', 33333, CAST(N'1997-12-28' AS Date))
INSERT [dbo].[PO_ORDER_HEADER] ([ORD_NO], [ORD_DATE], [DUE_DATE], [SUP_NO], [ORD_EMP], [DELV_DATE]) VALUES (N'19971205', CAST(N'1997-12-03' AS Date), CAST(N'1997-12-25' AS Date), N'S005', 66666, CAST(N'1997-12-28' AS Date))
INSERT [dbo].[PO_ORDER_HEADER] ([ORD_NO], [ORD_DATE], [DUE_DATE], [SUP_NO], [ORD_EMP], [DELV_DATE]) VALUES (N'19971206', CAST(N'1997-12-04' AS Date), CAST(N'1997-12-30' AS Date), N'S006', 66666, CAST(N'1997-12-29' AS Date))
INSERT [dbo].[PO_ORDER_HEADER] ([ORD_NO], [ORD_DATE], [DUE_DATE], [SUP_NO], [ORD_EMP], [DELV_DATE]) VALUES (N'19971207', CAST(N'1997-12-05' AS Date), CAST(N'1997-12-30' AS Date), N'S001', 11111, CAST(N'1997-12-30' AS Date))
INSERT [dbo].[PO_ORDER_HEADER] ([ORD_NO], [ORD_DATE], [DUE_DATE], [SUP_NO], [ORD_EMP], [DELV_DATE]) VALUES (N'19971208', CAST(N'1997-12-05' AS Date), CAST(N'1997-12-30' AS Date), N'S002', 33333, CAST(N'1997-12-30' AS Date))
INSERT [dbo].[PO_ORDER_HEADER] ([ORD_NO], [ORD_DATE], [DUE_DATE], [SUP_NO], [ORD_EMP], [DELV_DATE]) VALUES (N'19971209', CAST(N'1997-12-08' AS Date), CAST(N'1997-12-26' AS Date), N'S003', 11111, CAST(N'1997-12-28' AS Date))
INSERT [dbo].[PO_ORDER_HEADER] ([ORD_NO], [ORD_DATE], [DUE_DATE], [SUP_NO], [ORD_EMP], [DELV_DATE]) VALUES (N'19971210', CAST(N'1997-12-09' AS Date), CAST(N'1997-12-25' AS Date), N'S004', 11111, CAST(N'1997-12-25' AS Date))
INSERT [dbo].[PO_ORDER_HEADER] ([ORD_NO], [ORD_DATE], [DUE_DATE], [SUP_NO], [ORD_EMP], [DELV_DATE]) VALUES (N'19971211', CAST(N'1997-12-12' AS Date), CAST(N'1998-01-05' AS Date), N'S005', 66666, CAST(N'1998-01-07' AS Date))
INSERT [dbo].[PO_ORDER_HEADER] ([ORD_NO], [ORD_DATE], [DUE_DATE], [SUP_NO], [ORD_EMP], [DELV_DATE]) VALUES (N'19971212', CAST(N'1997-12-14' AS Date), CAST(N'1998-01-08' AS Date), N'S006', 22222, CAST(N'1998-02-01' AS Date))
INSERT [dbo].[PO_ORDER_HEADER] ([ORD_NO], [ORD_DATE], [DUE_DATE], [SUP_NO], [ORD_EMP], [DELV_DATE]) VALUES (N'19971213', CAST(N'1997-12-16' AS Date), CAST(N'1998-01-09' AS Date), N'S001', 66666, NULL)
INSERT [dbo].[PO_ORDER_HEADER] ([ORD_NO], [ORD_DATE], [DUE_DATE], [SUP_NO], [ORD_EMP], [DELV_DATE]) VALUES (N'19971214', CAST(N'1997-12-17' AS Date), CAST(N'1998-02-20' AS Date), N'S002', 11111, NULL)
INSERT [dbo].[PO_ORDER_HEADER] ([ORD_NO], [ORD_DATE], [DUE_DATE], [SUP_NO], [ORD_EMP], [DELV_DATE]) VALUES (N'19971215', CAST(N'1997-12-18' AS Date), CAST(N'1998-03-01' AS Date), N'S003', 11111, NULL)
INSERT [dbo].[PO_ORDER_HEADER] ([ORD_NO], [ORD_DATE], [DUE_DATE], [SUP_NO], [ORD_EMP], [DELV_DATE]) VALUES (N'19971216', CAST(N'1997-12-19' AS Date), CAST(N'1998-01-09' AS Date), N'S004', 44444, NULL)
INSERT [dbo].[PO_SUPPLIER] ([SUP_NO], [SUP_NAME], [SUP_ADDR], [SUP_PHONE]) VALUES (N'S001', N'대명전기                                ', N'인천시 부평동                           ', N'432-5344    ')
INSERT [dbo].[PO_SUPPLIER] ([SUP_NO], [SUP_NAME], [SUP_ADDR], [SUP_PHONE]) VALUES (N'S002', N'한진엔지니어링                          ', N'인천시 부평동                           ', N'345-6543    ')
INSERT [dbo].[PO_SUPPLIER] ([SUP_NO], [SUP_NAME], [SUP_ADDR], [SUP_PHONE]) VALUES (N'S003', N'우성전업사                              ', N'인천시 효성동                           ', N'165-6587    ')
INSERT [dbo].[PO_SUPPLIER] ([SUP_NO], [SUP_NAME], [SUP_ADDR], [SUP_PHONE]) VALUES (N'S004', N'LG전자                                  ', N'경기도 부천시 계수동                    ', N'984-8376    ')
INSERT [dbo].[PO_SUPPLIER] ([SUP_NO], [SUP_NAME], [SUP_ADDR], [SUP_PHONE]) VALUES (N'S005', N'동서전기                                ', N'인천시 작전동                           ', N'345-6543    ')
INSERT [dbo].[PO_SUPPLIER] ([SUP_NO], [SUP_NAME], [SUP_ADDR], [SUP_PHONE]) VALUES (N'S006', N'일신상사                                ', N'경기도 부천시 내동                      ', N'234-3746    ')
ALTER TABLE [dbo].[PO_ORDER_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_ORDERDTL_ITEMNO] FOREIGN KEY([ITEM_NO])
REFERENCES [dbo].[PO_ITEM] ([ITEM_NO])
GO
ALTER TABLE [dbo].[PO_ORDER_DETAIL] CHECK CONSTRAINT [FK_ORDERDTL_ITEMNO]
GO
ALTER TABLE [dbo].[PO_ORDER_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_ORDERDTL_ORDNO] FOREIGN KEY([ORD_NO])
REFERENCES [dbo].[PO_ORDER_HEADER] ([ORD_NO])
GO
ALTER TABLE [dbo].[PO_ORDER_DETAIL] CHECK CONSTRAINT [FK_ORDERDTL_ORDNO]
GO
ALTER TABLE [dbo].[PO_ORDER_HEADER]  WITH CHECK ADD  CONSTRAINT [FK_ORDERHD_ORDEMP] FOREIGN KEY([ORD_EMP])
REFERENCES [dbo].[PO_EMPLOYEER] ([EMP_NO])
GO
ALTER TABLE [dbo].[PO_ORDER_HEADER] CHECK CONSTRAINT [FK_ORDERHD_ORDEMP]
GO
ALTER TABLE [dbo].[PO_ORDER_HEADER]  WITH CHECK ADD  CONSTRAINT [FK_ORDERHD_SUPNO] FOREIGN KEY([SUP_NO])
REFERENCES [dbo].[PO_SUPPLIER] ([SUP_NO])
GO
ALTER TABLE [dbo].[PO_ORDER_HEADER] CHECK CONSTRAINT [FK_ORDERHD_SUPNO]
GO
