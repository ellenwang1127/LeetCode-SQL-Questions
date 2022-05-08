create table customers (
	id int,
    name varchar(10)
);

insert into customers values
(1,'Joe'),(2,'Henry'),(3,'Sam'),(4,'Max');

create table orders (
	id int,
    customerId int
);

insert into orders values
(1,3),(2,1);



#Solution:
SELECT c.name customers
FROM customers c
LEFT JOIN orders o ON c.id=o.customerId
WHERE o.customerId IS NULL




