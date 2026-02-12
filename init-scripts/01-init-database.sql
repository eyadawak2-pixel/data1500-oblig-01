DROP TABLE IF EXISTS utleie CASCADE;
DROP TABLE IF EXISTS sykkel CASCADE;
DROP TABLE IF EXISTS las CASCADE;
DROP TABLE IF EXISTS stasjon CASCADE;
DROP TABLE IF EXISTS kunde CASCADE;

-- 1) Kunde
CREATE TABLE kunde (
  kunde_id SERIAL PRIMARY KEY,
  fornavn VARCHAR(50) NOT NULL,
  etternavn VARCHAR(50) NOT NULL,
  epost VARCHAR(100) UNIQUE,
  mobilnummer VARCHAR(20)
);

-- 2) Stasjon
CREATE TABLE stasjon (
  stasjon_id SERIAL PRIMARY KEY,
  navn VARCHAR(100) NOT NULL,
  adresse VARCHAR(150),
  kapasitet INT NOT NULL CHECK (kapasitet > 0)
);

-- 3) Lås
CREATE TABLE las (
  las_id SERIAL PRIMARY KEY,
  las_kode VARCHAR(50) UNIQUE NOT NULL
);

-- 4) Sykkel
CREATE TABLE sykkel (
  sykkel_id SERIAL PRIMARY KEY,
  status VARCHAR(20) NOT NULL CHECK (status IN ('tilgjengelig','utleid')),
  stasjon_id INT REFERENCES stasjon(stasjon_id),
  las_id INT REFERENCES las(las_id)
);

-- 5) Utleie
CREATE TABLE utleie (
  utleie_id SERIAL PRIMARY KEY,
  kunde_id INT NOT NULL REFERENCES kunde(kunde_id),
  sykkel_id INT NOT NULL REFERENCES sykkel(sykkel_id),
  hentet_stasjon_id INT REFERENCES stasjon(stasjon_id),
  levert_stasjon_id INT REFERENCES stasjon(stasjon_id),
  start_tid TIMESTAMP NOT NULL,
  slutt_tid TIMESTAMP,
  pris NUMERIC CHECK (pris > 0)
);

-- Test at script ran
SELECT 'database initialized' AS status;
