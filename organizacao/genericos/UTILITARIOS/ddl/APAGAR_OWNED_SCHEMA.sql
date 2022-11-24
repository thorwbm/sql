/*****************************************************************************************************************
*                                        SCRIPT PARA APABAR OWNED SCHEMA                                         *
*                                                                                                                *
*  USADO PARA APAGAR OWNED SCHEMA E USER                                                                         *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: DDL                                                                                             *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:23/05/2017 *
******************************************************************************************************************/

SELECT name FROM  sys.schemas WHERE principal_id = USER_ID('sysfelAdm')

ALTER AUTHORIZATION ON SCHEMA::NAME TO dbo 
GO
DROP USER NAMEUSER