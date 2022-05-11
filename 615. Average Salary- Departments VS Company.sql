create table salary (
	id INT,
    employee_id INT,
    amount INT,
    pay_date DATE
);

insert into salary values
(1,1,9000,str_to_date('2017-03-31', '%Y-%m-%d')),
(2,2,6000,str_to_date('2017-03-31', '%Y-%m-%d')),
(3,3,10000,str_to_date('2017-03-31', '%Y-%m-%d')),
(4,1,7000,str_to_date('2017-02-28', '%Y-%m-%d')),
(5,2,6000,str_to_date('2017-02-28', '%Y-%m-%d')),
(6,3,8000,str_to_date('2017-02-28', '%Y-%m-%d'));

drop table if exists employee;
create table employee (
	employee_id INT,
    department_id INT
);

insert into employee values
(1,1),
(2,2),
(3,2);


#Solution 1: window function
WITH t1 AS
(SELECT date_format(pay_date,'%Y-%m') pay_month, department_id,
		AVG(amount) OVER (PARTITION BY pay_date) com_avg,
        AVG(amount) OVER (PARTITION BY pay_date, department_id) dept_avg
FROM salary s
JOIN employee e USING(employee_id))

SELECT DISTINCT pay_month, department_id,
		CASE WHEN dept_avg > com_avg THEN 'higher'
			 WHEN dept_avg < com_avg THEN 'lower'
             ELSE 'same' END AS comparison
FROM t1



#Solution 2: join, subquery
WITH t1 AS (
SELECT date_format(pay_date, '%Y-%m') pay_month, AVG(amount) com_avg
FROM salary
GROUP BY pay_month),
	t2 AS (
SELECT date_format(pay_date, '%Y-%m') pay_month, department_id, AVG(amount) dept_avg
FROM salary s
JOIN employee e USING(employee_id)
GROUP BY 1,2)
SELECT t1.pay_month, department_id,
		CASE WHEN dept_avg > com_avg THEN 'higher'
			 WHEN dept_avg < com_avg THEN 'lower'
             ELSE 'same' END AS comparison
FROM t1
JOIN t2 USING(pay_month)






