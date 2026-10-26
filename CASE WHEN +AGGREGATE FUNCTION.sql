use piit;
use emply;

SELECT
emp_name,
salary,
CASE WHEN salary >=75000 THEN 'HIGH'
WHEN salary >= 60000 THEN 'LOW'
ELSE 'LOW'
END AS Salary_Category
FROM emply;

SELECT
sum(CASE WHEN salary >=75000 THEN 1 ELSE 0 END) AS Highest_Salary,
sum(CASE WHEN salary < 60000 THEN 1 ELSE 0 END) AS Lowest_Salary
FROM emply;

SELECT
round(avg(salary),1) as avg_salary from emply;

select
department,
count(*) as count_emp from emply group by department;

select
department,
sum(CASE WHEN salary >=75000 THEN "HIGH" ELSE "LOW" END) AS High_Sal
from emply group by department;

select
department,
sum(CASE WHEN salary >=75000 THEN 1 ELSE 0 END) AS High_Sal
from emply group by department;

select
department,
sum(salary) as total_salary from emply group by department;

select
department,
sum(CASE WHEN salary >=75000 THEN 1 ELSE 0 END) AS HIGH_SAL,
sum(CASE WHEN salary >= 60000 AND salary < 75000 THEN 1 ELSE 0 END) AS MID_SAL
FROM emply GROUP BY department;

select
department,
sum(CASE WHEN salary >=75000 THEN 1 ELSE 0 END) AS HIGH_SAL,
sum(CASE WHEN salary >= 60000 AND salary < 75000 THEN 1 ELSE 0 END) AS MID_SAL,
sum(CASE WHEN salary <60000 THEN 1 ELSE 0 END) AS LOW_SAL
FROM emply GROUP BY department;

select
department,
avg(salary) from emply where salary > 70000 group by department;

select
department,
avg(salary) from emply group by department having avg(salary) >70000;

SELECT
department,
count(*) AS total_emp,
sum(CASE WHEN salary >=75000 THEN 1 ELSE 0 END) AS high_salary,
round(100.0*sum(CASE WHEN salary >=75000 THEN 1 ELSE 0 END)/count(*),2) AS percentage_salary
FROM emply GROUP BY department;

SELECT 
    department,
    COUNT(*) AS total_emp,
    SUM(CASE
        WHEN salary >= 75000 THEN 1
        ELSE 0
    END) AS high_salary,
    SUM(CASE
        WHEN salary < 60000 THEN 1
        ELSE 0
    END) AS low_salary,
    ROUND(100.0 * SUM(CASE
                WHEN salary >= 75000 THEN 1
                ELSE 0
            END) / COUNT(*),
            2) AS percentage_salary
FROM
    emply
GROUP BY department;


SELECT 
    department,
    COUNT(*) AS total_emp,
    SUM(CASE
        WHEN salary >= 75000 THEN 1
        ELSE 0
    END) AS high_salary,
    SUM(CASE
        WHEN salary < 60000 THEN 1
        ELSE 0
    END) AS low_salary,
    ROUND(100.0 * SUM(CASE
                WHEN salary >= 75000 THEN 1
                ELSE 0
            END) / COUNT(*),
            2) AS high_percentage_sal,
            round(100.0 * sum(CASE WHEN salary <60000 THEN 1 ELSE 0 END)
            /count(*),2) AS low_percentage_sal
FROM
    emply
GROUP BY department;


select
department,
max(salary) as highest_salary from emply group by department;

