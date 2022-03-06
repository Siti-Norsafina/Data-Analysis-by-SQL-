select * from dbo.PS4_GamesSales

--- SEARCHING FOR GENRE CATEGORIES
select distinct Genre from dbo.PS4_GamesSales

--- ARRANGE DATA BY YEAR OF PUBLISH
select * from dbo.PS4_GamesSales Order by [Year]

--- ARRANGE DATA BY GENRE
select * from dbo.PS4_GamesSales Order by Genre

--- SEARCHING FOR GENRE ACTION 
select * from dbo.PS4_GamesSales Where Genre like '%Action%'
Order by ([Global])

--- TO SUM TOTAL SALES FOR EACH GENRE 
select Genre, sum([Global]) as TotalSales
from dbo.PS4_GamesSales Group by Genre Order by TotalSales desc

--- LOOKING AT THE GENRE WITH HIGHEST SALES IN EACH REGION 
select Genre, sum(Japan) as JapanGenreSales,
sum(Europe) as EuropeGenreSales,
sum([North America]) as NorthAmericaGenreSales, 
sum([Rest of World]) as RestGenreSales 
from dbo.PS4_GamesSales 
Group by Genre

--- LOOKING AT REGIONAL SALES IN PERCENTAGE
select (sum(Japan)/sum([Global]))*100 as RegionalSalesJapan,
(sum(Europe)/sum([Global]))*100 as RegionalSalesEurope, 
(sum([North America])/sum([Global]))*100 as RegionalSalesNorthAmerica, 
(sum([Rest of World])/sum([Global]))*100 as RegionalSalesRest
from dbo.PS4_GamesSales  

--- FIND PUBLISHER WITH THE SAME GENRE
select g1.Genre, g1.Publisher + ' ' Publisher_1, g2.Publisher + ' ' Publisher_2
from dbo.PS4_GamesSales g1
inner join dbo.PS4_GamesSales g2 on g1.Publisher <> g2.Publisher
and g1.Genre = g2.Genre
Order by Genre, Publisher_1, Publisher_2
