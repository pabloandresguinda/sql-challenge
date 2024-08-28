-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e."emp_no", e."last_name", e."first_name", e."sex", s."salary" FROM "Employees" AS e
LEFT JOIN "Salaries" AS s ON e."emp_no" = s."emp_no";

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT "first_name", "last_name", "hire_date" FROM "Employees"
WHERE EXTRACT ("year" FROM "hire_date") = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d."dept_no", d."dept_name", d."emp_no", d."last_name", d."first_name" FROM "Employees" AS d
LEFT JOIN "Department_Manager" ON d."emp_no" = Department_Manager."emp_no"
LEFT JOIN "Departments" ON  d."dept_no" = d."dept_no"

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e."emp_no", e."last_name", e."first_name", de."dept_name" FROM "Employees" As e
JOIN Departments AS de ON Department_Employee.dept_no = Departments.dept_no WHERE Departments.dept_name = "Sales";


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT "last_name", COUNT("last_name") AS freq FROM "Employees" GROUP BY "last_name" ORDER BY "freq" DESC;

