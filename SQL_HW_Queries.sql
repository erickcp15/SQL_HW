--Data Analysis

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

-- select the columns you want then join from the tables needed based on the shared column
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees e join salaries s
on e.emp_no = s.emp_no;

--2. List employees who were hired in 1986.

-- select the columns you want from the table needed where the date covers all of 1986.
select emp_no, last_name, first_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31';

--3. List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.

-- select the columns you want then join from the tables needed based on each of their the shared column.
select d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
from departments d join dept_manager dm
on d.dept_no = dm.dept_no
join employees e
on dm.emp_no = e.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, 
--and department name.

-- select the columns you want then join from the tables needed based on each of their the shared column.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp de join employees e
on de.emp_no = e.emp_no
join departments d
on de.dept_no = d.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."

--select the column you want then from the table find the information you're looking for setting it equal and like.
select first_name, last_name
from employees
where first_name = 'Hercules' and last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

--select the columns you want then join from the tables based on shared column and then where you want to specify what you want
-- ie all the employees from sales
select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp de join employees e
on de.emp_no = e.emp_no
join departments d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, 
--and department name.

--select the columns you want then join from the tables based on shared column and then where you want to specify what you want from
-- it ie. sales and development specific.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp de join employees e
on de.emp_no = e.emp_no
join departments d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name ='Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

--select the column you want from its table and take a count of that column then group by the column you want and order by its
-- count of the column you want ie last name.
select last_name, count(last_name) as "# of Employees with this last name"
from employees
group by last_name
order by count(last_name) desc;

--Epilogue
select * from employees where emp_no = '499942'
