/*
Write a query to print all prime numbers less than or equal to 1000. Print your
result on a single line, and use the ampersand (&) character as your separator
(instead of a space).
For example, the output for all prime numbers <= 10 would be:
2&3&5&7
*/
WITH RECURSIVE Numbers AS (
    SELECT
        2 AS num
    UNION ALL
    SELECT
        num + 1
    FROM
        Numbers
    WHERE
        num < 1000
),
Primes AS (
    SELECT
        n.num
    FROM
        Numbers n
    WHERE
        NOT EXISTS (
            SELECT
                1
            FROM
                Numbers d
            WHERE
                d.num <= SQRT(n.num)
                AND n.num % d.num = 0
                AND d.num > 1
        )
)
SELECT
    GROUP_CONCAT(num ORDER BY num SEPARATOR '&') AS primes
FROM
    Primes;