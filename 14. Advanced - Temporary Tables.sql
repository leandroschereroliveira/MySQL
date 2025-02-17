-- Temporary Tables

CREATE TEMPORARY TABLE temp_table
( firt_name varchar(50),
last_name varchar(50)
);

SELECT *
FROM temp_table;

INSERT INTO temp_table
VALUES('Alex', 'Silva');

SELECT *
FROM temp_table;

-- Exemplo 2
CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM salary_over_50k;



