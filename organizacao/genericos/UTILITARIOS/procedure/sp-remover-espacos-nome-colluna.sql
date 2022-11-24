create procedure sp_remover_espaco_nome_coluna @tabela varchar(max) as 
declare @sql varchar(max)

declare CUR_ cursor for
------------------------------------------------------------------------------------------------------------------------
select comando = 'exec sp_rename ' + CHAR(39) + TABLE_NAME + '.[' +  COLUMN_NAME + ']'  + CHAR(39) +  ', ' + CHAR(39) 
                         + REPLACE(REPLACE(REPLACE(dbo.fn_remover_acentuacao(COLUMN_NAME) , '-',''), ' ','_'), '__','_') + CHAR(39) + ', ' + CHAR(39) +
						 'column'  + CHAR(39) + ';'
 from INFORMATION_SCHEMA.COLUMNS 
 where TABLE_NAME = @tabela and 
       (COLUMN_NAME like '% %'   or COLUMN_NAME like ('%ý%') or COLUMN_NAME like ('%á%') or COLUMN_NAME like ('%à%') or
		COLUMN_NAME like ('%â%') or	COLUMN_NAME like ('%ã%') or	COLUMN_NAME like ('%ä%') or	COLUMN_NAME like ('%ñ%') or
		COLUMN_NAME like ('%é%') or	COLUMN_NAME like ('%è%') or	COLUMN_NAME like ('%ê%') or	COLUMN_NAME like ('%ë%') or 
		COLUMN_NAME like ('%ç%') or	COLUMN_NAME like ('%í%') or	COLUMN_NAME like ('%ì%') or	COLUMN_NAME like ('%î%') or
		COLUMN_NAME like ('%ï%') or COLUMN_NAME like ('%ó%') or	COLUMN_NAME like ('%ò%') or	COLUMN_NAME like ('%ô%') or
		COLUMN_NAME like ('%õ%') or	COLUMN_NAME like ('%ö%') or	COLUMN_NAME like ('%ú%') or	COLUMN_NAME like ('%ù%') or
		COLUMN_NAME like ('%û%') or	COLUMN_NAME like ('%ü%'))
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