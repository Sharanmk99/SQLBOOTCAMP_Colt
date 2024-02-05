------- SECTION 9 AGGREGATE FUNCTION

------ COUNT function

SELECT COUNT(*) FROM books;

SELECT COUNT(author_fname) FROM books;

SELECT COUNT(DISTINCT author_fname) AS Count FROM books;

SELECT COUNT(DISTINCT released_year) AS count_books FROM books;

SELECT COUNT(DISTINCT author_lname) AS Count_lname FROM books;

SELECT title FROM books;
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';
------ GROUP BY
SELECT author_lname, COUNT(*) AS COUNT_Names FROM books GROUP BY author_lname ORDER BY COUNT_Names DESC;

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

-------- MIN and MAX function
SELECT MIN(released_year) FROM books;
SELECT MAX(pages) FROM books;

SELECT MIN(author_lname), MAX(author_lname) FROM books;

SELECT * FROM books;

------- SUBQUERIES
SELECT 
    *
FROM
    books
WHERE
    PAGES = (SELECT 
            MAX(pages)
        FROM
            books);
            
INSERT INTO books (title, pages) VALUES ('My Life', 634);
SELECT 
    *
FROM
    books
WHERE
    PAGES = (SELECT 
            MAX(pages)
        FROM
            books);
            

SELECT title, released_year FROM books WHERE released_year = (SELECT MIN(released_year) FROM books);

--------- GROUPING BY
SELECT 
    author_fname, author_lname, COUNT(*) AS author_count
FROM
    books
GROUP BY author_lname , author_fname;

----- MIN and MAX Group BY

SELECT CONCAT(author_fname, ' ', author_lname) AS author, MIN(released_year) FROM books GROUP BY author;

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author,
    COUNT(*),
    MAX(released_year),
    MAX(pages)
FROM
    books
GROUP BY author;
--------------------------------------- SUM
SELECT SUM(pages) FROM books;

SELECT 
    author_lname, SUM(pages)
FROM
    books
GROUP BY author_lname;

------------------ AVG

SELECT AVG(released_year) FROM books;

SELECT AVG(pages) FROM books;

SELECT released_year, AVG(stock_quantity), COUNT(*) FROM books GROUP BY released_year;
------------ EXERCISE STARTS
SELECT COUNT(*) FROM books;

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT SUM(stock_quantity) FROM books;

SELECT author_lname,author_fname, AVG(released_year) FROM books GROUP BY author_lname, author_fname;

SELECT CONCAT(author_lname, ' ' , author_fname) AS author, pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);


SELECT * FROM books;

SELECT released_year AS year, COUNT(released_year) AS '# books', AVG(pages) AS 'avg pages' FROM books GROUP BY released_year ORDER BY  released_year;



----------- COMPLETED





























































