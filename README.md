# SQL Project | E-commerce Data Analysis

## Project Overview

This project is part of my Data Analytics learning journey. I used SQL to explore and analyse e-commerce data and practise 30 SQL questions across Beginner, Intermediate, and Advanced levels.

The project focuses on analysing customer orders, sales performance, product categories, sub-categories, state-wise and city-wise sales, and profitability.

## Dataset Information

The project uses three related datasets:

1. **List of Orders** – Contains order details, customer names, order dates, states, and cities.
2. **Order Details** – Contains product categories, sub-categories, sales amount, profit, and quantity.
3. **Sales Target** – Contains monthly sales targets for different product categories.

**Dataset Source:** [E-commerce Dataset – https://www.kaggle.com/datasets/benroshan/ecommerce-data)

## Tools Used

- MySQL
- MySQL Workbench
- SQL

## Database Setup and Dataset Import

1. Created a database named `ecommerces`.
2. Imported the three CSV datasets into MySQL Workbench using the **Table Data Import Wizard**.
3. Renamed the imported tables:
   - `list of orders` → `list_of_orders`
   - `order details` → `order_details`
   - `sales target` → `sales_target`
4. Renamed selected columns for easier querying.
5. Modified column data types where required.
6. Converted the Order Date column into DATE format.
7. Performed basic data cleaning, including handling missing data.
## SQL Analysis

The project includes 30 SQL questions divided into three levels.

### Beginner Level (10 Questions)

- Data retrieval and filtering
- WHERE, IN, BETWEEN, LIKE
- ORDER BY and LIMIT
- DISTINCT
- Basic sorting and filtering

### Intermediate Level (10 Questions)

- Aggregate functions (SUM, AVG, COUNT)
- GROUP BY and HAVING
- JOIN
- State-wise and city-wise sales analysis
- Customer and category analysis
- Sub-category profitability analysis

### Advanced Level (10 Questions)

- Subqueries
- Common Table Expressions (CTEs)
- Window Functions (RANK and DENSE_RANK)
- Database Views
- Stored Procedures
- CASE Statements


## Key SQL Concepts Applied

- SELECT, WHERE, DISTINCT
- IN, BETWEEN, LIKE
- ORDER BY, LIMIT
- SUM, AVG, COUNT
- GROUP BY, HAVING
- JOINS
- Subqueries
- CTEs
- Window Functions
- Views
- Stored Procedures
- CASE Statements

## Key Learnings

Through this project, I gained practical experience in:

- Working with multiple related datasets.
- Importing and preparing CSV data in MySQL.
- Cleaning and modifying database tables.
- Analysing sales, profit, and quantity.
- Identifying top-performing customers, products, and locations.
- Analysing state-wise and city-wise sales performance.
- Creating reusable SQL views and stored procedures.
- Applying SQL concepts to real-world analytical questions.

## Project Files
1. Datasets/Original CSV datasets.
2. Queries/Data_Preprocessing.sql
3. Queries/Beginner_Queries.sql
4. Queries/Intermediate_Queries.sql
5. Queries/Advanced_Queries.sql

File 2 should be executed first, followed by Files 3, 4 and 5.


Thank you for visiting my project!
