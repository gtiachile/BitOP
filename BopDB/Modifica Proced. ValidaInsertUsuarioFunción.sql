USE [BopDB]
GO

/****** Object:  StoredProcedure [dbo].[p_ValidaInsertaUsuarioFuncion]    Script Date: 05-11-2015 15:49:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROC [dbo].[p_ValidaInsertaUsuarioFuncion]
(
@Usuario VARCHAR(50),
@Funcion VARCHAR(50),
@Area VARCHAR(10),
@Turno VARCHAR(10),
@Proceso VARCHAR(10),
@Equipo VARCHAR(10),
@NivelRegDetencion VARCHAR(10),
@DiasAtrasoReg int,
@Done BIT,
@Msg VARCHAR(200)
)
AS 
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM UsuarioFuncion WHERE Usuario=@Usuario) > 0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [UsuarioFuncion] ([Usuario], [Funcion], [Area], [Turno], [Proceso], [Equipo], [NivelRegDetencion], [DiasAtrasoReg])
                      VALUES (@Usuario,  @Funcion,  @Area,  @Turno,  @Proceso,  @Equipo,  @NivelRegDetencion,  @DiasAtrasoReg)
END



GO

