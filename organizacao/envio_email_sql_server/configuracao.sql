execute sp_configure 'Show Advanced Options', 1
reconfigure
execute sp_configure 'Database Mail XPs', 1
reconfigure


execute msdb.dbo.sysmail_add_account_sp
    -- Dados fíxos
    @mailserver_name = 'smtp.gmail.com', -- endereço do servidor de envio de e-mails
    @port = 587, -- porta de comunicação
    @enable_ssl = 1, -- habilitar SSL (criptografia durante o envio de dados)
    -- Dados da sua conta
    @account_name = 'Gmail_Feluma_ouvidoria', -- nome da conta dentro do SQL
    @display_name = 'Ouvidoria',   -- Nome que aparecerá como remetente do e-mail
    @email_address = 'sistemas@cienciasmedicasmg.edu.br',
    @username = 'sistemas@cienciasmedicasmg.edu.br',
    @password = '*************'


	execute msdb.dbo.sysmail_add_profile_sp
    @profile_name = 'Gmail_Feluma_ouvidoria',
    @description = 'Perfil para envio de notificações do SQL da feluma.'
-- Associar o perfil a conta
execute msdb.dbo.sysmail_add_profileaccount_sp
    @profile_name = 'Gmail_Feluma_ouvidoria',
    @account_name = 'Gmail_Feluma_ouvidoria',
    @sequence_number = 1
 


	execute msdb.dbo.sp_send_dbmail 
    @profile_name = 'Gmail_Feluma_ouvidoria',
    @recipients = 'henriquems@gmail.com',
    @subject = 'teste de envio de email',
	@body_format = 'HTML',
    @body = 'Cara de Cavalooooo Cara de Cavalooooo Cara de Cavalooooo Cara de Cavalooooo Cara de Cavalooooo Cara de Cavalooooo Cara de Cavalooooo Cara de Cavalooooo Cara de Cavalooooo Cara de Cavalooooo .'
 




