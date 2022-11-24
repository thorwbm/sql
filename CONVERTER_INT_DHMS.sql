/*****************************************************************************************************************  
*                                            CONVERTE INT(SEC) IN DHM                                            *  
*                                                                                                                *  
* CRIA UMA FUNCAO QUE RECEBE UM INTEIRO (SEGUNDOS) E RETORNA NO PADRAO DIA HORA MINUTO SEGUNDO                   *  
*                                                                                                                *  
*                                                                                                                *  
* BANCO_SISTEMA: GENERICO                                                                                        *  
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:20/05/2021 *  
******************************************************************************************************************/  
--   select [dbo].[converter_int_DHM](1442345)
--  select [dbo].[tempoPorExtenso](1442345)
--DROP FUNCTION CONVERTER_INT_DHMS
CREATE function [dbo].[FN_CONVERTER_INT_DHMS](@tempo integer)  
 RETURNS  varchar(50)  
  
	WITH EXECUTE AS CALLER  
		BEGIN  
			declare @retorno varchar(50);  
				if(@tempo < 60)  
					begin   
						set @retorno =right('0'+convert(varchar(10),@tempo),2);  
					end  
				else   
					begin   
						set @retorno = right('0'+convert(varchar(10),@tempo%60),2);  
						set @tempo = @tempo/60;  
						if(@tempo > 0)  
							begin   
								set @retorno = right('0'+convert(varchar(10),@tempo%60),2) + ':' + @retorno;  
								set @tempo = @tempo/60;  
								if(@tempo > 0)  
									begin   
										set @retorno = right('0'+convert(varchar(10),@tempo%24),2) + ':' + @retorno;  
										set @tempo = @tempo/24;  
										if(@tempo >0)  
										begin   
											set @retorno = convert(varchar(10),@tempo) + 'd ' + @retorno;  
										end  
									end  
							end  
					end;  
			RETURN(@retorno);  
		end; 