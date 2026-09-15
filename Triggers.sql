use bank;
select * from accounts;

create table transactions(
id int auto_increment primary key,
account int,
type enum('debit','credit'),
amount int,
created_at timestamp default current_timestamp);

-- create triggeer after transaction trigger
delimiter //
create trigger after_transaction_trigger
after update
on accounts
for each row
begin
insert into transactions(account,type,amount)
values(old.acc_no,if(old.amount>new.amount,"debit","credit"),abs(old.amount-new.amount));
end //
delimiter ;

select * from accounts;

-- now debit 200000 from 103 acount
update accounts set amount = amount-200000 where acc_no = 103;

update accounts set amount = amount+200000 where acc_no=101;

select * from transactions;