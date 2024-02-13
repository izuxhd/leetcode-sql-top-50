SELECT max(salary) AS SecondHighestSalary
FROM Employee 
WHERE Salary < (SELECT max(salary) FROM Employee)

with cte as (
    select * 
    , dense_rank() over (order by salary desc) as salary_rank
from employee
)
select max(salary) as SecondHighestSalary
from cte 
where salary_rank=2

