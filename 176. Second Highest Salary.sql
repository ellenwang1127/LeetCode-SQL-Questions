drop table if exists employee;
create table employee (
	id int,
    salary int
);

insert into employee values
(1,100),(2,200),(3,300);


#Solution 1:
select IFNULL(
    (select distinct Salary from Employees 
     order by Salary desc limit 1 offset 1), null  
 )
as SecondHighestSalary


#Solution 2: 
SELECT REPLACE(Salary,'',null) SecondHighestSalary
FROM
(SELECT Salary, RANK() OVER(ORDER BY salary DESC) rnk
FROM Employee)sub
WHERE rnk=2
