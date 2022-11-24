create function FN_CHAVE_PRIMARIA(@tabela varchar(200)) 
returns varchar(200)
as 
	begin 
		declare @retorno varchar(200)

		SELECT @retorno = column_name
			FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
		   WHERE OBJECTPROPERTY(OBJECT_ID(constraint_name), 'IsPrimaryKey') = 1 and 
				 table_name = @tabela
		return @retorno
	end