/*
Julia asked her students to create some coding challenges. Write a query to
print the hacker_id, name, and the total number of challenges created by each
student. Sort your results by the total number of challenges in descending order.
If more than one student created the same number of challenges, then sort the
result by hacker_id. If more than one student created the same number of
challenges and the count is less than the maximum number of challenges created,
then exclude those students from the result.
*/
WITH ChallengeCounts AS (
    SELECT
        H.hacker_id,
        H.name,
        COUNT(C.challenge_id) AS c_count
    FROM
        hackers AS H
    JOIN
        challenges AS C
        ON C.hacker_id = H.hacker_id
    GROUP BY
        H.hacker_id,
        H.name
),
MaxChallenge AS (
    SELECT
        MAX(c_count) AS max_count
    FROM
        ChallengeCounts
),
UniqueCounts AS (
    SELECT
        c_count
    FROM
        ChallengeCounts
    GROUP BY
        c_count
    HAVING
        COUNT(*) = 1
)
SELECT
    CC.hacker_id,
    CC.name,
    CC.c_count
FROM
    ChallengeCounts AS CC
JOIN
    MaxChallenge AS MC
    ON CC.c_count = MC.max_count
OR CC.c_count IN (
    SELECT
        c_count
    FROM
        UniqueCounts
)
ORDER BY
    CC.c_count DESC,
    CC.hacker_id;