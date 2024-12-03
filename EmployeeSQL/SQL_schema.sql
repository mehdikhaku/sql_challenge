CREATE TABLE titles (
    title_id VARCHAR(10) NOT NULL,  -- Assuming a length of 10 for title_id
    title VARCHAR(100) NOT NULL,    -- Assuming a length of 100 for title
    PRIMARY KEY (title_id)
);

CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR(10) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,  -- Assuming a length of 50 for first name
    last_name VARCHAR(50) NOT NULL,   -- Assuming a length of 50 for last name
    sex VARCHAR(1) NOT NULL,          -- Assuming a single character for sex (M, F, etc.)
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
    PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
    dept_no VARCHAR(10) NOT NULL,    -- Assuming a length of 10 for dept_no
    dept_name VARCHAR(100) NOT NULL,  -- Assuming a length of 100 for dept_name
    PRIMARY KEY (dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(10) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,          -- Start date for manager
    to_date DATE,                     -- End date for manager (can be NULL if still active)
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(10) NOT NULL,
    from_date DATE NOT NULL,          -- Start date of employee in department
    to_date DATE,                     -- End date of employee in department (can be NULL)
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    from_date DATE NOT NULL,          -- Start date for salary
    to_date DATE,                     -- End date for salary (can be NULL)
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no, from_date)   -- Composite key to handle multiple salary records
);
