DECLARE @dt datetime, @WeekOfMonth tinyint
SET @dt = '2015-11-01'

SET @WeekOfMonth = (DAY(@dt) + (DATEPART(dw, DATEADD (month, DATEDIFF (month, 0, @dt), 0)) -1) -1)/7 + 1

print @weekofmonth



select  dia  = day(getdate()),
        priDiaMes = datepart(dw, dateadd(month,DATEDIFF(month, 0, getdate()),0)),
        diaSemanaCompleta = (datepart(dw, dateadd(month,DATEDIFF(month, 0, getdate()),0))-1),
        diaMaisDiaSemanaMenosUm = day(getdate())+(datepart(dw, dateadd(month,DATEDIFF(month, 0, getdate()),0))-1)-1,
        dividido7 = (day(getdate())+(datepart(dw, dateadd(month,DATEDIFF(month, 0, getdate()),0))-1)-1)/7,
        soma1 = (day(getdate())+(datepart(dw, dateadd(month,DATEDIFF(month, 0, getdate()),0))-1)-1)/7 + 1