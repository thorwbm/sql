declare @texto varchar(max), @aux varchar(max), @cont int
set @cont = 1
set @texto = '1,2,3,5,8,7,9'
if(right(@texto,1) <> ',')
	begin
		set @texto = @texto + ','
	end

select lista = 0 into #tmp
delete from #tmp 

while (len(@texto) > 0)
	begin
		set @aux = left(@texto,charindex(',',@texto) - 1)
		insert into #tmp values(cast(@aux as int))
		set @texto = right(@texto,len(@texto) - charindex(',',@texto))
		print right(@texto,len(@texto) - charindex(',',@texto))
		set @cont = @cont + 1

	end
	*nao*
select * from #tmp
--drop table #tmp
/****************************************************************************/
declare @texto varchar(max), @aux varchar(max), @cont int
set @cont = 1
set @texto = 'sim, nao, talvez'
if(right(@texto,1) <> ',')
	begin
		set @texto = @texto + ','
	end

select lista = replicate('X',255) into #tmp
delete from #tmp 

while (len(@texto) > 0)
	begin
		set @aux = left(@texto,charindex(',',@texto) - 1)
		insert into #tmp values(rtrim(ltrim(@aux)))
		set @texto = right(@texto,len(@texto) - charindex(',',@texto))
		print right(@texto,len(@texto) - charindex(',',@texto))
		set @cont = @cont + 1

	end

select * from #tmp