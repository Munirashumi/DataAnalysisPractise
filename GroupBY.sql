use piit;
use emply;
select
department,sum(salary) as total_salary from emply group by department;
 
 select
 department, count(*) as count_employee from emply group by department;
 
 select 
 department, avg(salary) as total_salary from emply group by department;
 
 select 
 department, round(avg(salary),2)as total_salary from emply group by department;
 
 select
 department,max(salary) as highest_salary from emply group by department;
 
  select
  department,min(salary) as lowest_salary from emply group by department;
  
  
  select
  department,
  sum(salary) as total_salary,
  round(avg(salary),2) as avg_salary,
  max(salary) as highest_salary,
  min(salary) as lowest_salary
  from emply group by department;
  
  select
  department,
  sum(salary) as total_salary 
  from emply where salary > 60000 group by department;
  
  select
  department,
  count(*) as count_employee from emply
  where salary >= 70000 group by department;
  
  select
  department,
  round(avg(salary),2) as avg_salary from emply
  where salary >= 70000 group by department;
  
   select
  department,
  avg(salary) as avg_salary from emply
  where salary >= 70000 group by department;
  
  select 
  department,
  sum(salary) as highest_salary,
  sum(salary) as lowest_salary from emply group by department;
  
  select 
  department,
  sum(salary) as total_salary from emply group by department order by total_salary desc;
  
  -- GROUP BY WITH HAVING (Having filters groups after agreegation)
  
  select
  department,
  count(*) as count_det_emp from emply
  group by department having count(*) > 2;
  
  select
  department,
  sum(salary) as total_salary from emply
  group by department having sum(salary) >= 150000;
  
  select
  department,
  sum(salary) as total_salary from emply
  where salary >= 150000 
  group by department;
  
  select
  department,
  avg(salary) as total_salary from emply 
  group by department having avg(salary) > 70000;
  
   select
  department,
  round(avg(salary),3) as total_salary from emply 
  group by department having avg(salary) > 70000;
  
  