use pitt;
use emply;

select 
emp_name,
salary from emply where salary >( select avg(salary) from emply);


select
emp_name,
salary from emply where salary >(select avg(salary) from emply);

select
emp_name,salary from emply where salary = (select max(salary) from emply);

select
emp_name,salary from emply where salary = (select min(salary) from emply);

select
emp_name,
salary
from emply where salary =( select salary from emply where emp_name = 'Rohit');

select emp_name, department
from emply where department = (select department from emply where emp_name = 'Priya');

select
emp_name,
department,
salary from emply where department in
(select department from emply where salary > 75000);

select
emp_name,
salary from emply where salary > any (select salary from emply where department = "HR");

SELECT emp_name, salary
FROM emply
WHERE salary > ANY (
    SELECT salary
    FROM emply
    WHERE department = 'HR'
);

select
emp_name,
department from emply where salary > all (select salary from emply where department ="HR");

SELECT e.emp_name, e.department, e.salary
FROM emply e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM emply e2
    WHERE e2.department = e.department
);

select 
e.emp_name, e.department,e.salary from emply e
where e.salary <
 (select avg(e2.salary) from emply e2 where e2.department = e.department);
 
 select distinct department
 from emply where salary > ( select avg(salary) from emply );
 
 select
 emp_name,
 department,
 salary from emply where department in 
 (select department from emply group by department having avg(salary) > 70000);
 
 select
 e.emp_name,
 e.department,
 e.salary from emply e where exists ( select 1 from emply e2 
 where e2.department = e.department and e2.salary > 75000);
 
 select
 e.emp_name,
 e.department,
 e.salary from emply e where not exists ( select 1 from emply e2 
 where e2.department = e.department and e2.salary > 75000);
 
 select max(salary) as Second_Highest_Sal from emply
  where salary < (select max(salary) from emply);
  
  select
  emp_name,
  department,
  salary from emply where salary = (select max(salary) from emply
  where salary < (select max(salary) from emply));
  
  select
  max(salary) as third_highest_sal
  from emply where salary <(select max(salary) from emply where salary
  < (select max(salary) from emply));
  
  select
  emp_name,
  salary,
  department,(select avg(salary) from emply) as company_avg_sal
  from emply;
  
  select count(*) as emp_above_dept from emply e where salary  >
  ( select avg(salary) from emply e2 where e2.department = e.department);
  
 


