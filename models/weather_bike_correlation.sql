WITH CTE AS
(
    SELECT 
    * 
    FROM {{ ref('trip_fact') }}
    limit 10
)
select * from CTE