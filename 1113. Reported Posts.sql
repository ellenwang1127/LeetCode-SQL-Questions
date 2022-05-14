create table actions (
	user_id int,
    post_id int,
    action_date date,
    action ENUM('view','like','reaction','comment','report','share'),
    extra varchar(10)
);

insert into actions values
(1,1,str_to_date('2019-07-01','%Y-%m-%d'),'view',null),
(1,1,str_to_date('2019-07-01','%Y-%m-%d'),'like',null),
(1,1,str_to_date('2019-07-01','%Y-%m-%d'),'share',null),
(2,4,str_to_date('2019-07-04','%Y-%m-%d'),'view',null),
(2,4,str_to_date('2019-07-04','%Y-%m-%d'),'report','spam'),
(3,4,str_to_date('2019-07-04','%Y-%m-%d'),'view',null),
(3,4,str_to_date('2019-07-04','%Y-%m-%d'),'report','spam'),
(4,3,str_to_date('2019-07-02','%Y-%m-%d'),'view',null),
(4,3,str_to_date('2019-07-02','%Y-%m-%d'),'report','spam'),
(5,2,str_to_date('2019-07-04','%Y-%m-%d'),'view',null),
(5,2,str_to_date('2019-07-04','%Y-%m-%d'),'report','racism'),
(5,5,str_to_date('2019-07-04','%Y-%m-%d'),'view',null),
(5,5,str_to_date('2019-07-04','%Y-%m-%d'),'report','racism');


#Solution:
SELECT extra report_reason, COUNT(DISTINCT post_id) report_count
FROM actions
WHERE action_date = '2019-07-04' AND extra IS NOT NULL
GROUP BY extra
ORDER BY 2
