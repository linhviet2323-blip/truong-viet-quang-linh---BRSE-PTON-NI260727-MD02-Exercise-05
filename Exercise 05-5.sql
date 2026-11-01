CREATE DATABASE session05db;
USE session05db;
CREATE TABLE scores (
    score_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id VARCHAR(10) NOT NULL,
    subject_name VARCHAR(100) NOT NULL,
    score FLOAT NOT NULL
);
DROP TABLE scores;
INSERT INTO scores
(student_id,subject_name, score)
VALUES
('SV001', 'MySQL', 7.5),
('SV001', 'HTML', 9.0),
('SV002', 'MySQL', 6.0),
('SV002', 'HTML', 8.0),
('SV003', 'MySQL', 5.5),
('SV003', 'HTML', 9.0);
UPDATE scores
SET score = 7.0
WHERE score_id = 4;
SELECT * FROM scores;
SELECT student_id,
AVG(score)
FROM scores
GROUP BY student_id;
SELECT student_id,
AVG(score)
FROM scores
GROUP BY student_id
HAVING AVG(score) >= 7.0;
SELECT student_id,
       AVG(score) AS avg_score
FROM scores
GROUP BY student_id
HAVING AVG(score) = (
    SELECT MAX(avg_score)
    FROM (
        SELECT AVG(score) AS avg_score
        FROM scores
        GROUP BY student_id
    ) AS t
);
SELECT student_id,
       AVG(score) AS avg_score
FROM scores
GROUP BY student_id
HAVING AVG(score) > (
    SELECT AVG(score)
    FROM scores
);