create table customers (
	customer_id int,
    customer_name varchar(10),
    email varchar(50)
);

insert into customers values
(1,'Alice','alice@leetcode.com'),
(2,'Bob','bob@leetcode.com'),
(13,'John','john@leetcode.com'),
(6,'Alex','alex@leetcode.com');

create table contacts (
	user_id int,
    contact_name varchar(10),
    contact_email varchar(50)
);

insert into contacts values
(1,'Bob','bob@leetcode.com'),
(1,'John','john@leetcode.com'),
(1,'Jal','jal@leetcode.com'),
(2,'Omar','omar@leetcode.com'),
(2,'Meir','meir@leetcode.com'),
(6,'Alice','alice@leetcode.com');

create table invoices (
	invoice_id int,
    price int,
    user_id int
);

insert into invoices values
(77,100,1),
(88,200,1),
(99,300,2),
(66,400,2),
(55,500,13),
(44,60,6);



#Solution:
WITH t1 AS (
    SELECT c.customer_id, c.customer_name, 
			COUNT(DISTINCT contact_name) contacts_cnt,
            COUNT(DISTINCT c2.customer_id) trusted_contacts_cnt

    FROM Customers c
    LEFT JOIN Contacts con
    ON c.customer_id = con.user_id
    LEFT JOIN Customers c2
    ON con.contact_email = c2.email
    GROUP BY 1,2)

 SELECT invoice_id, customer_name, price, contacts_cnt, trusted_contacts_cnt
 FROM t1
 JOIN invoices i ON i.user_id=t1.customer_id
 ORDER BY invoice_id