{{ config(
    materialized='incremental',
    unique_key= 'store_date',
    database='WALMART',
    schema='BRONZE',
    alias='walmart_date_dim'
) }}

WITH source AS (
    SELECT
        TO_CHAR(store_date, 'YYYYMMDD')::INT AS date_id,
        store_date,
        isholiday,
        CURRENT_TIMESTAMP() AS insert_date,
        CURRENT_TIMESTAMP() AS update_date
    FROM WALMART.PUBLIC_RAW.department_raw
)
SELECT *
FROM source
{% if is_incremental() %}
{% endif %}
