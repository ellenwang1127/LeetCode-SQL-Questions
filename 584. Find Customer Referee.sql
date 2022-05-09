create table customer (
	id int,
    name varchar(10),
    referee_id int
);

insert into customer values
(1,'Will',null),(2,'Jane',null),(3,'Alex',2),(4,'Bill',null),(5,'Zack',1),(6,'Mark',2);


#Solution:
SELECT name
FROM customer
WHERE referee_id IS NULL OR referee_id <> 2