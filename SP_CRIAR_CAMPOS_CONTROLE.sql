/*****************************************************************************************************************
*                                           SP_CRIAR_CAMPOS_CONTROLE                                             *
*                                                                                                                *
*  PROCEDURE QUE CRIA OS CAMPOS DE CONTROLE (COD_USU_CRI, COD_USU_ALT, DAT_CRI, DAT_ALT) CRIANDO UMA CONSTRAINT  *
*  VALOR DEFAULT PARA O CAMPO DAT_CRI E UMA TRIGGER PARA O CAMPO DAT_ALT                                         *
*                                                                                                                *
* BANCO_SISTEMA : SIPEPS                                                                                         *
* CRIADO POR    : WEMERSON BITTORI MADURO                                                        DATA:14/06/2021 *
* ALTERADO POR  : WEMERSON BITTORI MADURO                                                        DATA:14/06/2021 *
******************************************************************************************************************/

ALTER PROCEDURE SP_CRIAR_CAMPOS_CONTROLE  @tabela varchar(100) AS 
---------------------------------------------------------------
declare @chave_primaria varchar(200) = dbo.FN_CHAVE_PRIMARIA(@tabela)

declare @sql_criacao varchar(max) =
				'alter table ' + @tabela +
					  ' add cod_usu_cri int null,
						    cod_usu_alt int null,
						    dat_cri datetime null,
						    dat_alt datetime null' 
---------------------------------------------------------------

declare @sql_alteracao varchar(max) =
       ' ALTER TABLE ' + @tabela + ' ADD CONSTRAINT DF_' + @tabela + 
	   '_dat_cri DEFAULT GETDATE() FOR dat_cri'
---------------------------------------------------------------

declare @sql_trigger varchar(max) =
        'CREATE TRIGGER tg_' + @tabela + '_data_alteracao ON ' + @tabela + '  
            AFTER insert,update
        AS 
        BEGIN	
	       SET NOCOUNT ON;

           update ' + @tabela + ' set dat_alt = getdate()
	        where ' + @chave_primaria  + ' in (select ' + @chave_primaria  + ' from inserted)
		END'
-------------------------------------------------------------
BEGIN TRAN
	BEGIN TRY 

		exec(@sql_criacao)
		exec(@sql_alteracao)
		EXEC(@SQL_TRIGGER)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK 
		PRINT ('Não foi possivel criar os campos de controle na tabela ' + @tabela + ' ! Error ' + ERROR_MESSAGE())
	END CATCH


--##############################################################################
/*

create function FN_CHAVE_PRIMARIA(@tabela varchar(200))   
returns varchar(200)  
as   
 begin   
  declare @retorno varchar(200)  
  
  SELECT @retorno = column_name  
   FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE  
     WHERE OBJECTPROPERTY(OBJECT_ID(constraint_name), 'IsPrimaryKey') = 1 and   
     table_name = @tabela  
  return @retorno  
 end

 */
--##############################################################################

