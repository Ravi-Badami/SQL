-- Dataset Inspection (Run first - guaranteed INTERSECT results)
DROP TABLE IF EXISTS table_a;
DROP TABLE IF EXISTS table_b;

-- Fixed IDs for exact row matches
CREATE TABLE table_a (
    id INTEGER,
    name TEXT,
    dept TEXT,
    value NUMERIC,
    location TEXT
);

CREATE TABLE table_b (
    id INTEGER,
    name TEXT,
    dept TEXT,
    value NUMERIC,
    location TEXT
);

-- table_a data
INSERT INTO table_a VALUES
(1, 'Alice', 'HR', 55000, 'NYC'),
(2, 'Bob', 'IT', 65000, 'Boston'),
(3, 'Charlie', 'HR', 52000, 'NYC'),
(4, 'Diana', 'IT', 70000, 'Boston'),
(5, 'Eve', 'Finance', 60000, 'Chicago');

-- table_b data (EXACT duplicates for rows 1,2,5)
INSERT INTO table_b VALUES
(1, 'Alice', 'HR', 55000, 'NYC'),     -- Exact match row 1
(2, 'Bob', 'IT', 65000, 'Boston'),     -- Exact match row 2
(6, 'Frank', 'HR', 55000, 'NYC'),
(7, 'Grace', 'IT', 75000, 'Boston'),
(5, 'Eve', 'Finance', 60000, 'c'); -- Exact match row 5
