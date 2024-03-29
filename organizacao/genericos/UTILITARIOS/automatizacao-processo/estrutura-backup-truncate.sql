/*****************************************************************************************************************
*                                     GERAR BACKUPS DIARIO, SEMANAL, MENSAL                                      *
*                                                                                                                *
* ESTRUTURA QUE DISPARA BACKUPS DIARIOS, SEMANAIS E MENSAIS CONFORME CONFIGURACAO, LEMBRANDO QUE DEVE-SE INFORMA *
* R O BANCO A SER BACKPEADO, O DIRETORIO. DENTRO DESTE DIRETORIO SERA CRIADO AS PASTAS DIARIO, SEMANAL E MENSAL  *
* CONTENDO CADA UMA UMA PASTA COM O NOME DO BANCO EM QUESTAO.                                                    *
* SETAR SE O BACKUP SERA DIARIO, SEMANAL E MENSAL.                                                               *
* CONFIGURAR QUAIS OS DIAS SERAO OS DIAS DA SEMANA QUE SERAO FEITOS O BACKUP DIARIO E SEMANAL.                   *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:18/11/2015 *
******************************************************************************************************************/

DECLARE @MES VARCHAR(50),@DIASEM VARCHAR(50),@BANCO VARCHAR(100),@COMANDO VARCHAR(500), @DIRETORIO VARCHAR(100), @ARQUIVO VARCHAR (1000), 
        @NOME VARCHAR(500),@SEMANA VARCHAR(5),@RAIS VARCHAR(100), @DIARIO INT, @SEMANAL INT, @MENSAL INT

-- ***** ZERO INATIVO - UM ATIVO ******
SET @DIARIO  = 1
SET @SEMANAL = 1 
SET @MENSAL  = 1
      
set @banco =  UPPER(db_name());
set @RAIS = 'k:\';              -- *****   DIRETORIO    ********
set @mes = convert(varchar(3),DATEPART (week,getdate())); 

if (DATEPART(weekday,GETDATE()) in (2,3,4,5,6) AND @DIARIO = 1) --******** CONFIGURAR AQUI OS DIAS DA SEMANA PRO BACKUP DIARIO  **********
	begin 
	    set @diaSem = CASE WHEN DATEPART(WEEKDAY,GETDATE()) = 1 THEN 'DOMINGO'
                           WHEN DATEPART(WEEKDAY,GETDATE()) = 2 THEN 'SEGUNDA'
                           WHEN DATEPART(WEEKDAY,GETDATE()) = 3 THEN 'TERCA'
                           WHEN DATEPART(WEEKDAY,GETDATE()) = 4 THEN 'QUARTA'
                           WHEN DATEPART(WEEKDAY,GETDATE()) = 5 THEN 'QUINTA'
                           WHEN DATEPART(WEEKDAY,GETDATE()) = 6 THEN 'SEXTA'
                           WHEN DATEPART(WEEKDAY,GETDATE()) = 7 THEN 'SABADO' END;
                           
		DBCC SHRINKFILE (1, TRUNCATEONLY);
		DBCC SHRINKFILE (2, TRUNCATEONLY);
		
		set @nome = @banco + '_FULL_DIARIO_' + @DIASEM ;		
		set @diretorio = @RAIS + 'DIARIO\'+ @banco + '\';
		set @arquivo = @diretorio + @banco + '_' + @DIASEM + '.bak';
		
		-- ********** cria o diretorio onde vai ser aramazenado o backup ***************
		exec master..xp_create_subdir @diretorio;

		-- FIM ********** cria o diretorio onde vai ser aramazenado o backup ***************
		       
        BACKUP DATABASE @Banco TO  DISK = @arquivo WITH NOFORMAT, INIT,  NAME = @nome , SKIP, NOREWIND, NOUNLOAD,  STATS = 10;
	END

--**********************  SEMANAL  *******************************
if (DATEPART(weekday,GETDATE()) in (7) AND @SEMANAL = 1) --******** CONFIGURAR AQUI O DIA DA SEMANA PRO BACKUP SEMANAL (7 = DOMINGO)  **********
	begin 		
	    set @SEMANA = (DAY(getdate()) + (DATEPART(dw, DATEADD (month, DATEDIFF (month, 0, getdate()), 0)) -1) -1)/7 + 1;
		
		DBCC SHRINKFILE (1, TRUNCATEONLY);
		DBCC SHRINKFILE (2, TRUNCATEONLY);
		
		set @nome = @banco + '_FULL_SEMANAL_' + @SEMANA;
		set @diretorio = @RAIS + 'SEMANAL\'+ @banco + '\';
		set @arquivo = @diretorio + @banco + '_' + @SEMANA + '.bak';
        
        -- ********** cria o diretorio onde vai ser aramazenado o backup ***************
        exec master..xp_create_subdir @diretorio;
        	
		-- FIM ********** cria o diretorio onde vai ser aramazenado o backup ***************
		
        BACKUP DATABASE @Banco TO  DISK = @arquivo WITH NOFORMAT, INIT,  NAME = @nome , SKIP, NOREWIND, NOUNLOAD,  STATS = 10;
	END

--**********************  MENSAL  *******************************
if (CONVERT(VARCHAR(10),GETDATE()) = CONVERT(VARCHAR(10),DATEADD(DAY, -DAY(GETDATE()) ,DATEADD(MONTH,1,GETDATE())),103) AND @MENSAL = 1)
	begin 
	    		
	    SET @MES = CASE WHEN DATEPART(MONTH,GETDATE()) = 1  THEN 'JANEIRO' 
                        WHEN DATEPART(MONTH,GETDATE()) = 2  THEN 'FEVEREIRO' 
                        WHEN DATEPART(MONTH,GETDATE()) = 3  THEN 'MARCO' 
                        WHEN DATEPART(MONTH,GETDATE()) = 4  THEN 'ABRIL' 
                        WHEN DATEPART(MONTH,GETDATE()) = 5  THEN 'MAIO' 
                        WHEN DATEPART(MONTH,GETDATE()) = 6  THEN 'JUNHO' 
                        WHEN DATEPART(MONTH,GETDATE()) = 7  THEN 'JULHO' 
                        WHEN DATEPART(MONTH,GETDATE()) = 8  THEN 'AGOSTO' 
                        WHEN DATEPART(MONTH,GETDATE()) = 9  THEN 'SETEMBRO' 
                        WHEN DATEPART(MONTH,GETDATE()) = 10 THEN 'OUTUBRO' 
                        WHEN DATEPART(MONTH,GETDATE()) = 11 THEN 'NOVEMBRO' 
                        WHEN DATEPART(MONTH,GETDATE()) = 12 THEN 'DEZEMBRO'  END;
                        
		DBCC SHRINKFILE (1, TRUNCATEONLY);
		DBCC SHRINKFILE (2, TRUNCATEONLY);
	   
	    set @nome = @banco + '_FULL_MENSAL_' + @MES ;
		set @diretorio = @RAIS + 'MENSAL\'+ @banco + '\';
		set @arquivo = @diretorio + @banco + '_' + @MES + '.bak';
        
        -- ********** cria o diretorio onde vai ser aramazenado o backup ***************
		exec master..xp_create_subdir @diretorio;

		-- FIM ********** cria o diretorio onde vai ser aramazenado o backup ***************
		
        BACKUP DATABASE @Banco TO  DISK = @arquivo WITH NOFORMAT, INIT,  NAME = @nome, SKIP, NOREWIND, NOUNLOAD,  STATS = 10;
	END