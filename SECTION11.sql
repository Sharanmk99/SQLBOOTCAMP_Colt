------- SECTION 11  Comparsion & Logical Operator
 SELECT * FROM books;
SELECT * FROM books WHERE released_year != 2017;

SELECT title, author_fname FROM books WHERE released_year != 2017;

SELECT title, author_fname FROM books WHERE author_lname = 'Carver';
---- LIKE and NOT LIKE

SELECT title FROM books WHERE title LIKE '% %';
SELECT title FROM books WHERE title NOT LIKE '% %';
SELECT title, author_fname, author_lname FROM books WHERE author_fname LIKE '%DA%';
SELECT title, author_fname, author_lname FROM books WHERE author_fname NOT LIKE '%DA%';

----------- Greather THAN LESSTHAN

SELECT * FROM books WHERE released_year > 2000;
SELECT * FROM books WHERE released_year >= 2000 ORDER BY released_year DESC;
SELECT * FROM books WHERE released_year < 2000;
SELECT * FROM books WHERE released_year <= 2000 ORDER BY released_year DESC;
-------- BOOLEAN

SELECT 80 > 40; ------ boolean returns in the form of 0 and 1

-------------- LOGICAL AND LOGICAL OR
SELECT * FROM books WHERE author_lname = 'Eggers' AND released_year > 2010;

SELECT * FROM books WHERE author_lname = 'Eggers' AND released_year > 2010 AND title LIKE '%Circle%';

SELECT title, pages FROM books WHERE CHAR_LENGTH(title) > 30 AND pages > 500;
------ LOGICAL OR
SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Eggers' OR released_year > 2010;
SELECT title, pages FROM books WHERE pages < 200 OR title LIKE '%stories%';

------------- BETWEEN NOT BETWEEN
SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2015;

SELECT title, released_year FROM books WHERE released_year NOT BETWEEN 2004 AND 2015;

--------------- Comparing DATES
SELECT * FROM people;

SELECT name, birthdate, birthtime FROM people WHERE YEAR(birthdate) < 2005;

SELECT name, birthdate, birthtime FROM people WHERE Hour(birthtime) = 11;
------------ CAST one data type to another

SELECT CAST('09:00:00' AS TIME);

SELECT * FROM people WHERE birthtime BETWEEN CAST('12:00:00' AS TIME) AND CAST('16:00:00' AS TIME);
SELECT * FROM people WHERE HOUR(birthtime) BETWEEN 12 AND 16;

-------------------- IN and NOT In Operator

SELECT title, author_lname FROM books WHERE author_lname IN ('Carver', 'Lahiri');

SELECT title, author_lname FROM books WHERE author_lname NOT IN ('Carver', 'Lahiri');

SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year % 2 = 1; ---- reminder operator odd year

------- CASE statement
SELECT title, released_year,
CASE
WHEN released_year >= 2000 THEN 'Modern List'
ELSE '20th Century Lit'
END AS GENRE
FROM books;


SELECT 
    title,
    stock_quantity,
    CASE
        WHEN
            stock_quantity > 0
                AND stock_quantity < 50
        THEN
            '*'
        WHEN
            stock_quantity > 51
                AND stock_quantity < 100
        THEN
            '**'
        ELSE '***'
    END AS Stock
FROM
    books;

-------- IS NULL

SELECT * FROM books WHERE author_lname IS NULL;

------------ EXERCISE starts
SELECT * FROM books;
SELECT * FROM books WHERE released_year < 1980;

SELECT * FROM books WHERE author_lname = 'Eggers' OR author_lname = 'Chabon';

SELECT * FROM books WHERE author_lname = 'Lahiri' AND released_year > 2000;

SELECT * FROM books WHERE Pages BETWEEN 100 AND 200;

SELECT * FROM books WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%'; -------Starts with C or S

SELECT title, author_lname,
CASE
WHEN title LIKE '%stories%' THEN 'Short Stories'
WHEN title LIKE '%Just Kids%' THEN 'Memoir'
WHEN title LIKE '%A Heartbreaking Work%' THEN 'Memoir'
ELSE 'Novel'
END AS Type
FROM books

SELECT author_fname, author_lname, 
CASE
WHEN COUNT(*) = 1 THEN '1 book'
ELSE CONCAT(COUNT(*), ' books')
END AS count_
FROM books
WHERE author_lname IS NOT NULL
GROUP BY author_fname, author_lname;
























