-- -- Beginner Level
-- -- These questions require non-correlated subqueries — the inner query runs once and returns a fixed value or list.

-- -- Find the names and salaries of all employees who earn more than the average salary of the entire company.

-- -- List all products whose price is higher than the average price of all products.

-- -- Find the names of all customers who have placed at least one order. Use IN with a subquery. Do not use JOIN.

-- -- Find the names and job titles of all employees who work in the same department as 'Ravi Kumar'. Do not hardcode the department ID.

-- -- List all products that have never been ordered. Use NOT IN with a subquery.

-- -- Find all orders where the total_amount is greater than the maximum total_amount among all orders with the status 'Cancelled'.

-- -- Find the names of employees who were hired after the most recent hire date in the 'HR' department. Do not hardcode the date.

-- Find all employees who earn more than the average salary of their own department. Return emp_name, salary, and dept_id.

-- Find all products whose price is above the average price of products within the same category. Return product_name, price, and category.

-- Find all orders where the total_amount is greater than the average total_amount of all orders placed by that same customer. Return order_id, customer_id, and total_amount.

-- Find all employees whose salary is below the maximum salary within their own department. Return emp_name, salary, and dept_id.

-- Find all employees who were hired after the earliest hire date recorded in their own department. Return emp_name, hire_date, and dept_id.



-- Intermediate
-- Find all customers who have placed more than 2 orders. Return customer_name and country. Do not use GROUP BY in the outer query.

-- Find all customers who have never placed an order with the status 'Cancelled'. Return customer_name.

-- Find all products that have been ordered by more than 2 different customers. Return product_name. Do not use GROUP BY in the outer query.

-- Find all employees who do not manage anyone. Return emp_name and job_title.

-- Find all customers who have placed an order for at least one product in the 'Electronics' category. Return customer_name and city.

-- Find all employees who earn more than at least one employee in the 'Finance' department. Return emp_name and salary.

-- Find all departments where every employee in that department earns more than 60000. Return dept_name.

-- Find all employees who earn more than every single employee in the 'HR' department. Return emp_name, salary, and dept_id.

-- Find all products whose stock quantity is higher than the average stock quantity of products in the same category. Return product_name, stock_qty, and category.

-- Find all orders that were placed by a customer from 'India'. Return order_id, customer_id, and total_amount. Do not use JOIN.

-- Advanced
-- For each employee, display emp_name, salary, and their salary rank within their own department — where rank 1 is the highest salary. Do not use RANK(), DENSE_RANK(), or any other window function.

-- Find the second highest salary in the entire company. Do not eliminate the maximum using LIMIT or TOP in a simple one-step way.

-- For each customer, display customer_name and the total number of orders they have placed. Use a subquery inside the SELECT clause to calculate the count. Do not use JOIN or GROUP BY in the outer query.

-- Find all departments where the total salary paid to all employees in that department is greater than the average total salary paid per department across the entire company.

-- List each product's product_name along with the total revenue it has generated across all orders. Return only those products whose total revenue is above the average revenue across all products. Use a subquery in the FROM clause to build the revenue totals first.

-- Find all employees who were hired before the average hire date of their own department. Return emp_name, hire_date, and dept_id.

-- Find the customer who has spent the most money in total across all their orders. Return only that one customer's name and their total spend. Use a subquery in the FROM clause to calculate per-customer totals first.

-- Find all employees whose salary is the highest in their own department. Return emp_name, salary, and dept_id. Do not use MAX() directly in the outer WHERE clause.


-- --------------------------------------------------------------------------
-- --Solution
-- ---------------------------------------------------------------------------

select * from orders;
select * from products;
select * from customers;
select * from employees;
select * from departments;

-- Beginner Level

-- Find the names and salaries of all employees who earn more than the average salary of the entire company.
select emp_name,salary from employees where salary> (select avg(salary) from employees)


-- List all products whose price is higher than the average price of all products.
select product_name from products where price > (
  select avg(price) from products
)

-- Find the names of all customers who have placed at least one order. Use IN with a subquery. Do not use JOIN.

select customer_name from customers c where c.customer_id in ( select customer_id from orders)


-- Find the names and job titles of all employees who work in the same department as 'Ravi Kumar'. Do not hardcode the department ID.
select emp_name,job_title from employees e where e.dept_id= (
select dept_id from employees where emp_name='Ravi Kumar')


-- List all products that have never been ordered. Use NOT IN with a subquery.
select p.product_name from products p where p.product_id not in (
select product_id from orders)



-- Find all orders where the total_amount is greater than the maximum total_amount among all orders with the status 'Cancelled'.
select * from orders where total_amount >(
select max(total_amount) from orders where status='Cancelled')


-- Find the names of employees who were hired after the most recent hire date in the 'HR' department. Do not hardcode the date.
select emp_name from employees where hire_date > ( 
select max(hire_date) from employees where dept_id=(select dept_id from departments where dept_name='HR'))




-- Find all employees who earn more than the average salary of their own department. Return emp_name, salary, and dept_id.
select e1.emp_name,e1.salary , e1.dept_id from employees e1 where salary>(
select avg(salary) from employees e2 where e1.salary=e2.salary)



-- Find all products whose price is above the average price of products within the same category. Return product_name, price, and category.
select p1.product_name,p1.price ,p1.category from products p1 where p1.price > 
(select avg(price) from products p2 where p2.category=p1.category)



-- Find all orders where the total_amount is greater than the average total_amount of all orders placed by that same customer. Return order_id, customer_id, and total_amount.

select o1.order_id,o1.customer_id,o1.total_amount from orders o1 where o1.total_amount>
(select avg(total_amount) from orders o2 where o2.customer_id=o1.customer_id )


-- Find all employees whose salary is below the maximum salary within their own department. Return emp_name, salary, and dept_id.
select e1.emp_name,e1.salary,e1.dept_id from employees e1 where salary<
(select max(salary) from employees e2 where e2.dept_id=e1.dept_id);

----------------------------------------------------
select * from orders;
select * from products;
select * from customers;
select * from employees;
select * from departments;
----------------------------------------------------
-- Find all employees who were hired after the earliest hire date recorded in their own department. Return emp_name, hire_date, and dept_id.

select e1.emp_name,e1.hire_date,e1.dept_id from employees e1 where e1.hire_date >
(select min(hire_date) from employees e2 where e2.dept_id=e1.dept_id)


-- Intermediate
-- Find all customers who have placed more than 2 orders. Return customer_name and country. Do not use GROUP BY in the outer query.

-- Find all customers who have never placed an order with the status 'Cancelled'. Return customer_name.

-- Find all products that have been ordered by more than 2 different customers. Return product_name. Do not use GROUP BY in the outer query.

-- Find all employees who do not manage anyone. Return emp_name and job_title.

-- Find all customers who have placed an order for at least one product in the 'Electronics' category. Return customer_name and city.

-- Find all employees who earn more than at least one employee in the 'Finance' department. Return emp_name and salary.

-- Find all departments where every employee in that department earns more than 60000. Return dept_name.

-- Find all employees who earn more than every single employee in the 'HR' department. Return emp_name, salary, and dept_id.

-- Find all products whose stock quantity is higher than the average stock quantity of products in the same category. Return product_name, stock_qty, and category.

-- Find all orders that were placed by a customer from 'India'. Return order_id, customer_id, and total_amount. Do not use JOIN.



-- Advanced
-- For each employee, display emp_name, salary, and their salary rank within their own department — where rank 1 is the highest salary. Do not use RANK(), DENSE_RANK(), or any other window function.

-- Find the second highest salary in the entire company. Do not eliminate the maximum using LIMIT or TOP in a simple one-step way.

-- For each customer, display customer_name and the total number of orders they have placed. Use a subquery inside the SELECT clause to calculate the count. Do not use JOIN or GROUP BY in the outer query.

-- Find all departments where the total salary paid to all employees in that department is greater than the average total salary paid per department across the entire company.

-- List each product's product_name along with the total revenue it has generated across all orders. Return only those products whose total revenue is above the average revenue across all products. Use a subquery in the FROM clause to build the revenue totals first.

-- Find all employees who were hired before the average hire date of their own department. Return emp_name, hire_date, and dept_id.

-- Find the customer who has spent the most money in total across all their orders. Return only that one customer's name and their total spend. Use a subquery in the FROM clause to calculate per-customer totals first.

-- Find all employees whose salary is the highest in their own department. Return emp_name, salary, and dept_id. Do not use MAX() directly in the outer WHERE clause.