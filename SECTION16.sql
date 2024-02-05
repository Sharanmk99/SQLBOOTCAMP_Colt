--------------------- SECTION 16

----------------------- WINDOW FUNCTION
CREATE DATABASE window_function;
USE window_function;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);
 
INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);
 
------ USING OVER()
SELECT * FROM employees;

SELECT department, AVG(salary) FROM employees GROUP BY department;

SELECT AVG(salary) FROM employees;


SELECT AVG(salary) OVER() FROM employees; ----- The OVER() clause constructs a widow. WHen its empty the window will include all records

SELECT emp_no, department, salary, AVG(salary) OVER() FROM employees;

SELECT emp_no, department, salary, MIN(salary) OVER(), MAX(salary) OVER() FROM employees;

--------------------------- PARTITION BY INSIDE of the OVER() use partition by to form rows into groups of row

SELECT emp_no, department, salary, AVG(salary) OVER(PARTITION BY department) AS department_avg FROM employees;

SELECT emp_no, department, salary, count(*) OVER(PARTITION BY department) as dept_count FROM employees;


SELECT emp_no, department, salary, SUM(salary) OVER(PARTITION BY department) AS department_sum, SUM(salary) OVER () AS total_sum FROM employees;

-------------------- ORDER BY with windows USE ORDER BY inside of the OVER() clause to re-order rows within each window



SELECT emp_no, department, salary, SUM(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS rolling_dept_salary, SUM(salary) OVER(PARTITION BY department) AS total_sum_salary FROM employees;


SELECT emp_no, department, salary, SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_dept_salary, SUM(salary) OVER(PARTITION BY department) AS total_sum_salary FROM employees;

SELECT emp_no, department, salary, MIN(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS rolling_min FROM employees;


----------------------- RANK() is a window function

SELECT emp_no, department, salary, RANK() OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_rank, RANK() OVER(ORDER BY salary DESC) as overall_salary_rank FROM employees ORDER BY department;

------------------------- DENSE_RANK ROW_NUMBER()

SELECT emp_no, department, salary, 
ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_rowNumber, 
RANK() OVER(ORDER BY salary DESC) as overall_salary_rank 
FROM employees ORDER BY department;
 
 
SELECT emp_no, department, salary, 
ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_rowNumber, 
RANK() OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_rank,
RANK() OVER(ORDER BY salary DESC) as overall_dense_rank 
FROM employees ORDER BY overall_dense_rank;


------------------------- NTILE() FUNCTION
SELECT emp_no, department, salary,
NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS sdept_salary_quartile,
NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees;



----------- FIRST_Value()
SELECT emp_no, department, salary,
FIRST_VALUE(emp_no) OVER(PARTITION BY department ORDER BY salary DESC) AS highest_paid_dept,
FIRST_VALUE(emp_no) OVER(ORDER BY salary DESC) AS emp_first_value
FROM employees;


----------------------- LEAD and LAG function
SELECT emp_no, department, salary,
LAG(salary) OVER(ORDER BY salary DESC)
FROM employees;

SELECT emp_no, department, salary,
salary - LAG(salary) OVER(ORDER BY salary DESC) AS salary_diff
FROM employees;


SELECT emp_no, department, salary,
salary - LEAD(salary) OVER(ORDER BY salary DESC) AS salary_diff
FROM employees;


SELECT emp_no, department, salary,
salary - LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_diff
FROM employees;


SELECT emp_no, department, salary,
LAG(salary, 2) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_diff
FROM employees;


























































































