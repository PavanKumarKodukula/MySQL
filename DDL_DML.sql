use school;
desc students;
insert into students values(101,"ravi","male",6,11,"2015-01-01");
insert into students (name,gender,class,age,date_of_birth) values("babu","male",7,12,"2014-01-01"),("pavan","male",15,10,"2004-08-10");

select * from students;

desc marks;
insert into marks values (102,100,100,100,100.00);
select * from marks;

alter table marks modify column percentage decimal(5,2);

-- Deduct 5 marks from Student 101 for Subject S1
select * from marks where stdid=101;
update marks set s1=s1-5 where stdid=101;
-- Deduct 5 marks from Student 101 for Subject S1 and S2
select * from marks where stdid=102;
update marks set s1=s1-5 , s2=s2-5 where stdid=102;

ALTER TABLE marks DROP COLUMN percentage;
ALTER TABLE marks ADD COLUMN percentage DECIMAL(5,2) GENERATED ALWAYS AS ((s1+s2+s3)/3);
alter table marks add column total_marks int generated always as (s1+s2+s3) after s3;
