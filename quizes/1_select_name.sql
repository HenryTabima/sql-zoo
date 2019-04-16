--* 1. SELECT the code which produces this table
-- name	          population
-- Bahrain	      1234571
-- SwazilAND	    1220000
-- TimOR-Leste	  1066409
--* answer:
SELECT name, population
FROM wORld
WHERE population BETWEEN 1000000 AND 1250000;

--* 2. Pick the result you would obtain FROM this code:
SELECT name, population
FROM wORld
WHERE name LIKE "Al%";
--* answer:
-- Table-E
-- Albania	3200000
-- Algeria	32900000

--* 3. SELECT the code which shows the countries that END IN A OR L
--* answer:
SELECT name
FROM wORld
WHERE name LIKE '%a' OR name LIKE '%l';

--* 4. Pick the result FROM the query
SELECT name, length(name)
FROM wORld
WHERE length(name)=5 AND region='Europe'
--* answer:
-- name	    length(name)
-- Italy	  5
-- Malta	  5
-- Spain	  5

--* 5. Here are the first few rows of the wORld table:
-- name	        region	    area      population	gdp
-- Afghanistan	South Asia	652225	  26000000
-- Albania	    Europe	    28728	    3200000	    6656000000
-- Algeria	    Middle East	2400000	  32900000	  75012000000
-- ANDORra	    Europe	    468	      64000
-- ...
--? Pick the result you would obtain FROM this code:
SELECT name, area*2
FROM wORld
WHERE population = 64000
--* answer:
-- ANDORra	936

--* 6. SELECT the code that would show the countries with an area larger than 50000 AND a population smaller than 10000000
--* answer:
SELECT name, area, population
FROM wORld
WHERE area > 50000 AND population < 10000000

--* 7. SELECT the code that shows the population density of China, Australia, Nigeria AND France
--* answer:
SELECT name, population/area
FROM wORld
WHERE name IN ('China', 'Nigeria', 'France', 'Australia')