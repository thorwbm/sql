create view vw_ultima_avaliacao_mensagem as 
with cte_ultima_avaliacao_mensagem as (
select cod_men as mensagem_id, max(cod_ava) as ultima_avaliacao_id
  from avaliacao
  group by cod_men
) 
select ava.cod_ava as avaliacao_codigo, ava.cod_men as mensagem_codigo, ava.sta_ava as avaliacao_status, ava.dat_cad as avaliacao_data  
  from avaliacao ava join cte_ultima_avaliacao_mensagem ult on (ava.cod_men = ult.mensagem_id and 
                                                                ava.cod_ava = ult.ultima_avaliacao_id)