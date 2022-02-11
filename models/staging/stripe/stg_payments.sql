with payments as (
    select
        id as payment_id,
        orderid as order_id,
        created as order_date,
        paymentmethod as payment_method,
        status,
        amount/100 as amount
    from {{ source('stripe', 'payment') }}
)
select * from payments
