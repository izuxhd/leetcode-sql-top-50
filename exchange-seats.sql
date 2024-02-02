# Write your MySQL query statement below
with  cte as(select  case when  id%2=0 then id-1
        when  id%2!=0 then id+1 end  as id,student from Seat order by id)
select  id ,student from cte where id  in(select id from Seat) 
union
select id ,student  from seat where id not in(select id from cte)  order by id