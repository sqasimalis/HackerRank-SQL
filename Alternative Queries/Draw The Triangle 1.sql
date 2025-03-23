/*
P(R) represents a pattern drawn by Julia in R rows.
The following pattern represents P(5):
* * * * * 
* * * * 
* * * 
* * 
*
Write a query to print the pattern P(20)
*/
WITH RECURSIVE Pattern AS (
    SELECT
        20 AS n,
        REPEAT('* ', 20) AS stars
    UNION ALL
    SELECT
        n - 1,
        REPEAT('* ', n - 1)
    FROM
        Pattern
    WHERE
        n > 1
)
SELECT
    stars
FROM
    Pattern;
