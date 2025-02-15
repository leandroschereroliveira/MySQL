-- Join

SELECT *
FROM employee_demographics
JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id
;

SELECT a.first_name,
a.last_name,
b.occupation,
b.salary
FROM employee_demographics AS a
JOIN employee_salary AS b
	ON a.employee_id = b.employee_id
;

SELECT *
FROM employee_demographics
JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id
JOIN parks_departments
	ON parks_departments.department_id = employee_salary.dept_id
;