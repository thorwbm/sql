create function FN_WBM_DEFALUT_CPF (@cpf varchar(15)) 
RETURNS  VARCHAR(11)
BEGIN
  RETURN (replace(replace(@cpf,'.',''),'-','') COLLATE DATABASE_DEFAULT)
END



SELECT DBO.FN_WBM_DEFALUT_CPF('9238.79.006-00')--set @cpf = '923.879.006-00'