--SELECT dbo.fn_FirstUpper('ANTONIO HENRIQUE DOS SANTOS, PAULO RICARDO DA SILVA, JOAQUIM DOS SANTOS, HENRIQUE DI FIORI, CARLOS EDUARDO DE ANDRADA, MANOEL DE NOBREGA, CARLOS TRINDADE DAS NEVES');

create FUNCTION dbo.fn_FirstUpper( @Texto Varchar(4000) )
RETURNS Varchar(4000)
AS
BEGIN
  DECLARE @Excecoes TABLE (Caracter Char(5) PRIMARY KEY);
  INSERT INTO @Excecoes VALUES (' de'),(' do'),(' dos'),(' da'),(' das'),(' di'),(' e');   --// Adicione aqui suas exceções sempre com um espaço em branco à esquerda

  DECLARE @resultado Varchar(4000),
          @tamanho   SmallInt;

  SELECT @resultado = '',
         @tamanho   = LEN(@Texto),
         @Texto     = LOWER(@Texto);
 
  WITH CTA
  AS ( SELECT 1 AS Sequencia,
              UPPER(LEFT(@texto,1)) AS Caracter
       UNION ALL
       SELECT Sequencia + 1 AS Sequencia,
              CASE
                WHEN EXISTS( SELECT 1 WHERE SUBSTRING(@Texto,Sequencia,1) <> ' '  --// Evitando o operador OR com EXISTS e UNION ALL
                             UNION ALL
                             SELECT 1
                             FROM @Excecoes
                             WHERE Caracter = SUBSTRING(@Texto,Sequencia,4)+' ' )
                  THEN SUBSTRING(@Texto,Sequencia+1,1)
                  ELSE UPPER(SUBSTRING(@Texto,Sequencia+1,1))
              END AS Caracter
       FROM CTA
       WHERE Sequencia < @tamanho )
  SELECT @resultado = @resultado + Caracter
  FROM CTA
  OPTION (MAXRECURSION 0);                                                       --// Sem Limite de Recursividade

  RETURN(@resultado);
END