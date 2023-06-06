--List the employee number, last name, first name, sex, and salary of each employee 
Select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
Left Join salaries
On
employees.emp_no = salaries.emp_no
Order By
emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986 
Select first_name, last_name, hire_date from employees
Where Date_Part('year', hire_date) = 1986
Order By
emp_no; 


--List the manager of each department along with their department number, department name, employee number, last name, and first name 
Select dept_manager.dept_no,
		departments.dept_name,
		dept_manager.emp_no,
		employees.last_name,
		employees.first_name
From dept_manager
Left Join departments
On dept_manager.dept_no = departments.dept_no
Left Join employees
On dept_manager.emp_no = employees.emp_no
Order by
emp_no;
		

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT
employees.emp_no,
employees.last_name,
employees.first_name,
dept_emp.dept_no,
departments.dept_name
FROM employees 
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
order by emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 
Select first_name, last_name, sex from employees
where first_name = 'Hercules'And last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name 
SELECT 
employees.emp_no, 
employees.last_name, 
employees.first_name
From employees
LEFT JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name='Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT 
employees.emp_no, 
employees.last_name, 
employees.first_name,
dept_emp.dept_no
FROM employees 
LEFT JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name in ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) 
SELECT last_name, COUNT(*) AS frequency_count
FROM employees
GROUP BY last_name
ORDER BY frequency_count DESC;