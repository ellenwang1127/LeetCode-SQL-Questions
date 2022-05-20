create table students (
	student_id int,
    student_name varchar(10)
);

insert into students values
(1,'Alice'),
(2,'Bob'),
(13,'John'),
(6,'Alex');

drop table if exists subjects;
create table subjects (
	subject_name varchar(15)
);

insert into subjects values
('Math'),('Physics'),('Programming');

create table examinations (
	student_id int,
    subject_name varchar(15)
);

insert into examinations values
(1,'Math'),
(1,'Physics'),
(1,'Programming'),
(2,'Programming'),
(1,'Physics'),
(1,'Math'),
(13,'Math'),
(13,'Programming'),
(13,'Physics'),
(2,'Math'),
(1,'Math');


#Solution:SELECT st.student_id, student_name, sub.subject_name,
		COUNT(e.student_id) attended_exams
FROM students st JOIN subjects sub  #student cross join subject to get the full list of course for each student
LEFT JOIN examinations e ON e.student_id=st.student_id
AND e.subject_name = sub.subject_name
GROUP BY 1,2,3
ORDER BY 1,2