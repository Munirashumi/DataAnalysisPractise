use piit;
select * from emply;

-- Q(1): FIND THE HIGHEST SALARY

-- METHORD-(1): MAX() WITH SIMPLEST METHOD
SELECT
max(salary) from emply;

-- METHORD-(2): USING AS
SELECT
max(salary) AS Highest_salary from emply;

-- METHORD-(3):MAX() WITH A SUBQUERY:
select
emp_name,
department,
salary from emply where salary =(select max(salary) from emply);

-- METHORD-(4): SCALAR SUBQUERY IN THE SELECT LIST
select
emp_name,
department,
salary from emply where salary =(select max(salary) from emply);

-- METHORD-(5): ORDER BY + LIMIT
select
emp_name,
department,
salary from emply order by salary desc limit 1;

-- METHORD-(6): MAX() WITH CTE
with highest as(
select 
max(salary) as max_salary from emply)
select e.emp_name,e.department,e.salary from emply e
join highest h on e.salary = h.max_salary;

-- METHORD-(7):RANK() WINDOW FUNCTION
WITH ranked AS(
select 
emp_name,
department,
salary,rank() over (order by salary desc) as rnk from emply)
select emp_name, department,salary from ranked where rnk = 1;

-- METHORD-(8):DENSE_RANK() WINDOW FUNCTION

WITH ranked AS(
select 
emp_name,
department,
salary,dense_rank() over (order by salary desc) as rnk from emply)
select emp_name, department,salary from ranked where rnk = 1;

-- METHORD-(9): MAX() WITH WINDOW FUNCTION
select
emp_name,
department,
salary from (select emp_name,department,salary,max(salary) over() as highest_sal 
from emply) as x where salary = highest_sal;


-- METHORD-(10): NOT EXISTS
select
e1.emp_name,
e1.department,
e1.salary from emply e1
where not exists(select 1 from emply e2 where e2.salary > e1.salary);

-- METHORD-(11): ALL
select
emp_name,
department,
salary from emply where salary >= all(select salary from emply);

