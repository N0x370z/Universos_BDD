:


-- CREACIÓN DE BASE DE DATOS

DROP DATABASE IF EXISTS universos;
CREATE DATABASE IF NOT EXISTS universos;
USE universos;

-- TABLA: galaxia

CREATE TABLE galaxia (
  id_galaxia INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  fecha_descubrimiento DATE DEFAULT NULL,
  PRIMARY KEY (id_galaxia)
);

-- TABLA: sistemasolar (FK -> galaxia)

CREATE TABLE sistemasolar (
  id_sistema INT NOT NULL AUTO_INCREMENT,
  id_galaxia INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  tipo VARCHAR(50) DEFAULT NULL,
  edad VARCHAR(50) DEFAULT NULL,
  fecha_descubrimiento DATE DEFAULT NULL,
  PRIMARY KEY (id_sistema),
  CONSTRAINT fk_sistema_galaxia FOREIGN KEY (id_galaxia) 
    REFERENCES galaxia(id_galaxia)
);


-- TABLA: constelacion (FK -> galaxia)

CREATE TABLE constelacion (
  id_constelacion INT NOT NULL AUTO_INCREMENT,
  id_galaxia INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  fecha_descubrimiento DATE DEFAULT NULL,
  PRIMARY KEY (id_constelacion),
  KEY fk_constelacion_galaxia (id_galaxia),
  CONSTRAINT fk_constelacion_galaxia FOREIGN KEY (id_galaxia)
    REFERENCES galaxia(id_galaxia)
);


-- TABLA: estrella (FK -> constelacion)

CREATE TABLE estrella (
  id_estrella INT NOT NULL AUTO_INCREMENT,
  id_constelacion INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  edad VARCHAR(50) DEFAULT NULL,
  tipo_estrella VARCHAR(50) DEFAULT NULL,
  fecha_descubrimiento DATE DEFAULT NULL,
  PRIMARY KEY (id_estrella),
  CONSTRAINT fk_estrella_constelacion FOREIGN KEY (id_constelacion)
    REFERENCES constelacion(id_constelacion)
);

-- TABLA: planeta (FK -> sistemasolar)

CREATE TABLE planeta (
  id_planeta INT NOT NULL AUTO_INCREMENT,
  id_sistema INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  tipo_planeta VARCHAR(50) DEFAULT NULL,
  tamano VARCHAR(50) DEFAULT NULL,
  fecha_descubrimiento DATE DEFAULT NULL,
  PRIMARY KEY (id_planeta),
  CONSTRAINT fk_planeta_sistema FOREIGN KEY (id_sistema)
    REFERENCES sistemasolar(id_sistema)
);

-- TABLA: satelite (FK -> planeta)

CREATE TABLE satelite (
  id_satelite INT NOT NULL AUTO_INCREMENT,
  id_planeta INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  tipo_satelite VARCHAR(50) DEFAULT NULL,
  fecha_descubrimiento DATE DEFAULT NULL,
  PRIMARY KEY (id_satelite),
  CONSTRAINT fk_satelite_planeta FOREIGN KEY (id_planeta)
    REFERENCES planeta(id_planeta)
);


-- TABLA INTERMEDIA: estrella_sistemasolar

CREATE TABLE estrella_sistemasolar (
  id_ESS INT NOT NULL AUTO_INCREMENT,
  id_sistema INT NOT NULL,
  id_estrella INT NOT NULL,
  PRIMARY KEY (id_ESS),
  UNIQUE KEY uq_es_sis (id_sistema, id_estrella),
  CONSTRAINT fk_es_sis_estrella FOREIGN KEY (id_estrella) 
    REFERENCES estrella(id_estrella),
  CONSTRAINT fk_es_sis_sistema FOREIGN KEY (id_sistema) 
    REFERENCES sistemasolar(id_sistema)
);

 
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
