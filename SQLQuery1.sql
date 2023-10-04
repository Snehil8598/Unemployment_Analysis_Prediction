select * from [dbo].[Unemployment2020]
select*from Unemployment_India
update Unemployment_2020 set Frequency='Monthly' where Frequency='M'


--union of two tables with year 2020
with Final_table as 
(select * from
(select Region,Date,Estimated_Unemployment_Rate,[Estimated_Employed],[Estimated_Labour_Participation_Rate] from 
Unemployment_India 
union
select Region,Date,Estimated_Unemployment_Rate,[Estimated_Employed],[Estimated_Labour_Participation_Rate] from 
[dbo].[Unemployment2020]
) as c
where left(c.Date,4)='2020')
select Region,Date,avg(Estimated_Unemployment_Rate) as EUR,avg([Estimated_Employed]) as EE,avg([Estimated_Labour_Participation_Rate]) as ELPR into truetable4 from Final_table
group by Date,Region
order by Date,Region

select * from truetable4

select count(distinct Region) as Number_of_Regions
from [dbo].[Unemployment2020]

select count(distinct Date) as Number_of_Months
from [dbo].[Unemployment2020]
where Region='Andhra Pradesh'