{{ config(
    materialized = 'table',
    database = 'WALMART',
    schema = 'PUBLIC',
    alias = 'fact_raw'
) }}

SELECT
    $1::INT                        AS store_id,
    $2::DATE                       AS store_date,
    TRY_TO_NUMBER($3)               AS temperature,
    TRY_TO_NUMBER($4)               AS fuel_price,
    TRY_TO_NUMBER($5)               AS markdown1,
    TRY_TO_NUMBER($6)               AS markdown2,
    TRY_TO_NUMBER($7)               AS markdown3,
    TRY_TO_NUMBER($8)               AS markdown4,
    TRY_TO_NUMBER($9)               AS markdown5,
    TRY_TO_NUMBER($10)              AS cpi,
    TRY_TO_NUMBER($11)              AS unemployment,
    $12::BOOLEAN                     AS isholiday
FROM @WALMART.PUBLIC.WALMART_DATA_STAGE/fact.csv
 

