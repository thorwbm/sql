--#############################################################################

 CREATE FUNCTION [dbo].[FN_QTD_REGISTROS] (@TABELA VARCHAR(200))
 RETURNS INT 
 AS 
 BEGIN 
 DECLARE @RETORNO INT

 select
    @RETORNO = 
    sum(partitions.rows) 
from sys.tables as tabelas
join sys.partitions as partitions on tabelas.object_id = partitions.object_id and partitions.index_id in (0,1)
WHERE tabelas.name = @TABELA 
group by schema_name(schema_id), tabelas.name
RETURN @RETORNO 

END
GO
--#############################################################################

   CREATE    view [dbo].[vw_tabela_coluna] as           
  SELECT table_name as tabela, column_name as coluna, DATA_TYPE AS TIPO, DBO.FN_QTD_REGISTROS(TABLE_NAME) AS QTD_REGISTRO, 
         delimitador = case when numeric_precision is null then char(39) else '' end  FROM INFORMATION_SCHEMA.COLUMNS          
  WHERE (TABLE_NAME NOT LIKE 'LOG_%' AND            
      TABLE_NAME NOT LIKE 'TMP%' AND           
      TABLE_NAME NOT LIKE 'BKP%' AND           
      TABLE_NAME NOT LIKE 'VW_%' ) 
GO

USE [ERP_POS_HMG_JN]
GO

