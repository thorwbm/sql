
--select * into maintenance_tables from INFORMATION_SCHEMA.TABLES
--SELECT table_name, *  FROM INFORMATION_SCHEMA.TABLES WHERE table_type = 'BASE TABLE' and table_name not in ('sysdiagrams', 'health_check_db_testmodel')


DECLARE @Database VARCHAR(255)   
DECLARE @Table VARCHAR(255)  
DECLARE @cmd NVARCHAR(500)  
DECLARE @fillfactor INT
 

SET @fillfactor = 80 

DECLARE TableCursor CURSOR FOR 

SELECT table_name  as tableName FROM INFORMATION_SCHEMA.TABLES WHERE table_type = 'BASE TABLE' and table_name not in ('sysdiagrams', 'health_check_db_testmodel')

   OPEN TableCursor   

   FETCH NEXT FROM TableCursor INTO @Table   
   WHILE @@FETCH_STATUS = 0   
   BEGIN   

        BEGIN
           -- SQL 2005 or higher command 
           SET @cmd = 'ALTER INDEX ALL ON ' + @Table + ' REBUILD WITH (FILLFACTOR = ' + CONVERT(VARCHAR(3),@fillfactor) + ')' 
           EXEC (@cmd) 
		   print (@cmd)

		   SET @cmd = 'UPDATE STATISTICS  ' + @Table 
           EXEC (@cmd) 
		   print (@cmd)

       END
          FETCH NEXT FROM TableCursor INTO @Table   
   END   

   CLOSE TableCursor   
   DEALLOCATE TableCursor  

 