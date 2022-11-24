
create or alter function fn_tabela_coluna (@tabela varchar(100), @coluna varchar(100))
returns table as 

return
select table_name as tabela, column_name as coluna, 
       tipo        = case when data_type in (N'int', N'numeric', N'float', N'bigint') then 'numerico'
	                      when data_type in (N'varbinary', N'varchar', N'char', N'nvarchar') then 'string'
				          when data_type in (N'date', N'datetime',N'time', N'timestamp') then 'data'
				          else 'desconhecido' end, 
       delimitador = case when data_type in (N'int', N'numeric', N'float', N'bigint') then ''
	                      when data_type in (N'varbinary', N'varchar', N'char', N'nvarchar') then char(39)
				          when data_type in (N'date', N'datetime',N'time', N'timestamp') then char(39)
				          else 'desconhecido' end,
	  aceita_nulo = IS_NULLABLE
  from INFORMATION_SCHEMA.COLUMNS
  where (table_name = @tabela or @tabela is null) and 
        (column_name = @coluna or @coluna is null) 



	--	select * from fn_tabela_coluna(null, 'cod_can')



