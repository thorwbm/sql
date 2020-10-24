
/******************************************************************************
V - VIEW
P - PROCEDURE
U - TABLES
FN - FUNCTION
UQ - UNIQUE CONSTRAINT
PK - PRIMARY KEY
FK - FORIENG KEY
*******************************************************************************/



SELECT  distinct Obj.Name
   FROM syscomments Com
   JOIN sysobjects Obj
   ON   Obj.Id = Com.Id
WHERE Obj.xtype like 'p' and 
      cast(Com.Text as varchar(max)) like '%getlocaldate%'



	  select * from sysobjects