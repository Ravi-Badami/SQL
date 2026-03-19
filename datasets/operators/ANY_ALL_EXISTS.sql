-- Dataset Inspection (Run first - guaranteed ANY/ALL/EXISTS results)
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS projects;


CREATE TABLE employees (
    id INTEGER,
    name TEXT,
    salary NUMERIC,
    dept_id INTEGER,
    city TEXT
);

CREATE TABLE departments (
    dept_id INTEGER,
    dept_name TEXT,
    manager_salary NUMERIC
);

CREATE TABLE salaries (
    emp_id INTEGER,
    salary_amount NUMERIC,
    bonus NUMERIC
);

CREATE TABLE projects (
    proj_id INTEGER,
    proj_name TEXT,
    assigned_emp_id INTEGER
);

-- employees data
INSERT INTO employees VALUES
(1, 'Alice', 55000, 10, 'NYC'),
(2, 'Bob', 65000, 20, 'Boston'),
(3, 'Charlie', 52000, 10, 'NYC'),
(4, 'Diana', 70000, 20, 'Boston'),
(5, 'Eve', 60000, 30, 'Chicago'),
(6, 'Frank', 58000, 10, 'NYC');

-- departments data
INSERT INTO departments VALUES
(10, 'HR', 50000),
(20, 'IT', 60000),
(30, 'Finance', 55000),
(40, 'Marketing', 45000);

-- salaries data (historical salaries)
INSERT INTO salaries VALUES
(1, 50000, 5000),
(2, 60000, 8000),
(3, 48000, 4000),
(4, 70000, 10000),
(5, 55000, 6000);

-- projects data
INSERT INTO projects VALUES
(101, 'Payroll System', 1),
(102, 'Website Redesign', 2),
(103, 'Budget Analysis', 5),
(104, 'Marketing Campaign', NULL);
