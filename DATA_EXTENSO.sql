/*****************************************************************************************************************
*                                               DATA POR EXTENSO                                                 *
*                                                                                                                *
* COLOCA A DATA NO PADRAO DE CARTA COM OS MESES POR EXTENSO E INICIANDO COM O NOME DA CIDADE.                    *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/

select distinct 
  texto = substring(('Belo Horizonte, '+convert(varchar,datepart(dd,getdate()))+(case when datepart(mm,getdate())=1 then ' de Janeiro de'
                                                when datepart(mm,getdate())=2 then ' de Fevereiro de'
                                                when datepart(mm,getdate())=3 then ' de Março de'
                                                when datepart(mm,getdate())=4 then ' de Abril de'
                                                when datepart(mm,getdate())=5 then ' de Maio de'
                                                when datepart(mm,getdate())=6 then ' de Junho de'
                                                when datepart(mm,getdate())=7 then ' de Julho de'
                                                when datepart(mm,getdate())=8 then ' de Agosto de'
                                                when datepart(mm,getdate())=9 then ' de Setembro de'
                                                when datepart(mm,getdate())=10 then ' de Outubro de'
                                                when datepart(mm,getdate())=11 then ' de Novembro de'
                                                when datepart(mm,getdate())=12 then ' de Dezembro de'
                                                end)+' '+convert(varchar,datepart(yyyy,getdate())) ),1,80)
