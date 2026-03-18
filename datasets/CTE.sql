-- =============================================
-- TABLE 1: DEPARTMENTS
-- =============================================
DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS departments CASCADE;



CREATE TABLE departments (
    dept_id     INT PRIMARY KEY,
    dept_name   VARCHAR(50),
    location    VARCHAR(50),
    budget      DECIMAL(12, 2)
);

INSERT INTO departments VALUES
(1,  'Engineering',  'Bangalore',  1500000.00),
(2,  'Sales',        'Mumbai',      900000.00),
(3,  'HR',           'Delhi',       500000.00),
(4,  'Finance',      'Pune',        750000.00),
(5,  'Marketing',    'Hyderabad',   600000.00),
(6,  'Support',      'Chennai',     400000.00);



-- =============================================
-- TABLE 2: EMPLOYEES
-- =============================================

CREATE TABLE employees (
    emp_id      INT PRIMARY KEY,
    emp_name    VARCHAR(100),
    dept_id     INT,
    manager_id  INT NULL,
    salary      DECIMAL(10, 2),
    hire_date   DATE,
    job_title   VARCHAR(100)
);

INSERT INTO employees VALUES
(1,  'Arjun Mehta',    1, NULL, 200000.00, '2015-03-01', 'CTO'),
(2,  'Priya Sharma',   2, NULL, 190000.00, '2014-07-15', 'VP Sales'),
(3,  'Ravi Kumar',     3, NULL, 170000.00, '2016-01-10', 'HR Director'),
(4,  'Sneha Patel',    4, NULL, 180000.00, '2013-05-20', 'CFO'),
(5,  'Amit Joshi',     1,    1,  95000.00, '2018-08-01', 'Senior Engineer'),
(6,  'Neha Singh',     1,    1,  88000.00, '2019-02-14', 'Senior Engineer'),
(7,  'Karan Verma',    2,    2,  72000.00, '2020-06-10', 'Sales Manager'),
(8,  'Divya Rao',      2,    2,  68000.00, '2021-01-05', 'Sales Executive'),
(9,  'Suresh Nair',    3,    3,  55000.00, '2019-09-20', 'HR Manager'),
(10, 'Anjali Das',     4,    4,  85000.00, '2017-11-30', 'Finance Manager'),
(11, 'Rohit Gupta',    1,    5,  62000.00, '2021-03-15', 'Engineer'),
(12, 'Pooja Iyer',     1,    5,  58000.00, '2022-07-01', 'Engineer'),
(13, 'Vikram Bose',    2,    7,  45000.00, '2022-04-18', 'Sales Executive'),
(14, 'Meena Pillai',   5, NULL, 160000.00, '2015-10-05', 'Marketing Head'),
(15, 'Sanjay Tiwari',  5,   14,  70000.00, '2019-12-01', 'Marketing Manager'),
(16, 'Ritika Saxena',  6, NULL, 150000.00, '2016-06-20', 'Support Head'),
(17, 'Deepak Shah',    6,   16,  52000.00, '2020-08-25', 'Support Lead'),
(18, 'Kavya Reddy',    1,    6,  60000.00, '2022-01-10', 'Junior Engineer'),
(19, 'Harish Menon',   4,   10,  64000.00, '2020-03-08', 'Finance Analyst'),
(20, 'Tanya Khanna',   3,    9,  42000.00, '2023-05-14', 'HR Executive');



-- =============================================
-- TABLE 3: PRODUCTS
-- ============================================

CREATE TABLE products (
    product_id    INT PRIMARY KEY,
    product_name  VARCHAR(100),
    category      VARCHAR(50),
    unit_price    DECIMAL(10, 2),
    stock_qty     INT
);

INSERT INTO products VALUES
(1,  'Laptop Pro',       'Electronics',  85000.00, 50),
(2,  'Wireless Mouse',   'Electronics',   1200.00, 200),
(3,  'Office Chair',     'Furniture',    12000.00, 80),
(4,  'Standing Desk',    'Furniture',    25000.00, 30),
(5,  'Notebook Pack',    'Stationery',     500.00, 500),
(6,  'USB Hub',          'Electronics',   2500.00, 150),
(7,  'Monitor 27"',      'Electronics',  22000.00, 60),
(8,  'Keyboard',         'Electronics',   3500.00, 120),
(9,  'Desk Lamp',        'Furniture',     1800.00, 100),
(10, 'Pen Stand',        'Stationery',     300.00, 400),
(11, 'Webcam HD',        'Electronics',   5500.00, 75),
(12, 'Headphones',       'Electronics',   8000.00, 90),
(13, 'Whiteboard',       'Stationery',    4500.00, 40),
(14, 'Ergonomic Mouse',  'Electronics',   3200.00, 110),
(15, 'Printer',          'Electronics',  18000.00, 25);




-- =============================================
-- TABLE 4: CUSTOMERS
-- =============================================

CREATE TABLE customers (
    customer_id    INT PRIMARY KEY,
    customer_name  VARCHAR(100),
    city           VARCHAR(50),
    segment        VARCHAR(30),
    join_date      DATE
);

INSERT INTO customers VALUES
(1,  'Infosys Ltd',        'Bangalore',  'Corporate', '2018-01-15'),
(2,  'TCS Group',          'Mumbai',     'Corporate', '2017-06-20'),
(3,  'Raj Traders',        'Delhi',      'SMB',       '2019-03-10'),
(4,  'Sunita Stores',      'Pune',       'SMB',       '2020-08-05'),
(5,  'Alpha Solutions',    'Hyderabad',  'Corporate', '2016-11-30'),
(6,  'NextGen Tech',       'Chennai',    'Startup',   '2021-02-14'),
(7,  'Blue Star Pvt Ltd',  'Kolkata',    'Corporate', '2018-09-22'),
(8,  'Meera Enterprises',  'Jaipur',     'SMB',       '2022-04-01'),
(9,  'Zeta Corp',          'Nagpur',     'Startup',   '2021-07-19'),
(10, 'Bright Futures',     'Lucknow',    'SMB',       '2023-01-08');




-- =============================================
-- TABLE 5: ORDERS
-- =============================================

CREATE TABLE orders (
    order_id     INT PRIMARY KEY,
    customer_id  INT,
    order_date   DATE,
    status       VARCHAR(20),
    total_amount DECIMAL(12, 2)
);

INSERT INTO orders VALUES
(1001, 1,  '2023-01-10', 'Delivered',  255000.00),
(1002, 2,  '2023-01-22', 'Delivered',   87500.00),
(1003, 3,  '2023-02-05', 'Cancelled',   15000.00),
(1004, 1,  '2023-02-18', 'Delivered',  110000.00),
(1005, 5,  '2023-03-01', 'Delivered',  340000.00),
(1006, 4,  '2023-03-15', 'Pending',     22000.00),
(1007, 2,  '2023-04-02', 'Delivered',   96000.00),
(1008, 6,  '2023-04-20', 'Delivered',   47500.00),
(1009, 1,  '2023-05-05', 'Delivered',  190000.00),
(1010, 7,  '2023-05-18', 'Cancelled',   32000.00),
(1011, 3,  '2023-06-01', 'Delivered',   28000.00),
(1012, 5,  '2023-06-14', 'Delivered',  415000.00),
(1013, 8,  '2023-07-02', 'Pending',     11500.00),
(1014, 9,  '2023-07-20', 'Delivered',   63000.00),
(1015, 2,  '2023-08-05', 'Delivered',  145000.00),
(1016, 10, '2023-08-22', 'Delivered',   38000.00),
(1017, 1,  '2023-09-10', 'Delivered',  210000.00),
(1018, 6,  '2023-09-28', 'Cancelled',   19000.00),
(1019, 5,  '2023-10-12', 'Delivered',  275000.00),
(1020, 7,  '2023-11-01', 'Delivered',  124000.00),
(1021, 3,  '2023-11-18', 'Delivered',   55000.00),
(1022, 4,  '2023-12-03', 'Delivered',   88000.00),
(1023, 9,  '2023-12-20', 'Pending',     42000.00),
(1024, 2,  '2024-01-08', 'Delivered',  320000.00),
(1025, 1,  '2024-01-25', 'Delivered',  175000.00);



-- =============================================
-- TABLE 6: ORDER_ITEMS
-- =============================================

CREATE TABLE order_items (
    item_id     INT PRIMARY KEY,
    order_id    INT,
    product_id  INT,
    quantity    INT,
    unit_price  DECIMAL(10, 2),
    discount    DECIMAL(5, 2)
);

INSERT INTO order_items VALUES
(1,  1001, 1,  3,  85000.00, 0.00),
(2,  1001, 7,  0,  22000.00, 0.00),
(3,  1002, 8,  5,   3500.00, 5.00),
(4,  1002, 2,  10,  1200.00, 0.00),
(5,  1003, 5,  30,   500.00, 0.00),
(6,  1004, 11, 2,   5500.00, 0.00),
(7,  1004, 12, 4,   8000.00, 10.00),
(8,  1005, 1,  4,  85000.00, 0.00),
(9,  1006, 3,  1,  12000.00, 0.00),
(10, 1006, 9,  2,   1800.00, 0.00),
(11, 1007, 7,  3,  22000.00, 5.00),
(12, 1007, 8,  4,   3500.00, 0.00),
(13, 1008, 2,  15,  1200.00, 5.00),
(14, 1008, 6,  8,   2500.00, 0.00),
(15, 1009, 15, 10, 18000.00, 0.00),
(16, 1010, 4,  1,  25000.00, 0.00),
(17, 1011, 5,  20,   500.00, 0.00),
(18, 1011, 10, 50,   300.00, 0.00),
(19, 1012, 1,  5,  85000.00, 0.00),
(20, 1013, 10, 20,   300.00, 0.00),
(21, 1013, 5,  15,   500.00, 0.00),
(22, 1014, 12, 5,   8000.00, 10.00),
(23, 1015, 7,  4,  22000.00, 0.00),
(24, 1015, 6,  6,   2500.00, 5.00),
(25, 1016, 13, 5,   4500.00, 0.00),
(26, 1017, 1,  2,  85000.00, 0.00),
(27, 1017, 14, 6,   3200.00, 0.00),
(28, 1018, 2,  10,  1200.00, 0.00),
(29, 1019, 1,  3,  85000.00, 0.00),
(30, 1020, 7,  3,  22000.00, 5.00),
(31, 1020, 8,  5,   3500.00, 0.00),
(32, 1021, 3,  2,  12000.00, 0.00),
(33, 1021, 9,  5,   1800.00, 0.00),
(34, 1022, 12, 6,   8000.00, 0.00),
(35, 1022, 11, 4,   5500.00, 0.00),
(36, 1023, 5,  30,   500.00, 0.00),
(37, 1023, 13, 4,   4500.00, 0.00),
(38, 1024, 1,  4,  85000.00, 0.00),
(39, 1025, 7,  2,  22000.00, 0.00),
(40, 1025, 2,  5,   1200.00, 0.00);


