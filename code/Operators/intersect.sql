DROP TABLE IF EXISTS table_b;
SELECT * FROM table_a;  -- Empty
SELECT * FROM table_b;  -- Empty


-- Beginner

-- Write a query using INTERSECT to find departments common to both employees and contractors tables.

-- Write a query using INTERSECT to list cities that appear in both employees and contractors tables.

-- Write a query using INTERSECT ALL to find product_names present in both products and customers tables.

-- Write a query to find product_names available in both inventory and customers tables using INTERSECT.

-- Intermediate

-- Write a query using INTERSECT to find employees/contractors who work in both HR and have exactly matching salary/rate/location combinations.

-- Write a query combining INTERSECT with WHERE clauses to find high-earning IT staff common across both tables (salary > 60000 or rate > 70).

-- Write a query using INTERSECT to find Electronics products that customers have ordered and are also in the products table.

-- Write a query to find warehouses that have inventory AND customers have ordered those products, using INTERSECT on product_name and warehouse/location.

-- Write an INTERSECT query with ORDER BY to list common customer names who ordered multiple matching products from inventory.

-- Advanced

-- Write a query using subqueries with INTERSECT to find products that appear in ALL warehouses with stock > 20 AND were ordered by customers.

-- Write a complex INTERSECT query: Find name/department combinations from employees that exactly match contractors, but only for New York location.

-- Write a query using INTERSECT with LIMIT: Find top 3 common product/category pairs between inventory and customer orders.

-- Write a query combining multiple INTERSECT operations: (employees ∩ contractors) ∩ products categories matching inventory categories.

-- Write an INTERSECT query with column casting: Find matching numeric values between salary/rate and product prices across tables.

-- Write a query using INTERSECT ALL with grouping context: Find duplicate product orders by customers that exactly match inventory stock patterns.




----------------------------------------
-- solution
----------------------------------------

SELECT * FROM table_a;  -- Empty
SELECT * FROM table_b;  -- Empty
-- Beginner

-- Write a query using INTERSECT to find departments common to both employees and contractors tables.
select * from table_a
INTERSECT
select * from table_b;

-- Write a query using INTERSECT to list cities that appear in both employees and contractors tables.

-- Write a query using INTERSECT ALL to find product_names present in both products and customers tables.

-- Write a query to find product_names available in both inventory and customers tables using INTERSECT.

-- Intermediate

-- Write a query using INTERSECT to find employees/contractors who work in both HR and have exactly matching salary/rate/location combinations.

-- Write a query combining INTERSECT with WHERE clauses to find high-earning IT staff common across both tables (salary > 60000 or rate > 70).

-- Write a query using INTERSECT to find Electronics products that customers have ordered and are also in the products table.

-- Write a query to find warehouses that have inventory AND customers have ordered those products, using INTERSECT on product_name and warehouse/location.

-- Write an INTERSECT query with ORDER BY to list common customer names who ordered multiple matching products from inventory.

-- Advanced

-- Write a query using subqueries with INTERSECT to find products that appear in ALL warehouses with stock > 20 AND were ordered by customers.

-- Write a complex INTERSECT query: Find name/department combinations from employees that exactly match contractors, but only for New York location.

-- Write a query using INTERSECT with LIMIT: Find top 3 common product/category pairs between inventory and customer orders.

-- Write a query combining multiple INTERSECT operations: (employees ∩ contractors) ∩ products categories matching inventory categories.

-- Write an INTERSECT query with column casting: Find matching numeric values between salary/rate and product prices across tables.

-- Write a query using INTERSECT ALL with grouping context: Find duplicate product orders by customers that exactly match inventory stock patterns.