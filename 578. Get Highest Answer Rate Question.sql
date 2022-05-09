CREATE TABLE survey_log(
	uid INT,
    action VARCHAR(10),
    question_id INT,
    answer_id INT,
    q_num INT,
    timestamp INT
);

INSERT INTO survey_log Values
(5,'show',285,null,1,123),
(5,'answer',285,124124,1,124),
(5,'show',369,null,2,125),
(5,'skip',369,null,2,126);

#Solution:
SELECT survey_log
FROM
(SELECT question_id survey_log,
		SUM(CASE WHEN action='answer' THEN 1 ELSE 0 END)/SUM(CASE WHEN action='show' THEN 1 ELSE 0 END) answer_rate
FROM survey_log
GROUP BY question_id
ORDER BY 2 DESC
LIMIT 1) t1