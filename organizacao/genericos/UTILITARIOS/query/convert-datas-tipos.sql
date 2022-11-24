/*****************************************************************************************************************
*                                             TIPOS DE CONVERT DATA                                              *
*                                                                                                                *
* SELECT QUE GERA UMA LISTA COM TODOS OS TIPOS DE CONVERT PARA DATA.                                             *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/

select convert(varchar(4),year(ISNULL(getdate(),'1900-01-01' ))) + '-' + right('0'+convert(varchar(2),month(ISNULL(getdate(),'1900-01-01' ))),2) + '-' + right('0'+convert(varchar(2),day(ISNULL(getdate(),'1900-01-01' ))),2) + ' '+ CONVERT(VARCHAR(30),ISNULL(getdate(),'1900-01-01' ),(114))
select right('0'+convert(varchar(2),day(ISNULL(getdate(),'1900-01-01' ))),2) + '/' + right('0'+convert(varchar(2),month(ISNULL(getdate(),'1900-01-01' ))),2) + '/' + convert(varchar(4),year(ISNULL(getdate(),'1900-01-01' ))) + ' '+ CONVERT(VARCHAR(30),ISNULL(getdate(),'1900-01-01' ),(114))
--#####################################################################################

declare @cont1 int 
set @cont1 = 100

while (@cont1 < 132)
	begin
	   if (@cont1 not in (115,116, 117, 118,119,122,123,124,125,128,129)) -- tipos de conversao inexistentes  
			begin 
				SELECT CONVERT(VARCHAR(50), ISNULL(getdate(),'1900-01-01' ), @cont1) as data_convertida_formatos_possiveis, @cont1 as paramentro
            end
		set @cont1 = @cont1 + 1
		
	end


--#####################################################################################
DECLARE @CONT INT
SET @CONT = 1
SELECT PARAMETRO = (@CONT + 102), RESULTADO = CONVERT(VARCHAR(30),ISNULL(getdate(),'1900-01-01' ),(102+@CONT))
SET @CONT = @CONT + 1
SELECT PARAMETRO = (@CONT + 102), RESULTADO = CONVERT(VARCHAR(30),ISNULL(getdate(),'1900-01-01' ),(102+@CONT))
SET @CONT = @CONT + 1
SELECT PARAMETRO = (@CONT + 102), RESULTADO = CONVERT(VARCHAR(30),ISNULL(getdate(),'1900-01-01' ),(102+@CONT))
SET @CONT = @CONT + 1
SELECT PARAMETRO = (@CONT + 102), RESULTADO = CONVERT(VARCHAR(30),ISNULL(getdate(),'1900-01-01' ),(102+@CONT))
SET @CONT = @CONT + 1
SELECT PARAMETRO = (@CONT + 102), RESULTADO = CONVERT(VARCHAR(30),ISNULL(getdate(),'1900-01-01' ),(102+@CONT))
SET @CONT = @CONT + 1
SELECT PARAMETRO = (@CONT + 102), RESULTADO = CONVERT(VARCHAR(30),ISNULL(getdate(),'1900-01-01' ),(102+@CONT))
SET @CONT = @CONT + 1
SELECT PARAMETRO = (@CONT + 102), RESULTADO = CONVERT(VARCHAR(30),ISNULL(getdate(),'1900-01-01' ),(102+@CONT))
SET @CONT = @CONT + 1
SELECT PARAMETRO = (@CONT + 102), RESULTADO = CONVERT(VARCHAR(30),ISNULL(getdate(),'1900-01-01' ),(102+@CONT))
SET @CONT = @CONT + 1
SELECT PARAMETRO = (@CONT + 102), RESULTADO = CONVERT(VARCHAR(30),ISNULL(getdate(),'1900-01-01' ),(102+@CONT))
SET @CONT = @CONT + 1
SELECT PARAMETRO = (@CONT + 102), RESULTADO = CONVERT(VARCHAR(30),ISNULL(getdate(),'1900-01-01' ),(102+@CONT))
SET @CONT = @CONT + 1
SELECT PARAMETRO = (@CONT + 102), RESULTADO = CONVERT(VARCHAR(30),ISNULL(getdate(),'1900-01-01' ),(102+@CONT))
SET @CONT = @CONT + 1
SELECT PARAMETRO = (@CONT + 102), RESULTADO = CONVERT(VARCHAR(30),ISNULL(getdate(),'1900-01-01' ),(102+@CONT))

--##########################################################################################################

SELECT CONVERT(VARCHAR(20), ISNULL(getdate(),'1900-01-01' ), 100)

SELECT CONVERT(VARCHAR(8), ISNULL(getdate(),'1900-01-01' ), 1) AS [MM/DD/YY]
SELECT CONVERT(VARCHAR(10), ISNULL(getdate(),'1900-01-01' ), 101) AS [MM/DD/YYYY]
SELECT CONVERT(VARCHAR(8), ISNULL(getdate(),'1900-01-01' ), 2) AS [YY.MM.DD]
SELECT CONVERT(VARCHAR(10), ISNULL(getdate(),'1900-01-01' ), 102) AS [YYYY.MM.DD]
SELECT CONVERT(VARCHAR(8), ISNULL(getdate(),'1900-01-01' ), 3) AS [DD/MM/YY]
SELECT CONVERT(VARCHAR(10), ISNULL(getdate(),'1900-01-01' ), 103) AS [DD/MM/YYYY]
SELECT CONVERT(VARCHAR(8), ISNULL(getdate(),'1900-01-01' ), 4) AS [DD.MM.YY]
SELECT CONVERT(VARCHAR(10), ISNULL(getdate(),'1900-01-01' ), 104) AS [DD.MM.YYYY]
SELECT CONVERT(VARCHAR(8), ISNULL(getdate(),'1900-01-01' ), 5) AS [DD-MM-YY]
SELECT CONVERT(VARCHAR(10), ISNULL(getdate(),'1900-01-01' ), 105) AS [DD-MM-YYYY]
SELECT CONVERT(VARCHAR(9), ISNULL(getdate(),'1900-01-01' ), 6) AS [DD MON YY]
SELECT CONVERT(VARCHAR(11), ISNULL(getdate(),'1900-01-01' ), 106) AS [DD MON YYYY]
SELECT CONVERT(VARCHAR(10), ISNULL(getdate(),'1900-01-01' ), 7) AS [Mon DD, YY]
SELECT CONVERT(VARCHAR(12), ISNULL(getdate(),'1900-01-01' ), 107) AS [Mon DD, YYYY]
SELECT CONVERT(VARCHAR(8), ISNULL(getdate(),'1900-01-01' ), 108)
SELECT CONVERT(VARCHAR(26), ISNULL(getdate(),'1900-01-01' ), 109)

SELECT CONVERT(VARCHAR(8), ISNULL(getdate(),'1900-01-01' ), 10) AS [MM-DD-YY]
SELECT CONVERT(VARCHAR(10), ISNULL(getdate(),'1900-01-01' ), 110) AS [MM-DD-YYYY]
SELECT CONVERT(VARCHAR(8), ISNULL(getdate(),'1900-01-01' ), 11) AS [YY/MM/DD]
SELECT CONVERT(VARCHAR(10), ISNULL(getdate(),'1900-01-01' ), 111) AS [YYYY/MM/DD]
SELECT CONVERT(VARCHAR(6), ISNULL(getdate(),'1900-01-01' ), 12) AS [YYMMDD]
SELECT CONVERT(VARCHAR(8), ISNULL(getdate(),'1900-01-01' ), 112) AS [YYYYMMDD]
SELECT CONVERT(VARCHAR(24), ISNULL(getdate(),'1900-01-01' ), 113)
SELECT CONVERT(VARCHAR(12), ISNULL(getdate(),'1900-01-01' ), 114) AS [HH:MI:SS:MMM(24H)]
SELECT CONVERT(VARCHAR(19), ISNULL(getdate(),'1900-01-01' ), 120)
SELECT CONVERT(VARCHAR(23), ISNULL(getdate(),'1900-01-01' ), 121)

SELECT CONVERT(VARCHAR(23), ISNULL(getdate(),'1900-01-01' ), 126)
SELECT CONVERT(VARCHAR(26), ISNULL(getdate(),'1900-01-01' ), 130)
SELECT CONVERT(VARCHAR(25), ISNULL(getdate(),'1900-01-01' ), 131)

--################################################################
SELECT SUBSTRING(CONVERT(VARCHAR(10), ISNULL(getdate(),'1900-01-01' ), 120), 3, 8) AS [YY-MM-DD]
SELECT REPLACE(CONVERT(VARCHAR(8), ISNULL(getdate(),'1900-01-01' ), 11), '/', '-') AS [YY-MM-DD]
SELECT CONVERT(VARCHAR(10), ISNULL(getdate(),'1900-01-01' ), 120) AS [YYYY-MM-DD]
SELECT REPLACE(CONVERT(VARCHAR(10), ISNULL(getdate(),'1900-01-01' ), 111), '/', '-') AS [YYYY-MM-DD]
SELECT RIGHT(CONVERT(VARCHAR(8), ISNULL(getdate(),'1900-01-01' ), 3), 5) AS [MM/YY]
SELECT SUBSTRING(CONVERT(VARCHAR(8), ISNULL(getdate(),'1900-01-01' ), 3), 4, 5) AS [MM/YY]
SELECT RIGHT(CONVERT(VARCHAR(10), ISNULL(getdate(),'1900-01-01' ), 103), 7) AS [MM/YYYY]
SELECT CONVERT(VARCHAR(5), ISNULL(getdate(),'1900-01-01' ), 11) AS [YY/MM]
SELECT CONVERT(VARCHAR(7), ISNULL(getdate(),'1900-01-01' ), 111) AS [YYYY/MM]
SELECT DATENAME(MM, ISNULL(getdate(),'1900-01-01' )) + RIGHT(CONVERT(VARCHAR(12), ISNULL(getdate(),'1900-01-01' ), 107), 9) AS [Month DD, YYYY]
SELECT SUBSTRING(CONVERT(VARCHAR(11), ISNULL(getdate(),'1900-01-01' ), 113), 4, 8) AS [Mon YYYY]
SELECT DATENAME(MM, ISNULL(getdate(),'1900-01-01' )) + ' ' + CAST(YEAR(ISNULL(getdate(),'1900-01-01' )) AS VARCHAR(4)) AS [Month YYYY]
SELECT CAST(DAY(ISNULL(getdate(),'1900-01-01' )) AS VARCHAR(2)) + ' ' + DATENAME(MM, ISNULL(getdate(),'1900-01-01' )) AS [DD Month]
SELECT DATENAME(MM, ISNULL(getdate(),'1900-01-01' )) + ' ' + CAST(DAY(ISNULL(getdate(),'1900-01-01' )) AS VARCHAR(2)) AS [Month DD]
SELECT CAST(DAY(ISNULL(getdate(),'1900-01-01' )) AS VARCHAR(2)) + ' ' + DATENAME(MM, ISNULL(getdate(),'1900-01-01' )) + ' ' + RIGHT(CAST(YEAR(ISNULL(getdate(),'1900-01-01' )) AS VARCHAR(4)), 2) AS [DD Month YY]
SELECT CAST(DAY(ISNULL(getdate(),'1900-01-01' )) AS VARCHAR(2)) + ' ' + DATENAME(MM, ISNULL(getdate(),'1900-01-01' )) + ' ' + CAST(YEAR(ISNULL(getdate(),'1900-01-01' )) AS VARCHAR(4)) AS [DD Month YYYY]
SELECT RIGHT(CONVERT(VARCHAR(8), ISNULL(getdate(),'1900-01-01' ), 5), 5) AS [MM-YY]
SELECT SUBSTRING(CONVERT(VARCHAR(8), ISNULL(getdate(),'1900-01-01' ), 5), 4, 5) AS [MM-YY]
SELECT RIGHT(CONVERT(VARCHAR(10), ISNULL(getdate(),'1900-01-01' ), 105), 7) AS [MM-YYYY]
SELECT RIGHT(CONVERT(VARCHAR(7), ISNULL(getdate(),'1900-01-01' ), 120), 5) AS [YY-MM]
SELECT SUBSTRING(CONVERT(VARCHAR(10), ISNULL(getdate(),'1900-01-01' ), 120), 3, 5) AS [YY-MM]
SELECT CONVERT(VARCHAR(7), ISNULL(getdate(),'1900-01-01' ), 120) AS [YYYY-MM]
SELECT REPLACE(CONVERT(VARCHAR(10), ISNULL(getdate(),'1900-01-01' ), 1), '/', '') AS [MMDDYY]
SELECT REPLACE(CONVERT(VARCHAR(10), ISNULL(getdate(),'1900-01-01' ), 101), '/', '') AS [MMDDYYYY]
SELECT REPLACE(CONVERT(VARCHAR(10), ISNULL(getdate(),'1900-01-01' ), 3), '/', '') AS [DDMMYY]
SELECT REPLACE(CONVERT(VARCHAR(10), ISNULL(getdate(),'1900-01-01' ), 103), '/', '') AS [DDMMYYYY]
SELECT REPLACE(RIGHT(CONVERT(VARCHAR(9), ISNULL(getdate(),'1900-01-01' ), 6), 6), ' ', '-') AS [Mon-YY]
SELECT REPLACE(RIGHT(CONVERT(VARCHAR(11), ISNULL(getdate(),'1900-01-01' ), 106), 8), ' ', '-') AS [Mon-YYYY]
SELECT REPLACE(CONVERT(VARCHAR(9), ISNULL(getdate(),'1900-01-01' ), 6), ' ', '-') AS [DD-Mon-YY]
SELECT REPLACE(CONVERT(VARCHAR(11), ISNULL(getdate(),'1900-01-01' ), 106), ' ', '-') AS [DD-Mon-YYYY]
