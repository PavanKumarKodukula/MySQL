use classicmodels;
select * from customers;
select * from orders;

-- get the customer details who placed an order (using subquery)
select * from customers where customernumber in (select customernumber from orders);

create view order_based_customer_details as select * from customers where customernumber in (select customernumber from orders);

select * from order_based_customer_details;

use school;

select * from students;

desc students;

CREATE OR REPLACE VIEW student_details AS  SELECT stdid, name, class FROM students;

select * from student_details;

desc student_details;

insert into student_details(stdid,name,class) values(111,"pavani",7);