/*****************************************************************************************************************
*                                               VALOR POR EXTENSO                                                *
*                                                                                                                *
* CONJUNTO DE FUNCOES QUE TEM COMO SAIDA O EXTENSO DE UM NUMERO INFORMADO COMO PARAMENTRO A FUNCAO dbo.wbm_exten *
* so().                                                                                                          *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/

CREATE FUNCTION dbo.wbm_TrataGrupoExtenso(
@GRUPO DECIMAL(18, 5), @SINGULAR VARCHAR(50),
@PLURAL VARCHAR(50), @FLAG_E INT, @STR_EXT VARCHAR(255))
RETURNS @RESULTADO TABLE (FLAG_E INT, STR_EXT varchar(250))
AS
BEGIN
DECLARE
@RETORNO VARCHAR(255),
@FLAG INT

SET @RETORNO = @STR_EXT
SET @FLAG = @FLAG_E

IF (@GRUPO <> 0)
BEGIN
IF (@FLAG_E = 1) SET @RETORNO = @RETORNO + ' e'
SET @FLAG_E = 1
SET @RETORNO = @RETORNO + (SELECT dbo.wbm_GrupoExtenso(@grupo))
IF (@GRUPO = 1) SET @RETORNO = @RETORNO + @SINGULAR
ELSE SET @RETORNO = @RETORNO + @PLURAL
END
INSERT @RESULTADO
(FLAG_E, STR_EXT) VALUES (@FLAG, @RETORNO)
RETURN
END

GO



CREATE FUNCTION dbo.wbm_GrupoExtenso(@VALOR DECIMAL(18, 2))
RETURNS VARCHAR(255)
AS
BEGIN
DECLARE
@STR_EXT VARCHAR(255),
@AUX INT,
@VALOR_T INT

SET @STR_EXT = ''
SET @AUX = 0

SET @VALOR_T = ROUND(@VALOR, 0)
SET @AUX = @VALOR_T - (@VALOR_T % 100)


IF (@VALOR_T = 100) SET @STR_EXT = ' Cem'
ELSE IF (@AUX = 100) SET @STR_EXT = ' Cento'
ELSE IF (@AUX = 200) SET @STR_EXT = ' Duzentos'
ELSE IF (@AUX = 300) SET @STR_EXT = ' Trezentos'
ELSE IF (@AUX = 400) SET @STR_EXT = ' Quatrocentos'
ELSE IF (@AUX = 500) SET @STR_EXT = ' Quinhentos'
ELSE IF (@AUX = 600) SET @STR_EXT = ' Seiscentos'
ELSE IF (@AUX = 700) SET @STR_EXT = ' Setecentos'
ELSE IF (@AUX = 800) SET @STR_EXT = ' Oitocentos'
ELSE IF (@AUX = 900) SET @STR_EXT = ' Novecentos'

IF (((@VALOR_T - @AUX) <> 0) AND(@AUX <> 0))
SET @STR_EXT = @STR_EXT+' e'

SET @AUX = (@VALOR_T % 100) - (@VALOR_T % 10)


IF (@AUX = 0)
BEGIN
SET @AUX = (@VALOR_T % 10)

IF      (@AUX = 1) SET @STR_EXT = @STR_EXT+' Um'
ELSE IF (@AUX = 2) SET @STR_EXT = @STR_EXT+' Dois'
ELSE IF (@AUX = 3) SET @STR_EXT = @STR_EXT+' Tres'
ELSE IF (@AUX = 4) SET @STR_EXT = @STR_EXT+' Quatro'
ELSE IF (@AUX = 5) SET @STR_EXT = @STR_EXT+' Cinco'
ELSE IF (@AUX = 6) SET @STR_EXT = @STR_EXT+' Seis'
ELSE IF (@AUX = 7) SET @STR_EXT = @STR_EXT+' Sete'
ELSE IF (@AUX = 8) SET @STR_EXT = @STR_EXT+' Oito'
ELSE IF (@AUX = 9) SET @STR_EXT = @STR_EXT+' Nove'
END


SET @AUX = (@VALOR_T % 100) - (@VALOR_T % 10)

IF (@AUX = 10)
BEGIN
SET @AUX = (@VALOR_T % 10)

IF      (@AUX = 0) SET @STR_EXT = @STR_EXT+' Dez'
ELSE IF (@AUX = 1) SET @STR_EXT = @STR_EXT+' Onze'
ELSE IF (@AUX = 2) SET @STR_EXT = @STR_EXT+' Doze'
ELSE IF (@AUX = 3) SET @STR_EXT = @STR_EXT+' Treze'
ELSE IF (@AUX = 4) SET @STR_EXT = @STR_EXT+' Quatorze'
ELSE IF (@AUX = 5) SET @STR_EXT = @STR_EXT+' Quinze'
ELSE IF (@AUX = 6) SET @STR_EXT = @STR_EXT+' Dezesseis'
ELSE IF (@AUX = 7) SET @STR_EXT = @STR_EXT+' Dezessete'
ELSE IF (@AUX = 8) SET @STR_EXT = @STR_EXT+' Dezoito'
ELSE IF (@AUX = 9) SET @STR_EXT = @STR_EXT+' Dezenove'
END
ELSE
BEGIN
IF      (@AUX = 20) SET @STR_EXT = @STR_EXT+' Vinte'
ELSE IF (@AUX = 30) SET @STR_EXT = @STR_EXT+' Trinta'
ELSE IF (@AUX = 40) SET @STR_EXT = @STR_EXT+' Quarenta'
ELSE IF (@AUX = 50) SET @STR_EXT = @STR_EXT+' Cinquenta'
ELSE IF (@AUX = 60) SET @STR_EXT = @STR_EXT+' Sessenta'
ELSE IF (@AUX = 70) SET @STR_EXT = @STR_EXT+' Setenta'
ELSE IF (@AUX = 80) SET @STR_EXT = @STR_EXT+' Oitenta'
ELSE IF (@AUX = 90) SET @STR_EXT = @STR_EXT+' Noventa'

IF ((@AUX <> 0) and ((@VALOR_T % 10) <> 0))
BEGIN
SET @STR_EXT = @STR_EXT+' e'

SET @AUX = (@VALOR_T % 10)

IF      (@AUX = 1) SET @STR_EXT = @STR_EXT+' Um'
ELSE IF (@AUX = 2) SET @STR_EXT = @STR_EXT+' Dois'
ELSE IF (@AUX = 3) SET @STR_EXT = @STR_EXT+' Tres'
ELSE IF (@AUX = 4) SET @STR_EXT = @STR_EXT+' Quatro'
ELSE IF (@AUX = 5) SET @STR_EXT = @STR_EXT+' Cinco'
ELSE IF (@AUX = 6) SET @STR_EXT = @STR_EXT+' Seis'
ELSE IF (@AUX = 7) SET @STR_EXT = @STR_EXT+' Sete'
ELSE IF (@AUX = 8) SET @STR_EXT = @STR_EXT+' Oito'
ELSE IF (@AUX = 9) SET @STR_EXT = @STR_EXT+' Nove'
END
END

RETURN(@STR_EXT);
END

GO



CREATE FUNCTION dbo.wbm_Extenso(@VALOR DECIMAL(18, 5))
RETURNS VARCHAR(255)
AS
BEGIN

DECLARE
@STR_EXT VARCHAR(255),
@FLAG_E INT,
@GRUPO DECIMAL(10, 2),
@MOEDA VARCHAR(10),
@MOEDA_PLURAL VARCHAR(10),
@FLAG_CENTAVOS DECIMAL(18, 5)

-- Aqui vc podera configurar a descricao da Moeda
SET @MOEDA = 'Real'
SET @MOEDA_PLURAL = 'Reais'
SET @FLAG_CENTAVOS = 1 -- Exibir os centavos [ 0) Nao 1) Sim ]

SET @STR_EXT = ''
SET @FLAG_E = 0
SET @GRUPO = 0

IF ((CONVERT(INT, @VALOR) - (CONVERT(INT, @VALOR) % 1)) = 0)
BEGIN
SET @STR_EXT = ' Zero'
END
ELSE
BEGIN
DECLARE @TEMPINT BIGINT
-- SET @TEMPINT = (.000000001*((CONVERT(BIGINT, @VALOR) % 1000000000000)
-- - (CONVERT(BIGINT, @VALOR) % 1000000000)))
-- SELECT @FLAG_E = FLAG_E, @STR_EXT = STR_EXT FROM dbo.wbm_TrataGrupoExtenso(
-- @TEMPINT, ' Bilhão', ' Bilhões', @FLAG_E, @STR_EXT)

SET @TEMPINT = .000001*((CONVERT(INT, @VALOR) % 1000000000)
- (CONVERT(INT, @VALOR) % 1000000))

SELECT @FLAG_E = FLAG_E, @STR_EXT = STR_EXT
FROM dbo.wbm_TrataGrupoExtenso(
@TEMPINT, ' Milhão' , ' Milhões', @FLAG_E, @STR_EXT)

SET @TEMPINT = .001*((CONVERT(INT, @VALOR) % 1000000) -
(CONVERT(INT, @VALOR) % 1000))

SELECT @FLAG_E = FLAG_E, @STR_EXT = STR_EXT
FROM dbo.wbm_TrataGrupoExtenso(
@TEMPINT, ' Mil' , ' Mil', @FLAG_E, @STR_EXT)

SET @TEMPINT = (CONVERT(INT, @VALOR) % 1000)

SELECT @FLAG_E = FLAG_E, @STR_EXT = STR_EXT
FROM dbo.wbm_TrataGrupoExtenso(
@TEMPINT, '' , '', @FLAG_E, @STR_EXT)
END

IF (ROUND(@VALOR, 0) = 1)
BEGIN
SET @STR_EXT = @STR_EXT + ' '+RTRIM(@MOEDA)
END
ELSE
BEGIN
IF (ROUND(@VALOR, -6) <> 0) and
(ROUND(@VALOR, 0) - ROUND(@VALOR, -6) = 0)
SET @STR_EXT = @STR_EXT + ' de ' + RTRIM(@moeda_plural)
ELSE
SET @STR_EXT = @STR_EXT + ' ' + RTRIM(@moeda_plural)
END

IF (@FLAG_CENTAVOS = 1)
BEGIN
SET @FLAG_E = 1;

DECLARE @TEMPINT2 BIGINT
-- SET @TEMPINT2 = 100*(@VALOR - ROUND(@VALOR, 0))

set @TEMPINT2 = cast(right(cast(cast(@VALOR as numeric(10,2)) as varchar(15)),2) as BIGINT)

-- Aqui vc podera mudar a descricao dos centavos
SELECT @FLAG_E = FLAG_E, @STR_EXT = STR_EXT
FROM dbo.wbm_TrataGrupoExtenso(
@TEMPINT2, ' Centavo' , ' Centavos', @FLAG_E, @STR_EXT)
END

RETURN(@STR_EXT)
END

GO

