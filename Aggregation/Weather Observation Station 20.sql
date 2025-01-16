/*
A median is defined as a number separating the higher half of a data set from
the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION
and round your answer to 4 decimal places.
*/
WITH ranked_station AS (
    SELECT
        lat_n,
        ROW_NUMBER() OVER (ORDER BY lat_n) AS row_asc,
        ROW_NUMBER() OVER (ORDER BY lat_n DESC) AS row_desc
    FROM
        station
)
SELECT 
    ROUND(AVG(lat_n), 4)
FROM
    ranked_station
WHERE
    row_asc = row_desc;