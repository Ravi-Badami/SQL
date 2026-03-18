-- Dataset Inspection (Run this first to drop existing tables if any and verify empty state)
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS contractors;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;

-- Create tables
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30)
);

CREATE TABLE contractors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    hourly_rate DECIMAL(8,2),
    city VARCHAR(30)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(8,2),
    stock INTEGER
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    sale_price DECIMAL(8,2),
    quantity INTEGER
);

-- Insert data into employees
INSERT INTO employees (name, department, salary, city) VALUES
('Alice Johnson', 'HR', 55000.00, 'New York'),
('Bob Smith', 'IT', 65000.00, 'Boston'),
('Charlie Brown', 'HR', 55000.00, 'New York'),
('Diana Prince', 'IT', 70000.00, 'Boston'),
('Eve Davis', 'Finance', 60000.00, 'Chicago'),
('Frank Wilson', 'HR', 52000.00, 'New York');

-- Insert data into contractors
INSERT INTO contractors (name, department, hourly_rate, city) VALUES
('Grace Lee', 'IT', 75.50, 'Boston'),
('Henry Miller', 'HR', 55.00, 'New York'),
('Ivy Chen', 'IT', 75.50, 'Boston'),
('Jack Taylor', 'Finance', 65.00, 'Chicago'),
('Kara White', 'HR', 55.00, 'New York');

-- Insert data into products
INSERT INTO products (product_name, category, price, stock) VALUES
('Laptop Pro', 'Electronics', 1200.00, 50),
('Mouse Wireless', 'Electronics', 25.00, 200),
('Chair Office', 'Furniture', 150.00, 30),
('Desk Large', 'Furniture', 300.00, 15),
('Laptop Pro', 'Electronics', 1200.00, 20),
('Mouse Wireless', 'Electronics', 25.00, 150);

-- Insert data into orders
INSERT INTO orders (product_name, category, sale_price, quantity) VALUES
('Laptop Pro', 'Electronics', 1100.00, 5),
('Chair Office', 'Furniture', 140.00, 2),
('Desk Large', 'Furniture', 280.00, 1),
('Mouse Wireless', 'Electronics', 20.00, 10),
('Monitor 24in', 'Electronics', 200.00, 3);
