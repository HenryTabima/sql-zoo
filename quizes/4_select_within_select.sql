--* 1. SELECT the code that shows the name, region AND population of the smallest country IN each region
--* answer:
SELECT region, name, population
FROM bbc x
WHERE population <= ALL (SELECT population
FROM bbc y
WHERE y.region=x.region AND population>0)

--* 2. SELECT the code that shows the countries belonging to regions with all populations over 50000
--* answer:
SELECT name, region, population
FROM bbc x
WHERE 50000 < ALL (SELECT population
FROM bbc y
WHERE x.region=y.region AND y.population>0)

--* 3. SELECT the code that shows the countries with a less than a third of the population of the countries around it
--* answer:
SELECT name, region
FROM bbc x
WHERE population < ALL (SELECT population/3
  FROM bbc y
  WHERE y.region = x.region AND y.name != x.name)

--* 4. SELECT the result that would be obtained FROM the following code:
SELECT name
FROM bbc
WHERE population >
       (SELECT population
  FROM bbc
  WHERE name='United Kingdom')
  AND region IN
       (SELECT region
  FROM bbc
  WHERE name = 'United Kingdom')
--* answer:
-- Table-D
-- France
-- Germany
-- Russia
-- Turkey

--* 5. SELECT the code that would show the countries with a greater GDP than any country IN Africa (some countries may have NULL gdp values).
--* answer:
SELECT name
FROM bbc
WHERE gdp > (SELECT MAX(gdp)
FROM bbc
WHERE region = 'Africa')

--* 6.SELECT the code that shows the countries with population smaller than Russia but bigger than Denmark
--* answer
SELECT name
FROM bbc
WHERE population < (SELECT population
  FROM bbc
  WHERE name='Russia')
  AND population > (SELECT population
  FROM bbc
  WHERE name='Denmark')

--* 7. >SELECT the result that would be obtained FROM the following code:
SELECT name
FROM bbc
WHERE population > ALL
       (SELECT MAX(population)
  FROM bbc
  WHERE region = 'Europe')
  AND region = 'South Asia'
--* answer:
-- Table-B
-- Bangladesh
-- India
-- Pakistan