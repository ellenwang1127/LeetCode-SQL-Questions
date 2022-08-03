create table salesperson (
	sales_id int,
    name varchar(10),
    salary int,
    commission_rate int,
    hire_date date
);

insert into salesperson values
(1,'John',100000,6,str_to_date('4/1/2006','%m/%d/%Y')),
(2,'Amy',12000,5,str_to_date('5/1/2010','%m/%d/%Y')),
(3,'Mark',65000,12,str_to_date('12/25/2008','%m/%d/%Y')),
(4,'Pam',25000,25,str_to_date('1/1/2005','%m/%d/%Y')),
(5,'Alex',5000,10,str_to_date('2/3/2007','%m/%d/%Y'));

create table company (
	com_id int,
    name varchar(10),
    city varchar(20)
);

insert into company values
(1,'RED','Boston'),(2,'ORANGE','New York'),(3,'YELLOW','Boston'),(4,'GREEN','Austin');

create table orders (
	order_id int,
    order_date date,
    com_id int,
    sales_id int,
    amount int
);

insert into orders values
(1,str_to_date('1/1/2014','%m/%d/%Y'),3,4,1000),
(2,str_to_date('2/1/2014','%m/%d/%Y'),4,5,5000),
(3,str_to_date('3/1/2014','%m/%d/%Y'),1,1,50000),
(4,str_to_date('4/1/2014','%m/%d/%Y'),1,4,25000);



#Solution 1:
SELECT name
FROM salesperson
WHERE sales_id NOT IN (
SELECT sales_id
FROM company c
JOIN orders o USING(com_id)
WHERE c.name = 'RED'
)

#Solution 2:
SELECT s.name
FROM salesperson s JOIN company c 
LEFT JOIN orders o ON s.sales_id=o.sales_id AND c.com_id=o.com_id
WHERE c.name = 'RED' AND o.order_id IS NULL






