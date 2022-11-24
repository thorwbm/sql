
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

