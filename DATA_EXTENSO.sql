/*****************************************************************************************************************
*                                               DATA POR EXTENSO                                                 *
*                                                                                                                *
* FUNCAO QUE RETORNA A DATA POR EXTENSO E CASO SEJA PASSADO A LOCADIDADE ELE RETORNA ESTA TAMBEM NA STRING NO    *
* PADRAO DE CARTA (LOCAL, DATA)                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/

create function fn_data_por_extenso_carta (@data date, @local varchar(250))
returns varchar(max) as 
    begin
    declare @retorno varchar(max)
    set @local = case when @local is null then '' else @local + ', ' end

    set @retorno = substring((@local +
          convert(varchar,datepart(dd,getdate()))+(case when datepart(mm,getdate())=1  then ' de Janeiro de'
                                                        when datepart(mm,getdate())=2  then ' de Fevereiro de'
                                                        when datepart(mm,getdate())=3  then ' de Março de'
                                                        when datepart(mm,getdate())=4  then ' de Abril de'
                                                        when datepart(mm,getdate())=5  then ' de Maio de'
                                                        when datepart(mm,getdate())=6  then ' de Junho de'
                                                        when datepart(mm,getdate())=7  then ' de Julho de'
                                                        when datepart(mm,getdate())=8  then ' de Agosto de'
                                                        when datepart(mm,getdate())=9  then ' de Setembro de'
                                                        when datepart(mm,getdate())=10 then ' de Outubro de'
                                                        when datepart(mm,getdate())=11 then ' de Novembro de'
                                                        when datepart(mm,getdate())=12 then ' de Dezembro de'
                                                end)+' '+convert(varchar,datepart(yyyy,getdate())) ),1,80)
          return @retorno
    end


