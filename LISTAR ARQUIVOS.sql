EXEC sp_configure 'show advanced options', 1
GO
RECONFIGURE
GO
EXEC sp_configure 'xp_cmdshell', 1
GO
RECONFIGURE
GO


-- =============================================
-- Author: Ruberlei Cardoso Bento
-- Create date: 13/07/2016
-- Description: List files in directory
-- =============================================
CREATE OR ALTER PROCEDURE SP_LIST_FILES @V_DIR VARCHAR(100), @V_FILES VARCHAR(50)
AS
BEGIN
 
CREATE TABLE #TMP_FILES
(
ID INT IDENTITY(1,1),
FILE_NAME VARCHAR(500)
);
 
SET @V_DIR = 'DIR ' + @V_DIR + ' ' + @V_FILES
 
 PRINT @V_DIR
INSERT #TMP_FILES EXEC XP_CMDSHELL @V_DIR
 
SELECT ID, FILE_NAME
FROM #TMP_FILES
WHERE FILE_NAME IS NOT NULL
 
END

exec sp_list_files 'C:\temp', '*.sql'

EXEC XP_CMDSHELL 'DIR C:\TEMP *.SQL'
