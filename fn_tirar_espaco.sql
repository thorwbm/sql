alter function fn_tirar_espaco(@texto nvarchar(max)) 
returns nvarchar(max)
as 
	begin
		declare @retorno nvarchar(max)

		set @retorno =  replace(LTRIM(rtrim(@texto)),'  ',' ')
		if (charindex('  ', @retorno) > 0) 
			begin 
				set @retorno = dbo.fn_tirar_espaco(@retorno) 
			end

		return @retorno  
	end 


select '*' + dbo.fn_tirar_espaco('       a     a      bbbb        e e e       ') + '*'
