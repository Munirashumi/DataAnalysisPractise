Create table emply(
emp_id int, emp_name varchar(50),
department varchar(50),
salary int);

insert into emply values
(1,"Amit","IT",60000),
(2,"Rohit","IT",75000),
(3,"Neha","IT",75000),
(4,"Priya","HR",50000),
(5,"Karan","HR",65000),
(6,"Simran","Finance",70000),
(7,"Ankit","Finance",70000),
(8,"Pooja","Finance",80000);

select * from emply;

-- ROW_NUMBER() FUNCTION:

select *, row_number() over (order by salary desc) as rn from emply;
select *, row_number() over (order by emp_id asc) as rn from emply;

-- PARTITION BY FUNCTION:

select *, row_number() over(partition by department order by salary desc) as rnp from emply;
select *, row_number() over(partition by department order by salary asc) as rnp from emply;
select emp_name,department,salary,
avg(salary) over(partition by department) as avg_salary from emply;
select emp_name,department,salary,
avg(salary) over(partition by department order by salary desc) as avg_salary from emply;

-- INTERVIEW QUESTION
-- Find highest paid salary from each department 
select * from(
select *, row_number() over(partition by department order by salary desc)
 as rnp from emply) as temp where rnp = 1;
 
 select * from(
select *, row_number() over(partition by department order by salary desc)
 as rnp from emply) as temp where rnp = 2;
 
 -- ROW_NUMBER FUNCTION:
 
 select emp_name, salary, row_number() over(order by salary desc) as salary_rank from emply;

 
 -- RANK() FUNCTION: SKIP THE RANK
 
 select *, rank() over(partition by department order by salary desc) as rank_no from emply;

 select emp_name, salary, rank() over(order by salary desc) as salary_rank from emply;
 
 -- DENSE_RANK() FUNCTION: DO NOT SKIP THE RANK
 
 select *, DENSE_rank() over(partition by department order by salary desc) as rank_no from emply;
 select emp_name, salary, dense_rank() over(order by salary desc) as salary_rank from emply;
 
 -- LAG() FUNCTION:
 
 select *, lag(salary) over(order by salary desc) as pre_emp_salary from emply;
 
 -- LEAD() FUNCTION:
 
 select *, lead(salary) over(order by salary desc) as next_emp_salary from emply;


## PRACTISE FROM CHATGPT

SELECT
emp_name,
department,
salary,
ROW_NUMBER() OVER (
ORDER BY salary desc) as rn_nmbr
 FROM emply;

SELECT
emp_name,
salary,
RANK() OVER(
ORDER BY salary desc) as salary_rank from emply;

SELECT
emp_name,
department,
salary,
RANK() OVER(
PARTITION BY department
ORDER BY salary desc) as salary_rank from emply;

SELECT
emp_name,
department,
salary,
RANK() OVER(
PARTITION BY department order by salary desc) as dept_rank from emply order by department,dept_rank;

SELECT
emp_name,
salary,
SUM(salary) over() as total_salary
FROM emply;

SELECT
emp_name,
salary,
SUM(salary) over(order by salary desc) as total_salary
FROM emply;

SELECT
emp_name,
department,
salary,
SUM(salary) over(order by salary desc) as total_salary
FROM emply order by department;

SELECT
emp_name,
department,
salary,
SUM(salary) over(order by salary desc) as total_salary
FROM emply order by department;

SELECT
emp_name,
department,
salary,
SUM(salary) over(order by salary desc) as total_salary
FROM emply order by department;

SELECT
emp_name,
department,
salary,
Sum(salary) over(Partition by department order by salary desc) as total_salary
FROM emply;

SELECT
emp_name,
department,
salary,
AVG(salary) over(Partition by department) as AVG_salary,
ROW_NUMBER() over (order by salary desc) as row_nmbr
FROM emply;


SELECT
emp_name,
department,
salary,
MIN(salary) over (
PARTITION BY department) AS MIN_DEPT_SALARY,
MAX(salary) over (
PARTITION BY department) AS MAX_DEPT_SALARY
FROM emply;

SELECT
emp_name,
department,
salary,
COUNT(*) OVER(
PARTITION BY department) AS DEPT_EMP_COUNT
FROM emply;

SELECT
emp_name,
department,
salary,
COUNT(*) OVER(
PARTITION BY department) AS DEPT_EMP_COUNT
FROM emply;

WITH ranked AS(
select emp_name,
department,
salary,
Rank() over(
partition by department order by salary desc) as Highest_Paid_Emp
from emply)
select * from ranked where Highest_paid_emp=1;

WITH ranked AS(
select emp_name,
department,
salary,
dense_Rank() over(
partition by department order by salary desc) as Highest_Paid_Emp
from emply)
select * from ranked where Highest_paid_emp=1;

WITH ranked AS(
select emp_name,
department,
salary,
Rank() over(
partition by department order by salary desc) as Sec_Highest_Sal
from emply)
select * from ranked where Sec_Highest_Sal =2;

WITH ranked AS(
select emp_name,
department,
salary,
Rank() over(
partition by department order by salary desc) as Top_Two_Sal
from emply)
select * from ranked where Top_Two_Sal <=2;

WITH ranked AS(
select emp_name,
department,
salary,
Dense_Rank() over(
partition by department order by salary desc) as Top_Two_Sal
from emply)
select * from ranked where Top_Two_Sal <=2 order by department, Top_Two_Sal;

SELECT
emp_name,
department,
salary,
LAG(salary) over(
order by emp_id) AS
Previous_Salary 
FROM emply;

SELECT
emp_name,
department,
salary,
LAG(salary) over(
order by emp_name) AS
Previous_Salary 
FROM emply;

SELECT
emp_name,
department,
salary,
LAG(salary) over(
order by emp_name) AS
Previous_Salary 
FROM emply;


SELECT
emp_name,
department,
salary,
LAG(salary) over(
order by emp_name) AS
Previous_Salary,
salary - LAG(salary) over(
order by emp_id) AS 
Salary_Difference
FROM emply;

SELECT
emp_name,
department,
salary,
Lead(salary) over(
order by emp_id) AS
Next_Emp_Salary 
FROM emply;

SELECT
emp_name,
department,
salary,
Lead(salary) over(
order by emp_id) AS
Next_Salary,
salary - Lead(salary) over(
order by emp_id) AS 
Salary_Difference
FROM emply;

SELECT
emp_id,
emp_name,
department,
salary,
LAG(salary,2) over ( order by emp_id)
AS pre_row,
LEAD(salary,2) over (order by emp_id)
AS Next_row
 FROM emply;
 
 SELECT
 emp_id,
 emp_name,
 salary,
 SUM(salary) OVER(
 ORDER BY emp_id ROWS BETWEEN UNBOUNDED PRECEDING
 AND CURRENT ROW) AS Running_total
 FROM emply;
 
 SELECT
 emp_id,
 emp_name,
 department,
 salary,
 SUM(salary) OVER( PARTITION BY department
 ORDER BY emp_id ROWS BETWEEN UNBOUNDED PRECEDING
 AND CURRENT ROW) AS Dept_Running_total
 FROM emply;
 
 SELECT
 emp_id,
 emp_name,
 salary,
 AVG(salary) over ( order by emp_id ROWS BETWEEN 1 PRECEDING
 AND CURRENT ROW) AS Moving_AVG
 FROM emply;
 
 SELECT
 emp_id,
 emp_name,
 salary,
 AVG(salary) over ( order by emp_id ROWS BETWEEN 2 PRECEDING
 AND CURRENT ROW) AS Moving_AVG
 FROM emply;
 
 SELECT
 emp_id,
 emp_name,
 salary,
 AVG(salary) OVER( ORDER BY emp_id ROWS BETWEEN CURRENT ROW
 AND 2 FOLLOWING)
 AS FORWARD_AVG
 FROM emply;
 
 SELECT
 emp_name,
 salary,
 NTILE(4) OVER (ORDER BY salary DESC, emp_id) AS
 Salary_Quartile
 FROM emply;

 SELECT
 emp_name,
 salary,
 NTILE(3) OVER (ORDER BY salary DESC, emp_id) AS
 Salary_Triple
 FROM emply;
 
 SELECT
 emp_name,
 salary,
 NTILE(2) OVER (ORDER BY salary DESC, emp_id) AS
 Salary_Double
 FROM emply;
 
 SELECT 
 emp_name,
 salary,
 ROUND(PERCENT_RANK() OVER(
 ORDER BY salary),2) AS
 Percent_Rnk FROM emply ORDER BY Percent_Rnk;


 SELECT
 emp_name,
 salary,
 ROUND( CUME_DIST() OVER (
 ORDER BY salary),2) AS Cumulitive_Distribution
 FROM emply;
 
 SELECT
 emp_name,
 salary,
 ROUND( CUME_DIST() OVER (
 ORDER BY salary),2) AS Cumulitive_Distribution
 FROM emply ORDER BY salary;
 
 SELECT
 emp_name,
 department,
 salary,
 FIRST_VALUE(salary) OVER(
 PARTITION BY department ORDER BY salary ASC, emp_id) AS
 Lowest_Salary FROM emply;
 
 SELECT
 emp_name,
 department,
 salary,
 FIRST_VALUE(salary) OVER(
 PARTITION BY department ORDER BY salary DESC, emp_id) AS
 Highest_Salary FROM emply;
 
 SELECT
 emp_name,
 department,
 salary,
 LAST_VALUE(salary) OVER(
 PARTITION BY department ORDER BY salary ASC, emp_id) AS
 Lowest_Salary FROM emply;
 
 SELECT
 emp_name,
 department,
 salary,
 lAST_VALUE(salary) OVER(
 PARTITION BY department ORDER BY salary DESC, emp_id) AS
 Highest_Salary FROM emply;
 
 ##-- 2ND HISGEST SALARY USING NTH_VALUE() & DENSE_RANK()
 
 SELECT
 emp_name,
 salary,
 NTH_VALUE(salary,2) OVER(
 ORDER BY salary ASC,emp_id ROWS BETWEEN UNBOUNDED PRECEDING
 AND UNBOUNDED FOLLOWING) AS Sec_Salary FROM emply;
 
 WITH ranked AS (SELECT
 emp_name,
 salary,
 DENSE_RANK() OVER(ORDER BY salary ASC, emp_id 
 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
 AS Sec_Dist_Salary FROM emply)
( SELECT * FROM ranked Where Sec_Dist_Salary = 2);

SELECT
emp_name,
salary,
department,
ROUND(
AVG(salary) OVER (PARTITION BY department ORDER BY salary DESC, emp_id),2)
AS Dept_Avg_Salary,
salary - AVG(salary) OVER(PARTITION BY department ORDER BY salary DESC,emp_id) 
AS Difference_From_Avg FROM emply;

SELECT
emp_name,
salary,
department,
ROUND(
AVG(salary) OVER (PARTITION BY department),2)
AS Dept_Avg_Salary,
salary - AVG(salary) OVER(PARTITION BY department) 
AS Difference_From_Avg FROM emply;


WITH Salary_Analysis AS ( SELECT
emp_name,
department,
salary,
AVG(salary) OVER (PARTITION BY department) AS 
AVG_Salary FROM emply)

SELECT
emp_name,
department,
salary,
ROUND(AVG_salary,2) AS AVG_Salary,
CASE
WHEN salary > Avg_Salary THEN 'ABOVE AVERAGE'
WHEN salary < Avg_Salary THEN 'BELOW AVERAGE'
ELSE 'AVERAGE'
END AS Salary_Category FROM Salary_Analysis;


WITH Salary_Analysis AS ( SELECT
emp_name,
department,
salary,
AVG(salary) OVER (PARTITION BY department) AS 
AVG_Salary FROM emply)

SELECT
emp_name,
department,
salary,
ROUND(AVG_salary,2) AS AVG_Salary,
CASE
WHEN salary > Avg_Salary THEN 'ABOVE AVERAGE'
WHEN salary < Avg_Salary THEN 'BELOW AVERAGE'
ELSE 'AVERAGE'
END AS Salary_Category FROM Salary_Analysis;

SELECT
emp_name,
department,
salary,
Dense_RANK() OVER(PARTITION BY department ORDER BY salary DESC) 
AS Salary_Rnk,
SUM(salary) OVER( PARTITION BY department ORDER BY salary DESC)
AS Dept_Total,
AVG(salary) OVER ( PARTITION BY department ORDER BY salary DESC)
AS Dept_AVG
FROM emply;

WITH Ranked AS (SELECT
emp_id, 
emp_name,
department,
salary,
ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC ,emp_id)
AS rn FROM emply)
SELECT * FROM Ranked 
WHERE rn <= 2;

WITH Ranked AS (SELECT
emp_id, 
emp_name,
department,
salary,
ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC ,emp_id)
AS TOP_TWO FROM emply)
SELECT * FROM Ranked 
WHERE TOP_TWO <= 2;

SELECT 
emp_name,
department,
salary,
Rank() Over w as salary_rank,
avg(salary) over (partition by department) as dept_avg,
sum(salary) over (partition by department order by emp_id 
rows between unbounded preceding and current row) as running_total
from emply 
window w as (partition by department order by salary desc);

