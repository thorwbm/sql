/*****************************************************************************************************************
*                                            OS DOIS PRIMEIROS NOMES                                             *
*                                                                                                                *
* SELECT QUE TRAZ OS DOIS PRIMEIROS NOMES DE UM NOME PASSADO.                                                    *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/


DECLARE @NOME VARCHAR(150)
SET @NOME = 'WEMERSON BITTORI MADURO'

SELECT Nome                =  @NOME,
       doisPrimerosNome    = SUBSTRING(@NOME,1, CHARINDEX(' ', SUBSTRING(@NOME,CHARINDEX(' ',@NOME)+1,LEN(@NOME)))+CHARINDEX(' ',@NOME)),
       primerioNome        = substring(@nome,1,CHARINDEX(' ',@NOME)-1), 
       ultimoNome          = reverse(substring(reverse(@nome),1,CHARINDEX(' ',reverse(@NOME))-1)), 
       NomePontoUltimoNome = substring(@nome,1,CHARINDEX(' ',@NOME)-1) + '.' + reverse(substring(reverse(@nome),1,CHARINDEX(' ',reverse(@NOME))-1))       
	   