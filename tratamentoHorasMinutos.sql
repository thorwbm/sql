/*****************************************************************************************************************
*                                             TRATANDO HORA MINUTOS                                              *
*                                                                                                                *
* SELECTS PARA SEREM UTILIZADOS PARA TRATAR HORA E MINUTOS COM DIFERENTES FORMAS DE RETORNO.                     *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/

declare @horaChar varchar(10), @hora int, @minuto int, @horaInt int
set @horaChar = '079:10'
set @horaInt = 6
-- **** separa hora e minutos em um padrao de horas 00:00
select LEFT(@horachar,CHARINDEX(':',@horachar)-1), right(@horachar,len(@horachar)-CHARINDEX(':',@horachar))

-- **** converte pra minutos
select convert(int,LEFT(@horachar,CHARINDEX(':',@horachar)-1))*60 + convert(int,right(@horachar,len(@horachar)-CHARINDEX(':',@horachar)))

-- **** converte em string (hh:mm)
select right('000' + convert(varchar(10),@horaInt/60),3) +':' +RIGHT('00' + CONVERT(varchar(10),convert(int,round((@horaInt/60.0 - @horaInt/60) * 60,1))),2)
-- ****** TESTE LOUCO 
SELECT right('000' + convert(varchar(10),CAST(@horaInt/60 AS INT)),3) +':' +RIGHT('00' + CONVERT(varchar(10),convert(int,round((@horaInt/60.0 - CAST(@horaInt/60 AS INT)) * 60,1))),2)

SELECT     DATENAME (YEAR, GETDATE()) AS  ANO,
            DATENAME (MONTH, GETDATE()) AS  MES,
            DATENAME (DAY, GETDATE()) AS  DIA,
            DATENAME (DAYOFYEAR, GETDATE()) AS  DIA_ANO,
            DATENAME (WEEK, GETDATE()) AS  SEMANA,
            DATENAME (HOUR, GETDATE()) AS  HORA,
            DATENAME (MINUTE, GETDATE()) AS MINUTO

select GETDATE()

--****** converter horas decimais para horas minutos 

create function dbo.fn_formatar_decimal_hora_min (@horasDec float)
returns varchar(50) as 
begin
    declare  @retorno varchar(50) 
      set @retorno = right('00'+cast(cast(@horasDec as int) as varchar(4)),2) + ':' +  right('00'+cast(cast(round(@horasDec * 60,1)as int) % 60 as varchar(4)),2)

    return @retorno

end