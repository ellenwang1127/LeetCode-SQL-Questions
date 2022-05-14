create table enrollments (
	student_id int,
    course_id int,
    grade int
);

insert into enrollments values
(2,2,95),
(2,3,95),
(1,1,90),
(1,2,99),
(3,1,80),
(3,2,75),
(3,3,82);


#Solution 1: window function
SELECT student_id, course_id, grade
FROM
(SELECT student_id, course_id, grade,
		RANK() OVER (PARTITION BY student_id ORDER BY grade DESC, course_id) rnk
FROM enrollments) t1
WHERE rnk = 1
ORDER BY 1



#Solution: subquery
WITH t1 AS
(SELECT student_id, MAX(grade) max_grade
FROM enrollments
GROUP BY 1) 

SELECT student_id, MIN(course_id) course_id, grade
FROM t1
JOIN enrollments e USING(student_id) 
WHERE max_grade = grade
GROUP BY student_id, grade
ORDER BY 1
