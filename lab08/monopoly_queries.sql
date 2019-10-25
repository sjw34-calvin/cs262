-- Sameer Mall
-- CS 262 Lab 08

-- Exercise 8.1 Single-Table Queries in PostgreSQL

-- a
-- SELECT *
-- FROM Game
-- ORDER BY time DESC;

-- b
-- SELECT *
-- FROM Game
-- WHERE time > CURRENT_DATE - 7

-- c
-- SELECT * 
-- FROM Player 
-- WHERE name IS NOT NULL;

-- d
-- SELECT *
-- FROM PlayerGame
-- WHERE score > 2000;

-- e
-- SELECT *
-- FROM Player
-- WHERE emailAddress LIKE '%@gmail.com%';

-- Exercise 8.2 Multiple-Table Queries in PostgreSQL

-- a 
-- SELECT PlayerGame.score 
-- FROM Player, PlayerGame
-- Where Player.ID = PlayerGame.playerID
-- And Player.name = 'The King'
-- ORDER BY PlayerGame.score DESC; 

-- b 
-- SELECT Player.name
-- FROM PlayerGame, Player, Game
-- WHERE Game.time = '2006-06-28 13:20:00'
-- AND PlayerGame.gameID = Game.ID
-- AND PlayerGame.playerID = Player.ID
-- ORDER BY PlayerGame.score DESC LIMIT 1; 

-- c 
-- Because we are checking to see if player 1 and player 2 the last line will return the player with the lower ID. 

-- d 
-- There are many scenarios to use a self join, but its used when the data you are using needs 
-- to reference the data in its own table. An example is a child-parent relationship within a table. 

