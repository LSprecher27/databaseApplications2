-- =====================================================================
-- Unit 2f — Joining Two Tables
-- Database Applications Development · MCCC
--
-- Databases: movies_small.db for 1-3, nba_5seasons.db for 4-6
-- Note above each query which database it uses.
--
-- Rename this file with your last name before you start.
--
-- Read unit2f_Walkthrough.md first. Stuck on syntax? See unit2_StudyGuide.md.
-- =====================================================================


-- 1. Show every movie's title alongside its average rating.
--Movie Database
SELECT m.title, r.avg_rating
FROM movies m 
JOIN ratings r ON m.movie_id = r.movie_id;


-- 2. Show the ten most-voted movies: title, average rating, and
--    number of votes.
--Movie Database
SELECT m.title, r.avg_rating, r.num_votes
FROM movies m 
JOIN ratings r ON m.movie_id = r.movie_id
ORDER BY num_votes DESC
LIMIT 10;

-- 3. Show movies rated above 8.5: title, release year, and rating,
--    highest rated first.
--Movie Database
SELECT m.title, r.avg_rating, m.release_year
FROM movies m 
JOIN ratings r ON m.movie_id = r.movie_id
WHERE avg_rating > 8.5
ORDER BY avg_rating DESC;

-- 4. Show the game date, team name, and points for the first 20 rows
--    of team_game_stats.
--NBA
SELECT g.game_date, t.full_name, g.pts
FROM team_game_stats g 
JOIN teams t ON t.team_id = g.team_id
LIMIT 20;


-- 5. Show the ten highest-scoring player seasons: player name,
--    season, and points.
SELECT p.full_name, s.pts, s.season
FROM player_season_stats s
JOIN players p ON p.player_id = s.player_id
ORDER BY s.pts	DESC
LIMIT 10;

-- 6. For the 2024-25 season, show the ten highest-scoring players
--    with their name, their team's name, and their points.
--    (Three tables.)
SELECT s.pts, p.full_name, t.full_name
FROM player_season_stats s
JOIN players p ON p.player_id = s.player_id
JOIN teams t ON s.team_id = t.team_id
WHERE season = '2024-25'
ORDER BY s.pts DESC
LIMIT 10;

-- =====================================================================
-- CHECK YOUR WORK
-- =====================================================================

-- Query 1 returns 2,659 rows — the same as the number of movies.
-- What does that tell you about the relationship between movies and
-- ratings?
-- This means each movie has a rating


-- In query 6, which table sits in the middle connecting the other two?
-- player_season_stats


-- =====================================================================
-- VOCABULARY — your words, not the reference sheet's
-- =====================================================================

-- Join: Bringing together two tables using keys


-- INNER JOIN: Only keeps the rows that match on both sides


-- Table alias: A way to rename and reference tables throughout a query.