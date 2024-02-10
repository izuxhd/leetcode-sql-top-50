# Write your MySQL query statement below
#first solution
DELETE a FROM Person a  join Person b on a.email=b.email
 and  a.id>b.id
 
 #second solution
 with CTE As (select id,email,row_number() Over (partition by email order by id) as rn from person)
delete p
from CTE , person p where CTE.id=p.id and CTE.rn>1
--880ms