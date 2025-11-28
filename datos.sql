:
 
-- insertar datos

-- 1. galaxia
INSERT INTO galaxia (nombre, fecha_descubrimiento) VALUES
('Vía Láctea', '1610-03-10'),
('Andrómeda', '1764-10-17'),
('Messier 87', '1781-12-20');

-- 2. sistemasolar
INSERT INTO sistemasolar (id_galaxia, nombre, tipo, edad, fecha_descubrimiento) VALUES
(1, 'Sistema Solar', 'Estelar', '4500 millones de años', '1630-05-24'),
(2, 'Kepler-452', 'Exoplanetario', '6000 millones de años', '2015-07-23');

-- 3. constelacion
INSERT INTO constelacion (id_galaxia, nombre, fecha_descubrimiento) VALUES
(1, 'Orión', '1550-01-01'),
(1, 'Cruz del Sur', '1600-03-22'),
(2, 'Pegaso', '1750-04-06');

-- 4. estrella
INSERT INTO estrella (id_constelacion, nombre, edad, tipo_estrella, fecha_descubrimiento) VALUES
(1, 'Betelgeuse', '8 millones de años', 'Gigante roja', '1920-12-30'),
(1, 'Rigel', '7 millones de años', 'Supergigante azul', '1910-06-15'),
(3, '51 Pegasi', '6000 millones de años', 'G-type', '1995-10-06');

-- 5. planeta
INSERT INTO planeta (id_sistema, nombre, tipo_planeta, tamano, fecha_descubrimiento) VALUES
(1, 'Tierra', 'Rocoso', '12742 km', '0001-01-01'),
(1, 'Marte', 'Rocoso', '6779 km', '1659-09-13'),
(2, 'Kepler-452b', 'Exoplaneta', '18000 km', '2015-07-23');

-- 6. satelite
INSERT INTO satelite (id_planeta, nombre, tipo_satelite, fecha_descubrimiento) VALUES
(1, 'Luna', 'Natural', '0001-01-01'),
(2, 'Fobos', 'Natural', '1877-08-18'),
(2, 'Deimos', 'Natural', '1877-08-12');

-- 7. estrella_sistemasolar
INSERT INTO estrella_sistemasolar (id_sistema, id_estrella) VALUES
(1, 1),
(1, 2),
(2, 3);
