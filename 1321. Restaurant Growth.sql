drop table if exists customer;
create table customer (
	customer_id int,
    name varchar(15),
    visited_on date,
    amount int
);

insert into customer values
(1,'Jhon',str_to_date('2019-01-01','%Y-%m-%d'),100),
(2,'Daniel',str_to_date('2019-01-02','%Y-%m-%d'),110),
(3,'Jade',str_to_date('2019-01-03','%Y-%m-%d'),120),
(4,'Khaled',str_to_date('2019-01-04','%Y-%m-%d'),130),
(5,'Winston',str_to_date('2019-01-05','%Y-%m-%d'),110),
(6,'Elvis',str_to_date('2019-01-06','%Y-%m-%d'),140),
(7,'Anna',str_to_date('2019-01-07','%Y-%m-%d'),150),
(8,'Maria',str_to_date('2019-01-08','%Y-%m-%d'),80),
(9,'Jaze',str_to_date('2019-01-09','%Y-%m-%d'),110),
(1,'Jhon',str_to_date('2019-01-10','%Y-%m-%d'),130),
(3,'Jade',str_to_date('2019-01-10','%Y-%m-%d'),150);


#Solution:
select t2.visited_on, sum(t1.amount) amount,
		round(avg(t1.amount),2) average_amount
from (
    select visited_on, sum(amount) as amount
    from Customer
    group by visited_on) as t1
    inner join
     (
    select visited_on, sum(amount) as amount
    from Customer
    group by visited_on) as t2
on t2.visited_on between t1.visited_on - interval 6 day and t1.visited_on 
group by t2.visited_on
having count(t2.visited_on) = 7