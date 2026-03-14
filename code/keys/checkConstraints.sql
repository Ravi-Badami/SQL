-- Here are 20 practice questions for CHECK constraints, going from basic to tricky:

-- 🟢 Beginner — Single Column Checks
-- Q1. Create a students table where age must be between 5 and 100.

-- Q2. Create an employees table where salary must be greater than 0.

-- Q3. Create a products table where price cannot be negative (≥ 0).

-- Q4. Create a users table where username must be at least 3 characters long. (Hint: use LENGTH())

-- Q5. Create a ratings table where score must be between 1 and 5 only.

-- Q6. Create an orders table where status can only be 'pending', 'shipped', or 'delivered'.

-- Q7. Create a accounts table where account_type can only be 'savings' or 'current'.

-- 🟡 Intermediate — Multi-Column & Named Constraints
-- Q8. Create a discounts table where discount_percent is between 0 and 100, AND discount_percent cannot equal exactly 100 (i.e., free items not allowed).

-- Q9. Create a flights table with departure_time and arrival_time columns — add a CHECK to ensure arrival_time is always after departure_time.

-- Q10. Create a loans table with start_date and end_date — ensure end_date is always greater than start_date.

-- Q11. Create a products table with original_price and sale_price — ensure sale_price is always less than or equal to original_price.

-- Q12. Create an employees table with min_salary and max_salary columns — ensure min_salary < max_salary.

-- Q13. Add a named CHECK constraint chk_positive_stock on an existing inventory table to ensure stock >= 0. (Hint: ALTER TABLE ... ADD CONSTRAINT)

-- Q14. Drop the named constraint chk_positive_stock from Q13 and replace it with a new one that allows stock between 0 and 100,000.

-- 🟠 Advanced — Pattern, Expression & Edge Cases
-- Q15. Create a contacts table where phone must be exactly 10 digits. (Hint: use LENGTH() and phone ~ '^[0-9]+$' regex)

-- Q16. Create a employees table where email must contain @ symbol. (Hint: use POSITION() or LIKE)

-- Q17. Create a products table where sku must always start with 'PRD-'. (Hint: use LIKE 'PRD-%')

-- Q18. Create a transactions table where amount must be positive for type = 'credit' and negative for type = 'debit'. (Multi-column logic check)

-- Q19. Add a CHECK constraint to orders table to ensure total_amount is NULL only when status = 'pending' — if status is anything else, total_amount must be provided.

-- Q20. Create a subscriptions table with a CHECK that ensures plan is one of 'free', 'basic', 'pro', 'enterprise' AND if plan = 'free' then price must be 0. (Single constraint, multiple conditions)



-------------------------------------------------
-- SOLUTION
---------------------------------------------------
-- 🟢 Beginner — Single Column Checks
-- Q1. Create a students table where age must be between 5 and 100.
drop table if exists students;
create table students(
  st_id smallserial,
  st_name varchar(20),
  age smallint constraint age_filter check (age between 5 and 100)
); 

insert into students(st_name,age)VALUES
('Ravi',2);

-- Q2. Create an employees table where salary must be greater than 0.
drop table if exists employees;
create table employees (

  emp_id smallserial,
  emp_name varchar(20),
  salary integer constraint must_be_greater_then_one check(salary >0)
);
insert into employees(emp_name,salary) VALUES
('Ravi',0);

-- Q3. Create a products table where price cannot be negative (≥ 0).


-- Q4. Create a users table where username must be at least 3 characters long. (Hint: use LENGTH())

drop table if exists employees;
create table employees (

  emp_id smallserial,
  emp_name varchar(20) check(length(emp_name) >3),
  salary integer constraint must_be_greater_then_one check(salary >0)
);
insert into employees(emp_name,salary) VALUES
('Ravi',20);


-- Q5. Create a ratings table where score must be between 1 and 5 only.


-- Q6. Create an orders table where status can only be 'pending', 'shipped', or 'delivered'.
drop table if exists orders;
create table orders(

  order_id smallserial primary key,
  status varchar(10) check(status IN ('pending','shipped','delivered'))
);
insert into orders(status) VALUES
('pending');


-- Q7. Create a accounts table where account_type can only be 'savings' or 'current'.

drop table if exists accounts;
create table accounts(

  acc_id smallserial primary key,
  acc_name varchar(20) check(acc_name in ('savings','current'))
);
insert into accounts(acc_name) VALUES
('current');

-- 🟡 Intermediate — Multi-Column & Named Constraints
-- Q8. Create a discounts table where discount_percent is between 0 and 100, AND discount_percent cannot equal exactly 100 (i.e., free items not allowed).

-- Q9. Create a flights table with departure_time and arrival_time columns — add a CHECK to ensure arrival_time is always after departure_time.

-- Q10. Create a loans table with start_date and end_date — ensure end_date is always greater than start_date.

-- Q11. Create a products table with original_price and sale_price — ensure sale_price is always less than or equal to original_price.

-- Q12. Create an employees table with min_salary and max_salary columns — ensure min_salary < max_salary.

-- Q13. Add a named CHECK constraint chk_positive_stock on an existing inventory table to ensure stock >= 0. (Hint: ALTER TABLE ... ADD CONSTRAINT)

-- Q14. Drop the named constraint chk_positive_stock from Q13 and replace it with a new one that allows stock between 0 and 100,000.

-- 🟠 Advanced — Pattern, Expression & Edge Cases
-- Q15. Create a contacts table where phone must be exactly 10 digits. (Hint: use LENGTH() and phone ~ '^[0-9]+$' regex)

-- Q16. Create a employees table where email must contain @ symbol. (Hint: use POSITION() or LIKE)

-- Q17. Create a products table where sku must always start with 'PRD-'. (Hint: use LIKE 'PRD-%')

-- Q18. Create a transactions table where amount must be positive for type = 'credit' and negative for type = 'debit'. (Multi-column logic check)

-- Q19. Add a CHECK constraint to orders table to ensure total_amount is NULL only when status = 'pending' — if status is anything else, total_amount must be provided.

-- Q20. Create a subscriptions table with a CHECK that ensures plan is one of 'free', 'basic', 'pro', 'enterprise' AND if plan = 'free' then price must be 0. (Single constraint, multiple conditions)