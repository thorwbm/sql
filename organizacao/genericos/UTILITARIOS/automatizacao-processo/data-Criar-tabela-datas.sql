/*****************************************************************************************************************
*                                               CRIA TABELA DATAS                                                *
*                                                                                                                *
* CRIA UMA TABELA COM O NOME TDATAS ONDE TEMOS EM CADA REGISTRO UM DIA DO ANO ESCOLHIDO APARTIR DA DE UMA DATA   *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/


declare @imes int, @idias int, @icont int, @iAno int, @sData varchar(10), @tabela_nome varchar(50)
set @imes  = 1
set @icont = 1
set @iAno  = 2000
set @tabela_nome = 'tDatas'

if exists(select name from sysobjects where name = @tabela_nome) 
   exec('drop table ' + @tabela_nome) 

if not exists(select name from sysobjects where name = @tabela_nome) 
  exec('create table  ' + @tabela_nome + ' (Data DateTime)')

while @imes <= 12 
begin
	set @iCont = 1

create table  #temp (Data DateTime)

	while ISDATE(convert(varchar(4),@iAno) + '-' + convert(varchar(2),@iMes) + '-' + convert(varchar(2),@iCont))= 1
 	begin
		set @sData = convert(varchar(2),@iMes)+'/'+convert(varchar(2),@iCont)+'/'+convert(varchar(4),@iAno)
		insert #temp(Data) values(convert(datetime,@sData))	
                set @iCont = @iCont+1	
	end

	set @iMes = @iMes+1
end

exec('delete from ' +  @tabela_nome) 
exec('insert into ' + @tabela_nome + 'select * from #temp') 



