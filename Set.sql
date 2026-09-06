use classicmodels;

select* from employees;
select*from orders;
select * from customers;

-- Which customer numbers appear in both CUSTOMERS and ORDERS?
(select customernumber from customers) intersect (select customernumber from orders);

-- Which customer numbers are in CUSTOMERS but have never placed an order?
(select customernumber from customers) except (select customernumber from orders);