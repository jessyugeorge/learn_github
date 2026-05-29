WITH CTE AS 
(
    SELECT 
    to_timestamp(started_at) as started_at,
    date(to_timestamp(started_at)) as date_started_at,
    hour(to_timestamp(started_at)) as hour_started_at,

    {{day_type('started_at')}} AS DAY_TYPE,

    {{get_season('started_at')}} AS STATION_OF_YEAR,

    {{function1('started_at')}} as HISTORY
    FROM {{ source('demo', 'bike') }}
    
)
select * from CTE

