-- Use Dictinct with Orderby to remove duplicate rows
Select employees.emp_no,
first_name,
last_name,
title,
from_date,
to_date
Into retirement_titles
From employees
Join titles on (employees.emp_no = titles.emp_no)
Where (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
Order by emp_no asc;

Select * 
From retirement_titles

Select Distinct On (emp_no)
emp_no,
first_name,
last_name,
title
Into unique_titles
From retirement_titles
Where (to_date ='9999-01-01')
Order by emp_no asc, to_date desc;

Select * 
From unique_titles

Select count (title),
title
Into retiring_titles
From unique_titles
group by(title)
order by count(title)desc

Select * 
From retiring_titles

Select Distinct (employees.emp_no)
emp_no,
first_name,
last_name,
birth_date,
dept_emp.from_date,
dept_emp.to_date,
title
Into mentorship_eligibilty
From employees
Inner Join dept_emp on (employees.emp_no = dept_emp.emp_no)
Inner Join titles on (employees.emp_no = titles.emp_no)
Where (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
And (dept_emp.to_date = '9999-01-01')
ORDER BY emp_no;

Select *
From mentorship_eligibilty