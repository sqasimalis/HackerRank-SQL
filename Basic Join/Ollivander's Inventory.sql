/*
Harry Potter and his friends are at Ollivander's with Ron, finally replacing
Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of
gold galleons needed to buy each non-evil wand of high power and age. Write a
query to print the id, age, coins_needed, and power of the wands that Ron's
interested in, sorted in order of descending power. If more than one wand has
same power, sort the result in order of descending age.
*/
SELECT
    w.id, wp.age, w.coins_needed, w.power
FROM
    wands AS w
JOIN
    wands_property AS wp
    ON w.code = wp.code
WHERE
    wp.is_evil = 0
    AND NOT EXISTS (
        SELECT
            1
        FROM
            wands AS x
        JOIN
            wands_property AS y
            ON x.code = y.code
        WHERE
            x.power = w.power AND
            y.age = wp.age AND
            x.coins_needed < w.coins_needed
    )
ORDER BY
    w.power DESC, wp.age DESC;