-- ============================================================
-- SETUP: Run this entire block first to get your dataset ready
-- ============================================================

-- 1. Create Schema
CREATE SCHEMA IF NOT EXISTS ecom;
Drop SCHEMA if exists ecom;
-- 2. Base Tables
CREATE TABLE ecom.categories (
    category_id   SERIAL PRIMARY KEY,
    name          VARCHAR(100) NOT NULL UNIQUE,
    description   TEXT,
    created_at    TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE ecom.customers (
    customer_id   SERIAL PRIMARY KEY,
    full_name     VARCHAR(150) NOT NULL,
    email         VARCHAR(255) NOT NULL UNIQUE,
    phone         VARCHAR(20),
    country       VARCHAR(60) DEFAULT 'India',
    created_at    TIMESTAMPTZ DEFAULT NOW(),
    is_active     BOOLEAN DEFAULT TRUE
);

CREATE TABLE ecom.products (
    product_id    SERIAL PRIMARY KEY,
    category_id   INT REFERENCES ecom.categories(category_id),
    name          VARCHAR(200) NOT NULL,
    sku           VARCHAR(50) NOT NULL UNIQUE,
    price         NUMERIC(10,2) NOT NULL CHECK (price > 0),
    stock         INT NOT NULL DEFAULT 0 CHECK (stock >= 0),
    created_at    TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE ecom.orders (
    order_id      SERIAL PRIMARY KEY,
    customer_id   INT NOT NULL REFERENCES ecom.customers(customer_id),
    status        VARCHAR(30) NOT NULL DEFAULT 'pending',
    total_amount  NUMERIC(12,2),
    created_at    TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE ecom.order_items (
    item_id       SERIAL PRIMARY KEY,
    order_id      INT NOT NULL REFERENCES ecom.orders(order_id) ON DELETE CASCADE,
    product_id    INT NOT NULL REFERENCES ecom.products(product_id),
    quantity      INT NOT NULL CHECK (quantity > 0),
    unit_price    NUMERIC(10,2) NOT NULL
);

-- ============================================================
-- INSERT DATA
-- ============================================================

INSERT INTO ecom.categories (name, description) VALUES
('Electronics',   'Gadgets, devices and accessories'),
('Books',         'Fiction, non-fiction, academic'),
('Clothing',      'Men, women and kids apparel'),
('Home & Kitchen','Appliances and decor'),
('Sports',        'Fitness and outdoor gear');

INSERT INTO ecom.customers (full_name, email, phone, country) VALUES
('Ravi Kumar',       'ravi.kumar@email.com',    '9876543210', 'India'),
('Priya Sharma',     'priya.sharma@email.com',  '9123456789', 'India'),
('Arjun Mehta',      'arjun.mehta@email.com',   '9988776655', 'India'),
('Sneha Patil',      'sneha.patil@email.com',   '9001122334', 'India'),
('Vikram Singh',     'vikram.singh@email.com',  '9765432109', 'India'),
('Deepa Nair',       'deepa.nair@email.com',    '9812345678', 'India'),
('Kiran Rao',        'kiran.rao@email.com',      NULL,         'India'),
('Anita Desai',      'anita.desai@email.com',   '9700011223', 'India');

INSERT INTO ecom.products (category_id, name, sku, price, stock) VALUES
(1, 'Samsung Galaxy S24',      'ELEC-001', 79999.00, 50),
(1, 'Sony WH-1000XM5 Headset', 'ELEC-002', 29999.00, 120),
(1, 'Apple iPad Air 11"',      'ELEC-003', 59999.00, 30),
(2, 'Atomic Habits',           'BOOK-001',   499.00, 200),
(2, 'The Pragmatic Programmer','BOOK-002',   899.00, 150),
(3, 'Nike Dri-FIT T-Shirt',    'CLTH-001',  1299.00, 300),
(3, 'Levi\'s 511 Slim Jeans',  'CLTH-002',  3499.00, 180),
(4, 'Prestige Induction Cooktop','HOME-001', 3999.00, 75),
(5, 'Decathlon Yoga Mat',      'SPRT-001',   799.00, 400),
(5, 'Cosco Football',          'SPRT-002',   699.00, 250);

INSERT INTO ecom.orders (customer_id, status, total_amount) VALUES
(1, 'delivered',  109998.00),
(2, 'shipped',     30498.00),
(3, 'pending',      1398.00),
(4, 'delivered',    3999.00),
(5, 'cancelled',   80798.00),
(6, 'processing',  29999.00),
(1, 'delivered',    1598.00),
(2, 'pending',       899.00);

INSERT INTO ecom.order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 79999.00),
(1, 2, 1, 29999.00),
(2, 6, 2,  1299.00),
(2, 9, 2,   799.00),
(3, 4, 1,   499.00),
(3, 5, 1,   899.00),
(4, 8, 1,  3999.00),
(5, 1, 1, 79999.00),
(5, 3, 1, 59999.00) -- corrected total intentional mismatch for practice,
(6, 2, 1, 29999.00),
(7, 6, 1,  1299.00),
(7, 9, 1,   799.00) -- corrected,
(8, 5, 1,   899.00);
