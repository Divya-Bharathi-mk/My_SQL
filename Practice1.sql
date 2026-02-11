--------session starts with login -------
mysql -uroot -proot

-------LOGIN SUCCESSFUL-----

Show DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+

------CREATE DATABASE---------

CREATE DATABASE divya_tester;

Query OK, 1 row affected (0.13 sec)

------------select Database---------

USE divya_tester;

-----------CREATE TABLE-----------
CREATE TABLE pp_purchase(
ID int ,
vendor_name VARCHAR(50) NOT NULL,
vendor_id VARCHAR(50),
item_code VARCHAR(50) NOT NULL,
Price FLOAT  CHECK (Price>=0),
amount FLOAT NOT NULL,
Added_emp VARCHAR(32) NOT NULL,
PRIMARY KEY (ID, vendor_id)
);

Query OK, 0 rows affected (0.88 sec)

-------------Description view ----------
 
DESC pp_purchase;

+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| ID          | int         | NO   | PRI | NULL    |       |
| vendor_name | varchar(50) | NO   |     | NULL    |       |
| vendor_id   | varchar(50) | NO   | PRI | NULL    |       |
| item_code   | varchar(50) | NO   |     | NULL    |       |
| Price       | float       | YES  |     | NULL    |       |
| amount      | float       | NO   |     | NULL    |       |
| Added_emp   | varchar(32) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+

--------------Adding column in existing TABLE-----------

ALTER TABLE pp_purchase
ADD quantity int NOT NULL AFTER item_code,
ADD Vendor_Address VARCHAR(100) DEFAULT 'Tamilnadu';

+----------------+--------------+------+-----+-----------+-------+
| Field          | Type         | Null | Key | Default   | Extra |
+----------------+--------------+------+-----+-----------+-------+
| ID             | int          | NO   | PRI | NULL      |       |
| vendor_name    | varchar(50)  | NO   |     | NULL      |       |
| vendor_id      | varchar(50)  | NO   | PRI | NULL      |       |
| item_code      | varchar(50)  | NO   |     | NULL      |       |
| quantity       | int          | NO   |     | NULL      |       |
| Price          | float        | YES  |     | NULL      |       |
| amount         | float        | NO   |     | NULL      |       |
| Added_emp      | varchar(32)  | NO   |     | NULL      |       |
| Vendor_Address | varchar(100) | YES  |     | Tamilnadu |       |
+----------------+--------------+------+-----+-----------+-------+




------------Data Insertion---------------

INSERT INTO pp_purchase
VALUES
(1001,'Divya','VD001','Item01',25,10,250,'DIVYA MANIKARAN','Kunnur'),
(1002,'kavitha','VD002','Item02',30,25,750,'DIVYA MANIKARAN','Theni'),
(1003,'Suresh','VD003','Item03',25,200,5000,'DIVYA MANIKARAN','Vellore'),
(1004,'Kanmani','VD004','Item01',60,120.36,7221.6,'DIVYA MANIKARAN','chennai'),
(1005,'Anbu','VD005','Item01',70,110.85,7759.5,'DIVYA MANIKARAN','pernambut'),
(1006,'Megalai','VD006','Item05',20,40,800,'DIVYA MANIKARAN','Kunnur'),
(1007,'Mani','VD007','Item16',10,65,650,'DIVYA MANIKARAN','Madurai');

Query OK, 7 rows affected (0.07 sec)
Records: 7  Duplicates: 0  Warnings: 0

------------------Read data-----------------

SELECT * FROM pp_purchase;

mysql> select * from pp_purchase;
+------+-------------+-----------+-----------+----------+--------+--------+-----------------+----------------+
| ID   | vendor_name | vendor_id | item_code | quantity | Price  | amount | Added_emp       | Vendor_Address |
+------+-------------+-----------+-----------+----------+--------+--------+-----------------+----------------+
| 1001 | Divya       | VD001     | Item01    |       25 |     10 |    250 | DIVYA MANIKARAN | Kunnur         |
| 1002 | kavitha     | VD002     | Item02    |       30 |     25 |    750 | DIVYA MANIKARAN | Theni          |
| 1003 | Suresh      | VD003     | Item03    |       25 |    200 |   5000 | DIVYA MANIKARAN | Vellore        |
| 1004 | Kanmani     | VD004     | Item01    |       60 | 120.36 | 7221.6 | DIVYA MANIKARAN | chennai        |
| 1005 | Anbu        | VD005     | Item01    |       70 | 110.85 | 7759.5 | DIVYA MANIKARAN | pernambut      |
| 1006 | Megalai     | VD006     | Item05    |       20 |     40 |    800 | DIVYA MANIKARAN | Kunnur         |
| 1007 | Mani        | VD007     | Item16    |       10 |     65 |    650 | DIVYA MANIKARAN | Madurai        |
+------+-------------+-----------+-----------+----------+--------+--------+-----------------+----------------+

--------------------CONSTRAINTS RULE CHECK---------------------------------
--------------------NOT Null-------------------------------------------
1. NOT NULL

TRY 1 :
INSERT INTO pp_purchase(ID,vendor_name,vendor_id,item_code,quantity,Price,amount,Added_emp,Vendor_Address)
VALUES
(1008,'','VD008',Null,Null,10,300,Null,'Ambur');

response : ERROR 1048 (23000): Column 'item_code' cannot be null

1. In above response alert dispalying only for 'item_code' column. why ?

MySQL checks constraints column by column and stops at the first error it finds.

Question 1: vendor_name column value defined as '' empty why alert not showen ?

When you insert: '', It is NOT NULL. It is an empty string, and MySQL treats it as a valid value.
Difference must remember if the value is null not allowed but empty string '' can be allowed 

Question 2: How we can prevent empty string ?

By using CHECK CONSTRAINTS we can RESTRICT empty string also

Syntax = vendor_name VARCHAR(50) NOT NULL CHECK (vendor_name <> '')

TRY 2: 
INSERT INTO pp_purchase(ID,vendor_name,vendor_id,item_code,quantity,Price,amount,Added_emp,Vendor_Address)
VALUES
(1008,'Manoj','VD008','Item07',Null,10,300,Null,'Ambur');

response: ERROR 1048 (23000): Column 'quantity' cannot be null

--------------------------------------PRIMARY Key-----------------------------------
2. PRIMARY Key

ID and vendor_id both defined as PRIMARY key

Try 1: 

INSERT INTO pp_purchase(ID,vendor_name,vendor_id,item_code,quantity,Price,amount,Added_emp,Vendor_Address)
VALUES
(1007,'Manoj K','VD009','Item07',30,10,300,'DIVYA MANIKARAN','Ambur');

Reponse : Query OK, 1 row affected (0.03 sec)  ??? how its added the duplciation entry ????

mysql> select * from pp_purchase;

Note in below ID column 1007 have added 2 times which means duplcaited how? we have defined the ID column as PRIMARY Key ?
+------+-------------+-----------+-----------+----------+--------+--------+-----------------+----------------+
| ID   | vendor_name | vendor_id | item_code | quantity | Price  | amount | Added_emp       | Vendor_Address |
+------+-------------+-----------+-----------+----------+--------+--------+-----------------+----------------+
| 1001 | Divya       | VD001     | Item01    |       25 |     10 |    250 | DIVYA MANIKARAN | Kunnur         |
| 1002 | kavitha     | VD002     | Item02    |       30 |     25 |    750 | DIVYA MANIKARAN | Theni          |
| 1003 | Suresh      | VD003     | Item03    |       25 |    200 |   5000 | DIVYA MANIKARAN | Vellore        |
| 1004 | Kanmani     | VD004     | Item01    |       60 | 120.36 | 7221.6 | DIVYA MANIKARAN | chennai        |
| 1005 | Anbu        | VD005     | Item01    |       70 | 110.85 | 7759.5 | DIVYA MANIKARAN | pernambut      |
| 1006 | Megalai     | VD006     | Item05    |       20 |     40 |    800 | DIVYA MANIKARAN | Kunnur         |
| 1007 | Mani        | VD007     | Item16    |       10 |     65 |    650 | DIVYA MANIKARAN | Madurai        |
| 1007 | Manoj K     | VD009     | Item07    |       30 |     10 |    300 | DIVYA MANIKARAN | Ambur          |
+------+-------------+-----------+-----------+----------+--------+--------+-----------------+----------------+

ANS : When multiple columns are marked as PRIMARY, MySQL treats them as one combined key (composite primary key).
which means inside the primery key how manu columns we have added those column combinationally duplication it wont allowed.

Example : 
ID  	vendor_id	Result
1001	VD001	    ✅ allowed
1001	VD002	    ✅ allowed
1001	VD003	    ✅ allowed
1001	VD001	    ❌ duplicate combination

Try 2: 

INSERT INTO pp_purchase(ID,vendor_name,vendor_id,item_code,quantity,Price,amount,Added_emp,Vendor_Address)
VALUES
(1007,'Manoj K','VD009','Item07',30,10,300,'DIVYA MANIKARAN','Ambur');

response: ERROR 1062 (23000): Duplicate entry '1007-VD009' for key 'pp_purchase.PRIMARY'

As per above response we got duplication error with the combination of PRIMARY key column

---------------------------------------Default------------------------------
3. Default 

INSERT INTO pp_purchase(ID,vendor_name,vendor_id,item_code,quantity,Price,amount,Added_emp)
VALUES
(1010,'Manoj K','VD012','Item07',30,10,300,'DIVYA MANIKARAN');

Reponse : Query OK, 1 row affected (0.00 sec)

Result : mysql> select * from pp_purchase; => Default value 'Tamilnadu' updated.
+------+-------------+-----------+-----------+----------+--------+--------+-----------------+----------------+
| ID   | vendor_name | vendor_id | item_code | quantity | Price  | amount | Added_emp       | Vendor_Address |
+------+-------------+-----------+-----------+----------+--------+--------+-----------------+----------------+
| 1001 | Divya       | VD001     | Item01    |       25 |     10 |    250 | DIVYA MANIKARAN | Kunnur         |
| 1002 | kavitha     | VD002     | Item02    |       30 |     25 |    750 | DIVYA MANIKARAN | Theni          |
| 1003 | Suresh      | VD003     | Item03    |       25 |    200 |   5000 | DIVYA MANIKARAN | Vellore        |
| 1004 | Kanmani     | VD004     | Item01    |       60 | 120.36 | 7221.6 | DIVYA MANIKARAN | chennai        |
| 1005 | Anbu        | VD005     | Item01    |       70 | 110.85 | 7759.5 | DIVYA MANIKARAN | pernambut      |
| 1006 | Megalai     | VD006     | Item05    |       20 |     40 |    800 | DIVYA MANIKARAN | Kunnur         |
| 1007 | Mani        | VD007     | Item16    |       10 |     65 |    650 | DIVYA MANIKARAN | Madurai        |
| 1007 | Manoj K     | VD009     | Item07    |       30 |     10 |    300 | DIVYA MANIKARAN | Ambur          |
| 1007 | Manoj K     | VD010     | Item07    |       30 |     10 |    300 | DIVYA MANIKARAN |                |
| 1009 | Manoj K     | VD011     | Item07    |       30 |     10 |    300 | DIVYA MANIKARAN | Tamilnadu      |
| 1010 | Manoj K     | VD012     | Item07    |       30 |     10 |    300 | DIVYA MANIKARAN | Tamilnadu      |
+------+-------------+-----------+-----------+----------+--------+--------+-----------------+----------------+

------------------------------------CHECK----------------------------------------
4. CHECK 

Condition : Price FLOAT  CHECK (Price>=0)

INSERT INTO pp_purchase(ID,vendor_name,vendor_id,item_code,quantity,Price,amount,Added_emp)
VALUES
(1010,'Manoj K','VD012','Item07',30,-10,300,'DIVYA MANIKARAN');

Reponse : ERROR 3819 (HY000): Check constraint 'pp_purchase_chk_1' is violated.