use college;
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
select distinct city from pupil;
select * from pupil where marks > 80;
select * from pupil where marks > 80 and city="delha";
select * from pupil where marks > 90 or city="delha";
select name from pupil where marks > 90 or city="delha";
select grade,name from pupil where marks > 90 or city="delha";
select * from pupil where marks between 80 and 90;
select * from pupil where city in ( "Mumbai","Delhi","Dhaka");
select * from pupil where city not in ( "Mumbai","Delhi","Dhaka");
select * from pupil limit 3;
select * from pupil where marks limit 5;
select name, rollno from pupil where marks limit 3;
select name, rollno from pupil where marks >75 limit 3;
select * from pupil where marks >75 limit 3;
select * from pupil order by city asc;
select * from pupil order by marks asc;
select name,city from pupil order by city asc;
select * from pupil order by marks desc;
select * from pupil order by marks desc limit 3;
select marks from pupil;
select max(marks) from pupil;
select avg(marks) from pupil where marks > 90;
select count(marks) from pupil where marks < 90;
select city from pupil group by city;
select city, count(name) from pupil group by city;
select city, marks, count(name) from pupil group by city,marks;
select city, marks, count(name),avg(grade),count(rollno) from pupil group by city,marks;
select avg(marks) from pupil order by city asc;
select avg(marks) from pupil order by city;
select city, avg(marks) from pupil group by city order by city;
select city, avg(marks) from pupil group by city order by avg(marks);
select city, avg(marks) from pupil group by city order by avg(marks) desc;
select grade from pupil group by grade order by grade;
select grade ,avg(marks) from pupil group by grade order by grade;
select grade ,count(name) from pupil group by grade order by grade;
select city from pupil group by city;
select city, count(rollno) from pupil group by city;
select city, count(rollno) from pupil group by city having max(marks)>90;
select city from pupil where grade="A" group by city;
select city from pupil where grade="A" group by city having max(marks)>93;
select city from pupil where grade="A" group by city having max(marks) >=93 order by city asc;
set sql_safe_updates=0;
update pupil set marks = 82 where rollno = 105;
update pupil set grade = "B" where marks between 80 and 90;
update pupil set marks = marks + 1;
update pupil set marks = 12 where rollno = 105;
delete from pupil where marks < 33;
select * from pupil;


