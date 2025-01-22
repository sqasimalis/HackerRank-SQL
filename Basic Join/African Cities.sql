/*
Given the CITY and COUNTRY tables, query the names of all cities where the
CONTINENT is 'Africa'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
SELECT
    c.name
FROM
    city AS c
JOIN
    country AS co
    ON c.countrycode = co.code
WHERE
    co.continent = 'Africa';
