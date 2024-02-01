# Write your MySQL query statement below
select  R.product_id,R.first_year,S.quantity,S.price from Sales S join  (select product_id, min(year) as first_year from Sales  group by product_id)R 
on  S.product_id=R.product_id and S.year=R.first_year