drop table if exists departments;
create table departments (
	id int,
    name varchar(45)
);

insert into departments values
(1,'Electrical Engineering'),
(7,'Computer Engineering'),
(13,'Bussiness Administration');

drop table if exists students;
create table students (
	id int,
    name varchar(15),
    department_id int
);

insert into students values
(23,'Alice',1),
(1,'Bob',7),
(5,'Jennifer',13),
(2,'John',14),
(4,'Jasmine',77),
(3,'Steve',74),
(6,'Luis',1),
(8,'Jonathan',7),
(7,'Daiana',33),
(11,'Madelynn',1);


#Solution:
SELECT id, name
FROM students 
WHERE department_id NOT IN (SELECT id FROM departments)
