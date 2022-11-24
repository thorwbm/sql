create function fn_primeiro_ultimo_nome (@NOME VARCHAR(200),@separador varchar(10))
returns varchar(max) as 
begin
	declare @retorno varchar(max)
	set @retorno = LEFT(@nOME, charindex(' ', @nome)-1) + @separador +
                   reverse(LEFT(reverse(@nOME), charindex(' ', reverse(@nome))-1))

	return @retorno
end