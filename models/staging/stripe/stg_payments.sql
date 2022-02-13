with payments as (
    select
        id as payment_id,
        orderid as order_id,
        created as order_date,
        paymentmethod as payment_method,
        status,
        {{ cents_to_dollars('amount') }},
        _batched_at as etl_load_time
    from {{ source('stripe', 'payment') }}
)
select * from payments
{{ limit_data_in_dev('etl_load_time', 5) }}
