use piit;
select * from emply;

-- PART -1 BASIC STRING FUNCTIONS
-- CONVERT EMPLOYEE NAMES INTO UPPERCASE
select
emp_name,
upper(emp_name) as upper_name
from emply;

-- ALTERNATIVE
select 
emp_name,
ucase(emp_name) as upper_name
from emply;

-- CONVERT EMPLOYEE NAME INTO LOWERCASE
select
emp_name,
lower(emp_name) as lower_name
from emply;

-- ALTERNATIVE
select
emp_name,
lcase(emp_name) as lower_name
from emply;

-- FIND THE LENGTH OF EACH EMPLOYEES NAME 
select
emp_name,
length(emp_name) as name_length
from emply;

-- ALTERNATIVE
select
emp_name,
char_length(emp_name) as name_length
from emply;

-- EXTRACT THE FIRST 3 CHARACTERS OF EMPLOYEE NAMES
-- LEFT()
select
emp_name,
left(emp_name,3) as first_three
from emply;
 -- SUBTRING()
 select
 emp_name,
 substring(emp_name,1,3) as first_three
 from emply;
 
-- EXTRACT THE LAST 3 CHARACTERS OF EMPLOYEE NAMES
-- RIGHT()
select
emp_name,
right(emp_name,3) as last_three
from emply;

-- ALTERNATIVE
select
emp_name,
substring(emp_name,-3) as last_three
from emply;

-- EXTRACT CHARACTERS FROM THE MIDDLE OF EMPLOYEE NAMES
select
emp_name,
substring(emp_name,2,3) as middle_name
from emply;

-- COMBINE EMPLOYEE NAMES AND DEPARTMENT
select
emp_name,
department,
concat(emp_name,'-',department) as employee_details
from emply;

-- ALTERNATIVE
select
emp_name,
department,
concat_ws(emp_name,'-',department) as employee_details
from emply;

-- PART 2 INTERMEDIATE STRING FUNCTIONS
-- REMOVE SPACES FROM THE EMPLOYEE NAMES
-- 1 TRIM()
select
trim('  Amit  ') as clean_name
from emply;

-- LTRIM()
select
ltrim('  Amit') as clean_name
from emply;

-- RTRIM()
select
rtrim('Amit  ') as clean_name
from emply;
select * from emply;

-- REPLACE IT WITH INFORMATION TECHNOLOGY
select
emp_name,
department,
replace(department,'IT','Information Technology') as 
new_department from emply;

--  FIND THE POSITION OF A CHARACTER IN EMPLOYEE NAMES
select
emp_name,
locate('a', emp_name) as employee_position
from emply;

-- ALTERNATIVE
select
emp_name,
instr(emp_name,'a') as employee_position
from emply;

-- FIND EMPLOYEES WHOSE NAMES START WITH A 
select
emp_name from emply 
where emp_name like 'A%';

-- ALTERNATIVE
select emp_name from emply
where left(emp_name,1) = 'A';

-- FIND EMPLOYEES WHOSE NAMES END WITH A 
select
emp_name from emply 
where emp_name like '%A';

-- ALTERNATIVE
select emp_name from emply
where right(emp_name,1) = 'A';

-- FIND EMPLOYEES WHOSE NAMES CONTAIN THE LETTER A 
select
emp_name from emply 
where emp_name like '%A%';

-- FIND EMPLOYEES NAME WITH EXACTLY 4 CHARACTERS
select
emp_name from emply
where char_length(emp_name)=4;

select
emp_name from emply
where length(emp_name)=4;

-- FIND EMPLOYEESWHOSE NAMES CONTAINS AT LEAST 5 CHARACTERS
select
emp_name from emply
where char_length(emp_name) >=5;

-- ADVANCED STRING FUNCTION
-- REVERSE EMPLOYEE NAMES
select
emp_name,
reverse(emp_name) as reversed_name
from emply;

-- ADD LEADING ZERO TO EMPLOYEE IDS
select
emp_id,
lpad(emp_id,4,'0') as formatted_id
from emply;

select
emp_id,
lpad(emp_id,2,'0') as formatted_id
from emply;

-- ALTERNATIVE
select
emp_id,
concat('000',emp_id) as formatted_id
from emply;

select
emp_id,
concat('0',emp_id) as formatted_id
from emply;

-- ADD CHARACTERS TO THE RIGHT OF THE EMPLOYEE NAMES
select
emp_name,
rpad(emp_name,10,'*') as padded_name
from emply;

-- EXTRACT THE FIRST NAME FROM A FULL NAME
select
substring_index('Amit Neha',' ',1) as first_name
from emply;

select
substring_index('Amit Neha',' ',-1) as last_name
from emply;

-- COUNT THE OCCURANCES OF A LETTER IN EMPLOYEE NAMES
select
emp_name,
char_length(emp_name)-char_length(replace(emp_name,'a','')) as a_count
from emply;

-- FIND EMPLOYEES WHOSE NAMES CONTAIN TWO OR MORE OCCURANCES OF A 
select
emp_name from emply
where char_length(lower(emp_name))-
char_length(replace(lower(emp_name),'a','')) >=2;

-- FIND THE SECOND OCCURRENCE OF A CHARACTER
select
emp_name,
locate('a',emp_name,
locate('a',emp_name)+ 1) as sec_a_position
from emply;

-- EXTRACT TEXT BEFORE AND AFTER A DELIMITER
-- BEFORE THE FIRST HYPHEN
select
substring_index('Amit-IT-60000','-',1) as before_hyphen;

-- AFTER THE FIRST HYPHEN
select
substring('Amit-IT-60000',
locate('-','Amit-IT-60000')+1) as after_hyphen;

-- GET THE LAST PART
select
substring_index('Amit-IT-60000','-',-1) as last_part;

-- FIND EMPLOYEE NAMES USING REGULAR EXPRESSIONS
-- Find names starting with A & P
select
emp_name from emply
where emp_name regexp '^[AP]';

-- FIND A NAMES ENDING WITH A
select
emp_name from emply
where emp_name regexp 'A$';

select * from emply where emp_id regexp '[0-9]';

-- COMBINE CASE WHEN WITH SINGLE STRING
select
emp_name,
char_length(emp_name) as name_length,
case
when char_length(emp_name) <=4
then 'Short Name'
when char_length(emp_name) <=5
then 'Medium Name'
else 'Long Name'
end as name_category from emply;

-- PART-4: DATA CLEANING INTERVIEW QUESTIONS
-- REMOVE UNNECESSARY SPACES FROM EMPPLOYEE NAMES
select
emp_name,
trim(emp_name) as clean_name
from emply;

-- STANDARDIZE DEPARTMENT NAMES INTO UPPERCASE
select
department,
upper(trim(department)) as clean_dept
from emply;

-- FIND DUPLICATE EMPLOYEE NAMES
select
emp_name,
count(*) as duplicate_count
from emply group by emp_name having count(*) >1;

select
emp_name,
count(*) as duplicate_count
from emply where emp_name in (
select emp_name from emply 
group by emp_name having count(*) >1)
group by emp_name;

-- FIND EMPLOYEE NAMES WITH SPECIAL CHARACTERS
select
emp_name from emply
where emp_name regexp '[A-Za-z]';

-- CHECK WEATHER EMPLOYEE NAMES ARE BLANK
select *
from emply where emp_name is null or
trim(emp_name) = '';

-- PART 5-STRING FUNCTIONS COMBINED WITH OTHER SQL CONCEPTS
-- FIND THE DEPARTMENT WITH THE LONGEST NAME
select
department,
char_length(department) as name_length
from emply order by name_length desc limit 1;

-- ALTERNATIVE USING SUBQUERY
select 
department 
from emply
where char_length(department) = (
select max(char_length(department))
from emply);

-- COUNT EMPLOYEES BY THE FIRST LETTER OF THEIR NAMES
select
left(emp_name,1) as first_letter,
count(*) as total_employees
from emply 
group by left(emp_name,1)
order by first_letter;

-- FIND DEPARTMENT AND THEIR COMBINED EMPLOYEE DETAILS
select
department,
group_concat(emp_name order by emp_name separator ',') as employees
from emply
group by department;

-- FIND EMPLOYEES WHOSE NAMES HAVE THE SAME FIRST AND LAST CHARACTER
select
emp_name
from emply
where lower(left(emp_name,1))=
lower(right(emp_name,1));