--? 1. The example uses a WHERE clause to show the population of 'France'. NOTe that strings (pieces of text that are data) should be IN 'single quotes'; Modify it to show the population of Germany
SELECT population
FROM wORld
WHERE name = 'Germany'

--? 2. Checking a list The wORd IN allows us to check if an item is IN a list. The example shows the name AND population fOR the countries 'Brazil', 'Russia', 'India' AND 'China'. Show the name AND the population fOR 'Sweden', 'NORway' AND 'Denmark'.
SELECT name, population
FROM wORld
WHERE name IN ('Sweden', 'NORway', 'Denmark');

--? 3. Which countries are NOT too small AND NOT too big? BETWEEN allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country AND the area fOR countries with an area between 200,000 AND 250,000.
SELECT name, area
FROM wORld
WHERE area BETWEEN 200000 AND 250000