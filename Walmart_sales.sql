USE samson;
CREATE TABLE walmart_sale(
invoice_id VARCHAR(20) NOT NULL PRIMARY KEY,
branch VARCHAR(5) NOT NULL,
city VARCHAR(30) NOT NULL,
gender VARCHAR(10) NOT NULL,
product_line VARCHAR (100) NOT NULL,
unit_price DECIMAL (10, 2) NOT NULL, 
quantity INT NOT NULL,
VAT FLOAT (6,4) NOT NULL,
total DECIMAL (12,4) NOT NULL,
date DATETIME NOT NULL, 
time TIME NOT NULL,
payment_method VARCHAR(15) NOT NULL, 
cogs DECIMAL(10,2) NOT NULL, 
gross_margin_percentage FLOAT (11,2) NOT NULL,  
gross_income FLOAT(10,2) NOT NULL,
ratings FLOAT (2,1) NOT NULL 
);

DROP TABLE walmart_sale;


CREATE TABLE walmart_sale(
invoice_id VARCHAR(20) NOT NULL PRIMARY KEY,
branch VARCHAR(5) NOT NULL,
city VARCHAR(30) NOT NULL,
customer_type VARCHAR(30) NOT NULL,
gender VARCHAR(10) NOT NULL,
product_line VARCHAR (100) NOT NULL,
unit_price DECIMAL (10, 2) NOT NULL, 
quantity INT NOT NULL,
VAT FLOAT (6,4) NOT NULL,
total DECIMAL (12,4) NOT NULL,
date DATETIME NOT NULL, 
time TIME NOT NULL,
payment_method VARCHAR(15) NOT NULL, 
cogs DECIMAL(10,2) NOT NULL, 
gross_margin_percentage FLOAT (11,2) NOT NULL,  
gross_income FLOAT(10,2) NOT NULL,
ratings FLOAT (2,1) NOT NULL 
);

-- FEATURE ENGINEERIN ----

-- FIRST WE WIL CREATE A NEW COLUMN KNOWN AS TIME IN OUR TABLE-- 

SELECT 
	time 
    FROM walmart_sale;

SELECT 
	time,
    (CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "MORNING"
		WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "AFTERNOON"
		ELSE "EVENING"
     END
     ) AS time_of_date 
    FROM walmart_sale;
    
    ALTER TABLE walmart_sale ADD column time_of_day VARCHAR(20);
    
UPDATE walmart_sale
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "MORNING"
		WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "AFTERNOON"
	ELSE "EVENING"
END
	);
    -- -- ##
    
-- Now we will create a new column called day_name this will help us know which is day when most of the sales and transaction are made..----


SELECT                  
	date,
		DAYNAME(date)
FROM walmart_sale;


ALTER TABLE walmart_sale ADD COLUMN day_name VARCHAR(20);

UPDATE walmart_sale
	SET day_name = (
    DAYNAME(date)
    );
    
    -- ----
    
    -- Now we will create a new column as month_name..
    
    SELECT 
	  date,
		MONTHNAME(date)
FROM walmart_sale;	

ALTER TABLE walmart_sale ADD COLUMN month_name VARCHAR(20);

UPDATE walmart_sale
	SET month_name = (
		MONTHNAME(date)
    );
    
-- EDA -- ANSWER BUSINESS REQUIREMENTS QUESTION;
-- Q. HOW MANY UNIQUE CITY DOES THE DATA HAVE??

SELECT 
	DISTINCT CITY
FROM walmart_sale;

-- Q. IN WHCH CITY IS EACH BRANCH??

SELECT 
	DISTINCT BRANCH 
FROM walmart_sale;   -- no. of unique branch#

SELECT 
	DISTINCT CITY , BRANCH 
FROM walmart_sale;

-- Q.how many unique product line does the data have?

SELECT 
	DISTINCT product_line 
FROM walmart_sale;

-- Q. which is the most common payment method used??

SELECT 
		DISTINCT payment_method
FROM walmart_sale;

SELECT 
	COUNT(payment_method)
FROM walmart_sale;

SELECT 
	DISTINCT payment_method,
		COUNT(payment_method)
FROM walmart_sale
GROUP BY payment_method;

Select * from walmart_sale;
 