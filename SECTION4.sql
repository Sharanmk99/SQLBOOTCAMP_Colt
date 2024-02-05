------ INSERT STATEMENT

SHOW TABLES;
CREATE TABLE cats (name VARCHAR(50), age INT)
DESC cats;

INSERT INTO cats (name, age) VALUES ("Blue Steele", 5);
INSERT INTO cats(name, age) VALUES ("Jenkins", 7);

SELECT * FROM cats;

INSERT INTO cats(age, name) VALUES (2, "Beth");
INSERT INTO cats(age, name) VALUES (8, "Linus");

INSERT INTO cats(age, name) VALUES ("XYZ", 10);
--- Multi Insert
INSERT INTO cats(name, age) VALUES ("Metaball", 5), ("Turkey", 1), ("Potato", 15);

SELECT * FROM cats;

CREATE TABLE people(first_name VARCHAR(20), last_name VARCHAR(20), age INT);
DESC people;

INSERT INTO people(first_name, last_name, age) VALUES ("Tina", "Belcher", 13);
INSERT INTO people(first_name, last_name, age) VALUES ("Bob", "Belcher", 42);

INSERT INTO people(first_name, last_name, age) VALUES ("Linda", "Belcher", 45), ("Phillip", "Frond", 38), ("Calvin", "Fischoeder", 70);

SELECT* FROM people;

DROP TABLE people;

SHOW TABLES;
--------- NULL
INSERT INTO cats(name) VALUES ("TODD");
DESC cats;
SELECT * FROM cats;

INSERT INTO cats() VALUES ();

----------- NOT NULL
CREATE TABLE cats2 (name VARCHAR(50) NOT NULL, age INT NOT NULL);

INSERT INTO cats2 (name) VALUES ("Bilbo");
SELECT * FROM cats2;

INSERT INTO cats2(name, age) VALUES ("Bilbo", 19);
INSERT INTO cats2(age) VALUES (29);

DESC cats2;


CREATE TABLE shops(name VARCHAR(100));

SELECT * FROM shops;

INSERT INTO shops(name) VALUES ('shoe emporium');
------ when name is "mario's"
------- need to insert into double quote but as standrd pratice need to use single quote by backslah(\)

INSERT INTO shops(name) VALUES ("mario's pizza");

INSERT INTO shops(name) VALUES ('sulthan\'s power');
----- For double quote no need backslah
INSERT INTO shops(name) VALUES('She said "haha"');

----------- DEFAULT VALUES

CREATE TABLE cats3(name VARCHAR(50) DEFAULT 'Mystery', age INT DEFAULT 99);
DESC cats3;

INSERT cats3(age) VALUES (10);
SELECT * FROM cats3;

INSERT INTO cats3() VALUES ();

INSERT INTO cats3(name, age) VALUES (NULL, NULL);

CREATE TABLE cats4(name VARCHAR(100) NOT NULL DEFAULT 'unnamed', age INT NOT NULL DEFAULT 99);
SELECT * FROM cats4;

INSERT INTO cats4(name, age) VALUES (NULL, NULL);
INSERT INTO cats4 () VALUES();

---------- INTRODUCING PRIMARY KEY

CREATE TABLE unique_cats (cat_id INT NOT NULL PRIMARY KEY, name VARCHAR(100), age INT);
DESC unique_cats;

INSERT INTO unique_cats(cat_id, name, age) VALUES (1, 'bingo', 2);
SELECT * FROM unique_cats;

INSERT INTO unique_cats(cat_id, name, age) VALUES (1, 'bongo', 3);

INSERT INTO unique_cats(cat_id, name, age) VALUES (2, 'bongo', 3);

DROP TABLE unique_cats;

CREATE TABLE unique_cats (cat_id INT, name VARCHAR(100), age INT, PRIMARY KEY(cat_id));

INSERT INTO unique_cats(cat_id, name, age) VALUES (1, 'Oingo', 2);
SELECT * FROM unique_cats;

INSERT INTO unique_cats(cat_id, name, age) VALUES ('Oingo', 2); ----- error

INSERT INTO unique_cats(name, age) VALUES ('Oingo', 2);
DESC unique_cats;


------- AUTO INCREMENT

CREATE TABLE unique_cats3 (cat_id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(100), age INT);
SELECT * FROM unique_cats3;

INSERT INTO unique_cats3(name, age) VALUES ('Boingo', 1);
INSERT INTO unique_cats3(name, age) VALUES ('Boingo', 1);
INSERT INTO unique_cats3(name, age) VALUES ('Boingo', 1);
INSERT INTO unique_cats3(name, age) VALUES ('Boingo', 1);
INSERT INTO unique_cats3(name, age) VALUES ('Boingo', 1);
INSERT INTO unique_cats3(name, age) VALUES ('Boingo', 1);

DESC unique_cats3;

----------- SECTION 4 COMPLETED



























































