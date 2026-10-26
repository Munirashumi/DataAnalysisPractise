use college;
create table course(
id int primary key,
name varchar(50));

insert into course values
(101,"English"),
(102,"IT");

update course set id = 103 where id =102;
select * from course;

create table teacher (
id int primary key,
name varchar(50),
course_id int, foreign key (course_id) references course(id)
On delete cascade
on update cascade);

drop table teacher;

insert into teacher values
(101,"Adam",101),
(102,"Eve",102);

select * from teacher;

use pupil;
select * from pupil;

alter table pupil
add column age int not null default 19;

alter table pupil
modify column age varchar(2);

alter table pupil
change column age pupil_age int;

alter table pupil
drop column pupil_age;

alter table student 
rename to pupil;