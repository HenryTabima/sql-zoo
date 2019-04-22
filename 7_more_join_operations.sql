--? 1. List the films WHERE the yr is 1962 [Show id, title]
SELECT id, title
FROM movie
WHERE yr=1962;

--? 2. Give year of 'Citizen Kane'.
SELECT yr
FROM movie
WHERE title = 'citizen kane';

--? 3. List all of the Star Trek movies, include the id, title AND yr (all of these movies include the words Star Trek IN the title). order results BY year.
SELECT id, title, yr
FROM movie
WHERE title like '%star trek%'
orDER BY yr;

--? 4. What id number does the actor 'Glenn Close' have?
SELECT id
FROM actor
WHERE name = 'glenn close';

--? 5. What is the id of the film 'Casablanca'
SELECT id
FROM movie
WHERE title = 'casablanca';

--? 6. Obtain the cast list for 'Casablanca'. Use movieid=11768, (OR whatever value you got FROM the previous question)
SELECT name
FROM casting
  JOIN actor ON actorid = actor.id
  JOIN movie ON movieid = movie.id
WHERE movieid = 11768;

--? 7. Obtain the cast list for the film 'Alien'
SELECT name
FROM casting JOIN actor ON actorid=id
WHERE movieid=(SELECT id
FROM movie
WHERE title='alien');

--? 8. List the films IN which 'Harrison Ford' has appeared
SELECT title
FROM movie
  JOIN casting ON movie.id = movieid
  JOIN actor ON actorid = actor.id
WHERE name = 'harrison ford';

--? 9. List the films WHERE 'Harrison Ford' has appeared - but not IN the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 THEN this actor is IN the starring role]
SELECT title
FROM movie
  JOIN casting ON movie.id = movieid
  JOIN actor ON actorid = actor.id
WHERE name = 'harrison ford'
  AND ord > 1;

--? 10. List the films together with the leading star for all 1962 films.
SELECT movie.title, actor.name
FROM movie
  left JOIN casting ON movie.id = movieid
  left JOIN actor ON actorid = actor.id
WHERE ord = 1 AND movie.yr = 1962;

--? 11. Which were the busiest years for 'John Travolta', show the year AND the number of movies he made each year for any year IN which he made more than 2 movies.
SELECT yr, COUNT(title)
FROM movie
  JOIN casting ON movie.id=movieid
  JOIN actor ON actorid=actor.id
WHERE name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c)
FROM
  (SELECT yr, COUNT(title) AS c
  FROM
    movie JOIN casting ON movie.id=movieid
    JOIN actor ON actorid=actor.id
  WHERE name='John Travolta'
  GROUP BY yr) AS t
);

--? 12. List the film title AND the leading actor for all of the films 'Julie Andrews' played IN.
SELECT movie.title, actor.name
FROM casting
  JOIN movie ON movieid = movie.id
  JOIN actor ON actorid = actor.id
WHERE movieid IN (
  SELECT movieid
  FROM casting
  WHERE actorid = (SELECT id
  FROM actor
  WHERE name = 'julie andrews'))
  AND ord = 1;

--? 13. Obtain a list, IN alphabetical orDER, of actors who've had at least 30 starring roles.
SELECT name
FROM actor JOIN casting ON actor.id = actorid
WHERE ord = 1
GROUP BY name
HAVING COUNT(movieid) >= 30;

--? 14. List the films released IN the year 1978 ordered BY the number of actors IN the cast, THEN BY title.
SELECT title, COUNT(actorid)
FROM movie
  JOIN casting ON movie.id = movieid
WHERE yr = 1978
GROUP BY title
orDER BY COUNT(actorid) desc, title;

--? 15. List all the people who have worked with 'Art Garfunkel'.
SELECT name
FROM actor
  JOIN casting ON actor.id = actorid
WHERE movieid IN (
  SELECT movieid
  FROM casting
  WHERE actorid = (
    SELECT id
  FROM actor
  WHERE name = 'art garfunkel'
  )
)
  AND name <> 'Art Garfunkel';