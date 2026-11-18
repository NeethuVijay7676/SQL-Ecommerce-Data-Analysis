# Advanced Query

use ecommerces;
# 1.Create a reusable database view named State_Category_Summary that displays State, Category, total distinct orders, total Amount, and total Profit.
drop view if exists State_Category_Summary;
create view State_Category_Summary as
select l.State, o.Category,count(distinct o.order_id) as total_orders,sum(o.Amount) as total_amount, sum(o.Profit) as total_profit
from list_of_orders as l
inner join order_details as o
on l.order_id=o.order_id
group by l.State, o.Category;
select * from State_Category_Summary;

# 2. Find all order_ids and Amounts in order_details where the order Amount is strictly greater than the overall average Amount of all items in the table.
-- select avg(amount) from order_details;
select order_id,amount from order_details where amount>(select avg(amount) from order_details);

# 3.Retrieve the order_id and customer_name for all orders that do not contain a single unprofitable item.
select order_id,customer_name from list_of_orders where order_id not in(select distinct (order_id) from order_details where profit<0);

#4. Retrieve the order_id, Category, sub_category, Profit for all items in order_details where the Profit is greater than the highest Profit for 'Clothing' category.
-- select max(profit) as maxi_profit from order_details where category="Clothing";
select order_id, Category, sub_category, Profit from order_details where profit>(select max(profit) as maxi_profit from order_details where category="Clothing");

#5.Rank each sub_category within its respective Category based on total Profit (from highest to lowest), displaying Category, sub_category, total_profit, and profit_rank.
select Category, sub_category, sum(profit) as total_profit, rank() over(partition by category order by sum(profit) desc) as profit_rank 
from order_details
group by Category, sub_category;

#6.Rank all cities from highest to lowest based on their total number of distinct orders, displaying City, total_orders, and city_rank.
select City, count(distinct order_id) as total_orders, dense_rank() over(order by count(distinct order_id) desc) as city_rank 
from list_of_orders 
group by City;


#7.Using a CTE to first calculate the total sales Amount and total Profit for each City, retrieve all cities that generated more than 10,000 in total sales and had a positive net profit.
with city_summary as(
select l.city,sum(o.amount) as total_amount, sum(o.profit) as total_profit
from list_of_orders as l
inner join order_details as o
on l.order_id=o.order_id
group by l.city)
select city, total_amount,total_profit from city_summary where total_amount>10000 and total_profit>0;

#8.Create a stored procedure named categorysummary that accepts a category name (IN category_name VARCHAR(50)) as a parameter and runs three queries on order_details:
#   1. Displays the overall total sales Amount, total Profit, and total Quantity sold for that category.
#   2. Lists each sub_category within that category along with its total sales Amount, sorted from highest to lowest.
#   3. Retrieves the top 5 most profitable individual line items (order_id, sub_category, Amount, Profit) in that category.
# Finally, call the procedure for 'Electronics'.

drop procedure if exists categorysummary;
DELIMITER //
create procedure categorysummary (in category_name varchar(50))
begin
	select category,sum(Amount) as total_amount,sum(Profit) as total_profit ,sum(Quantity) as total_quantity from order_details where category=category_name group by category;
    select category,sub_category ,sum(Amount) as total_amount from order_details where category=category_name group by category,sub_category order by total_amount desc;
    select category,order_id, sub_category, Amount,Profit from order_details where category=category_name order by Profit desc limit 5;
end//
DELIMITER ;

call categorysummary ("Electronics");


#9.Create a stored procedure named statesummary that accepts a state name (IN state_name VARCHAR(50)) as a parameter and runs three queries:
#   1. Displays the total distinct orders, total sales Amount, and total Profit for that state.
#   2. Lists each City within that state along with its total sales Amount, sorted from highest to lowest.
#   3. Shows the total Quantity sold and total Profit for each product Category in that state.
# Finally, call the procedure for 'Maharashtra'.

drop procedure if exists statesummary;
DELIMITER //
create procedure statesummary (in state_name varchar(50))
begin
	select l.state,count(distinct o.order_id) as total_orders ,sum(o.amount) as total_amount, sum(o.profit) as total_profit 
    from list_of_orders as l
	inner join order_details as o
	on l.order_id=o.order_id
    where l.state=state_name
    group by l.state;
    
    select l.state,l.city,sum(o.amount) as total_amount
    from list_of_orders as l
	inner join order_details as o
	on l.order_id=o.order_id
    where l.state=state_name
    group by l.state,l.city
    order by total_amount desc;
    
    select l.state,o.category,sum(o.Quantity) as total_quantity, sum(o.profit) as total_profit 
    from list_of_orders as l
	inner join order_details as o
	on l.order_id=o.order_id
    where l.state=state_name
    group by l.state,o.category;
end//
DELIMITER ;
call statesummary('Maharashtra');

#10. Write a query to add a new column called Profitability_Status that categorizes each order item based on its Profit amount: 
-- assign "High Profit" if the profit is 500 or more, 
-- "Moderate Profit" if it is between 100 and 499, 
-- "Low / Break-Even" if it is between 0 and 99, and
--  "Loss" if the profit is less than 0.

select order_id,amount,quantity,category,sub_category,profit,
case
when profit >=500 then "High Profit"
when profit >=100 and profit<500 then "Moderate Profit"
when profit >=0 and profit <100 then "Low/ Break-Even"
else "Loss"
end as Profitability_Status
from order_details;

