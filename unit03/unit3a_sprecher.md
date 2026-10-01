**Before you start:** rename this file to `unit3a_lastname.md`, using your own last name. Read `unit3a_Walkthrough.md` first. Commit and push when you're done.

**Name:** Luke Sprecher

---

# Unit 3a — Redundancy

Open **`denormalized_demo.db`** in DB Browser for SQLite. The walkthrough used the **Cleveland Cavaliers**. In this task you do the same work for the **Chicago Bulls**.

The 30 teams, cities, states, conferences, and divisions are real. The games and scores are made up.

## 1. Count the repeats

Use the **Execute SQL** tab. You know enough SQL from Unit 2 for all of these. Paste each query you run into the code block under the question.

**a.** How many rows are in `games_flat`?

```sql
SELECT COUNT(*) 
FROM games_flat;
```

**Answer:** 260


**b.** How many rows have `home_city = 'Chicago'`? How many have `away_city = 'Chicago'`?

```sql
SELECT COUNT(*) 
FROM games_flat
WHERE home_city = 'Chicago';

SELECT COUNT(*) 
FROM games_flat
WHERE away_city = 'Chicago';
```

**Answer:** 34 both 16 home 18 away


**c.** So how many times is the fact any team "plays in Chicago, Illinois" typed into this table?

**Answer:** 16 times


## 2. Find the mistakes

There are **8** mistakes planted in `games_flat`. Two of them are the Cavaliers mistakes from the walkthrough. Find all 8.

Run `SELECT DISTINCT` on each of these six columns: `home_team`, `away_team`, `home_city`, `away_city`, `home_state`, `away_state`. Add `ORDER BY` so the list is sorted.

What each list should have if nothing is wrong:

- **Team names:** 30.
- **Cities:** 29. The Clippers and the Lakers both play in Los Angeles.
- **States:** 23. Toronto is in Ontario, and Washington is in District of Columbia, so those count too.

If a list has more than that, something in it is wrong. Once you find a wrong value, use `WHERE` to get its `game_id`.

| # | game_id | Which column | What it says | What it should say |
|---|---|---|---|---|
| 1 | 62 | home_team| Clevland Cavaliers|Cleveland Cavaliers |
| 2 | 247|home_team |Chicago Buls | Chicago Bulls|
| 3 |206 |away_team |Chicago Bull | Chicago Bulls|
| 4 |108	 | away_team| Pheonix Suns	|Phoenix Suns |
| 5 |202 |home_city |Philidelphia |Philadelphia |
| 6 |241 | home_state|IL |Illinois |
| 7 |257 |away_state |TX |Texas |
| 8 | 103|away_state |OH |Ohio |

**d.** Write a query that counts every Bulls game by **team name** (home or away). Compare your count to your city count from **b**. Which count is right, and why are they different?

```sql
SELECT COUNT(*)
FROM games_flat
WHERE home_team = 'Chicago Bulls' OR away_team = 'Chicago Bulls';
```

**Answer:** There are 32 rows, which varies from the original. The one we had before was correct, they had just misspelled names then they didn't pop up.


## 3. Spot the anomalies in a new table

A school keeps its class schedule in one table, `class_schedule`:

| student | course | period | teacher | room |
|---|---|---|---|---|
| Ava Brooks | Web Design | 1 | Mr. Grant | 214 |
| Ava Brooks | Algebra II | 2 | Ms. Ortiz | 108 |
| Liam Chen | Web Design | 1 | Mr. Grant | 214 |
| Liam Chen | Chemistry | 3 | Mrs. Hall | 122 |
| Noah Diaz | Web Design | 1 | Mr. Grant | 214 |
| Noah Diaz | Algebra II | 2 | Ms. Ortiz | 108 |
| Emma Fox | Art I | 4 | Mr. Kerr | 301 |

For each scenario, name the anomaly (**update**, **insert**, or **delete**) and explain what goes wrong.

**Scenario A** — Emma Fox drops Art I, so her Art I row is deleted.

**Which anomaly:** Delete

**What goes wrong:** Mr Kerr gets deleted too


**Scenario B** — The school hires a new teacher, Ms. Reyes, who will use Room 205. She has no students yet.

**Which anomaly:** Insert

**What goes wrong:** Teacher doesn't have enough data to be inserted


**Scenario C** — Mr. Grant moves from Room 214 to Room 220. How many rows have to change, and what happens if you miss one?

**Which anomaly:** Update

**What goes wrong:** The rows would have to change causing a conflict of data


**e.** In `denormalized_demo.db`, team facts (city, state, conference, division) were moved into their own table, `teams`. Which facts in `class_schedule` should be moved into their own table the same way?

**Answer:** The studemts, removes data redundancy making the teachers only having to be displayed once


## Closing 3a — Vocabulary

Your words, not the slide's.

| Term | Your definition |
|---|---|
| Redundancy |Something showing up multiple times |
| Update anomaly |Changing things in multiple areas leading to issues in a database |
| Insert anomaly |Adding something to a file without enough data to keep it |
| Delete anomaly |Deleting something that accidentally removes other data too |
| Normalization | Fixing datasets and removing redundancy |

