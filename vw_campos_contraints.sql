 create VIEW VW_WBM_CAMPOS AS   
with cte_constraints as (  
	select catalogo = TABLE_CATALOG, tabela = TABLE_NAME, coluna = COLUMN_NAME, tipo = left(CONSTRAINT_NAME,2), const = CONSTRAINT_NAME  
	  from INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE
),
     cte_campos as (
	select catalogo = col.TABLE_CATALOG, tabela = col.TABLE_NAME, coluna = col.COLUMN_NAME, tipo = 'COL', const = null 
	  from INFORMATION_SCHEMA.COLUMNS col 
	 where not exists (select 1 from cte_constraints cons 
	                    where cons.catalogo = col.TABLE_CATALOG and 
	                          cons.tabela   = col.TABLE_NAME    and
							  cons.coluna   = col.COLUMN_NAME)  
)
  
select CATALOGO, TABELA, COLUNA, TIPO, CONST  
  from cte_constraints  

UNION

select CATALOGO, TABELA, COLUNA, TIPO, CONST  
  from cte_campos  

