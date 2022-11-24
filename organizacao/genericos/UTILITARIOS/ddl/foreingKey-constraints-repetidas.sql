with cte_duplicidade as (
	select catalogo = TABLE_CATALOG, tabela = TABLE_NAME, coluna = COLUMN_NAME, tipo = left(CONSTRAINT_NAME,2), const = CONSTRAINT_NAME
		from INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE
) 

select catalogo, tabela, coluna, tipo, count(const)
from cte_duplicidade
where tipo = 'fk'
group by catalogo, tabela, coluna, tipo
having count(const) > 1 
order by 5 desc 