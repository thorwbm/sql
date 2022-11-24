
 create view vw_adm_informacao_tabela as 
 select TABLE_CATALOG as banco_nome, table_name as tabela_nome, column_name as coluna_nome, IS_NULLABLE as permite_nulo, data_type as tipo 
        , character_maximum_length as tamanho 
 from INFORMATION_SCHEMA.COLUMNS