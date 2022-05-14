create table books (
	book_id int,
    name varchar(50),
    available_from date
);

insert into books values
(1,'Kalila And Demna',str_to_date('2010-01-01','%Y-%m-%d')),
(2,'28 Letters',str_to_date('2012-05-12','%Y-%m-%d')),
(3,'The Hobbit',str_to_date('2019-06-10','%Y-%m-%d')),
(4,'13 Reasons Why',str_to_date('2019-06-01','%Y-%m-%d')),
(5,'The Hunger Games',str_to_date('2008-09-21','%Y-%m-%d'));

create table orders (
	order_id int,
    book_id int,
    quantity int,
    dispatch_date date
);

insert into orders values
(1,1,2,str_to_date('2018-07-26','%Y-%m-%d')),
(2,1,1,str_to_date('2018-11-05','%Y-%m-%d')),
(3,3,8,str_to_date('2019-06-11','%Y-%m-%d')),
(4,4,6,str_to_date('2019-06-05','%Y-%m-%d')),
(5,4,5,str_to_date('2019-06-20','%Y-%m-%d')),
(6,5,9,str_to_date('2009-02-02','%Y-%m-%d')),
(7,5,8,str_to_date('2010-04-13','%Y-%m-%d'));


#Solution:
SELECT book_id, name
FROM books
WHERE book_id NOT IN
(SELECT book_id
FROM orders o
WHERE dispatch_date >= '2018-06-23' AND dispatch_date <= '2019-06-22'
GROUP BY book_id
HAVING SUM(quantity) >= 10) 
AND available_from < '2019-05-23'
