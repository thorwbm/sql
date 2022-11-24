/*****************************************************************************************************************
*                                               FN_CONTA_CARACTER                                                *
*                                                                                                                *
*  FUNCAO QUE RECEBE UMA STRING E UM CARACTER EM ESPECIFICO QUE SERA CONTADO DENTRO DESTA STRING                 *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA : GENERICO                                                                                       *
* CRIADO POR    : WEMERSON BITTORI MADURO                                                        DATA:08/12/2021 *
* ALTERADO POR  : WEMERSON BITTORI MADURO                                                        DATA:08/12/2021 *
******************************************************************************************************************/

create function fn_conta_caracter (@string varchar(max),@caracter varchar(1))
returns int 
as 
begin
	return len(@string) - len(replace(@string, @caracter, ''))
end 

