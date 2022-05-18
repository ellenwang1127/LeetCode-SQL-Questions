drop table if exists transactions;
create table transactions (
	id int,
    country varchar(10),
    state ENUM('approved','declined'),
    amount int,
    trans_date date
);

create table chargebacks (
	trans_id int,
    trans_date date
);

insert into transactions values
(101,'US','approved',1000,str_to_date('2019-05-18','%Y-%m-%d')),
(102,'US','declined',2000,str_to_date('2019-05-19','%Y-%m-%d')),
(103,'US','approved',3000,str_to_date('2019-06-10','%Y-%m-%d')),
(104,'US','approved',4000,str_to_date('2019-06-13','%Y-%m-%d')),
(105,'US','approved',5000,str_to_date('2019-06-15','%Y-%m-%d'));

insert into chargebacks values
(102,str_to_date('2019-05-29','%Y-%m-%d')),
(101,str_to_date('2019-06-30','%Y-%m-%d')),
(105,str_to_date('2019-09-19','%Y-%m-%d'));



#Solution:
select date_format(trans_date, '%Y-%m') as month, country, 
        sum(case when state = 'approved' then 1 else 0 end) as approved_count,
        sum(case when state = 'approved' then amount else 0 end) as approved_amount,
        sum(case when state = 'chargeback' then 1 else 0 end) as chargeback_count,
        sum(case when state = 'chargeback' then amount else 0 end) as chargeback_amount
from
	(select c.trans_id, t.country, 'chargeback' as state, t.amount, c.trans_date
    from Chargebacks as c join Transactions t on c.trans_id = t.id
    union all
    select *
    from Transactions) t1
group by 1,2    
having approved_amount > 0 or chargeback_amount > 0
