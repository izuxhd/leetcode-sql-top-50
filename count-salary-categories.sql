with c1 as(select 'Low Salary' as category , count(account_id) accounts_count from Accounts where income <20000),
c2 as(select 'Average Salary' as category,count(account_id) accounts_count from Accounts where income between 20000 and 50000),

c3 as(select 'High Salary' as category,count(account_id) accounts_count from Accounts where income > 50000)
select * from c1
union all
select * from c2
union all
select * from c3