/*****************************************************************************************************************
*                                                ARREDONDAMENTO                                                  *
*                                                                                                                *
* ARREDONDAMENTO EXCLUINDO OS ZEROS QUE FICAM APOS O PROCESSO.                                                   *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/
DECLARE @CASASDECIMAIS INT, @NUMERO FLOAT 
SET @NUMERO = 45.12345
SET @CASASDECIMAIS =2

select convert(float,left(CONVERT(varchar(20),ROUND( @NUMERO,@CASASDECIMAIS)), charindex('.',CONVERT(varchar(20),ROUND( @NUMERO,1))) + @CASASDECIMAIS))

select convert(float,left(CONVERT(varchar(20),round(@NUMERO,@CASASDECIMAIS)),20))

SELECT cast( REPLACE(@NUMERO,',','.') as decimal(18,2))