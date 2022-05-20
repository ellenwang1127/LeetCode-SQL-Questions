drop table if exists employees;
create table employees (
	employee_id int,
    employee_name varchar(10),
    manager_id int
);

insert into employees values
(1,'Boss',1),
(3,'Alice',3),
(2,'Bob',1),
(4,'Daniel',2),
(7,'Luis',4),
(8,'Jhon',3),
(9,'Angela',8),
(77,'Robert',1);


#Solution 1:
select t1.employee_id
from Employees as t1
join Employees as t2 on t1.manager_id = t2.employee_id
join Employees as t3 on t2.manager_id = t3.employee_id
where t3.manager_id = 1 and t1.employee_id != 1 


#Solution 2:
SELECT e4.employee_id
FROM employees e1
JOIN employees e2 ON e1.employee_id=e2.manager_id
JOIN employees e3 ON e2.employee_id=e3.manager_id
JOIN employees e4 ON e3.employee_id=e4.manager_id
WHERE e1.employee_id = 1 AND e4.employee_id != 1