-- =====================================================================
-- Unit 2d — Counting and Summarizing
-- Database Applications Development · MCCC
--
-- Database: nba_5seasons.db · Tables: teams, players, team_game_stats
--
-- Rename this file with your last name before you start.
--
-- Read unit2d_Walkthrough.md first. Stuck on syntax? See unit2_StudyGuide.md.
-- =====================================================================


-- 1. How many teams are in the database?
SELECT COUNT(full_name) AS teamsCount
FROM teams;
-- There are 30 teams

-- 2. How many players?
SELECT COUNT(player_id) AS plCount
FROM players;

-- There are 1029 players


-- 3. What is the earliest founding year of any team?
SELECT MIN(year_founded) as earliest
FROM teams;

-- The earliest founding was 1946


-- 4. What is the most recent?
SELECT MAX(year_founded) AS recent
FROM teams;

-- The most recent was 2002


-- 5. What is the average founding year, rounded to a whole number?
SELECT ROUND(AVG(year_founded)) avgYearFounded
FROM teams;
--The average was 1970


-- 6. What is the total number of points scored across every game in
--    the database?
SELECT SUM(pts) AS sumPTS
FROM team_game_stats;
-- Total points is 1399607


-- =====================================================================
-- CHECK YOUR WORK
-- =====================================================================

-- Query 6 reads 10,842 rows and gives you one number. What is it?
-- The sum of all points scored in all recorded games

-- COUNT(*) counts rows. What does COUNT(birth_year) count instead?
-- The amount of birthyears recorded

-- =====================================================================
-- VOCABULARY — your words, not the reference sheet's
-- =====================================================================

-- Aggregate function: A function that reads rows and returns a value based on its function.