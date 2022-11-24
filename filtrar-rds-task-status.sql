drop table #tmp

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


select * from #tmp where database_name = 'erp_pos_prd' and cast (created_at as date) = '2021-10-27'