-- Drop tables if exist
-- DROP TABLE IF EXISTS "Departments", "Department_Employee", "Department_manager", "Employees", "Titles", "Salaries";

-- Create Table Schemas
CREATE TABLE "Departments" (
    "dept_no" varchar(50)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Departments" 
		PRIMARY KEY ("dept_no")
);

CREATE TABLE "Titles" (
    "title_id" varchar(50)   NOT NULL,
    "title_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Titles" 
		PRIMARY KEY ("title_id")
);

CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" varchar(50)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(150)   NOT NULL,
    "last_name" varchar(150)   NOT NULL,
    "sex" varchar(50)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees"
		PRIMARY KEY ("emp_no"),
		FOREIGN KEY ("emp_title_id") References "Titles"("title_id")
);

CREATE TABLE "Department_Employee" (
    "emp_no" INT   NOT NULL,
    "dept_no" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Department_Employee" 
		PRIMARY KEY ("emp_no","dept_no"),
		FOREIGN KEY ("dept_no") References "Departments"("dept_no"),
		FOREIGN KEY ("emp_no") References "Employees"("emp_no")
);

CREATE TABLE "Department_Manager" (
    "dept_no" varchar(50)   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_Department_Manager" 
		PRIMARY KEY ("dept_no","emp_no"),
		FOREIGN KEY ("dept_no") References "Departments"("dept_no"),
		FOREIGN KEY ("emp_no") References "Employees"("emp_no")
);


CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" money   NOT NULL,
    CONSTRAINT "pk_Salaries" 
		PRIMARY KEY ("emp_no"),
		FOREIGN KEY("emp_no") REFERENCES "Employees" ("emp_no")
);

