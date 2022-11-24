/*****************************************************************************************************************
*                                              CRIPTOGRAFIA (SHA1)                                               *
*                                                                                                                *
* FORMAS DE CRIPTOGRAIA USANDO SHA1 NO SQLSERVER.                                                                *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/


DECLARE @HashThis nvarchar(4000);
SELECT @HashThis = CONVERT(nvarchar(4000),'senha');
SELECT right(HASHBYTES('SHA1', @HashThis),20)


/*USADO NOS MEUS SISTEMAS*/
SELECT SUBSTRING(sys.fn_sqlvarbasetostr(HASHBYTES('sha1', 'senha')),3,60)

select  HashBytes('SHA1','senha')

select hashbytes('SHA1',CONVERT(nvarchar(4000),'senha'))