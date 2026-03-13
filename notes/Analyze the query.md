Yes, there are several more powerful and production-grade ways to check query speed and performance in PostgreSQL. Here are all of them in full detail.

***

# EXPLAIN ANALYZE (Advanced Options)

## What It Is

You already used `EXPLAIN ANALYZE`. But there is a more detailed version of it that shows you deeper information. PostgreSQL's EXPLAIN accepts additional options that reveal cache usage, I/O timings, and more. [postgresql](https://www.postgresql.org/docs/current/sql-explain.html)

## Full Syntax

```sql
EXPLAIN (ANALYZE, BUFFERS, VERBOSE, FORMAT TEXT) SELECT * FROM books;
```

Each keyword explained:

- **ANALYZE**: Runs the query for real and shows actual timings (not estimates).
- **BUFFERS**: Shows how many memory pages were used vs read from disk.
- **VERBOSE**: Shows column names, schema names, function details.
- **FORMAT TEXT**: Output as plain text (default). Other options: JSON, XML, YAML (for tools).

## Simple Example

```sql
EXPLAIN (ANALYZE, BUFFERS, VERBOSE) SELECT * FROM books;
```

Output:
```
Seq Scan on public.books  (cost=0.00..1.02 rows=2 width=24)
                          (actual time=0.010..0.011 rows=2 loops=1)
  Output: rollno, name
  Buffers: shared hit=1
Planning Time: 0.040 ms
Execution Time: 0.025 ms
```

## What Each Part Means

- **Seq Scan**: Reading every row (sequential scan), correct for small tables.
- **cost=0.00..1.02**: Estimated work (not milliseconds). 0.00 startup, 1.02 total.
- **actual time=0.010..0.011**: Real time in ms. First number = first row, second = last row.
- **rows=2**: Actual rows returned.
- **loops=1**: How many times this step ran.
- **Output: rollno, name**: Columns returned (VERBOSE shows this).
- **Buffers: shared hit=1**: 1 memory page used, zero disk reads.
- **Planning Time**: Time to choose the query plan.
- **Execution Time**: Total real runtime.

## When to Use

Always use this in development when you suspect a slow query. Never run on production without testing first as ANALYZE actually executes the query. [postgresql](https://www.postgresql.org/docs/current/using-explain.html)

***

# pg_stat_statements

## What It Is

`pg_stat_statements` is a PostgreSQL extension that silently watches and records every single query that runs on your database. It keeps a running log of how many times each query ran, how long it took total, how long it took on average, and how much memory/disk it used. [talent500](https://talent500.com/blog/detect-optimize-slow-postgresql-queries/)

This is the most important production tool for slow query detection.

## How to Enable It

It must be enabled once (requires config file change):

**Step 1: Enable in postgresql.conf**
```
shared_preload_libraries = 'pg_stat_statements'
```

**Step 2: Restart PostgreSQL**

**Step 3: Create the extension in your database**
```sql
CREATE EXTENSION pg_stat_statements;
```

**Step 4: Verify it works**
```sql
SELECT * FROM pg_stat_statements LIMIT 5;
```

## Key Columns Explained

```sql
SELECT
    query,
    calls,
    total_exec_time,
    mean_exec_time,
    rows,
    shared_blks_hit,
    shared_blks_read
FROM pg_stat_statements
ORDER BY mean_exec_time DESC
LIMIT 10;
```

| Column | What It Means |
|---|---|
| query | The SQL that ran (parameters replaced with $1, $2) |
| calls | How many times it ran |
| total_exec_time | Total milliseconds spent on this query ever |
| mean_exec_time | Average time per run (most important) |
| rows | Total rows returned across all runs |
| shared_blks_hit | Times data was found in memory (cache hits, good) |
| shared_blks_read | Times data was read from disk (bad, slow) |

## Simple Example

```sql
-- Find top 5 slowest queries by average time
SELECT
    query,
    calls,
    round(mean_exec_time::numeric, 2) AS avg_ms,
    round(total_exec_time::numeric, 2) AS total_ms
FROM pg_stat_statements
ORDER BY mean_exec_time DESC
LIMIT 5;
```

Result for your books table:
```
query                         | calls | avg_ms | total_ms
SELECT * FROM books           | 12    | 0.02   | 0.24
ALTER TABLE books ADD COLUMN  | 1     | 45.00  | 45.00
INSERT INTO books ...         | 1     | 0.50   | 0.50
```

## Reset Stats

```sql
SELECT pg_stat_statements_reset();
```
Use this when you want to start measuring fresh (example: after deploying new code).

## Why This Is Powerful in Production

- Works 24/7 in background with near-zero overhead.
- No need to manually run EXPLAIN on every query.
- Finds slow queries you never knew existed.
- Tracks query patterns over days/weeks. [tigerdata](https://www.tigerdata.com/blog/using-pg-stat-statements-to-optimize-queries)

***

# pg_stat_activity

## What It Is

`pg_stat_activity` is a live view built into PostgreSQL (no extension needed). It shows you every connection and query currently running on your database right now, in real time. [talent500](https://talent500.com/blog/detect-optimize-slow-postgresql-queries/)

## Simple Example

```sql
-- See all currently running queries
SELECT
    pid,
    usename,
    state,
    now() - query_start AS duration,
    query
FROM pg_stat_activity
WHERE state = 'active';
```

Output:
```
pid  | usename | state  | duration        | query
1234 | ravi    | active | 00:00:00.003    | SELECT * FROM books
```

## Find Long-Running Queries (Production Use)

```sql
-- Queries running longer than 5 seconds
SELECT
    pid,
    usename,
    state,
    now() - query_start AS duration,
    query
FROM pg_stat_activity
WHERE state = 'active'
AND now() - query_start > interval '5 seconds';
```

## Key Columns

| Column | Meaning |
|---|---|
| pid | Process ID (use to kill stuck query) |
| usename | User running the query |
| state | active, idle, idle in transaction |
| duration | How long it has been running |
| query | The actual SQL |

## Kill a Stuck Query

```sql
-- Safely ask it to stop
SELECT pg_cancel_backend(1234);

-- Force kill (last resort)
SELECT pg_terminate_backend(1234);
```

Replace 1234 with actual pid. [learnomate](https://learnomate.org/blogs-postgresql-performance-monitoring/)

***

# Slow Query Log (log_min_duration_statement)

## What It Is

PostgreSQL can be configured to automatically write any query to a log file if it exceeds a time threshold you set. You do not need to watch anything manually. It logs slow queries silently in the background. [talent500](https://talent500.com/blog/detect-optimize-slow-postgresql-queries/)

## How to Enable

**Option 1: Per session (testing only)**
```sql
SET log_min_duration_statement = 100; -- log queries over 100ms
```

**Option 2: Global (in postgresql.conf, production)**
```
log_min_duration_statement = 1000   # log queries over 1 second
log_min_duration_statement = 0      # log ALL queries (dev only)
log_min_duration_statement = -1     # disabled (default)
```

After editing postgresql.conf:
```sql
SELECT pg_reload_conf(); -- apply without restart
```

## What Gets Logged

In your PostgreSQL log file:
```
2026-03-13 19:00:01 IST [1234]: duration: 1250.432 ms
statement: SELECT * FROM orders WHERE status = 'pending';
```

## Simple Example

```sql
-- In your session
SET log_min_duration_statement = 0;

SELECT * FROM books; -- this gets logged

-- Check log file or:
SELECT * FROM pg_catalog.pg_logs LIMIT 5; -- if log_destination=csvlog
```

## Why Useful in Production

- Always running, zero effort from developer.
- Catches slow queries that happen at 3 AM.
- Log file can be analyzed with tools like pgBadger. [learnomate](https://learnomate.org/blogs-postgresql-performance-monitoring/)

***

# auto_explain

## What It Is

`auto_explain` is a PostgreSQL module that automatically runs EXPLAIN ANALYZE on any query that is slower than a threshold you set and writes the full plan to the log file. You do not have to find the slow query first and then run EXPLAIN manually. [postgresql](https://www.postgresql.org/docs/current/auto-explain.html)

## How to Enable

**In postgresql.conf:**
```
shared_preload_libraries = 'auto_explain'
auto_explain.log_min_duration = 1000   -- explain queries over 1 second
auto_explain.log_analyze = true        -- show actual times (not estimates)
auto_explain.log_buffers = true        -- show buffer usage
```

Restart PostgreSQL.

**Test in session:**
```sql
LOAD 'auto_explain';
SET auto_explain.log_min_duration = 0;   -- catch everything
SET auto_explain.log_analyze = true;
SELECT * FROM books;
```

## What Appears in Log

```
duration: 0.019 ms
plan:
  Seq Scan on books
  (cost=0.00..1.02 rows=2 width=24)
  (actual time=0.010..0.011 rows=2 loops=1)
  Buffers: shared hit=1
```

## Performance Impact

- Log all queries (sample_rate=1): ~2-26% overhead.
- Log only slow queries (log_min_duration=1000ms): ~0.8% overhead.
- Always set a threshold in production. [scalingpostgres](https://www.scalingpostgres.com/episodes/157-auto_explain-overhead-postgres-data-lake-citus-shard-rebalance-ssl-authentication/)

***

# pgbench

## What It Is

`pgbench` is a benchmarking tool that comes with PostgreSQL. It simulates many users running queries at the same time and measures how many transactions per second your database handles. Used to test performance before going live. [pgmustard](https://www.pgmustard.com/blog/auto-explain-overhead-with-timing)

## How to Run

**Step 1: Initialize test data**
```bash
pgbench -i -s 10 mydb
```
- Creates standard test tables with 10x scale (100,000 rows).

**Step 2: Run benchmark**
```bash
pgbench -c 4 -T 60 mydb
```
- `-c 4`: 4 simulated users.
- `-T 60`: Run for 60 seconds.

**Output:**
```
latency average = 1.585 ms
tps = 2523.48 (transactions per second)
```

**Step 3: Custom query test**
```bash
pgbench -c 4 -T 30 -f myquery.sql mydb
```

Where myquery.sql contains:
```sql
SELECT * FROM books WHERE rollno = 1;
```

## Key Metrics

| Metric | Meaning |
|---|---|
| tps (transactions/sec) | Higher is better |
| latency average | Avg time per query (ms), lower is better |
| latency stddev | Variation; low = consistent |

## Use Case

Run before and after adding an index or changing a query. Compare tps and latency to confirm improvement. [pgmustard](https://www.pgmustard.com/blog/auto-explain-overhead-with-timing)

***

# Complete Production Checklist

**Development (daily use)**
- `EXPLAIN (ANALYZE, BUFFERS)` on every query you write.

**Staging / Pre-production**
- `pgbench` to simulate load and find bottlenecks.

**Production (always on)**
- `pg_stat_statements` to track all slow queries over time.
- `log_min_duration_statement = 1000` to log slow queries automatically.
- `auto_explain` to auto-capture plans of slow queries.
- `pg_stat_activity` to monitor real-time running queries.

**When something goes wrong**
- `pg_stat_activity` to find stuck/long queries.
- `pg_cancel_backend(pid)` to stop them.
- `pg_stat_statements` to find which query caused the spike. [tigerdata](https://www.tigerdata.com/blog/using-pg-stat-statements-to-optimize-queries)