DROP TABLE IF EXISTS activity;
CREATE TABLE activity (
	user_id INT,
    session_id INT,
    activity_date DATE,
    activity_type ENUM('open_session', 'end_session', 'scroll_down', 'send_message')
);


INSERT INTO activity VALUES
(1,1,str_to_date('2019-07-20', '%Y-%m-%d'), 'open_session'),
(1,1,str_to_date('2019-07-20', '%Y-%m-%d'), 'scroll_down'),
(1,1,str_to_date('2019-07-20', '%Y-%m-%d'), 'end_session'),
(2,4,str_to_date('2019-07-20', '%Y-%m-%d'), 'open_session'),
(2,4,str_to_date('2019-07-21', '%Y-%m-%d'), 'send_message'),
(2,4,str_to_date('2019-07-21', '%Y-%m-%d'), 'end_session'),
(3,2,str_to_date('2019-07-21', '%Y-%m-%d'), 'open_session'),
(3,2,str_to_date('2019-07-21', '%Y-%m-%d'), 'send_message'),
(3,2,str_to_date('2019-07-21', '%Y-%m-%d'), 'end_session'),
(3,5,str_to_date('2019-07-21', '%Y-%m-%d'), 'open_session'),
(3,5,str_to_date('2019-07-21', '%Y-%m-%d'), 'send_message'),
(3,5,str_to_date('2019-07-21', '%Y-%m-%d'), 'end_session'),
(4,3,str_to_date('2019-06-25', '%Y-%m-%d'), 'open_session'),
(4,3,str_to_date('2019-06-25', '%Y-%m-%d'), 'end_session');



#Solution:
SELECT activity_date day, COUNT(DISTINCT user_id) active_users
FROM activity
WHERE activity_date >= '2019-07-27' - INTERVAL 30 day
GROUP BY 1