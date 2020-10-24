/*****************************************************************************************************************
*                                     TIPOS DE OBJETOS ENCONTRADOS NO BANCO                                      *
*                                                                                                                *
* SELECT QUE GERA UMA LISTA COM ALGUNS TIPOS ENCONTRADOS NO BANCO.                                               *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA: GENERICO                                                                                        *
* AUTOR: WEMERSON BITTORI MADURO                                                                 DATA:09/11/2015 *
******************************************************************************************************************/


--stored procedures
select Count(name) QtdStoredProcedures
from sysobjects 
where xtype = 'P'

--Tabelas
select Count(name) QtdTabelas
from sysobjects 
where xtype = 'U'

--Triggers
select Count(name) QtdTriggers
from sysobjects 
where xtype = 'TR'

--Regras
select Count(name) QtdRegras
from sysobjects 
where xtype = 'R'

--Views
select Count(name) QtdViews
from sysobjects 
where xtype = 'V'

select substring(name,1,20) name, xtype
from sysobjects 
--where xtype = 'U'
order by xtype, Name




/*
       --,id,xtype,uid,info,status,base_schema_ver,replinfo,parent_obj,crdate,ftcatid,
       --schema_ver,stats_schema_ver,type,userstat,sysstat,indexdel,refdate,version,deltrig,instrig,updtrig
       --seltrig,category,cache
*/