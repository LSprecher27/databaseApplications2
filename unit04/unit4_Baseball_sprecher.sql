-- =====================================================================
-- Unit 4 — Build and Fill Your Database
-- Client: Baseball
-- Database Applications Development · MCCC
--
-- Rename this file unit4_lastname.sql before you start.
-- Use unit4_Baseball_Data.xlsx for the columns, keys, and data rows.
--
-- Name: Luke Sprecher
-- =====================================================================


-- =====================================================================
-- PART 1 — DROP the tables (last table first)
-- Order: batting, players, teams, divisions
-- =====================================================================
DROP TABLE IF EXISTS batting;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS divisions;



-- =====================================================================
-- PART 2 — CREATE the tables (in this order)
-- Put a comment above each table:  -- tablename: one row = ...
-- Add at least two CHECK rules of your own.
-- =====================================================================

-- divisions

CREATE TABLE divisions (
	division TEXT PRIMARY KEY,
	league TEXT NOT NULL
);


-- teams

CREATE TABLE teams (
	team_id TEXT PRIMARY KEY,
	team_name TEXT NOT NULL,
	ballpark TEXT,
	division TEXT NOT NULL,
	FOREIGN KEY (division) REFERENCES divisions(division)
);


-- players

CREATE TABLE players (
	player_id TEXT PRIMARY KEY,
	player_name TEXT NOT NULL,
	bats TEXT,
	throws TEXT,
	birth_country TEXT,
	birth_year INTEGER,
	CHECK (birth_year >= 1800 AND birth_year <= 2100),
    CHECK (length(bats) = 1)
);



-- batting
CREATE TABLE batting (
	player_id TEXT,
	team_id TEXT,
	games INTEGER,
	at_bats INTEGER,
	runs INTEGER,
	hits INTEGER,
	home_runs INTEGER,
	rbi INTEGER,
	stolen_bases INTEGER,
	PRIMARY KEY (player_id, team_id),
	FOREIGN KEY (player_id) REFERENCES players(player_id),
	FOREIGN KEY (team_id) REFERENCES teams(team_id)
);



-- =====================================================================
-- PART 3 — INSERT the four rows for each table (same order as Part 2)
-- =====================================================================

-- divisions
INSERT INTO divisions (division, league)
	VALUES ('AL Central', 'American League'),
		   ('AL East', 'American League'),
		   ('NL Central', 'National League'),
		   ('NL West', 'National League');

	


-- teams
INSERT INTO teams (team_id, team_name, ballpark, division)
	VALUES ('CLE', 'Cleveland Guardians', 'Progressive Field', 'AL Central'),
		   ('NYY', 'New York Yankees', 'Yankee Stadium', 'AL East'),
		   ('CIN', 'Cincinnati Reds', 'Great American Ball Park', 'NL Central'),
		   ('LAD', 'Los Angeles Dodgers', 'Dodger Stadium', 'NL West');


-- players
INSERT INTO players (player_id, player_name, bats, throws, birth_country, birth_year)
	VALUES ('ramirjo01', 'Jose Ramirez', 'B', 'R', 'D.R.', 1992),
		   ('judgeaa01', 'Aaron Judge', 'R', 'R', 'USA', 1992),
		   ('delacel01', 'Elly De La Cruz', 'B', 'R', 'D.R.', 2002),
		   ('ohtansh01', 'Shohei Ohtani', 'L', 'R', 'Japan', 1994);


-- batting
INSERT INTO batting (player_id, team_id, games, at_bats, runs, hits, home_runs, rbi, stolen_bases)
	VALUES ('ramirjo01', 'CLE', 158, 593, 103, 168, 30, 85, 44),
		   ('judgeaa01', 'NYY', 152, 541, 137, 179, 53, 114, 12),
		   ('delacel01', 'CIN', 162, 629, 102, 166, 22, 86, 37),
		   ('ohtansh01', 'LAD', 158, 611, 146, 172, 55, 102, 20);



-- =====================================================================
-- PART 4 — CHECK YOUR WORK: SELECT * FROM each table
-- =====================================================================



-- Run the whole script twice. No errors both times?
-- Write Changes, then commit this file and your .db file. I fixed some missing commas in the batting table, then it ran perfectly fine

