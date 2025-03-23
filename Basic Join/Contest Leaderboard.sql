/*
You did such a great job helping Julia with her last coding contest challenge
that she wants you to work on this one, too!
The total score of a hacker is the sum of their maximum scores for all of the
challenges. Write a query to print the hacker_id, name, and total score of the
hackers ordered by the descending score. If more than one hacker achieved the
same total score, then sort the result by ascending hacker_id. Exclude all
hackers with a total score of  from your result.
*/
SELECT
    S.hacker_id,
    H.name,
    SUM(S.max_score) AS total_score
FROM
    (
        SELECT
            hacker_id,
            challenge_id,
            MAX(score) AS max_score
        FROM
            submissions
        GROUP BY
            hacker_id,
            challenge_id
    ) AS S
JOIN
    hackers AS H
    ON S.hacker_id = H.hacker_id
GROUP BY
    S.hacker_id,
    H.name
HAVING
    total_score > 0
ORDER BY
    total_score DESC,
    S.hacker_id;