/*****************************************************************************************************************
*                                              SP_COMPARAR_TABELAS                                               *
*                                                                                                                *
*  PROCEDURE QUE RECEBE DUAS TABELAS IGUAIS E RETORNA OS REGISTROS QUE EXISTEM APENAS EM UMA, COLOCANDO NO FINAL *
*  O NOME DA TABELA EM QUE O REGISTRO UNICO SE ENCONTRA                                                          *
*                                                                                                                *
* BANCO_SISTEMA : GENERICO                                                                                       *
* CRIADO POR    : WEMERSON BITTORI MADURO                                                        DATA:08/12/2021 *
* ALTERADO POR  : WEMERSON BITTORI MADURO                                                        DATA:08/12/2021 *
******************************************************************************************************************/

alter PROCEDURE SP_COMPARAR_TABELAS  
   @TAB1 VARCHAR(100), @TAB2 VARCHAR(100) AS

DECLARE @SQL NVARCHAR(1000)
declare @tabela_temporaria varchar(50) =  'tmp_AUX_' + convert(varchar(10), @@SPID) 

SET @SQL = 
N'SELECT * INTO ' + @tabela_temporaria +' FROM (SELECT *, TABELA = ' + CHAR(39) + @TAB1 + CHAR(39) + ' FROM (
SELECT *  FROM ' + @TAB1 + ' 
EXCEPT 
SELECT *  FROM ' + @TAB2 + '
) AS TAB
UNION 
SELECT *, TABELA = ' + CHAR(39) + @TAB2 + CHAR(39) + ' FROM (
SELECT *  FROM ' + @TAB2 + '
EXCEPT 
SELECT *  FROM ' + @TAB1 + '
 ) AS TAB1) AS TBX  ORDER BY 1'

 EXEC SP_EXECUTESQL @SQL
 exec ('select * from ' + @tabela_temporaria) 
exec( 'drop table ' + @tabela_temporaria)



