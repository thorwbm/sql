-- atualizado 22/12/20

CREATE or alter  FUNCTION [dbo].[udfRetornaComandoSQL](@spid AS INT)

RETURNS VARCHAR(8000)

AS

BEGIN

DECLARE @comandoSQL VARCHAR(8000)

SET @comandoSQL = (SELECT CAST([TEXT] AS VARCHAR(8000))

FROM ::fn_get_sql((SELECT [sql_handle] FROM sysprocesses where spid = @spid)))

RETURN @comandoSQL

END
GO
