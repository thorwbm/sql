/*****************************************************************************************************************
*                                  CRIACAO DE CHAVE ESTRANGEIRA - FORIENG KEY                                    *
*                                                                                                                *
*  COMO CRIAR REFERENCIA DE CHAVE ESTRANGEIRA ENTRE TABELAS                                                      *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA : GENERICO                                                                                       *
* CRIADO POR    : WEMERSON BITTORI MADURO                                                        DATA:08/12/2021 *
* ALTERADO POR  : WEMERSON BITTORI MADURO                                                        DATA:08/12/2021 *
******************************************************************************************************************/

ALTER TABLE [nome-tabela]
ADD CONSTRAINT [nome-constraint]
FOREIGN KEY ([nome-campo])
REFERENCES Persons([nome-campo-referencia])