with users as (
    select * from {{ ref('stg_users') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

customer_orders as (
    select
        users.user_id,
        users.first_name,
        users.last_name,
        count(orders.order_id) as total_orders,
        min(orders.order_date) as first_order_date,
        max(orders.order_date) as last_order_date
    from users
    left join orders on users.user_id = orders.user_id
    group by 1, 2, 3
)

select * from customer_orders