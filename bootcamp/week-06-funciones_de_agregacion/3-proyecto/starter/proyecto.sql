-- ============================================
-- PROYECTO SEMANAL: Funciones de Agregación
-- Semana 06 — COUNT, SUM, AVG, GROUP BY, HAVING
-- Dominio: Club Social
-- ============================================

-- ============================================
-- REPORTE 1: Totales globales
-- ============================================

SELECT
    COUNT(*) AS total_registros,
    SUM(amount) AS suma_total,
    AVG(amount) AS promedio
FROM fees;

-- ============================================
-- REPORTE 2: Extremos
-- ============================================

SELECT
    MIN(amount) AS minimo,
    MAX(amount) AS maximo
FROM fees;

-- ============================================
-- REPORTE 3: Subtotales por categoría (GROUP BY)
-- ============================================

SELECT
    member_id,
    COUNT(*) AS total,
    AVG(amount) AS promedio
FROM fees
GROUP BY member_id
ORDER BY total DESC;

-- ============================================
-- REPORTE 4: Filtro de grupos (HAVING)
-- ============================================

SELECT
    member_id,
    COUNT(*) AS total
FROM fees
GROUP BY member_id
HAVING COUNT(*) > 1;