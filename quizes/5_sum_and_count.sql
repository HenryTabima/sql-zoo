--? 1. SELECT the statement that shows the sum of population of all countries IN 'Europe'
--* answer:
SELECT SUM(population)
FROM bbc
WHERE region = 'Europe'

--? 2. SELECT the statement that shows the number of countries with population smaller than 150000
--* answer:
SELECT COUNT(name)
FROM bbc
WHERE population < 150000

--? 3. SELECT the list of cORe SQL aggregate functions
--* answer:
-- AVG(), COUNT(), MAX(), MIN(), SUM()

--? 4. SELECT the result that would be obtained FROM the following code:
SELECT region, SUM(area)
FROM bbc
WHERE SUM(area) > 15000000
GROUP BY region
--* answer:
-- No result due to invalid use of the WHERE function

--? 5. SELECT the statement that shows the average population of 'PolAND', 'Germany' AND 'Denmark'
--* answer:
SELECT AVG(population)
FROM bbc
WHERE name IN ('PolAND', 'Germany', 'Denmark')

--? 6. SELECT the statement that shows the medium population density of each region
--* answer:
SELECT region, SUM(population)/SUM(area) AS density
FROM bbc
GROUP BY region

--? 7. SELECT the statement that shows the name AND population density of the country with the largest population
--* answer:
SELECT name, population/area AS density
FROM bbc
WHERE population = (SELECT MAX(population)
FROM bbc)

--? 8. Pick the result that would be obtained FROM the following code:
SELECT region, SUM(area)
FROM bbc
GROUP BY region
HAVING SUM(area)<= 20000000
--* answer:
-- Table-D
-- Americas	      732240
-- Middle East	  13403102
-- South America	17740392
-- South Asia	    9437710