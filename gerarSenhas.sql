DECLARE @Random INT;
DECLARE @Upper INT;
DECLARE @Lower INT

---- This will create a random number between 1 and 999

SET @Lower = 1 ---- The lowest random number

SET @Upper = 999999 ---- The highest random number

SELECT @Random = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)

SELECT @Random




declare @cont int
set @cont = 600

while @cont <> 0 
	begin
		SELECT @Random = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)
		insert into senha values (1,@Random)
		set @cont = @cont -1 
	end


	select distinct senha from senha

	update senha set senha = right(('000000' + senha),6)