---------------- One to Many & Joins

----- RELATIONSHIPS AND JOINS

----- One to Many relationship

CREATE DATABASE shop;
USE shop;

CREATE TABLE customers(id INT PRIMARY KEY Auto_INCREMENT, first_name VARCHAR(50), last_name VARCHAR(50), email VARCHAR(50));

CREATE TABLE orders(id INT PRIMARY KEY Auto_INCREMENT, order_date DATE, amount DECIMAL(8, 2), customer_id INT);

SHOW tables;

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
       
SELECT * FROM customers;

SELECT * FROM orders;

INSERT INTO orders(order_date, amount, customer_id) VALUES ('2022-11-11', 50.69, 975);

DROP table customers;
DROP table orders;

CREATE TABLE customers(id INT PRIMARY KEY Auto_INCREMENT, first_name VARCHAR(50), last_name VARCHAR(50), email VARCHAR(50));

CREATE TABLE orders(id INT PRIMARY KEY Auto_INCREMENT, order_date DATE, amount DECIMAL(8, 2), customer_id INT, FOREIGN KEY (customer_id) REFERENCES customers(id));

SELECT * FROM orders;

INSERT INTO orders(order_date, amount, customer_id) VALUES ('2022-11-11', 78.69, 54); ---- FORKEY KEY FAILS

SELECT * FROM customers;
INSERT INTO orders(order_date, amount, customer_id) VALUES ('2022-11-11', 78.69, 3);


-------- Cross Joins
SELECT id FROM customers WHERE last_name = 'George';
SELECT * FROM orders WHERE customer_id = 1;

SELECT * FROM customers, orders; --- less useful take all value and make combination

-------- INNER JOIN
SELECT * FROM customers;
SELECT * FROM orders;

SELECT * FROM customers
JOIN orders 
ON orders.customer_id = customers.id;


SELECT first_name, last_name, order_date, amount FROM customers
JOIN orders 
ON orders.customer_id = customers.id;
------- INNER JOIN GROUP BY

SELECT first_name, last_name, SUM(amount) AS total FROM customers
JOIN orders ON
orders.customer_id = customers.id
GROUP BY customers.first_name, customers.last_name
ORDER BY total;



------- LEFT JOIN

SELECT first_name, last_name, order_date, amount FROM customers
LEFT JOIN orders ON
orders.customer_id = customers.id;

---- LEFT JOIN Group BY

SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS moey_spent FROM customers
LEFT JOIN orders ON
customers.id  = orders.customer_id
GROUP BY first_name, last_name;

---------------- RIGHT JOIN

SELECT first_name, last_name,order_date, amount FROM customers
RIGHT JOIN orders ON
customers.id  = orders.customer_id;
--------- On DELETE Cascade
DROP TABLE orders;
DROP TABLE customers;
CREATE TABLE customers(id INT PRIMARY KEY Auto_INCREMENT, first_name VARCHAR(50), last_name VARCHAR(50), email VARCHAR(50));

CREATE TABLE orders(id INT PRIMARY KEY Auto_INCREMENT, order_date DATE, amount DECIMAL(8, 2), customer_id INT, FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE);

DELETE FROM customers WHERE last_name = 'George';
SELECT * FROM customers;
SELECT * FROM orders;

------------------------ EXERCISE
CREATE TABLE students(id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50));

CREATE TABLE PAPERS(title VARCHAR(50), grade INT, student_id INT, FOREIGN KEY(student_id) REFERENCES students(id));
INSERT INTO students (name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');	

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT * FROM students;
SELECT * FROM papers;

SELECT name, title, grade FROM students
JOIN papers ON
papers.student_id = students.id
ORDER BY grade DESC;
---- LEFT JOIN
SELECT name, title, grade FROM students
LEFT JOIN papers ON
papers.student_id = students.id;

SELECT name, IFNULL(title,'MISSING'), IFNULL(grade, 0) FROM students
LEFT JOIN papers ON
papers.student_id = students.id;

SELECT name, IFNULL(AVG(grade), 0) AS Average FROM students
LEFT JOIN papers ON
papers.student_id = students.id
GROUP BY name ORDER BY Average DESC;

SELECT name, IFNULL(AVG(grade), 0) AS Average, 
CASE
WHEN IFNULL(AVG(grade),0) >= 70 THEN 'Pass'
ELSE 'Fail'
End As passing_status
FROM students
LEFT JOIN papers ON
papers.student_id = students.id
ORDER BY Average DESC;


--------------- EXERCISE COMPLETED


















































       
       
       
       
       
       
       
       
       
       