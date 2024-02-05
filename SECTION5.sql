------ SECTION5 start

---- CRUD operation

SHOW TABLES;

DROP TABLE cats;

CREATE TABLE cats (cat_id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100), breed VARCHAR(100), age INT);

DESC cats;

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

SELECT * FROM cats;


------- READ

SELECT name FROM cats;
SELECT age FROM cats;

SELECT name, age, breed FROM cats;

---- WHERE

SELECT * FROM cats WHERE age = 4;
SELECT name, age FROM cats WHERE age = 4;

SELECT name FROM cats WHERE age = 4;

SELECT * FROM cats WHERE name = 'Egg';

------- Aliases name

SELECT cat_id AS id, name FROM cats;
SELECT name AS kittyName FROM cats;

------ UPDATE

----- UPDATE SET is pair
SHOW TABLES;
SELECT * FROM cats;
UPDATE cats SET age = 14 WHERE name  = 'Misty';

----- UPDATE and DELETE take more befor doing
------ DELETE
DELETE FROM cats WHERE name = 'Egg';

DELETE FROM cats; ---- Delete all rows but table exist


























