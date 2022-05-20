drop table if exists logs;
create table logs (
	log_id int
);

insert into logs values
(1),(2),(3),(7),(8),(10);


#Solution:
SELECT MIN(log_id) start_id, MAX(log_id) end_id
FROM
(SELECT *,
		ROW_NUMBER() OVER () row_num
FROM logs) t1
GROUP BY log_id-row_num