SELECT COUNT(1) FROM  tmp_aluno_gabarito WHERE gabarito_aluno IS  NULL



SELECT count(1) FROM  tmp_aluno_gabarito WHERE gabarito_aluno IS not NULL

SELECT * FROM  tmp_aluno_gabarito WHERE gabarito_aluno IS not NULL



select  dbo.FN_GABARITO_ALUNO(3131683)
select  dbo.FN_GABARITO_ALUNO_JN(3131683)


select replace(
STUFF((SELECT ','+isnull(alt.letter, 'X')
   FROM application_answer ans with(nolock)  left join item_alternative alt with(nolock)  on (alt.id = ans.alternative_id)  
    WHERE application_id =   2801771
	ORDER BY ans.position
    FOR XML PATH('')),1,1,'') , ',', '')
 
   
CREATE FUNCTION FN_GABARITO_ALUNO_JN (@application_id int)  
RETURNS VARCHAR(1000)  
BEGIN  
 declare @linha varchar(250) =''  

 select @linha = replace(
STUFF((SELECT ','+isnull(alt.letter, 'X')
   FROM application_answer ans with(nolock)  left join item_alternative alt with(nolock)  on (alt.id = ans.alternative_id)  
    WHERE application_id =   @application_id
	ORDER BY ans.position
    FOR XML PATH('')),1,1,'') , ',', '')

 RETURN @linha  
  
end