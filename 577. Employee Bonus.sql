DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
	empId INT,
    name VARCHAR(45),
    supervisor INT,
    salary INT
);

INSERT INTO Employee VALUES
(1,'John',3,1000),
(2,'Dan',3,2000),
(3,'Brad',null,4000),
(4,'Thomas',3,4000);

CREATE TABLE Bonus (
	empId INT,
    bonus INT
);

INSERT INTO Bonus VALUES
(2,500),
(4,2000);


#Solution:
SELECT e.name, bonus
FROM employee e
LEFT JOIN bonus b USING(empId)
WHERE bonus IS NULL OR bonus < 1000