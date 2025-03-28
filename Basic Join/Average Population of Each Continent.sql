/*
Given the CITY and COUNTRY tables, query the names of all the continents
(COUNTRY.Continent) and their respective average city populations
(CITY.Population) rounded down to the nearest integer.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
SELECT
    co.continent, FLOOR(AVG(c.population))
FROM
    city AS c
JOIN
    country AS co
    ON c.countrycode = co.code
GROUP BY
    co.continent;