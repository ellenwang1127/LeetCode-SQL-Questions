drop table if exists requestaccepted;
create table requestaccepted (
	requester_id int,
    accepter_id int,
    accept_date date
);

insert into requestaccepted values
(1,2,str_to_date('2016/06/01','%Y/%m/%d')),
(1,3,str_to_date('2016/06/08','%Y/%m/%d')),
(2,3,str_to_date('2016/06/08','%Y/%m/%d')),
(3,4,str_to_date('2016/06/09','%Y/%m/%d'));



#Solution:
SELECT id, COUNT(id) num
FROM
(SELECT requester_id id
FROM requestaccepted r1
UNION ALL
SELECT accepter_id
FROM requestaccepted r2) t1
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 1