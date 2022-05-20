create table friendship (
	user1_id int,
    user2_id int
);

insert into friendship values
(1,2),(1,3),(1,4),(2,3),(2,4),(2,5),(6,1);

create table likes (
	user_id int,
	page_id int
);

insert into likes values
(1,88),(2,23),(3,24),(4,56),(5,11),(6,33),(2,77),(3,77),(6,88);


#Solution:SELECT DISTINCT page_id recommended_page
SELECT DISTINCT page_id recommended_page
FROM likes
WHERE user_id IN
(SELECT DISTINCT user2_id friend_id
FROM friendship f1
WHERE user1_id = 1
UNION ALL
SELECT DISTINCT user1_id
FROM friendship f2
WHERE user2_id = 1) AND page_id NOT IN
(SELECT page_id
FROM likes
WHERE user_id = 1)
