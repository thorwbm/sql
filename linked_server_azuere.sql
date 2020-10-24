/****** Object:  LinkedServer [EDUCAT-PROVA.DATABASE.WINDOWS.NET]    Script Date: 30/04/2020 08:33:44 ******/
EXEC master.dbo.sp_addlinkedserver @server = N'EDUCAT_PROVA', @srvproduct='',
@provider='sqlncli', -- using SQL Server native client
@datasrc='EDUCAT-PROVA.DATABASE.WINDOWS.NET',   -- add here your server name
@location='',
@provstr='',
@catalog='exams'

EXEC sp_addlinkedsrvlogin 
@rmtsrvname = 'EDUCAT_PROVA',
@useself = 'false',
@rmtuser = 'wemerson.maduro',
@rmtpassword = 'gbBIEiSyEaB*oHPXh'

EXEC sp_serveroption 'EDUCAT_PROVA', 'rpc out', true