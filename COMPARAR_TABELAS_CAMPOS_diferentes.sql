/**********************************************************************************************************************************
*                                                     [SP_COMPARAR_TABELAS]                                                       *
*                                                                                                                                 *
*  PROCEDURE QUE RECEBE O NOME DE DUAS TABELAS E SE ELAS POSSUIREM A MESMA ESTRUTURA SERA COMPARADO CAMPO A CAMPO SE OS DADOS EST *
* AO IGUAIS)                                                                                                                      *
*                                                                                                                                 *
* BANCO_SISTEMA : ENEM                                                                                                            *
* CRIADO POR    : WEMERSON BITTORI MADURO                                                                         DATA:10/10/2019 *
* ALTERADO POR  : WEMERSON BITTORI MADURO                                                                         DATA:10/10/2019 *
**********************************************************************************************************************************/
-- EXEC SP_COMPARAR_TABELAS_CAMPO_A_CAMPO usuarios_hierarquia, LOG_usuarios_hierarquia


alter  PROCEDURE SP_diferenca_campos  
   @TAB1 VARCHAR(100), @TAB2 VARCHAR(100) AS

DECLARE @SQL NVARCHAR(4000),@CAMPOS_SQL NVARCHAR(4000), @CAMPO VARCHAR(500), @SQL1 VARCHAR(500), @SQL2 VARCHAR(500)

SET @SQL1 = N'SELECT DISTINCT TAB1.*, TABELA = ' + CHAR(39) + @TAB1 + CHAR(39) + ' FROM ' + @TAB1 + ' AS TAB1 WITH(NOLOCK) LEFT  JOIN ' + @TAB2 + ' AS TAB2 WITH(NOLOCK) ON ( ' 
SET @SQL2 = N'SELECT DISTINCT TAB2.*, TABELA = ' + CHAR(39) + @TAB2 + CHAR(39) + ' FROM ' + @TAB1 + ' AS TAB1 WITH(NOLOCK) RIGHT JOIN ' + @TAB2 + ' AS TAB2 ON ( ' 
SET @CAMPOS_SQL = N''
declare abc cursor for 
	SELECT CAMPO = ' isnull(convert(varchar(1000),tab1.'+ COLUMN_NAME + '), ' + CHAR(39) + '-9*X|' + CHAR(39) + ') <> ' +
	               ' isnull(convert(varchar(1000),tab2.'+ COLUMN_NAME + '), ' + CHAR(39) + '-9*X|' + CHAR(39) + ') or '
      FROM INFORMATION_SCHEMA.COLUMNS
     where TABLE_NAME = @TAB1

	open abc 
		fetch next from abc into @CAMPO
		while @@FETCH_STATUS = 0
			BEGIN
				SET @CAMPOS_SQL = @CAMPOS_SQL + @CAMPO
			fetch next from abc into @CAMPO
			END
	close abc 
deallocate abc 
SET @CAMPOS_SQL = @CAMPOS_SQL + ')'
SET @CAMPOS_SQL = REPLACE(@CAMPOS_SQL, 'or )',')')


SET @SQL = N'' + @SQL1 + @CAMPOS_SQL + ' UNION ' + @SQL2 + @CAMPOS_SQL  

PRINT @SQL




--- EXEC SP_EXECUTESQL @SQL
