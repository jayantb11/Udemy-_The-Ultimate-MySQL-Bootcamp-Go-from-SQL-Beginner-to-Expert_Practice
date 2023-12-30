-- Create a database 'work_function'
CREATE DATABASE work_function;

-- Switch to the 'work_function' database
USE work_function;

-- Create a table 'employees' with columns 'emp_no', 'department', and 'salary'
CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);

-- Insert records into the 'employees' table
INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
...
('customer service', 56000),
('customer service', 55000);

-- Switch to the 'work_function' database
USE work_function;

-- Select the average salary for each department
SELECT department, AVG(salary) FROM employees GROUP BY 1;

-- Select employee details with additional columns for overall average, minimum, and maximum salary
SELECT emp_no, department, salary, AVG(salary) OVER(), MIN(salary) OVER(), MAX(salary) OVER() FROM employees;

-- Select employee details with the average salary for each department
SELECT emp_no, department, salary, AVG(salary) OVER(PARTITION BY department) AS dep_avg FROM employees;

-- Select employee details with the count of employees in each department
SELECT emp_no, department, salary, COUNT(*) OVER(PARTITION BY department) AS dept_count FROM employees;

-- Select employee details with total and department-wise salary sum
SELECT emp_no, department, salary, SUM(salary) OVER() AS total_salary, SUM(salary) OVER(PARTITION BY department) AS dep_salary FROM employees;

-- Select employee details with cumulative sum of salary within each department
SELECT emp_no, department, salary, SUM(salary) OVER(PARTITION BY department ORDER BY salary) FROM employees;

-- Select employee details with minimum salary within each department in descending order
SELECT emp_no, department, salary, MIN(salary) OVER(PARTITION BY department ORDER BY salary DESC) FROM employees;

-- Select employee details with overall salary rank within each department
SELECT emp_no, department, salary, RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS overall_salary_rank FROM employees;

-- Select employee details with overall salary rank within each department using ROW_NUMBER
SELECT emp_no, department, salary, ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS overall_salary_rank FROM employees;

-- Select employee details with dense salary rank within each department
SELECT emp_no, department, salary, DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dense_salary FROM employees;

-- Select employee details with salary quartiles (both overall and within each department)
SELECT emp_no, department, salary, NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile,
NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quartile FROM employees;

-- Select employee details with the difference in salary from the previous record within each department
SELECT emp_no, department, salary, salary - LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) FROM employees;
