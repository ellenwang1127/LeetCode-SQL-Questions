DROP TABLE IF EXISTS Person;
Create table Person (
    Id INT,
    Email VARCHAR(100)
);
Insert into Person (Id, Email) Values
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com');



#Solution:
WITH t1 AS (
Select Min(Id) AS minId, Email From Person
Group by Email)

DELETE FROM Person WHERE ID NOT IN
(SELECT minId FROM (SELECT * FROM t1) sub)