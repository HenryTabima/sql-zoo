--? 1. Change the query shown so that it displays Nobel prizes fOR 1950.
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;

--? 2. Show who won the 1962 prize fOR Literature.
SELECT winner
FROM nobel
WHERE yr = 1962
  AND subject = 'Literature';

--? 3. Show the year AND subject that won 'Albert Einstein' his prize.
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

--? 4. Give the name of the 'Peace' winners since the year 2000, including 2000.
SELECT winner
FROM nobel
WHERE yr >= 2000
  AND subject = 'Peace';

--? 5. Show all details (yr, subject, winner) of the Literature prize winners fOR 1980 to 1989 inclusive.
SELECT *
FROM nobel
WHERE subject = 'Literature'
  AND yr between 1980 AND 1989;

--? 6. Show all details of the presidential winners:
-- TheodORe Roosevelt
-- Woodrow Wilson
-- Jimmy Carter
-- Barack Obama
SELECT *
FROM nobel
WHERE winner IN ('TheodORe Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama');

--? 7. Show the winners with first name John
SELECT winner
FROM nobel
WHERE winner like 'John%';

--? 8. Show the year, subject, AND name of Physics winners fOR 1980 together with the Chemistry winners fOR 1984.
SELECT *
FROM nobel
WHERE subject = 'Physics'
  AND yr = 1980
  OR subject = 'Chemistry'
  AND yr = 1984;

--? 9. Show the year, subject, AND name of winners fOR 1980 excluding Chemistry AND Medicine
SELECT *
FROM nobel
WHERE yr = 1980
  AND subject NOT IN ('Chemistry', 'Medicine');

--? 10. Show year, subject, AND name of people who won a 'Medicine' prize IN an early year (befORe 1910, NOT including 1910) together with winners of a 'Literature' prize IN a later year (after 2004, including 2004)
SELECT *
FROM nobel
WHERE subject = 'Medicine'
  AND yr < 1910
  OR subject = 'Literature'
  AND yr >= 2004;

--? 11. Find all details of the prize won BY PETER GRÜNBERG
SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG';

--? 12. Find all details of the prize won BY EUGENE O'NEILL
SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL';

--? 13. Knights IN ORder. List the winners, year AND subject WHERE the winner starts with Sir. Show the the most recent first, THEN BY name ORder.
SELECT winner, yr, subject
FROM nobel
WHERE winner like 'Sir%'
ORder BY yr desc, winner asc;

--? 14. The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 OR 1. Show the 1984 winners AND subject ORdered BY subject AND winner name; but list Chemistry AND Physics last.
SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY
  subject IN ('Physics', 'Chemistry'),
  subject,
  winner;