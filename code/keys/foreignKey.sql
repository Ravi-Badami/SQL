-- Creating a Foreign Key in PostgreSQL
-- In PostgreSQL, we can define a foreign key when creating a table or after a table has been created.
-- Foreign keys reference the primary key of another table and they ensure that the data in the child table matches one of the values in the parent table.

drop table if exists department;
drop table if exists employees2;

create table department(dept_id serial primary key, dept_name varchar(10));
insert into department(dept_name) values
('IT'),
('HR'),
('Service');

create table employees2(emp_id serial primary key,
emp_name varchar(10), dept_id integer,
constraint fk_department
foreign key(dept_id) references department(dept_id)
);

insert into employees2(emp_name, dept_id)values
('ravi',1),
('falkeen',2);

select * from department;
select * from employees2;
select e.emp_id,e.emp_name,d.dept_name from employees2 e inner join department d on e.dept_id=d.dept_id; 