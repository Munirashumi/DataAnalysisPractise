use piit;
select * from emply;
ALTER TABLE emply
ADD COLUMN hire_date DATE;

UPDATE emply
SET hire_date = CASE emp_id
    WHEN 1 THEN '2022-01-15'
    WHEN 2 THEN '2023-03-20'
    WHEN 3 THEN '2023-07-10'
    WHEN 4 THEN '2021-06-05'
    WHEN 5 THEN '2022-11-25'
    WHEN 6 THEN '2024-02-14'
    WHEN 7 THEN '2024-08-30'
    WHEN 8 THEN '2025-01-10'
END where emp_id BETWEEN 1 AND 8;

SELECT * FROM emply;
SET SQL_SAFE_UPDATES =0;

-- DISPLAY TODAY'S DATE

select curdate() as today;
select current_date() as today;

-- DISPLAY CURRENT DATE AND TIME

select now() as current_datetime;
select current_timestamp() as current_datetime;

-- EXTRACT YEAR,MONTH AND DAY

select
emp_name,
year(hire_date) as hire_year,
month(hire_date) as hire_month,
day(hire_date) as hire_day
from emply;

-- ALTERNATIVE
select
emp_name,
extract(year from hire_date) as hire_year,
extract(month from hire_date) as hire_month,
extract(day from hire_date) as hire_day
from emply;

-- DISPLAY MONTH & WEEKDAY NAMES

select
emp_name,
monthname(hire_date) as month_name,
dayname(hire_date) as weekday_name
from emply;

-- FIND EMPLOYEE HIRED IN 2023
-- METHOD 1
select
emp_name,
hire_date
from emply where hire_date >='2023-01-01'
			and hire_date <'2024-01-01';

-- METHOD 2
select
emp_name,
hire_date
from emply where year (hire_date)= 2023;

-- FIND EMPLYEES HIRED IN JANUARY
-- METHOD 1
select
emp_name,
hire_date
from emply where month (hire_date) = 1 ;

-- METHOD 2
select
emp_name,
hire_date
from emply where date_format(hire_date, '%m') ='01';

-- FIND EMPLOYEES HIRED BETWEEN 2022 AND 2023
-- METHOD 1
select
emp_name,
hire_date
from emply where hire_date between
'2022-01-01' and '2023-12-31';

-- METHOD 2
select
emp_name,
hire_date
from emply where hire_date >= '2022-01-01'
           and hire_date < '2024-01-01';
           
-- FIND EMPLOYEES HIRED AFTER  JANUARY 1, 2024
-- METHOD 1
select
emp_name,
hire_date
from emply where hire_date > '2024-01-01';

-- METHOD 2
select
emp_name,
hire_date
from emply where hire_date >= '2024-01-02';

-- FIND EMPLOYEES HIRED BEFORE 2023
select
emp_name,
hire_date
from emply where hire_date < '2023-01-01';

-- FIND EMPLOYEES HIRED IN THE LAST 365 DAYS
select
emp_name,
hire_date
from emply where datediff(curdate(),hire_date)
between 0 and 365;

select
emp_name,
hire_date
from emply where hire_date >= date_sub(curdate(),interval 365 day)
and hire_date <= curdate();

-- FIND EMPLOYEES HIRED IN THE CURRENT YEAR
select
emp_name,
hire_date
from emply where year(hire_date) = year(curdate());
select * from emply;

select
emp_name,
hire_date
from emply where hire_date >= makedate(year(curdate()),1)
and hire_date < makedate(year(curdate())+1,1);

-- FIND THE EMPLOYEES HIRED IN WEEKENDS
-- METHOD 1
select
emp_name,
hire_date 
from emply where dayofweek(hire_date) in (1,7);

-- ALTERNATIVE
select
emp_name,
hire_date
from emply where dayname(hire_date) in ('Saturday','Sunday');

-- DATE DIFFERENCE AND EXPERIENCE CALCULATIONS
-- CALCULATE DAYS OF EMPLOYMENT

select
emp_name
hire_date,
datediff(curdate(),hire_date) as days_employed
from emply;

-- ALTERNATIVE
select
emp_name,
hire_date,
to_days(curdate())- to_days(hire_date) as days_employed
from emply;

-- CALCULATE COMPLETED YEARS OF SERVICE

select
emp_name,
hire_date,
timestampdiff(year,hire_date,curdate()) as years_employed
from emply;

-- CALCULATE COMPLETED YEARS using MONTH & DAY

select
emp_name,
hire_date,
year(curdate())-year(hire_date)
-(
date_format(curdate(), '%m%d')
<date_format(hire_date, '%m%d')
) as years_employed from emply;


-- CALCULATE THE REMAINING DAYS UNTILL THE NEXT ANNIVERSARY

select
emp_name,
hire_date,
datediff(
date_add(hire_date,interval(
timestampdiff(year,hire_date,curdate())+1) year),curdate())
as days_untill_anniversary from emply;

-- FIND EMPLOYEES WHO WORK MORE THAN 2 YEARS
select
emp_name,
hire_date
from emply where timestampdiff(year,hire_date,curdate()) >2;

-- ALTERNATIVE
select
emp_name,
hire_date
from emply where hire_date <date_sub(curdate(),interval 2 year);

-- FIND THE NUMBER OF MONTHS EACH EMPLOYEE HAS WORKED
select
emp_name,
hire_date,
timestampdiff(month,hire_date,curdate()) as months_employed
from emply;

select
emp_name,
hire_date,
timestampdiff(day,hire_date,curdate()) as days_employed
from emply;

-- PART4(ADDITION,SUBTRACTION,AND FORMATTING)
-- CALCULATE A DATE 30 DAYS AFTER HIRING

select
emp_name,
hire_date,
date_add(hire_date,Interval 30 day) as day_after_30_days
from emply;

-- ALTERNATIVE
select
emp_name,
hire_date,
hire_date + Interval 30 day as date_after_30_days
from emply;

-- CALCULATE 6 MONTHS AFTER HIRING
select
emp_name,
hire_date,
date_add(hire_date,Interval 6 Month) as date_after_6_months
from emply;

select
emp_name,
hire_date,
hire_date + Interval 6 Month as date_after_6_months
from emply;

-- CALCULATE THREE MONTHS BEFORE HIRING
select
emp_name,
hire_date,
date_sub(hire_date,Interval 3 Month) as date_before_3_months
from emply;

-- ALternative
select
emp_name,
hire_date,
hire_date - Interval 3 Month as date_before_3_months
from emply;

-- FIND THE LAST DAY OF HIRING MONTH
select
emp_name,
hire_date,
last_day(hire_date) as month_end
from emply;

-- FORMATE THE DATE AS JANUARY 15,2022

select
emp_name,
date_format(hire_date,'%m,%d,%y') as formatted_date
from emply;

select
emp_name,
date_format(hire_date,'%d,%m,%y') as formatted_date
from emply;

-- CONVERT TEX INTO A DATE
select
str_to_date('2022-01-15','%y,%m,%d') as converted_date;

-- PART 5(GROUPING AND AGGREGATE DATA)
-- COUNT EMPLOYEES HIRED IN EACH YEAR
select
year(hire_date) as hire_year,
count(*) as total_employees
from emply
group by year(hire_date)
order by hire_year;

-- COUNT EMPLOYEES HIRED IN EACH MONTH
select
month(hire_date) as hire_month,
monthname(hire_date) as month_name,
count(*) as total_employee
from emply 
group by month(hire_date), monthname(hire_date)
order by hire_month;

-- COUNT HIRES BY YEAR AND MONTH
select
month(hire_date) as hire_month,
year(hire_date) as hire_year,
count(*) as total_employee 
from emply 
group by month(hire_date),year(hire_date)
order by hire_month,hire_year;

-- FIND THE DEPARTMENT WITH THE EARLIEST AVERAGE HIRING DATE
select
department,
avg(to_days(hire_date)) as avg_hire_day
from emply
group by department order by avg_hire_day limit 1;

-- FIND DEPARTMENTS WITH MORE THAN TWO EMPLOYEES HIRED BEFORE 2024
select
department,
count(*) as total_employee
from emply where hire_date < '2024-01-01' 
group by department having count(*) >2;

select * from emply;

-- PART 6- ADVANCED DATE INTERVIEW QUESTION
-- FIND THE LATEST HIRED EMPLOYEE IN EACH DEPARTMENT

select
emp_name,
department,
hire_date
from(select
emp_name,
department,
hire_date, row_number() over (
partition by department order by hire_date desc,emp_id desc) as latest_rnk
from emply) as x where latest_rnk =1;

-- ALTERNATIVE (Subquery with max)
select
e.emp_name,
e.department,
e.hire_date from emply e where e.hire_date = (
select max(e2.hire_date) from emply e2 where
e2.department = e.department);

-- RANK EMPLOYEES BY HIREING DATE
select
emp_name,
hire_date,
rank() over (order by hire_date asc) as hire_rnk
from emply;

-- FIND EMPLOYEES HIRED IN THE SAME YEAR AS AMIT
SELECT
emp_name,
hire_date
FROM emply WHERE YEAR(hire_date) = (
SELECT YEAR(hire_date) FROM emply 
WHERE emp_name = 'Amit');

-- ALTERNATIVE
select
e.emp_name,
e.hire_date from emply e join emply a 
on year(e.hire_date) = year(a.hire_date) where 
a.emp_name = 'Amit';

-- FIND THE QUARTERS IN WHICH EACH EMPLOYEE WAS HIRED
select
emp_name,
hire_date,
quarter(hire_date) as hire_quarter
from emply;

-- FIND THE EMPLOYEES HIRED IN Q1 OF 2024
select
emp_name,
hire_date
from emply where
hire_date >= '2024-01-01'
and hire_date <'2024-04-01';

-- ALTERNATIVE
SELECT
emp_name,
hire_date
from emply where year(hire_date) =2024
and quarter(hire_date) = 1;

-- FIND EMPLOYEES WITH MISSING HIRING DATES
select
emp_id,
emp_name,
hire_date
from emply where hire_date is null;

select
emp_id,
emp_name,
hire_date
from emply where hire_date is not null;

-- COUNT MISSING DATES
select
count(*) from emply where hire_date is null;

-- CATEGORIZE EMPLOYEES BY YEARS OF SERVICE USING CASE
SELECT 
    emp_name,
    hire_date,
    TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_employed,
    CASE
        WHEN hire_date IS NULL THEN 'Unknown'
        WHEN
            TIMESTAMPDIFF(YEAR,
                hire_date,
                CURDATE()) >= 5
        THEN
            'Senior'
        WHEN
            TIMESTAMPDIFF(YEAR,
                hire_date,
                CURDATE()) >= 2
        THEN
            'Experienced'
        ELSE 'New Employee'
    END AS employee_category
FROM
    emply;

