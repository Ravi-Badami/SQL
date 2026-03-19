-- ANY + Beginner
-- Find employees whose salary exceeds any salary in the HR department

-- Find employees who have received any bonus payments

-- Find employees whose department has any projects assigned

-- Show products whose price is higher than any supplier price

-- List customers who have placed any orders this month

-- ANY + Intermediate
-- Find employees whose salary matches any bonus amount in the salaries table

-- Show departments whose manager_salary exceeds any employee salary

-- Find cities that have employees earning any bonus

-- List managers whose salary equals any employee salary in their department

-- Show employees whose salary exceeds any historical salary_amount

-- ANY + Advanced
-- Find employees whose salary exceeds any manager_salary in other departments

-- Show departments where any employee's salary matches the manager_salary

-- List projects where assigned_emp_id has salary exceeding any other employee

-- Find cities where any employee's salary exceeds the dept manager_salary

-- Show employees whose (salary + bonus) exceeds any historical salary_amount

-- ALL + Beginner
-- Show employees whose salary is less than all IT department manager salaries

-- Find employees earning more than all HR department salaries

-- Show employees older than all new hires (assume hire_date column)

-- List departments with manager_salary higher than all employee minimum salaries

-- Find employees whose salary exceeds all intern salaries (assume intern flag)

-- ALL + Intermediate
-- List employees earning more than every salary_amount recorded in salaries table

-- Show departments whose manager_salary exceeds all Finance manager_salary

-- Find employees whose salary exceeds all salaries in their own city

-- List managers whose salary exceeds all team member salaries

-- Show cities where average salary exceeds all department minimums

-- ALL + Advanced
-- Show employees who earn more than the highest salary in their own department

-- Find employees whose total salary (salary + bonus) exceeds all manager_salaries

-- List projects where assigned employee earns more than all other employees

-- Show departments where every employee salary exceeds company average

-- Find employees whose salary exceeds all salaries of employees hired same year

-- EXISTS + Beginner
-- List employees who belong to departments that have projects assigned

-- Find employees whose city has projects assigned

-- Show employees whose department has manager_salary recorded

-- List employees who appear in the salaries table

-- Find employees assigned to any projects

-- EXISTS + Intermediate
-- Find employees whose city has employees working on projects

-- Show managers whose department has active projects assigned

-- List employees whose department has employees with bonus payments

-- Find cities that have employees with projects but no NULL assignments

-- Show departments that have employees in the salaries table

-- EXISTS + NOT EXISTS + Beginner
-- Identify employees who do not have projects assigned

-- Find employees with no bonus payments recorded

-- Show employees not appearing in salaries table

-- List departments with no projects assigned

-- Find cities with employees but no projects

-- EXISTS + NOT EXISTS + Intermediate
-- Find departments that have no employees working on projects

-- Show cities with employees but no project assignments

-- List employees in departments with no manager_salary

-- Find projects with assigned_emp_id but no matching employee

-- Show employees with salary records but no bonus payments

-- EXISTS + NOT EXISTS + Advanced
-- Identify cities that have employees but no projects assigned to those cities

-- Find departments with manager_salary but no active employee projects

-- Show projects assigned to employees whose city has no other projects

-- List employees whose department exists but has no other employees on projects

-- Find employees with bonuses but whose department has no project assignments





-- ANY + Beginner
-- Find employees whose salary exceeds any salary in the HR department

select * from employees where salary > any (select salary from employees e join departments d on d.dept_id=e.dept_id where
d.dept_name='HR') 


-- Find employees who have received any bonus payments
select * from employees where id = any(
select emp_id from salaries where bonus>0
)




-- ANY + Intermediate
-- Find employees whose salary matches any bonus amount in the salaries table

-- Show departments whose manager_salary exceeds any employee salary

-- Find cities that have employees earning any bonus

-- List managers whose salary equals any employee salary in their department

-- Show employees whose salary exceeds any historical salary_amount

-- ANY + Advanced
-- Find employees whose salary exceeds any manager_salary in other departments

-- Show departments where any employee's salary matches the manager_salary

-- List projects where assigned_emp_id has salary exceeding any other employee

-- Find cities where any employee's salary exceeds the dept manager_salary

-- Show employees whose (salary + bonus) exceeds any historical salary_amount



-- ALL + Beginner
-- Show employees whose salary is less than all IT department manager salaries
explain(analyze)select * from employees where salary < all(
select manager_salary from departments where dept_name='IT')

--more optimized
explain(analyze)select * from employees where salary <(
  select min(manager_salary) from departments where dept_name='IT'
)

-- Find employees earning more than all HR department salaries
select * from employees where salary > all
(select salary from employees e join departments d on e.dept_id=d.dept_id where d.dept_name='HR')

--more optimized
select * from employees where salary > all
(select max(salary) from employees e join departments d on e.dept_id=d.dept_id where d.dept_name='HR')


-- List departments with manager_salary higher than all employee minimum salaries

SELECT d.dept_name, d.manager_salary 
FROM departments d
WHERE d.manager_salary > ALL (
    SELECT MIN(e.salary) 
    FROM employees e 
    GROUP BY e.dept_id
);

-- ALL + Intermediate
-- List employees earning more than every salary_amount recorded in salaries table

-- Show departments whose manager_salary exceeds all Finance manager_salary

-- Find employees whose salary exceeds all salaries in their own city

-- List managers whose salary exceeds all team member salaries

-- Show cities where average salary exceeds all department minimums

-- ALL + Advanced
-- Show employees who earn more than the highest salary in their own department

-- Find employees whose total salary (salary + bonus) exceeds all manager_salaries

-- List projects where assigned employee earns more than all other employees

-- Show departments where every employee salary exceeds company average

-- Find employees whose salary exceeds all salaries of employees hired same year

SELECT * FROM employees;  -- Empty
SELECT * FROM departments;  -- Empty
SELECT * FROM salaries;  -- Empty
SELECT * FROM projects;  -- Empty
-- EXISTS + Beginner

-- Show employees whose department has manager_salary recorded

select * from employees e where exists (
  select 1 from departments d where e.dept_id=d.dept_id and d.manager_salary is not null
)
--BOTH ABOVE AND BELOW QUERY ARE SAME
select * from employees e where exists (
  select * from departments d where e.dept_id=d.dept_id and d.manager_salary is not null
)

-- List employees who appear in the salaries table
select * from employees e where exists (
  select 'ravi' from salaries s where s.emp_id=e.id
)




-- Find employees assigned to any projects

-- EXISTS + Intermediate
-- Find employees whose city has employees working on projects

-- Show managers whose department has active projects assigned

-- List employees whose department has employees with bonus payments

-- Find cities that have employees with projects but no NULL assignments

-- Show departments that have employees in the salaries table

-- EXISTS + NOT EXISTS + Beginner
-- Identify employees who do not have projects assigned

-- Find employees with no bonus payments recorded

-- Show employees not appearing in salaries table

-- List departments with no projects assigned

-- Find cities with employees but no projects

-- EXISTS + NOT EXISTS + Intermediate
-- Find departments that have no employees working on projects

-- Show cities with employees but no project assignments

-- List employees in departments with no manager_salary

-- Find projects with assigned_emp_id but no matching employee

-- Show employees with salary records but no bonus payments

-- EXISTS + NOT EXISTS + Advanced
-- Identify cities that have employees but no projects assigned to those cities

-- Find departments with manager_salary but no active employee projects

-- Show projects assigned to employees whose city has no other projects

-- List employees whose department exists but has no other employees on projects

-- Find employees with bonuses but whose department has no project assignments