drop table if exists salary;
create table salary (
	id int,
    name varchar(10),
    sex enum('m','f'),
    salary int
);

insert into salary values
(1,'A','m',2500),(2,'B','f',1500),(3,'C','m',5500),(4,'D','f',500);


#Solution:
UPDATE salary SET sex = IF(sex='m','f','m')