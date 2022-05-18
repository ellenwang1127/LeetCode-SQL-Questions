drop table if exists Views;
CREATE TABLE Views (
	article_id INT,
    author_id INT,
    view_id INT,
    view_date DATE
);

INSERT INTO Views VALUES
(1,3,5,str_to_date('2019-08-01', '%Y-%m-%d')),
(3,4,5,str_to_date('2019-08-01', '%Y-%m-%d')),
(1,3,6,str_to_date('2019-08-02', '%Y-%m-%d')),
(2,7,7,str_to_date('2019-08-01', '%Y-%m-%d')),
(2,7,6,str_to_date('2019-08-02', '%Y-%m-%d')),
(4,7,1,str_to_date('2019-07-22', '%Y-%m-%d')),
(3,4,4,str_to_date('2019-07-21', '%Y-%m-%d')),
(3,4,4,str_to_date('2019-07-21', '%Y-%m-%d'));


#Solution:
SELECT DISTINCT view_id id
FROM views
GROUP BY view_id, view_date
HAVING COUNT(DISTINCT article_id) > 1