------ SECTION 7 STRING FUNCTION STARTS

CREATE DATABASE book_shop;
SHOW DATABASES;
USE book_shop;

CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


SELECT * FROM books;
DESC books;

-------- CONCAT Function

SELECT CONCAT(author_fname, '!!!') FROM books;
SELECT CONCAT(author_fname, ' ',author_lname) AS full_Name FROM books;

-------- CONCAT_WS function

SELECT CONCAT_WS(' - ', title, author_fname, author_lname) AS author_name FROM books;

------ SUBSTRING

SELECT SUBSTRING('Hello World', 1, 6);

SELECT SUBSTRING('Hello World', 7);

SELECT SUBSTRING('Hello World', -3);

SELECT title FROM books;

SELECT SUBSTRING(title, 1, 15) FROM books;
------- SUBSTRING() is a synonym for SUBSTR()

SELECT * FROM books;

SELECT SUBSTRING(author_lname, 1, 1) AS Initial, author_lname FROM books;

SELECT 
    CONCAT(SUBSTRING(title, 1, 10), '...') AS Short_title
FROM
    books;

SELECT 
    CONCAT(SUBSTR(author_fname, 1, 1),
            '.',
            SUBSTR(author_lname, 1, 1),
            '.') AS short
FROM
    books;
    
    
------- REPLACE
SELECT REPLACE('Hello World', 'Hell', '%$#@');
SELECT REPLACE('cheese bread coffee milk', ' ' , ' and ');

SELECT * FROM books;

SELECT 
    REPLACE(title, ' ', '-') AS New_Title
FROM
    books;

------ REVERSE

SELECT REVERSE(title) FROM books;

SELECT 
    CONCAT(author_fname, REVERSE(author_fname)) AS Name_Reverse
FROM
    books;

----- CHAR_Length gives number of characters and Lenth function is measuerd in bytes

SELECT 
    CHAR_LENGTH(title) AS len, title
FROM
    books;
    
----- UPPER or UCASE and LOWER or LCASE

SELECT 
   CONCAT('I LOVE ', UCASE(title), ' !!!')
FROM
    books;
------  INSERT

SELECT INSERT(title, 3, 0, 'Hay reading') , title FROM books;

----- LEFT, RIGHT
SELECT 
    LEFT(title, 5), title
FROM
    books;
    
SELECT 
    RIGHT(title, 5), title
FROM
    books;

SELECT 
    LEFT(author_lname, 1), title
FROM
    books;

----- REPEAT and TRIM

----- EXERCISE

SELECT UCASE('why does my cat look at me with such hatred?');

SELECT REPLACE(title, ' ', '->') AS New_Title FROM books;

SELECT 
    author_lname AS forwards, REVERSE(author_lname) AS backwards
FROM
    books;

SELECT 
    UCASE(CONCAT(author_fname, ' ', author_lname)) AS full_name_in_caps
FROM
    books;  
    

SELECT * FROM books;

SELECT 
    CONCAT(title, ' was released in ', released_year) AS blurb
FROM
    books;

SELECT title, CHAR_LENGTH(title) AS character_count FROM books;

SELECT 
    CONCAT(SUBSTR(title, 1, 10), '...') AS short_title,
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM
    books;


--------------- COMPLETED SECTION 7 with EXERCISE

















































