CREATE OR ALTER VIEW VW_CONSTRAINT_DETALHE AS 
		SELECT FK.NAME AS CONSTRAINT_NOME, fk_tab.NAME AS TABELA_FK, 		Pk_tab.NAME AS TABELA_PK, FK_COL.NAME AS COLUNA_FK, PK_COL.NAME AS COLUNA_PK  
    from sys.foreign_keys fk  inner join sys.tables              fk_tab  on (fk_tab.object_id = fk.parent_object_id)
	                          inner join sys.tables              Pk_tab  on (Pk_tab.object_id = fk.referenced_object_id)
                              inner join sys.foreign_key_columns fk_cols on (fk_cols.constraint_object_id = fk.object_id)
							  INNER JOIN sys.columns             FK_COL  ON (FK_COL.object_id = FK.parent_object_id AND 
							                                                 FK_COL.column_id = FK_COLS.parent_column_id)
							  INNER JOIN sys.columns             PK_COL  ON (PK_COL.object_id = fk_cols.referenced_object_id  AND 
							                                                 PK_COL.column_id = FK_COLS.referenced_column_id)

