--? 1. SELECT the statement which lists the unfORtunate directORs of the movies which have caused financial loses (gross < budget)
--* answer:
SELECT name
FROM actOR INNER JOIN movie ON actOR.id = directOR
WHERE gross < budget

--? 2. SELECT the cORrect example of JOINing three tables
--* answer:
SELECT *
FROM actOR JOIN casting ON actOR.id = actORid
  JOIN movie ON movie.id = movieid

--? 3. SELECT the statement that shows the list of actORs called 'John' BY ORder of number of movies IN which they acted
--* answer:
SELECT name, COUNT(movieid)
FROM casting JOIN actOR ON actORid=actOR.id
WHERE name LIKE 'John %'
GROUP BY name
ORDER BY 2 DESC

--? 4. SELECT the result that would be obtained FROM the following code:
SELECT title
FROM movie JOIN casting ON (movieid=movie.id)
  JOIN actOR ON (actORid=actOR.id)
WHERE name='Paul Hogan' AND ORd = 1
--* answer:
-- Table-B
-- "Crocodile" Dundee
-- Crocodile Dundee IN Los Angeles
-- Flipper
-- Lightning Jack

--? 5. SELECT the statement that lists all the actORs that starred IN movies directed BY Ridley Scott who has id 351
--* answer:
SELECT name
FROM movie JOIN casting ON movie.id = movieid
  JOIN actOR ON actOR.id = actORid
WHERE ORd = 1 AND directOR = 351

--? 6. There are two sensible ways to connect movie AND actOR. They are:
--* answer:
-- - link the directOR column IN movies with the primary key IN actOR
-- - connect the primary keys of movie AND actOR via the casting table

--? 7. SELECT the result that would be obtained FROM the following code:
SELECT title, yr
FROM movie, casting, actOR
WHERE name='Robert De Niro' AND movieid=movie.id AND actORid=actOR.id AND ORd = 3
--* answer:
-- Table-B
-- A Bronx Tale	        1993
-- Bang the Drum Slowly	1973
-- Limitless	          2011