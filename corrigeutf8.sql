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
	set   @value = replace(@value, '\u00e1', '�')
	set   @value = replace(@value, '\u00e0', '�')
	set   @value = replace(@value, '\u00e2', '�')
    set   @value = replace(@value, '\u00e3', '�')
	set   @value = replace(@value, '\u00e4', '�') 
	set   @value = replace(@value, '\u00c1', '�')
	set   @value = replace(@value, '\u00c0', '�')
	set   @value = replace(@value, '\u00c2', '�')
	set   @value = replace(@value, '\u00c3', '�')
	set   @value = replace(@value, '\u00c4', '�')
	set   @value = replace(@value, '\u00e9', '�')
	set   @value = replace(@value, '\u00e8', '�')
	set   @value = replace(@value, '\u00ea', '�')
	set   @value = replace(@value, '\u00ea', '�')
	set   @value = replace(@value, '\u00c9', '�')
	set   @value = replace(@value, '\u00c8', '�')
	set   @value = replace(@value, '\u00ca', '�')
	set   @value = replace(@value, '\u00cb', '�')
	set   @value = replace(@value, '\u00ed', '�')
	set   @value = replace(@value, '\u00ec', '�')
	set   @value = replace(@value, '\u00ee', '�')
	set   @value = replace(@value, '\u00ef', '�')
	set   @value = replace(@value, '\u00cd', '�')
	set   @value = replace(@value, '\u00cc', '�')
	set   @value = replace(@value, '\u00ce', '�')
	set   @value = replace(@value, '\u00cf', '�')
	set   @value = replace(@value, '\u00f3', '�')
	set   @value = replace(@value, '\u00f2', '�')
	set   @value = replace(@value, '\u00f4', '�')
	set   @value = replace(@value, '\u00f5', '�')
	set   @value = replace(@value, '\u00f6', '�')
	set   @value = replace(@value, '\u00d3', '�')
	set   @value = replace(@value, '\u00d2', '�')
	set   @value = replace(@value, '\u00d4', '�')
	set   @value = replace(@value, '\u00d5', '�')
	set   @value = replace(@value, '\u00d6', '�')
	set   @value = replace(@value, '\u00fa', '�')
	set   @value = replace(@value, '\u00f9', '�')
	set   @value = replace(@value, '\u00fb', '�')
	set   @value = replace(@value, '\u00fc', '�')
	set   @value = replace(@value, '\u00da', '�')
	set   @value = replace(@value, '\u00d9', '�')
	set   @value = replace(@value, '\u00db', '�')
	set   @value = replace(@value, '\u00e7', '�')
	set   @value = replace(@value, '\u00c7', '�')
	set   @value = replace(@value, '\u00f1', '�')
	set   @value = replace(@value, '\u00d1', '�')
	set   @value = replace(@value, '\u0026', '&')
	set   @value = replace(@value, '\u0027', '\')
	
	set @result = @value

    Return  @result;
END
GO
