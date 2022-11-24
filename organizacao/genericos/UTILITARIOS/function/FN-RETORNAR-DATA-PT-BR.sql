/*****************************************************************************************************************
*                                                 FN_DATA_PTBR                                                   *
*                                                                                                                *
*  FUNCAO QUE RECEBE UMA DATA E UM SEPARADOR E RETORNA UM UMA STRING COM A DATA NO FORMATO DD(SEPARADOR)         *
*  MM(SEPARDOR)YYYY HH:MM:SS:mmm                                                                                 *
*                                                                                                                *
* BANCO_SISTEMA : GENERICO                                                                                       *
* CRIADO POR    : WEMERSON BITTORI MADURO                                                        DATA:28/01/2020 *
* ALTERADO POR  : WEMERSON BITTORI MADURO                                                        DATA:28/01/2020 *
******************************************************************************************************************/

create function fn_data_ptbr (@data datetime, @separador varchar(1))
returns varchar(30) as
begin 
declare @retorno varchar(30)

	select  @retorno = right('0'+convert(varchar(2),day(@data)),2) + @separador + right('0'+convert(varchar(2),month(@data)),2) + @separador + convert(varchar(4),year(@data)) + ' '+ CONVERT(VARCHAR(30), @data,(114))

return @retorno 
end


select dbo.fn_data_ptbr(null, '/')