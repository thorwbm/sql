--  https://www.fabriciolima.net/blog/2018/07/12/azure-sql-database-como-fazer-um-join-entre-tabelas-de-bases-diferentes/

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'senhadificil->123456'

CREATE DATABASE SCOPED CREDENTIAL Db02Credential WITH IDENTITY = 'dba_admin', SECRET = 'senha_user_dba_admin'




CREATE EXTERNAL DATA SOURCE Db02DataSource WITH
(TYPE = RDBMS, --Query
LOCATION = 'srvfabriciolimasolucoes.database.windows.net', --Servidor logico no azure onde está a base database02
DATABASE_NAME = 'database02',    --base que queremos acessar com a credencial Db02Credential
CREDENTIAL = Db02Credential        --Db02Credential - credencial que criamos para acessar a base database02
) ;




CREATE EXTERNAL TABLE [dbo].xxxxxxx
(
	/* campos da tabela original */ nome tipo requerido
)
WITH (DATA_SOURCE = dts_nome_dts,SCHEMA_NAME = N'dbo',OBJECT_NAME = N'nome_original_table')
GO