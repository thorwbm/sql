/**********************************************************************************************************************************
*                                                     SP_RETORNA_CAMPO_PIVOT                                                      *
*                                                                                                                                 *
*  PROCEDURE QUE RECEBE OS PARAMETROS [CAMPO],[TABELA] E RETORNA [RETORNO] (CAMPOS PARA O PIVOT)                                  *
*                                                                                                                                 *
*                                                                                                                                 *
* BANCO_SISTEMA : GENERICO                                                                                                        *
* CRIADO POR    : WEMERSON BITTORI MADURO                                                                         DATA:04/03/2020 *
* ALTERADO POR  : WEMERSON BITTORI MADURO                                                                         DATA:04/03/2020 *
**********************************************************************************************************************************/
ALTER    procedure [dbo].[sp_retorna_campo_pivot] @campo varchar(100), @tabela varchar(100), @retorno varchar(1000) output as 
declare @sql varchar(1000)    
declare @retorno_tab table (campos varchar(800))    
   
  set @sql = N' select stuff((    
                   select distinct ' + char(39)+ ',' +char(39) + ' + quotename('+ @campo + ')     
        from ' + @tabela + ' for xml path(' + char(39) + char(39) + ')), 1, 1, '+ char(39) + char(39) + ')'    
 insert into @retorno_tab    
exec (@sql)    
select @retorno = campos from  @retorno_tab 