class-3

mysql -uroot -proot
show databases;
DROP DATABASE 6pm;

CREATE DATABASE 6pm;

USE 6pm;

system cls;
show tables;

CREATE TABLE product(
p_id INT,
pname VARCHAR(50) NOT null,
price FLOAT CHECK(price>=50),
rating FLOAT DEFAULT 6,
PRIMARY KEY(p_id)
);
DESC product;

INSERT INTO product
VALUES
(1,'Marker Pen',51,8.5),
(2,'Mouse',610,4.5),
(3,'Water bottle',200,4.5),
(4,'Keyboard',700,2.5),
(5,'Simple Pen',52,9.5),
(6,'Iphone 5s',5000,5.5);

INSERT INTO product(p_id,pname,price)
VALUES
(7,'ThinkPad',55000);


SELECT *FROM product;

SELECT p_id, 
       pname
FROM 
product;

SELECT p_id AS Product_Id, 
       pname AS Product_Name
FROM 
product;

SELECT *FROM
product
WHERE p_id=4;


College   Env
 Dept  -->Students
Corporate Env
    BUnit --> Employees

Ecomm Evn
    cart  -> products

FK- FOREIGN KEY 
----------------
referencial constraint
COLUMN contraint WITH IS refer TO another TABLE PRIMARY KEY.


CREATE TABLE dept(
 dept_id int,
 dept_name VARCHAR(32) NOT NULL,
 dept_loc VARCHAR(32) NOT NULL,
 PRIMARY KEY(dept_id)
);


CREATE TABLE employees(
 emp_id int,
 ename VARCHAR(32) NOT null,
 esal  FLOAT CHECK(esal>=18000),
 gender VARCHAR(32) NOT null,
 d_id   int,
 PRIMARY KEY(emp_id),
 FOREIGN KEY(d_id) REFERENCES dept(dept_id)
);

DESC dept;
DESC employees;


INSERT INTO  dept
VALUES
(1001,'IT','New Delhi'),
(1002,'HR','Mumbai'),
(1003,'Admin','Bangalore'),
(1004,'Sales','Mysore');

SELECT *FROM dept;


INSERT INTO employees
VALUES
(101,'Rahul',45000.45,'Male',1001);

system cls;

SELECT *FROM dept;
SELECT *FROM employees;

INSERT INTO employees
VALUES
(102,'Sonia',55000.45,'Female',1001),
(103,'Priya',65000.45,'Female',1001);

INSERT INTO employees
VALUES
(104,'Modi',75000.45,'Male',1003),
(105,'Amith',85000.45,'Male',1003);


INSERT INTO employees
VALUES
(106,'Rajni',85000.45,'Male',1004),
(107,'Vijay',95000.45,'Male',1004);


INSERT INTO employees
VALUES
(108,'Sharuk',95000.45,'Male',1002);


FETCH data FROM employees AND dept TABLE

Employee_Id   Employee_Name  Employee_Salary  Dept_Name
101    Rahul   45000   IT
102    Sonia   55000   IT
-----------------------------------------------------
SELECT *FROM
employees,dept;


SELECT 
 *FROM
employees e, dept d
WHERE e.d_id=d.dept_id;


SELECT 
 e.emp_id AS Employee_Id,
 e.ename AS Employee_Name,
 e.esal AS Employee_Salary,
 d.dept_name AS Dept_Name
FROM 
employees e, dept d
WHERE e.d_id=d.dept_id;

------------------TASK 1 : ----------------------------------
-------------------------Question Start----------------------
Table 1: department_info

Columns:

dept_id

dept_name

dept_location

dept_budget

Data:

101 | IT | FC-89 | 500000
102 | Electronics | FC-54 | 400000
103 | Admin | TY-56 | 350000
104 | Accounts | TY-43 | 250000

REFERENCING / RELATED TABLE

Table 2: employee_info

Columns:

emp_ID

emp_name

emp_dob

emp_city

dept_id (Foreign Key)

Data:

SL21 | Rahul | 15-Aug-1970 | Delhi | 101
SG45 | Sonia | 09-Dec-1971 | Prayagraj | 102
PL67 | Priyanka | 12-Jan-1982 | Delhi | 101
HG56 | Modi | 17-Sep-1950 | Vadodara | 103
NF78 | Amith | 14-Jun-1973 | Hyderabad | 102

Task given in image

Write a SQL query to display:

Employee_Name
Employee_City
Dept_Name
Dept_Budget
------------------------------------------Question End----------------
----------------------------------------Answer Starts-------------------------

CREATE TABLE department_info(
dept_id INT,
dept_name VARCHAR(50) NOT null,
dept_location varchar(50),
dept_budget int,
PRIMARY KEY(dept_id)
);

CREATE TABLE employee_info(
emp_ID varchar(32),
emp_name VARCHAR(50) NOT null,
emp_city  varchar(32),
dept_id int, 
PRIMARY KEY(emp_ID),
FOREIGN KEY (dept_id) REFERENCES department_info (dept_id)
);

DESC department_info;
DESC employee_info;

INSERT INTO department_info
VALUES
(101,'IT','FC-89',500000),
(102,'Electronics','FC-54',400000),
(103,'Admin','FC-56',350000),
(104,'Accounts','FC-45',250000);

INSERT INTO employee_info
VALUES
('E-101','Divya','Vellore',101),
('E-102','rahul','chennai',101),
('E-103','mani','Vellore',101),
('E-104','vetri','kunnur',103),
('E-105','hari','Vellore',102);

SELECT * from employee_info, department_info;
---Display only macthed rows from both tables--------

SELECT * from employee_info,department_info
WHERE employee_info.dept_id=department_info.dept_id;


SELECT 
employee_info.emp_name AS Employee_Name,
employee_info.emp_city AS City,
department_info.dept_name AS department_name,
department_info.dept_budget AS Total_Budget
from employee_info,department_info
WHERE employee_info.dept_id=department_info.dept_id;
