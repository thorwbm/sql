/*****************************************************************************************************************
*                                             FUNCAO CONTA CARACTER                                              *
*                                                                                                                *
* FUNCAO QUE RECEBE UMA STRING GABARITO E UM CHAR E RETORNA AS POSICAO EM QUE O CHAR E ENCONTRADO DENTRO DA STRI *
*                                                                                                                *
*                                                                                                                *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:23/09/2015 *
******************************************************************************************************************/
ALTER function contaCaracter(@gabarito varchar(100),@carcter char(1)) returns varchar(100) as
begin
declare @invalidos varchar(100), @cont int, @tamanho int, @teste varchar (10)
	set @gabarito = replace(@gabarito,@carcter,'|')
	set @tamanho = LEN(@gabarito) 
	set @cont = 1
	set @invalidos =''
	while (@cont <= @tamanho)
		begin
			set @teste = SUBSTRING(@gabarito,@cont,1)
			if (SUBSTRING(@gabarito,@cont,1) = '|')
				begin
					set @invalidos = @invalidos + CONVERT(varchar(10),@cont) + ';'
				end
			set @cont = @cont + 1
		end
	return(@invalidos)
end

print @invalidos

declare @gabarito varchar(100), @invalidos varchar(100), @cont int, @tamanho int, @teste varchar (10)
set @gabarito = replace('ADDBCDDCBCBACDCBACDACACBBACACCDCDBDBACACBABCADDBCDBDBADDDCBB          ',' ','|')

set @tamanho = LEN(@gabarito) 

print @tamanho
set @cont = 1
set @invalidos =''

while (@cont <= @tamanho)
	begin
	    set @teste = SUBSTRING(@gabarito,@cont,1)
	    if (SUBSTRING(@gabarito,@cont,1) = '|')
			begin
				set @invalidos = @invalidos + CONVERT(varchar(10),@cont) + ';'
			end
		set @cont = @cont + 1
	end


print @invalidos

