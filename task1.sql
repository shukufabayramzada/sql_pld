CREATE TABLE IF NOT EXISTS employees(
	employees_id INT PRIMARY KEY,
	name VARCHAR(256),
	age INT,
	salary INT,
	joined_date DATE
);
DELETE FROM employees;

INSERT INTO employees (employees_id, name, age, salary, joined_date) VALUES (1, 'John', 23, 2000, '2024-05-12');
INSERT INTO employees (employees_id, name, age, salary, joined_date) VALUES (2, 'Julia', 45, 2300, '2015-05-20');
INSERT INTO employees (employees_id, name, age, salary, joined_date) VALUES (3, 'Robert', 34, 1254, '2017-04-24');
INSERT INTO employees (employees_id, name, age, salary, joined_date) VALUES (4, 'Ann', 40, 3247, '2013-07-15');

SELECT MIN(salary) AS min_salary FROM employees;
SELECT MAX(salary) AS max_salary FROM employees;
