/*****************************************************************************************************************
*                                                 FUNCAO SPLIT                                                   *
*                                                                                                                *
*  funcao que recebe uma string (lista de strings separadas por um separador) e um char (separador) e tem como   *
* retorno uma tabela com os itens da lista                                                                       *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:02/09/2017 *
******************************************************************************************************************/


create FUNCTION dbo.fn_wbm_split_string(@texto varchar(max), @separador char(1))
	RETURNS @retLista TABLE 
			(valor varchar(max))	
	as 
	begin
		declare  @aux varchar(max), @cont int;
		set @cont = 1

		if(right(@texto,1) <> ',')
			begin
				set @texto = @texto + @separador
			end;

		while (len(@texto) > 0)
			begin
				set @aux = left(@texto,charindex(@separador,@texto) - 1)
				insert into @retLista values(ltrim(rtrim(@aux)))
				set @texto = right(@texto,len(@texto) - charindex(@separador,@texto))
				set @cont = @cont + 1
			end;

		return;
	end;



/*****************************************************************************************************************
*                                                 FUNCAO SPLIT                                                   *
*                                                                                                                *
*  funcao que recebe uma string (lista de numeros separadas por um separador) e um char (separador) e tem como   *
* retorno uma tabela com os itens da lista                                                                       *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:02/09/2017 *
******************************************************************************************************************/


ALTER FUNCTION [dbo].[fn_wbm_split_integer](@texto varchar(max), @separador char(1))
	RETURNS @retLista TABLE 
			(valor int)	
	as 
	begin
		declare  @aux varchar(max), @cont int;
		set @cont = 1

		if(right(@texto,1) <> ',')
			begin
				set @texto = @texto + @separador
			end;

		while (len(@texto) > 0)
			begin
				set @aux = left(@texto,charindex(@separador,@texto) - 1)
				insert into @retLista values(cast(@aux as int))
				set @texto = right(@texto,len(@texto) - charindex(@separador,@texto))
				set @cont = @cont + 1
			end;

		return;
	end;


