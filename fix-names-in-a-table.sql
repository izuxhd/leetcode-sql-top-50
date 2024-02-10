/* Write your T-SQL query statement below */
select user_id, 
case 
    when name like '[a-z]%' 
    then concat(upper(substring(name,1,1)), lower(substring(name, 2, len(name)))) 
    else name 
end as name 
from users order by user_id;