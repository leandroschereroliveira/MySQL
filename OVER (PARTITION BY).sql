SELECT * FROM parks_and_recreation.employee_salary;

-- 1. ROW_NUMBER() - A função ROW_NUMBER() atribui um número sequencial único a cada linha dentro da partição.
SELECT
  ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY salary DESC) as row_num,
  first_name,
  dept_id,
  salary
FROM
  parks_and_recreation.employee_salary;
  
-- 2. RANK() - A função RANK() atribui uma classificação a cada linha dentro da partição, com possíveis lacunas em caso de empates.
SELECT
  RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) as row_num,
  first_name,
  dept_id,
  salary
FROM
  parks_and_recreation.employee_salary;
  
-- 3. SUM() - A função SUM() calcula a soma acumulada dentro de cada partição.
SELECT
  dept_id,
  first_name,
  salary,
  SUM(salary) OVER (PARTITION BY dept_id ORDER BY first_name) as cumulative_salary
FROM
  parks_and_recreation.employee_salary;
  
-- 4. LAG() e LEAD() - As funções LAG() e LEAD() acessam dados de linhas anteriores e posteriores dentro da partição, respectivamente.
SELECT
  first_name,
  dept_id,
  salary,
  LAG(salary, 1) OVER (PARTITION BY  dept_id ORDER BY salary) as previous_salary,
  LEAD(salary, 1) OVER (PARTITION BY  dept_id ORDER BY salary) as next_salary
FROM
  parks_and_recreation.employee_salary;
  
  
  
  