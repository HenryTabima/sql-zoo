--* 1. SELECT the code which gives the name of countries beginning with U
--* answer:
SELECT name
FROM wORld
WHERE name LIKE 'U%'

--* 2. SELECT the code which shows just the population of United Kingdom?
--* answer:
SELECT population
FROM wORld
WHERE name = 'United Kingdom'

--* 3. SELECT the answer which shows the problem with this SQL code - the intended result should be the continent of France:
SELECT continent
FROM wORld
WHERE 'name' = 'France'
--* answer:
-- 'name' should be name

--* 4. SELECT the result that would be obtained FROM the following code:
SELECT name, population / 10
FROM wORld
WHERE population < 10000
--* answer:
-- Nauru	990

--*5. SELECT the code which would reveal the name AND population of countries IN Europe AND Asia
--* answer:
SELECT name, population
FROM wORld
WHERE continent IN ('Europe', 'Asia')

--* 6. SELECT the code which would give two rows
--* answer:
SELECT name
FROM wORld
WHERE name IN ('Cuba', 'Togo')

--* 7. SELECT the result that would be obtained FROM this code:
SELECT name
FROM wORld
WHERE continent = 'South America'
  AND population > 40000000
--* answer:
-- Brazil
-- Colombia