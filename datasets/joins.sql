

DROP TABLE IF EXISTS employee_projects;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS locations;

-- ALTER TABLE employees         SET SCHEMA joins;
-- ALTER TABLE departments       SET SCHEMA joins;
-- ALTER TABLE locations         SET SCHEMA joins;
-- ALTER TABLE projects          SET SCHEMA joins;
-- ALTER TABLE employee_projects SET SCHEMA joins;



-- create schema joins;






CREATE TABLE locations (
    location_id   INT PRIMARY KEY,
    city          VARCHAR(50),
    country       VARCHAR(50)
);

INSERT INTO locations VALUES
(1, 'Bangalore', 'India'),
(2, 'Mumbai',    'India'),
(3, 'New York',  'USA'),
(4, 'London',    'UK'),
(5, 'Berlin',    'Germany');


CREATE TABLE departments (
    department_id   INT PRIMARY KEY,
    department_name VARCHAR(50),
    location_id     INT
);

INSERT INTO departments VALUES
(10, 'Engineering', 1),
(20, 'Marketing',   2),
(30, 'HR',          3),
(40, 'Finance',     4),
(50, 'Legal',       5),
(60, 'R&D',         NULL);  -- R&D has no location assigned

CREATE TABLE employees (
    employee_id   INT PRIMARY KEY,
    name          VARCHAR(50),
    department_id INT,
    manager_id    INT,
    salary        INT
);

INSERT INTO employees VALUES
(1,  'Alice',   10,   NULL, 90000),  -- Alice is the top-level manager
(2,  'Bob',     10,   1,    75000),
(3,  'Charlie', 20,   1,    65000),
(4,  'Diana',   30,   1,    70000),
(5,  'Eve',     10,   2,    60000),
(6,  'Frank',   20,   3,    55000),
(7,  'Grace',   40,   4,    80000),
(8,  'Henry',   NULL, 1,    50000),  -- Henry has no department
(9,  'Ivy',     NULL, 2,    45000),  -- Ivy has no department
(10, 'Jack',    50,   4,    72000);

CREATE TABLE projects (
    project_id    INT PRIMARY KEY,
    project_name  VARCHAR(50),
    department_id INT
);

INSERT INTO projects VALUES
(1, 'Alpha',   10),
(2, 'Beta',    20),
(3, 'Gamma',   10),
(4, 'Delta',   30),
(5, 'Epsilon', 60),   -- belongs to R&D (no employees in R&D)
(6, 'Zeta',    NULL), -- no department assigned
(7, 'Eta',     40);

CREATE TABLE employee_projects (
    employee_id INT,
    project_id  INT,
    role        VARCHAR(30),
    PRIMARY KEY (employee_id, project_id)
);

INSERT INTO employee_projects VALUES
(1, 1, 'Lead'),
(2, 1, 'Developer'),
(2, 3, 'Lead'),
(3, 2, 'Lead'),
(4, 4, 'Lead'),
(5, 1, 'Developer'),
(5, 3, 'Developer'),
(6, 2, 'Developer'),
(7, 7, 'Lead');
-- Jack (10), Henry (8), and Ivy (9) are NOT assigned to any project
