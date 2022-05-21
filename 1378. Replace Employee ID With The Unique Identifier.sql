drop table if exists employees;
create table employees (
	id int,
    name varchar(10)
);

insert into employees values
(1,'Alice'),
(7,'Bob'),
(11,'Meir'),
(90,'Winston'),
(3,'Jonathan');

create table employeeUNI (
	id int,
    unique_id int
);

insert into employeeUNI values
(3,1),(11,2),(90,3);



#Solution:
SELECT unique_id, name
FROM employees e
LEFT JOIN employeeuni eu USING(id)