/*****************************************************************************************************************
*                                               FN_RETIRAR_ACENTO                                                *
*                                                                                                                *
*  FUNCAO QUE REMOVE OS ACENTOS DE UM TEXTO PASSADO COMO PARAMENTRO                                              *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA : GENERICO                                                                                       *
* CRIADO POR    : WEMERSON BITTORI MADURO                                                        DATA:08/12/2021 *
* ALTERADO POR  : WEMERSON BITTORI MADURO                                                        DATA:08/12/2021 *
******************************************************************************************************************/

Create or alter Function FN_retirar_acento (@texto varchar(max))
Returns varchar(max)
as
Begin
   Declare @cRetorno varchar(500)
   
   Set @cRetorno = @texto collate sql_latin1_general_cp1251_cs_as   
   Return ltrim(rtrim(@cRetorno))
   
End
