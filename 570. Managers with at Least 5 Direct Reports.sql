DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
	id INT,
    name VARCHAR(10),
    department ENUM('A','B'),
    manager_id INT
);

INSERT INTO Employee VALUES
(101,'John','A',null),
(102,'Dan','A',101),
(103,'James','A',101),
(104,'Amy','A',101),
(105,'Anne','A',101),
(106,'Ron','B',101);


#Solution:
SELECT e1.name
FROM employee e1
JOIN employee e2 ON e1.id=e2.manager_id
GROUP BY e1.name
HAVING COUNT(DISTINCT e2.id) >=5