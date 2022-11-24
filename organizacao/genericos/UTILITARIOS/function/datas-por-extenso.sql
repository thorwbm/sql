/*****************************************************************************************************************
*                                   CRIA FUNÇAO QUE RETORNA DATA POR EXTENSO                                     *
*                                                                                                                *
* CRIA UMA FUNCAO QUE RETORNA A DATA POR EXTENSO E O DIA DA SEMANA CONFORME PARAMETROS. OBSERVACAO: DEVE-SE      *
* SETAR A LINGUAGEM DO BANCO USANDO SET LANGUAGE                                                                 *
* -- set language brazilian                                                                                      *
* -- SET LANGUAGE us_english                                                                                     *
* -- COMO CHAMAR A FUNCAO ===>> SELECT dbo.dataExtenso(GETDATE(), 1)                                             *
* -- mostrar dia da semana diaSemana | 0 = nao e 1 = sim                                                         *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/

CREATE FUNCTION fn_data_Extenso(@data datetime, @diaSemana int) -- mostrar dia da semana diaSemana | 0 = nao e 1 = sim
RETURNS VARCHAR(500)
AS
BEGIN
	Declare @Retorno VarChar(500)
    declare @mes     varchar(255) 

 If @Data is Null
 Begin
 Set @Data = getdate()
 End

IF (@DIASEMANA = 1)
   BEGIN 
      SET @RETORNO = DATENAME(weekday, @Data) + ', ' + convert(varchar(02),DatePart(day,@Data)) + ' De ' + 
                     DateName(Month,@Data) + ' de ' + convert(varchar(04),DatePart(YEar,@Data)) + '.'
   END
ELSE 
   BEGIN 
      SET @RETORNO = convert(varchar(02),DatePart(day,@Data)) + ' De ' + DateName(Month,@Data) + ' de ' + 
                     convert(varchar(04),DatePart(YEar,@Data)) + '.'
   END
   
RETURN (@RETORNO)
END 



