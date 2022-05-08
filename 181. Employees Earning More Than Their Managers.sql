create table employee (
	id int,
    name varchar(10),
    salary int,
    managerId int
);

insert into employee values
(1,'Joe',70000,3),(2,'Henry',80000,4),(3,'Sam',60000,null),(4,'Max',90000,null);

#Solution:
SELECT e2.name employee
FROM employee e1
JOIN employee e2 ON e1.id=e2.managerId
WHERE e2.salary > e1.salary