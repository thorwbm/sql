select * from SYS.sysprocesses where hostname like '%fel_inf%' --nt_username = 'carolina.giulianetti' 

order by 13 desc

SELECT  ec.client_net_address, es.[program_name],  es.[host_name], es.login_name
FROM sys.dm_exec_sessions AS es INNER JOIN sys.dm_exec_connections AS ec  ON es.session_id = ec.session_id
ORDER BY ec.client_net_address,  es.[program_name];