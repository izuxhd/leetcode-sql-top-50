# Write your MySQL query statement below
with cte as(
select  id ,num, lead(num,1) over() as  next,lead(num,2) over() next2next  from Logs 
)
select  distinct num as ConsecutiveNums from cte where num =next and  num=next2next