-- ============================================
-- MASTER PRACTICE DATASET FOR DQL LEARNING
-- ============================================

-- TABLE 1: users
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id     SERIAL          PRIMARY KEY,
    name        VARCHAR(50)     NOT NULL,
    email       VARCHAR(100)    UNIQUE NOT NULL,
    age         INT             CHECK (age > 0),
    country     CHAR(2),
    is_active   BOOLEAN         DEFAULT TRUE,
    created_at  TIMESTAMPTZ     DEFAULT NOW()
);

INSERT INTO users (name, email, age, country, is_active)
VALUES
  ('Ravi Kumar',    'ravi@email.com',    28, 'IN', TRUE),
  ('Priya Sharma',  'priya@email.com',   25, 'IN', TRUE),
  ('Arjun Singh',   'arjun@email.com',   32, 'IN', FALSE),
  ('Sneha Rao',     'sneha@email.com',   22, 'IN', TRUE),
  ('John Smith',    'john@email.com',    35, 'US', TRUE),
  ('Alice Brown',   'alice@email.com',   29, 'US', FALSE),
  ('Bob Martin',    'bob@email.com',     41, 'US', TRUE),
  ('Emma Wilson',   'emma@email.com',    19, 'GB', TRUE),
  ('Liam James',    'liam@email.com',    27, 'GB', TRUE),
  ('Ananya Das',    'ananya@email.com',  17, 'IN', FALSE),
  ('Carlos Ruiz',   'carlos@email.com',  33, 'MX', TRUE),
  ('Yuki Tanaka',   'yuki@email.com',    26, 'JP', TRUE),
  ('Sara Ali',      'sara@email.com',    NULL, 'AE', TRUE),  -- age unknown
  ('Mike Lee',      'mike@email.com',    45, 'US', TRUE),
  ('Nina Patel',    'nina@email.com',    31, 'IN', TRUE);


-- TABLE 2: orders
CREATE TABLE orders (
    order_id    SERIAL          PRIMARY KEY,
    user_id     INT             REFERENCES users(user_id),
    product     VARCHAR(100)    NOT NULL,
    category    VARCHAR(50),
    quantity    INT             DEFAULT 1,
    price       DECIMAL(10,2)   NOT NULL,
    order_date  DATE            NOT NULL
);

INSERT INTO orders (user_id, product, category, quantity, price, order_date)
VALUES
  (1,  'Laptop',        'Electronics',  1,  75000.00, '2026-01-05'),
  (1,  'Mouse',         'Electronics',  2,   1500.00, '2026-01-10'),
  (2,  'Python Book',   'Books',        1,    599.00, '2026-01-15'),
  (2,  'Keyboard',      'Electronics',  1,   3500.00, '2026-02-01'),
  (3,  'Desk Chair',    'Furniture',    1,  12000.00, '2026-01-20'),
  (4,  'Headphones',    'Electronics',  1,   4500.00, '2026-02-10'),
  (5,  'Monitor',       'Electronics',  2,  25000.00, '2026-01-08'),
  (5,  'SQL Book',      'Books',        1,    799.00, '2026-02-14'),
  (6,  'Webcam',        'Electronics',  1,   3200.00, '2026-01-25'),
  (7,  'Standing Desk', 'Furniture',    1,  18000.00, '2026-02-05'),
  (8,  'Tablet',        'Electronics',  1,  35000.00, '2026-01-30'),
  (9,  'Phone Case',    'Accessories',  3,    299.00, '2026-02-08'),
  (10, 'Notebook',      'Stationery',   5,     99.00, '2026-01-12'),
  (12, 'Camera',        'Electronics',  1,  55000.00, '2026-02-20'),
  (15, 'USB Hub',       'Electronics',  2,   1299.00, '2026-03-01'),
  (15, 'Java Book',     'Books',        1,    699.00, '2026-03-05'),
  (1,  'Monitor Stand', 'Accessories',  1,   2500.00, '2026-03-08'),
  (3,  'Lamp',          'Furniture',    2,   1800.00, '2026-02-28');




-- Table	Rows	Good for practicing
-- users	15 rows	WHERE, FILTER, NULL, BOOLEAN, ORDER BY
-- orders	18 rows	GROUP BY, SUM, COUNT, JOINs, subqueries
-- Has NULLs (Sara's age is NULL — perfect for IS NULL practice)

-- Has inactive users (perfect for WHERE is_active = FALSE)

-- Has multiple countries (perfect for GROUP BY, IN, COUNT)

-- Has foreign key link between orders and users (perfect for JOINs)

-- Has dates (perfect for BETWEEN, ORDER BY date)

-- Has categories (perfect for GROUP BY category, HAVING)