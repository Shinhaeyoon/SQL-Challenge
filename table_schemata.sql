drop table if exists departments;
drop table if exists dept_emp;
drop table if exists dept_manager;
drop table if exists employees;
drop table if exists salaries;
drop table if exists titles;

create table Titles (
	emp_title_id VARCHAR NOT NULL,
	PRIMARY KEY(emp_title_id),
	title VARCHAR
	);

create table Employees (
	emp_no VARCHAR NOT NULL,
	PRIMARY KEY(emp_no),
	emp_title_id VARCHAR NOT NULL,
	FOREIGN KEY(emp_title_id) REFERENCES Titles(emp_title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE NOT NULL
);

create table Departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR,
	PRIMARY KEY(dept_no)
);
	
create table Department_Employees (
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES Departments(dept_no),
	emp_no VARCHAR NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no)
);


create table Salaries (
	emp_no VARCHAR NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no),
	salary INTEGER
);

create table Department_Manager (
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES Departments(dept_no),
	emp_no VARCHAR NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no)
);	



copy public.titles (emp_title_id, title) 
FROM 'C:/Users/Public/SQL-CH~1/EMPLOY~1/titles.csv' 
DELIMITER ',' CSV HEADER

copy public.departments (dept_no, dept_name) 
FROM 'C:/Users/Public/SQL-CH~1/EMPLOY~1/DEPART~1.CSV' 
DELIMITER ',' CSV HEADER 




copy public.employees (emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date) 
FROM 'C:/Users/Public/SQL-CH~1/EMPLOY~1/EMPLOY~1.CSV' 
DELIMITER ',' CSV HEADER

copy public.department_manager (dept_no, emp_no) 
FROM 'C:/Users/Public/SQL-CH~1/EMPLOY~1/DEPT_M~1.CSV' 
DELIMITER ',' CSV HEADER

copy public.salaries (emp_no, salary) 
FROM 'C:/Users/Public/SQL-CH~1/EMPLOY~1/salaries.csv' 
DELIMITER ',' CSV HEADER

copy public.department_employees (dept_no, emp_no) 
FROM 'C:/Users/Public/SQL-CH~1/EMPLOY~1/dept_emp.csv' 
DELIMITER ',' CSV HEADER



