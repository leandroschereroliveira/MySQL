-- String Functions
SELECT first_name,
LENGTH(first_name)
FROM employee_demographics
;

SELECT UPPER('sky');
SELECT lower('Sky');

-- TIRA OS ESPAÇOS
SELECT  TRIM('           Sky      '); -- TIRA OS ESPAÇOS
SELECT  LTRIM('           Sky      ');-- TIRA OS ESPAÇOS LEFT
SELECT  RTRIM('           Sky      ');-- TIRA OS ESPAÇOS RIGHT

-- SUBSTRING - CORTA A PALAGRA 
SELECT first_name,
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name,3,2) -- COMEÇA DA TERCEIRA POSIÇÃO, 2 LETRAS
FROM employee_demographics
;

-- REPLACE - SUBSTITUI
SELECT first_name,
REPLACE(first_name, 'a', 'z')
FROM employee_demographics
;

-- LOCATE - LOCALIZA A NUMERO DA POSIÇÃO
SELECT LOCATE('x', 'Alexander'); -- posição 4

-- CONCAT 
SELECT first_name,
last_name,
CONCAT(first_name,' ',last_name)
FROM employee_demographics
;