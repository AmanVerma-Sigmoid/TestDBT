--example of singular testing
with 
payment as (
select * from {{source('stripe','payment')}}
)

select 
    orderid,
    sum(amount) as total_amount
from payment
group by orderid
having total_amount < 0    
