/*****************************************************************************************************************
*                                           FUNCAO IDADE POR EXTENSO                                             *
*                                                                                                                *
* FUNCAO QUE RECEBE UMA DATA, CALCULA E RETORNA A IDADE (ANO MES E DIA POR EXTENSO).                             *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:23/09/2015 *
******************************************************************************************************************/
ALTER FUNCTION [dbo].[CalcularIdade]   
( @DataNascimento DateTime)  
RETURNS varchar(100)   
AS  
BEGIN  
    DECLARE @ano int;  
    declare @mes int;  
    declare @dia int;  
    DECLARE @DataAtual datetime;  
    DECLARE @Dataaux datetime;  
    declare @resultado varchar(100);  
    declare @descricao varchar(50);  
    SELECT @DataAtual = GETDATE();  
  
 -- **** calcula os anos vividos ***********************  
   
    SELECT @ano = datediff(yy, @DataNascimento, @DataAtual) -  
        (case WHEN (datepart(m, @DataNascimento) > datepart(m, @DataAtual)) OR  
                   (datepart(m, @DataNascimento) = datepart(m, @DataAtual) AND  
                    datepart(d, @DataNascimento) > datepart(d, @DataAtual))  
            THEN 1  
            ELSE 0  
         end)  
      
    -- **** define a escrita correta plural ou singular   
    set @descricao = ' ano '  
    if(@ano <> 1)  
  begin  
   set @descricao = ' anos '   
  end   
          
    set @resultado = convert(varchar(10),@ano) + @descricao  
      
      
    -- **** calcula os meses  ********************************************  
      
    set @mes = case when month(@datanascimento) < month(@dataatual) then  month(@dataatual) - month(@datanascimento)   
                    when month(@datanascimento) = month(@dataatual) then case when day(@datanascimento) < day(@dataatual) then 11 else 0 end   
                                                                     else 12 - (month(@datanascimento) - month(@dataatual)) end   
      
    -- **** define a escrita correta plural ou singular   
    set @descricao = ' mês '  
    if(@mes <> 1)  
  begin  
   set @descricao = ' meses '   
  end   
      
    set @resultado = @resultado + CONVERT(varchar(10),@mes) + @descricao  
      
    -- **** calcula dias ******************************************  
      
    if (month(@datanascimento) <= month(@dataatual))  
  begin  
   if (day(@datanascimento) < day(@dataatual))  
    begin  
     set @dia =  day(@dataatual)- day(@datanascimento)   
    end  
   else if (day(@datanascimento) = day(@dataatual))  
     begin  
      set @dia = 0  
     end  
    else  
     begin  
      set @dataaux = dateadd(month,-1, getdate())  
      set @dataaux = convert(datetime,(convert(varchar(10),year(@dataaux))+ '-' + convert(varchar(10),month(@dataaux))+ '-' + convert(varchar(10),day(@DataNascimento))))  
      set @dia = datediff(day,@dataaux,getdate())  
     end  
  end  
 else if (month(@datanascimento) > month(@dataatual))  
   begin  
    set @dataaux = dateadd(month,-1, @DataNascimento)  
    set @dataaux = convert(datetime,(convert(varchar(10),year(getdate()))+ '-' + convert(varchar(10),month(getdate()))+ '-' + convert(varchar(10),day(@DataNascimento))))  
    set @dia = datediff(day,@dataaux,getdate())   
   end   
     
    -- **** define a escrita correta plural ou singular   
    set @descricao = ' dia '  
    if(@dia <> 1)  
  begin  
   set @descricao = ' dias '   
  end   
    set @resultado = @resultado + CONVERT(varchar(10),@dia) + @descricao  
    RETURN @Resultado  
END  
  
  