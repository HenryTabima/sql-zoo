--? 1. You want to find the stadium WHERE player 'Dimitris Salpingidis' scored. SELECT the JOIN condition to use:
--* answer:
game JOIN goal ON (id=matchid)

--? 2. You JOIN the tables goal AND eteam IN an SQL statement. Indicate the list of column names that may be used IN the SELECT line:
--* answer:
-- matchid, teamid, player, gtime, id, teamname, coach

--? 3. SELECT the code which shows players, their team AND the amount of goals they scored against Greece (GRE).
--* answer:
SELECT player, teamid, COUNT(*)
FROM game JOIN goal ON matchid = id
WHERE (team1 = "GRE" OR team2 = "GRE")
  AND teamid != 'GRE'
GROUP BY player, teamid

--? 4. SELECT the result that would be obtained FROM this code:
SELECT DISTINCT teamid, mdate
FROM goal JOIN game ON (matchid=id)
WHERE mdate = '9 June 2012'
--* answer:
-- DEN	9 June 2012
-- GER	9 June 2012

--? 5. SELECT the code which would show the player AND their team for those who have scored against PolAND (POL) IN National Stadium, Warsaw.
--* answer:
SELECT DISTINCT player, teamid
FROM game JOIN goal ON matchid = id
WHERE stadium = 'National Stadium, Warsaw'
  AND (team1 = 'POL' OR team2 = 'POL')
  AND teamid != 'POL'

--? 6. SELECT the code which shows the player, their team AND the time they scored, for players who have played IN Stadion Miejski (Wroclaw) but NOT against Italy (ITA).
--* answer:
SELECT DISTINCT player, teamid, gtime
FROM game JOIN goal ON matchid = id
WHERE stadium = 'Stadion Miejski (Wroclaw)'
  AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))

--? 7. SELECT the result that would be obtained FROM this code:
SELECT teamname, COUNT(*)
FROM eteam JOIN goal ON teamid = id
GROUP BY teamname
HAVING COUNT(*) < 3
--* answer:
-- NetherlANDs	        2
-- PolAND               2
-- Republic of IrelAND	1
-- Ukraine	            2