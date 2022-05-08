create table person (
	id int,
    email varchar(50)
);

insert into person values
(1,'a@b.com'),(2,'c@d.com'),(3,'a@b.com');


#Solution 1: COUNT
SELECT DISTINCT email
FROM person
GROUP BY email
HAVING COUNT(email) > 1


#Solution 2: SELF JOIN
SELECT DISTINCT p1.email
FROM person p1
JOIN person p2 USING(email)
WHERE p1.id <> p2.id

