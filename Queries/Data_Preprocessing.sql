create database ecommerces;
use ecommerces;

alter table `list of orders` rename to list_of_orders;
alter table `order details` rename to order_details;
alter table `sales target` rename to sales_target;

alter table list_of_orders change `Order ID`order_id text;
alter table list_of_orders change `Order Date`order_date text;
alter table list_of_orders change `CustomerName`customer_name text;

alter table order_details change `Order ID`order_id text;
alter table order_details change `Sub-Category`sub_category text;

alter table sales_target change `Month of Order Date` month_of_order_date text;

alter table order_details modify Amount decimal(10, 2);  
alter table order_details modify Profit decimal(10, 2);   
alter table order_details modify Quantity int;

select count(distinct order_id) from list_of_orders; 
select count(*) from list_of_orders;                 

select * from list_of_orders where order_id is null or order_id = '';   
delete from list_of_orders where order_id is null or order_id = '';

select count(distinct order_id) from list_of_orders; 
select count(*) from list_of_orders;  

update list_of_orders set order_date = str_to_date(order_date, "%d-%m-%Y") where order_date IS NOT NULL;
alter table list_of_orders modify order_date date;

update list_of_orders set State = TRIM(State);      

select * from list_of_orders;
select * from order_details;
select * from sales_target;

describe list_of_orders;
describe order_details;
describe sales_target;
