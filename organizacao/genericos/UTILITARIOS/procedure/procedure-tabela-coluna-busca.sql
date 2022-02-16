


-- exec sp_rastrear_campos 'curso_id','57'  -- campo, valor do campo

alter procedure sp_rastrear_campos @coluna varchar(max), @valor varchar(max) as 
declare @sql    varchar(max) = ''
declare @tabela varchar(max)
declare @delimitador varchar(2)

declare CUR_TABELA_COLUNA cursor for
--------------------------------------------------------------------------------
select distinct tabela, coluna, delimitador
  from vw_tabela_coluna
  where tipo_tabela = 'user_table' and 
        coluna = @coluna 
  order by 1
--------------------------------------------------------------------------------
	open CUR_TABELA_COLUNA 
		fetch next from CUR_TABELA_COLUNA into @tabela, @coluna, @delimitador
		while @@FETCH_STATUS = 0
			BEGIN
				
                if(@sql <> '')
                    begin
                        set @sql = @sql + ' union '
                    end
                if (@delimitador = char(39))  
                    begin
                        set @sql = @sql + 'select count(1) as qtd, tabela = ' + char(39) + @tabela + char(39) + ' , filtro = ' + char(39) + @coluna + ' = '  +  @valor + char(39) + 
                        ' from ' + @tabela + ' where ' + @coluna + ' = ' + char(39) +  convert(varchar(100),@valor) + char(39)
                    end
                else
                    begin
                        set @sql = @sql + 'select count(1) as qtd, tabela = ' + char(39) + @tabela + char(39)  + ' , filtro = ' + char(39) + @coluna + ' = '  +  @valor + char(39) +
                        ' from ' + @tabela + ' where ' + @coluna + ' = ' + @valor
                    end
			fetch next from CUR_TABELA_COLUNA into @tabela, @coluna, @delimitador
			END
	close CUR_TABELA_COLUNA 
deallocate CUR_TABELA_COLUNA 

set @sql = 'select * from (' +  @sql + ') as tab where qtd > 0' 
exec (@sql)


