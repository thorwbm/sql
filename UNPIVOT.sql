--**************************************************************************************************
-- base para testar o UNPIVOT
--**************************************************************************************************
declare @cont int
set @cont = 1

while(@cont < 10)
	begin
		insert into tmpBase
		select nome = 'teste' + convert(varchar(4),@cont), codigo = @cont, ex1 = 123 * @cont, ex2 = 324 * @cont, ex3 = 777 * @cont, ex4= 888 * @cont, ex5 = 111 * @cont 
		set @cont = @cont + 1
	end
--*********************************************************************************


--**************************************************************************************************
-- UNPIVOT BASICO
--**************************************************************************************************
select nome, exemplar, codExemplar
from 
	(select nome, ex1, ex2, ex3, ex4, ex5
	   from tmpBase) p
 unpivot
	(codExemplar for exemplar in (ex1, ex2, ex3, ex4, ex5)) as tab