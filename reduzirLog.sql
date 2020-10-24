/*****************************************************************************************************************
*                                                  REDUZIR LOG                                                   *
*                                                                                                                *
* COMANDO QUE REDUZ O TAMANHO DO LOG.                                                                            *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/


SELECT name ,size/128.0 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS int)/128.0 AS AvailableSpaceInMB
FROM sys.database_files;

go
-- DBCC SHRINKFILE (clpg_log, 7);
