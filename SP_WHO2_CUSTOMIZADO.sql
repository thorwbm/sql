IF (OBJECT_ID('TempDB.dbo.#tmp_sp_who2') IS NOT NULL)  begin drop TABLE #tmp_sp_who2  end; 

CREATE TABLE #tmp_sp_who2 (	SPID char(5),Status nvarchar(30),Login nvarchar(46),HostName nvarchar(56),
	BlkBy varchar(5),DBName nvarchar(16),Command nvarchar(25),CPUTime varchar(6),DiskIO varchar(8),
	LastBatch varchar(14),ProgramName nvarchar(66),	SPID_ char(5),	REQUESTID char(5));

	insert into #tmp_sp_who2  exec sp_who2;

-- ##### ORDENADO POR TEMPO DE CPU
select * from #tmp_sp_who2 order by CPUTime;

-- ##### SE EXISTIR BLOQUEIO
	select ori.* from #tmp_sp_who2 ori join #tmp_sp_who2 blk on (ori.SPID = blk.BlkBy) order by ori.BlkBy 