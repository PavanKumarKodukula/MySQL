create database bank;

use bank;

create table accounts(acc_no int primary key, name varchar(40),amount bigint);

insert into accounts(acc_no,name,amount) values(101,"srinu",100000),(102,"pavan",20000),(103,"kalyan",300200);

desc accounts;

select * from accounts;

alter table accounts modify column name varchar(40) not null, modify column amount bigint not null;

update accounts set amount = amount-2000
where acc_no=101;

update accounts set amount = amount+2000
where acc_no=103;

begin;
update accounts set amount = amount-2000
where acc_no=101;

update accounts set amount = amount+2000
where acc_no=105;

commit;
rollback;

begin;
update accounts set amount = amount-1000
where acc_no=103;

update accounts set amount = amount+1000
where acc_no=101;

savepoint sp1;

update accounts set amount = amount-1000000000
where acc_no=103;

update accounts set amount = amount+1000
where acc_no=102;

rollback to sp1;