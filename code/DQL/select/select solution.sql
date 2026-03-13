select table_name from information_schema.tables where table_schema='public';

-- 🟢 Level 1 — Beginner (Module 1–2: SELECT + WHERE)
-- Select all columns from the users table
select * from users;

-- Select only name and email from users
select name,email from users;

-- Select all users from India (country = 'IN')
select * from users where country='IN';

-- Select all users who are active
select * from users where is_active='true';

-- Select all users whose age is greater than 30
select * from users where age>30;

-- Select all users where age is NULL
select * from users where age IS NULL;

-- Select all orders where price is more than 5000
select * from orders where price>5000;

-- Select product and price from orders, rename price as "Product Price" using alias
select product , price as "Product Price" from orders;

-- Select all distinct countries from users
select DISTINCT country from users;

-- Select all users who are inactive AND from India
select * from users where is_active=false and country='IN';

-- -----------------------------------------------------------

-- 🟡 Level 2 — Intermediate (Module 3–6: ORDER BY, LIMIT, Aggregates, GROUP BY)
-- Select all users ordered by age from youngest to oldest
select * from users order by age;

-- Select top 5 most expensive orders
select * from orders order by price desc limit 5;

-- Select the total number of users in the table
select count(*) from users;

-- Select the average age of all users
select avg(age) from users;

-- Select the most expensive order price and cheapest order price
select min(price) ,max(price) from orders;


-- Select the total revenue (sum of all prices × quantity) from orders
  select  sum(price*quantity) from orders;


-- Count how many orders are in each category
select distinct category , count(order_id) from orders group by category;

select user_id, count(category),max(price) from orders group by user_id order by max(price);

-- Find which country has the most users
--wrong answer
select country,count(country)  from users group by (country) order by country desc limit 1;

--right
SELECT country, COUNT(*) AS user_count
FROM users
GROUP BY country
ORDER BY user_count DESC   -- or ORDER BY COUNT(*) DESC
LIMIT 1;


-- Select all categories where total sales are more than 10,000
select category,sum(quantity*price) as sales from orders group by category having sum(quantity*price)>10000;

-- Select users ordered by country first, then by age within each country
select * from users order by country ,age;

-- Select the 3rd to 7th most expensive orders (use LIMIT + OFFSET)
SELECT price FROM orders ORDER BY price DESC OFFSET 2 LIMIT 5;

-- Count how many orders each user has placed
select user_id ,count(order_id) as "number_of_orders" from orders group by user_id order by user_id; 



-- 🔴 Level 3 — Advanced (Module 7–9: JOINs, Subqueries, CASE)
-- Show each order along with the customer's name (JOIN)
    select users.name,orders.product from orders inner join users on orders.user_id=users.user_id

-- Show all users and their orders — include users who have NO orders (LEFT JOIN)
    select u.name,o.product from users u left join orders o on o.user_id=u.user_id;

-- Find all users who have never placed an order
    select u.name from users u left join orders o on o.user_id=u.user_id where o.product is NULL;

-- Show the total amount spent by each user — include their name
     select u.name,sum(o.quantity * o.price) as "total_amount" from orders o inner join users u on o.user_id=u.user_id group by u.name;

-- Find the user who has spent the most money overall
    select u.name , sum(o.quantity * o.price) as "total_amount" from users u inner join orders o on o.user_id=u.user_id group by u.name order by total_amount desc limit 1;

-- Show all orders placed in January 2026
select * from orders where order_date>='2026-01-05' and order_date<'2026-02-01';

-- Find users who have placed more than 2 orders
    select u.name,count(o.order_id) from users u inner join orders o on o.user_id=u.user_id  group by u.name having count(o.order_id)>2 ;

-- Show each user's name with a label: if age ≥ 30 → 'Senior', else → 'Junior' (CASE WHEN)
    select u.name,u.age,case when u.age>=30 then 'senior' else 'junior' end as age_group from users u;

-- Find all orders where the price is above the average order price (subquery)
    select price from orders where price>(select avg(price) from orders);

-- Show a summary: country, total users, total active users — all in one query
-- First answer
select u.country,
       count(u.user_id) as total_users ,
       (select count(user_id) from users u2 where is_active=true and u2.country=u.country ) as total_active_users
from users u
group by u.country;

--Second answer
    select country ,
           count(user_id) as total_users,
           count(case when is_active=true then 1 end) as total_active_users
    from users
    group by country;

-- 🔵 Level 4 — Challenge (Real-world style queries)
-- Find the most popular product category by number of orders
select category as most_popular , count(product) as number_of_orders from orders group by category order by number_of_orders desc limit 1;


-- Show the monthly revenue (group by month from order_date)

-- Find users who ordered Electronics but never ordered Books

-- Rank users by total spending — show rank number alongside their name (Window function RANK())

-- Show each order with the running total of revenue ordered by date (Window function)

-- Find the second most expensive order without using LIMIT 1 OFFSET 1

-- Show users who placed orders in both January and February 2026

-- Find the percentage of total revenue each category contributes