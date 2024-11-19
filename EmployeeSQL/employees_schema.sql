-- titles table
CREATE TABLE titles(
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(75) NOT NULL
);

-- departments table
CREATE TABLE departments(
    dept_no VARCHAR(5) PRIMARY KEY,
    dept_name VARCHAR UNIQUE
);

--employees table
CREATE TABLE employees(
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- dept_emp table
CREATE TABLE dept_emp(
    emp_no INT NOT NULL,
    dept_no VARCHAR(5) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- salaries table
CREATE TABLE salaries(
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL CHECK (salary >= 0),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- dept_manager table
CREATE TABLE dept_manager(
    dept_no VARCHAR(5) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;