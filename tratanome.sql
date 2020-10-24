/*****************************************************************************************************************
*                                            TRATANDO NOME DA SECAO                                              *
*                                                                                                                *
* SELECT PARA TRATAR NO NOME DAS SECOES (RETIRAR DIRETO, INDIRETO E OPERACIONAL).                                *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: CORPORE - RMLABORE                                                                              *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/

select secao = reverse(substring(reverse(descricao),charindex(' ',reverse(descricao))+1,len(reverse(descricao)))) ,* 
 from psecao where len(codigo) > 10