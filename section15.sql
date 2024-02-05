------------------------------- SECTION 15
USE tv_db;

SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON 
series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;

------ Introducing VIEWS
CREATE VIEW full_reviews AS 
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON 
series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;

SHOW tables;  --------------- full_reviews table is created

SELECT * FROM full_reviews;

SELECT * FROM full_reviews WHERE genre = 'Animation';

SELECT genre, AVG(rating) FROM full_reviews GROUP BY genre;

---------- UPDATEABLE Views
SELECT * FROM full_reviews;

DELETE FROM full_reviews WHERE released_year = 2010; ---- Cannot delete bcz it is not real table

SELECT * FROM series ORDER BY released_year;

CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

SELECT * FROM ordered_series;
INSERT INTO ordered_series(title, released_year, genre) VALUES ('The Great', 2020, 'comedy'); ---- it is not a true table bcz it doesnt have joins aggregate function having etc

SELECT * FROM ordered_series;
DELETE FROM ordered_series WHERE title = 'The Great'; ----- it is a virtual table, not a orginal table

SELECT * FROM ordered_series;

-------------------------- REPLACING/ALTERING VIEWS

SELECT * FROM ordered_series;

CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC; ----- ordered_series table exist

CREATE OR REPLACE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC; ----- if table is not created it will create and if exist it will update the table

SELECT * FROM ordered_series; ------ released_year in DESC order

ALTER VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

SELECT * FROM ordered_series;

DROP VIEW ordered_series; ----- dropped the table but the data is not deleted
SELECT * FROM ordered_series; ---- not exist

SELECT * FROM series;

--------------------- GROUP BY HAVING
SELECT * FROM full_reviews;


SELECT title, AVG(rating) FROM full_reviews GROUP BY title;

SELECT title, AVG(rating), COUNT(rating) AS review_count FROM full_reviews GROUP BY title
HAVING
COUNT(rating) > 1;

--------------------------------  GROUP BY ROLL update

SELECT * FROM full_reviews;

SELECT title, AVG(rating) FROM full_reviews GROUP BY title WITH ROLLUP; ----- ROLLUP will work only with GROUP and at the last will provide avg for the whole column

SELECT title, COUNT(rating) FROM full_reviews GROUP BY title WITH ROLLUP; ----- at the last it will give the total count as 47

SELECT released_year, AVG(rating) FROM full_reviews GROUP BY released_year;

SELECT released_year, AVG(rating) FROM full_reviews GROUP BY released_year WITH ROLLUP;


----- GROUP by multiple column for ROLLUP
SELECT released_year, genre, AVG(rating) FROM full_reviews GROUP BY released_year, genre WITH ROLLUP;    ------ avg for each released year and average columns

------------------ SQL MODES BASICS
------ GLOBAL MODE and SESSION MODE

SELECT @@GLOBAL.sql_mode;

SELECT @@SESSION.sql_mode;






































