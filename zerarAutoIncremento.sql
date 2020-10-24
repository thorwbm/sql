/*****************************************************************************************************************
*                                       COMANDO PARA ZERAR AUTOINCREMENTO                                        *
*                                                                                                                *
* COMDANDO QUE ZERA A CONTAGEM DO AUTOINCREMENTO.                                                                *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/

 DBCC CHECKIDENT('boleto', RESEED, 0) ;

