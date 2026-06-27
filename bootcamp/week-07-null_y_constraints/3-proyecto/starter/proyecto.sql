-- ============================================
-- PROYECTO SEMANAL: NULL y Constraints
-- Semana 07 — NOT NULL, UNIQUE, CHECK, FK
-- Dominio: Club Social
-- ============================================

PRAGMA foreign_keys = ON;

-- ============================================
-- PARTE 1: ESQUEMA CON CONSTRAINTS
-- ============================================

DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS facilities;

CREATE TABLE facilities (
    id              INTEGER PRIMARY KEY,
    facility_name   TEXT NOT NULL UNIQUE,
    capacity        INTEGER NOT NULL CHECK(capacity > 0)
);

CREATE TABLE members (
    id                  INTEGER PRIMARY KEY,
    full_name           TEXT NOT NULL,
    email               TEXT NOT NULL UNIQUE,
    membership_number   TEXT NOT NULL UNIQUE,
    age                 INTEGER NOT NULL CHECK(age >= 18),
    phone               TEXT,
    is_active           INTEGER NOT NULL DEFAULT 1,
    facility_id         INTEGER NOT NULL
        REFERENCES facilities(id) ON DELETE RESTRICT
);

-- ============================================
-- PARTE 2: DATOS DE PRUEBA
-- ============================================

INSERT INTO facilities (id, facility_name, capacity)
VALUES
    (1, 'Piscina', 100),
    (2, 'Gimnasio', 80),
    (3, 'Cancha de Tenis', 40);

INSERT INTO members
(id, full_name, email, membership_number, age, phone, facility_id)
VALUES
    (1, 'Juan Perez', 'juan@gmail.com', 'SOC001', 25, '3001111111', 1),
    (2, 'Maria Gomez', 'maria@gmail.com', 'SOC002', 30, NULL, 2),
    (3, 'Carlos Ruiz', 'carlos@gmail.com', 'SOC003', 28, '3003333333', 1),
    (4, 'Ana Torres', 'ana@gmail.com', 'SOC004', 22, NULL, 3),
    (5, 'Pedro Silva', 'pedro@gmail.com', 'SOC005', 35, '3005555555', 2),
    (6, 'Laura Diaz', 'laura@gmail.com', 'SOC006', 27, '3006666666', 1);

-- ============================================
-- PARTE 3: CONSULTAS CON NULL
-- ============================================

SELECT
    id,
    full_name
FROM members
WHERE phone IS NULL;

SELECT
    full_name,
    COALESCE(phone, 'Sin valor') AS telefono
FROM members;