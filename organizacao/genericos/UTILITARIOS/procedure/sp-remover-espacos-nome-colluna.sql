create procedure sp_remover_espaco_nome_coluna @tabela varchar(max) as 
declare @sql varchar(max)

declare CUR_ cursor for
------------------------------------------------------------------------------------------------------------------------
select comando = 'exec sp_rename ' + CHAR(39) + TABLE_NAME + '.[' +  COLUMN_NAME + ']'  + CHAR(39) +  ', ' + CHAR(39) 
                         + REPLACE(REPLACE(REPLACE(dbo.fn_remover_acentuacao(COLUMN_NAME) , '-',''), ' ','_'), '__','_') + CHAR(39) + ', ' + CHAR(39) +
						 'column'  + CHAR(39) + ';'
 from INFORMATION_SCHEMA.COLUMNS 
 where TABLE_NAME = @tabela and 
       (COLUMN_NAME like '% %'   or COLUMN_NAME like ('%�%') or COLUMN_NAME like ('%�%') or COLUMN_NAME like ('%�%') or
		COLUMN_NAME like ('%�%') or	COLUMN_NAME like ('%�%') or	COLUMN_NAME like ('%�%') or	COLUMN_NAME like ('%�%') or
		COLUMN_NAME like ('%�%') or	COLUMN_NAME like ('%�%') or	COLUMN_NAME like ('%�%') or	COLUMN_NAME like ('%�%') or 
		COLUMN_NAME like ('%�%') or	COLUMN_NAME like ('%�%') or	COLUMN_NAME like ('%�%') or	COLUMN_NAME like ('%�%') or
		COLUMN_NAME like ('%�%') or COLUMN_NAME like ('%�%') or	COLUMN_NAME like ('%�%') or	COLUMN_NAME like ('%�%') or
		COLUMN_NAME like ('%�%') or	COLUMN_NAME like ('%�%') or	COLUMN_NAME like ('%�%') or	COLUMN_NAME like ('%�%') or
		COLUMN_NAME like ('%�%') or	COLUMN_NAME like ('%�%'))
------------------------------------------------------------------------------------------------------------------------
	open CUR_ 
		fetch next from CUR_ into @sql
		while @@FETCH_STATUS = 0
			BEGIN
				exec (@sql)

			fetch next from CUR_ into @sql
			END
	close CUR_ 
deallocate CUR_