create table courses (
	student varchar(5),
    class varchar(10)
);

insert into courses values
('A','Math'),('B','English'),('C','Math'),('D','Biology'),('E','Math'),('F','Computer'),('G','Math'),('H','Math'),('I','Math');


#Solution:
SELECT class
FROM courses
GROUP BY class
HAVING COUNT(student) >= 5