   ALTER    view vw_tabela_coluna as             
  SELECT table_name as tabela, column_name as coluna, DATA_TYPE AS TIPO, DBO.FN_QTD_REGISTROS(TABLE_NAME) AS QTD_REGISTRO,   
         delimitador = case when numeric_precision is null then char(39) else '' end, obj.type_desc as TIPO_TABELA
    FROM INFORMATION_SCHEMA.COLUMNS  col left join sys.objects obj on (obj.name = col.table_name)        
  WHERE (TABLE_NAME NOT LIKE 'LOG_%' AND              
      TABLE_NAME NOT LIKE 'TMP%' AND             
      TABLE_NAME NOT LIKE 'BKP%' AND             
      TABLE_NAME NOT LIKE 'VW_%' )   

