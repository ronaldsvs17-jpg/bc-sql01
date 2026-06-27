-- ============================================
-- PROYECTO SEMANAL: JOINs aplicados a tu dominio
-- Semana 09 — INNER JOIN y LEFT JOIN
-- Dominio: Club Social
-- ============================================

PRAGMA foreign_keys = ON;

-- ============================================
-- LIMPIEZA
-- ============================================

DROP TABLE IF EXISTS event_registrations;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS facilities;

-- ============================================
-- TABLA DE REFERENCIA
-- ============================================

CREATE TABLE facilities (
    id              INTEGER PRIMARY KEY,
    name            TEXT NOT NULL UNIQUE,
    capacity        INTEGER NOT NULL
);

-- ============================================
-- TABLA PRINCIPAL
-- ============================================

CREATE TABLE members (
    id              INTEGER PRIMARY KEY,
    name            TEXT NOT NULL,
    membership_type TEXT NOT NULL,
    facility_id     INTEGER REFERENCES facilities(id)
);

-- ============================================
-- TABLA HIJA
-- ============================================

CREATE TABLE event_registrations (
    id              INTEGER PRIMARY KEY,
    recorded_at     TEXT NOT NULL DEFAULT (DATE('now')),
    event_name      TEXT NOT NULL,
    member_id       INTEGER REFERENCES members(id)
);

-- ============================================
-- DATOS DE PRUEBA
-- ============================================

INSERT INTO facilities VALUES
(1,'Piscina',100),
(2,'Gimnasio',80),
(3,'Cancha de Tenis',40);

INSERT INTO members VALUES
(1,'Juan Perez','Premium',1),
(2,'Maria Gomez','Regular',2),
(3,'Carlos Ruiz','VIP',1),
(4,'Ana Torres','Regular',3),
(5,'Pedro Silva','Premium',2); -- Huérfano

INSERT INTO event_registrations
(id, event_name, member_id)
VALUES
(1,'Torneo de Natacion',1),
(2,'Clase de Crossfit',2),
(3,'Torneo de Natacion',3),
(4,'Campeonato de Tenis',4),
(5,'Clase de Crossfit',1);

-- ============================================
-- CONSULTA 1: INNER JOIN principal
-- ============================================

SELECT
    m.name AS member,
    er.event_name,
    er.recorded_at
FROM members m
INNER JOIN event_registrations er
ON er.member_id = m.id;

-- ============================================
-- CONSULTA 2: JOIN con tres tablas
-- ============================================

SELECT
    m.name AS member,
    f.name AS facility,
    er.event_name,
    er.recorded_at
FROM members m
INNER JOIN facilities f
    ON m.facility_id = f.id
INNER JOIN event_registrations er
    ON er.member_id = m.id;

-- ============================================
-- CONSULTA 3: LEFT JOIN
-- ============================================

SELECT
    m.name AS member,
    er.event_name
FROM members m
LEFT JOIN event_registrations er
    ON er.member_id = m.id;

-- ============================================
-- CONSULTA 4: Detectar huérfanos
-- ============================================

SELECT
    m.name AS member_without_activity
FROM members m
LEFT JOIN event_registrations er
    ON er.member_id = m.id
WHERE er.id IS NULL;

-- ============================================
-- CONSULTA 5: Reporte agregado
-- ============================================

SELECT
    m.name AS member,
    COUNT(er.id) AS total_records
FROM members m
LEFT JOIN event_registrations er
    ON er.member_id = m.id
GROUP BY m.name
ORDER BY total_records DESC;