-- Creating a Table with a Primary Key,
-- In this example, we create a table called books with the book_id column as the Primary Key to uniquely identify each record.
-- The PRIMARY KEY constraint ensures that the book_id values are unique and not NULL, thus maintaining data integrity.

create table books(
    book_id integer primary key,
    title text,
    price integer
)

insert into books(book_id,title,price)
values (101,'Jobs',2000),
 (102,'Jobs',2000),
 (103,'Jobs',2000),
 (104,'Jobs',2000),
 (105,'Jobs',2000);

select * from books;


-- Adding a Primary Key to an Existing Table
-- If we have an existing table and need to add a primary key, we can do so with the ALTER TABLE statement.
-- In this example we will be adding PRIMARY key to an existing table. Then, table named 'vendors' will be created with the help of the below given PostgreSQL query.

drop table  if exists books;
create table books(name varchar(20));
insert into books (name) values
                             ('ravi'),
                             ('falkeen');

EXPLAIN (ANALYZE, BUFFERS) select * from books;

alter table books add column rollNo serial primary key;

EXPLAIN (ANALYZE) select * from books;

