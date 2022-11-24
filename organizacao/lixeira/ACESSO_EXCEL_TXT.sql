/* CRIANDO UM SERVIDOR LINKADO PARA */
/* ACESSAR OS DADOS DAS PLANILHAS DO ARQUIVO */
EXEC sp_addlinkedserver "FonteExcel",
"Jet 4.0",
"Microsoft.Jet.OLEDB.4.0",
"c:\dados\dadosExcel.xls",
NULL,
"Excel 5.0"
GO

/* CRIANDO UM SERVIDOR LINKADO PARA */
/* ACESSAR OS DADOS DE ARQUIVOS TEXTO */
EXEC sp_addlinkedserver FonteTxt, "Jet 4.0", 
"Microsoft.Jet.OLEDB.4.0",
"c:\Dados",
NULL,
"Text"
GO

/* TESTAR A CONEXAO E LISTAR AS TABELAS (PLANILHAS) DISPONIVEIS */
EXEC sp_tables_ex ExcelServer2


/* REMOVER O SERVIDOR LINCADO */
EXEC sp_dropserver ExcelServer2


select * from sys.servers

select * from FonteExcel...tabela1

sp_configure 'show advanced options',1
GO
reconfigure
GO
sp_configure 'Ole Automation Procedures',1
GO
reconfigure
GO
sp_configure 'show advanced options',0
GO
reconfigure

EXEC sp_addlinkedserver
    @server = 'ExcelServer2',
    @srvproduct = 'Excel', 
    @provider = 'Microsoft.ACE.OLEDB.12.0',
    @datasrc = 'C:\dados\teste.xlsx',
    @provstr = 'Excel 12.0;IMEX=1;HDR=YES;'
    
    
    EXEC sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'AllowInProcess', 1
GO
EXEC sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'DynamicParameters', 1
GO