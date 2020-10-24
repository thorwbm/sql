/*****************************************************************************************************************
*                                               ALTERA COLLATION                                                 *
*                                                                                                                *
* SEQUENCIA QUE ALTERA O COLLATION DO BANCO DE DADOS. LEMBRANDO QUE NAO SE ALTERA O COLLATION DA TABELA SO DA IN *
* STANCIA                                                                                                        *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:16/11/2015 *
******************************************************************************************************************/

ALTER DATABASE NOMEBANCO SET SINGLE_USER WITH ROLLBACK IMMEDIATE 
ALTER DATABASE NOMEBANCO COLLATE NOVO_COLLATION 
ALTER DATABASE NOMEBANCO SET MULTI_USER