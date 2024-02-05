--------- Section 8 starts

------- DISTINCT
SELECT * FROM books;
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
SELECT COUNT(*) FROM books;

SELECT author_lname FROM books;
SELECT DISTINCT  author_lname FROM books;

SELECT released_year FROM books;

SELECT DISTINCT released_year FROM books;

SELECT CONCAT(author_fname, ' ', author_lname) AS author_fullName FROM books;

SELECT DISTINCT CONCAT(author_fname, ' ', author_lname) AS author_fullName FROM books;

---------------- OREDER BY

SELECT book_id, title, author_lname FROM books;

SELECT book_id, author_fname, author_lname FROM books ORDER BY author_lname;

SELECT book_id, author_fname, author_lname FROM books ORDER BY author_lname DESC;

SELECT title, pages FROM books;

SELECT title, pages FROM books ORDER BY pages;

SELECT title, pages FROM books ORDER BY pages DESC;

SELECT title, pages FROM books ORDER BY released_year;

SELECT title, pages, released_year FROM books ORDER BY released_year;

--------- Order by short term giving column number

SELECT title, pages FROM books ORDER BY 2;
----- ORDER BY MULTIPLE COLUMNS

SELECT author_lname, released_year, title FROM books ORDER BY author_lname, released_year;

SELECT author_lname, released_year, title FROM books ORDER BY author_lname, released_year DESC;

SELECT CONCAT(author_fname,' ', author_lname) AS author FROM books ORDER BY author;

------ LIMIT
SELECT book_id, title, released_year FROM books LIMIT 15;

SELECT book_id, title, released_year FROM books ORDER BY released_year LIMIT 5;

SELECT book_id, title, released_year FROM books ORDER BY released_year LIMIT 1, 5;

SELECT book_id, title, released_year FROM books ORDER BY released_year LIMIT 5, 7;
SELECT book_id, title FROM books ORDER BY released_year LIMIT 30, 32;

--------- LIKE operator
SELECT 
    title, author_lname, author_fname
FROM
    books
WHERE
    author_fname LIKE '%DA%';


SELECT 
    *
FROM
    books
WHERE
    title LIKE '%:%';
    
SELECT * FROM books WHERE author_fname LIKE '____';

SELECT * FROM books WHERE author_fname LIKE '_____';

SELECT 
    *
FROM
    books
WHERE
    author_fname LIKE '_a_';


SELECT 
    *
FROM
    books
WHERE
    author_fname LIKE '%n';
    
-------------------- ESCAPING WILDCARDS
SELECT 
    *
FROM
    books
WHERE
    title LIKE '%\%%'; 


SELECT 
    *
FROM
    books
WHERE
    title LIKE '%\_%'; 
    
---------------------- EXCERCISE STARTS
SELECT 
    *
FROM
    books
WHERE
    title LIKE '%stories%';

SELECT 
    title, pages
FROM
    books
ORDER BY pages DESC
LIMIT 1;

SELECT 
   CONCAT(title,' - ' ,released_year) AS summary
FROM
    books
ORDER BY released_year DESC
LIMIT 3;

SELECT 
    title, author_lname
FROM
    books
WHERE
    author_lname LIKE '%\ %';

SELECT 
    title, released_year, stock_quantity
FROM
    books
ORDER BY stock_quantity
LIMIT 3;

SELECT 
    title, author_lname
FROM
    books
ORDER BY author_lname , title;



SELECT 
    CONCAT('MY FAVOURITE AUTHOR IS ',
            UCASE(author_fname),
            ' ',
            UCASE(author_lname),
            '!') AS Yell
FROM
    books
ORDER BY author_lname;


-------------------- EXERCISE COMPLETED
































































































































