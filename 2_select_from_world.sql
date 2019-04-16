--? 1. Read the NOTes about this table. Observe the result of running this SQL commAND to show the name, continent AND population of all countries.
SELECT name, continent, population
FROM wORld

--? 2. How to use WHERE to filter recORds. Show the name fOR the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
SELECT name
FROM wORld
WHERE population > 200000000

--? 3. Give the name AND the per capita GDP fOR those countries with a population of at least 200 million.
SELECT name, GDP/population
FROM wORld
WHERE population > 200000000

--? 4. Show the name AND population IN millions fOR the countries of the continent 'South America'. Divide the population BY 1000000 to get population IN millions.
SELECT name, population/1000000
FROM wORld
WHERE continent = 'South America';

--? 5. Show the name AND population fOR France, Germany, Italy
SELECT name, population
FROM wORld
WHERE name IN ('France', 'Germany', 'Italy');

--? 6. Show the countries which have a name that includes the wORd 'United'
SELECT name
FROM wORld
WHERE name LIKE '%United%';

--? 7. Two ways to be big: A country is big if it has an area of mORe than 3 million sq km OR it has a population of mORe than 250 million. Show the countries that are big BY area OR big BY population. Show name, population AND area.
SELECT name, area, population
FROM wORld
WHERE area >= 3000000 OR population >= 250000000;

--? 8. Exclusive OR (XOR). Show the countries that are big BY area OR big BY population but NOT both. Show name, population AND area.
-- Australia has a big area but a small population, it should be included.
-- Indonesia has a big population but a small area, it should be included.
-- China has a big population AND big area, it should be excluded.
-- United Kingdom has a small population AND a small area, it should be excluded.
SELECT name, population, area
FROM wORld
WHERE area >= 3000000
XOR population >= 250000000;

--? 9. Show the name AND population IN millions AND the GDP IN billions fOR the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places. FOR South America show population IN millions AND GDP IN billions both to 2 decimal places.
SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2)
FROM wORld
WHERE continent = 'South America';

--? 10. Show the name AND per-capita GDP fOR those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000. Show per-capita GDP fOR the trillion dollar countries to the nearest $1000.
SELECT name, ROUND((gdp/population)/1000)*1000
FROM wORld
WHERE gdp >= 1000000000000;

--? 11. Greece has capital Athens. Each of the strings 'Greece', AND 'Athens' has 6 characters. Show the name AND capital WHERE the name AND the capital have the same number of characters.
SELECT name, capital
FROM wORld
WHERE LENGTH(name) = LENGTH(capital)

--? 12. The capital of Sweden is Stockholm. Both wORds start with the letter 'S'. Show the name AND the capital WHERE the first letters of each match. Don't include countries WHERE the name AND the capital are the same wORd.
-- You can use the function LEFT to isolate the first character.
-- You can use <> as the NOT EQUALS operatOR.
SELECT name, capital
FROM wORld
WHERE LEFT(name,1) = LEFT(capital,1)
  AND name <> capital

--? 13. EquatORial Guinea AND Dominican Republic have all of the vowels (a e i o u) IN the name. They don't count because they have mORe than one wORd IN the name. Find the country that has all the vowels AND no spaces IN its name.
-- You can use the phrase name NOT LIKE '%a%' to exclude characters FROM your results.
-- The query shown misses countries like Bahamas AND Belarus because they contain at least one 'a'
SELECT name
FROM wORld
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %'