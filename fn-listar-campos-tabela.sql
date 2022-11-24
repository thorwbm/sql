  
/**********************************************************************************************************************************    
*                                                   FN_RETORNA_COLUNAS_TABELA                                                     *    
*                                                                                                                                 *    
*  FUNCAO QUE RECEBE COMO PARAMETRO O NOME DE UMA TABELA E RETORNA TODOS OS SEUS CAMPOS SEPARADOS POR VIRGULA                     *    
*                                                                                                                                 *    
*                                                                                                                                 *    
* BANCO_SISTEMA : EDUCAT                                                                                                          *    
* CRIADO POR    : WEMERSON BITTORI MADURO                                                                         DATA:08/01/2020 *    
* ALTERADO POR  : WEMERSON BITTORI MADURO                                                                         DATA:08/01/2020 *    
**********************************************************************************************************************************/    
  
  
--  select dbo.fn_retorna_colunas_tabela('academico_aula',0)  
  
alter function [dbo].[fn_retorna_colunas_tabela] (@tabela varchar(100), @requerido int = 0)   
    returns varchar(1000)    
    as     
    begin  
        declare @cols nvarchar(max);  
        declare @permite_nulo varchar(10) = 'TODOS';

       SET @permite_nulo = CASE WHEN @REQUERIDO = 0 THEN 'TODOS' ELSE 'NO' END;

        with cte_temp as (    
                    SELECT distinct TABLE_NAME, COLUMN_NAME, ORDINAL_POSITION 
                      FROM INFORMATION_SCHEMA.COLUMNS   
                     WHERE TABLE_NAME = @tabela  and 
                           (IS_NULLABLE = @permite_nulo  OR @permite_nulo = 'TODOS')
        )    
        
        select @cols = stuff((  
            select  ', '  + quotename(COLUMN_NAME)  
              from cte_temp 
             order by ORDINAL_POSITION 
               for xml path('')  
         ), 1,1, ''
        )  
  
  return replace(replace(@cols,'[',''),']','')  
  
end   

