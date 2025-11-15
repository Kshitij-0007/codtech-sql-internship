CREATE DATABASE codtech_sql_internship;
USE codtech_sql_internship;
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);
INSERT INTO departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'Engineering'),
(40, 'Marketing');
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
INSERT INTO departments (dept_id, dept_name)
VALUES (30, 'Finance');

INSERT INTO employees (emp_id, name, dept_id) VALUES
(1, 'Arjun', 10),
(2, 'Abhishek', 20),
(3, 'Meera', 30),
(4, 'Rahul', NULL);
select* from departments;
select* from employees;

SELECT e.emp_id, e.name, e.dept_id, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;
SELECT e.emp_id, e.name, e.dept_id, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

SELECT e.emp_id, e.name, e.dept_id, d.dept_id, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

SELECT e.emp_id, e.name, e.dept_id, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id

UNION

SELECT e.emp_id, e.name, e.dept_id, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;


