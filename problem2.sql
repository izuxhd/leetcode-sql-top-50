1251. Average Selling Price


with cte as(
select p.product_id,case
 when units then  round(sum(units*price)/sum(units),2) 
 else 0  end as  average_price 
from  unitssold us
left join prices p
on p.product_id = us.product_id
and purchase_date between start_date and end_date
group by p.product_id
)
select * from cte
union
select  product_id, 0 as average_price from  prices  where product_id not in (select distinct  product_id  from UnitsSold)