CREATE DATABASE codtech_migrated;
USE codtech_migrated;

CREATE TABLE departments LIKE codtech_sql_internship.departments;
CREATE TABLE employees LIKE codtech_sql_internship.employees;

INSERT INTO departments
SELECT * FROM codtech_sql_internship.departments;

INSERT INTO employees
SELECT * FROM codtech_sql_internship.employees;

SELECT COUNT(*) FROM codtech_sql_internship.employees;
SELECT COUNT(*) FROM codtech_migrated.employees;

SELECT COUNT(*) FROM codtech_sql_internship.departments;
SELECT COUNT(*) FROM codtech_migrated.departments;


