USE codtech_sql_internship;
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    emp_id INT,
    sale_amount DECIMAL(10,2),
    sale_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);
INSERT INTO sales (sale_id, emp_id, sale_amount, sale_date) VALUES
(1, 1, 5000.00, '2024-01-10'),
(2, 1, 7000.00, '2024-01-15'),
(3, 2, 12000.00, '2024-01-11'),
(4, 2, 9000.00, '2024-01-20'),
(5, 3, 15000.00, '2024-01-08'),
(6, 3, 8000.00, '2024-01-19'),
(7, 4, 4000.00, '2024-01-22');

SELECT 
    emp_id,
    SUM(sale_amount) AS total_sales,
    RANK() OVER (ORDER BY SUM(sale_amount) DESC) AS sales_rank
FROM sales
GROUP BY emp_id;

SELECT 
    emp_id,
    sale_amount,
    sale_date,
    SUM(sale_amount) OVER (PARTITION BY emp_id ORDER BY sale_date) AS running_total
FROM sales;
SELECT 
    emp_id,
    sale_amount,
    sale_date,
    AVG(sale_amount) 
        OVER (PARTITION BY emp_id ORDER BY sale_date ROWS BETWEEN 1 PRECEDING AND CURRENT ROW)
        AS moving_avg
FROM sales;
SELECT emp_id, sale_amount
FROM sales
WHERE sale_amount > (SELECT AVG(sale_amount) FROM sales);

SELECT s1.emp_id, s1.sale_amount
FROM sales s1
WHERE s1.sale_amount = (
    SELECT MAX(s2.sale_amount)
    FROM sales s2
    WHERE s2.emp_id = s1.emp_id
);
WITH emp_sales AS (
    SELECT emp_id, SUM(sale_amount) AS total_sales
    FROM sales
    GROUP BY emp_id
)
SELECT *
FROM emp_sales
ORDER BY total_sales DESC;
WITH ranked_sales AS (
    SELECT
        emp_id,
        SUM(sale_amount) AS total_sales,
        DENSE_RANK() OVER (ORDER BY SUM(sale_amount) DESC) AS rank_pos
    FROM sales
    GROUP BY emp_id
)
SELECT *
FROM ranked_sales
WHERE rank_pos <= 2;






