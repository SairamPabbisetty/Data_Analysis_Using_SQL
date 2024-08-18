-- create the database 
create database if not exists ecommerce_sales_data;
show databases;
use ecommerce_sales_data;

-- create a table inside the db as ecommerce_sales 
-- automatic table creation and data import 
select * from ecommerce_sales_table; 
desc ecommerce_sales_table;

-- loading the data in to the table using command 
load data infile "path of the csv file"
into table table_name
fields terminated by ","
enclosed by '"' 
lines terminated by "\n"
ignore 1 rows; 
-- to ignore the first row as it is the columns heads 

-- identify the top 3 states with the highest shipping costs 
select state, sum(shipping_cost) as total_cost 
from ecommerce_sales_table 
group by state
order by total_cost desc 
limit 3; 

-- which state generate the highest sales 
select state, sum(sales) as total_sales 
from ecommerce_sales_table
group by state 
order by total_sales desc 
limit 1;

-- which product category generate the highest sales 
select category, sum(sales) as total_sales 
from ecommerce_sales_table
group by category 
order by total_sales desc 
limit 1;

-- what is the average shipping cost by region 
select region, avg(shipping_cost) as avg_shipping_cost 
from ecommerce_sales_table
group by region; 

-- which customers have the highest profit margin 
select customer_name, sum(profit) as profit_margin 
from ecommerce_sales_table
group by customer_name 
order by profit_margin desc; 

-- How does the order priority affect the shipping time (ship_date - order_date) 
select order_priority, avg(datediff(ship_date, order_date)) as avg_shipping_time 
from ecommerce_sales_table 
group by order_priority
order by avg_shipping_time desc; 

-- What is the total sales and profit by year 
 select year, sum(sales) as total_sales, sum(profit) as total_profit 
 from ecommerce_sales_table
 group by year; 
 
-- What is the average discount given for each product category
select category, avg(discount) as avg_discount 
from ecommerce_sales_table 
group by category; 

-- Which product sub-categories are selling the most units (quantity) 
select sub_category, sum(quantity) as total_units 
from ecommerce_sales_table 
group by sub_category
order by total_units desc; 

-- Which state contributes the most to total profit 
select state, sum(profit) as total_profit
from ecommerce_sales_table 
group by state
order by total_profit desc 
limit 1;

-- What is the total discount offered by market and segment 
select market, segment, sum(discount) as total_discount 
from ecommerce_sales_table 
group by market, segment; 
