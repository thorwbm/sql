--##############################################################################
-- criar view 
CREATE   VIEW VW_ESTRUTURA_TABELA AS   
SELECT TABLE_NAME AS TABELA,ORDINAL_POSITION AS POSICAO,  
       COLUMN_NAME +  ' ' + DATA_TYPE  +  ' ' +   
    CASE WHEN CHARACTER_MAXIMUM_LENGTH IS NULL THEN '' ELSE ' (' + CONVERT(VARCHAR(10), CHARACTER_MAXIMUM_LENGTH) + ')' END +   
    CASE WHEN IS_NULLABLE = 'NO' THEN ' not null' ELSE '' END AS CAMPOS  
FROM INFORMATION_SCHEMA.COLUMNS   

go

--##############################################################################
-- criar procedure 

create   PROCEDURE [dbo].[SP_CRIAR_ESTRUTURA_LOG] @TABELA VARCHAR(100) AS   
DECLARE @SQL_CRIAR_TABELA_LOG VARCHAR(MAX)  
DECLARE @SQL_LIMPAR_TRIGGER VARCHAR(MAX)  
DECLARE @SQL_CRIAR_TRIGGER_LOG VARCHAR(MAX)  
DECLARE @CAMPOS_TABELA VARCHAR(MAX)  
  
  
select @CAMPOS_TABELA =  
STUFF((SELECT ', '+isnull(CAMPOS, 'X')  
   FROM VW_ESTRUTURA_TABELA  
    WHERE TABELA = @TABELA  
 ORDER BY POSICAO  
    FOR XML PATH('')),1,1,'')   
  
  
SET @SQL_CRIAR_TABELA_LOG =   
N'IF (OBJECT_ID(' + CHAR(39) + 'log_' + @TABELA + CHAR(39) + ') IS  NULL)   
 BEGIN  
  CREATE  TABLE log_' + @TABELA + ' (  
   id_log INT IDENTITY(1, 1),  
   data_log DATETIME DEFAULT GETDATE(),  
   [Login] VARCHAR(100),  
   Hostname VARCHAR(100),  
   tipo_log char(1) not null,' +  
  
   -- Dados da tabela original    
   @CAMPOS_TABELA + ')  
 END'  
  
 EXEC(@SQL_CRIAR_TABELA_LOG)  
  
SET @SQL_LIMPAR_TRIGGER = N'IF ((SELECT COUNT(*) FROM sys.triggers WHERE name = ' + CHAR(39) + 'trgHistorico_' + @TABELA + CHAR(39) + ' AND parent_id = OBJECT_ID(' + CHAR(39) + @TABELA + CHAR(39) +')) > 0) DROP TRIGGER trgHistorico_' + @TABELA   
  
--PRINT '**************'  
 EXEC (@SQL_LIMPAR_TRIGGER)  
  
SET @SQL_CRIAR_TRIGGER_LOG =   
N' CREATE OR ALTER TRIGGER trgHistorico_' + @TABELA + ' ON  '+ @TABELA +  
' AFTER INSERT, UPDATE, DELETE AS  
BEGIN      
    SET NOCOUNT ON  
    DECLARE   
        @Login VARCHAR(100) = SYSTEM_USER,   
        @HostName VARCHAR(100) = HOST_NAME(),  
        @Data DATETIME = GETDATE()    
    IF (EXISTS(SELECT * FROM Inserted) AND EXISTS (SELECT * FROM Deleted))  
    BEGIN          
        INSERT INTO log_' + @TABELA + '  
        SELECT @Data, @Login, @HostName, ' + CHAR(39) + 'U' + CHAR(39) + ', *  
        FROM Inserted  
    END  
    ELSE BEGIN  
        IF (EXISTS(SELECT * FROM Inserted))  
        BEGIN  
            INSERT INTO log_' + @TABELA + '  
            SELECT @Data, @Login, @HostName, ' + CHAR(39) + 'I' + CHAR(39) + ', *  
            FROM Inserted  
        END  
        ELSE BEGIN  
            INSERT INTO log_' + @TABELA + '  
            SELECT @Data, @Login, @HostName,  ' + CHAR(39) + 'D' + CHAR(39) + ', *  
            FROM Deleted  
        END  
    END  
END'  
--PRINT '**************'  
 EXEC (@SQL_CRIAR_TRIGGER_LOG)
