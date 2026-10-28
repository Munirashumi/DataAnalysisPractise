use piit;

-- PATTERN
SELECT...
FROM(SELECT...
FROM) AS X

select * FROM (
    SELECT
        emp_name,
        salary,
        AVG(salary) OVER () AS avg_sal
    FROM emply
) AS x;

select * from (select emp_name,salary,avg(salary) over() as avg_sal
from emply) as x where salary > avg_sal;

select * from(select emp_name,salary,round(avg(salary) over(),2) as avg_sal
from emply) as x where salary > avg_sal;

select * from(select emp_name,salary,avg(salary) over() as avg_sal
from emply) as x where salary < avg_sal;

select
x.emp_name, x.salary from (select emp_name,salary,avg(salary)
over (order by salary desc) as avg_salary from emply) as x;

select x.emp_name, x.salary from (select emp_name,salary,avg(salary)
over (order by salary desc) as avg_salary from emply) as x where salary >= avg_salary;

select
emp_name,
salary from(select emp_name,salary,avg(salary) over() as avg_sal
from emply) as x where salary = avg_sal;

select avg(salary) from emply;
select * from emply;

select
emp_name,
salary,
department
from(select emp_name,salary,department,avg(salary) over(partition by department)
as dept_avg_sal from emply) as x where salary > dept_avg_sal;

select
emp_name,
department,
salary from(select emp_name,department,salary,rank() over(partition by department 
order by salary desc)
as salary_rank from emply) as x where salary_rank =1;

select
emp_name,
department,
salary from(select emp_name,department,salary,dense_rank() over(partition by department 
order by salary desc)
as salary_rank from emply) as x where salary_rank = 2;

select
emp_name,
department,
salary from( select emp_name,department,salary,row_number() over(
partition by department order by salary desc, emp_id) as ranked
from emply) as x where ranked <=2;

select
emp_name,
department,salary,dept_avg,salary-dept_avg as Difference from(
select emp_name,department,salary,avg(salary) over(partition by department) as dept_avg
from emply) as x where salary -dept_avg;

select
emp_name,
department,
salary,avg_salary,salary-avg_salary as Difference from(
select emp_name,department,salary,avg(salary) over() as avg_salary from emply)
as x;