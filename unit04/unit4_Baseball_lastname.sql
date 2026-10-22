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
CREATE TABLE players (
	player_id TEXT PRIMARY KEY,
	player_name TEXT NOT NULL,
	bats TEXT,
	throws TEXT,
	birth_country TEXT,
	birth_year INTEGER,
	CHECK (length(birth_year) = 4)
);
	


-- teams



-- players



-- batting




-- =====================================================================
-- PART 3 — INSERT the four rows for each table (same order as Part 2)
-- =====================================================================

-- divisions



-- teams



-- players



-- batting




-- =====================================================================
-- PART 4 — CHECK YOUR WORK: SELECT * FROM each table
-- =====================================================================



-- Run the whole script twice. No errors both times?
-- Write Changes, then commit this file and your .db file.
