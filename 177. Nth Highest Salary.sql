#CREATE FUNCTION syntax:
CREATE FUNCTION function_name (parameter 1 datatype, parameter 2 datatype, ...) RETURNS datatype
BEGIN
	RETURN (
    ...
    );
END


create table employee (
	id int,
    salary int
);

insert into employee values
(1,100),(2,200),(3,300);


#Solution:
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT DISTINCT salary
        FROM
        (SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) rnk
        FROM Employee)sub
        WHERE rnk=N
  );
END









