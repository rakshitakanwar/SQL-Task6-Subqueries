-- Table for departments
CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY,
    department_name TEXT
);

-- Table for employees

CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    name TEXT,
    salary INTEGER,
    department_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
-- Insert into departments
INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing');

-- Insert into employees
INSERT INTO employees (employee_id, name, salary, department_id) VALUES
(101, 'Alice', 50000, 1),
(102, 'Bob', 60000, 2),
(103, 'Charlie', 55000, 2),
(104, 'Diana', 40000, 3),
(105, 'Eve', 70000, 2),
(106, 'Frank', 45000, 1);
SELECT 
    e.name,
    e.salary,
    e.department_id,
    (
        SELECT AVG(salary)
        FROM employees
        WHERE department_id = e.department_id
    ) AS avg_dept_salary
FROM employees e;
SELECT 
    name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
SELECT 
    d.department_name,
    t.max_salary
FROM (
    SELECT 
        department_id,
        MAX(salary) AS max_salary
    FROM employees
    GROUP BY department_id
) AS t
JOIN departments d ON d.department_id = t.department_id;
