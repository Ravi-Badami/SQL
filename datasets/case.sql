Drop table if exists employees;

-- Create table
CREATE TABLE employees (
    emp_id    SERIAL PRIMARY KEY,
    name      TEXT NOT NULL,
    dept      TEXT,
    city      TEXT,
    salary    NUMERIC,
    age       INT,
    is_active BOOLEAN,
    phone     TEXT,
    join_year INT
);

-- Insert data
INSERT INTO employees (name, dept, city, salary, age, is_active, phone, join_year) VALUES
('Ravi Kumar',    'IT',      'Bengaluru', 95000,  32, TRUE,  '9876543210', 2019),
('Priya Sharma',  'HR',      'Mumbai',    45000,  27, TRUE,  '9845001234', 2021),
('Arjun Mehta',   'Finance', 'Delhi',     130000, 45, TRUE,  NULL,         2015),
('Sneha Rao',     'IT',      'Bengaluru', 72000,  29, FALSE, '9900112233', 2020),
('Kiran Patil',   'IT',      'Pune',      62000,  35, TRUE,  '9711223344', 2018),
('Deepa Nair',    'HR',      'Bengaluru', 41000,  24, TRUE,  NULL,         2023),
('Ramesh Gupta',  'Finance', 'Delhi',     155000, 50, FALSE, '9600445566', 2010),
('Anita Joshi',   'Sales',   'Mumbai',    38000,  26, TRUE,  '9512334455', 2022),
('Suresh Babu',   'Sales',   'Chennai',   27000,  22, TRUE,  NULL,         2024),
('Kavya Singh',   'IT',      'Pune',      88000,  31, FALSE, '9433221100', 2017),
('Manish Tiwari', 'Finance', 'Mumbai',    115000, 40, TRUE,  '9344556677', 2016),
('Pooja Verma',   'HR',      'Chennai',   52000,  33, TRUE,  NULL,         2020),
('Nikhil Das',    'Sales',   'Bengaluru', 33000,  25, FALSE, '9255667788', 2023),
('Shalini Menon', 'IT',      'Chennai',   105000, 38, TRUE,  '9166778899', 2014),
('Tarun Bose',    'Sales',   'Delhi',     29000,  23, TRUE,  '9077889900', 2024);
