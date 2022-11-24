/*****************************************************************************************************************
*                                                 CURSOR BASICO                                                  *
*                                                                                                                *
*  CURSOR BASICO PARA CORRER UMA TABELA                                                                          *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA : GENERICO                                                                                       *
* CRIADO POR    : WEMERSON BITTORI MADURO                                                        DATA:08/12/2021 *
* ALTERADO POR  : WEMERSON BITTORI MADURO                                                        DATA:08/12/2021 *
******************************************************************************************************************/

declare CUR_ cursor for 
	SELECT * FROM 
	open CUR_ 
		fetch next from CUR_ into CAMPOS NA ORDEM DO SELECT
		while @@FETCH_STATUS = 0
			BEGIN
				ACOES A SEREM TOMADAS


			fetch next from CUR_ into CAMPOS NA ORDEM DO SELECT
			END
	close CUR_ 
deallocate CUR_ 