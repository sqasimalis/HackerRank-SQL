/*
P(R) represents a pattern drawn by Julia in R rows.
The following pattern represents P(5):
* 
* * 
* * * 
* * * * 
* * * * *
Write a query to print the pattern P(20).
*/
WITH RECURSIVE Pattern AS (
    SELECT
        1 AS n,
        CAST('* ' AS CHAR(40)) AS stars
    UNION ALL
    SELECT
        n + 1,
        CONCAT(stars, '* ')
    FROM
        Pattern
    WHERE
        n < 20
)
SELECT
    stars
FROM
    Pattern;