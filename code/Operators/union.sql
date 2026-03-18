SELECT * FROM employees;  -- Empty
SELECT * FROM contractors;  -- Empty
SELECT * FROM products;  -- Empty
SELECT * FROM orders;  -- Empty


-- Beginner

-- Write a query using UNION ALL to list all names and departments from employees and contractors.

select * from contractors
UNION 

select * from employees;



-- Write a query using UNION to combine salaries from employees and hourly_rates from contractors as 'pay', showing only unique pay values.

-- Write a query to list all unique cities from employees and contractors using UNION.

-- Write a query using UNION ALL to show all product_names from products and orders tables.

-- Intermediate

-- Write a query using UNION to list name, department, and pay (salary or hourly_rate aliased) from employees and contractors, sorted by department then name.

-- Write a query to find products that are in both products and orders tables (matching product_name) using INTERSECT.

-- Write a query using EXCEPT to list product_names from products that do not appear in orders.

-- Write a query using UNION ALL to combine all rows from products and orders, then limit to top 5 rows ordered by price/sale_price descending.

-- Write a query to list unique categories from employees/contractors departments and products/orders categories using UNION, ordered alphabetically.

-- Advanced

-- Write a query using subqueries with UNION ALL to list high earners: employees with salary > 60000 or contractors with hourly_rate > 70, ordered by pay descending.

-- Write a query combining INTERSECT and UNION: find departments common to employees and contractors, then union with Finance if not present.

-- Write a query using EXCEPT on full rows: show employee rows (name, city) not matching any contractor rows (name, city).

-- Write a query with ORDER BY and LIMIT on a UNION of Electronics items from products and orders, showing product_name and price/sale_price, limited to 3 lowest prices.

-- Write a complex query: (employees salary > 55000 UNION contractors hourly_rate > 60) EXCEPT (IT department rows), ordered by name.

-- Write a query to find duplicate pay entries across tables using UNION ALL grouped by pay, but only show pays appearing more than once.

-----------------------------------------------------------------
-- Solution
------------------------------------------------------------------

-- Beginner

-- Write a query using UNION ALL to list all names and departments from employees and contractors.

-- Write a query using UNION to combine salaries from employees and hourly_rates from contractors as 'pay', showing only unique pay values.

-- Write a query to list all unique cities from employees and contractors using UNION.

-- Write a query using UNION ALL to show all product_names from products and orders tables.

-- Intermediate

-- Write a query using UNION to list name, department, and pay (salary or hourly_rate aliased) from employees and contractors, sorted by department then name.

-- Write a query to find products that are in both products and orders tables (matching product_name) using INTERSECT.

-- Write a query using EXCEPT to list product_names from products that do not appear in orders.

-- Write a query using UNION ALL to combine all rows from products and orders, then limit to top 5 rows ordered by price/sale_price descending.

-- Write a query to list unique categories from employees/contractors departments and products/orders categories using UNION, ordered alphabetically.

-- Advanced

-- Write a query using subqueries with UNION ALL to list high earners: employees with salary > 60000 or contractors with hourly_rate > 70, ordered by pay descending.

-- Write a query combining INTERSECT and UNION: find departments common to employees and contractors, then union with Finance if not present.

-- Write a query using EXCEPT on full rows: show employee rows (name, city) not matching any contractor rows (name, city).

-- Write a query with ORDER BY and LIMIT on a UNION of Electronics items from products and orders, showing product_name and price/sale_price, limited to 3 lowest prices.

-- Write a complex query: (employees salary > 55000 UNION contractors hourly_rate > 60) EXCEPT (IT department rows), ordered by name.

-- Write a query to find duplicate pay entries across tables using UNION ALL grouped by pay, but only show pays appearing more than once.