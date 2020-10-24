select
data = 'Belo Horizonte, ' + convert(varchar(2), day(getdate())) + ' de ' +
              case month(getdate()) when 1  then 'Janeiro de '   + convert(varchar(4), year(getdate()))
	     	                        when 2  then 'Fevereiro de ' + convert(varchar(4), year(getdate()))
		                            when 3  then 'Março de '     + convert(varchar(4), year(getdate()))
		                            when 4  then 'Abril de '     + convert(varchar(4), year(getdate()))
		                            when 5  then 'Maio de '      + convert(varchar(4), year(getdate()))
		                            when 6  then 'Junho de '     + convert(varchar(4), year(getdate()))
		                            when 7  then 'Julho de '     + convert(varchar(4), year(getdate()))
		                            when 8  then 'Agosto de '    + convert(varchar(4), year(getdate()))
		                            when 9  then 'Setembro de '  + convert(varchar(4), year(getdate()))
		                            when 10 then 'Outubro de '   + convert(varchar(4), year(getdate()))
		                            when 11 then 'Novembro de '  + convert(varchar(4), year(getdate()))
		                            when 12 then 'Dezembro de '  + convert(varchar(4), year(getdate())) end