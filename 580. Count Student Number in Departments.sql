CREATE TABLE Student (
	student_id INT,
    student_name VARCHAR(10),
    gender ENUM('M','F'),
    dept_id INT
);

INSERT INTO Student VALUES
(1,'Jack','M',1),
(2,'Jane','F',1),
(3,'Mark','M',2);

DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
	dept_id iNT,
    dept_name VARCHAR(15)
);

INSERT INTO Department VALUES
(1,'Engineering'),
(2,'Science'),
(3,'Law');



#Solution:
SELECT dept_name, IFNULL(COUNT(s.dept_id),0) student_number
FROM department d
LEFT JOIN student s USING(dept_id)
GROUP BY dept_name
ORDER BY 2 DESC, 1 