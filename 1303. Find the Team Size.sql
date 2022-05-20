drop table if exists employee;
create table employee (
	employee_id int,
    team_id int
);

insert into employee values
(1,8),(2,8),(3,8),(4,7),(5,9),(6,9);


#Solution:
SELECT employee_id,
		COUNT(*) OVER (PARTITION BY team_id) team_size
FROM employee        
