drop table if exists actions;
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
(2,2,str_to_date('2019-07-04','%Y-%m-%d'),'view',null),
(2,2,str_to_date('2019-07-04','%Y-%m-%d'),'report','spam'),
(3,4,str_to_date('2019-07-04','%Y-%m-%d'),'view',null),
(3,4,str_to_date('2019-07-04','%Y-%m-%d'),'report','spam'),
(4,3,str_to_date('2019-07-02','%Y-%m-%d'),'view',null),
(4,3,str_to_date('2019-07-02','%Y-%m-%d'),'report','spam'),
(5,2,str_to_date('2019-07-03','%Y-%m-%d'),'view',null),
(5,2,str_to_date('2019-07-03','%Y-%m-%d'),'report','racism'),
(5,5,str_to_date('2019-07-03','%Y-%m-%d'),'view',null),
(5,5,str_to_date('2019-07-03','%Y-%m-%d'),'report','racism');

create table removals (
	post_id int,
    remove_date date
);

insert into removals values
(2,str_to_date('2019-07-20','%Y-%m-%d')),
(3,str_to_date('2019-07-18','%Y-%m-%d'));


#Solution:SELECT ROUND(AVG(pcg)*100,2) average_daily_percent
SELECT ROUND(AVG(pcg)*100,2) average_daily_percent
FROM
(SELECT COUNT(remove_date)/COUNT(*) pcg
FROM actions a
LEFT JOIN removals r USING(post_id)
WHERE extra = 'spam'
GROUP BY action_date
) t1
