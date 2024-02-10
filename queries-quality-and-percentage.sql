select  query_name, round(sum(rating/position)/count(query_name),2) as quality ,round(avg(rating <3)*100 ,2) as 
  poor_query_percentage from Queries group by query_name having query_name is not null
--   case when rating < 3 then  (count(rating)/)*100 end