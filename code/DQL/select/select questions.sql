-- 🟢 Level 1 — Beginner (Module 1–2: SELECT + WHERE)
-- Select all columns from the users table

-- Select only name and email from users

-- Select all users from India (country = 'IN')

-- Select all users who are active

-- Select all users whose age is greater than 30

-- Select all users where age is NULL

-- Select all orders where price is more than 5000

-- Select product and price from orders, rename price as "Product Price" using alias

-- Select all distinct countries from users

-- Select all users who are inactive AND from India

-- 🟡 Level 2 — Intermediate (Module 3–6: ORDER BY, LIMIT, Aggregates, GROUP BY)
-- Select all users ordered by age from youngest to oldest

-- Select top 5 most expensive orders

-- Select the total number of users in the table

-- Select the average age of all users

-- Select the most expensive order price and cheapest order price

-- Select the total revenue (sum of all prices × quantity) from orders

-- Count how many orders are in each category

-- Find which country has the most users

-- Select all categories where total sales are more than 10,000

-- Select users ordered by country first, then by age within each country

-- Select the 3rd to 7th most expensive orders (use LIMIT + OFFSET)

-- Count how many orders each user has placed

-- 🔴 Level 3 — Advanced (Module 7–9: JOINs, Subqueries, CASE)
-- Show each order along with the customer's name (JOIN)

-- Show all users and their orders — include users who have NO orders (LEFT JOIN)

-- Find all users who have never placed an order

-- Show the total amount spent by each user — include their name

-- Find the user who has spent the most money overall

-- Show all orders placed in January 2026

-- Find users who have placed more than 2 orders

-- Show each user's name with a label: if age ≥ 30 → 'Senior', else → 'Junior' (CASE WHEN)

-- Find all orders where the price is above the average order price (subquery)

-- Show a summary: country, total users, total active users — all in one query

-- 🔵 Level 4 — Challenge (Real-world style queries)
-- Find the most popular product category by number of orders

-- Show the monthly revenue (group by month from order_date)

-- Find users who ordered Electronics but never ordered Books

-- Rank users by total spending — show rank number alongside their name (Window function RANK())

-- Show each order with the running total of revenue ordered by date (Window function)

-- Find the second most expensive order without using LIMIT 1 OFFSET 1

-- Show users who placed orders in both January and February 2026

-- Find the percentage of total revenue each category contributes