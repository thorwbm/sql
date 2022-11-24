
  create procedure sp_enviar_email   
@destinatario varchar(500),   
@titulo       varchar(500),  
@corpo        varchar(max) as   
  
 execute msdb.dbo.sp_send_dbmail   
    @profile_name = 'Gmail_Feluma_ouvidoria',  
    @recipients = @destinatario,  
    @subject = @titulo,  
	@body_format = 'HTML',
    @body = @corpo  