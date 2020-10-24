/*****************************************************************************************************************
*                                               TRATANDO TELEFONE                                                *
*                                                                                                                *
* UPDATE QUE TRATA AS IMPERFEICOES NAS DIGITACOES DE TELEFONES, DEVE SER ADEQUADO A CADA CASO .                  *
*                                                                                                                *
* USADO: UNIVERSUS - SITEMA CADSOFT                                                                              *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/





-- update pessoa set
       fone1 = replace(replace(replace(replace(replace(replace(replace(fone1,'(',''),')',''),'-',''),'/',''),' ',''),'.',''),',',''),                        
       fone2 = replace(replace(replace(replace(replace(replace(replace(fone2,'(',''),')',''),'-',''),'/',''),' ',''),'.',''),',',''),                        
       fone3 = replace(replace(replace(replace(replace(replace(replace(fone3,'(',''),')',''),'-',''),'/',''),' ',''),'.',''),',','')                            
-- from pessoa pes join aluno alu on (pes.codpessoa = alu.codpessoa)
where ((fone1 like ('%(%') or
        fone1 like ('%)%') or
        fone1 like ('%-%') or
        fone1 like ('%/%') or
        fone1 like ('% %')) or 
       (fone2 like ('%(%') or
        fone2 like ('%)%') or
        fone2 like ('%-%') or
        fone2 like ('%/%') or
        fone2 like ('% %')) or
       (fone3 like ('%(%') or
        fone3 like ('%)%') or
        fone3 like ('%-%') or
        fone3 like ('%/%') or
        fone3 like ('% %'))) 