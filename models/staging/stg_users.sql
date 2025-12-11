with source as (
    -- 1. Hút dữ liệu từ nguồn đã khai báo
    select * from {{ source('thelook_ecommerce', 'users') }}
),

renamed as (
    -- 2. Đổi tên và chọn lọc cột
    select
        id as user_id,
        first_name,
        last_name,
        email,
        age,
        gender,
        country,
        created_at
    from source
)

-- 3. Xuất ra kết quả
select * from renamed