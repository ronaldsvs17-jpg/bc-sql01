-- ============================================
-- PROYECTO SEMANAL: Consultas SELECT
-- Semana 04 — SELECT, WHERE, ORDER BY, LIMIT/OFFSET
-- Dominio: Club Social
-- ============================================

-- ============================================
-- CONSULTA 1: Listado general con columnas explícitas
-- ============================================

SELECT
    id AS "ID",
    full_name AS "Nombre Completo",
    email AS "Correo",
    membership_type AS "Tipo Membresía",
    age AS "Edad"
FROM members;

-- ============================================
-- CONSULTA 2: Filtro por condición simple
-- ============================================

SELECT
    id,
    full_name,
    membership_type
FROM members
WHERE membership_type = 'VIP';

-- ============================================
-- CONSULTA 3: Filtro combinado (AND u OR)
-- ============================================

SELECT
    id,
    full_name,
    age,
    membership_type
FROM members
WHERE age >= 25
  AND membership_type = 'Premium';

-- ============================================
-- CONSULTA 4: Top-N con ORDER BY + LIMIT
-- ============================================

SELECT
    id,
    full_name,
    age
FROM members
ORDER BY age DESC
LIMIT 5;

-- ============================================
-- CONSULTA 5: Paginación (página 1 y página 2)
-- ============================================

-- Página 1

SELECT
    id,
    full_name,
    membership_type
FROM members
ORDER BY full_name ASC
LIMIT 3 OFFSET 0;

-- Página 2

SELECT
    id,
    full_name,
    membership_type
FROM members
ORDER BY full_name ASC
LIMIT 3 OFFSET 3;