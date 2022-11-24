------------------------------------------------------------------
-- PIVOT: Transposição (linhas para colunas DINAMICAMENTE)
------------------------------------------------------------------
--------------------------------------------------
-- Banco de dados para nosso teste
--------------------------------------------------
-- Banco de testes
use master
if db_id('curso') is not null
    drop database curso
go
create database curso
go
use curso
go
create table colaboradores (
    id smallint identity(1,1) primary key,
    nm varchar(100) not null,
)
insert into colaboradores values
    ('Abismail do Rosário'),
    ('Josemar Pinto Godinho'),
    ('Francisco Sanguessuga'),
    ('Rolando da Rocha'),
    ('Chaves Rosembaum'),
    ('Necrotério Silveira'),
    ('Navegador da Luz')
 
create table produtos (
    id smallint identity(1,1) primary key,
    nm varchar(100),
    vl decimal(10,2),
    ic_ativo bit not null default (1)
)
insert produtos (nm, vl) values
    ('Mouse Gammer 25 botões', 200),
    ('Teclado Gammer 350 teclas', 300),
    ('Monitor 32 Pol Full HD', 1000),
    ('RAM DDR4 4GB Powerturbo', 500),
    ('CPU Nasa 10Ghz', 2000),
    ('HD SSD 1TB', 2000)
 
create table vendas (
    id int not null identity(1, 1) primary key,
    dt datetime not null,
    id_produto smallint not null foreign key references produtos(id),
    id_vendedor smallint foreign key references colaboradores(id),
    qt int check (qt > 0),
    vl_unitario decimal (10,2), 
    vl_venda as qt * vl_unitario
)
;with cte_seq as (
    select 1 as nr_cont
    union all
    select nr_cont + 1 
    from cte_seq where nr_cont < 10000)
insert into vendas (dt, id_produto, id_vendedor, qt, vl_unitario)
    select
        dateadd(day, -(abs(checksum(newid())) % 1825), getdate()) dt,
        produto.id,
        colaborador.id,
        1 + (abs(checksum(newid())) % 15) nr_quantidade,
        produto.vl vl_unitario
    from cte_seq
    left join (select top 1 id, vl from produtos order by newid()) produto on 1=1
    left join (select top 1 id from colaboradores order by newid()) colaborador on 1=1
    option (maxrecursion 0)
go
 
 
--------------------------------------------------
-- Pivot padrão (com colunas fixas)
--------------------------------------------------
-- Anos em colunas:
select *
from (
    select
        year(dt) as Ano,
        c.nm as Colaborador,
        sum(vl_venda) as Valor
    from vendas 
    join colaboradores c on c.id = vendas.id_vendedor
    group by c.nm, year(dt)
) em_linha
pivot (sum(valor) for ano in ([2012], [2013], [2014], [2015], [2016], [2017])) em_colunas 
order by 1
go
 
-- Colaboradores em colunas:
select *
from (
    select
        year(dt) as Ano,
        c.nm as Colaborador,
        sum(vl_venda) as Valor
    from vendas 
    join colaboradores c on c.id = vendas.id_vendedor
    group by c.nm, year(dt)
) em_linha
pivot (sum(valor) for colaborador in ([Abismail do Rosário], [Chaves Rosembaum], [Francisco Sanguessuga])) em_colunas 
order by 1
go
 
--------------------------------------------------
-- Pivot ninja - colunas dinâmicas
--------------------------------------------------
-- Anos em colunas dinâmicas
declare @colunas_pivot as nvarchar(max), @comando_sql  as nvarchar(max)
set @colunas_pivot = 
    stuff((
        select
            distinct ',' + quotename(year(dt)) 
        from vendas
        for xml path('')
    ), 1, 1, '')
print @colunas_pivot
set @comando_sql = '
    select * from (
        select 
            year(dt) as Ano,
            nm as Colaborador,
            sum(vl_venda) as Valor
        from vendas
        join colaboradores c on c.id = vendas.id_vendedor
        group by nm, year(dt)
    ) em_linha
    pivot (sum(valor) for ano in (' + @colunas_pivot + ')) em_colunas 
    order by 1'
print @comando_sql
execute(@comando_sql)
go
 
-- Colaboradores em colunas dinâmicas
declare @colunas_pivot as nvarchar(max), @comando_sql  as nvarchar(max)
set @colunas_pivot = stuff((select distinct ',' + quotename(nm) from colaboradores for xml path('')), 1, 1, '')
print @colunas_pivot
set @comando_sql = '
    select * from (
        select nm as Colaborador, year(dt) as Ano, sum(vl_venda) as Valor
        from vendas
        join colaboradores c on c.id = vendas.id_vendedor
        group by nm, dt
    ) em_linha
    pivot (sum(valor) for colaborador in (' + @colunas_pivot + ')) em_colunas 
    order by 1'
print @comando_sql
execute(@comando_sql)
 
 
--------------------------------------------------
-- Excluindo dados de teste
--------------------------------------------------
use master
drop database curso



-- bibliografia 
-- https://dba-pro.com/pivot-com-colunas-dinamicas-no-sql-server/