use school;
select * from students;

select * from students where class=8;

-- get the students data based on class

delimiter //
create procedure get_students_by_class(in class_number int)
begin
select * from students where class=class_number;
end //
delimiter ;

call get_students_by_class(10);

delimiter //
create procedure get_class_students_count(in class_number int,out total_count int)
begin
select count(*) into total_count from students where class=class_number;
end //
delimiter ;

-- define variable
set @count=0;

call get_class_students_count(10,@count);
select @count;

-- implement counter
delimiter //
CREATE PROCEDURE COUNTER(INOUT NUM INT)
BEGIN
SET NUM=NUM+1;
END //
DELIMITER ;

 -- INITIALIZE A COUNT VARIBLE WITH 0
SET @COUNT=0;
CALL COUNTER(@COUNT);
SELECT @COUNT;

-- 
delimiter //
create procedure store_value_in_b(in a int,inout b int)
begin
set b=a+b;
end //
DELIMITER ;

set @count=2;

call store_value_in_b(5,@count);
select @count;


-- 
DELIMITER //
CREATE PROCEDURE EVEN_OR_ODD(IN NUM INT)
BEGIN
IF NUM % 2 = 0 THEN
SELECT "EVEN";
ELSE
SELECT "ODD";
END IF;
END //
DELIMITER ;

CALL EVEN_OR_ODD(10);