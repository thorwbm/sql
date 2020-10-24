if OBJECT_ID('TempDB.dbo.#temp') IS NOT NULL
	begin 
		drop table #temp
	end
select arquivoExiste = 9, eUmDiretorio = 9,existePai = 9 into #temp 
delete from #temp

insert into #temp
exec master..xp_fileexist 'k:\Diario\avisos\'

if (exists(select * from #temp where eumdiretorio = 0))
	begin
		exec xp_create_subdir  'k:\Diario\avisos\'
	end
else 
	begin
		print 'existe um diretorio'
	end	

