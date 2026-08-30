use school;

insert into students(name,gender,class,age,date_of_birth) values
("krishna","male",4,19,'2009-08-08'),
("krish","male",5,10,'2008-08-08'),
("ram","male",6,11,'2007-08-08'),
("lakshman","male",7,12,'2006-08-08'),
("shiva","male",8,13,'2005-08-08'),
("durga","female",9,14,'2004-08-10');

select stdid,name from students where class=6;

create table students_backup as select * from students;
CREATE TABLE STUDENTS_INFO AS SELECT STDID,NAME,CLASS FROM STUDENTS;
CREATE TABLE CLASS_6 AS SELECT STDID,NAME FROM STUDENTS WHERE CLASS=6;
CREATE TABLE CLASS_7 AS SELECT STDID,NAME FROM STUDENTS WHERE CLASS=7;
CREATE TABLE STUDENTS1 AS SELECT * FROM STUDENTS WHERE 1=0; 
CREATE TABLE STUDENTS2 LIKE STUDENTS; 


SELECT * FROM STUDENTS2;

