USE [BopDB]
GO

/****** Object:  Table [dbo].[CentrosCosto]    Script Date: 05-11-2015 15:23:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CentrosCosto](
	[CCosto] [varchar](10) NOT NULL,
	[Descripción] [varchar](30) NOT NULL,
	[Responsable] [varchar](30) NULL,
	[Estado] [varchar](10) NOT NULL,
 CONSTRAINT [PK_CentrosCosto] PRIMARY KEY CLUSTERED 
(
	[CCosto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

