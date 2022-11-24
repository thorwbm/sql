/*****************************************************************************************************************  
*                                            CALCULA TEMPO DOCORRIDO                                             *  
*                                                                                                                *  
* CRIA UMA FUNCAO QUE RETORNA O TEMPO DECORRIDO POR EXTENSO, O VALOR DE ENTRADA DEVERA SER INFORMADO EM SEGUNDOS *  
* . RETORNA EM DIAS, HORAS, MINUTOS E SEGUNDOS.                                                                  *  
*                                                                                                                *  
* BANCO_SISTEMA: GENERICO                                                                                        *  
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:20/05/2021 *  
******************************************************************************************************************/  
--   select [dbo].[tempoPorExtenso](1442345)


CREATE function fn_tempo_por_extenso(@tempo integer)  
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
						set @retorno =':'+ right('0'+convert(varchar(10),@tempo%60),2) + ' seg';  
						set @tempo = @tempo/60;  
						if(@tempo > 0)  
							begin   
								set @retorno =':'+ right('0'+convert(varchar(10),@tempo%60),2) + ' min' + @retorno;  
								set @tempo = @tempo/60;  
								if(@tempo > 0)  
									begin   
										set @retorno =' '+ right('0'+convert(varchar(10),@tempo%24),2) + ' hor' + @retorno;  
										set @tempo = @tempo/24;  
										if(@tempo >0)  
										begin   
											set @retorno = convert(varchar(10),@tempo) + ' ' + @retorno;  
										end  
									end  
							end  
					end;  
			RETURN(@retorno);  
		end;  
   