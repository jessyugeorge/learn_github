WITH CTE AS 
(
    SELECT 
    to_timestamp(started_at) as started_at,
    date(to_timestamp(started_at)) as date_started_at,
    hour(to_timestamp(started_at)) as hour_started_at,

    CASE WHEN DAYNAME(to_timestamp(started_at)) IN ('SAT','SUN')
        THEN 'WEEKEND'
        ELSE 'BUSINESSDAY'
    END AS DAY_TYPE,

    CASE WHEN MONTH(to_timestamp(started_at)) IN (12,1,2) THEN 'WINTER'
    WHEN MONTH(to_timestamp(started_at)) IN (3,4,5) THEN 'SPRING'
    WHEN MONTH(to_timestamp(started_at)) IN (6,7,8) THEN 'SUMMER'
    ELSE 'AUTUMN'
    END AS SEASON_OF_YEAR
    FROM {{ source('demo', 'bike') }}
)
select * from CTE

