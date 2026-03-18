-- Dataset Inspection (Run this first to drop existing tables if any and verify empty state)
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS contractors;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS inventory;


-- Create tables
CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    location VARCHAR(30)
);

CREATE TABLE contractors (
    con_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    rate DECIMAL(8,2),
    location VARCHAR(30)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(8,2)
);

CREATE TABLE customers (
    cust_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    order_date DATE
);

CREATE TABLE inventory (
    inv_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    warehouse VARCHAR(30),
    stock_quantity INTEGER
);

-- Insert data into employees
INSERT INTO employees (name, department, salary, location) VALUES
('Alice Johnson', 'HR', 55000.00, 'New York'),
('Bob Smith', 'IT', 65000.00, 'Boston'),
('Charlie Brown', 'HR', 52000.00, 'New York'),
('Diana Prince', 'IT', 70000.00, 'Boston'),
('Eve Davis', 'Finance', 60000.00, 'Chicago'),
('Frank Wilson', 'HR', 55000.00, 'New York');

-- Insert data into contractors  
INSERT INTO contractors (name, department, rate, location) VALUES
('Grace Lee', 'IT', 75.50, 'Boston'),
('Henry Miller', 'HR', 55.00, 'New York'),
('Ivy Chen', 'IT', 80.00, 'Boston'),
('Jack Taylor', 'Finance', 65.00, 'Chicago'),
('Alice Johnson', 'HR', 55.00, 'New York'),
('Bob Smith', 'IT', 75.00, 'Boston');

-- Insert data into products
INSERT INTO products (product_name, category, price) VALUES
('Laptop Pro', 'Electronics', 1200.00),
('Mouse Wireless', 'Electronics', 25.00),
('Chair Office', 'Furniture', 150.00),
('Desk Large', 'Furniture', 300.00),
('Monitor 24in', 'Electronics', 200.00),
('Keyboard Mech', 'Electronics', 100.00);

-- Insert data into customers
INSERT INTO customers (customer_name, product_name, order_date) VALUES
('John Doe', 'Laptop Pro', '2026-01-15'),
('Jane Smith', 'Chair Office', '2026-01-20'),
('Mike Johnson', 'Laptop Pro', '2026-02-01'),
('Sarah Wilson', 'Desk Large', '2026-02-10'),
('Tom Brown', 'Monitor 24in', '2026-02-15'),
('John Doe', 'Mouse Wireless', '2026-03-01');

-- Insert data into inventory
INSERT INTO inventory (product_name, warehouse, stock_quantity) VALUES
('Laptop Pro', 'NYC', 50),
('Mouse Wireless', 'NYC', 200),
('Chair Office', 'Boston', 30),
('Desk Large', 'Boston', 15),
('Monitor 24in', 'Chicago', 25),
('Keyboard Mech', 'Chicago', 40);


