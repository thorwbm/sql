

CREATE FUNCTION [dbo].[fn_remover_acentuacao](
    @String VARCHAR(MAX)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
    
    /****************************************************************************************************************/
    /** RETIRA ACENTUA��O DAS VOGAIS **/
    /****************************************************************************************************************/
    SET @String = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@String,'�','a'),'�','a'),'�','a'),'�','a'),'�','a')
    SET @String = REPLACE(REPLACE(REPLACE(REPLACE(@String,'�','e'),'�','e'),'�','e'),'�','e')
    SET @String = REPLACE(REPLACE(REPLACE(REPLACE(@String,'�','i'),'�','i'),'�','i'),'�','i')
    SET @String = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@String,'�','o'),'�','o'),'�','o'),'�','o'),'�','o')
    SET @String = REPLACE(REPLACE(REPLACE(REPLACE(@String,'�','u'),'�','u'),'�','u'),'�','u')
    
    /****************************************************************************************************************/
    /** RETIRA ACENTUA��O DAS CONSOANTES **/
    /****************************************************************************************************************/
    SET @String = REPLACE(@String,'�','y')
    SET @String = REPLACE(@String,'�','n')
    SET @String = REPLACE(@String,'�','c')
    
    RETURN UPPER(@String)

END
GO


