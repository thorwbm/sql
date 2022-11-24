/*****************************************************************************************************************
*                                            FN_CORRIGIR_UTF8_STRING                                             *
*                                                                                                                *
*  FUNCAO QUE CORRIGEM CARACTERES QUE FORAM TROCADOS POR CONTA DO UTF-8                                          *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA : GENERICO                                                                                       *
* CRIADO POR    : WEMERSON BITTORI MADURO                                                        DATA:08/12/2021 *
* ALTERADO POR  : WEMERSON BITTORI MADURO                                                        DATA:08/12/2021 *
******************************************************************************************************************/

CREATE FUNCTION fn_corrigir_UTF8_String (@value varchar(max))
RETURNS nvarchar(max)
AS
BEGIN
    DECLARE @result nvarchar(max);
	set   @value = replace(@value, '\u00e1', 'á')
	set   @value = replace(@value, '\u00e0', 'à')
	set   @value = replace(@value, '\u00e2', 'â')
    set   @value = replace(@value, '\u00e3', 'ã')
	set   @value = replace(@value, '\u00e4', 'ä') 
	set   @value = replace(@value, '\u00c1', 'Á')
	set   @value = replace(@value, '\u00c0', 'À')
	set   @value = replace(@value, '\u00c2', 'Â')
	set   @value = replace(@value, '\u00c3', 'Ã')
	set   @value = replace(@value, '\u00c4', 'Ä')
	set   @value = replace(@value, '\u00e9', 'é')
	set   @value = replace(@value, '\u00e8', 'è')
	set   @value = replace(@value, '\u00ea', 'ê')
	set   @value = replace(@value, '\u00ea', 'ê')
	set   @value = replace(@value, '\u00c9', 'È')
	set   @value = replace(@value, '\u00c8', 'É')
	set   @value = replace(@value, '\u00ca', 'Ê')
	set   @value = replace(@value, '\u00cb', 'Ë')
	set   @value = replace(@value, '\u00ed', 'í')
	set   @value = replace(@value, '\u00ec', 'ì')
	set   @value = replace(@value, '\u00ee', 'î')
	set   @value = replace(@value, '\u00ef', 'ï')
	set   @value = replace(@value, '\u00cd', 'Í')
	set   @value = replace(@value, '\u00cc', 'Ì')
	set   @value = replace(@value, '\u00ce', 'Î')
	set   @value = replace(@value, '\u00cf', 'Ï')
	set   @value = replace(@value, '\u00f3', 'ó')
	set   @value = replace(@value, '\u00f2', 'ò')
	set   @value = replace(@value, '\u00f4', 'ô')
	set   @value = replace(@value, '\u00f5', 'õ')
	set   @value = replace(@value, '\u00f6', 'ö')
	set   @value = replace(@value, '\u00d3', 'Ó')
	set   @value = replace(@value, '\u00d2', 'Ò')
	set   @value = replace(@value, '\u00d4', 'Ô')
	set   @value = replace(@value, '\u00d5', 'Õ')
	set   @value = replace(@value, '\u00d6', 'Ö')
	set   @value = replace(@value, '\u00fa', 'ú')
	set   @value = replace(@value, '\u00f9', 'ù')
	set   @value = replace(@value, '\u00fb', 'û')
	set   @value = replace(@value, '\u00fc', 'ü')
	set   @value = replace(@value, '\u00da', 'Ú')
	set   @value = replace(@value, '\u00d9', 'Ù')
	set   @value = replace(@value, '\u00db', 'Û')
	set   @value = replace(@value, '\u00e7', 'ç')
	set   @value = replace(@value, '\u00c7', 'Ç')
	set   @value = replace(@value, '\u00f1', 'ñ')
	set   @value = replace(@value, '\u00d1', 'Ñ')
	set   @value = replace(@value, '\u0026', '&')
	set   @value = replace(@value, '\u0027', '\')
	
	set @result = @value

    Return  @result;
END
GO
