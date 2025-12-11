with source as (
    -- 1. Hút dữ liệu từ nguồn
    select * from {{ source('thelook_ecommerce', 'orders') }}
),

renamed as (
    -- 2. Đổi tên và chọn lọc cột
    select
        order_id,            
        user_id,                   
        status,
        num_of_item,
        created_at as order_date   
    from source
)

-- 3. Xuất ra kết quả
select * from renamed