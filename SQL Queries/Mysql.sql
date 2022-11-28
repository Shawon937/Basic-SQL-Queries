CREATE DATABASE db_students;
DROP DATABASE db_students;
USE db_students;

CREATE TABLE students (
id INT AUTO_INCREMENT PRIMARY KEY,
student_id VARCHAR(15) NOT NULL,
student_name VARCHAR(50) NOT NULL,
student_dob DATE NOT NULL,
student_dept VARCHAR(15) NOT NULL,
student_course	VARCHAR(200) NOT NULL
);
-- Comments  --
TRUNCATE students;
TRUNCATE TABLE students;
SELECT * FROM students LIMIT 5;
SELECT * FROM students ORDER BY id DESC LIMIT 5;
SELECT * FROM students;
DROP TABLE students;	

-- Rename Table
ALTER TABLE students RENAME TO student_info;
ALTER TABLE student_info RENAME TO students;

INSERT INTO students(student_id,student_name,student_dob,student_dept,student_course) VALUES 
('SWE-101','Abdur Rahim','1995-09-02','SWE','Computer Fundamental, Physics, English'),
('SWE-102','Abdul Karim','1993-08-18','SWE','Computer Fundamental, Physics, English'),
('CSE-101','Abul Mia','1994-04-05','CSE','Computer Fundamental, Basic Networking, English'),
('CSE-102','Sazid Noor','1991-06-12','CSE','Computer Fundamental, Basic Networking, English'),
('CSE-103','Tamim Sayed','1993-07-22','CSE','Computer Fundamental, Basic Networking, English'),
('EEE-101','Baten Sarker','1994-01-20','EEE','Troubleshooting, Physics, English'),
('EEE-102','Ebne Arabi','1995-11-19','EEE','Troubleshooting, Physics, English'),
('EEE-103','Abu Sayem','1992-12-15','EEE','Troubleshooting, Physics, English')
;

INSERT INTO students(student_id,student_name,student_dob,student_dept,student_course) VALUES 

('ETE-101','Saad Abdullah','1990-12-29','ETE','Computer Fundamental,Physics, Basic Networking, English'),
('ETE-102','Mahfuz Alam','1991-10-27','ETE','Computer Fundamental, Physics, Basic Networking, English'),
('ETE-103','Misuk Nayem','1992-03-11','ETE','Computer Fundamental, Physics, Basic Networking, English'),
('ETE-104','Dipto Ahsan','1993-02-09','ETE','Computer Fundamental, Physics, Basic Networking, English')
;



DELETE FROM students WHERE student_dept = "CSE" ;
DELETE FROM students WHERE student_dept = 'CSE' ;
DELETE FROM students WHERE id = 1 ;

-- Column add modify delete
ALTER TABLE students ADD COLUMN test INT;
ALTER TABLE students DROP COLUMN test;
ALTER TABLE students MODIFY COLUMN test INT;

-- Column name change
ALTER TABLE students CHANGE student_dept testing INT;
ALTER TABLE students CHANGE testing student_dept INT;


ALTER TABLE students CHANGE test testing INT;
ALTER TABLE students CHANGE testing test VARCHAR(15);

-- assign AUTO Increment Value
ALTER TABLE students AUTO_INCREMENT = 100;

SELECT * FROM students WHERE student_dept = 'CSE';
SELECT * FROM students WHERE student_dept = "EEE";
SELECT student_id, student_name FROM students WHERE student_dept = "EEE";

-- order by
SELECT * FROM students ORDER BY student_dept;

-- Between --
SELECT * FROM students WHERE student_dob BETWEEN '1990-01-01' AND '1991-12-30';
SELECT * FROM students WHERE student_dept = "CSE" AND student_dob BETWEEN '1990-01-01' AND '1991-12-30';

-- AND OR --

SELECT * FROM students WHERE student_dept = 'CSE' AND student_course = 'Computer Fundamental, Basic Networking, English';
SELECT * FROM students WHERE student_dept = 'CSE' OR student_dept = 'EEE';

-- ORDER BY ASC DESC
SELECT * FROM students ORDER BY student_name; 
SELECT * FROM students ORDER BY student_dept;
SELECT * FROM students ORDER BY student_name DESC; 
SELECT * FROM students WHERE student_dob BETWEEN '1990-01-01' AND '1991-12-30' ORDER BY student_name ASC;

-- GROUP By --

 SELECT COUNT(student_name) AS 'Number Of Students', student_dept FROM students GROUP BY student_dept; 	

-- Distinct
SELECT DISTINCT student_dept FROM students;
SELECT COUNT(DISTINCT student_dept) FROM students;
SELECT COUNT(DISTINCT student_dept) AS 'Total Students' FROM students;

-- Like --

SELECT * FROM students WHERE student_name LIKE 'm%';
SELECT * FROM students WHERE student_name LIKE 'a%';
SELECT * FROM students WHERE student_name LIKE '%a';
SELECT * FROM students WHERE student_name NOT LIKE 'a%';
SELECT * FROM students WHERE student_name LIKE '%r%';
SELECT * FROM students WHERE student_name LIKE '_a_%';
SELECT * FROM students WHERE student_name LIKE '%alam%';
SELECT * FROM students WHERE student_name LIKE 'Mahfuz Alam';
SELECT * FROM students WHERE student_name LIKE '_________am';

-- Regexp  

SELECT * FROM students WHERE  student_name REGEXP 'alam';
SELECT * FROM students WHERE  student_name REGEXP '^alam';
SELECT * FROM students WHERE  student_name REGEXP '^Mahfuz';
SELECT * FROM students WHERE  student_name REGEXP 'Mahfuz$';
SELECT * FROM students WHERE  student_name REGEXP 'alam$';
SELECT * FROM students WHERE  student_name REGEXP '.a[a|b|l]';
SELECT * FROM students WHERE  student_name REGEXP 'a[a-z]';
SELECT * FROM students WHERE  student_name REGEXP 'alam|saad|sayed';
SELECT * FROM students WHERE  student_name REGEXP '^Alam | Alam$';
SELECT * FROM students WHERE  student_name REGEXP 'A.d';
SELECT * FROM students WHERE  student_name REGEXP 'a.$';

-- LIKE vs REGEXP

SELECT * FROM students WHERE 
student_name LIKE '__a%' OR 
student_name LIKE '__b%' OR
student_name LIKE '__c%' OR
student_name LIKE '__d%' OR
student_name LIKE '__e%';

SELECT * FROM students WHERE student_name REGEXP '^..[a|b|c|d|e]';
SELECT * FROM students WHERE student_name REGEXP '^..[a-e]';



-- concatanation
SELECT CONCAT(`student_name`, ", " , `student_dept`) FROM students;
-- IN
SELECT * FROM students WHERE `student_dept` IN ('CSE');
-- Replace

SELECT REPLACE (student_name, 'Abdur Rahim', 'ABD' ) FROM students;
SELECT * FROM students;

-- Update
UPDATE students SET student_name = 'Mahfuz Alam' WHERE id = 10; 



-- NEW Database

CREATE DATABASE db_products;
USE db_products;

CREATE TABLE products (
product_id INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(30) NOT NULL,
product_quantity INT,
product_price INT NOT NULL
);
SELECT * FROM products; 


INSERT INTO products (product_name,product_quantity,product_price) VALUES 
('Tomato', 30, 30),
('Cucumber', 15, 25),
('Potato', 30, 20),
('Radish', 10, 20),
('Carrot', 10, 25),
('Spinach', 15, 40),
('Cabbage', 25, 50),
('Brinjal', 18, 35)
;

DROP TABLE products;

-- rename column must define type and size
ALTER TABLE products CHANGE product_name testing VARCHAR(30);
ALTER TABLE products CHANGE testing product_name VARCHAR(30);
-- Typechange of a column
ALTER TABLE products MODIFY product_name VARCHAR(30);

-- rename table
RENAME TABLE prod TO products;

-- aggregate functions
SELECT MIN(product_price) FROM products;
SELECT MAX(product_price) FROM products;
SELECT AVG(product_price) FROM products;
SELECT SUM(product_price*product_quantity) 'Total price', SUM(`product_quantity`) quantity FROM products;
SELECT SUM(product_price*product_quantity) FROM products;
SELECT SUM(product_price*product_quantity) 'Total Price' , SUM(product_quantity),`product_name` FROM products GROUP BY product_name;
SELECT product_name,SUM(product_price*product_quantity) AS 'Available Product Price' FROM products WHERE `product_name`= 'Spinach';
SELECT product_name,SUM(product_price*product_quantity) AS 'Available Product Price' FROM products;

-- 2nd highest
SELECT MAX(product_price) FROM products WHERE `product_price` NOT IN
(SELECT MAX(product_price) FROM products );

--  4th highest
SELECT `product_price` FROM `products` ORDER BY `product_price` DESC LIMIT 3,1 ;

-- case
SELECT product_name, `product_price`,
CASE  
	WHEN `product_price` <= 20 THEN 'Price in peoples capability.'
	WHEN `product_price` >= 20 THEN 'Price is high.'
	ELSE 'Price is out of peoples capability.'
END AS price_measurement FROM products;	

-- system date 
SELECT SYSDATE();

-- substring
SELECT SUBSTRING(Address, 1, CHARINDEX('(',Address)) FROM EmployeeInfo;
SELECT SUBSTRING(student_name, 1, 4) FROM `students`;

SELECT RIGHT(student_name,5) AS 'Last 5 Letters' FROM `students`;
SELECT SUBSTRING(`student_name`,-5) AS 'Last 5 Letters' FROM `students`;
SELECT MID(Address, 0, LOCATE('(',Address)) FROM EmployeeInfo;
