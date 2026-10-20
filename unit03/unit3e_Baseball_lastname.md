**Before you start:** rename this file to `unit3e_Baseball_lastname.md`, using your own last name. Read `unit3e_Walkthrough.md` and `unit3e_Baseball_Client.md` first. Commit and push when you're done.

**Name:** Connor

**Partner(s):** Luke

---

# Unit 3e — Design a Database for a Client: Baseball Stats Website

Both partners turn in the same design.

**Something we disagreed on, and how we settled it:**


**Link to our Google Sheet (or the file name if you committed the xlsx):**
unit3e_Baseball.xlsx

## 1. The client's spreadsheet

Look at the `Client_Export` tab.

**a.** Which column breaks 1NF? Which 1NF rule does it break?

**Answer:** bat_throws. Each cell must hold one value.


**b.** How many rows say "Cleveland Guardians" and "Progressive Field"? If the Guardians moved to a new ballpark, what would you have to do? What is that problem called?

**Answer:** 9 rows say Cleveland Guardians, and Progressive Field has 10. if the team moved, I'd change the ballpark in all 10 rows. That is an update anomaly


**c.** Can `player_name` be the primary key of a players table? Use the data to explain why not. What should the key be instead?

**Answer:** No, because names aren't unique. Two differnt players are named Max Muncy, so the key should be player_id


## 2. First normal form

On the `1NF` tab, split `bats_throws` into `bats` and `throws` (Data → Split text to columns, separator `/`).

**d.** Why is one value per cell better here? Name a question you couldn't easily answer before the split.

**Answer:** Each hand becomes its own column, so you can filter and count by it.


**e.** What is the primary key of the 1NF table? Why isn't `player_id` alone enough? (Hint: find a player who was traded.)

**Answer:** The key is player_id, and team_id.


## 3. Second normal form — the whole key

For each column, check what it depends on: the player, the team, or both. Use your 1NF key from **e**.

| Column | Depends on the player? | Depends on the team? | Needs the whole key? |
|---|:-:|:-:|:-:|
| `birth_country` | Yes | No | No |
| `ballpark` | No | Yes | No |
| `home_runs` | Yes | Yes | Yes |
| `games` | Yes | Yes | Yes |

**f.** What is it called when a column depends on only part of the key? Which tables did you move those columns into?

**Answer:** A partial dependency.


## 4. Third normal form — nothing but the key

**g.** In your TEAMS table, `league` depends on something other than the team. What does it depend on? What is that problem called?

**Answer:** It depends on division, not on the team. That is called a transitive dependency


**h.** How did you fix it?

**Answer:**


## 5. The client's mistakes

When you used Remove duplicates, two tables had one row too many. Find both mistakes.

| Table | What was wrong | What we kept |
|---|---|---|
| | | |
| | | |

**i.** Why would these mistakes be impossible in your finished design?

**Answer:**


## 6. Our tables

For each table, list every column and mark keys as `(PK)`, `(FK)`, or `(PK, FK)`. Give the number of rows your table has in the Sheet.

| Table | Columns | Rows |
|---|---|:-:|
| PLAYERS | | |
| TEAMS | | |
| DIVISIONS | | |
| BATTING | | |

**j.** Fill in the relationships. **Choose from:** one-to-one · one-to-many · many-to-many

| Relationship | Type | Where is the foreign key? |
|---|---|---|
| DIVISIONS → TEAMS | | |
| PLAYERS ↔ TEAMS | | |

**k.** Which table is the junction table? What is its primary key? What extra data does it hold that isn't a key?

**Answer:**


## 7. ER diagram (AI writes the code)

Give your tables to AI and have it write the Mermaid code. Proof it and test it on mermaid.live. Then paste it here.

```mermaid
erDiagram
    %% replace this comment with your diagram

```

**Paste the prompt you gave the AI:**

```text

```

**l.** What did you have to fix in the AI's diagram? If nothing, what did you check?

**Answer:**


## 8. Check your design

- [ ] Every table has a primary key
- [ ] Every many-to-many goes through a junction table
- [ ] No cell holds more than one value
- [ ] No fact is stored in two places
- [ ] Every foreign key points at a primary key in another one of our tables

**Which normal form does your design reach, and how do you know?**

**Answer:**


## Swap

Trade with a **different** pair. Run their design through the checklist in Part 8. Write one specific thing you'd change about theirs.

**Their names:**

**Feedback for the other pair:**
