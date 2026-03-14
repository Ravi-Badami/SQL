-- ============================================================
--  PostgreSQL: System & Meta Commands Reference
--  File: pg_system_commands.sql
--  Created: 2026-03-14
-- ============================================================


-- ------------------------------------------------------------
-- 1. DATABASE
-- ------------------------------------------------------------
SELECT current_database();                  -- current database name
SELECT datname FROM pg_database;            -- all databases on server


-- ------------------------------------------------------------
-- 2. SCHEMAS
-- ------------------------------------------------------------
SELECT schema_name FROM information_schema.schemata;  -- all schemas


-- ------------------------------------------------------------
-- 3. TABLES
-- ------------------------------------------------------------

-- All tables in public schema
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
AND table_type = 'BASE TABLE';

-- All tables across all schemas (excludes system tables)
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
AND table_schema NOT IN ('pg_catalog', 'information_schema');

-- Tables with owner info
SELECT schemaname, tablename, tableowner
FROM pg_tables
WHERE schemaname = 'public';


-- ------------------------------------------------------------
-- 4. COLUMNS
-- ------------------------------------------------------------

-- All columns of a specific table
SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_name = 'employees'
AND table_schema = 'public';


-- ------------------------------------------------------------
-- 5. CONSTRAINTS (Primary Keys, Foreign Keys, Unique)
-- ------------------------------------------------------------

-- All constraints on a specific table
SELECT conname AS constraint_name, contype AS type
FROM pg_constraint
WHERE conrelid = 'your_table_name'::regclass;

-- contype values:
-- p = primary key
-- f = foreign key
-- u = unique
-- c = check


-- ------------------------------------------------------------
-- 6. INDEXES
-- ------------------------------------------------------------

-- All indexes on a specific table
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'your_table_name';

-- All indexes in public schema
SELECT tablename, indexname, indexdef
FROM pg_indexes
WHERE schemaname = 'public';


-- ------------------------------------------------------------
-- 7. CURRENTLY RUNNING QUERIES (Live Monitor)
-- ------------------------------------------------------------

SELECT pid, usename, state,
       now() - query_start AS duration,
       query
FROM pg_stat_activity
WHERE state = 'active';

-- Queries running longer than 5 seconds
SELECT pid, usename, state,
       now() - query_start AS duration,
       query
FROM pg_stat_activity
WHERE state = 'active'
AND now() - query_start > interval '5 seconds';


-- ------------------------------------------------------------
-- 8. KILL A QUERY
-- ------------------------------------------------------------

SELECT pg_cancel_backend(pid);     -- safely stop
SELECT pg_terminate_backend(pid);  -- force kill (last resort)
-- Replace pid with actual process id from pg_stat_activity


-- ------------------------------------------------------------
-- 9. TABLE SIZE
-- ------------------------------------------------------------

-- Size of a specific table
SELECT pg_size_pretty(pg_total_relation_size('your_table_name'));

-- Size of all tables in public schema
SELECT tablename,
       pg_size_pretty(pg_total_relation_size(schemaname || '.' || tablename)) AS size
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY pg_total_relation_size(schemaname || '.' || tablename) DESC;


-- ------------------------------------------------------------
-- 10. USERS AND ROLES
-- ------------------------------------------------------------

SELECT usename, usesuper, usecreatedb
FROM pg_user;


-- ------------------------------------------------------------
-- 11. CURRENT USER AND VERSION
-- ------------------------------------------------------------

SELECT current_user;       -- logged in user
SELECT version();          -- PostgreSQL version


-- ------------------------------------------------------------
-- 12. QUERY PERFORMANCE (requires pg_stat_statements extension)
-- ------------------------------------------------------------

-- Top 10 slowest queries by average time
SELECT query,
       calls,
       round(mean_exec_time::numeric, 2) AS avg_ms,
       round(total_exec_time::numeric, 2) AS total_ms
FROM pg_stat_statements
ORDER BY mean_exec_time DESC
LIMIT 10;

-- Reset statistics
SELECT pg_stat_statements_reset();


-- ------------------------------------------------------------
-- PSQL TERMINAL SHORTCUTS (not SQL, run in psql only)
-- ------------------------------------------------------------
-- \l              -> list all databases
-- \c dbname       -> connect to a database
-- \dt             -> list tables in current schema
-- \dt *.*         -> list tables in all schemas
-- \d tablename    -> describe table structure
-- \di             -> list indexes
-- \dn             -> list schemas
-- \du             -> list users and roles
-- \q              -> quit psql
-- \timing         -> toggle query execution time display
-- ------------------------------------------------------------
