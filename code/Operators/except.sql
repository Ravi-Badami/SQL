-- Beginner

-- Find staff members who are not assigned to any projects.

-- List inventory items that have not been shipped yet.

-- Show offices that exist in staff table but not in projects table.

-- Find staff roles that don't appear in the projects table.

-- Intermediate

-- List staff names working on Developer role who have no project assignments.

-- Find Electronics inventory items (price > 100) that haven't been shipped.

-- Show Furniture category items present in inventory but not in shipments.

-- List the 2 highest-paid staff members who are not working on projects.

-- Find staff from NYC office who don't have matching project records.

-- Advanced

-- Find staff earning over 55000 who have no project assignments.

-- List item_name/category/price combinations in inventory but not shipped.

-- Show all Developer staff records that don't have project matches.

-- Find staff offices that contain staff but no corresponding projects (exclude Chicago).

-- Identify staff name/role combinations from Boston that don't appear in projects.

-- Find inventory items priced exactly at staff salary levels that haven't shipped.

----------------------------------------
-- solution
----------------------------------------
SELECT * FROM staff;  -- Empty
SELECT * FROM projects;  -- Empty
SELECT * FROM inventory;  -- Empty
SELECT * FROM shipments;  -- Empty



-- Beginner

-- Find staff members who are not assigned to any projects.
select * from staff
EXCEPT
select * from projects;

-- List inventory items that have not been shipped yet.

-- Show offices that exist in staff table but not in projects table.

-- Find staff roles that don't appear in the projects table.

-- Intermediate

-- List staff names working on Developer role who have no project assignments.

-- Find Electronics inventory items (price > 100) that haven't been shipped.

-- Show Furniture category items present in inventory but not in shipments.

-- List the 2 highest-paid staff members who are not working on projects.

-- Find staff from NYC office who don't have matching project records.

-- Advanced

-- Find staff earning over 55000 who have no project assignments.

-- List item_name/category/price combinations in inventory but not shipped.

-- Show all Developer staff records that don't have project matches.

-- Find staff offices that contain staff but no corresponding projects (exclude Chicago).

-- Identify staff name/role combinations from Boston that don't appear in projects.

-- Find inventory items priced exactly at staff salary levels that haven't shipped.