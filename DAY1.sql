--09.02-2026--
--My sql CRUD OPERATORs--

SQL COMMANDS
1. DDL - Data Definition language
2. DML - Data Manipulation language
3. DCL - Data Control language
4. TCL - TRANSACTION Control language
5. DQL - Data query language

DDL - Data Definition language
1. CREATE
2. Drop
3. ALTER
4. TRUNCATE

DML - Data Manipulation language
1. insert
2. update
3. delete

DCL - Data Control language
1. GRANT
2. REVOKE

TCL - TRANSACTION Control language
1. COMMIT
2. rollback
3. SAVEPOINT

DQL - Data query language
1. SELECT


CRUD OPERATORs--

1. CREATE
2. READ
3. UPDATE
4. DELETE

cmd>
mysql -uroot -proot

show databases;
system cls;

CREATE DATABASE 6pm;
USE 6pm;
show tables;

-------CREATE------------

CREATE TABLE employees();
CREATE TABLE employees(
	eid int,
	ename VARCHAR(32),
	esal  float,
	gender VARCHAR(32)
);

DESC employees;

---------READ-----------

SELECT *FROM employees;

 --INSERT one more
INSERT INTO employees
VALUES
(101,'Rahul',45000.45,'Male');
-- insert multiple rows

INSERT INTO employees
VALUES
(102,'Sonia',55000.55,'Female'),
(103,'Priyanka',65000.65,'Female'),
(104,'Modi',75000.75,'Male');

SELECT *FROM employees;

-- insert only two column
INSERT INTO employees(eid,ename)
VALUES
(105,'Amith');

--update table data
UPDATE employees
SET ename="Rahul Gandhi"
WHERE eid=101;

--update table data without where
--it update all rows
UPDATE employees
SET esal=99999.99;

--delete one/more rows
DELETE FROM employees
WHERE eid=101;

--delete all rows
DELETE FROM employees;

DELETE vs DROP


INSERT INTO employees
VALUES
(101,'Rahul',45000.45,'Male');

INSERT INTO employees
VALUES
(102,'Sonia',55000.55,'Female'),
(103,'Priyanka',65000.65,'Female'),
(104,'Modi',75000.75,'Male');

INSERT INTO employees(eid,ename)
VALUES
(105,'Amith');


DELETE vs Drop?
DELETE one more more rows. but still TABLE SCHEMA exits
DROP : completely dropping TABLE SCHEMA AND data
DELETE FROM employees;
DROP TABLE employees;
