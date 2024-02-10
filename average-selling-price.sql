
-- (select  distinct U.product_id ,U.purchase_date,U.units ,  case when U.purchase_date  < P.start_date  < P.end_date then  P.price end  as p_price from UnitsSold U left join Prices P on U.product_id=P.product_id   )
-- -- SELECT
--     U.product_id,
--     DISTINCT U.purchase_date,
--     U.units,
--     CASE WHEN U.purchase_date < P.start_date AND P.start_date < P.end_date THEN P.price END AS p_price
-- FROM
--     UnitsSold U
-- LEFT JOIN
--     Prices P ON U.product_id = P.product_id;

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