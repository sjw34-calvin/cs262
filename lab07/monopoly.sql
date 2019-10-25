--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author Sameer Mall for KvLinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS House;
DROP TABLE IF EXISTS Hotel;



-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp,
	start_time timestamp, 
	stop timestamp 
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer,
	cash integer,
	PieceLocation varchar(50)
	);

CREATE TABLE Hotel (
	ID integer PRIMARY KEY
	);

CREATE TABLE House (
	ID integer PRIMARY KEY
	);

CREATE TABLE Property (
	ID integer PRIMARY KEY,
	name varchar(50),
	houseID integer REFERENCES House(ID),
	hotelID integer REFERENCES Hotel(ID)
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON Hotel TO PUBLIC;
GRANT SELECT ON House TO PUBLIC;


-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO PlayerGame VALUES (1, 1, 0.00, 150, 'Test location');
INSERT INTO PlayerGame VALUES (1, 2, 0.00, 220, 'Test location 2');
INSERT INTO PlayerGame VALUES (1, 3, 2350.00, 12, 'Board Walk');
INSERT INTO PlayerGame VALUES (2, 1, 1000.00, 10, 'Cheap location idk');
INSERT INTO PlayerGame VALUES (2, 2, 200, 10.00, 1);
INSERT INTO PlayerGame VALUES (2, 2, 500.00);
INSERT INTO PlayerGame VALUES (3, 2, 25.00);
-- INSERT INTO PlayerGame VALUES (3, 3, 5500.00);there



