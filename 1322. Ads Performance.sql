create table ads (
	ad_id int,
    user_id int,
    action enum('clicked','viewed','ignored')
);

insert into ads values
(1,1,'clicked'),
(2,2,'clicked'),
(3,3,'viewed'),
(5,5,'ignored'),
(1,7,'ignored'),
(2,7,'viewed'),
(3,5,'clicked'),
(1,4,'viewed'),
(2,11,'viewed'),
(1,2,'clicked');


#Solution:
SELECT ad_id,
		IFNULL(ROUND(SUM(CASE WHEN action = 'clicked' THEN 1 ELSE 0 END)
        /SUM(CASE WHEN action != 'ignored' THEN 1 ELSE 0 END)*100,2),0) ctr
FROM ads
GROUP BY 1
ORDER BY ctr DESC, ad_id