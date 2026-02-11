---10.02.2026---
---contraints---

Mysql contraints(rules on data)
7 Contraints

1.Not Null
2.Unique 
3.Default
4.check
5.primary key 
6.foreign key 
7.index

Mysql contraints(rules on data)
7 Contraints

1.Not Null      - null values not allowed
2.Unique        - duplicates are not allowed
3.Default       - default values
4.check         - condition on data
5.primary key   - not null + unique
6.foreign key   - referencial key which is ref to another table pk
7.index         - 

----------Today Covered contraints-----------
1.Not Null      - null values not allowed
2.Unique        - duplicates are not allowed but null values allowed
3.Default       - default values
4.check         - condition on data
5.primary key   - not null + unique


-----------Class Started----------------

mysql -uroot -proot

DROP DATABASE 6pm;

CREATE DATABASE 6pm;
USE 6pm;

CREATE TABLE order_tab(
order_id INT,
order_name VARCHAR(32),
price FLOAT,
status VARCHAR(32)
);

DESC order_tab;

INSERT INTO order_tab
VALUES
(1,'Marker Pen',30.30,'In Progress'),
(1,'Mouse',300.30,'In Progress'),
(1,'Laptap',55555.30,'Delivered'),
(1,'Charger',3000.30,'Delivered');

SELECT *FROM order_tab;

--Rules on data
--SQL contraints 
--Mysql 7 contraints
-- not null,unique,check,defualt,primary key,fk,index

CREATE TABLE employees(
	eid INT UNIQUE ,
	ename VARCHAR(32) NOT NULL,
	esal FLOAT CHECK(esal>=18000.00),
	loc VARCHAR(32) DEFAULT 'Bangalore'
);

INSERT INTO employees
VALUES
(101,'Rahul',19000,'Chennai');

--unique means duplicates are not allowed
-- but null values allowed mutliple times

INSERT INTO employees(ename,esal,loc)
VALUES
('Sonia',20000,'New Delhi'),
('Priya',21000,'USA'),
('Modi',22000,'Varanasi');

SELECT *FROM employees;


INSERT INTO employees(eid,esal,loc)
VALUES
(102,56000,'Marathahalli');

--default : if user not provided value it take default value
INSERT INTO employees(eid,ename,esal)
VALUES
(103,'Rajni',60000.60),
(104,'Vijay',70000.60),
(105,'VS',80000.60),
(106,'Kamal',90000.60);

SELECT *FROM employees;

INSERT INTO employees
VALUES
(107,'Narasimha',17000,'Chennai');

DROP TABLE employees;


CREATE TABLE employees(
	eid INT,
	ename VARCHAR(32) NOT NULL,
	esal FLOAT CHECK(esal>=18000.00),
	loc VARCHAR(32) DEFAULT 'Bangalore',

	PRIMARY KEY(eid)
);
-------------Class END----------