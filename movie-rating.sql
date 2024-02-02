# Write your MySQL query statement below
with cte as(
select r.user_id,count(r.rating) as rt from  movierating  r 
  group by r.user_id 
),cte2 as 
( select R.movie_id, round(sum(R.rating)/count(R.rating),2) as ratings from (select * from MovieRating R  where R.created_at>='2020-02-01' and R.created_at<='2020-02-29')R group by R.movie_id )

 (select u.name as results from cte c join users u on  c.user_id= u.user_id  where rt=(select max(rt) from cte) order by u.name asc limit  1)
 union all
(select m.title as results from cte2 c join movies m on  c.movie_id =m.movie_id  where ratings=(select max(ratings) from cte2) order by m.title asc limit 1 )

