-- ============================================
-- PROYECTO SEMANAL: DDL de tu Dominio
-- Semana 02 — DDL: Diseño de Esquemas
-- Dominio: Club Social
-- ============================================

-- ============================================
-- LIMPIEZA: eliminar tablas si existen
-- ============================================

DROP TABLE IF EXISTS fees;
DROP TABLE IF EXISTS facilities;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS members;

-- ============================================
-- TABLA 1: Entidad principal de tu dominio
-- ============================================

CREATE TABLE IF NOT EXISTS members (
    id              INTEGER PRIMARY KEY,
    full_name       TEXT    NOT NULL,
    email           TEXT    NOT NULL UNIQUE,
    membership_type TEXT    NOT NULL DEFAULT 'Regular',
    age             INTEGER CHECK(age >= 18),
    is_active       INTEGER NOT NULL DEFAULT 1
);

-- ============================================
-- TABLA 2: Segunda entidad de tu dominio
-- ============================================

CREATE TABLE IF NOT EXISTS events (
    id              INTEGER PRIMARY KEY,
    event_name      TEXT    NOT NULL,
    event_date      TEXT    NOT NULL,
    capacity        INTEGER CHECK(capacity > 0),
    location        TEXT    NOT NULL
);

-- ============================================
-- TABLA 3: Tercera entidad o tabla de relación
-- ============================================

CREATE TABLE IF NOT EXISTS fees (
    id              INTEGER PRIMARY KEY,
    member_id       INTEGER NOT NULL,
    amount          REAL    NOT NULL CHECK(amount > 0),
    payment_date    TEXT,
    FOREIGN KEY (member_id)
        REFERENCES members(id)
);

-- ============================================
-- TABLA ADICIONAL: Instalaciones
-- ============================================

CREATE TABLE IF NOT EXISTS facilities (
    id              INTEGER PRIMARY KEY,
    facility_name   TEXT    NOT NULL UNIQUE,
    capacity        INTEGER CHECK(capacity > 0),
    available       INTEGER NOT NULL DEFAULT 1
);

-- ============================================
-- VERIFICACIÓN
-- ============================================

-- .tables
-- PRAGMA table_info(members);
-- PRAGMA table_info(events);
-- PRAGMA table_info(fees);
-- PRAGMA table_info(facilities);