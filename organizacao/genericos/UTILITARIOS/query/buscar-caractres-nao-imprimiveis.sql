/*****************************************************************************************************************
*                                        BUSCAR CARACTERES NAO IMPRIMIVEIS                                       *
*                                                                                                                *
*                                                                                                                *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: DDL                                                                                             *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:23/05/2017 *
******************************************************************************************************************/


select * 
from TABELA
where CAMPO like '%[^A-z0-9 .\/\-]%'