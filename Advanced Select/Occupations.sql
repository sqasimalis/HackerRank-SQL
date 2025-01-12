/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted
alphabetically and displayed underneath its corresponding Occupation.
The output should consist of four columns (Doctor, Professor, Singer, and Actor)
in that specific order, with their respective names listed alphabetically under
each column.
Note: Print NULL when there are no more names corresponding to an occupation.
Occupation will only contain one of the following values:
Doctor, Professor, Singer or Actor.
*/
WITH ranked_occupations AS (
    SELECT
        name,
        occupation,
        ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS row_num
    FROM
        occupations
)
SELECT
    MAX(CASE WHEN occupation = 'Doctor' THEN name END) AS Doctor,
    MAX(CASE WHEN occupation = 'Professor' THEN name END) AS Professor,
    MAX(CASE WHEN occupation = 'Singer' THEN name END) AS Singer,
    MAX(CASE WHEN occupation = 'Actor' THEN name END) AS Actor
FROM
    ranked_occupations
GROUP BY
    row_num
ORDER BY
    row_num;