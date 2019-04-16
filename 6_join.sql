--? 1. The first example shows the goal scored BY a player with the last name 'Bender'. The * says to list all the columns IN the table - a shorter way of saying matchid, teamid, player, gtime
-- Modify it to show the matchid AND player name for all goals scored BY Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid, player
FROM goal
WHERE teamid LIKE 'ger'

--? 2. From the previous query you can see that Lars Bender's scored a goal IN game 1012. Now we want to know what teams were playing IN that match. Notice IN the that the column matchid IN the goal table corresponds to the id column IN the game table. We can look up information about game 1012 BY finding that row IN the game table. Show id, stadium, team1, team2 for just game 1012
SELECT id, stadium, team1, team2
FROM game
WHERE id = 1012

--? 3. You can combine the two steps into a single query with a JOIN.
-- SELECT *
--   FROM game JOIN goal ON (id=matchid)

-- The FROM clause says to merge data FROM the goal table with that FROM the game table. The ON says how to figure out which rows IN game go with which rows IN goal - the matchid FROM goal must match id FROM game. (If we wanted to be more clear/specific we could say
-- ON (game.id=goal.matchid)

-- The code below shows the player (FROM the goal) AND stadium name (FROM the game table) for every goal scored.

-- Modify it to show the player, teamid, stadium AND mdate for every German goal.

SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'ger'

--? 4. Use the same JOIN as IN the previous question. Show the team1, team2 AND player for every goal scored BY a player called Mario player LIKE 'Mario%'
SELECT team1, team2, player
FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'

--? 5. The table eteam gives details of every national team including the coach. You can JOIN goal to eteam using the phrase goal JOIN eteam ON teamid=id Show player, teamid, coach, gtime for all goals scored IN the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON teamid=id
WHERE gtime <= 10

--? 6. To JOIN game with eteam you could use either game JOIN eteam ON (team1=eteam.id) OR game JOIN eteam ON (team2=eteam.id) Notice that because id is a column name IN both game AND eteam you must specify eteam.id instead of just id List the the dates of the matches AND the name of the team IN which 'Fernando Santos' was the team1 coach.
SELECT mdate, teamname
FROM game JOIN eteam ON team1=eteam.id
WHERE coach = 'fernando santos'

--? 7. List the player for every goal scored IN a game WHERE the stadium was 'National Stadium, Warsaw'
SELECT player
FROM goal JOIN game ON matchid=id
WHERE stadium = 'National Stadium, warsaw'

--? 8. The example query shows all goals scored IN the Germany-Greece quarterfinal. Instead show the name of all players who scored a goal against Germany.
SELECT distinct player
FROM game JOIN goal ON matchid = id
WHERE teamid!='ger'
  AND 'ger' IN (team1, team2)

--? 9. Show teamname AND the total number of goals scored.
SELECT teamname, COUNT(*)
FROM eteam JOIN goal ON id=teamid
Group BY teamname


--? 10. Show the stadium AND the number of goals scored IN each stadium.
SELECT stadium, COUNT(*)
FROM game JOIN goal ON id=matchid
GROUP BY stadium

--? 11. For every match involving 'POL', show the matchid, date AND the number of goals scored.
SELECT game.id, game.mdate, COUNT(*)
FROM game
  JOIN goal
  ON game.id = goal.matchid
WHERE 'pol' IN (game.team1, game.team2)
GROUP BY game.id, game.mdate

--? 12. For every match WHERE 'GER' scored, show matchid, match date AND the number of goals scored BY 'GER'
SELECT goal.matchid, game.mdate, COUNT(*)
FROM goal JOIN game ON matchid=id
WHERE 'ger' IN (game.team1, game.team2)
  AND goal.teamid = 'ger'
GROUP BY goal.matchid, game.mdate

--? 13. List every match with the goals scored BY each team as shown. This will use "CASE WHEN" which has not been explained IN any previous exercises.
SELECT game.mdate,
  game.team1,
  SUM(CASE
    WHEN goal.teamid = game.team1 THEN 1
    ELSE 0
  END) AS score1,
  game.team2,
  SUM(CASE
    WHEN goal.teamid = game.team2 THEN 1
    ELSE 0
  END) AS score2
FROM game
  JOIN goal ON (game.id = goal.matchid)
GROUP BY game.mdate,team1, team2
ORDER BY game.mdate, goal.matchid, team1, team2