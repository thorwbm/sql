

create procedure sp_ouvidoria_avaliacao_em_atraso as 
declare @gestor_email varchar(max)
declare @mensagem varchar(max)
declare @avaliacao_id int 
declare @mensagem_id int
declare @usuario_interno_id int 
declare @gestor_nome varchar(max)

declare CUR_ cursor for 
	------------------------------------------------------------------------------------------------
	select distinct ava.cod_ava as avaliacao_codigo, ava.cod_men as mensagem_codigo,
		   gestor_email   = isnull(usu.ema_usu, gex.ema_ges_ext),
		   gestor_usuario = isnull(usu.nom_usu, gex.nom_ges_ext),
		   usu.cod_usu as usuario_interno_codigo
	  from avaliacao ava join vw_ultima_avaliacao_mensagem uam on (ava.cod_ava = uam.avaliacao_codigo and 
	                                                               ava.cod_men = uam.mensagem_codigo)
					left join instituto_setor its on (ava.cod_ins_set = its.cod_ins_set) 
					left join instituto       ins on (ins.cod_ins     = its.cod_ins)
					left join usuario         usu on (usu.cod_ins_set = its.cod_ins_set)
					left join gestor_externo  gex on (gex.cod_ges_ext = ava.cod_ges_ext)
	 where ava.dat_cad <= dateadd(day,-3,getdate()) and
			ava.sta_ava in ('ENCAMINHADOPARAOGESTOR')  
		------------------------------------------------------------------------------------------------
	open CUR_ 
		fetch next from CUR_ into @avaliacao_id, @mensagem_id, @gestor_email, @gestor_nome, @usuario_interno_id
		while @@FETCH_STATUS = 0
			BEGIN
			    if (@usuario_interno_id is not null) 
					begin
						set @mensagem = 'Prezado(a) Gestor(a),' + @gestor_nome + 
						                '<br /><br />Segue link de manifestação de cliente direcionado a Ouvidoria.' + 
										'<br />Gentileza analisar e disponibilizar resposta. Pedimos breve retorno!' +
										'<br />Visando a satisfação dos nossos clientes, trabalhamos com prazo de ' +
											  'três dias para encerramento do fluxo de tratamento das manifestações.' + 
										'<br /><br />http://ouvidoria.feluma.org.br/ouvidoria/login.xhtml' + 
										'<br /><br />Esse é um e-mail automático, favor não responder!' 
					end
				else 
					begin 
						set @mensagem = 'Prezado(a) Gestor(a),' + @gestor_nome + 
                                        '<br /><br />Segue link de manifestação de cliente direcionado a Ouvidoria.' + 
                                        '<br />Gentileza analisar e disponibilizar resposta. Pedimos breve retorno!' + 
                                        '<br />Visando a satisfação dos nossos clientes, trabalhamos com prazo de três ' + 
										'dias para encerramento do fluxo de tratamento das manifestações.' + 
                                        '<br /><br />http://ouvidoria.feluma.org.br/ouvidoria/avaliaMensagemDireta.xhtml?mensagem=' + convert(varchar(10), @mensagem_id)  + 
                                        '&avaliacao=' +  convert(varchar(10),@avaliacao_id)  + 
                                        '<br /><br />Esse é um e-mail automático, favor não responder!'  
					end 
				exec sp_enviar_email @gestor_email, 'Mensagem Ouvidoria FELUMA', @mensagem

			fetch next from CUR_ into @avaliacao_id, @mensagem_id, @gestor_email,@gestor_nome, @usuario_interno_id
			END
	close CUR_ 
deallocate CUR_ 



