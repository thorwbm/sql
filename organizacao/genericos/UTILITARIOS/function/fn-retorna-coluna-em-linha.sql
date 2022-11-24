
--  select dbo.fn_retorna_colunas_tabela('academico_aula')

create or alter function fn_retorna_colunas_tabela (@tabela varchar(100), @prefixo varchar(10)) 
returns varchar(max)
as 
begin 
    declare @cols nvarchar(max)
	declare @sufixo varchar(10) = ''

	if(@prefixo is null)
		begin
			set @prefixo = ''
		end
	else
		begin
			set @sufixo = '_' + @prefixo 
			set @prefixo = @prefixo + '.'
		end
	;


	with cte_temp as (
	SELECT distinct TABLE_NAME, COLUMN_NAME		 
		  FROM INFORMATION_SCHEMA.COLUMNS
         WHERE TABLE_NAME = @tabela 
	)
	select  @cols = stuff((
		select distinct ', ' 
		+ @prefixo + quotename(COLUMN_NAME) + ' as ' + quotename(COLUMN_NAME) +  @sufixo 
			from cte_temp for xml path('')
                  ), 1,1, '' )

	 return  replace(replace(@cols,'[',''),']','')
end 



