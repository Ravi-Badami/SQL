-- Dataset Inspection (Run first - guaranteed EXCEPT results)
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS shipments;

-- Tables with intentional overlaps for EXCEPT to return results
CREATE TABLE staff (
    id INTEGER,
    name TEXT,
    role TEXT,
    salary NUMERIC,
    office TEXT
);

CREATE TABLE projects (
    id INTEGER,
    name TEXT,
    role TEXT,
    budget NUMERIC,
    office TEXT
);

CREATE TABLE inventory (
    item_id INTEGER,
    item_name TEXT,
    category TEXT,
    price NUMERIC
);

CREATE TABLE shipments (
    item_id INTEGER,
    item_name TEXT,
    category TEXT,
    price NUMERIC
);

-- staff data
INSERT INTO staff VALUES
(1, 'Alice', 'Manager', 55000, 'NYC'),
(2, 'Bob', 'Developer', 65000, 'Boston'),
(3, 'Charlie', 'Designer', 52000, 'NYC'),
(4, 'Diana', 'Developer', 70000, 'Boston'),
(5, 'Eve', 'Analyst', 60000, 'Chicago'),
(6, 'Frank', 'Designer', 55000, 'NYC');

-- projects data (overlaps with staff: 1,2,4)
INSERT INTO projects VALUES
(1, 'Alice', 'Manager', 55000, 'NYC'),
(2, 'Bob', 'Developer', 65000, 'Boston'),
(7, 'Grace', 'Analyst', 60000, 'Chicago'),
(4, 'Diana', 'Developer', 70000, 'Boston'),
(8, 'Henry', 'Manager', 55000, 'NYC');

-- inventory data
INSERT INTO inventory VALUES
(101, 'Laptop', 'Electronics', 1200),
(102, 'Mouse', 'Electronics', 25),
(103, 'Chair', 'Furniture', 150),
(104, 'Desk', 'Furniture', 300),
(105, 'Monitor', 'Electronics', 200);

-- shipments data (overlaps with inventory: 101,102,104)
INSERT INTO shipments VALUES
(101, 'Laptop', 'Electronics', 1200),
(102, 'Mouse', 'Electronics', 25),
(106, 'Keyboard', 'Electronics', 100),
(104, 'Desk', 'Furniture', 300);
