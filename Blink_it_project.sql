use MINI_PROJ_BKT


select * from Blink_IT


update Blink_IT
set Item_Fat_Content =
case 
when Item_Fat_Content IN ('Low Fat','LF') then 'Low Fat'
when Item_Fat_Content= 'reg' then 'Regular'
else
Item_Fat_Content
end;


--1st KPI- Total Sales
select cast(sum(Total_Sales)/1000000 as decimal(10,2)) as Total_overal_sales  from Blink_IT


--2nd KPI-Average Total Sales
select cast(AVG(Total_Sales) as int) as Average_overal_sales  from Blink_IT

--3rd KPI- Number of Items
select count(Item_Identifier) as Number_Of_Items  from Blink_IT

--4th KPI- Average Ratings
select cast( Avg(Rating) as decimal (2,1)) as average_ratings from Blink_IT;



--Granular Requirements
--1.Total Sales by Fat Content-
select Item_Fat_Content, cast(sum(Total_Sales)as decimal (10,2)) as Total_Overal_Sales
from Blink_IT
group by  Item_Fat_Content; 

--2.Total Sales by Item Type
select Item_Type, cast(sum(Total_Sales)as int) as Total_Sales
from Blink_IT
group by  Item_Type
order by Total_Sales desc

--3.Total Sales by Outlet Estabilishment
select Outlet_Establishment_Year, cast(sum(Total_Sales)as int) as Total_Sales
from Blink_IT
group by  Outlet_Establishment_Year
order by Outlet_Establishment_Year  

--4.Sales by Outlet Location 
select Outlet_Location_Type, cast(sum(Total_Sales)as int) as Total_Sales
from Blink_IT
group by  Outlet_Location_Type
order by Total_Sales desc

--5.All metrices by Outlet Type---

select Outlet_Type,
cast (sum(Total_Sales) as decimal(10,2)) as Total_overall_Sales,
cast(AVG(Total_Sales) as int) as Average_overal_sales,
count(Item_Identifier) as Number_Of_Items,
cast( Avg(Rating) as decimal (2,1)) as average_ratings
from Blink_IT
group by Outlet_Type 


select * from Blink_IT

