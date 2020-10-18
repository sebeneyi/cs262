--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY,
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY,
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	score integer
	);

CREATE TABLE PlayerCash (
	playerID integer REFERENCES Player(ID),
	cash integer
);

CREATE TABLE Properties (
	playerID integer REFERENCES Player(ID),
	ID integer PRIMARY KEY
);

CREATE TABLE Houses (
	propertyID integer REFERENCES Properties(ID),
	houses integer
);

CREATE TABLE Hotels (
	propertyID integer REFERENCES Properties(ID),
	hotels integer
);

CREATE TABLE CurrentLocation (
	playerID integer REFERENCES Player(ID),
	currentLocation integer
);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON PlayerCash TO PUBLIC;
GRANT SELECT ON Properties TO PUBLIC;
GRANT SELECT ON Houses TO PUBLIC;
GRANT SELECT ON Hotels TO PUBLIC;
GRANT SELECT ON CurrentLocation TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO PlayerGame VALUES (1, 1, 0.00);
INSERT INTO PlayerGame VALUES (1, 2, 0.00);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00);
INSERT INTO PlayerGame VALUES (2, 2, 0.00);
INSERT INTO PlayerGame VALUES (2, 3, 500.00);
INSERT INTO PlayerGame VALUES (3, 2, 0.00);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00);

INSERT INTO PlayerCash VALUES (1, 200);
INSERT INTO PlayerCash VALUES (2, 10);
INSERT INTO PlayerCash VALUES (3, 89);

INSERT INTO Properties VALUES (1, 1);
INSERT INTO Properties VALUES (1, 2);
INSERT INTO Properties VALUES (2, 3);
INSERT INTO Properties VALUES (2, 4);
INSERT INTO Properties VALUES (3, 5);
INSERT INTO Properties VALUES (3, 6);

INSERT INTO Houses VALUES (1, 0);
INSERT INTO Houses VALUES (3, 8);
INSERT INTO Houses VALUES (5, 2);

INSERT INTO Hotels VALUES (2, 3);
INSERT INTO Hotels VALUES (4, 0);
INSERT INTO Hotels VALUES (6, 3);

INSERT INTO CurrentLocation VALUES (1, 0);
INSERT INTO CurrentLocation VALUES (2, 5);
INSERT INTO CurrentLocation VALUES (3, 8);