-- CTEs

WITH CTE_Example AS  -- nome da CTE
(
SELECT gender, 
AVG(salary) AS _avg, 
MAX(salary) AS _max, 
MIN(salary) AS _min, 
COUNT(salary) AS _count
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT _avg
FROM CTE_Example
;

-- EXEMPLO 2
WITH CTE_Example AS
(
SELECT employee_id,
gender, 
birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS
(
SELECT employee_id,
salary
FROM employee_salary
WHERE salary > 5000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
	ON CTE_Example.employee_id = CTE_Example2.employee_id
;


