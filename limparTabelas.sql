SELECT table_name AS TABELA, column_name AS COLUNA
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE OBJECTPROPERTY(OBJECT_ID(constraint_name), 'IsPrimaryKey') = 1


declare @sql varchar(100), @cont int, @tabela varchar(50) 
set @tabela = 'usuario'
--set @sql = 'select  count(*) from ' + @tabela

-- exec (@sql)

set @cont = exec N'select count(*)from usuario'
print @cont 

