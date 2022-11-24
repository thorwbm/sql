
/*****************************************************************************************************************
*                                             FN_GERAR_STRING_JSON                                               *
*                                                                                                                *
*  FUNCTION QUE GERA UMA LINHA EM FORMATO JSON COM TODOS OS CAMPOS DE UMA TABELA E COM SEUS VALORES NULOS        *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA : GERERICO                                                                                       *
* CRIADO POR    : WEMERSON BITTORI MADURO                                                        DATA:14/06/2021 *
* ALTERADO POR  : WEMERSON BITTORI MADURO                                                        DATA:14/06/2021 *
******************************************************************************************************************/


ALTER function FN_GERAR_STRING_JSON (@tabela varchar(100)) 
returns varchar(max)
as 
begin 
declare @coluna varchar(100) 
declare @retorno varchar(max) = '{"tabela" : {"nome" : "' + @tabela + '" '
declare @campo varchar(200)
declare @virgula char(1) = ' '

declare CUR_ cursor for 
--------------------------------------------------------------------------------
		select table_name, column_name
		  from INFORMATION_SCHEMA.COLUMNS
		 where TABLE_NAME = @tabela
		 order by 2
--------------------------------------------------------------------------------

	open CUR_ 
		fetch next from CUR_ into @tabela, @campo
		while @@FETCH_STATUS = 0
			BEGIN
				set @retorno = @retorno + ( ', "' + @campo + '": {"antigo" : null, "novo" : null}')
				
			fetch next from CUR_ into @tabela, @campo
			END
	close CUR_ 
deallocate CUR_ 
set @retorno = @retorno + '}}'

return @retorno
end