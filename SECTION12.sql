-------  SECTION 12 CONSTRAINTS AND ALTER TABLE
------ UNIQUE

CREATE TABLE contacts(name VARCHAR(100), phone VARCHAR(15) NOT NULL UNIQUE);
SELECT * FROM contacts;

INSERT INTO contacts(name, phone) VALUES ('billybob', '9591111940');
INSERT INTO contacts(name, phone) VALUES ('timmytimtim', '9591111940'); ------- ERROR bcz of duplicate phone
INSERT INTO contacts(name, phone) VALUES ('billybob', '959111194'); ----- name can have duplicate values

------------ CHECK CONSTRAINTS

CREATE TABLE users(username VARCHAR(20) NOT NULL, age INT CHECK (age > 0));

INSERT INTO users (username, age) VALUES ('bluethecat', 50);
INSERT INTO users (username, age) VALUES ('Coltsteels', -3); ---- CHECK constraint is voilated as check condition fail

SELECT * FROM users;

CREATE TABLE palindromes(word VARCHAR(100), CHECK (REVERSE(word) = word))

INSERT INTO palindromes (word) VALUES ('racecar');
INSERT INTO palindromes (word) VALUES ('mom');
SELECT * FROM palindromes;

INSERT INTO palindromes (word) VALUES ('mommy'); --------  word is not a palindrome

 -------- NAMED constraint
 
CREATE TABLE users2(username VARCHAR(20) NOT NULL, age INT CONSTRAINT age_not_negative CHECK(age >= 0));

INSERT INTO users2(username, age) VALUES ('chickenlady', -3); -------- customize name as age_not_negative voilated


CREATE TABLE palindromes2(word VARCHAR(100) CONSTRAINT word_is_not_reverse CHECK (REVERSE(word) = word));
INSERT INTO palindromes2 (word) VALUES ('racecar');
INSERT INTO palindromes2 (word) VALUES ('mommy');  ------- CHECK constraint 'word_is_not_reverse' voilated

------------------------  Multi columns CHECKS
CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address)
);

INSERT INTO companies(name, address) VALUES ('auto', '123 spruce');
INSERT INTO companies(name, address) VALUES ('luigis pies', '123 spruce');
INSERT INTO companies(name, address) VALUES ('luigis pies', '123 spruce'); ---- Duplicate entry not allowed

CREATE TABLE houses(purchase_price INT NOT NULL, sale_price INT NOT NULL, CONSTRAINT sale_price_purchseprice CHECK (sale_price >= purchase_price));

INSERT INTO houses(purchase_price, sale_price) VALUES (100, 200);

INSERT INTO houses(purchase_price, sale_price) VALUES (300, 250); ------- sale_price_purchaseprice is voilated

--------------- ALTER TABLE

SELECT * FROM companies;

ALTER TABLE companies ADD COLUMN phone VARCHAR(15);

ALTER TABLE companies ADD COLUMN employee_count INT NOT NULL;


---------- DROPcolumn

ALTER TABLE companies DROP COLUMN phone;

SELECT * FROM companies;
ALTER TABLE companies DROP COLUMN employee_count;

-------- RENAMING TABLE, COLUMNS

SHOW TABLES;
SELECT * FROM companies;

RENAME TABLE companies TO Suppliers;

SELECT * FROM companies; ----- NOT exist after rename

SELECT * FROM Suppliers;

----- other way of renaming table using ALTER

ALTER TABLE Suppliers RENAME TO companies;
SELECT * FROM Suppliers; ---- NOT exist after rename
SELECT * FROM companies;
SHOW TABLES;
------ RENAMING COLUMNS

ALTER TABLE companies RENAME COLUMN name TO Company_Name;
SELECT * FROM companies;

---------------- ALTER TABLE: MODIFY COLUMNS

DESC companies;

ALTER TABLE companies MODIFY Company_Name VARCHAR(100) DEFAULT 'Unknown';
DESC companies;

INSERT INTO companies(address) VALUES ('2554 rose lane');
SELECT * FROM companies;
 ---------- ALTER TABLE CONSTRAINT
 
 SELECT * FROM houses;
 DESC houses;
 
 ALTER TABLE houses ADD CONSTRAINT positive_price CHECK(purchase_price >= 0);
 
 INSERT INTO houses(purchase_price, sale_price) VALUES (-1, 4); ----- positive_price is voilated
---- DROP CONSTRAINT
ALTER TABLE houses DROP CONSTRAINT positive_price;

INSERT INTO houses(purchase_price, sale_price) VALUES (-1, 4);
SELECT * FROM houses;



































