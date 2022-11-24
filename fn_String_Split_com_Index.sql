 create FUNCTION fn_String_Split_com_Index (   
	@String varchar(max),  
	@Separator varchar(10)) 
	
	RETURNS TABLE   
	AS  
	RETURN (  
		SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS id, value AS valor 
		  FROM STRING_SPLIT(@String, @Separator)  
	)  