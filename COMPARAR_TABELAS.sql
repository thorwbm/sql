
ALTER PROCEDURE SP_COMPARAR_TABELAS  
   @TAB1 VARCHAR(100), @TAB2 VARCHAR(100) AS

DECLARE @SQL NVARCHAR(1000)


SET @SQL = 
N'SELECT * INTO #tmp_AUX FROM (SELECT *, TABELA = ' + CHAR(39) + @TAB1 + CHAR(39) + ' FROM (
SELECT *  FROM ' + @TAB1 + ' 
EXCEPT 
SELECT *  FROM ' + @TAB2 + '
) AS TAB
UNION 
SELECT *, TABELA = ' + CHAR(39) + @TAB2 + CHAR(39) + ' FROM (
SELECT *  FROM ' + @TAB2 + '
EXCEPT 
SELECT *  FROM ' + @TAB1 + '
 ) AS TAB1) AS TBX  ORDER BY 1'

 PRINT @SQL 

 --EXEC SP_EXECUTESQL @SQL



