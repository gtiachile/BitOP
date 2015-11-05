USE [BopDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[p_ValidaInsertaCCOSTO]
(
@CCosto      varchar(10),
@Descripci�n varchar(30),
@Responsable varchar(30),
@Estado      varchar(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM CENTROSCOSTO WHERE Ccosto = @CCosto)>0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [CentrosCosto] ([CCosto], [Descripci�n], [Responsable], [Estado]) VALUES (@CCosto, @Descripci�n, @Responsable, @Estado)
END

GO


