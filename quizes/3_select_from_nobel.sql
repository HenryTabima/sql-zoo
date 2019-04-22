--* 1. Pick the code which shows the name of winner's names beginning with C AND ending IN n
--* asnwer:
SELECT winner
FROM nobel
WHERE winner LIKE 'C%' AND winner LIKE '%n'

--* 2. SELECT the code that shows how many Chemistry awards were given between 1950 AND 1960
--* answer:
SELECT COUNT(subject)
FROM nobel
WHERE subject = 'Chemistry'
  AND yr BETWEEN 1950 AND 1960

--* 3. Pick the code that shows the amount of years WHERE no Medicine awards were given
--* answer:
SELECT COUNT(DISTINCT yr)
FROM nobel
WHERE yr NOT IN (SELECT DISTINCT yr
FROM nobel
WHERE subject = 'Medicine')

--* 4. SELECT the result that would be obtained FROM the following code:
SELECT subject, winner
FROM nobel
WHERE winner LIKE 'Sir%' AND yr LIKE '196%'
--* answer:
-- Medicine	  Sir John Eccles
-- Medicine	  Sir Frank Macfarlane Burnet

--* 5. SELECT the code which would show the year WHEN neither a Physics OR Chemistry award was given
--* answer:
SELECT yr
FROM nobel
WHERE yr NOT IN(SELECT yr
FROM nobel
WHERE subject IN ('Chemistry','Physics'))

--* 6. SELECT the code which shows the years WHEN a Medicine award was given but no Peace OR Literature award was
--* answer:
SELECT DISTINCT yr
FROM nobel
WHERE subject='Medicine'
  AND yr NOT IN(SELECT yr
  FROM nobel
  WHERE subject='Literature')
  AND yr NOT IN (SELECT yr
  FROM nobel
  WHERE subject='Peace')

--* 7. Pick the result that would be obtained FROM the following code:
SELECT subject, COUNT(subject)
FROM nobel
WHERE yr ='1960'
GROUP BY subject
--* answer:
-- Chemistry	  1
-- Literature   1
-- Medicine	    2
-- Peace	      1
-- Physics	    1