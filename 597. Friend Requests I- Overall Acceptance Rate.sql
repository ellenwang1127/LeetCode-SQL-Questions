create table friendrequest (
	sender_id int,
    send_to_id int,
    request_date date
);

insert into friendrequest values
(1,2,str_to_date('2016/06/01','%Y/%m/%d')),
(1,3,str_to_date('2016/06/01','%Y/%m/%d')),
(1,4,str_to_date('2016/06/01','%Y/%m/%d')),
(2,3,str_to_date('2016/06/02','%Y/%m/%d')),
(3,4,str_to_date('2016/06/09','%Y/%m/%d'));

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
(3,4,str_to_date('2016/06/09','%Y/%m/%d')),
(3,4,str_to_date('2016/06/10','%Y/%m/%d'));


#Solution:
SELECT ROUND(IFNULL(
(SELECT COUNT(*)
FROM
(SELECT DISTINCT requester_id, accepter_id
FROM requestaccepted) t1)
/
(SELECT COUNT(*)
FROM
(SELECT DISTINCT sender_id, send_to_id
FROM friendrequest) t2),
0),2) accept_rate

