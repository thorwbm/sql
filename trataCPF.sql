select cpf, SEM_PONTO =  replace(replace(cpf,'.',''),'-',''),
           COM_PONTO  =  case len(cpf) when 11 then left(cpf,3) + '.' + left(right(cpf,8),3) + '.' + left(right(cpf,5),3) + '-' + right(cpf,2)
			                                  else cpf end, 
		   COM_PONTO_STF = case len(cpf) when 11 then STUFF(STUFF(STUFF(CPF,10,0,'-'),7,0,'.'),4,0,'.') 
		                                         else cpf end, *

from ppessoa where cpf is not null