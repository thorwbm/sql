/*****************************************************************************************************************
*                                             GERAR RELACIONAMENTOS                                              *
*                                                                                                                *
* SELECT QUE GERA UMA LISTA DE RELACIONAMENTOS ENTRE TABELAS COM BASE NOS NOMES DOS CAMPOS.                      *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/

DECLARE @TAB1 VARCHAR(20) , @TAB2 VARCHAR(20) ,@ALIAS1 VARCHAR(20) , @ALIAS2 VARCHAR(20) 
SET @TAB1   = 'formaingr'
SET @ALIAS1 = 'fri'
SET @TAB2   = 'alucurriculo'
SET @ALIAS2 = 'alc'

SELECT TAB1.COLUMN_NAME,TAB1.DATA_TYPE ,
       UNIAO = @ALIAS1 +'.'+ TAB1.COLUMN_NAME + ' = ' + @ALIAS2+'.'+ TAB2.COLUMN_NAME + ' AND '    
FROM INFORMATION_SCHEMA.COLUMNS TAB1 JOIN  INFORMATION_SCHEMA.COLUMNS TAB2 ON (TAB2.COLUMN_NAME = TAB1.COLUMN_NAME AND
                                                                               TAB2.DATA_TYPE   = TAB1.DATA_TYPE)
WHERE TAB1.TABLE_NAME = @TAB1 AND  TAB2.TABLE_NAME = @TAB2   
      -- AND TAB1.IS_NULLABLE = 'NO' AND TAB2.IS_NULLABLE = 'NO' 
       and TAB1.COLUMN_NAME <> 'CONCURRENCYID'  
       and TAB1.COLUMN_NAME <> 'DTPROCESSAMENTOREGISTRO'

-- select * from discgrad