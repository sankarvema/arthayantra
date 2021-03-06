USE [master]
GO
/****** Object:  Database [fas]    Script Date: 05/12/2015 16:33:03 ******/
CREATE DATABASE [fas] ON  PRIMARY 
( NAME = N'fas', FILENAME = N'D:\wspace\data\fas.mdf' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'fas_log', FILENAME = N'D:\wspace\data\fas_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [fas] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [fas].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [fas] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [fas] SET ANSI_NULLS OFF
GO
ALTER DATABASE [fas] SET ANSI_PADDING OFF
GO
ALTER DATABASE [fas] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [fas] SET ARITHABORT OFF
GO
ALTER DATABASE [fas] SET AUTO_CLOSE ON
GO
ALTER DATABASE [fas] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [fas] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [fas] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [fas] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [fas] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [fas] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [fas] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [fas] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [fas] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [fas] SET  DISABLE_BROKER
GO
ALTER DATABASE [fas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [fas] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [fas] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [fas] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [fas] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [fas] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [fas] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [fas] SET  READ_WRITE
GO
ALTER DATABASE [fas] SET RECOVERY FULL
GO
ALTER DATABASE [fas] SET  MULTI_USER
GO
ALTER DATABASE [fas] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [fas] SET DB_CHAINING OFF
GO
USE [fas]
GO
/****** Object:  Table [dbo].[TransHdr]    Script Date: 05/12/2015 16:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransHdr](
	[transId] [nvarchar](13) NULL,
	[transDate] [datetime] NULL,
	[transAmt] [money] NULL,
	[summary] [nvarchar](max) NULL,
	[flg] [nvarchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransDtl]    Script Date: 05/12/2015 16:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransDtl](
	[transId] [nvarchar](13) NULL,
	[acId] [nvarchar](13) NULL,
	[amt] [money] NULL,
	[flg] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecurrExp]    Script Date: 05/12/2015 16:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecurrExp](
	[acId] [nvarchar](13) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecurAcc]    Script Date: 05/12/2015 16:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecurAcc](
	[acId] [nvarchar](13) NOT NULL,
	[frequency] [int] NULL,
	[recurrMode] [nchar](10) NULL,
	[recurrAmt] [decimal](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccMast]    Script Date: 05/12/2015 16:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccMast](
	[acId] [nvarchar](13) NULL,
	[acName] [nvarchar](50) NULL,
	[opBal] [money] NULL,
	[pacId] [nvarchar](13) NULL,
	[isPaymentInstr] [bit] NULL,
	[isTracable] [bit] NULL,
	[acCate] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AccTransBal]    Script Date: 05/12/2015 16:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AccTransBal]
AS
SELECT     drBal.acId, drBal.bal AS drBal, crBal.bal AS crBal, drBal.bal - crBal.bal AS bal
FROM         (SELECT     acId, SUM(amt) AS bal
                       FROM          dbo.TransDtl
                       WHERE      (flg = 'D')
                       GROUP BY acId) AS drBal INNER JOIN
                          (SELECT     acId, SUM(amt) AS bal
                            FROM          dbo.TransDtl AS TransDtl_1
                            WHERE      (flg = 'C')
                            GROUP BY acId) AS crBal ON drBal.acId = crBal.acId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "drBal"
            Begin Extent = 
               Top = 44
               Left = 289
               Bottom = 129
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "crBal"
            Begin Extent = 
               Top = 60
               Left = 515
               Bottom = 145
               Right = 667
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1935
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1935
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccTransBal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccTransBal'
GO
/****** Object:  View [dbo].[Ledger_Single]    Script Date: 05/12/2015 16:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Ledger_Single]
AS
SELECT     dbo.TransDtl.transId, dbo.TransDtl.acId AS oacId, dbo.AccMast.acName AS oacName, dbo.TransDtl.flg AS oacFlg, AccMast_1.acName AS dacName, 
                      dbo.TransDtl.amt AS dacAmt, TransDtl_1.flg AS dacFlg, dbo.TransHdr.transDate, dbo.TransHdr.summary, TransDtl_1.acId AS dacId
FROM         dbo.TransHdr INNER JOIN
                      dbo.AccMast INNER JOIN
                      dbo.TransDtl INNER JOIN
                      dbo.TransDtl AS TransDtl_1 ON dbo.TransDtl.transId = TransDtl_1.transId AND dbo.TransDtl.acId <> TransDtl_1.acId ON 
                      dbo.AccMast.acId = dbo.TransDtl.acId INNER JOIN
                      dbo.AccMast AS AccMast_1 ON TransDtl_1.acId = AccMast_1.acId ON dbo.TransHdr.transId = TransDtl_1.transId AND 
                      dbo.TransHdr.transId = dbo.TransDtl.transId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TransHdr"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AccMast"
            Begin Extent = 
               Top = 6
               Left = 228
               Bottom = 121
               Right = 380
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TransDtl"
            Begin Extent = 
               Top = 6
               Left = 418
               Bottom = 121
               Right = 570
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TransDtl_1"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AccMast_1"
            Begin Extent = 
               Top = 126
               Left = 228
               Bottom = 241
               Right = 380
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Ledger_Single'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Ledger_Single'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Ledger_Single'
GO
/****** Object:  View [dbo].[Ledger]    Script Date: 05/12/2015 16:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Ledger]
AS
SELECT     a.acId AS ledAcId, e.acName AS ledAcName, a.amt AS drAmt, a.flg AS trFlg, b.acId AS trAcId, d.acName AS trAcName, b.amt AS crAmt, b.flg AS crFlg, 
                      c.flg AS transFlg, c.transId, c.transDate
FROM         dbo.TransDtl AS a INNER JOIN
                      dbo.TransDtl AS b ON a.transId = b.transId AND a.flg <> b.flg INNER JOIN
                      dbo.TransHdr AS c ON a.transId = c.transId AND b.transId = c.transId INNER JOIN
                      dbo.AccMast AS d ON b.acId = d.acId INNER JOIN
                      dbo.AccMast AS e ON a.acId = e.acId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 228
               Bottom = 121
               Right = 380
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 418
               Bottom = 121
               Right = 570
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 126
               Left = 228
               Bottom = 241
               Right = 380
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Ledger'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Ledger'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Ledger'
GO
/****** Object:  View [dbo].[Journal]    Script Date: 05/12/2015 16:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Journal]
AS
SELECT     TOP (100) PERCENT dbo.TransHdr.transId, dbo.TransHdr.transDate, dbo.TransDtl.acId, dbo.AccMast.acName, dbo.TransDtl.amt, dbo.TransDtl.flg, 
                      dbo.TransHdr.summary
FROM         dbo.AccMast INNER JOIN
                      dbo.TransHdr INNER JOIN
                      dbo.TransDtl ON dbo.TransHdr.transId = dbo.TransDtl.transId ON dbo.AccMast.acId = dbo.TransDtl.acId
ORDER BY dbo.TransHdr.transDate
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AccMast"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TransHdr"
            Begin Extent = 
               Top = 6
               Left = 228
               Bottom = 121
               Right = 380
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TransDtl"
            Begin Extent = 
               Top = 6
               Left = 418
               Bottom = 121
               Right = 570
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Journal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Journal'
GO
/****** Object:  View [dbo].[AllAccBal]    Script Date: 05/12/2015 16:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AllAccBal]
AS
SELECT     dbo.AccMast.acId, dbo.AccMast.acName, dbo.AccMast.pacId, dbo.AccTransBal.drBal, dbo.AccTransBal.crBal, dbo.AccTransBal.bal, 
                      dbo.AccMast.isTracable
FROM         dbo.AccTransBal RIGHT OUTER JOIN
                      dbo.AccMast ON dbo.AccTransBal.acId = dbo.AccMast.acId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AccMast"
            Begin Extent = 
               Top = 28
               Left = 150
               Bottom = 143
               Right = 303
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "AccTransBal"
            Begin Extent = 
               Top = 41
               Left = 356
               Bottom = 156
               Right = 508
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllAccBal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllAccBal'
GO
