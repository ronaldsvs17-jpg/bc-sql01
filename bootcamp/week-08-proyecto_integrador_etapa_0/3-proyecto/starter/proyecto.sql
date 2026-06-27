-- ============================================
-- PROYECTO INTEGRADOR: Etapa 0 — Capstone
-- Semana 08 — DDL + DML + SELECT completo
-- Dominio: Club Social
-- ============================================

PRAGMA foreign_keys = ON;

-- ============================================
-- PARTE 1: ESQUEMA (DDL)
-- ============================================

DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS facilities;

-- Tabla de referencia

CREATE TABLE facilities (
    id              INTEGER PRIMARY KEY,
    facility_name   TEXT NOT NULL UNIQUE,
    capacity        INTEGER NOT NULL CHECK(capacity > 0)
);

-- Tabla secundaria

CREATE TABLE events (
    id              INTEGER PRIMARY KEY,
    event_name      TEXT NOT NULL,
    event_fee       REAL NOT NULL CHECK(event_fee > 0),
    is_active       INTEGER NOT NULL DEFAULT 1,
    facility_id     INTEGER NOT NULL
        REFERENCES facilities(id) ON DELETE RESTRICT
);

-- Tabla principal

CREATE TABLE members (
    id                  INTEGER PRIMARY KEY,
    full_name           TEXT NOT NULL,
    membership_number   TEXT UNIQUE,
    phone               TEXT,
    monthly_fee         REAL NOT NULL CHECK(monthly_fee > 0),
    is_active           INTEGER NOT NULL DEFAULT 1,
    event_id            INTEGER NOT NULL
        REFERENCES events(id) ON DELETE RESTRICT
);

-- ============================================
-- PARTE 2: DATOS (DML)
-- ============================================

INSERT INTO facilities
VALUES
(1,'Piscina',100),
(2,'Gimnasio',80),
(3,'Cancha de Tenis',40);

INSERT INTO events
VALUES
(1,'Torneo de Natacion',50000,1,1),
(2,'Clase de Crossfit',30000,1,2),
(3,'Campeonato de Tenis',70000,1,3);

INSERT INTO members
VALUES
(1,'Juan Perez','SOC001','3001111111',120000,1,1),
(2,'Maria Gomez','SOC002',NULL,100000,1,2),
(3,'Carlos Ruiz','SOC003','3003333333',150000,1,1),
(4,'Ana Torres','SOC004',NULL,90000,1,3),
(5,'Pedro Silva','SOC005','3005555555',180000,1,2),
(6,'Laura Diaz','SOC006','3006666666',130000,1,1),
(7,'Andres Castro','SOC007','3007777777',110000,1,2),
(8,'Sofia Rojas','SOC008','3008888888',140000,1,3);

-- ============================================
-- PARTE 3: REPORTES (SELECT)
-- ============================================

-- REPORTE 1: Totales globales

SELECT
    COUNT(*) AS total_socios,
    SUM(monthly_fee) AS suma_cuotas,
    AVG(monthly_fee) AS promedio_cuotas
FROM members;

-- REPORTE 2: Totales por categoría

SELECT
    event_id,
    COUNT(*) AS total,
    AVG(monthly_fee) AS promedio
FROM members
WHERE is_active = 1
GROUP BY event_id
ORDER BY total DESC;

-- REPORTE 3: Grupos con umbral

SELECT
    event_id,
    COUNT(*) AS total
FROM members
GROUP BY event_id
HAVING COUNT(*) > 2;

-- REPORTE 4: Registros con NULL y COALESCE

SELECT
    full_name,
    COALESCE(phone,'Sin dato') AS telefono
FROM members
WHERE phone IS NULL;

-- REPORTE 5: Búsqueda combinada

SELECT
    full_name,
    monthly_fee
FROM members
WHERE monthly_fee BETWEEN 100000 AND 160000
  AND is_active = 1
ORDER BY monthly_fee DESC
LIMIT 5;