CREATE DATABASE tips_analysis;

use tips_analysis;

select * from tips;

desc tips;

alter table tips RENAME column sex to gender;

select * from tips where gender="male";
select * from tips where gender="female" and time="dinner";
select * from tips where size=2;
select * from tips where gender="male" and smoker="yes";
select * from tips where gender="female" and smoker="no";
select * from tips where gender="male" and time="dinner";
select * from tips where gender="female" order by total_bill desc;
select * from tips where gender="male" order by total_bill desc limit 5;
select * from tips where size =2 or size=3;
select * from tips where total_bill between 10 and 20;
select * from tips where size in (2,3,4);

-- SECOND HIGHEST TOTAL BILL RECORD
SELECT * FROM TIPS ORDER BY TOTAL_BILL DESC LIMIT 1 OFFSET 1;

SELECT COUNT(*) FROM TIPS WHERE GENDER = "MALE" AND SMOKER="YES";
SELECT SUM(TIP) FROM TIPS;
SELECT COUNT(*) FROM TIPS WHERE GENDER = "FEMALE" AND SMOKER="NO";
SELECT MIN(TOTAL_BILL),MAX(TOTAL_BILL) FROM TIPS;

SELECT GENDER,COUNT(*) FROM TIPS WHERE GENDER = "FEMALE" AND SMOKER="YES";

SELECT GENDER,COUNT(*) FROM TIPS WHERE GENDER = "FEMALE" AND SMOKER = "NO";

-- DAY 3

SELECT DISTINCT(DAY) FROM TIPS;
SELECT GENDER FROM TIPS GROUP BY GENDER;
SELECT DAY,COUNT(*)  FROM TIPS GROUP BY DAY;

-- What are the distinct gender values in the table?
SELECT DISTINCT(GENDER) FROM TIPS;
-- How many records have meal time as DINNER?
SELECT COUNT(TIME) FROM TIPS WHERE TIME='DINNER';
-- How many records are there for each gender?
SELECT GENDER,COUNT(*) FROM TIPS GROUP BY GENDER;
-- How many records are there for each smoker status?
SELECT SMOKER,COUNT(*) FROM TIPS GROUP BY SMOKER;
-- How many records per gender on Sundays?
SELECT GENDER,COUNT(*) FROM TIPS WHERE DAY='SUN' GROUP BY GENDER;
-- How many records per gender where table size is 2?
SELECT GENDER ,COUNT(*) FROM TIPS WHERE SIZE=2 GROUP BY GENDER ;
-- How many records exist for each table size, sorted by count (highest first)?
SELECT SIZE , COUNT(*) FROM  TIPS GROUP BY SIZE ORDER BY COUNT(*) DESC;
-- How many records per smoker status where table size is 2, 3 or 4?
SELECT SMOKER, COUNT(*) FROM TIPS WHERE SIZE IN (2,3,4) GROUP BY SMOKER;
-- How many records exist for each size-gender combination, sorted by size then count (highest first)?
SELECT SIZE,GENDER,COUNT(*) AS TOTAL_COUNT FROM TIPS GROUP BY SIZE,GENDER ORDER BY SIZE ASC,TOTAL_COUNT DESC;
-- What are the min and max total bill for each table size?
SELECT SIZE,MIN(TOTAL_BILL),MAX(TOTAL_BILL) FROM TIPS GROUP BY SIZE ORDER BY SIZE;
-- How many records per day for male customers, sorted by count (highest first)?
SELECT DAY,COUNT(*) FROM TIPS WHERE GENDER='MALE' GROUP BY DAY ORDER BY COUNT(*) DESC;
-- How many records exist for each table size, sorted by size?
SELECT SIZE,COUNT(*) FROM TIPS GROUP BY SIZE ORDER BY SIZE;
-- Which table sizes have more than 30 records, sorted by size?
SELECT SIZE,COUNT(*) FROM TIPS GROUP BY SIZE HAVING COUNT(*)>30 ORDER BY SIZE;
-- Which table sizes have more than 20 non-null gender records?
SELECT SIZE,COUNT(GENDER) FROM TIPS GROUP BY SIZE HAVING COUNT(GENDER)>20;
-- Which table sizes have a max-min total bill difference less than 30?
SELECT SIZE,MAX(TOTAL_BILL),MIN(TOTAL_BILL) FROM TIPS GROUP BY SIZE HAVING MAX(TOTAL_BILL) - MIN(TOTAL_BILL) < 30;