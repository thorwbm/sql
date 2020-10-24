------------------------------------------------------------------
-- Como auditar comandos DDL no SQL Server
------------------------------------------------------------------
--------------------------------------------------
-- Requisitos para nosso teste
--------------------------------------------------
-- Banco de auditoria
use master
if db_id('auditoria') is not null
    drop database auditoria
go
create database auditoria
go
use auditoria
go
 
-- Tabela para guardar dados de auditoria
if object_id('adm_audit_ddl') is not null drop table adm_audit_ddl
create table dbo.adm_audit_ddl (
    id_alteracao int identity(1, 1) not null,
    dt_alteracao datetime2 not null,
    nr_spid int null,
    nm_computador sysname null,
    ds_ip varchar(50) null,
    nm_login sysname null,
    nm_banco sysname null,
    ds_tipo_evento nvarchar(50) null,
    nm_objeto sysname null,
    ds_tipo_objeto nvarchar(50) null,
    ds_sql nvarchar(max) null,
    ds_event_data xml null,
    constraint pk_adm_audit_ddl primary key (dt_alteracao, id_alteracao))
go
 
 
-- Banco de testes
use master
if db_id('curso') is not null
    drop database curso
go
create database curso
go
use curso
go
 
-- Trigger para gerar dados de auditoria, registrada no banco que queremos auditar, no caso o banco curso
if exists (select 1 from sys.triggers where name = 'adm_tr_alteracoes') drop trigger adm_tr_alteracoes on database
go
create trigger adm_tr_alteracoes on database for
    -- obs: é possível selecionar eventos individuais ou todos os eventos, como fiz nesse exemplo
    ddl_database_level_events
/*  create_procedure, alter_procedure, drop_procedure, 
    create_table, alter_table, drop_table, 
    create_function, alter_function, drop_function,
    create_view, alter_view, drop_view
*/
as
    set nocount on
    set arithabort on
    -- salvar evento (convertendo o XML para lowercase, pois o método value é case-sensitive, e não queremos nos preocupar com isso)
    declare @ds_dados_evento xml = lower(cast(eventdata() as nvarchar(max)))
    insert into auditoria.dbo.adm_audit_ddl (dt_alteracao, nr_spid, nm_computador,  ds_ip, nm_login, nm_banco, ds_tipo_evento, nm_objeto, ds_tipo_objeto, ds_sql, ds_event_data)
        select
            sysdatetime(),
            @@spid, -- identificador da conexão
            host_name(), -- nome da máquina do cliente
            cast (connectionproperty('client_net_address') as varchar(300)), -- ip
            suser_name(), -- login
            @ds_dados_evento.value('(/event_instance/databasename)[1]', 'sysname'),
            @ds_dados_evento.value('(/event_instance/eventtype)[1]', 'nvarchar(50)'), 
            @ds_dados_evento.value('(/event_instance/objectname)[1]', 'sysname'), 
            @ds_dados_evento.value('(/event_instance/objecttype)[1]', 'nvarchar(50)'), 
            @ds_dados_evento.value('(/event_instance/tsqlcommand/commandtext)[1]', 'nvarchar(max)'),
            @ds_dados_evento -- xml integral do evento
go 
 
 
--------------------------------------------------
-- Testando a auditoria
--------------------------------------------------
-- Testes da trigger e do log
create table teste (id int, nome varchar(100))
alter table teste add nm varchar(100)
drop table teste
create table amigos (nm varchar(100), email varchar(200), telefone varchar(15))
alter table amigos drop column telefone
 
-- Listando eventos registrados
select * from auditoria.dbo.adm_audit_ddl
select * from auditoria.dbo.adm_audit_ddl where nm_objeto = 'amigos'
 
 
-- Excluindo dados de teste
use master
drop database auditoria
drop database curso