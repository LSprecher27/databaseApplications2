**Before you start:** rename this file to `unit3b_lastname.md`, using your own last name. Read `unit3b_Walkthrough.md` first. Commit and push when you're done.

**Name:**

---

# Unit 3b — Keys and Relationships

## 1. Which key?

For each table, decide: is the primary key **natural** (a real-world value that already exists, like an email) or **surrogate** (a made-up ID number)? Is it **composite** (more than one column)?

| Table | Primary key | Natural or surrogate? | Composite? |
|---|---|:-:|:-:|
| `teams` in `nba_5seasons.db` | `team_id` | `surrogate` |`no` |
| `player_season_stats` in `nba_5seasons.db` | `player_id`| `surrogate`| `no`|
| A US state table | `state_abbrev` (OH, MI, PA…) | `natural`| `no`|
| The school's student records | `student_id` | `surrogate`| `no`|

**a.** The school could use a student's full name as the primary key instead of `student_id`. Give one reason that's a bad idea.

**Answer:** There could be more than one Student with the same first and last name


## 2. What a foreign key promises

**b.** In `denormalized_demo.db`, `games.home_team_id` is a foreign key to `teams.team_id`. If someone tries to insert a game with `home_team_id = 99` and there is no team 99, what should the database do? What is that rule called?

**Answer:** It should call back an error; this is called data integrity


**c.** If team 6 were deleted from `teams`, what should happen to its rows in `games`? Name two different choices a designer could make.

**Answer:**
The rows would have to be deleted too. There should be a team ID so that doesn't happen

## 3. Sort the relationships

**Choose from:** One-to-one · One-to-many · Many-to-many

| # | Relationship | Type |
|:-:|---|---|
| 1 | One team → its games this season | `One to many` |
| 2 | Students ↔ the courses they're enrolled in | `many to one or many`|
| 3 | A person → their Social Security number | one to one|
| 4 | A customer → their orders | `one to many`|
| 5 | Movies ↔ the actors in them | `one to many` |
| 6 | A country → its capital city | `one to one` |

**d.** Pick either many-to-many row. Relational databases can't store a many-to-many directly. What table do you add, and what columns does it need?

**Answer:** In the third row, the entity would need a person ID 


**e.** Not every database uses tables and keys. In a **graph** database (like the one behind Instagram's follow list), the same "who follows whom" relationship is stored as what two things? In a **key-value** store, how is a relationship handled?

**Answer:** The relation ship is stored through a network of nodes that are connected to eachother.


## 4. Your first ER diagram

Here is the `denormalized_demo.db` fixed version as a Mermaid diagram. It already renders — push and look at it on GitHub or preview it in VS Code.

```mermaid
erDiagram
    CUSTOMER ||--|{ ORDER_ITEM : "orders"
    CUSTOMER ||--|{ CHECK : "receives"
    CHECK ||--|{ ORDER_ITEM : "includes"

    CUSTOMER {
        int customer_id PK
        string name
        boolean is_annoying
    }

    ORDER_ITEM {
        int item_id PK
        int customer_id FK
        int check_id FK
        string item_name
        decimal price
    }

    CHECK {
        int check_id PK
        int customer_id FK
        decimal total_amount
        string status
    }
```

**Now make your own, using AI.** Follow the four steps in the walkthrough: plan it, prompt the AI, proof it, test it. A school schedule has these entities: **STUDENTS**, **COURSES**, **TEACHERS**, and an **ENROLLMENTS** junction table. Rules:

- One teacher teaches many courses; each course has one teacher.
- Students take many courses; courses have many students. (That's what ENROLLMENTS is for.)

Give every entity a primary key and at least two attributes. Mark the foreign keys.



**Paste the prompt you gave the AI.** If you used a PowerPoint picture, add the picture to your repo too.

```text
 Generate me a 3 table er diagram for restaurant seperate checks featuring a customer, orderitem, and check entity.
```

**f.** Which entity has two foreign keys? What should its primary key be?

**Answer:** Order item which has customer_id and check_id. Its primary key should be item_id.


**g.** What did you have to fix in the AI's diagram? If you didn't change anything, what did you check to make sure it was right?

**Answer:** 
It made the chart way to complicated so I told it to simplify down to just the customers experience rather than restaraunt wide.

## Closing 3b — Vocabulary

| Term | Your definition |
|---|---|
| Entity | A container with rows and fields |
| Attribute | Data points within an entity |
| Natural key | A key that uses an items actual name|
| Surrogate key | A key that uses a text value for an ID|
| Composite key | Two columns concatinated together |
| Referential integrity | Ensuring that the data being entered is clean and will not break the database|
| Junction table | Database used to make many to many relationships between two tables|
| Cardinality |How two databases connect  |

**Partner check:** trade files. Read your partner's Mermaid code out loud, one relationship line at a time, as English ("one teacher, many courses"). If it doesn't read right, one of you has the crow's foot on the wrong end.