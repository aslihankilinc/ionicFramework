USE [Tiger]
GO
/****** Object:  Table [dbo].[Birim]    Script Date: 22.01.2022 09:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Birim](
	[No] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](50) NULL,
 CONSTRAINT [PK_Birim] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cari]    Script Date: 22.01.2022 09:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cari](
	[No] [int] IDENTITY(1,1) NOT NULL,
	[Kod] [varchar](50) NULL,
	[Unvan] [nvarchar](150) NULL,
 CONSTRAINT [PK_Cari] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fatura]    Script Date: 22.01.2022 09:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fatura](
	[No] [bigint] IDENTITY(1,1) NOT NULL,
	[FisNumarasi] [varchar](50) NULL,
	[FaturaTarihi] [datetime] NULL,
	[CariNo] [int] NULL,
	[NetTutar] [decimal](18, 6) NULL,
	[ToplamKdvTutari] [decimal](18, 6) NULL,
	[ToplamTutar] [decimal](18, 6) NULL,
	[KullaniciNo] [int] NULL,
	[Tarih] [datetime] NULL CONSTRAINT [DF_Fatura_Tarih]  DEFAULT (getdate()),
	[AktifMi] [bit] NULL CONSTRAINT [DF_Fatura_AktifMi]  DEFAULT ((1)),
 CONSTRAINT [PK_Fatura] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fatura_Odeme]    Script Date: 22.01.2022 09:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fatura_Odeme](
	[No] [int] IDENTITY(1,1) NOT NULL,
	[FaturaNo] [bigint] NOT NULL,
	[OdemeNo] [int] NOT NULL,
	[OdenenTutar] [decimal](18, 6) NOT NULL,
	[KalanTutar] [decimal](18, 6) NOT NULL,
	[Tarih] [datetime] NOT NULL CONSTRAINT [DF_Fatura_Odeme_Tarih]  DEFAULT (getdate()),
 CONSTRAINT [PK_Fatura_Odeme] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FaturaDetay]    Script Date: 22.01.2022 09:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaturaDetay](
	[No] [bigint] IDENTITY(1,1) NOT NULL,
	[FaturaNo] [bigint] NULL,
	[UrunNo] [bigint] NULL,
	[Miktar] [decimal](18, 6) NULL,
	[BirimFiyat] [decimal](18, 6) NULL,
	[KullaniciNo] [int] NULL,
 CONSTRAINT [PK_FaturaDetay] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 22.01.2022 09:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[No] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](50) NULL,
	[Soyad] [nvarchar](50) NULL,
	[KullaniciAdi] [nvarchar](50) NULL,
	[Sifre] [nvarchar](50) NULL,
	[AktifMi] [bit] NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Odeme]    Script Date: 22.01.2022 09:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odeme](
	[No] [int] IDENTITY(1,1) NOT NULL,
	[CariNo] [int] NOT NULL,
	[Tutar] [decimal](18, 6) NOT NULL,
	[KullaniciNo] [int] NOT NULL,
	[Tarih] [datetime] NOT NULL,
 CONSTRAINT [PK_Odeme] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Siparis]    Script Date: 22.01.2022 09:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparis](
	[No] [bigint] IDENTITY(1,1) NOT NULL,
	[Kod] [nvarchar](30) NULL,
	[CariNo] [int] NULL,
	[KullaniciNo] [int] NULL,
	[SiparisTarihi] [datetime] NULL CONSTRAINT [DF_Siparis_SiparisTarihi]  DEFAULT (getdate()),
	[AktifMi] [bit] NULL CONSTRAINT [DF_Siparis_AktifMi]  DEFAULT ((1)),
 CONSTRAINT [PK_Siparis] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Siparis_Fatura]    Script Date: 22.01.2022 09:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparis_Fatura](
	[No] [int] IDENTITY(1,1) NOT NULL,
	[FaturaNo] [bigint] NOT NULL,
	[SiparisNo] [bigint] NOT NULL,
 CONSTRAINT [PK_tblSiparis_Fatura] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SiparisDetay]    Script Date: 22.01.2022 09:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiparisDetay](
	[No] [bigint] IDENTITY(1,1) NOT NULL,
	[SiparisNo] [bigint] NULL,
	[UrunNo] [bigint] NOT NULL,
	[Miktar] [decimal](18, 6) NOT NULL,
	[BirimFiyat] [decimal](18, 6) NOT NULL,
	[KullaniciNo] [int] NOT NULL,
 CONSTRAINT [PK_SiparisDetay] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Urun]    Script Date: 22.01.2022 09:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun](
	[No] [bigint] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](50) NULL,
	[Kdv] [decimal](18, 2) NULL,
	[BirimNo] [int] NULL,
 CONSTRAINT [PK_Urun] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Birim] ON 

INSERT [dbo].[Birim] ([No], [Ad]) VALUES (1, N'ADET')
INSERT [dbo].[Birim] ([No], [Ad]) VALUES (2, N'KG')
SET IDENTITY_INSERT [dbo].[Birim] OFF
SET IDENTITY_INSERT [dbo].[Cari] ON 

INSERT [dbo].[Cari] ([No], [Kod], [Unvan]) VALUES (1, N'001', N'ASLIHAN')
INSERT [dbo].[Cari] ([No], [Kod], [Unvan]) VALUES (2, N'Car-002', N'ASLIHAN A.S')
INSERT [dbo].[Cari] ([No], [Kod], [Unvan]) VALUES (3, N'Car-003', N'Tanay A.S')
INSERT [dbo].[Cari] ([No], [Kod], [Unvan]) VALUES (5, N'Car-004', N'test')
SET IDENTITY_INSERT [dbo].[Cari] OFF
SET IDENTITY_INSERT [dbo].[Fatura] ON 

INSERT [dbo].[Fatura] ([No], [FisNumarasi], [FaturaTarihi], [CariNo], [NetTutar], [ToplamKdvTutari], [ToplamTutar], [KullaniciNo], [Tarih], [AktifMi]) VALUES (76, N'2021000000076', CAST(N'2021-02-18 00:00:00.000' AS DateTime), 3, CAST(75.000000 AS Decimal(18, 6)), CAST(13.500000 AS Decimal(18, 6)), CAST(88.500000 AS Decimal(18, 6)), 1, CAST(N'2021-02-18 15:05:32.573' AS DateTime), 1)
INSERT [dbo].[Fatura] ([No], [FisNumarasi], [FaturaTarihi], [CariNo], [NetTutar], [ToplamKdvTutari], [ToplamTutar], [KullaniciNo], [Tarih], [AktifMi]) VALUES (77, N'2021000000077', CAST(N'2021-02-19 00:00:00.000' AS DateTime), 1, CAST(8.000000 AS Decimal(18, 6)), CAST(1.440000 AS Decimal(18, 6)), CAST(9.440000 AS Decimal(18, 6)), 1, CAST(N'2021-02-19 09:40:01.777' AS DateTime), 0)
INSERT [dbo].[Fatura] ([No], [FisNumarasi], [FaturaTarihi], [CariNo], [NetTutar], [ToplamKdvTutari], [ToplamTutar], [KullaniciNo], [Tarih], [AktifMi]) VALUES (78, N'2021000000078', CAST(N'2021-02-19 00:00:00.000' AS DateTime), 1, CAST(7.000000 AS Decimal(18, 6)), CAST(1.260000 AS Decimal(18, 6)), CAST(8.260000 AS Decimal(18, 6)), 1, CAST(N'2021-02-19 10:07:31.507' AS DateTime), 0)
INSERT [dbo].[Fatura] ([No], [FisNumarasi], [FaturaTarihi], [CariNo], [NetTutar], [ToplamKdvTutari], [ToplamTutar], [KullaniciNo], [Tarih], [AktifMi]) VALUES (79, N'2021000000079', CAST(N'2021-02-19 00:00:00.000' AS DateTime), 1, CAST(16.000000 AS Decimal(18, 6)), CAST(2.880000 AS Decimal(18, 6)), CAST(18.880000 AS Decimal(18, 6)), 1, CAST(N'2021-02-19 14:54:07.000' AS DateTime), 0)
INSERT [dbo].[Fatura] ([No], [FisNumarasi], [FaturaTarihi], [CariNo], [NetTutar], [ToplamKdvTutari], [ToplamTutar], [KullaniciNo], [Tarih], [AktifMi]) VALUES (80, N'2021000000080', CAST(N'2021-02-19 00:00:00.000' AS DateTime), 1, CAST(45.000000 AS Decimal(18, 6)), CAST(8.100000 AS Decimal(18, 6)), CAST(53.100000 AS Decimal(18, 6)), 1, CAST(N'2021-02-19 15:09:50.400' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Fatura] OFF
SET IDENTITY_INSERT [dbo].[Fatura_Odeme] ON 

INSERT [dbo].[Fatura_Odeme] ([No], [FaturaNo], [OdemeNo], [OdenenTutar], [KalanTutar], [Tarih]) VALUES (31, 77, 15, CAST(9.440000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), CAST(N'2021-02-22 11:49:32.997' AS DateTime))
INSERT [dbo].[Fatura_Odeme] ([No], [FaturaNo], [OdemeNo], [OdenenTutar], [KalanTutar], [Tarih]) VALUES (32, 78, 15, CAST(0.560000 AS Decimal(18, 6)), CAST(7.700000 AS Decimal(18, 6)), CAST(N'2021-02-22 11:49:33.000' AS DateTime))
INSERT [dbo].[Fatura_Odeme] ([No], [FaturaNo], [OdemeNo], [OdenenTutar], [KalanTutar], [Tarih]) VALUES (33, 78, 16, CAST(8.260000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), CAST(N'2021-02-22 11:50:17.090' AS DateTime))
INSERT [dbo].[Fatura_Odeme] ([No], [FaturaNo], [OdemeNo], [OdenenTutar], [KalanTutar], [Tarih]) VALUES (34, 79, 16, CAST(18.880000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), CAST(N'2021-02-22 11:50:17.107' AS DateTime))
INSERT [dbo].[Fatura_Odeme] ([No], [FaturaNo], [OdemeNo], [OdenenTutar], [KalanTutar], [Tarih]) VALUES (35, 80, 16, CAST(22.860000 AS Decimal(18, 6)), CAST(30.240000 AS Decimal(18, 6)), CAST(N'2021-02-22 11:50:17.107' AS DateTime))
SET IDENTITY_INSERT [dbo].[Fatura_Odeme] OFF
SET IDENTITY_INSERT [dbo].[FaturaDetay] ON 

INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (183, 76, 3, CAST(1.000000 AS Decimal(18, 6)), CAST(75.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (184, 77, 2, CAST(4.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (185, 77, 2, CAST(4.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (186, 78, 2, CAST(5.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (188, 78, 3, CAST(1.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (191, 77, 2, CAST(3.000000 AS Decimal(18, 6)), CAST(3.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (192, 79, 2, CAST(4.000000 AS Decimal(18, 6)), CAST(4.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (199, 80, 1, CAST(3.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (200, 80, 1, CAST(4.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (201, 78, 1, CAST(4.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (202, 78, 3, CAST(1.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (203, 78, 1, CAST(5.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (204, 80, 1, CAST(3.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (205, 80, 1, CAST(4.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (206, 79, 1, CAST(4.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (207, 79, 3, CAST(1.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (208, 79, 1, CAST(5.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (209, 79, 1, CAST(3.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (210, 79, 1, CAST(4.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (211, 76, 4, CAST(2.000000 AS Decimal(18, 6)), CAST(5.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (212, 76, 4, CAST(2.000000 AS Decimal(18, 6)), CAST(5.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (213, 76, 4, CAST(2.000000 AS Decimal(18, 6)), CAST(5.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (214, 76, 4, CAST(6.000000 AS Decimal(18, 6)), CAST(10.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (215, 77, 2, CAST(9.000000 AS Decimal(18, 6)), CAST(10.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (216, 77, 2, CAST(9.000000 AS Decimal(18, 6)), CAST(10.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (217, 77, 2, CAST(9.000000 AS Decimal(18, 6)), CAST(10.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (218, 77, 2, CAST(9.000000 AS Decimal(18, 6)), CAST(10.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (219, 76, 2, CAST(4.000000 AS Decimal(18, 6)), CAST(4.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (220, 77, 2, CAST(9.000000 AS Decimal(18, 6)), CAST(10.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (221, 76, 2, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (222, 76, 3, CAST(100.000000 AS Decimal(18, 6)), CAST(5.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (223, 76, 2, CAST(8.000000 AS Decimal(18, 6)), CAST(9.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (224, 76, 2, CAST(4.000000 AS Decimal(18, 6)), CAST(9.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (225, 76, 2, CAST(4.000000 AS Decimal(18, 6)), CAST(7.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (226, 76, 3, CAST(4.000000 AS Decimal(18, 6)), CAST(5.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (227, 76, 3, CAST(4.000000 AS Decimal(18, 6)), CAST(3.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (228, 76, 3, CAST(4.000000 AS Decimal(18, 6)), CAST(7.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (229, 76, 3, CAST(4.000000 AS Decimal(18, 6)), CAST(8.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (230, 76, 3, CAST(4.000000 AS Decimal(18, 6)), CAST(8.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (231, 76, 3, CAST(4.000000 AS Decimal(18, 6)), CAST(8.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (232, 76, 3, CAST(4.000000 AS Decimal(18, 6)), CAST(8.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (233, 76, 3, CAST(4.000000 AS Decimal(18, 6)), CAST(8.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (234, 76, 3, CAST(4.000000 AS Decimal(18, 6)), CAST(8.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (235, 76, 3, CAST(4.000000 AS Decimal(18, 6)), CAST(8.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (236, 76, 3, CAST(4.000000 AS Decimal(18, 6)), CAST(8.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (237, 76, 3, CAST(5.000000 AS Decimal(18, 6)), CAST(5.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (238, 76, 3, CAST(5.000000 AS Decimal(18, 6)), CAST(54.000000 AS Decimal(18, 6)), NULL)
INSERT [dbo].[FaturaDetay] ([No], [FaturaNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (239, 80, 3, CAST(6.000000 AS Decimal(18, 6)), CAST(7.000000 AS Decimal(18, 6)), NULL)
SET IDENTITY_INSERT [dbo].[FaturaDetay] OFF
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([No], [Ad], [Soyad], [KullaniciAdi], [Sifre], [AktifMi]) VALUES (1, N'Aslıhan', N'Kılınç', N'slhn', N'klnc', 1)
INSERT [dbo].[Kullanici] ([No], [Ad], [Soyad], [KullaniciAdi], [Sifre], [AktifMi]) VALUES (2, N'Tanay', N'Kılınç ', N'tny', N'klnc', 1)
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
SET IDENTITY_INSERT [dbo].[Odeme] ON 

INSERT [dbo].[Odeme] ([No], [CariNo], [Tutar], [KullaniciNo], [Tarih]) VALUES (15, 1, CAST(10.000000 AS Decimal(18, 6)), 1, CAST(N'2021-02-22 11:49:32.993' AS DateTime))
INSERT [dbo].[Odeme] ([No], [CariNo], [Tutar], [KullaniciNo], [Tarih]) VALUES (16, 1, CAST(50.000000 AS Decimal(18, 6)), 1, CAST(N'2021-02-22 11:50:17.083' AS DateTime))
SET IDENTITY_INSERT [dbo].[Odeme] OFF
SET IDENTITY_INSERT [dbo].[Siparis] ON 

INSERT [dbo].[Siparis] ([No], [Kod], [CariNo], [KullaniciNo], [SiparisTarihi], [AktifMi]) VALUES (26, N'202100026', 1, 1, CAST(N'2021-02-16 10:02:17.740' AS DateTime), 1)
INSERT [dbo].[Siparis] ([No], [Kod], [CariNo], [KullaniciNo], [SiparisTarihi], [AktifMi]) VALUES (28, N'202100028', 1, 1, CAST(N'2021-02-25 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Siparis] ([No], [Kod], [CariNo], [KullaniciNo], [SiparisTarihi], [AktifMi]) VALUES (30, N'202100030', 1, 1, CAST(N'2021-02-26 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Siparis] OFF
SET IDENTITY_INSERT [dbo].[Siparis_Fatura] ON 

INSERT [dbo].[Siparis_Fatura] ([No], [FaturaNo], [SiparisNo]) VALUES (6, 78, 30)
INSERT [dbo].[Siparis_Fatura] ([No], [FaturaNo], [SiparisNo]) VALUES (7, 80, 30)
INSERT [dbo].[Siparis_Fatura] ([No], [FaturaNo], [SiparisNo]) VALUES (8, 80, 30)
INSERT [dbo].[Siparis_Fatura] ([No], [FaturaNo], [SiparisNo]) VALUES (9, 80, 30)
INSERT [dbo].[Siparis_Fatura] ([No], [FaturaNo], [SiparisNo]) VALUES (10, 80, 30)
INSERT [dbo].[Siparis_Fatura] ([No], [FaturaNo], [SiparisNo]) VALUES (11, 78, 28)
INSERT [dbo].[Siparis_Fatura] ([No], [FaturaNo], [SiparisNo]) VALUES (12, 80, 30)
INSERT [dbo].[Siparis_Fatura] ([No], [FaturaNo], [SiparisNo]) VALUES (13, 79, 28)
INSERT [dbo].[Siparis_Fatura] ([No], [FaturaNo], [SiparisNo]) VALUES (14, 79, 30)
SET IDENTITY_INSERT [dbo].[Siparis_Fatura] OFF
SET IDENTITY_INSERT [dbo].[SiparisDetay] ON 

INSERT [dbo].[SiparisDetay] ([No], [SiparisNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (38, 26, 1, CAST(5.000000 AS Decimal(18, 6)), CAST(6.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[SiparisDetay] ([No], [SiparisNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (39, 26, 3, CAST(4.000000 AS Decimal(18, 6)), CAST(7.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[SiparisDetay] ([No], [SiparisNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (44, 30, 1, CAST(3.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[SiparisDetay] ([No], [SiparisNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (45, 30, 1, CAST(4.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[SiparisDetay] ([No], [SiparisNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (46, 28, 1, CAST(4.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[SiparisDetay] ([No], [SiparisNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (47, 28, 3, CAST(1.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
INSERT [dbo].[SiparisDetay] ([No], [SiparisNo], [UrunNo], [Miktar], [BirimFiyat], [KullaniciNo]) VALUES (48, 28, 1, CAST(5.000000 AS Decimal(18, 6)), CAST(1.000000 AS Decimal(18, 6)), 1)
SET IDENTITY_INSERT [dbo].[SiparisDetay] OFF
SET IDENTITY_INSERT [dbo].[Urun] ON 

INSERT [dbo].[Urun] ([No], [Ad], [Kdv], [BirimNo]) VALUES (1, N'ELMA', CAST(18.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Urun] ([No], [Ad], [Kdv], [BirimNo]) VALUES (2, N'ARMUT', CAST(18.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Urun] ([No], [Ad], [Kdv], [BirimNo]) VALUES (3, N'KUTU', CAST(18.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Urun] ([No], [Ad], [Kdv], [BirimNo]) VALUES (4, N'AYVA', CAST(8.00 AS Decimal(18, 2)), 2)
SET IDENTITY_INSERT [dbo].[Urun] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Fatura]    Script Date: 22.01.2022 09:12:57 ******/
ALTER TABLE [dbo].[Fatura] ADD  CONSTRAINT [UK_Fatura] UNIQUE NONCLUSTERED 
(
	[FisNumarasi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Kullanici]    Script Date: 22.01.2022 09:12:57 ******/
ALTER TABLE [dbo].[Kullanici] ADD  CONSTRAINT [UK_Kullanici] UNIQUE NONCLUSTERED 
(
	[KullaniciAdi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Siparis]    Script Date: 22.01.2022 09:12:57 ******/
ALTER TABLE [dbo].[Siparis] ADD  CONSTRAINT [UK_Siparis] UNIQUE NONCLUSTERED 
(
	[Kod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Fatura]  WITH CHECK ADD  CONSTRAINT [FK_Fatura_Cari] FOREIGN KEY([CariNo])
REFERENCES [dbo].[Cari] ([No])
GO
ALTER TABLE [dbo].[Fatura] CHECK CONSTRAINT [FK_Fatura_Cari]
GO
ALTER TABLE [dbo].[Fatura]  WITH CHECK ADD  CONSTRAINT [FK_Fatura_Kullanici] FOREIGN KEY([KullaniciNo])
REFERENCES [dbo].[Kullanici] ([No])
GO
ALTER TABLE [dbo].[Fatura] CHECK CONSTRAINT [FK_Fatura_Kullanici]
GO
ALTER TABLE [dbo].[Fatura_Odeme]  WITH CHECK ADD  CONSTRAINT [FK_Fatura_Odeme_Fatura] FOREIGN KEY([FaturaNo])
REFERENCES [dbo].[Fatura] ([No])
GO
ALTER TABLE [dbo].[Fatura_Odeme] CHECK CONSTRAINT [FK_Fatura_Odeme_Fatura]
GO
ALTER TABLE [dbo].[Fatura_Odeme]  WITH CHECK ADD  CONSTRAINT [FK_Fatura_Odeme_Odeme] FOREIGN KEY([OdemeNo])
REFERENCES [dbo].[Odeme] ([No])
GO
ALTER TABLE [dbo].[Fatura_Odeme] CHECK CONSTRAINT [FK_Fatura_Odeme_Odeme]
GO
ALTER TABLE [dbo].[FaturaDetay]  WITH CHECK ADD  CONSTRAINT [FK_FaturaDetay_Fatura] FOREIGN KEY([FaturaNo])
REFERENCES [dbo].[Fatura] ([No])
GO
ALTER TABLE [dbo].[FaturaDetay] CHECK CONSTRAINT [FK_FaturaDetay_Fatura]
GO
ALTER TABLE [dbo].[FaturaDetay]  WITH CHECK ADD  CONSTRAINT [FK_FaturaDetay_Kullanici] FOREIGN KEY([KullaniciNo])
REFERENCES [dbo].[Kullanici] ([No])
GO
ALTER TABLE [dbo].[FaturaDetay] CHECK CONSTRAINT [FK_FaturaDetay_Kullanici]
GO
ALTER TABLE [dbo].[FaturaDetay]  WITH CHECK ADD  CONSTRAINT [FK_FaturaDetay_Urun] FOREIGN KEY([UrunNo])
REFERENCES [dbo].[Urun] ([No])
GO
ALTER TABLE [dbo].[FaturaDetay] CHECK CONSTRAINT [FK_FaturaDetay_Urun]
GO
ALTER TABLE [dbo].[Odeme]  WITH CHECK ADD  CONSTRAINT [FK_Odeme_Cari] FOREIGN KEY([CariNo])
REFERENCES [dbo].[Cari] ([No])
GO
ALTER TABLE [dbo].[Odeme] CHECK CONSTRAINT [FK_Odeme_Cari]
GO
ALTER TABLE [dbo].[Odeme]  WITH CHECK ADD  CONSTRAINT [FK_Odeme_Kullanici] FOREIGN KEY([KullaniciNo])
REFERENCES [dbo].[Kullanici] ([No])
GO
ALTER TABLE [dbo].[Odeme] CHECK CONSTRAINT [FK_Odeme_Kullanici]
GO
ALTER TABLE [dbo].[Siparis]  WITH CHECK ADD  CONSTRAINT [FK_Siparis_Cari] FOREIGN KEY([CariNo])
REFERENCES [dbo].[Cari] ([No])
GO
ALTER TABLE [dbo].[Siparis] CHECK CONSTRAINT [FK_Siparis_Cari]
GO
ALTER TABLE [dbo].[Siparis]  WITH CHECK ADD  CONSTRAINT [FK_Siparis_Kullanici] FOREIGN KEY([KullaniciNo])
REFERENCES [dbo].[Kullanici] ([No])
GO
ALTER TABLE [dbo].[Siparis] CHECK CONSTRAINT [FK_Siparis_Kullanici]
GO
ALTER TABLE [dbo].[Siparis_Fatura]  WITH CHECK ADD  CONSTRAINT [FK_tblSiparis_Fatura_Fatura] FOREIGN KEY([FaturaNo])
REFERENCES [dbo].[Fatura] ([No])
GO
ALTER TABLE [dbo].[Siparis_Fatura] CHECK CONSTRAINT [FK_tblSiparis_Fatura_Fatura]
GO
ALTER TABLE [dbo].[Siparis_Fatura]  WITH CHECK ADD  CONSTRAINT [FK_tblSiparis_Fatura_Siparis] FOREIGN KEY([SiparisNo])
REFERENCES [dbo].[Siparis] ([No])
GO
ALTER TABLE [dbo].[Siparis_Fatura] CHECK CONSTRAINT [FK_tblSiparis_Fatura_Siparis]
GO
ALTER TABLE [dbo].[SiparisDetay]  WITH CHECK ADD  CONSTRAINT [FK_Siparis_SiparisDetay] FOREIGN KEY([SiparisNo])
REFERENCES [dbo].[Siparis] ([No])
GO
ALTER TABLE [dbo].[SiparisDetay] CHECK CONSTRAINT [FK_Siparis_SiparisDetay]
GO
ALTER TABLE [dbo].[SiparisDetay]  WITH CHECK ADD  CONSTRAINT [FK_SiparisDetay_Kullanici] FOREIGN KEY([KullaniciNo])
REFERENCES [dbo].[Kullanici] ([No])
GO
ALTER TABLE [dbo].[SiparisDetay] CHECK CONSTRAINT [FK_SiparisDetay_Kullanici]
GO
ALTER TABLE [dbo].[SiparisDetay]  WITH CHECK ADD  CONSTRAINT [FK_SiparisDetay_Urun] FOREIGN KEY([UrunNo])
REFERENCES [dbo].[Urun] ([No])
GO
ALTER TABLE [dbo].[SiparisDetay] CHECK CONSTRAINT [FK_SiparisDetay_Urun]
GO
ALTER TABLE [dbo].[Urun]  WITH CHECK ADD  CONSTRAINT [FK_Urun_Birim] FOREIGN KEY([BirimNo])
REFERENCES [dbo].[Birim] ([No])
GO
ALTER TABLE [dbo].[Urun] CHECK CONSTRAINT [FK_Urun_Birim]
GO
/****** Object:  StoredProcedure [dbo].[spCreateTableClass]    Script Date: 22.01.2022 09:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spCreateTableClass]
	@TableName		sysname
AS
BEGIN
declare @Result varchar(max) = 'public class ' + @TableName + '
{'

select @Result = @Result + '
    public ' + ColumnType + NullableSign + ' ' + ColumnName + ' { get; set; }
'
from
(
    select 
        replace(col.name, ' ', '_') ColumnName,
        column_id ColumnId,
        case typ.name 
            when 'bigint' then 'long'
            when 'binary' then 'byte[]'
            when 'bit' then 'bool'
            when 'char' then 'string'
            when 'date' then 'DateTime'
            when 'datetime' then 'DateTime'
            when 'datetime2' then 'DateTime'
            when 'datetimeoffset' then 'DateTimeOffset'
            when 'decimal' then 'decimal'
            when 'float' then 'float'
            when 'image' then 'byte[]'
            when 'int' then 'int'
            when 'money' then 'decimal'
            when 'nchar' then 'char'
            when 'ntext' then 'string'
            when 'numeric' then 'decimal'
            when 'nvarchar' then 'string'
            when 'real' then 'double'
            when 'smalldatetime' then 'DateTime'
            when 'smallint' then 'short'
            when 'smallmoney' then 'decimal'
            when 'text' then 'string'
            when 'time' then 'TimeSpan'
            when 'timestamp' then 'DateTime'
            when 'tinyint' then 'byte'
            when 'uniqueidentifier' then 'Guid'
            when 'varbinary' then 'byte[]'
            when 'varchar' then 'string'
            else 'UNKNOWN_' + typ.name
        end ColumnType,
        case 
            when col.is_nullable = 1 and typ.name in ('bigint', 'bit', 'date', 'datetime', 'datetime2', 'datetimeoffset', 'decimal', 'float', 'int', 'money', 'numeric', 'real', 'smalldatetime', 'smallint', 'smallmoney', 'time', 'tinyint', 'uniqueidentifier') 
            then '?' 
            else '' 
        end NullableSign
    from sys.columns col
        join sys.types typ on
            col.system_type_id = typ.system_type_id AND col.user_type_id = typ.user_type_id
    where object_id = object_id(@TableName)
) t
order by ColumnId

set @Result = @Result  + '
}'

print @Result
END
GO
