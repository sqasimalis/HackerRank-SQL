/*
Julia conducted a 15 days of learning SQL contest. The start date of the
contest was March 01, 2016 and the end date was March 15, 2016.
Write a query to print total number of unique hackers who made at least 1
submission each day (starting on the first day of the contest), and find the
hacker_id and name of the hacker who made maximum number of submissions each
day. If more than one such hacker has a maximum number of submissions, print
the lowest hacker_id. The query should print this information for each day of
the contest, sorted by the date.
*/
SELECT
    submission_date,
    (
        SELECT
            COUNT(DISTINCT hacker_id)
        FROM
            submissions AS s2
        WHERE
            s2.submission_date = s1.submission_date
            AND (
                SELECT
                    COUNT(DISTINCT submission_date)
                FROM
                    submissions AS s3
                WHERE
                    s3.hacker_id = s2.hacker_id
                    AND s3.submission_date < s2.submission_date
            ) = DATEDIFF(s1.submission_date, '2016-03-01')
    ) AS unique_hackers,
    (
        SELECT
            hacker_id
        FROM
            submissions AS s4
        WHERE
            s4.submission_date = s1.submission_date
        GROUP BY
            hacker_id
        ORDER BY
            COUNT(submission_id) DESC,
            hacker_id
        LIMIT 1
    ) AS h_id,
    (
        SELECT
            name
        FROM
            hackers
        WHERE
            hacker_id = h_id
    ) AS hacker_name
FROM
    (
        SELECT
            DISTINCT submission_date
        FROM
            submissions
    ) AS s1
ORDER BY
    submission_date;
