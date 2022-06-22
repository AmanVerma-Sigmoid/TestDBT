with orders as (
    select * from {{ ref('stg_order')}}
),

payments as (
    select * from {{ ref('stg_payment')}}
),

fct_orders as (
    select order_id,
            payment_id,
            amount
    from orders o
    left join payments p on o.order_id = p.orderid  
)

select * from fct_orders