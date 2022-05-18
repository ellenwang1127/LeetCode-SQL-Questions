drop table if exists delivery;
create table delivery (
	delivery_id int,
    customer_id int,
    order_date date,
    customer_pref_delivery date
);

insert into delivery values
(1,1,str_to_date('2019-08-01', '%Y-%m-%d'),str_to_date('2019-08-02', '%Y-%m-%d')),
(2,5,str_to_date('2019-08-02', '%Y-%m-%d'),str_to_date('2019-08-02', '%Y-%m-%d')),
(3,1,str_to_date('2019-08-11', '%Y-%m-%d'),str_to_date('2019-08-11', '%Y-%m-%d')),
(4,3,str_to_date('2019-08-24', '%Y-%m-%d'),str_to_date('2019-08-26', '%Y-%m-%d')),
(5,4,str_to_date('2019-08-21', '%Y-%m-%d'),str_to_date('2019-08-22', '%Y-%m-%d')),
(6,2,str_to_date('2019-08-11', '%Y-%m-%d'),str_to_date('2019-08-13', '%Y-%m-%d'));


#Solution:
SELECT ROUND(SUM(CASE WHEN order_date=customer_pref_delivery THEN 1 ELSE 0 END)
/COUNT(DISTINCT delivery_id)*100,2) immediate_percentage
FROM delivery