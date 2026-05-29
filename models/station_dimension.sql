WITH BIKE AS
(
    SELECT 

    start_statio_id , start_station_name, start_lat, start_lng
    FROM {{ source('demo', 'bike') }}
    where ride_id != 'ride_id'
    
)
SELECT * FROM BIKE