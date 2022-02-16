

CREATE FUNCTION [dbo].[fn_Possui_Caractere_Oculto](
    @String VARCHAR(MAX)
)
RETURNS BIT
AS
BEGIN
    RETURN (CASE WHEN PATINDEX('%[^ !"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ\^_`abcdefghijklmnopqrstuvwxyz|{}~���������������������������������������������������������������������������������������������������������������������������[[]%', REPLACE(@String, ']', '')) > 0 THEN 1 ELSE 0 END)
END
GO


