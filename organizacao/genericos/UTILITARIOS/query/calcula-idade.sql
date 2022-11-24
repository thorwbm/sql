/*****************************************************************************************************************
*                                        CALCULA IDADE                                                           *
*                                                                                                                *
*  CALCULO DA IDADE COMPLETA                                                                                     *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: DDL                                                                                             *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:23/05/2017 *
******************************************************************************************************************/

DECLARE @DATA DATE = '1970-08-03'
select convert (int, convert( decimal,convert (varchar( 10), getdate(), 112)) /10000 - convert( decimal,convert (varchar( 10), @DATA , 112)) /10000 )