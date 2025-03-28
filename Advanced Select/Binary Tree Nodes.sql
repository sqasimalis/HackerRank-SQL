/*
Query the following two values from the STATION table:
1. The sum of all values in LAT_N rounded to a scale of 2 decimal places.
2. The sum of all values in LONG_W rounded to a scale of 2 decimal places.
*/
SELECT
    ROUND(SUM(lat_n), 2),
    ROUND(SUM(long_w), 2)
FROM
    station;
