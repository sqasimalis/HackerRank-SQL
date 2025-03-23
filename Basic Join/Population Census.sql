/*
Given the CITY and COUNTRY tables, query the sum of the populations of all
cities where the CONTINENT is 'Asia'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
SELECT
    SUM(c.population)
FROM
    city AS c
JOIN
    country AS co
    ON c.countrycode = co.code
WHERE
    co.continent = 'Asia';