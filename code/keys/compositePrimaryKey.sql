select * from orders;
create table orders2(

order_id integer,
product_id integer,
quantity integer,
price DECIMAL(10,2),
primary key(order_id,product_id)

);