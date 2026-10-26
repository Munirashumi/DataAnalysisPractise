
create table course2(
stu_id int primary key,
course varchar(50));

alter table course2 modify course varchar(50);
alter table course2 change name course varchar(50);
alter table course2 change id stu_id int;
select * from course2;
insert into course2 values
(102,"English"),
(105,"math"),
(103,"science"),
(107,"computer science");
select * from course2;

create table stu(
stu_id int primary key,
name varchar(50));
insert into stu values(101,"adam"),
(102,"bob"),
(103,"casey");
select * from stu;
select * from course2;

select * from stu inner join course2 on stu.stu_id = course2.stu_id;
select * from stu as s inner join course2 as c on s.stu_id = c.stu_id;
select * from stu as a left join course2 as b on a.stu_id = b.stu_id;
select * from stu as s right join course2 as c on s.stu_id = c.stu_id;
select * from stu as a right join course2 as b on a.stu_id = b.stu_id
union select * from stu as a left join course2 as b on a.stu_id = b.stu_id;
select * from stu as a left join course2 as b on a.stu_id = b.stu_id where b.stu_id is null;
select * from stu as a right join course2 as b on a.stu_id = b.stu_id where a.stu_id is null;
create table EMP(id int primary key, name varchar(50),manager_id int);
insert into EMP(id,name,manager_id) values (101,"adam",103),
										    (102,"bob",104),
                                            (103,"casey", null),
                                            (104,"donald",103);
                                            
select * from EMP;
select * from EMP as A 
join EMP as B 
on A.id = B.manager_id;
		
select A.name, B.name as manager_name
from EMP as A 
join EMP as B 
on A.id = B.manager_id;

select name from EMP 
union
select name from EMP;

select name from EMP 
union all
select name from EMP;

select stu_id from course2
union
select stu_id from stu;

select stu_id from course2
union all
select stu_id from stu;

create table pupil (
rollno int primary key,name varchar(50),marks int not null ,grade varchar(1),city varchar(20)
);
INSERT INTO pupil
(rollno, name, marks, grade, city)
VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85,
"B", "Mumbai"),
(104, "dhruv", 96, "A",
"Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delha");

select * from pupil;

select avg(marks) from pupil;
select name, marks from pupil where marks > 86.8000;

select name, marks from pupil where marks > (select avg(marks) from pupil);

select rollno from pupil where rollno %2=0;
select name from pupil where rollno in (102,104,106);

select name, rollno from pupil where rollno in (select rollno from pupil where rollno %2=0);

select * from pupil where city="delhi";
select max(marks) from pupil where city =" delhi";
select max(marks) from (select * from pupil where city="delhi") as temp;

create view view1 as 
select rollno,name,marks from pupil;
select * from view1;
select * from view1 where marks > 90;
drop view view1;
select * from view1;