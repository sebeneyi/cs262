-- SINGLE TABLE QUERIES --
-- a --
SELECT *
FROM Game
ORDER BY time DESC;

-- b --
SELECT *
FROM Game
WHERE time >= '2020-10-11'
AND time < '2020-10-18';

-- c --
SELECT name
FROM Player
WHERE name IS NOT null;

-- d --
SELECT playerID
FROM PlayerGame
WHERE score > 2000;

-- e --
SELECT *
FROM Player
WHERE emailAddress LIKE '%gmail%';

-- MULTI-TABLE QUERIES --
-- a --
SELECT score
FROM PlayerGame, Player
WHERE PlayerGame.playerid = Player.id
AND Player.name = 'The King'
ORDER BY score DESC;

-- b --
SELECT Player.name, score
FROM Player, PlayerGame, Game
WHERE Game.time = '2006-06-28 13:20:00'
AND Game.ID = PlayerGame.gameID
AND PlayerGame.playerID = Player.ID
ORDER BY score DESC
LIMIT 1;

-- c --
-- Only allows the query to ouput the P1.name if P1.id number is less than P2.id --

-- d --
-- If you wanna do queries on the table itself like if you wanna compare things in the table itself --