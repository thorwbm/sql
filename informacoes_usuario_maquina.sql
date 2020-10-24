
		select SYSTEM_USER,  HOST_NAME(), GETDATE(),  CONNECTIONPROPERTY('client_net_address') AS client_net_address -- IP do utilizado