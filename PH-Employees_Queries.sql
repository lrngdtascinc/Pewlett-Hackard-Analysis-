-- PH-Employees_Queries.sql

SELECT emp.emp_no, emp.first_name, emp.last_name, t.title, t.from_date, t.to_date 
INTO retirement_titles
FROM employees AS emp
INNER JOIN titles AS t
    ON (emp.emp_no = t.emp_no)
-- Filter for Birth Date

WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles AS rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- Queries from Unique Titles

SELECT COUNT (ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT DESC;
