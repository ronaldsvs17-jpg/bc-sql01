-- ============================================
-- PROYECTO SEMANAL: Conoce tu Dominio
-- Semana 01 — Introducción a Bases de Datos Relacionales
-- ============================================

-- NOTA PARA EL APRENDIZ:
-- Adapta este esquema al dominio que te fue asignado.
-- Renombra las tablas y columnas según corresponda.
-- Ejemplos:
--   Biblioteca  → books, members, loans
--   Farmacia    → medicines, sales, inventory
--   Gimnasio    → members, routines, attendance
--   Restaurante → dishes, tables, orders

-- ============================================
-- PASO 1: Crear la entidad principal
-- ============================================

-- TODO: Renombrar 'items' según tu dominio (ej: books, medicines, dishes)
-- TODO: Agregar columnas específicas de tu entidad principal
CREATE TABLE events (
    id INTEGER PRIMARY KEY,
    members INTEGER NOT NULL,
    events TEXT NOT NULL,
    fees REAL NOT NULL,
    facilities TEXT NOT NULL
);

-- ============================================
-- PASO 2: Crear una segunda entidad
-- ============================================

-- TODO: Renombrar 'entities' según tu dominio (ej: members, clients, users)
-- TODO: Agregar columnas específicas
CREATE TABLE members (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    email       TEXT NOT NULL,
    phone       TEXT NOT NULL
);

-- ============================================
-- PASO 3: Insertar datos de prueba
-- ============================================

-- TODO: Insertar al menos 5 registros en cada tabla
-- Usa datos realistas relacionados con tu dominio
INSERT INTO events (id, name, fees, facilities) VALUES
(1, 'Torneo de Futbol', 50000, 'Cancha Principal'),
(2, 'Noche Cultural', 30000, 'Salon Social'),
(3, 'Festival Gastronomico', 45000, 'Zona de Eventos'),
(4, 'Clase de Yoga', 25000, 'Gimnasio'),
(5, 'Competencia de Natacion', 55000, 'Piscina Olimpica');

INSERT INTO members (id, name, email, phone) VALUES
(1, 'Juan Perez', 'juan@gmail.com', '3001234567'),
(2, 'Maria Gomez', 'maria@gmail.com', '3012345678'),
(3, 'Carlos Rodriguez', 'carlos@gmail.com', '3023456789'),
(4, 'Laura Martinez', 'laura@gmail.com', '3034567890'),
(5, 'Andres Torres', 'andres@gmail.com', '3045678901');

-- ============================================
-- PASO 4: Consultas SELECT básicas
-- ============================================

-- Mostrar todos los eventos 
SELECT *
FROM   events;

--Mostrar nombres de eventos ordenados alfabéticamente
SELECT name
FROM events
ORDER BY name ASC;

--Contar cuantos eventos hay
SELECT COUNT(*) AS total_events
FROM events;

--Mostrar todos los miembros 
SELECT *
FROM members;

--Mostrar todos los miembros alfabéticamente 
SELECT name
FROM members
ORDER BY name ASC;

--Contar cuantos miembros hay
SELECT COUNT(*) AS total_members
FROM members;
