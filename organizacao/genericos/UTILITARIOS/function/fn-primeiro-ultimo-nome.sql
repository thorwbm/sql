ALTER function fn_primeiro_ultimo_nome (@NOME VARCHAR(200),@separador varchar(10), @tipo int)  
returns varchar(max) as   
begin  
 declare @retorno varchar(max) 
 set @nome = trim(@nome)

 IF(charindex(' ', @nome)= 0)
	BEGIN
		RETURN @NOME
	END

 if(@tipo = 1) -- PRIMEIRO E ULTIMO NOME SEPARADOS POR SEPARADOR
	BEGIN
		
		set @retorno = LEFT(@nOME, charindex(' ', @nome)-1) + @separador +  
                   reverse(LEFT(reverse(@nOME), charindex(' ', reverse(@nome))-1))  
	END
 ELSE IF (@tipo = 2) -- PRIMEIRO NOME
	BEGIN
		set @retorno = LEFT(@nOME, charindex(' ', @nome)-1)  
	END
 ELSE IF (@tipo = 3) -- ULTIMO NOME
	BEGIN
		set @retorno = reverse(LEFT(reverse(@nOME), charindex(' ', reverse(@nome))-1))  
	END
 return @retorno  
end


