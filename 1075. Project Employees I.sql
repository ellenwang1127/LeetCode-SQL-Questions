DROP TABLE IF EXISTS Project;
CREATE TABLE Project (
	project_id iNT,
    employee_id INT
);

INSERT INTO Project Values 
(1,1),
(1,2),
(1,3),
(2,1),
(2,4);

drop table if exists Employee;
create table Employee (
	employee_id int,
    name VARCHAR(10),
    experience_years int
);

insert into Employee values
(1,'Khaled',3),
(2,'Ali',2),
(3,'John',1),
(4,'Doe',2);



#Solution:
SELECT project_id, AVG(experience_years) average_years
FROM project p
JOIN employee e USING(employee_id)
GROUP BY 1