-- NUMBERIC DATATYPES
drop table products;
CREATE TABLE products (
    quantity INT,
    temperature FLOAT,
    distance DOUBLE PRECISION,
    price DECIMAL(10,3),
);

INSERT INTO products (quantity, temperature, distance, price,priceFloat)
VALUES (10.6, 36.5, 999.999999999999999, 999.999999999999999,999.999999999999998), (10, 36.5, 999.98999999999998, 999.98999999999998,999.98999999999998);

select * from products;

delete from  products;




-- CHARACTER DATATYPES
DROP TABLE IF EXISTS people;


CREATE TABLE people (
    country_code  CHAR(2),        -- always exactly 2 letters e.g. "IN", "US"
    name          VARCHAR(50),    -- up to 50 chars, uses only what's needed
    bio           TEXT            -- unlimited, for long descriptions
);

INSERT INTO people (country_code, name, bio)
VALUES 
  ('IN', 'Ravi Kumar',  'A software developer from Bengaluru who loves PostgreSQL.'),
  ('US', 'John',        'A data engineer based in New York with 10 years of experience.'),
  ('GB', 'Alice Smith', 'A backend developer who writes about databases and system design.');

SELECT * FROM people;



--DATE AND TIME
DROP TABLE IF EXISTS events;

CREATE TABLE events (
    event_name      VARCHAR(100),
    event_date      DATE,              -- just the date
    event_time      TIME,              -- just the time
    event_at        TIMESTAMP,         -- date + time, no timezone
    created_at      TIMESTAMPTZ        -- date + time + timezone (auto UTC)
);

INSERT INTO events (event_name, event_date, event_time, event_at, created_at)
VALUES 
  (
    'Team Meeting',
    '2026-03-11',                        -- DATE
    '10:30:00',                          -- TIME
    '2026-03-11 10:30:00',               -- TIMESTAMP
    '2026-03-11 10:30:00+05:30'          -- TIMESTAMPTZ (IST → stored as UTC)
  ),
  (
    'Product Launch',
    '2026-04-01',
    '09:00:00',
    '2026-04-01 09:00:00',
    NOW()                                -- auto inserts current time with timezone ✅
  );

SELECT * FROM events;


--BOOLEAN
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    name                VARCHAR(50),
    is_active           BOOLEAN,
    has_paid_subscription BOOLEAN,
    is_verified         BOOLEAN DEFAULT FALSE   -- default value if not provided
);

INSERT INTO users (name, is_active, has_paid_subscription, is_verified)
VALUES
  ('Ravi',    TRUE,  TRUE,  TRUE),
  ('Priya',   TRUE,  FALSE, TRUE),
  ('Arjun',   FALSE, TRUE,  FALSE),
  ('Sneha',   FALSE, FALSE, NULL);   -- NULL = unknown/not set yet

SELECT * FROM users;


--Files
CREATE TABLE files (
    file_name   VARCHAR(100),
    file_type   VARCHAR(20),
    file_data   BYTEA              -- stores raw binary content
);

INSERT INTO files (file_name, file_type, file_data)
VALUES 
  ('logo.png',  'image', decode('89504e47', 'hex')),
  ('notes.txt', 'text',  'Hello Ravi'::bytea);

