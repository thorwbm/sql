/*****************************************************************************************************************
*                                            APAGA TABELA TEMPORARIA                                             *
*                                                                                                                *
* COMANDO PARA SER USADO EM PROCEDIMENTOS/FUNCOES QUE CRIA UMA CONDICAO PARA APAGAR TABELAS TEMPORARIAS DURANTE  *
* O PROCESSAMENTO .                                                                                              *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/

if OBJECT_ID('TempDB.dbo.#tempccd') IS NOT NULL
	begin 
		drop table #tempccd
	end