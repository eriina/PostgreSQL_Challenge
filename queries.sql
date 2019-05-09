--1. List Details of Employee: Employee Number, Last Name, First Name, Gender, Salary
select e.employee_no, e.last_name, e.first_name, e.gender, s.salary
from employees e
join salaries s
on (s.employee_no=e.employee_no) 

--2. List Employees Hired in 1986
select e.hire_date, e.employee_no 
from employees e
where hire_date like '1986%'

-- 3. List Manager of each department with department number, 
--department name, manger's employee number, last name, first name, start and end date
select dm.department_no, dm.employee_no, dm.from_date, 
dm.to_date, d.department_name, e.last_name, e.first_name
from department_manager dm
left join departments d on (d.department_no = dm.department_no)
join employees e on (dm.employee_no = e.employee_no)

--4. List department of each employee, employee number, last name, first name,department name
select e.first_name, e.last_name, de.employee_no, d.department_name
from employees e
left join department_employees de on (de.employee_no=e.employee_no)
join departments d on (d.department_no=de.department_no)

--5. List all employees whose first name is "Hercules" and last name begins with "B"
select * 
from employees
where first_name = 'Hercules'
and last_name like 'B%'

--6. list all employees in sales department including
--employee number, last and first name, dept name
select * 
from departments 
where department_name = 'Sales'

select d.department_name, e.last_name, e.first_name, e.employee_no
from department_employees de
join departments d on (d.department_no=de.department_no)
join employees e on (de.employee_no = e.employee_no)
where d.department_name = 'Sales' 

--7. List all employees in Sales and Development dept
--employee number, last and first name, dept. name
select d.department_name, e.last_name, e.first_name, e.employee_no
from department_employees de
join departments d on (d.department_no=de.department_no)
join employees e on (de.employee_no = e.employee_no)
where d.department_name in ('Sales', 'Development')

--8. list frequency of employee last names and how
--many employees share each last name
select last_name, count (last_name)as frequency
from employees e
group by last_name
order by
count(last_name) desc


