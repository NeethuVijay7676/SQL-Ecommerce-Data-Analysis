# Beginner Query

use ecommerces;
# 1. Retrieve all columns from list_of_orders for customers located in the State of Maharashtra.
select * from list_of_orders where State='Maharashtra';

# 2. List the order_id, Category, sub_category, and Profit from order_details where the Category is Electronics and the Profit is greater than 500.
select order_id,Category,sub_category, profit from order_details where Category = 'Electronics' and Profit>500;

# 3. Display the top 10 most expensive items from order_details, ordered from highest to lowest.
select * from order_details order by amount desc limit 10;

# 4. Find all records in order_details that resulted in a financial loss (Profit is negative) and had a Quantity of at least 5.
select * from order_details where Profit<0 and Quantity>=5;

# 5. Retrieve the order_id, customer_name, and order_date from list_of_orders for all orders placed in Bangalore or Mumbai, sorted chronologically from oldest to newest.
select order_id,customer_name,order_date from list_of_orders where City in('Bangalore','Mumbai') order by order_date;

#6.	Retrieve all the distinct CustomerName starts with the letter 'A', sorted alphabetically by CustomerName.
select distinct customer_name from list_of_orders where customer_name like "A%" order by  customer_name;

#7.	List the Order ID, Sub-Category, Amount, and Quantity where the Amount is between 500 and 1000 (inclusive), ordered by Amount ascending.
select order_id,sub_category,amount,quantity from order_details where amount between 500 and 1000 order by amount;

#8.	Display the Order ID, State, and City for all records that are not located in Maharashtra or Madhya Pradesh, limited to the first 15 results.
select order_id, State, City from list_of_orders where State not in('Maharashtra','Madhya Pradesh') limit 15;

#9. Retrieve the Order ID, Amount,Sub_Category and Profit for all Bookcases ,Printers, Chairs, ordered by Profit from highest to lowest, showing only the top 5 most profitable items.
select order_id, Amount,Sub_Category, Profit from order_details where Sub_Category in("Bookcases","Printers","Chairs") order by Profit desc limit 5;

#10.  Retrieve all records from sales_target where the target is at least 15000.
select * from sales_target where target>=15000;