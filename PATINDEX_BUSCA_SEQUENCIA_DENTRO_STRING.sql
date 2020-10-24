 
 declare @nome varchar(max) = 'dfadsfadsfrewr432242'
 select  right(@nome, len(@nome) - PATINDEX('%[A-z]%',@nome)+1)


