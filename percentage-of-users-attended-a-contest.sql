SELECT R.contest_id, 
       round(COUNT(R.contest_id)/(select count(*) from Users) * 100,2) AS percentage 
FROM Register R 
JOIN users U ON R.user_id = U.user_id 
GROUP BY R.contest_id 
ORDER BY  percentage DESC,R.contest_id ASC