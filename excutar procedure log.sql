select * into #temp from (
select tabela = 'aluno' union 
select tabela = 'aluno_curso' union 
select tabela = 'aluno_escola' union 
select tabela = 'aluno_etapa_cpa' union 
select tabela = 'aluno_professor_disciplina' union 
select tabela = 'avaliacaoegresso' union 
select tabela = 'cargo' union 
select tabela = 'comparativo_questionario' union 
select tabela = 'conclusao' union 
select tabela = 'coordenador' union 
select tabela = 'cpa' union 
select tabela = 'curso' union 
select tabela = 'disciplina' union 
select tabela = 'docente_curso' union 
select tabela = 'DP_Docente' union 
select tabela = 'escola' union 
select tabela = 'etapa' union 
select tabela = 'funcionario' union 
select tabela = 'monta_questionario' union 
select tabela = 'observacao' union 
select tabela = 'participacao' union 
select tabela = 'perfil' union 
select tabela = 'perfil_questionario' union 
select tabela = 'pergunta' union 
select tabela = 'pergunta_resposta' union 
select tabela = 'periodo' union 
select tabela = 'professor' union 
select tabela = 'professor_escola' union 
select tabela = 'questionario' union 
select tabela = 'questionario_pergunta' union 
select tabela = 'resposta' union 
select tabela = 'secao' union 
select tabela = 'setor_cpa' union 
select tabela = 'setor_rm' union 
select tabela = 'subCoordenadorCursoAutoAvaliacao' union 
select tabela = 'unidade' union 
select tabela = 'unidade_setor' union 
select tabela = 'usuario' union 
select tabela = 'usuario_perfil_cpa' ) as tab


 declare @tabela varchar(100)
declare CUR_ cursor for 
	SELECT tabela FROM #temp
	open CUR_ 
		fetch next from CUR_ into @tabela
		while @@FETCH_STATUS = 0
			BEGIN
				exec SP_CRIAR_ESTRUTURA_LOG @tabela


			fetch next from CUR_ into @tabela
			END
	close CUR_ 
deallocate CUR_ 