-- atualizacao de string pegando o final dela

update  anexo set des_ane = (case when charindex('\',reverse(des_ane)) > 0
                                  then 
                                       reverse(left(reverse(des_ane),charindex('\',reverse(des_ane))-1))
                                  else
                                       des_ane
                                   end )
             

             
             
             
             