use classicmodels;

-- What is the current date and time?
select now();

-- What is the current timestamp?
select current_timestamp();

-- What is the current date and time formatted as DD-MM-YYYY HH:MM:SS AM/PM?
SELECT DATE_FORMAT(NOW(), '%d-%m-%Y %h:%i:%s %p') as Now;

-- What is the age (in years) of someone born on 2004-08-10?
SELECT FLOOR(datediff(now(),'2004-08-10')/365) AS AGE;

SELECT * FROM ORDERS;

-- Which orders have a non-null comments field?
SELECT * FROM ORDERS WHERE COMMENTS IS NOT NULL;

-- Which orders were shipped after their required date?
SELECT * FROM ORDERS WHERE SHIPPEDDATE>REQUIREDDATE;

-- For each order, how many days did it take to ship (order date to shipped date), sorted highest first?
SELECT ORDERNUMBER, ORDERDATE, SHIPPEDDATE,datediff(SHIPPEDDATE,ORDERDATE) AS DAYS_TAKEN
FROM ORDERS ORDER BY DAYS_TAKEN DESC;

-- How many orders were shipped each year?
SELECT  YEAR(ORDERDATE),COUNT(*)  FROM ORDERS WHERE STATUS = "SHIPPED"
GROUP BY YEAR(ORDERDATE);