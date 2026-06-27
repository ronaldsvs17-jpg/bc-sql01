-- ============================================
-- PROYECTO SEMANAL: DML — Manipulación de Datos
-- Semana 03 — INSERT INTO, UPDATE, DELETE
-- Dominio: Club Social
-- ============================================

-- ============================================
-- RECREACIÓN DEL ESQUEMA (Semana 02)
-- ============================================

DROP TABLE IF EXISTS fees;
DROP TABLE IF EXISTS facilities;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS members;

CREATE TABLE members (
    id              INTEGER PRIMARY KEY,
    full_name       TEXT NOT NULL,
    email           TEXT NOT NULL UNIQUE,
    membership_type TEXT NOT NULL DEFAULT 'Regular',
    age             INTEGER CHECK(age >= 18),
    is_active       INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE events (
    id              INTEGER PRIMARY KEY,
    event_name      TEXT NOT NULL,
    event_date      TEXT NOT NULL,
    capacity        INTEGER CHECK(capacity > 0),
    location        TEXT NOT NULL
);

CREATE TABLE fees (
    id              INTEGER PRIMARY KEY,
    member_id       INTEGER NOT NULL,
    amount          REAL NOT NULL CHECK(amount > 0),
    payment_date    TEXT,
    FOREIGN KEY (member_id)
        REFERENCES members(id)
);

CREATE TABLE facilities (
    id              INTEGER PRIMARY KEY,
    facility_name   TEXT NOT NULL UNIQUE,
    capacity        INTEGER CHECK(capacity > 0),
    available       INTEGER NOT NULL DEFAULT 1
);

-- ============================================
-- PARTE 1: INSERT INTO
-- ============================================

INSERT INTO members
(id, full_name, email, membership_type, age)
VALUES
    (1, 'Juan Perez', 'juan@gmail.com', 'Premium', 25),
    (2, 'Maria Gomez', 'maria@gmail.com', 'Regular', 30),
    (3, 'Carlos Ruiz', 'carlos@gmail.com', 'Premium', 28),
    (4, 'Ana Torres', 'ana@gmail.com', 'Regular', 22),
    (5, 'Pedro Silva', 'pedro@gmail.com', 'VIP', 35);

INSERT INTO fees
(id, member_id, amount, payment_date)
VALUES
    (1, 1, 50000, '2026-06-01'),
    (2, 2, 40000, '2026-06-02'),
    (3, 3, 50000, '2026-06-03'),
    (4, 4, 40000, '2026-06-04'),
    (5, 5, 70000, '2026-06-05');

-- ============================================
-- PARTE 2: UPDATE
-- ============================================

-- Actualizar una columna por PK

UPDATE members
SET membership_type = 'VIP'
WHERE id = 1;

-- Actualizar múltiples columnas

UPDATE members
SET full_name = 'Maria Fernanda Gomez',
    age = 31
WHERE id = 2;

-- Actualizar múltiples filas

UPDATE members
SET is_active = 0
WHERE age < 25;

-- ============================================
-- PARTE 3: DELETE SEGURO
-- ============================================

-- Verificar filas a eliminar

SELECT id, full_name
FROM members
WHERE is_active = 0;

-- Eliminar las filas verificadas

DELETE FROM members
WHERE is_active = 0;

-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================

SELECT *
FROM members
ORDER BY id;

SELECT *
FROM fees
ORDER BY id;