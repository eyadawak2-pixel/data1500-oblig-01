-- ============================================================================
-- TEST-SKRIPT FOR OBLIG 1
-- ============================================================================

-- Kjør med: docker-compose exec postgres psql -h -U admin -d data1500_db -f test-scripts/queries.sql

-- En test med en SQL-spørring mot metadata i PostgreSQL (kan slettes fra din script)
select nspname as schema_name from pg_catalog.pg_namespace;

-- Oppgave 5.1
SELECT *
FROM sykkel;

-- Oppgave 5.2
SELECT fornavn, etternavn, mobilnummer
FROM kunde
ORDER BY etternavn ASC;

-- Oppgave 5.3
SELECT *
FROM utleie
WHERE starttid > '2023-04-01';

-- Oppgave 5.4
SELECT COUNT(*) AS antall_kunder
FROM kunde;

-- Oppgave 5.5
SELECT COUNT(DISTINCT kunde_id) AS kunder_med_utleie
FROM utleie;

-- Oppgave 5.6
SELECT DISTINCT k.fornavn, k.etternavn
FROM kunde k
JOIN utleie u ON k.id = u.kunde_id;

-- Oppgave 5.7
SELECT k.*
FROM kunde k
LEFT JOIN utleie u ON k.id = u.kunde_id
WHERE u.kunde_id IS NULL;
