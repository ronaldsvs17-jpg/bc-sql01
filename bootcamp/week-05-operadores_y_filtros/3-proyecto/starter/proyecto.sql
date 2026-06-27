-- ============================================
-- PROYECTO SEMANAL: Operadores y Filtros
-- Semana 05 — BETWEEN, IN, LIKE
-- Dominio: Club Social
-- ============================================

-- ============================================
-- CONSULTA 1: Filtro con BETWEEN
-- ============================================

SELECT
    id,
    full_name,
    age,
    membership_type
FROM members
WHERE age BETWEEN 20 AND 30;

-- ============================================
-- CONSULTA 2: Filtro con IN
-- ============================================

SELECT
    id,
    full_name,
    membership_type
FROM members
WHERE membership_type IN ('Premium', 'VIP');

-- ============================================
-- CONSULTA 3: Búsqueda de texto con LIKE
-- ============================================

SELECT
    id,
    full_name,
    email
FROM members
WHERE full_name LIKE '%a%';

-- ============================================
-- CONSULTA 4: Filtro combinado (≥ 3 operadores)
-- ============================================

SELECT
    id,
    full_name,
    age,
    membership_type
FROM members
WHERE age BETWEEN 20 AND 35
  AND membership_type IN ('Premium', 'VIP')
  AND full_name LIKE '%a%'
ORDER BY full_name;