-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    salary
FROM employees e
JOIN salaries s
USING (emp_no);
    
-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
    first_name,
    last_name,
    hire_date
FROM employees
WHERE extract(year FROM hire_date) = '1986';   

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
    dept_no,
    dept_name,
   e.emp_no,
   e.last_name,
   e.first_name
FROM employees e
JOIN dept_manager dm
USING(emp_no)
JOIN departments d 
USING(dept_no);

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
    d.dept_no,
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employees e
JOIN dept_emp
USING(emp_no)
JOIN departments d  
USING(dept_no);

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
    first_name,
    last_name,
    sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
    d.dept_no,
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employees e
JOIN dept_emp
USING(emp_no)
JOIN departments d  
USING(dept_no)
WHERE dept_name = 'Sales';


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
    emp_no,
    last_name,
    first_name,
    dept_name
FROM employees e
JOIN dept_emp
USING(emp_no)
JOIN departments d  
USING(dept_no)
WHERE dept_name IN ('Sales','Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT
    last_name,
COUNT(last_name) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;