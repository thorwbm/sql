/*****************************************************************************************************************
*                                            CRIA CONSTRAINT UNIQUE                                              *
*                                                                                                                *
* PROVAVELMENTE PARA CRIAR UMA CRONSTRAINT VIA LINHA DE CODIGO.                                                  *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: DESCONHECIDO                                                                                    *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/

alter table MovtoBanc with nocheck add constraint NDocDuplo unique([numdoc])