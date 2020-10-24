/*****************************************************************************************************************
*                                         PRIMEIRO E ULTIMO DIA DO MES                                           *
*                                                                                                                *
* SELECT QUE RETORNA O PRIMEIRO E O ULTIMO DIA DO MES.                                                           *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/


-- Declarando as variaveis
declare @DiaCorrido int
declare @FimDoMes datetime
declare @InicioDoMes datetime
 
--Descobrindo quantos dias já foi percorrido
set @DiaCorrido = DATEPART(day,getdate())
 
-- Pegando o primeiro dia do mês corrente
set @InicioDoMes = DateAdd(day,(- @DiaCorrido) + 1 ,getdate())
 
-- Pegando o ultimo dia do mês corrente
set @FimDoMes =  DATEADD(DAY,-1,DATEADD(MONTH,1,@InicioDoMes))
 
--Apresentando o resultado
 
select @InicioDoMes -- 01/06/2011
select @FimDoMes    -- 30/06/2011
