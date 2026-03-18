# Structured SQL Notes (Clean Order)

## 1. Fundamentals of Data & Databases

### What is Data

Data is raw facts or information that can be stored, processed, and analyzed.

### What is a Database

A database is an organized collection of data stored electronically so it can be accessed, managed, and updated efficiently.

### What is a DBMS

A **Database Management System (DBMS)** is software that manages databases.
It acts as the layer between applications and stored data.

Responsibilities:

* Data storage
* Data retrieval
* Security
* Concurrency
* Backup & recovery

### Difference Between Database and DBMS

| Database                  | DBMS                           |
| ------------------------- | ------------------------------ |
| Collection of stored data | Software that manages the data |
| Passive storage           | Active management              |
| Example: Tables/files     | Example: MySQL, PostgreSQL     |

### SQL is NOT a DBMS

SQL = **Structured Query Language**

It is the language used to communicate with relational databases.

Examples of DBMS systems:

* MySQL
* PostgreSQL
* Oracle
* Microsoft SQL Server
* MongoDB (NoSQL)

---

# 2. Relational Database Concepts

### What is RDBMS

A **Relational Database Management System** stores data in **tables** that are related to each other.

Key characteristics:

* Tables (relations)
* Rows (records)
* Columns (attributes)
* Relationships between tables

Examples:

* PostgreSQL
* MySQL
* Oracle

---

### Relational Model

The relational model organizes data in **tables** that can relate to each other using **keys**.

---

### E.F. Codd Rules

The **12 rules** define what a true relational database should support.

Key ideas:

1. Information stored only in tables
2. Every value accessible via table, column, primary key
3. Proper handling of NULL
4. Data dictionary (metadata)
5. Single query language
6. Updatable views
7. High-level insert/update/delete
8. Physical data independence
9. Logical data independence
10. Integrity independence
11. Distribution transparency
12. Security cannot be bypassed

---

# 3. How RDBMS Processes SQL

When a query is executed:

1. **Parsing**

   * Checks syntax errors.

2. **Optimization**

   * Finds the fastest execution method.

3. **Execution Plan**

   * Creates a step-by-step plan.

4. **Execution**

   * Fetches data and produces results.

---

# 4. ACID Properties

ACID ensures **reliable database transactions**.

| Property    | Meaning                                 |
| ----------- | --------------------------------------- |
| Atomicity   | All operations succeed or none          |
| Consistency | Data stays valid                        |
| Isolation   | Concurrent transactions don't interfere |
| Durability  | Changes survive crashes                 |

Example: Bank transfer.

---

# 5. Data Types

A **data type defines what type of value a column can store.**

## Numeric Types

* INT
* FLOAT
* DOUBLE
* DECIMAL

## Character / String Types

* CHAR
* VARCHAR
* TEXT

## Date & Time Types

* DATE
* TIME
* TIMESTAMP
* TIMESTAMPTZ

## Boolean

* TRUE / FALSE

## Binary Types

* BYTEA
* Large Object

---

# 6. Constraints

Constraints enforce **data integrity rules**.

Types:

* NOT NULL
* UNIQUE
* PRIMARY KEY
* FOREIGN KEY
* CHECK

---

# 7. Keys

## Primary Key

Uniquely identifies each row.

Properties:

* UNIQUE
* NOT NULL
* Only one per table

---

## Foreign Key

Links two tables.

Ensures **referential integrity**.

Example:

orders.customer_id → customers.id

Actions:

* ON DELETE CASCADE
* ON DELETE SET NULL
* ON UPDATE CASCADE

---

## Unique Key

Ensures values are unique but allows **multiple NULLs** in PostgreSQL.

---

## Composite Key

Multiple columns together form a key.

Example:

(student_id, course_id)

---

# 8. SQL Statement Categories

## DDL (Data Definition Language)

Structure of database.

* CREATE
* ALTER
* DROP
* TRUNCATE
* RENAME
* COMMENT

---

## DML (Data Manipulation Language)

Modifies data.

* INSERT
* UPDATE
* DELETE

---

## DQL (Data Query Language)

Retrieves data.

* SELECT

Clauses:

* FROM
* WHERE
* GROUP BY
* HAVING
* ORDER BY
* LIMIT
* OFFSET

---

## TCL (Transaction Control Language)

Transaction management.

* COMMIT
* ROLLBACK
* SAVEPOINT

---

## DCL (Data Control Language)

Access control.

* GRANT
* REVOKE

---

# 9. Query Processing Order

Actual SQL execution order:

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. DISTINCT
7. ORDER BY
8. LIMIT / OFFSET

---

# 10. Operators

## Logical Operators

* AND
* OR
* NOT

Operator precedence:

1. NOT
2. AND
3. OR

---

## Special Operators

### IN / NOT IN

Check if value exists in a list.

### BETWEEN

Range filtering.

### LIKE

Pattern matching.

Wildcards:

* `%`
* `_`

---

## NULL Operators

* IS NULL
* IS NOT NULL

NULL represents **missing value**.

Important rule:

```
NULL cannot be compared with =
```

Use:

```
IS NULL
```

---

# 11. Joins

Joins combine rows from multiple tables.

## INNER JOIN

Returns matching rows from both tables.

## LEFT JOIN

Returns all rows from left table.

## RIGHT JOIN

Returns all rows from right table.

## FULL JOIN

Returns all rows from both tables.

## CROSS JOIN

Cartesian product.

## SELF JOIN

Table joined with itself.

## NATURAL JOIN

Automatically joins columns with same name.

---

# 12. Aggregation

Aggregate functions summarize data.

Functions:

* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()

Often used with:

* GROUP BY
* HAVING

---

# 13. Conditional Aggregation

Using **CASE inside aggregates**.

Example pattern:

```
COUNT(CASE WHEN condition THEN 1 END)
```

Important rules:

* COUNT ignores NULL
* SUM may require ELSE 0
* AVG should NOT use ELSE 0

---

# 14. CASE Expression

SQL version of **if-else**.

Two types:

### Searched CASE

Uses conditions.

### Simple CASE

Compares against values.

Used in:

* SELECT
* WHERE
* ORDER BY
* GROUP BY

---

# 15. Sorting and Pagination

## ORDER BY

Sort results.

Default: ASC

## LIMIT

Limit number of rows.

## OFFSET

Skip rows.

---

# 16. Subqueries

A **query inside another query**.

Types:

1. Scalar Subquery
2. Multi-row Subquery
3. Correlated Subquery
4. Derived Table
5. EXISTS / NOT EXISTS

---

# 17. Set Operations

Combine results of queries.

* UNION
* INTERSECT
* EXCEPT

---

# 18. Sequences & Auto Increment

Sequence = object that generates numbers.

Functions:

* nextval()
* currval()
* setval()

Auto increment:

* SERIAL
* GENERATED AS IDENTITY

---

# 19. Index Concepts

Indexes improve query speed.

Types:

* B-Tree
* Hash
* BRIN
* GIN
* GiST

---

# 20. Normalization

Process of organizing tables to reduce redundancy.

Forms:

1. First Normal Form (1NF)
2. Second Normal Form (2NF)
3. Third Normal Form (3NF)
4. BCNF

---

# 21. Advanced Topics

* Window Functions
* CTEs
* Query Optimization
* EXPLAIN ANALYZE
* Partitioned Tables
* Schema Design

---

# Final Advice

Your notes are already **high quality**, but I recommend organizing them into **6 major sections**:

1. Database Fundamentals
2. Relational Model
3. SQL Basics
4. Querying Data
5. Advanced Querying
6. Database Design & Performance

This makes them **interview-ready**.

---

If you want, I can also give you a **SUPER CLEAN “SQL Master Notes Structure” used by senior engineers (10x better than typical tutorials)** that will make your notes look like **professional documentation**.
