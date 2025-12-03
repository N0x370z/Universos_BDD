-- ============================================
-- INSERCIÓN DE DATOS DE EJEMPLO
-- Compatible con estructura normalizada de universos.sql
-- ============================================

-- 1. Insertar tipos en catálogos (si no existen)
INSERT IGNORE INTO tipo_sistema (nombre, descripcion) VALUES
('Estelar', 'Sistema con una o más estrellas centrales'),
('Exoplanetario', 'Sistema con planetas fuera del Sistema Solar');

INSERT IGNORE INTO tipo_estrella (nombre, descripcion) VALUES
('Gigante roja', 'Estrella en fase evolutiva avanzada, de gran tamaño y color rojizo'),
('Supergigante azul', 'Estrella masiva y muy luminosa de color azul'),
('G-type', 'Estrella de secuencia principal tipo G, similar al Sol');

INSERT IGNORE INTO tipo_planeta (nombre, descripcion) VALUES
('Rocoso', 'Planeta terrestre con superficie sólida'),
('Exoplaneta', 'Planeta que orbita una estrella fuera del Sistema Solar');

INSERT IGNORE INTO tipo_satelite (nombre, descripcion) VALUES
('Natural', 'Satélite formado naturalmente, no artificial');

-- 2. Insertar galaxias
INSERT INTO galaxia (nombre, fecha_descubrimiento) VALUES
('Vía Láctea', '1610-03-10'),
('Andrómeda', '1764-10-17'),
('Messier 87', '1781-12-20');

-- 3. Insertar sistemas solares (usando IDs de tipo_sistema obtenidos dinámicamente)
INSERT INTO sistemasolar (id_galaxia, nombre, id_tipo_sistema, edad_millones_anos, fecha_descubrimiento)
SELECT 1, 'Sistema Solar', id_tipo_sistema, 4500.00, '1630-05-24' FROM tipo_sistema WHERE nombre = 'Estelar'
UNION ALL
SELECT 2, 'Kepler-452', id_tipo_sistema, 6000.00, '2015-07-23' FROM tipo_sistema WHERE nombre = 'Exoplanetario';

-- 4. Insertar constelaciones
INSERT INTO constelacion (id_galaxia, nombre, fecha_descubrimiento) VALUES
(1, 'Orión', '1550-01-01'),
(1, 'Cruz del Sur', '1600-03-22'),
(2, 'Pegaso', '1750-04-06');

-- 5. Insertar estrellas (usando IDs de tipo_estrella y convirtiendo edad)
INSERT INTO estrella (id_constelacion, nombre, edad_millones_anos, id_tipo_estrella, fecha_descubrimiento)
SELECT 1, 'Betelgeuse', 8.00, id_tipo_estrella, '1920-12-30' FROM tipo_estrella WHERE nombre = 'Gigante roja'
UNION ALL
SELECT 1, 'Rigel', 7.00, id_tipo_estrella, '1910-06-15' FROM tipo_estrella WHERE nombre = 'Supergigante azul'
UNION ALL
SELECT 3, '51 Pegasi', 6000.00, id_tipo_estrella, '1995-10-06' FROM tipo_estrella WHERE nombre = 'G-type';

-- 6. Insertar planetas (usando IDs de tipo_planeta y convirtiendo tamaño a radio_km)
-- Nota: Radio = Diámetro / 2. Tierra: 12742/2 = 6371 km, Marte: 6779/2 = 3389.5 km
INSERT INTO planeta (id_sistema, nombre, id_tipo_planeta, radio_km, fecha_descubrimiento)
SELECT 1, 'Tierra', id_tipo_planeta, 6371.00, '0001-01-01' FROM tipo_planeta WHERE nombre = 'Rocoso'
UNION ALL
SELECT 1, 'Marte', id_tipo_planeta, 3389.50, '1659-09-13' FROM tipo_planeta WHERE nombre = 'Rocoso'
UNION ALL
SELECT 2, 'Kepler-452b', id_tipo_planeta, 9000.00, '2015-07-23' FROM tipo_planeta WHERE nombre = 'Exoplaneta';

-- 7. Insertar satélites (usando IDs de tipo_satelite)
INSERT INTO satelite (id_planeta, nombre, id_tipo_satelite, fecha_descubrimiento)
SELECT 1, 'Luna', id_tipo_satelite, '0001-01-01' FROM tipo_satelite WHERE nombre = 'Natural'
UNION ALL
SELECT 2, 'Fobos', id_tipo_satelite, '1877-08-18' FROM tipo_satelite WHERE nombre = 'Natural'
UNION ALL
SELECT 2, 'Deimos', id_tipo_satelite, '1877-08-12' FROM tipo_satelite WHERE nombre = 'Natural';

-- 8. Insertar relación estrella-sistema solar (con rol y es_estrella_central)
INSERT INTO estrella_sistemasolar (id_sistema, id_estrella, rol, es_estrella_central) VALUES
(1, 1, 'Principal', TRUE),
(1, 2, 'Secundaria', FALSE),
(2, 3, 'Principal', TRUE);