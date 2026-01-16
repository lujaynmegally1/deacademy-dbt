-- scd 1 logic

{{ config(
    materialized='incremental',  -- or 'table' for first load
    database='WALMART',
    schema='PUBLIC', 
    alias = 'department_dim'
) }}

SELECT
    store_id,
    dept_id,
    store_date,
    weekly_sales,
    isholiday, 
    CURRENT_TIMESTAMP() AS insert_date,
    CURRENT_TIMESTAMP() AS update_date
FROM WALMART.PUBLIC.department_raw
--  change to {{'source':'...'}}