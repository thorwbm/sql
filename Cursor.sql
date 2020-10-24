   DECLARE @au_Fname varchar(40), @au_Lname varchar(40)
   declare @teste char(1)
   DECLARE abc CURSOR FOR
     SELECT au_FName, au_LName
     FROM Authors where au_FName like 'A%'
     order by au_FName 
   OPEN abc
   FETCH NEXT FROM abc INTO @au_Fname, @au_Lname
   WHILE @@FETCH_STATUS = 0
   BEGIN
      FETCH NEXT FROM abc INTO @au_Fname, @au_Lname
   END
   CLOSE abc
   DEALLOCATE abc
