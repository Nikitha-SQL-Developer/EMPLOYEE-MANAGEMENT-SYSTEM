-- EMPLOYEE MANAGEMENT SYSTEM PROJECT

CREATE DATABASE employee_db;
USE employee_db;

-- Tables
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(10),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Insert Data
INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

INSERT INTO Employees VALUES
(101, 'Ravi', 2, 50000),
(102, 'Sita', 1, 40000),
(103, 'Rahul', 3, 60000),
(104, 'Anjali', 2, 70000);

INSERT INTO Attendance VALUES
(1, 101, '2024-01-01', 'Present'),
(2, 102, '2024-01-01', 'Absent'),
(3, 103, '2024-01-01', 'Present'),
(4, 104, '2024-01-01', 'Present');

-- Queries

SELECT e.name, d.department_name, e.salary
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id;

SELECT d.department_name, SUM(e.salary) AS total_salary
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
GROUP BY d.department_name;

SELECT * FROM Employees
ORDER BY salary DESC
LIMIT 1;

SELECT e.name, a.attendance_date, a.status
FROM Attendance a
JOIN Employees e ON a.employee_id = e.employee_id;

SELECT * FROM Employees
WHERE salary > 50000;
