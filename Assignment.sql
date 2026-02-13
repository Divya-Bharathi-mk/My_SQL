create table employee (
eid INT ,
fname VARCHAR(32),
lname VARCHAR(32),
city VARCHAR(32),
esal INT,
age INT,
PRIMARY KEY(eid)
);

mysql> desc employee;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| eid   | int         | NO   | PRI | NULL    |       |
| fname | varchar(32) | YES  |     | NULL    |       |
| lname | varchar(32) | YES  |     | NULL    |       |
| city  | varchar(32) | YES  |     | NULL    |       |
| esal  | int         | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

insert into employee values
(101,'Rahul','Gandhi','Wayanad',45000,52),
(102,'Sonia','Gandhi','New Delhi',55000,75),
(103,'Priyanka','Gandhi','Nodia',65000,45),
(104,'Modi','Narendra','New Delhi',75000,69),
(105,'Rajni','Kanth','Chennai',85000,65),
(106,'Vijay','Setupathi','Chennai',95000,47),
(107,'Nayana','Tara','Chennai',25000,40),
(108,'Alia','Bhut','Mumbai',45000,31),
(109,'Mahesh','Bhut','Mumbai',15000,68),
(110,'Sonam','Kapoor','Mumbai',30000,27),
(111,'Anil','Kapoor','Mumbai',38000,40),
(112,'Raj','Kapoor','Mumbai',18000,78),
(113,'Vishnu','Manchu','Hyderabad',10000,40),
(114,'Manoj','Manchu','Hyderabad',12000,35);

Inserting a null salary value

INSERT INTO employee (eid,fname,lname,city,age)
values
(115,'Mohan','Manchu','Hyderabad',70);

Table :
mysql> select * from employee;
+-----+----------+-----------+-----------+-------+------+
| eid | fname    | lname     | city      | esal  | age  |
+-----+----------+-----------+-----------+-------+------+
| 101 | Rahul    | Gandhi    | Wayanad   | 45000 |   52 |
| 102 | Sonia    | Gandhi    | New Delhi | 55000 |   75 |
| 103 | Priyanka | Gandhi    | Nodia     | 65000 |   45 |
| 104 | Modi     | Narendra  | New Delhi | 75000 |   69 |
| 105 | Rajni    | Kanth     | Chennai   | 85000 |   65 |
| 106 | Vijay    | Setupathi | Chennai   | 95000 |   47 |
| 107 | Nayana   | Tara      | Chennai   | 25000 |   40 |
| 108 | Alia     | Bhut      | Mumbai    | 45000 |   31 |
| 109 | Mahesh   | Bhut      | Mumbai    | 15000 |   68 |
| 110 | Sonam    | Kapoor    | Mumbai    | 30000 |   27 |
| 111 | Anil     | Kapoor    | Mumbai    | 38000 |   40 |
| 112 | Raj      | Kapoor    | Mumbai    | 18000 |   78 |
| 113 | Vishnu   | Manchu    | Hyderabad | 10000 |   40 |
| 114 | Manoj    | Manchu    | Hyderabad | 12000 |   35 |
| 115 | Mohan    | Manchu    | Hyderabad |  NULL |   70 |
+-----+----------+-----------+-----------+-------+------+

----------------------------------------Assignments------------------------------------------
1. Write a query to fetch employee whose last name is same.

SELECT *
FROM employee
WHERE lname IN (
    SELECT lname
    FROM employee
    GROUP BY lname
    HAVING COUNT(*) > 1
);

+-----+----------+--------+-----------+-------+------+
| eid | fname    | lname  | city      | esal  | age  |
+-----+----------+--------+-----------+-------+------+
| 101 | Rahul    | Gandhi | Wayanad   | 45000 |   52 |
| 102 | Sonia    | Gandhi | New Delhi | 55000 |   75 |
| 103 | Priyanka | Gandhi | Nodia     | 65000 |   45 |
| 108 | Alia     | Bhut   | Mumbai    | 45000 |   31 |
| 109 | Mahesh   | Bhut   | Mumbai    | 15000 |   68 |
| 110 | Sonam    | Kapoor | Mumbai    | 30000 |   27 |
| 111 | Anil     | Kapoor | Mumbai    | 38000 |   40 |
| 112 | Raj      | Kapoor | Mumbai    | 18000 |   78 |
| 113 | Vishnu   | Manchu | Hyderabad | 10000 |   40 |
| 114 | Manoj    | Manchu | Hyderabad | 12000 |   35 |
| 115 | Mohan    | Manchu | Hyderabad |  NULL |   70 |
+-----+----------+--------+-----------+-------+------+

2. Write a query to fetch whose age is grater then 70.

SELECT *
FROM employee
WHERE age >70;

+-----+-------+--------+-----------+-------+------+
| eid | fname | lname  | city      | esal  | age  |
+-----+-------+--------+-----------+-------+------+
| 102 | Sonia | Gandhi | New Delhi | 55000 |   75 |
| 112 | Raj   | Kapoor | Mumbai    | 18000 |   78 |
+-----+-------+--------+-----------+-------+------+

3. Write a query to fetch employee with same city.

SELECT *
FROM employee
WHERE city IN (
    SELECT city
    FROM employee
    GROUP BY city
    HAVING COUNT(*) > 1
);

+-----+--------+-----------+-----------+-------+------+
| eid | fname  | lname     | city      | esal  | age  |
+-----+--------+-----------+-----------+-------+------+
| 102 | Sonia  | Gandhi    | New Delhi | 55000 |   75 |
| 104 | Modi   | Narendra  | New Delhi | 75000 |   69 |
| 105 | Rajni  | Kanth     | Chennai   | 85000 |   65 |
| 106 | Vijay  | Setupathi | Chennai   | 95000 |   47 |
| 107 | Nayana | Tara      | Chennai   | 25000 |   40 |
| 108 | Alia   | Bhut      | Mumbai    | 45000 |   31 |
| 109 | Mahesh | Bhut      | Mumbai    | 15000 |   68 |
| 110 | Sonam  | Kapoor    | Mumbai    | 30000 |   27 |
| 111 | Anil   | Kapoor    | Mumbai    | 38000 |   40 |
| 112 | Raj    | Kapoor    | Mumbai    | 18000 |   78 |
| 113 | Vishnu | Manchu    | Hyderabad | 10000 |   40 |
| 114 | Manoj  | Manchu    | Hyderabad | 12000 |   35 |
| 115 | Mohan  | Manchu    | Hyderabad |  NULL |   70 |
+-----+--------+-----------+-----------+-------+------+

4. Write a query to fetch whose name ends with 'h'.

SELECT *
FROM employee
WHERE fname like '%h';

+-----+--------+-------+--------+-------+------+
| eid | fname  | lname | city   | esal  | age  |
+-----+--------+-------+--------+-------+------+
| 109 | Mahesh | Bhut  | Mumbai | 15000 |   68 |
+-----+--------+-------+--------+-------+------+

5. Write a query to count employee whose last name ends with 'i'.

SELECT * 
FROM employee
where lname IN(
   SELECT lname
   FROM employee
   WHERE lname like '%i'
   GROUP BY lname
   HAVING COUNT(*)>1
);

+-----+----------+--------+-----------+-------+------+
| eid | fname    | lname  | city      | esal  | age  |
+-----+----------+--------+-----------+-------+------+
| 101 | Rahul    | Gandhi | Wayanad   | 45000 |   52 |
| 102 | Sonia    | Gandhi | New Delhi | 55000 |   75 |
| 103 | Priyanka | Gandhi | Nodia     | 65000 |   45 |
+-----+----------+--------+-----------+-------+------+

6. Write a query to find employee with highest salary.

SELECT *
FROM employee
WHERE esal IN(
      SELECT MAX(esal)
	  from employee
);

+-----+-------+-----------+---------+-------+------+
| eid | fname | lname     | city    | esal  | age  |
+-----+-------+-----------+---------+-------+------+
| 106 | Vijay | Setupathi | Chennai | 95000 |   47 |
+-----+-------+-----------+---------+-------+------+

7. Write a query to find employee with lowest salary.

SELECT *
FROM employee
WHERE esal IN(
      SELECT MIN(esal)
	  from employee
);

+-----+--------+--------+-----------+-------+------+
| eid | fname  | lname  | city      | esal  | age  |
+-----+--------+--------+-----------+-------+------+
| 113 | Vishnu | Manchu | Hyderabad | 10000 |   40 |
+-----+--------+--------+-----------+-------+------+

8. Write a query to change last name of employee whose id is 102.

UPDATE employee 
set lname='Kavin' 
WHERE eid=102;

Query OK, 1 row affected (1.127 sec)
Rows matched: 1  Changed: 1  Warnings: 0

select * 
FROM employee
WHERE eid=102;

+-----+-------+-------+-----------+-------+------+
| eid | fname | lname | city      | esal  | age  |
+-----+-------+-------+-----------+-------+------+
| 102 | Sonia | Kavin | New Delhi | 55000 |   75 |
+-----+-------+-------+-----------+-------+------+

9. Write a query to find name of employee whose name starts with 'A' and city name starts with 'B'.

SELECT *
FROM employee
WHERE fname like 'A%' AND city LIKE '%I';

Empty set (0.011 sec)

10. Write a query to find employee with highest salary in 'Bangalore'.

SELECT *
FROM employee
WHERE esal IN(
      SELECT MAX(esal)
	  from employee
	  where city='Bangalore'
);

Empty set (0.014 sec)


SELECT *
FROM employee
WHERE esal IN(
      SELECT MAX(esal)
	  from employee
	  where city='Mumbai'
);

+-----+-------+--------+---------+-------+------+
| eid | fname | lname  | city    | esal  | age  |
+-----+-------+--------+---------+-------+------+
| 101 | Rahul | Gandhi | Wayanad | 45000 |   52 |
| 108 | Alia  | Bhut   | Mumbai  | 45000 |   31 |
+-----+-------+--------+---------+-------+------+

11. Write a query to find employee who line in 'Hyderabad' with age above 70.

SELECT * 
FROM employee
WHERE city='Hyderabad' and age>70;

Empty set (0.011 sec)

SELECT * 
FROM employee
WHERE city='Hyderabad' and age>=70;

+-----+-------+--------+-----------+------+------+
| eid | fname | lname  | city      | esal | age  |
+-----+-------+--------+-----------+------+------+
| 115 | Mohan | Manchu | Hyderabad | NULL |   70 |
+-----+-------+--------+-----------+------+------+

12. Write a query to find employee with salary below 50000.

SELECT * 
FROM employee
WHERE esal<50000;

+-----+--------+--------+-----------+-------+------+
| eid | fname  | lname  | city      | esal  | age  |
+-----+--------+--------+-----------+-------+------+
| 101 | Rahul  | Gandhi | Wayanad   | 45000 |   52 |
| 107 | Nayana | Tara   | Chennai   | 25000 |   40 |
| 108 | Alia   | Bhut   | Mumbai    | 45000 |   31 |
| 109 | Mahesh | Bhut   | Mumbai    | 15000 |   68 |
| 110 | Sonam  | Kapoor | Mumbai    | 30000 |   27 |
| 111 | Anil   | Kapoor | Mumbai    | 38000 |   40 |
| 112 | Raj    | Kapoor | Mumbai    | 18000 |   78 |
| 113 | Vishnu | Manchu | Hyderabad | 10000 |   40 |
| 114 | Manoj  | Manchu | Hyderabad | 12000 |   35 |
+-----+--------+--------+-----------+-------+------+
9 rows in set (0.010 sec)

13. Write a query to find name of employee with salary range between 20000 to 40000.

SELECT * 
FROM employee
WHERE esal BETWEEN 20000 and 40000;

+-----+--------+--------+---------+-------+------+
| eid | fname  | lname  | city    | esal  | age  |
+-----+--------+--------+---------+-------+------+
| 107 | Nayana | Tara   | Chennai | 25000 |   40 |
| 110 | Sonam  | Kapoor | Mumbai  | 30000 |   27 |
| 111 | Anil   | Kapoor | Mumbai  | 38000 |   40 |
+-----+--------+--------+---------+-------+------+

15. Write a query to find employee whose first name third character is 'j'.

SELECT * 
FROM employee
WHERE fname LIKE '__j%';

+-----+-------+-----------+---------+-------+------+
| eid | fname | lname     | city    | esal  | age  |
+-----+-------+-----------+---------+-------+------+
| 105 | Rajni | Kanth     | Chennai | 85000 |   65 |
| 106 | Vijay | Setupathi | Chennai | 95000 |   47 |
| 112 | Raj   | Kapoor    | Mumbai  | 18000 |   78 |
+-----+-------+-----------+---------+-------+------+

16. Write a query to find employee whose first name third character is 'j' and live in 'Bangalore'.

SELECT * 
FROM employee
WHERE fname LIKE '__j%' and city='Bangalore';

Empty set (0.006 sec)

SELECT * 
FROM employee
WHERE fname LIKE '__j%' and city='Chennai';

+-----+-------+-----------+---------+-------+------+
| eid | fname | lname     | city    | esal  | age  |
+-----+-------+-----------+---------+-------+------+
| 105 | Rajni | Kanth     | Chennai | 85000 |   65 |
| 106 | Vijay | Setupathi | Chennai | 95000 |   47 |
+-----+-------+-----------+---------+-------+------+
2 rows in set (0.007 sec)

17. Write a query to count employees whose first name third character is 'j'.


SELECT COUNT(*) 
FROM employee
WHERE fname LIKE '__j%';

+----------+
| COUNT(*) |
+----------+
|        3 |
+----------+

18. Write a query to fetch employee with lowest salary and add 10000 to its salary.

SELECT fname,esal+10000 as salary
FROM employee 
where esal IN(
        SELECT MIN(esal) as total_salary 
        from employee
);

+--------+--------+
| fname  | salary |
+--------+--------+
| Vishnu |  20000 |
+--------+--------+
1 row in set (0.00 sec)

19. Write a query to Sort the table by ascending.

SELECT *
FROM employee
ORDER BY eid ASC;

+-----+----------+-----------+-----------+-------+------+
| eid | fname    | lname     | city      | esal  | age  |
+-----+----------+-----------+-----------+-------+------+
| 101 | Rahul    | Gandhi    | Wayanad   | 45000 |   52 |
| 102 | Sonia    | Gandhi    | New Delhi | 55000 |   75 |
| 103 | Priyanka | Gandhi    | Nodia     | 65000 |   45 |
| 104 | Modi     | Narendra  | New Delhi | 75000 |   69 |
| 105 | Rajni    | Kanth     | Chennai   | 85000 |   65 |
| 106 | Vijay    | Setupathi | Chennai   | 95000 |   47 |
| 107 | Nayana   | Tara      | Chennai   | 25000 |   40 |
| 108 | Alia     | Bhut      | Mumbai    | 45000 |   31 |
| 109 | Mahesh   | Bhut      | Mumbai    | 15000 |   68 |
| 110 | Sonam    | Kapoor    | Mumbai    | 30000 |   27 |
| 111 | Anil     | Kapoor    | Mumbai    | 38000 |   40 |
| 112 | Raj      | Kapoor    | Mumbai    | 18000 |   78 |
| 113 | Vishnu   | Manchu    | Hyderabad | 10000 |   40 |
| 114 | Manoj    | Manchu    | Hyderabad | 12000 |   35 |
| 115 | Mohan    | Manchu    | Hyderabad |  NULL |   70 |
+-----+----------+-----------+-----------+-------+------+
15 rows in set (0.00 sec)

20. Write a query to Sort the table by descending.

SELECT *
FROM employee
ORDER BY eid DESC;

+-----+----------+-----------+-----------+-------+------+
| eid | fname    | lname     | city      | esal  | age  |
+-----+----------+-----------+-----------+-------+------+
| 115 | Mohan    | Manchu    | Hyderabad |  NULL |   70 |
| 114 | Manoj    | Manchu    | Hyderabad | 12000 |   35 |
| 113 | Vishnu   | Manchu    | Hyderabad | 10000 |   40 |
| 112 | Raj      | Kapoor    | Mumbai    | 18000 |   78 |
| 111 | Anil     | Kapoor    | Mumbai    | 38000 |   40 |
| 110 | Sonam    | Kapoor    | Mumbai    | 30000 |   27 |
| 109 | Mahesh   | Bhut      | Mumbai    | 15000 |   68 |
| 108 | Alia     | Bhut      | Mumbai    | 45000 |   31 |
| 107 | Nayana   | Tara      | Chennai   | 25000 |   40 |
| 106 | Vijay    | Setupathi | Chennai   | 95000 |   47 |
| 105 | Rajni    | Kanth     | Chennai   | 85000 |   65 |
| 104 | Modi     | Narendra  | New Delhi | 75000 |   69 |
| 103 | Priyanka | Gandhi    | Nodia     | 65000 |   45 |
| 102 | Sonia    | Gandhi    | New Delhi | 55000 |   75 |
| 101 | Rahul    | Gandhi    | Wayanad   | 45000 |   52 |
+-----+----------+-----------+-----------+-------+------+
15 rows in set (0.00 sec)


21. Write a query to show employee whose names last third word is 'j' and salary is more then 30000. 

SELECT  *
FROM employee
WHERE fname LIKE '%j__' and esal>30000;

+-----+-------+-----------+---------+-------+------+
| eid | fname | lname     | city    | esal  | age  |
+-----+-------+-----------+---------+-------+------+
| 105 | Rajni | Kanth     | Chennai | 85000 |   65 |
| 106 | Vijay | Setupathi | Chennai | 95000 |   47 |
+-----+-------+-----------+---------+-------+------+
2 rows in set (0.00 sec)

22. Write a query to show all employee who live in 'Bangalore' and 'Wayanad'.

SELECT *
FROM employee
WHERE city IN ('Bangalore','Wayanad');

+-----+-------+--------+---------+-------+------+
| eid | fname | lname  | city    | esal  | age  |
+-----+-------+--------+---------+-------+------+
| 101 | Rahul | Gandhi | Wayanad | 45000 |   52 |
+-----+-------+--------+---------+-------+------+
1 row in set (0.00 sec)

SELECT *
FROM employee
WHERE city IN ('Chennai','Wayanad');

+-----+--------+-----------+---------+-------+------+
| eid | fname  | lname     | city    | esal  | age  |
+-----+--------+-----------+---------+-------+------+
| 101 | Rahul  | Gandhi    | Wayanad | 45000 |   52 |
| 105 | Rajni  | Kanth     | Chennai | 85000 |   65 |
| 106 | Vijay  | Setupathi | Chennai | 95000 |   47 |
| 107 | Nayana | Tara      | Chennai | 25000 |   40 |
+-----+--------+-----------+---------+-------+------+
4 rows in set (0.00 sec)

23. Write a query to fetch employee with first name count is 5.

SELECT fname
FROM employee
Where LENGTH(fname)=5;

+-------+
| fname |
+-------+
| Rahul |
| Sonia |
| Rajni |
| Vijay |
| Sonam |
| Manoj |
| Mohan |
+-------+
7 rows in set (0.01 sec)

24. Write a query to group by employee with their age.

SELECT age,count(*)
FROM employee
GROUP BY age
HAVING COUNT(*)>0;

+------+----------+
| age  | count(*) |
+------+----------+
|   52 |        1 |
|   75 |        1 |
|   45 |        1 |
|   69 |        1 |
|   65 |        1 |
|   47 |        1 |
|   40 |        3 |
|   31 |        1 |
|   68 |        1 |
|   27 |        1 |
|   78 |        1 |
|   35 |        1 |
|   70 |        1 |
+------+----------+

26. Write a query to find employee with null salary.

select fname,esal
FROM employee
WHERE esal IS Null;

+-------+------+
| fname | esal |
+-------+------+
| Mohan | NULL |
+-------+------+
1 row in set (0.00 sec)

27. Write a query to find employee whose cities are not null.

select fname,esal
FROM employee
WHERE esal IS not Null;

+----------+-------+
| fname    | esal  |
+----------+-------+
| Rahul    | 45000 |
| Sonia    | 55000 |
| Priyanka | 65000 |
| Modi     | 75000 |
| Rajni    | 85000 |
| Vijay    | 95000 |
| Nayana   | 25000 |
| Alia     | 45000 |
| Mahesh   | 15000 |
| Sonam    | 30000 |
| Anil     | 38000 |
| Raj      | 18000 |
| Vishnu   | 10000 |
| Manoj    | 12000 |
+----------+-------+
14 rows in set (0.00 sec)

28. Write a query to delete data of employee whose id is 109.

DELETE FROM employee WHERE eid='109';


mysql> DELETE FROM employee WHERE eid='109';
Query OK, 1 row affected (0.42 sec)

select fname
from employee
where eid='109';

Empty set (0.00 sec)

29. Write a query to group by employee with their age and show first three rows of data.

SELECT age,count(*)
FROM employee
GROUP BY age
HAVING COUNT(*)>0
LIMIT 3;

+------+----------+
| age  | count(*) |
+------+----------+
|   52 |        1 |
|   75 |        1 |
|   45 |        1 |
+------+----------+
3 rows in set (0.00 sec)

mysql> select fname,esal,age from employee;
+----------+-------+------+
| fname    | esal  | age  |
+----------+-------+------+
| Rahul    | 45000 |   52 |
| Sonia    | 55000 |   75 |
| Priyanka | 65000 |   45 |
| Modi     | 75000 |   69 |
| Rajni    | 85000 |   65 |
| Vijay    | 95000 |   47 |
| Nayana   | 25000 |   40 |
| Alia     | 45000 |   31 |
| Sonam    | 30000 |   27 |
| Anil     | 38000 |   40 |
| Raj      | 18000 |   78 |
| Vishnu   | 10000 |   40 |
| Manoj    | 12000 |   35 |
| Mohan    |  NULL |   70 |
+----------+-------+------+
14 rows in set (0.00 sec)

30. Write a query to group by employee of 'Hyderabad' by their last name.


SELECT lname,count(*)
FROM employee
where city='Hyderabad' 
GROUP BY lname
HAVING COUNT(*);

+--------+----------+
| lname  | count(*) |
+--------+----------+
| Manchu |        3 |
+--------+----------+
1 row in set (0.00 sec)


