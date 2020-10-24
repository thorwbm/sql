CREATE TABLE [dbo].[CotacoesPorDataMoeda](
    [DataCotacao] [date] NOT NULL,
    [CodMoeda] [varchar](3) NOT NULL,
    [ValorCotacao] [numeric](18, 4) NOT NULL,
    PRIMARY KEY ([DataCotacao], [CodMoeda])
)
GO
 
INSERT INTO dbo.CotacoesPorDataMoeda(DataCotacao, CodMoeda, ValorCotacao)
VALUES('2014-04-17', 'USD', 2.2357)
 
INSERT INTO dbo.CotacoesPorDataMoeda(DataCotacao, CodMoeda, ValorCotacao)
VALUES('2014-04-16', 'USD', 2.2418)
 
INSERT INTO dbo.CotacoesPorDataMoeda(DataCotacao, CodMoeda, ValorCotacao)
VALUES('2014-04-15', 'USD', 2.2385)
 
INSERT INTO dbo.CotacoesPorDataMoeda(DataCotacao, CodMoeda, ValorCotacao)
VALUES('2014-04-14', 'USD', 2.2147)
 
INSERT INTO dbo.CotacoesPorDataMoeda(DataCotacao, CodMoeda, ValorCotacao)
VALUES('2014-04-17', 'EUR', 3.0927)
 
INSERT INTO dbo.CotacoesPorDataMoeda(DataCotacao, CodMoeda, ValorCotacao)
VALUES('2014-04-16', 'EUR', 3.1012)
 
INSERT INTO dbo.CotacoesPorDataMoeda(DataCotacao, CodMoeda, ValorCotacao)
VALUES('2014-04-15', 'EUR', 3.0874)
 
INSERT INTO dbo.CotacoesPorDataMoeda(DataCotacao, CodMoeda, ValorCotacao)
VALUES('2014-04-14', 'EUR', 3.0616)
 
INSERT INTO dbo.CotacoesPorDataMoeda(DataCotacao, CodMoeda, ValorCotacao)
VALUES('2014-04-17', 'LIB', 3.7593)
 
INSERT INTO dbo.CotacoesPorDataMoeda(DataCotacao, CodMoeda, ValorCotacao)
VALUES('2014-04-16', 'LIB', 3.7708)
 
INSERT INTO dbo.CotacoesPorDataMoeda(DataCotacao, CodMoeda, ValorCotacao)
VALUES('2014-04-15', 'LIB', 3.7400)
 
INSERT INTO dbo.CotacoesPorDataMoeda(DataCotacao, CodMoeda, ValorCotacao)
VALUES('2014-04-14', 'LIB', 3.7048)
 
GO


select * from CotacoesPorDataMoeda
SELECT DataCotacao,
       [USD] AS VlDolar,
       [EUR] AS VlEuro,
       [LIB] AS VlLibra
FROM
(
    SELECT DataCotacao, CodMoeda, ValorCotacao
    FROM dbo.CotacoesPorDataMoeda
) C
PIVOT
(
    AVG(ValorCotacao)
    FOR CodMoeda IN ([USD], [EUR], [LIB])
) AS P