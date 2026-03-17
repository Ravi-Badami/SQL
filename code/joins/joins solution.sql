SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'joins'
AND table_type = 'BASE TABLE'
ORDER BY table_name;

select * from departments;
select * from employee_projects;
select * from employees;
select * from locations;
select * from projects;

-- Level 1 — Beginner
-- Q1. List all employees and their department names. Show only employees who have a department assigned.
select * from employees join departments on employees.department_id=departments.department_id;


-- Q2. List all employees and their department names. Include employees who have no department.
select * from employees e left join departments d on e.department_id = d.department_id;



-- Q3. List all departments and the employees in them. Include departments that have no employees.
select * from departments d left join employees e on e.department_id = d.department_id; 

-- Q4. Show every row from both the employees and departments tables. Include employees with no department AND departments with no employees.
select * from employees e full join departments d on e.department_id=d.department_id;


-- Q5. Show every possible combination of employee name and city.
select e.name, l.city from employees e cross join locations l;

-- Q6. List every employee and their manager's name. If an employee has no manager, still include them.
select e.name as employee_name,m.name as manager_name from employees e left 
join employees m on m.employee_id=e.manager_id;

--wrong answer
select e.name as employee_name,m.name as manager_name from employees e left join employees m on e.employee_id=.manager_id;

-- Q7. List all projects and their department names. Only show projects that have a department assigned.
select * from projects p join departments d on p.department_id = d.department_id;


-- Q8. List all employees who work in the Engineering department. Show employee name and department name.
select e.name ,d.department_name from employees e join departments d on e.department_id = d.department_id where e.department_id=10;


-- Q9. List all employees, their department names, and the city where their department is located. Only show employees who have both a department and a city.
select e.name , d.department_name , l.city from employees e   join departments d on e.department_id = d.department_id join locations l on d.location_id=l.location_id;


-- Q10. List all employees and the projects they are assigned to. Show only employees who are actually assigned to at least one project.
select e.name, p.project_name  from employees e join employee_projects ep on e.employee_id = ep.employee_id join projects p on ep.project_id = p.project_id; 



-- Level 2 — Intermediate
-- Q11. Find all employees who do not belong to any department.

-- Q12. Find all departments that have no employees assigned to them.

-- Q13. Find all projects that are not assigned to any department.

-- Q14. List all employees, their department name, and the city of that department. Do not exclude any employee even if they have no department or their department has no city.

-- Q15. List all employees and the projects they work on. Include employees with no projects.

-- Q16. List each department and the total number of employees in it. Include departments with zero employees. Order by employee count descending.

-- Q17. List each employee and the total number of projects they are assigned to. Include employees with no projects.

-- Q18. Find all employees whose salary is above the average salary of their own department. Show employee name, salary, and department name.

-- Q19. List each manager's name and the names of all employees they directly manage. Include managers who manage nobody.

-- Q20. Find all pairs of employees who work in the same department. Do not pair an employee with themselves. Do not show the same pair twice.

-- Level 3 — Advanced
-- Q21. Find all unmatched rows from both sides in a single query — employees with no department AND departments with no employees.

-- Q22. For every department, show the department name, city, total number of employees, and total number of projects. Include departments with zero employees or zero projects.

-- Q23. List all employees who are working on a project that belongs to a different department than their own.

-- Q24. List all projects with their department name, city, and number of employees assigned. Include projects with no department and no location. Order by employee count descending.

-- Q25. Find all employees who are not assigned to any project but do belong to a department.

-- Q26. List each employee, their department name, and replace NULL department names with the text 'No Department'. Replace NULL city with 'No City'.

-- Q27. Find all employees who earn more than their direct manager.

-- Q28. List each department with the number of employees, the highest salary, the lowest salary, and the average salary. Include departments with no employees.

-- Q29. List all employee names, their department name, city, and the projects they are assigned to. Include employees with no department, no city, and no project.

-- Q30. For every employee, show their name, department name, city, manager name, number of projects assigned, and their salary rank within their department where 1 is the highest paid. Include employees with no department and no manager.