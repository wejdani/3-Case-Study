##############################################################################################
#---This is for the total sum of salaries in each dept---#
select dept_emp.dept_no , departments.dept_name,   
sum(salary) as SUM_salary, avg(salary) as avg_salary
from  employees
JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
JOIN salaries ON employees.emp_no = salaries.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
group by dept_no
order by SUM_salary DESC;


#---This is for the total sum of salaries per dept---#
select e.emp_no, e.first_name, e.last_name, Max(s.salary), d.dept_name
from employees e 
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
JOIN departments d ON d.dept_no = de.dept_no
group by s.emp_no;






#This query gives the max salary for each employee in the development dept, along with the years of exp
#years of exp by retrieving the min from date and the max to date up to the end of 2000 as stated in the where clause

#We did NOT use the results of this query 
select e.emp_no, e.first_name, e.last_name, max(s.salary), min(s.from_date), max(s.to_date), d.dept_name
from employees e 
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
JOIN departments d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Development' AND s.to_date <'2001-01-01'
group by e.emp_no
ORDER BY max(s.salary) DESC;

#end of bullot point 1 
######################



#bullet point 2 in excel 
#bullet point 3 also in excel 
#bullet pont 4 is from the query above for bullet point 1 (related to bullet point 3)

##########################################################################################
#bullet point 5 use this query and say we dont need to reduce make plan 
#We did NOT use the results of this query 
select 
round( avg(case when gender='M' then salary end),2) as M_average_salary,
round( avg(case when gender='F' then salary end),2) as F_average_salary
from  employees
JOIN salaries ON employees.emp_no = salaries.emp_no ;