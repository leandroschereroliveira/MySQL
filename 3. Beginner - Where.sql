-- 	WHERE Clause

SELECT *
FROM employee_salary
WHERE first_name = 'Leslie'
;

SELECT *
FROM employee_salary
WHERE salary >= 50000
;

SELECT *
FROM employee_demographics
WHERE gender = 'Female'
;

-- AND OR NOT -- operador lógico
SELECT *
FROM employee_demographics
WHERE gender = 'Female'
AND birth_date > '1985-01-01'
;

SELECT *
FROM employee_demographics
WHERE gender = 'Female'
OR birth_date > '1985-01-01'
;

SELECT *
FROM employee_demographics
WHERE gender = 'Female'
OR NOT birth_date > '1985-01-01'
;

SELECT *
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55
;

-- LIKE
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'Jer%'
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__'
;