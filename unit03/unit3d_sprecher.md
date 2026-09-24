**Before you start:** rename this file to `unit3d_lastname.md`, using your own last name. Watch the video and read `unit3d_Walkthrough.md`. Commit and push when you're done.

**Name:**

---

# Unit 3d — Types of Databases

Answer every question. No SQL today.

---

## While you watch the video

**1.** Fill in the table while you watch [7 Database Paradigms – Fireship](https://www.youtube.com/watch?v=W2Z7fbCLSTw).

| Type | One product he names | Good for |
|---|---|---|
| Key-value | Snapchat | Cachng, pub sub, leaderboards |
| Wide-column | Netflix | Time-Series, Historical records, High-write, low-read |
| Document | Game Data | Mobile Apps|
| Relational | Cockroach |Most applications|
| Graph | Air B&B| Graphs, Knowledge Graphs, Recommendation Engines |
| Full-text search | Solr | Search Engine.|
| Multi-model |Fauna | Everything |

---

## After the video

**2.** Key-value databases keep their data in memory. What does that make them good at? What can't you do with them?

**Answer:** The are very fast, but everything is stored on a system, making a limit


**3.** What is the downside of a document database, according to the video?

**Answer:** There aren't any joins and writing data is complex.


**4.** A relational database needs a join table to connect many things to many things. In a graph database, what does that job instead?

**Answer:** Nodes do that job with connected edges.


**5.** Name one relational database product from the video.

**Answer:** There isn't one exactlu specified, but he said that banks and financial institutions use them.


---

## Pick the database

**6.** For each client, pick the best type of database and give one reason. Use the "How to pick one" table in the walkthrough.

**Choose from:** Relational · Document · Graph · Key-value · Full-text search · Wide-column

| # | Client says… | Type | One reason |
|:-:|---|---|---|
| a | "We run a pharmacy. Every prescription must link to one patient and one doctor, and nothing can ever be out of sync." | Relational|Data is always matching, links other tables together with keys |
| b | "Our store sells 40,000 products. Shoes have sizes, laptops have RAM. Every category has different information." | Document | Its good for heaps of new info coming in constantly |
| c | "We want to suggest new friends: people who are friends with your friends." |Graph | Nodes connect other related data. Down the line new data would be suggested|
| d | "Our game needs a leaderboard. Scores change thousands of times a second." | Key-Value| Fast caching and lookups. Simple and easy for storing values|
| e | "Our website has 50,000 recipes, and people need to search them by any word." | Full-Text |You can search for results fast |
| f | "We have 10,000 weather sensors sending a reading every second." | Wide column| There is no real layout so you can adjust them accordingly.|

**7.** In 3a, the `teams` + `games` tables stored each team once and linked games to teams with `team_id`. Why is a relational database a good fit for NBA data?

**Answer:** It has multiple tables and data that sometimes doesnt go together, so it is easier to modify.


**8.** You're building an app for our school that keeps track of students, classes, and grades. Which type of database would you pick, and why? 

**Answer:** I would Pick a relational database so that I can keep track of records and update them without messing up other records.
