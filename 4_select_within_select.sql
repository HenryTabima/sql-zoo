--? 1. List each country name WHERE the population is larger than that of 'Russia'.
SELECT name
FROM world
WHERE population >
     (SELECT population
FROM world
WHERE name='Russia');

--? 2. Show the countries IN Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name
FROM world
WHERE continent = 'Europe'
  AND gdp/population > (
    SELECT gdp/population
    FROM world
    WHERE name = 'United Kingdom'
  );

--? 3. List the name AND continent of countries IN the continents containing either Argentina OR Australia. Order BY name of the country.
SELECT name, continent
FROM world
WHERE continent IN (
  SELECT continent
  FROM world
  WHERE name IN ('Argentina', 'Australia')
)
ORDER BY name;

--? 4. Which country has a population that is more than Canada but less than Poland? Show the name AND the population.
SELECT name, population
FROM world
WHERE population between
  (SELECT population
  FROM world
  WHERE name = 'canada')+1
  AND
  (SELECT population
  FROM world
  WHERE name = 'poland')-1;

--? 5. Germany (population 80 million) has the largest population of the countries IN Europe. Austria (population 8.5 million) has 11% of the population of Germany.
-- Show the name AND the population of each country IN Europe. Show the population as a percentage of the population of Germany.
SELECT
  name,
  round(100*population/(SELECT population
  FROM world
  WHERE name = 'germany')) || '%'
FROM world
WHERE continent = 'europe';

--? 6. Which countries have a GDP greater than every country IN Europe? [Give the name only.] (Some countries may have NULL gdp values)
SELECT name
FROM world
WHERE gdp > (
  SELECT MAX(gdp)
  FROM world
  WHERE continent = 'europe'
  );

--? 7. Find the largest country (BY area) IN each continent, show the continent, the name AND the area:
SELECT continent, name, area
FROM world x
WHERE area >= ALL
    (SELECT area
FROM world y
WHERE y.continent=x.continent
  AND area>0);

--? 8. List each continent AND the name of the country that comes first alphabetically.
SELECT continent, name
FROM world x
WHERE name = (SELECT name
FROM world y
WHERE y.continent = x.continent
ORDER BY name limit 1)
ORDER BY continent;

--? 9. Find the continents WHERE all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent AND population.
SELECT name, continent, population
FROM world
WHERE continent IN (SELECT continent
FROM world x
WHERE (SELECT COUNT(name)
FROM world y
WHERE y.continent = x.continent) =
(SELECT COUNT(name)
FROM world z
WHERE z.continent = x.continent AND z.population <= 25000000))
ORDER BY name;

--? 10. Some countries have populations more than three times that of any of their neighbours (IN the same continent). Give the countries AND continents.
SELECT name, continent
FROM world x
WHERE x.population > any (
  SELECT population*3
  FROM world y
  WHERE y.continent = x.continent
  AND y.name != x.name
  );