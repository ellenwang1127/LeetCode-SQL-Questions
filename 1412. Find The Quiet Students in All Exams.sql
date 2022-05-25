create table student (
	student_id int,
    student_name varchar(10)
);

insert into student values
(1,'Daniel'),(2,'Jade'),(3,'Stella'),(4,'Jonathan'),(5,'Will');

create table exam (
	exam_id int,
    student_id int,
    score int
);

insert into exam values
(10,1,70),
(10,2,80),
(10,3,90),
(20,1,80),
(30,1,70),
(30,3,80),
(30,4,90),
(40,1,60),
(40,2,70),
(40,4,80);


#Solution:
WITH t1 AS (
SELECT *,
    RANK() OVER (PARTITION BY exam_id ORDER BY score DESC) AS h_rank,
    RANK() OVER (PARTITION BY exam_id ORDER BY score) AS l_rank
FROM Exam)

SELECT DISTINCT student_id
FROM exam
WHERE student_id NOT IN (
SELECT student_id
FROM t1
WHERE h_rank = 1 OR l_rank = 1)
AND student_id IN (   #make sure the student attends at least 1 exam
SELECT student_id
FROM exam
)
