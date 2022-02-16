--  #################################################################################

EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'ERP_HMG_BKP'
GO
USE [master]

GO
ALTER DATABASE [ERP_HMG_BKP] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
/****** Object:  Database [ERP_HMG_TCC]    Script Date: 24/11/2021 10:55:11 ******/
DROP DATABASE [ERP_HMG_BKP]
GO


--######################################################################################################################

IF ( OBJECT_ID('tempdb..#TMP') IS NOT NULL)  drop table #tmp
   

select 
task_id = 0, ask_type = cast(null as varchar(100)), 
database_name = cast(null as varchar(200)), 	
porcentagem = 0, duracao = 0,
lifecycle = cast(null as varchar(100)),
task_info = cast(null as varchar(max)),	
last_updated = getdate (),
created_at = getdate(),
S3_object_arn = cast(null as varchar(max)),	
overwrite_S3_backup_file = 0,	KMS_master_key_arn = cast(null as varchar(max)),	
filepath= cast(null as varchar(max)),	
overwrite_file = 0 into #tmp

delete #tmp

insert into #tmp 
exec  msdb.dbo.rds_task_status 


declare @bkp varchar(max) 
select @bkp = S3_object_arn from #tmp 
 where database_name = 'erp_pos_prd' and 
       created_at = (select max(created_at) from #tmp 
                      where database_name = 'erp_pos_prd'  )
       

-- declare @bkp = ''

EXEC msdb.dbo.rds_restore_database
@restore_db_name='ERP_HMG_BKP',
@s3_arn_to_restore_from= @bkp
--- 
 
exec msdb.dbo.rds_task_status 



-----------------------------------------------------------------------------------------------------

