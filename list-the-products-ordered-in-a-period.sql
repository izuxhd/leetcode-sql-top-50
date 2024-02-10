# Write your MySQL query statement below
with  cte as (
select  product_id , order_date, unit from  Orders  where Month(order_date)='2' and Year(order_date)='2020' 
)
 select p.product_name , sum(unit) as unit  from  cte c join products p  on c.product_id=p.product_id group by c.product_id having unit >=100 