---------- SECTION 10 REVISITING SELECTIONS
------- DECIMAL
CREATE TABLE products(price DECIMAL(5,2));

DESC products;

INSERT INTO products (price) VALUES (4.50);
SELECT * FROM products;
INSERT into products (price) VALUES (456.99);
INSERT into products (price) VALUES (1.902);

---------  FLOAT(4 bytes)
---------- Double(8 bytes)

-------- DATE AND TIME

CREATE TABLE people (
    name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);
DESC people;

INSERT INTO people(name, birthdate, birthtime, birthdt) VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');
SELECT * FROM people;
INSERT INTO people(name, birthdate, birthtime, birthdt) VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
INSERT INTO people(name, birthdate, birthtime, birthdt) VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');
------  DATE
SELECT name, DATE(birthdate) AS DateOfBirth FROM people;

------- TIME
SELECT name, TIME(birthtime) FROM people;
------ TIMESTAMP
SELECt name, TIMESTAMP(birthdt) FROM people;
------- CURRENT DATE, TIME, and TIMESTAMP
SELECT CURRENT_DATE();
SELECT CURRENT_TIME();
SELECT CURRENT_TIMESTAMP()
----------
INSERT INTO people(name, birthdate, birthtime, birthdt) VALUES('Hazel', CURDATE(), CURTIME(), now());


SELECT * FROM people;

SELECT DAY(birthdate) FROM people;
SELECT Year(birthdate) FROM people;
SELECT month(birthdate) FROM people;
SELECT dayname(birthdate) FROM people;
SELECT birthdate, dayofweek(birthdate) FROM people;
SELECT birthdate, monthname(birthdate) FROM people;

------------------------------------------------ Time

SELECT name,birthtime, hour(birthtime) FROM people;
SELECT birthtime, minute(birthtime), second(birthtime) FROM people;

---------------- FORMATTING Dates format string
SELECT date_format(birthdate, '%b') AS Month FROM people;
SELECT date_format(birthdate, '%a') AS weekday FROM people;

SELECT date_format(birthdate, '%D') AS MonthDay FROM people;
SELECT date_format(birthdate, '%W') AS weekday_suffix FROM people;

------------------------- DATE MATH
SELECT curdate();
SELECT birthdate, datediff(curdate(), birthdate) AS date_diff FROM people;

SELECT birthdate, date_add(birthdate, Interval 1 Day) AS date_add FROM people;

SELECT birthdate, date_sub(birthdate, interval 1 day) AS date_sub FROM people;

SELECT birthdate, date_sub(birthdate, interval 1 year) AS date_sub FROM people;

SELECT name, birthdt, date_add(birthdt, Interval 21 year) FROM people;
----------------------- DEFAULT & ON UPDATE TIMESTAMP

CREATE TABLE captions(text VARCHAR(150), created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
INSERT INTO captions(text) VALUES ('just me');
INSERT INTO captions(text) VALUES ('Hello its me');
SELECT * FROM captions;


CREATE TABLE captions2(text VARCHAR(150), created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

INSERT INTO captions2(text) VALUES ('I am learning');
SELECT * FROM captions2;
UPDATE captions2 SET text = 'I am learning.....';

UPDATE captions2 SET text = 'I am learning..........';

--------------------- EXERCISE STARTS
SELECT CURTIME();
SELECT CURDATE();

SELECT DAY(CURDATE());
SELECT day(CURDATE())
SELECT date();
SELECT DATE_FORMAT(Curdate(),'%m/' '%d/' '%Y');

SELECT DATE_FORMAT(now(), '%M ' '%D' ' at %l:' '%i');

CREATE TABLE tweets2(content VARCHAR(180), username VARCHAR(50), time_created timestamp DEFAULT CURRENT_TIMESTAMP);

DESC tweets2;



























































