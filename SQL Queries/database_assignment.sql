-- --------------Istiak Ahmed , istiakahmed.cse@gmail.com --------------- --


-- 1. Create a database named database_assignment.

CREATE DATABASE database_assignment;

-- USE Database
USE database_assignment;


-- 2. create a table named customers.

CREATE TABLE customers (
id INT AUTO_INCREMENT PRIMARY KEY,
First_Name VARCHAR(15) NOT NULL,
Last_Name VARCHAR(15) NOT NULL,
Date_of_Birth DATE NOT NULL,
Phone VARCHAR(30),
Address VARCHAR(50),
City VARCHAR(30),
State VARCHAR(30),
Points INT NOT NULL
);



ALTER TABLE customers MODIFY COLUMN Phone VARCHAR(30);
TRUNCATE TABLE customers;




-- 3. INSERT the following customer DATA:

INSERT INTO `customers`(First_Name,Last_Name,Date_of_Birth,Phone,Address,City,State,Points) VALUES 
('Babara','MacCaffrey','1986-03-28','781-932-9754','0 Sage Terrace','Waltham','MA',2273),
('Ines','Brushfield','1986-04-13','804-427-9456','14187 Commercial Trail','Hampton','VA',947),
('Freddi','Boagey','1985-02-07','719-724-7869','251 Springs Junction','Colorado Springs','CO',2967),
('Ambur','Roseburgh','1974-04-14','407-231-8017','30 Arapahoe Terrace','Orlando','FL',457),
('Clemmie','Betchley','1973-11-07',NULL,'5 Spohn Circle','Arlington','TX',3675)
;

-- Show TABLE 
SELECT * FROM customers;


-- 4. Show only 2 members whose points are more than 1000.
SELECT * FROM customers WHERE Points > 1000 LIMIT 2;


-- 5. Find the customers whose age is in 1980 to 1990 or points less than 1000.
SELECT * FROM customers WHERE (Date_of_Birth BETWEEN '1980-01-01' AND '1990-12-31') OR Points < 1000 ;


-- 6. Order the customers by points in ascending and descending order.
SELECT * FROM `customers` ORDER BY `Points` ASC;
SELECT * FROM `customers` ORDER BY `Points` DESC;


-- 7. Find the customer whose name contains 'burgh' using like and regexp.
SELECT * FROM customers WHERE (First_Name LIKE '%burgh%') OR (Last_Name LIKE '%burgh%');
SELECT * FROM customers WHERE (First_Name REGEXP 'burgh') OR (Last_Name REGEXP 'burgh');


-- 8. Find the customer who does not have phone number.
SELECT * FROM customers WHERE Phone IS NULL ;


-- 9. Change the 'Date of Birth' column name into 'dob'.
ALTER TABLE customers CHANGE Date_of_Birth dob DATE;
ALTER TABLE customers CHANGE dob Date_of_Birth DATE;


-- 10. Find the max point holder customer.
SELECT Points AS "Max Point Holder", CONCAT(`First_Name`,' ', `Last_Name`) AS Customer_Name, id FROM customers WHERE Points = (SELECT MAX(Points) FROM customers);


/*
 11. Execute a query for the following scenario.
     If customers have points less than 1000, they are bronze member.
     If customers have points more than 1000 and less than 2000, they are silver member.
     If customers have points more than 2000 and less than 3000, they are gold member.
     If customers have points more than 3000, they are platinum member. */
   
SELECT CONCAT(`First_Name`,' ', `Last_Name`) AS Customer_Name, Points,
CASE 
	WHEN `Points` < 1000 THEN 'Bronze Member'
	WHEN `Points` > 1000 AND `Points` < 2000 THEN 'Silver Member'
	WHEN `Points` > 2000 AND `Points` < 3000 THEN 'Gold Member'
	WHEN `Points` > 3000 THEN 'Platinum Member' 
END AS Membership_Status FROM customers ORDER BY Points DESC;
