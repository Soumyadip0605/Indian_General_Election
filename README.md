<h1 align="center">🗳️ Indian General Election 2024</h1>
<h3 align="center">End-to-End SQL Data Analysis · PostgreSQL</h3>

<p align="center">
  <img src="https://img.shields.io/badge/PostgreSQL-16-336791?style=for-the-badge&logo=postgresql&logoColor=white"/>
  <img src="https://img.shields.io/badge/SQL-Analysis-orange?style=for-the-badge&logo=databricks&logoColor=white"/>
  <img src="https://img.shields.io/badge/pgAdmin-4-336791?style=for-the-badge&logo=postgresql&logoColor=white"/>
  <img src="https://img.shields.io/badge/Status-Complete-brightgreen?style=for-the-badge"/>
</p>

<p align="center">
  <strong>543 Constituencies &nbsp;·&nbsp; 36 States & UTs &nbsp;·&nbsp; 3 Political Alliances &nbsp;·&nbsp; 10 Analytical Queries</strong>
</p>

---

## 📖 About The Project

India's 2024 Lok Sabha election was one of the **largest democratic exercises in human history** — 960 million eligible voters, 543 parliamentary seats, and thousands of candidates competing across a country of 1.4 billion people.

This project builds a **fully normalised PostgreSQL relational database** from raw election result CSVs and answers 10 real-world electoral questions using pure SQL — no Python, no BI tool, no shortcuts.

From national alliance seat totals to individual candidate EVM vs postal vote breakdowns, every insight is derived through schema design, multi-table joins, conditional aggregations, and correlated subqueries.

<p align="center"><img width="1280" height="720" alt="main gif" src="https://github.com/user-attachments/assets/a1ca0190-2be8-4b77-b1bc-1e1699b0ba48" />


> **Who is this for?** Anyone who wants to see what structured SQL analysis looks like on a rich, real-world political dataset — and hiring reviewers evaluating SQL/data skills.

---

## 🎯 Questions Answered

| # | Question | SQL Concepts Used |
|---|---|---|
| 1 | Total parliamentary seats contested | `COUNT DISTINCT` |
| 2 | Seats available per state, ranked | 3-table `JOIN`, `GROUP BY`, `ORDER BY` |
| 3 | Total seats won by NDA alliance | `SUM(CASE WHEN ... END)` |
| 4 | Seat breakdown across NDA parties | `WHERE IN (...)`, `ORDER BY` |
| 5 | Total seats won by I.N.D.I.A alliance | `SUM(CASE WHEN ... END)` |
| 6 | Seat breakdown across I.N.D.I.A parties | `WHERE IN (...)`, `ORDER BY` |
| 7 | Tag every party with alliance membership | `ALTER TABLE`, `UPDATE` with conditions |
| 8 | Alliance head-to-head: NDA vs I.N.D.I.A vs Others | `JOIN`, `COUNT`, `GROUP BY` |
| 9 | EVM vs postal votes per constituency | Multi-table `JOIN`, `WHERE` filter |
| 10 | Top 10 candidates by EVM votes nationally | Correlated subquery + `LIMIT` |

---

## 🗄️ Database Schema

### Entity Relationship Diagram

<p align="center"><img width="1337" height="802" alt="ERD" src="https://github.com/user-attachments/assets/ceed60cf-308e-48c7-be60-706e30bec7be" />



### Table Reference

| Table | Primary Key | Description |
|---|---|---|
| `States` | `State_ID` | Master list of all 36 states and Union Territories |
| `Statewise_Results` | `Parliament_Constituency` | Each constituency mapped to its state, with leading/trailing candidate and margin |
| `Partywise_Results` | `Party_ID` | Total seats won per party + `Party_Alliance` tag (added in Q7) |
| `Constituencywise_Results` | `Constituency_ID` | Winning candidate, party, and vote total per constituency |
| `Constituencywise_Details` | — | All candidates per constituency with EVM votes, postal votes, and vote share % |

---

## 🔍 Featured Queries

### Alliance Seat Aggregation (Q3)
Uses conditional aggregation to sum seats across all 14 NDA member parties in a single pass — no subqueries, no temp tables.

<p align="center"><img width="1280" height="612" alt="3" src="https://github.com/user-attachments/assets/b8accfc3-0f9f-42ea-94da-e3f977c5871c" />


---

### Live Schema Enrichment (Q7)
Demonstrates DDL + DML together — evolving the schema mid-analysis by adding a derived column, then populating it across three UPDATE passes.

<p align="center"><img width="1280" height="563" alt="7" src="https://github.com/user-attachments/assets/f09d9c8e-63bd-48e0-999d-67551c943136" />


---

### Correlated Subquery — Top EVM Votes (Q10)
For each constituency, finds the candidate with the highest EVM votes using a correlated subquery, then ranks the top 10 nationally.

<p align="center"><img width="1280" height="529" alt="10" src="https://github.com/user-attachments/assets/c8080bed-65d5-41c7-9f96-5ad912336226" />


---

### EVM vs Postal Vote Breakdown (Q9)
Drill into any constituency to compare electronic and postal voting channels across all candidates.

<p align="center"><img width="1280" height="514" alt="9" src="https://github.com/user-attachments/assets/91a2d80b-acd4-472d-9010-1bd716bbfff0" />


---

## 🚀 Getting Started

### Prerequisites
- [PostgreSQL 14+](https://www.postgresql.org/download/)
- [pgAdmin 4](https://www.pgadmin.org/) *(optional — for ERD and visual query execution)*
- Source CSV files: `states.csv`, `partywise_results.csv`, `statewise_results.csv`, `constituencywise_results.csv`, `constituencywise_details.csv`

### Setup

**Step 1 — Create the database**

- createdb indian_elections_2024


**Step 2 — Build the schema**

- psql -d indian_elections_2024 -f Table_Create.sql


**Step 3 — Load the data**

> ⚠️ Open `import_data.sql` and update the CSV file paths from `C:\DA\...` to your local directory before running.


- psql -d indian_elections_2024 -f import_data.sql


**Step 4 — Run the analysis**

- psql -d indian_elections_2024 -f indian_election_session.sql


---

## 💡 SQL Skills Demonstrated

-  Normalised relational schema design (3NF)
-  Primary keys, foreign keys, referential integrity
-  Multi-table JOINs (up to 3 tables in a single query)
-  Conditional aggregation — SUM(CASE WHEN ... END)
-  Correlated subqueries for per-group maxima
-  Schema evolution — ALTER TABLE + conditional UPDATE
-  COUNT(DISTINCT ...) for accurate deduplication
-  WHERE IN (...) filtering across large party lists
-  ORDER BY + LIMIT for ranked result sets
-  Inline query aliasing and table aliasing


---

## 📊 Key Findings

- 🏛️ **543** parliamentary constituencies across all of India
- 🗺️ **Uttar Pradesh** leads with 80 seats — the most of any state
- 🤝 **NDA** (14 parties) vs **I.N.D.I.A** (21 parties) vs **Others** — alliance breakdown visible through Q8
- 📬 EVM and postal vote channels show notable variation across constituencies (Q9)
- 🏆 Significant margin differences between closely contested and dominant-win constituencies (visible in `Statewise_Results.Margin`)

---

## 🔭 Future Scope

- [ ] Add `Candidates` master table to fully normalise candidate name fields
- [ ] Rewrite Q10 using `RANK() OVER (PARTITION BY Constituency_ID ORDER BY EVM_Votes DESC)` window function
- [ ] Connect to a BI tool (Tableau / Power BI) for state-level alliance heat maps
- [ ] Add 2019 election data under a separate schema for year-over-year comparison
- [ ] Voter turnout analysis if registration data becomes available

---

## 👤 Author

**SOUMYADIP HALDAR**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=flat&logo=linkedin)](www.linkedin.com/in/soumyadip-haldar-289434290)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-181717?style=flat&logo=github)](https://github.com/Soumyadip0605)


<p align="center">
  <i>Data sourced from publicly available Election Commission of India results — 18th Lok Sabha General Election, 2024.</i>
</p>

<p align="center">
  ⭐ If this project helped you, consider giving it a star!
</p>
