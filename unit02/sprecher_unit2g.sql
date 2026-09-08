-- =====================================================================
-- Unit 2g — Keeping the Unmatched Rows
-- Database Applications Development · MCCC
--
-- Databases: nba_5seasons.db for 1-3, movies_small.db for 4-5
--
-- Rename this file with your last name before you start.
--
-- Read unit2g_Walkthrough.md first. Stuck on syntax? See unit2_StudyGuide.md.
-- =====================================================================


-- 1. Using an INNER JOIN, count how many players have stats for the
--    2025-26 season.
FROM players p
JOIN player_season_stats s
  ON s.player_id = p.player_id AND s.season = '2025-26';

-- 2. Using a LEFT JOIN from players, count how many rows you get for
--    the same thing.
FROM players p
LEFT JOIN player_season_stats s
  ON s.player_id = p.player_id AND s.season = '2025-26';

-- 3. List the names of players who have no 2025-26 season stats.
SELECT p.full_name
FROM   players p
LEFT JOIN player_season_stats s
  ON s.player_id = p.player_id AND s.season = '2025-26'
WHERE  s.player_id IS NULL;

-- 4. In movies_small.db, count how many rows in roles have no
--    character name recorded.
SELECT COUNT(role)
FROM roles
WHERE character IS NULL;

-- 5. Show ten people from movies_small.db who have no birth year
--    recorded.
SELECT name, birth_year
FROM people 
WHERE birth_year IS NULL
LIMIT 10;

-- 6. Pick any query from this unit you found interesting, run it, and
--    export the results to CSV. Name the file
--    unit2_report_lastname.csv and commit it alongside this file.
SELECT m.title, r.avg_rating, r.num_votes
FROM movies m 
JOIN ratings r ON m.movie_id = r.movie_id
ORDER BY num_votes DESC
LIMIT 10;


-- =====================================================================
-- CHECK YOUR WORK
-- =====================================================================

-- Queries 1 and 2 return different numbers. What are they, and what
-- does the difference represent?
-- 1 is players that have stats in that season while 2 is players that do not have stats in that season (25-26).

-- In query 3 you filtered with IS NULL. Which table did that NULL
-- come from, and why is it NULL?
-- The null value came from player_season_stats and its null becayse the players did not play that season


-- =====================================================================
-- VOCABULARY — your words, not the reference sheet's
-- =====================================================================

-- LEFT JOIN: Left join only matches with what you have instead of an inner join where it just searches everywhere for what matches.


-- Export: Taking the data out in a certain format and saving it