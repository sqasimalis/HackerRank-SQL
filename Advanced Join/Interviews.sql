/*
Samantha interviews many candidates from different colleges using coding
challenges and contests. Write a query to print the contest_id, hacker_id,
name, and the sums of total_submissions, total_accepted_submissions,
total_views, and total_unique_views for each contest sorted by contest_id.
Exclude the contest from the result if all four sums are 0.
Note: A specific contest can be used to screen candidates at more than one
college, but each college only holds 1 screening contest.
*/
SELECT
    A.contest_id,
    A.hacker_id,
    A.name,
    SUM(E.total_submissions) AS total_submissions,
    SUM(E.total_accepted_submissions) AS total_accepted_submissions,
    SUM(D.total_views) AS total_views,
    SUM(D.total_unique_views) AS total_unique_views
FROM
    contests AS A
LEFT JOIN
    colleges AS B
    ON A.contest_id = B.contest_id
LEFT JOIN
    challenges AS C
    ON B.college_id = C.college_id
LEFT JOIN
    (
        SELECT
            challenge_id,
            SUM(total_views) AS total_views,
            SUM(total_unique_views) AS total_unique_views
        FROM
            view_stats
        GROUP BY
            challenge_id
    ) AS D
    ON C.challenge_id = D.challenge_id
LEFT JOIN
    (
        SELECT
            challenge_id,
            SUM(total_submissions) AS total_submissions,
            SUM(total_accepted_submissions) AS total_accepted_submissions
        FROM
            submission_stats
        GROUP BY
            challenge_id
    ) AS E
    ON C.challenge_id = E.challenge_id
GROUP BY
    A.contest_id,
    A.hacker_id,
    A.name
HAVING
    (SUM(E.total_submissions) + 
     SUM(E.total_accepted_submissions) + 
     SUM(D.total_views) + 
     SUM(D.total_unique_views)) > 0
ORDER BY
    A.contest_id;