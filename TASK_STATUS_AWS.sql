--#############################################################################################
/*DROP TABLE #TEMP
SELECT TASK_ID = 131, 
       TASK_TYPE = REPLICATE('#',1000),
	   BANCO =  REPLICATE('#',1000),
	   COMPLETO =  0,
	   DURACAO =  0,
	   STATUS_PROCESSO =  REPLICATE('#',1000),
	   IFORMACAO =  REPLICATE('#',8000),
	   ULTIMO_UPDATE = GETDATE(),
	   CRIADO_EM = GETDATE(),
	   ARUIVO_S3 =  REPLICATE('#',1000),
	   OVERWRITE_S3 = 0,
	   STATUS_PROCESSO2 = REPLICATE('#',1000),
	   CAMINHO_ARQUIVO =  REPLICATE('#',1000),
	   SUBSTITUIDO = 0 INTO #TEMP

	   DELETE FROM #TEMP

INSERT INTO #TEMP
EXEC msdb.dbo.rds_task_status

 SELECT * FROM #TEMP WHERE TASK_TYPE = 'RESTORE_DB'
                CONVERT(VARCHAR(10), DATEPART(HOUR,@DATA)) + '_00' */

--#############################################################################################
