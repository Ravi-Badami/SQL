select * from employees;

alter table employees 
add constraint uq_email unique(email);