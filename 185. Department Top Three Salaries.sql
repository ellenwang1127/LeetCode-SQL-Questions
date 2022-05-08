drop table if exists employee;
Create table Employee(
    Id INT,
    Name varchar(20),
    Salary INT,
    DepartmentId INT
);
Insert Into Employee Values
(1, 'Joe', 85000, 1),
(2, 'Henry', 80000, 2),
(3, 'Sam', 60000, 2),
(4, 'Max', 90000, 1),
(5, 'Janet', 69000, 1),
(6, 'Randy', 85000, 1),
(7, 'Will', 70000, 1);

DROP TABLE IF EXISTS Department;
Create table Department(
    Id INT,
    Name varchar(20)
    );
Insert Into Department (Id, Name) Values
(1, 'IT'),
(2, 'Sales');




#Solution:
SELECT department, employee, salary
FROM
(SELECT d.name department, e.name employee, salary, 
		DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) rnk
FROM employee e
JOIN department d ON e.departmentId=d.id) t1
WHERE rnk IN (1,2,3)
