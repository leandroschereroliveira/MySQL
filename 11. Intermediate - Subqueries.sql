-- Subqueries
-- IN WHERE
SELECT * 
FROM employee_demographics
WHERE employee_id in
				(SELECT employee_id
				 FROM employee_salary
                 WHERE dept_id = 1)
;

-- Coluna
SELECT first_name,
salary,
(SELECT AVG(salary) FROM employee_salary) AS AVG_SALARY 
FROM employee_salary
;

-- FROM
SELECT gender, AVG(_max)
FROM
(SELECT gender, 
AVG(age) AS _avg, 
MAX(age) AS _max, 
MIN(age) AS _min, 
COUNT(age) AS _count
FROM employee_demographics
GROUP BY gender) AS Agg_table -- incluir alias
GROUP BY gender
;