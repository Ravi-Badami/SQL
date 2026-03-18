-- ============================================================
--  DROP TABLES (order matters due to foreign keys)
-- ============================================================
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- ============================================================
--  CREATE TABLES
-- ============================================================
CREATE TABLE departments (
    dept_id    INT PRIMARY KEY,
    dept_name  VARCHAR(50),
    location   VARCHAR(50),
    budget     DECIMAL(12, 2)
);

CREATE TABLE employees (
    emp_id     INT PRIMARY KEY,
    emp_name   VARCHAR(50),
    salary     DECIMAL(10, 2),
    dept_id    INT,
    manager_id INT,
    hire_date  DATE,
    job_title  VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE customers (
    customer_id   INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city          VARCHAR(50),
    country       VARCHAR(50),
    join_date     DATE
);

CREATE TABLE products (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(50),
    price        DECIMAL(10, 2),
    category     VARCHAR(50),
    stock_qty    INT
);

CREATE TABLE orders (
    order_id     INT PRIMARY KEY,
    customer_id  INT,
    product_id   INT,
    order_date   DATE,
    quantity     INT,
    total_amount DECIMAL(10, 2),
    status       VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id)  REFERENCES products(product_id)
);

-- ============================================================
--  INSERT DATA
-- ============================================================
INSERT INTO departments VALUES
(1, 'Engineering', 'Bangalore',  1500000.00),
(2, 'Marketing',   'Mumbai',      800000.00),
(3, 'Sales',       'Hyderabad',   900000.00),
(4, 'HR',          'Bangalore',   500000.00),
(5, 'Finance',     'Chennai',    1200000.00);

INSERT INTO employees VALUES
(101, 'Ravi Kumar',    85000.00, 1, NULL, '2019-03-15', 'Senior Engineer'),
(102, 'Priya Sharma',  72000.00, 1, 101,  '2020-07-01', 'Engineer'),
(103, 'Anjali Mehta',  68000.00, 1, 101,  '2021-02-20', 'Engineer'),
(104, 'Deepak Nair',   95000.00, 2, NULL, '2018-11-10', 'Marketing Head'),
(105, 'Sneha Iyer',    61000.00, 2, 104,  '2022-01-15', 'Marketing Analyst'),
(106, 'Arjun Reddy',   78000.00, 3, NULL, '2019-06-25', 'Sales Manager'),
(107, 'Kiran Patil',   54000.00, 3, 106,  '2021-09-10', 'Sales Rep'),
(108, 'Meena Joshi',   51000.00, 3, 106,  '2022-04-05', 'Sales Rep'),
(109, 'Suresh Babu',   90000.00, 4, NULL, '2017-08-30', 'HR Director'),
(110, 'Lakshmi Rao',   62000.00, 4, 109,  '2020-12-01', 'HR Executive'),
(111, 'Vikram Singh', 105000.00, 5, NULL, '2016-05-18', 'Finance Director'),
(112, 'Pooja Gupta',   73000.00, 5, 111,  '2019-10-22', 'Finance Analyst'),
(113, 'Rahul Verma',   58000.00, 5, 111,  '2022-08-14', 'Finance Analyst'),
(114, 'Nisha Pillai',  47000.00, 4, 109,  '2023-03-01', 'HR Intern'),
(115, 'Amit Desai',    66000.00, 2, 104,  '2021-05-19', 'Marketing Analyst');

INSERT INTO customers VALUES
(1, 'Tech Solutions Pvt Ltd', 'Bangalore', 'India',     '2021-01-10'),
(2, 'Global Traders',         'Mumbai',    'India',     '2020-05-22'),
(3, 'Sunrise Retail',         'Delhi',     'India',     '2022-03-15'),
(4, 'Nexus Corp',             'Chennai',   'India',     '2021-09-05'),
(5, 'Alpha Imports',          'Dubai',     'UAE',       '2019-11-30'),
(6, 'Digital Hub',            'Hyderabad', 'India',     '2023-02-14'),
(7, 'Smart Ventures',         'Pune',      'India',     '2022-07-20'),
(8, 'Blue Ocean Ltd',         'Singapore', 'Singapore', '2020-08-10');

INSERT INTO products VALUES
(1, 'Laptop Pro',     75000.00, 'Electronics', 50),
(2, 'Wireless Mouse',  1500.00, 'Accessories', 200),
(3, 'Office Chair',   12000.00, 'Furniture',   30),
(4, 'Standing Desk',  25000.00, 'Furniture',   15),
(5, 'Monitor 27"',    22000.00, 'Electronics', 40),
(6, 'Keyboard Mech',   4500.00, 'Accessories', 150),
(7, 'Webcam HD',       3800.00, 'Electronics', 80),
(8, 'Headphones BT',   8500.00, 'Electronics', 60);

INSERT INTO orders VALUES
(1001, 1, 1, '2023-01-15', 2,  150000.00, 'Delivered'),
(1002, 1, 5, '2023-02-10', 3,   66000.00, 'Delivered'),
(1003, 2, 2, '2023-01-20', 10,  15000.00, 'Delivered'),
(1004, 2, 6, '2023-03-05', 5,   22500.00, 'Delivered'),
(1005, 3, 3, '2023-04-12', 4,   48000.00, 'Delivered'),
(1006, 3, 4, '2023-04-25', 2,   50000.00, 'Pending'),
(1007, 4, 1, '2023-05-01', 1,   75000.00, 'Delivered'),
(1008, 4, 7, '2023-05-18', 5,   19000.00, 'Delivered'),
(1009, 5, 8, '2023-06-10', 3,   25500.00, 'Cancelled'),
(1010, 5, 5, '2023-06-22', 2,   44000.00, 'Delivered'),
(1011, 6, 2, '2023-07-08', 20,  30000.00, 'Delivered'),
(1012, 6, 6, '2023-07-20', 8,   36000.00, 'Pending'),
(1013, 7, 1, '2023-08-05', 3,  225000.00, 'Delivered'),
(1014, 7, 3, '2023-08-19', 2,   24000.00, 'Delivered'),
(1015, 1, 8, '2023-09-01', 4,   34000.00, 'Delivered'),
(1016, 2, 1, '2023-09-15', 1,   75000.00, 'Pending'),
(1017, 4, 5, '2023-10-05', 2,   44000.00, 'Delivered'),
(1018, 8, 4, '2023-10-20', 1,   25000.00, 'Delivered'),
(1019, 8, 7, '2023-11-02', 3,   11400.00, 'Delivered'),
(1020, 3, 8, '2023-11-25', 1,    8500.00, 'Cancelled');
