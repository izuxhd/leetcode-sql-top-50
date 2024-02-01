# Write your MySQL query statement below
select case when R.num!='' then
 max(R.num)
 else null end as num from (select num
 from  MyNumbers group by num having count(num)=1)R 