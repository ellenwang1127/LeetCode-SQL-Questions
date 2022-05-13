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
(3,'John',3),
(4,'Doe',2);



#Solution 1: window function
SELECT project_id, employee_id
FROM
(SELECT project_id, employee_id,
		RANK() OVER (PARTITION BY project_id ORDER BY experience_years DESC) rnk
FROM project p
LEFT JOIN employee e USING(employee_id)) t1
WHERE rnk = 1


#Solution 2: subquery
SELECT project_id, employee_id
FROM project
LEFT JOIN employee e USING(employee_id)
WHERE (project_id, experience_years) IN
(SELECT project_id, MAX(experience_years) max_year
FROM project p
LEFT JOIN employee e USING(employee_id)
GROUP BY 1) 
