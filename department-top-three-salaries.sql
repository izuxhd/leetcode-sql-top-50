# Write your MySQL query statement below
with cte as (
select id, name, salary,departmentId,  dense_rank() over(Partition by  departmentId order by salary desc) as dens_rnk from Employee 
)

 select d.name  as Department,c.name  as Employee,c.salary as Salary   from cte c join Department d  on c.departmentId=d.id where c.dens_rnk <=3