CREATE DATABASE employee_db;

USE employee_db;

----------------------------------------------------- CREATING THE EMPLOYEE TABLE ------------------------------------------------

CREATE TABLE Employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    gender VARCHAR(50),
    phone_number VARCHAR(10),
    address VARCHAR(255),
    start_date DATE
);

ALTER TABLE Employee
ADD COLUMN department_id INT,
ADD COLUMN payroll_id INT,
ADD COLUMN company_id INT;

ALTER TABLE Employee
ADD FOREIGN KEY (department_id) REFERENCES Department(id),
ADD FOREIGN KEY (payroll_id) REFERENCES Payroll(id),
ADD FOREIGN KEY (company_id) REFERENCES Company(id);

INSERT INTO Employee (name, gender, phone_number, address, start_date) VALUES 
('Shubham Sah', 'Male', '1234567890', '123 Main St, City, Country', '2023-01-01'),
('Khushboo Soni', 'Female', '2345678901', '456 Elm St, City, Country', '2023-02-15'),
('Rihal Shaikh', 'Male', '3456789012', '789 Oak St, City, Country', '2023-03-10'),
('Ruchita Chaudhary', 'Female', '4567890123', '987 Pine St, City, Country', '2023-04-05'),
('Aryan Khadge', 'Male', '5678901234', '654 Birch St, City, Country', '2023-05-20'),
('Prakash Gupta', 'Male', '6789012345', '321 Maple St, City, Country', '2023-06-15'),
('Neelam Shaikh', 'Female', '7890123456', '159 Walnut St, City, Country', '2023-07-10');

----------------------------------------------------- CREATING THE DEPARTMENT TABLE ------------------------------------------------

CREATE TABLE Department (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Department VARCHAR(255)
);

ALTER TABLE Department
ADD COLUMN employee_id INT,
ADD CONSTRAINT fk_employee_id2
FOREIGN KEY (employee_id) REFERENCES Employee(id);


INSERT INTO Department (Department) VALUES 
('Human Resources'),
('Marketing'),
('Finance'),
('Engineering'),
('Sales');

----------------------------------------------------- CREATING THE PAYROLL TABLE ------------------------------------------------

CREATE TABLE Payroll (
    id INT AUTO_INCREMENT PRIMARY KEY,
    salary DECIMAL(10, 2),
    basic_pay DECIMAL(10, 2),
    deductions DECIMAL(10, 2),
    taxable_pay DECIMAL(10, 2),
    income_tax DECIMAL(10, 2),
    net_pay DECIMAL(10, 2)
);

ALTER TABLE Payroll
ADD COLUMN employee_id INT;

ALTER TABLE Payroll
ADD CONSTRAINT fk_employee_id
FOREIGN KEY (employee_id) REFERENCES Employee(id);

INSERT INTO Payroll (employee_id, salary, basic_pay, deductions, taxable_pay, income_tax, net_pay) VALUES 
(1, 50000.00, 45000.00, 5000.00, 40000.00, 5000.00, 35000.00),
(2, 60000.00, 55000.00, 5000.00, 50000.00, 7500.00, 42500.00),
(3, 55000.00, 50000.00, 5000.00, 45000.00, 6000.00, 39000.00),
(4, 70000.00, 65000.00, 5000.00, 60000.00, 9000.00, 51000.00),
(5, 65000.00, 60000.00, 5000.00, 55000.00, 7500.00, 47500.00),
(6, 75000.00, 70000.00, 5000.00, 65000.00, 10000.00, 55000.00),
(7, 55000.00, 50000.00, 5000.00, 45000.00, 6000.00, 39000.00);

----------------------------------------------------- CREATING THE COMPANY TABLE ------------------------------------------------

CREATE TABLE Company (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    company_name VARCHAR(255)
);

ALTER TABLE Company
ADD CONSTRAINT fk_employee_id5
FOREIGN KEY (employee_id) REFERENCES Employee(id);

INSERT INTO Company (company_name) VALUES 
('Quality Kiosk'),
('Loco Buzz'),
('LensKart');

----------------------------------------------------- CREATING THE EMPLOYEE DEPARTMENT TABLE ------------------------------------------------

CREATE TABLE Employee_Department (
    employee_id INT,
    department_id INT,
    PRIMARY KEY (employee_id, department_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(id),
    FOREIGN KEY (department_id) REFERENCES Department(id)
);

INSERT INTO Employee_Department (employee_id, department_id) VALUES
(1,2), (1,4), (1,5), (2,3), (2,1), (3,5), (3,4), (4,1), (4,2), (4,3), (5,1), (6,2), (6,4), (7,1), (7,4);


