
create FUNCTION dbo.wbm_dataExtenso(@data datetime, @diaSemana int) -- mostrar dia da semana diaSemana | 0 = nao e 1 = sim
RETURNS VARCHAR(500)
AS
BEGIN
	Declare @Retorno VarChar(500)
    declare @mes     varchar(255)
    declare @diaSem  varchar(255)
	
 

 If @Data is Null
 Begin
 Set @Data = getdate()
 End
  
  set @mes = case when DatePart(Month,@Data) = 1 then 'Janeiro' 
                  when DatePart(Month,@Data) = 2 then 'Fevereiro' 
                  when DatePart(Month,@Data) = 3 then 'Março' 
                  when DatePart(Month,@Data) = 4 then 'Abril' 
                  when DatePart(Month,@Data) = 5 then 'Maio' 
                  when DatePart(Month,@Data) = 6 then 'Junho' 
                  when DatePart(Month,@Data) = 7 then 'Julho' 
                  when DatePart(Month,@Data) = 8 then 'Agosto' 
                  when DatePart(Month,@Data) = 9 then 'Setembro' 
                  when DatePart(Month,@Data) = 10 then 'Outubro' 
                  when DatePart(Month,@Data) = 11 then 'Novembro' 
                  when DatePart(Month,@Data) = 12 then 'Dezembro'  end


IF (@DIASEMANA = 1)
   BEGIN 
      set @diaSem = case when DATEpart(weekday,@data) = 1 then 'Domingo'
                         when DATEpart(weekday,@data) = 2 then 'Segunda'
                         when DATEpart(weekday,@data) = 3 then 'Terça'
                         when DATEpart(weekday,@data) = 4 then 'Quarta'
                         when DATEpart(weekday,@data) = 5 then 'Quinta'
                         when DATEpart(weekday,@data) = 6 then 'Sexta'
                         when DATEpart(weekday,@data) = 7 then 'Sábado' end
                         
      SET @RETORNO = @diaSem + ', ' + convert(varchar(02),DatePart(day,@Data)) + ' De ' + @mes + ' de ' + convert(varchar(04),DatePart(YEar,@Data)) + '.'
   END
ELSE 
   BEGIN 
      SET @RETORNO = convert(varchar(02),DatePart(day,@Data)) + ' de ' + @mes + ' de ' + convert(varchar(04),DatePart(YEar,@Data)) + '.'
   END

RETURN (@RETORNO)
END 




-- SELECT dbo.wbm_dataExtenso('2012-08-03', 0)


