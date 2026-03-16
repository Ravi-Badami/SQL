-- Practice Questions
-- 🟢 Level 1 — Easy
-- Q1. Show each employee's name and a column called salary_category:

-- Below 40,000 → 'Entry Level'

-- 40,000 to 80,000 → 'Mid Level'

-- Above 80,000 → 'Senior Level'

-- Q2. Show each employee's name and label their dept as:

-- 'Tech' if they are in IT

-- 'People' if they are in HR

-- 'Money' if they are in Finance

-- 'Field' for everything else

-- Q3. Show name and a column status:

-- If is_active is TRUE → 'Working'

-- If is_active is FALSE → 'Left Company'

-- 🟡 Level 2 — Medium
-- Q4. Show name, city, and a column location_type:

-- Bengaluru, Pune, Chennai → 'South/West India'

-- Mumbai, Delhi → 'Metro North'

-- Anything else → 'Other'
-- (Use IN inside WHEN)

-- Q5. Show name and phone_status:

-- If phone is NULL → 'No Contact Info'

-- If phone is NOT NULL → 'Reachable'

-- Then filter only employees who are NOT reachable. (Use CASE in WHERE or just IS NULL in WHERE — try both ways)

-- Q6. Show name, salary, and experience_band based on join_year:

-- Joined before 2016 → 'Veteran (10+ yrs)'

-- 2016 to 2020 → 'Experienced (5-9 yrs)'

-- After 2020 → 'Fresher (<5 yrs)'
-- (Use BETWEEN inside WHEN)

-- Q7. Show name and age_group:

-- Under 25 → 'Junior'

-- 25 to 35 → 'Mid'

-- Above 35 → 'Senior'

-- Then sort the result so Senior appears first, Mid second, Junior last.
-- (Use CASE inside ORDER BY)

-- 🔴 Level 3 — Hard
-- Q8. Show each department and a risk_label:

-- If a department has average salary below 50,000 → 'Underpaid Dept'

-- If average salary is between 50,000 and 100,000 → 'Fair Pay Dept'

-- Above 100,000 → 'Well Paid Dept'

-- (Use CASE with GROUP BY and AVG())

-- Q9. Show name and a full_risk_flag that combines TWO conditions:

-- If employee is inactive AND has no phone → 'High Risk - No Trace'

-- If employee is inactive but has phone → 'Medium Risk'

-- If employee is active but no phone → 'Low Risk - Update Contact'

-- If employee is active and has phone → 'All Good'

-- (Use AND + IS NULL inside WHEN — tests logic combination)

-- Q10. Count how many employees fall into each salary_category (Entry/Mid/Senior from Q1).
-- Show: salary_category and total_count, sorted by count descending.

-- (Use CASE inside GROUP BY — the most advanced use)


----------------------------------------------------------------
-- solution
----------------------------------------------------------------
select * from employees;
-- Practice Questions
-- 🟢 Level 1 — Easy
-- Q1. Show each employee's name and a column called salary_category:
-- Below 40,000 → 'Entry Level'
-- 40,000 to 80,000 → 'Mid Level'
-- Above 80,000 → 'Senior Level'

select name , case when salary<40000 then 'Entry Level'
 when salary  between 40000 and 80000 then 'Mid Level'
 when salary>80000  then 'Senior Level' end as salary_category
 from employees;


-- Q2. Show each employee's name and label their dept as:
-- 'Tech' if they are in IT
-- 'People' if they are in HR
-- 'Money' if they are in Finance
-- 'Field' for everything else
select name , case when dept='IT' then 'Tech' 
when dept='HR' then 'People' when dept='Finance' then 'Money'
else 'Field' end from employees;


-- Q3. Show name and a column status:
-- If is_active is TRUE → 'Working'
-- If is_active is FALSE → 'Left Company'
select name ,case when is_active='True' then 'Working'
when is_active='False' then 'Left Company' end as status from employees;


-- 🟡 Level 2 — Medium
-- Q4. Show name, city, and a column location_type:
-- Bengaluru, Pune, Chennai → 'South/West India'
-- Mumbai, Delhi → 'Metro North'
-- Anything else → 'Other'

select name, city , case when city in ('Bengaluru','Pune','Chennai') then 'South/West India'
when city in ('Mumbai', 'Delhi') then 'Metro North' else 'Other' end as location_type from employees;


-- Q5. Show name and phone_status:
-- If phone is NULL → 'No Contact Info'
-- If phone is NOT NULL → 'Reachable'
-- Then filter only employees who are NOT reachable. (Use CASE in WHERE or just IS NULL in WHERE — try both ways)
select name , case when phone is NULL then 'No contact Info'
when phone is NOT NULL then 'Reachable' end as phone_status from employees where phone is null; 

-- Q6. Show name, salary, and experience_band based on join_year:
-- Joined before 2016 → 'Veteran (10+ yrs)'
-- 2016 to 2020 → 'Experienced (5-9 yrs)'
-- After 2020 → 'Fresher (<5 yrs)'
-- (Use BETWEEN inside WHEN)


select name,salary, case when join_year<2016 then 'Veteran' 
when join_year between 2016 and 2020 then 'Experienced' 
when join_year>2020 then 'Fresher'
end as "experience_band" from employees;


-- Q7. Show name and age_group:
-- Under 25 → 'Junior'
-- 25 to 35 → 'Mid'
-- Above 35 → 'Senior'
-- Then sort the result so Senior appears first, Mid second, Junior last.
-- (Use CASE inside ORDER BY)
select name,case when age <25 then 'Junior' 
when age between 25 and 35 then 'Mid'
when age >35 then 'Senior' end as age_group from employees 
order by 
case 
when 'Senior' then 1
when 'Mid' then 2
when 'Junior'then 3
end;

-- When you write CASE "age_group" WHEN 'Senior'... in ORDER BY, PostgreSQL looks for age_group as a real column in the table — but age_group doesn't exist in the employees table, it was only computed in SELECT
-- You CAN use an alias in ORDER BY — but only alone, not inside an expression like CASE.



-- 🔴 Level 3 — Hard
-- Q8. Show each department and a risk_label:

-- If a department has average salary below 50,000 → 'Underpaid Dept'

-- If average salary is between 50,000 and 100,000 → 'Fair Pay Dept'

-- Above 100,000 → 'Well Paid Dept'

-- (Use CASE with GROUP BY and AVG())

-- Q9. Show name and a full_risk_flag that combines TWO conditions:

-- If employee is inactive AND has no phone → 'High Risk - No Trace'

-- If employee is inactive but has phone → 'Medium Risk'

-- If employee is active but no phone → 'Low Risk - Update Contact'

-- If employee is active and has phone → 'All Good'

-- (Use AND + IS NULL inside WHEN — tests logic combination)

-- Q10. Count how many employees fall into each salary_category (Entry/Mid/Senior from Q1).
-- Show: salary_category and total_count, sorted by count descending.

-- (Use CASE inside GROUP BY — the most advanced use)