with payments as (
    select * from {{ ref("stg_payments") }}
),

orders as (
    select * from {{ ref("stg_orders") }}
),

order_payments as (
    select
        order_id,
        SUM(amount) as amount

    from payments
    
    where status = 'success'
    
    group by order_id
),

fct_orders as (
    select
        orders.order_id,
        orders.order_date,
        orders.customer_id,
        order_payments.amount
    from orders

    left join order_payments using (order_id)
)

select * from fct_orders
