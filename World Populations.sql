--Table overview
SELECT
   *
FROM
   countries LIMIT 10;
SELECT
   *
FROM
   population_years LIMIT 10;


--Number of countries in Africa
SELECT
   COUNT(*)
FROM
   countries
WHERE
   continent = 'Africa';


--Population of Oceania
WITH oceania_countries AS
(
   SELECT
      id,
      name
   FROM
      countries
   WHERE
      continent = 'Oceania'
)
SELECT
   round(AVG(population_years.population), 2) AS 'Average Oceania Population in 2005 (in millions)'
FROM
   population_years
   JOIN
      oceania_countries
WHERE
   population_years.country_id = oceania_countries.id
   AND YEAR = 2005;


--Average population of South American countries in 2003
SELECT
   round(AVG(population_years.population), 2)
FROM
   countries
   JOIN
      population_years
      ON countries.id = population_years.country_id
WHERE
   countries.continent = 'South America'
   AND population_years.YEAR = 2003;


--Smallest population country in 2007
SELECT
   countries.name,
   MIN(population_years.population) AS 'Country with smallest population in 2007'
FROM
   countries
   JOIN
      population_years
      ON countries.id = population_years.country_id
WHERE
   population_years.YEAR = 2007;


--Average population of Poland during all years
SELECT
   round(AVG(population_years.population), 2) AS 'Average population of Poland 2000-2010 (in millions)'
FROM
   countries
   JOIN
      population_years
      ON countries.id = population_years.country_id
WHERE
   countries.name = 'Poland';

   
--Number of countries with "The" in the name
SELECT
   COUNT(name)
FROM
   countries
WHERE
   name LIKE '% The %'
   OR name LIKE '% The'
   OR name LIKE 'The %';


--Total population of each continent in 2010
SELECT
   countries.continent,
   SUM(population_years.population) AS 'population in 2010'
FROM
   countries
   JOIN
      population_years
      ON countries.id = population_years.country_id
WHERE
   population_years.YEAR = 2010
GROUP BY
   continent;
