create function fn_gerar_login(@nome varchar(200))  
returns varchar(200) 
as 
    begin 
        declare @primeiro_nome varchar(50) = substring(@nome,1,CHARINDEX(' ',@NOME)-1)
        declare @ultimo_nome varchar(50)   = reverse(substring(reverse(@nome),1,CHARINDEX(' ',reverse(@NOME))-1))

        declare @resultado varchar(200)
        declare @aux varchar(50)      

        set @resultado = @primeiro_nome
        declare CUR_ cursor for 
	        select value as nomes from STRING_SPLIT ( @nome , ' ' )  
        where value not in ('da', 'de', 'di', 'do', 'du','das', 'des', 'dis', 'dos', 'dus', @primeiro_nome, @ultimo_nome)  
	        open CUR_ 
		        fetch next from CUR_ into @aux
		        while @@FETCH_STATUS = 0
			        BEGIN
				
                        set @resultado = @resultado + left(@aux,1) 

			        fetch next from CUR_ into @aux
			        END
	        close CUR_ 
        deallocate CUR_ 

        set @resultado = @resultado + @ultimo_nome
        return(@resultado)
    end




 -- exemplo    select dbo.fn_gerar_login('wemerson bittori maduro')
 select lower(dbo.fn_gerar_login('wemerson bittori maçáduro')) collate sql_latin1_general_cp1251_ci_as