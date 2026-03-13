-- drop table if exists employees;

-- CREATE TABLE employees (
--     emp_id INT PRIMARY KEY,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     email VARCHAR(100),
--     phone VARCHAR(15),
--     hire_date DATE,
--     job_title VARCHAR(50),
--     department VARCHAR(50),
--     salary DECIMAL(10,2),
--     is_active BOOLEAN,
--     age INT
-- );

-- INSERT INTO employees 
-- (emp_id, first_name, last_name, email, phone, hire_date, job_title, department, salary, is_active, age) VALUES
-- (1, 'John', 'Doe', 'john.doe@example.com', '9876543210', '2022-01-15', 'Software Engineer', 'IT', 60000.00, TRUE, 28),
-- (2, 'Jane', 'Smith', 'jane.smith@example.com', '9876543211', '2021-03-10', 'Data Analyst', 'Analytics', 55000.00, TRUE, 30),
-- (3, 'Michael', 'Brown', 'michael.brown@example.com', '9876543212', '2020-07-21', 'Project Manager', 'Management', 75000.00, TRUE, 35),
-- (4, 'Emily', 'Davis', 'emily.davis@example.com', '9876543213', '2023-02-11', 'HR Executive', 'HR', 48000.00, TRUE, 27),
-- (5, 'David', 'Wilson', 'david.wilson@example.com', '9876543214', '2019-11-05', 'DevOps Engineer', 'IT', 70000.00, TRUE, 33),
-- (6, 'Sarah', 'Taylor', 'sarah.taylor@example.com', '9876543215', '2021-08-19', 'UI Designer', 'Design', 52000.00, TRUE, 29),
-- (7, 'Daniel', 'Anderson', 'daniel.anderson@example.com', '9876543216', '2020-12-01', 'QA Engineer', 'Testing', 50000.00, TRUE, 31),
-- (8, 'Olivia', 'Thomas', 'olivia.thomas@example.com', '9876543217', '2022-06-14', 'Business Analyst', 'Business', 58000.00, TRUE, 28),
-- (9, 'Matthew', 'Jackson', 'matthew.jackson@example.com', '9876543218', '2018-09-23', 'System Admin', 'IT', 65000.00, TRUE, 36),
-- (10, 'Sophia', 'White', 'sophia.white@example.com', '9876543219', '2023-01-09', 'Content Writer', 'Marketing', 42000.00, TRUE, 26),
-- (11, 'James', 'Harris', 'james.harris@example.com', '9876543220', '2021-04-12', 'Backend Developer', 'IT', 55000.00, TRUE, 32),
-- (12, 'Ava', 'Martin', 'ava.martin@example.com', '9876543221', '2022-10-03', 'Frontend Developer', 'IT', 64000.00, TRUE, 27),
-- (13, 'Benjamin', 'Thompson', 'benjamin.thompson@example.com', '9876543222', '2019-05-17', 'Network Engineer', 'IT', 62000.00, TRUE, 34),
-- (14, 'Isabella', 'Garcia', 'isabella.garcia@example.com', '9876543223', '2020-02-25', 'Product Manager', 'Product', 80000.00, TRUE, 35),
-- (15, 'Lucas', 'Martinez', 'lucas.martinez@example.com', '9876543224', '2021-09-30', 'Security Analyst', 'Security', 67000.00, TRUE, 30),
-- (16, 'Mia', 'Robinson', 'mia.robinson@example.com', '9876543225', '2022-11-20', 'Support Engineer', 'Support', 45000.00, TRUE, 25),
-- (17, 'Henry', 'Clark', 'henry.clark@example.com', '9876543226', '2018-03-14', 'Technical Lead', 'IT', 90000.00, TRUE, 38),
-- (18, 'Charlotte', 'Rodriguez', 'charlotte.rodriguez@example.com', '9876543227', '2023-04-05', 'Marketing Specialist', 'Marketing', 47000.00, TRUE, 26),
-- (19, 'Alexander', 'Lewis', 'alexander.lewis@example.com', '9876543228', '2020-06-18', 'Database Admin', 'IT', 72000.00, TRUE, 34),
-- (20, 'Amelia', 'Lee', 'amelia.lee@example.com', '9876543229', '2021-12-08', 'Recruiter', 'HR', 46000.00, TRUE, 29);

select salary from employees order by salary desc;

select last_name , salary from employees;

explain(ANALYZE)select salary from employees e1 where 3 in (select count(distinct salary)from employees e2 where e2.salary>=e1.salary );

explain(ANALYZE)select salary from employees order by salary desc offset 2 limit 1;


-- select the salary of the employee whose salary is equal to employee name Smith;

explain(ANALYZE)select last_name,salary from employees where salary = (select salary from employees where last_name='Smith') and last_name!='Smith';

EXPLAIN (ANALYZE)
SELECT e1.last_name, e1.salary
FROM employees e1
JOIN employees e2 ON e1.salary = e2.salary
WHERE e2.last_name = 'Smith'
AND e1.last_name != 'Smith';


EXPLAIN (ANALYZE)
WITH smith_salary AS (
    SELECT salary FROM employees WHERE last_name = 'Smith'
)
SELECT last_name, salary
FROM employees
WHERE salary = (SELECT salary FROM smith_salary)
AND last_name != 'Smith';



EXPLAIN (ANALYZE)select * from  employees;


-- Safe for one OR multiple Smiths
select last_name, salary
from employees
where salary IN (select salary from employees where last_name = 'Smith');


SELECT * FROM employees
WHERE MOD(id, 2) = 1;
