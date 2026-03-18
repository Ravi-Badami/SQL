

-- Beginner Questions
-- Q1. Write a CTE named high_salary_employees that selects all employees with a salary greater than 80,000. From this CTE, retrieve the emp_name, job_title, and salary.

-- Q2. Write a CTE named delivered_orders that contains all orders with status = 'Delivered'. Use this CTE to find the total number of delivered orders and the total revenue from them.

-- Q3. Write a CTE that lists all products in the 'Electronics' category. Then query the CTE to show only products with a unit_price above 5,000, ordered by unit_price descending.

-- Q4. Write a CTE named dept_employee_count that calculates the total number of employees in each department. Then retrieve only departments that have more than 3 employees.

-- Q5. Write a CTE named corporate_customers that filters customers where segment = 'Corporate'. From this CTE, retrieve customer_name, city, and join_date ordered by join_date ascending.

-- Q6. Write a CTE that calculates the average salary of all employees. Then use this CTE to display all employees whose salary is above the average.

-- Q7. Write a CTE named recent_orders that contains all orders placed in the year 2024. Display the order_id, customer_id, order_date, and total_amount.

-- Intermediate Questions
-- Q8. Write two CTEs: one named total_orders_per_customer that counts orders per customer, and another named total_spend_per_customer that sums total_amount per customer. Join both CTEs together and display customer_name, total orders placed, and total amount spent.

-- Q9. Write a CTE that computes the total revenue per product (quantity × unit_price, ignoring discount) from order_items. Then join the result with the products table to display product_name, category, and total_revenue. Order by total_revenue descending.

-- Q10. Write a CTE named dept_avg_salary that calculates the average salary per department. Use this CTE to find employees who earn more than their own department's average salary. Display emp_name, dept_id, salary, and dept_avg_salary.

-- Q11. Write two CTEs: one to calculate total revenue per customer from delivered orders only, and a second to rank customers by their total revenue using RANK(). Display customer_name, total_revenue, and their rank.

-- Q12. Write a CTE that identifies all products that have never appeared in any order_items record. Display product_id, product_name, and category.

-- Q13. Write two CTEs: one that calculates total revenue per month (from orders), and a second that computes the running total of monthly revenue ordered by month. Display the month, monthly_revenue, and running_total.

-- Q14. Write a CTE that labels each order with a category: 'High' if total_amount > 200,000, 'Medium' if between 50,000 and 200,000, and 'Low' if below 50,000. Count how many orders fall into each category.

-- Q15. Using a CTE, find the top 3 highest-paying departments based on total salary expenditure. Display dept_name, total_salary, and a column showing what percentage of the company's total salary that department accounts for.

-- Advanced Questions
-- Q16. Write a recursive CTE to traverse the employee hierarchy starting from the top-level employees (those with manager_id IS NULL). Display each employee's emp_name, their manager's emp_name, and their level in the hierarchy (1 = top).

-- Q17. Write a recursive CTE to find the full reporting chain for the employee named 'Rohit Gupta' — starting from Rohit and going all the way up to the top of the organization. Display each person's emp_name and level in the chain.

-- Q18. Write a CTE that calculates, for each customer, the number of days between their first order and their most recent order. Then classify them as 'New' (0–90 days), 'Growing' (91–365 days), or 'Loyal' (365+ days). Display customer_name, first_order_date, latest_order_date, and customer_type.

-- Q19. Write multiple CTEs to solve this: First compute total items sold per product. Then rank products within each category by items sold using DENSE_RANK(). Finally, retrieve only the top-ranked product in each category.

-- Q20. Write a CTE that calculates month-over-month revenue growth percentage for each month in 2023. Display the month, current month revenue, previous month revenue, and the growth percentage. Months with no previous month should show NULL for growth.

-- Q21. Write a recursive CTE to count the total number of employees under each top-level manager (directly and indirectly — all levels). Display the manager's emp_name and their total_reportees count.

-- Q22. Write a CTE-based query to find customers who placed orders in both the first half of 2023 (Jan–Jun) and the second half of 2023 (Jul–Dec). Display the customer_name, number of orders in H1, and number of orders in H2.

-- Q23. Write a CTE that assigns a row number to each order per customer ordered by order_date. Then use this to find each customer's second order (if it exists). Display customer_name, order_id, and order_date of the second order.

-- Q24. A product is considered "slow-moving" if its total quantity sold across all orders is less than 10 units. Write a CTE to identify slow-moving products and display product_name, category, stock_qty, and total_units_sold.

-- Q25. Write a CTE that calculates, for each department, the salary gap between the highest-paid and the lowest-paid employee. Then rank the departments by this salary gap from largest to smallest. Display dept_name, max_salary, min_salary, salary_gap, and gap_rank.



----------------------------------------
-- Solution
----------------------------------------




-- Beginner Questions
-- Q1. Write a CTE named high_salary_employees that selects all employees with a salary greater than 80,000. From this CTE, retrieve the emp_name, job_title, and salary.
with high_salary_employees as (
select * from employees where salary>80000
)
select emp_name,job_title,salary from high_salary_employees;

-- Q2. Write a CTE named delivered_orders that contains all orders with status = 'Delivered'. Use this CTE to find the total number of delivered orders and the total revenue from them.
with delivered_orders as (
select * from orders where status='Delivered'
)
select count(*) as total_delivered , sum(total_amount) as total_revenue from delivered_orders;

-- Q3. Write a CTE that lists all products in the 'Electronics' category. Then query the CTE to show only products with a unit_price above 5,000, ordered by unit_price descending.
with electronic_category as (
select * from products where category='Electronics'
)select product_name,unit_price from electronic_category where unit_price>5000 order by unit_price desc;


-- Q4. Write a CTE named dept_employee_count that calculates the total number of employees in each department. Then retrieve only departments that have more than 3 employees.
WITH dept_employee_count AS (
    SELECT 
        d.dept_name,
        COUNT(*) AS emp_count
    FROM employees e 
    JOIN departments d ON d.dept_id = e.dept_id
    GROUP BY d.dept_name
)
SELECT dept_name ,emp_count
FROM dept_employee_count 
WHERE emp_count > 3;


-- Q5. Write a CTE named corporate_customers that filters customers where segment = 'Corporate'. From this CTE, retrieve customer_name, city, and join_date ordered by join_date ascending.
with corporate_customers as(

select * from customers where segment='Corporate'

)
select customer_name,city,join_date from corporate_customers order by join_date;



-- Q6. Write a CTE that calculates the average salary of all employees. Then use this CTE to display all employees whose salary is above the average.
with avg_salary as(
  select avg(salary) avg_sal from employees
)
select * from employees e where e.salary>(SELECT avg_sal from avg_salary)



SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM order_items;


-- Q7. Write a CTE named recent_orders that contains all orders placed in the year 2024. Display the order_id, customer_id, order_date, and total_amount.
with recent_orders as(

select * from orders where EXTRACT(YEAR FROM order_date) = 2024
)
select order_id,customer_id,order_date,total_amount from recent_orders;


-- Intermediate Questions
-- Q8. Write two CTEs: one named total_orders_per_customer that counts orders per customer, and another named total_spend_per_customer that sums total_amount per customer. Join both CTEs together and display customer_name, total orders placed, and total amount spent.

-- Q9. Write a CTE that computes the total revenue per product (quantity × unit_price, ignoring discount) from order_items. Then join the result with the products table to display product_name, category, and total_revenue. Order by total_revenue descending.

-- Q10. Write a CTE named dept_avg_salary that calculates the average salary per department. Use this CTE to find employees who earn more than their own department's average salary. Display emp_name, dept_id, salary, and dept_avg_salary.

-- Q11. Write two CTEs: one to calculate total revenue per customer from delivered orders only, and a second to rank customers by their total revenue using RANK(). Display customer_name, total_revenue, and their rank.

-- Q12. Write a CTE that identifies all products that have never appeared in any order_items record. Display product_id, product_name, and category.

-- Q13. Write two CTEs: one that calculates total revenue per month (from orders), and a second that computes the running total of monthly revenue ordered by month. Display the month, monthly_revenue, and running_total.

-- Q14. Write a CTE that labels each order with a category: 'High' if total_amount > 200,000, 'Medium' if between 50,000 and 200,000, and 'Low' if below 50,000. Count how many orders fall into each category.

-- Q15. Using a CTE, find the top 3 highest-paying departments based on total salary expenditure. Display dept_name, total_salary, and a column showing what percentage of the company's total salary that department accounts for.

-- Advanced Questions
-- Q16. Write a recursive CTE to traverse the employee hierarchy starting from the top-level employees (those with manager_id IS NULL). Display each employee's emp_name, their manager's emp_name, and their level in the hierarchy (1 = top).

-- Q17. Write a recursive CTE to find the full reporting chain for the employee named 'Rohit Gupta' — starting from Rohit and going all the way up to the top of the organization. Display each person's emp_name and level in the chain.

-- Q18. Write a CTE that calculates, for each customer, the number of days between their first order and their most recent order. Then classify them as 'New' (0–90 days), 'Growing' (91–365 days), or 'Loyal' (365+ days). Display customer_name, first_order_date, latest_order_date, and customer_type.

-- Q19. Write multiple CTEs to solve this: First compute total items sold per product. Then rank products within each category by items sold using DENSE_RANK(). Finally, retrieve only the top-ranked product in each category.

-- Q20. Write a CTE that calculates month-over-month revenue growth percentage for each month in 2023. Display the month, current month revenue, previous month revenue, and the growth percentage. Months with no previous month should show NULL for growth.

-- Q21. Write a recursive CTE to count the total number of employees under each top-level manager (directly and indirectly — all levels). Display the manager's emp_name and their total_reportees count.

-- Q22. Write a CTE-based query to find customers who placed orders in both the first half of 2023 (Jan–Jun) and the second half of 2023 (Jul–Dec). Display the customer_name, number of orders in H1, and number of orders in H2.

-- Q23. Write a CTE that assigns a row number to each order per customer ordered by order_date. Then use this to find each customer's second order (if it exists). Display customer_name, order_id, and order_date of the second order.

-- Q24. A product is considered "slow-moving" if its total quantity sold across all orders is less than 10 units. Write a CTE to identify slow-moving products and display product_name, category, stock_qty, and total_units_sold.

-- Q25. Write a CTE that calculates, for each department, the salary gap between the highest-paid and the lowest-paid employee. Then rank the departments by this salary gap from largest to smallest. Display dept_name, max_salary, min_salary, salary_gap, and gap_rank.