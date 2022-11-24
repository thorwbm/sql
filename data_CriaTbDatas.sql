/*****************************************************************************************************************
*                                               CRIA TABELA DATAS                                                *
*                                                                                                                *
* CRIA UMA TABELA COM O NOME TDATAS ONDE TEMOS EM CADA REGISTRO UM DIA DO ANO ESCOLHIDO APARTIR DA DE UMA DATA   *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/


declare @imes int, @idias int, @icont int, @iAno int, @sData varchar(10)
set @imes  = 1
set @icont = 1
set @iAno  = 2000

if exists(select name from sysobjects where name = 'tDatas') drop table tDatas 

if not exists(select name from sysobjects where name = 'tDatas') create table tDatas (Data DateTime)

while @imes <= 12 
begin
	set @iCont = 1

	while ISDATE(convert(varchar(4),@iAno) + '-' + convert(varchar(2),@iMes) + '-' + convert(varchar(2),@iCont))= 1
 	begin
		set @sData = convert(varchar(2),@iMes)+'/'+convert(varchar(2),@iCont)+'/'+convert(varchar(4),@iAno)
		insert tDatas(Data) values(convert(datetime,@sData))	
                set @iCont = @iCont+1	
	end

	set @iMes = @iMes+1
end

select * from tDatas



