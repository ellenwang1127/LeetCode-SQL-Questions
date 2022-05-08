drop table if exists employee;
create table Employee(
    id INT,
    name varchar(20),
    salary INT,
    departmentId INT
);
Insert Into Employee Values
(1, 'Joe', 70000, 1),
(2, 'Jim', 90000, 1),
(3, 'Henry', 80000, 2),
(4, 'Sam', 60000, 2),
(5, 'Max', 90000, 1);

DROP TABLE IF EXISTS Department;
Create table Department(
    Id INT,
    Name varchar(20)
    );
Insert Into Department (Id, Name) Values
(1, 'IT'),
(2, 'Sales');



#Solution 1: window function
SELECT department, employee, salary
FROM
(SELECT d.name department, e.name employee, salary, RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) rnk
FROM employee e
JOIN department d ON e.departmentId=d.id) t1
WHERE rnk = 1


#Solution 2: GROUP BY
SELECT d.name department, e.name employee, salary
FROM employee e
JOIN department d ON e.departmentId=d.id
WHERE (d.id,salary) IN (SELECT departmentId, MAX(salary) max_salary
FROM employee
GROUP BY 1)


