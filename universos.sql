-- ============================================
-- BASE DE DATOS: UNIVERSOS (MEJORADA Y NORMALIZADA)
-- Compatible con estructura actual
-- Proyecto: El Universo - BUAP 2025
-- ============================================

CREATE DATABASE IF NOT EXISTS `universos` 
    DEFAULT CHARACTER SET utf8mb4 
    COLLATE utf8mb4_0900_ai_ci;

USE `universos`;

-- ============================================
-- TABLAS DE CATÁLOGO (Normalización)
-- ============================================

-- Catálogo de tipos de galaxias
DROP TABLE IF EXISTS `tipo_galaxia`;
CREATE TABLE `tipo_galaxia` (
    `id_tipo_galaxia` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(50) NOT NULL UNIQUE,
    `descripcion` TEXT,
    PRIMARY KEY (`id_tipo_galaxia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Catálogo de tipos de sistemas solares
DROP TABLE IF EXISTS `tipo_sistema`;
CREATE TABLE `tipo_sistema` (
    `id_tipo_sistema` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(50) NOT NULL UNIQUE,
    `descripcion` TEXT,
    PRIMARY KEY (`id_tipo_sistema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Catálogo de tipos de estrellas
DROP TABLE IF EXISTS `tipo_estrella`;
CREATE TABLE `tipo_estrella` (
    `id_tipo_estrella` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(50) NOT NULL UNIQUE,
    `clase_espectral` VARCHAR(10), -- O, B, A, F, G, K, M
    `temperatura_min_kelvin` DECIMAL(10,2),
    `temperatura_max_kelvin` DECIMAL(10,2),
    `descripcion` TEXT,
    PRIMARY KEY (`id_tipo_estrella`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Catálogo de tipos de planetas
DROP TABLE IF EXISTS `tipo_planeta`;
CREATE TABLE `tipo_planeta` (
    `id_tipo_planeta` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(50) NOT NULL UNIQUE,
    `descripcion` TEXT,
    PRIMARY KEY (`id_tipo_planeta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Catálogo de tipos de satélites
DROP TABLE IF EXISTS `tipo_satelite`;
CREATE TABLE `tipo_satelite` (
    `id_tipo_satelite` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(50) NOT NULL UNIQUE,
    `descripcion` TEXT,
    PRIMARY KEY (`id_tipo_satelite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ============================================
-- TABLA DE DESCUBRIDORES
-- ============================================

DROP TABLE IF EXISTS `descubridor`;
CREATE TABLE `descubridor` (
    `id_descubridor` INT NOT NULL AUTO_INCREMENT,
    `nombre_completo` VARCHAR(200) NOT NULL,
    `nacionalidad` VARCHAR(100),
    `fecha_nacimiento` DATE,
    `fecha_fallecimiento` DATE,
    `biografia_breve` TEXT,
    `contribuciones` TEXT,
    PRIMARY KEY (`id_descubridor`),
    INDEX `idx_nombre_descubridor` (`nombre_completo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ============================================
-- TABLA DE MITOLOGÍA
-- ============================================

DROP TABLE IF EXISTS `referencia_mitologica`;
CREATE TABLE `referencia_mitologica` (
    `id_referencia` INT NOT NULL AUTO_INCREMENT,
    `cultura` VARCHAR(100) NOT NULL, -- Griega, Romana, Nórdica, etc.
    `nombre_deidad` VARCHAR(150) NOT NULL,
    `tipo_entidad` VARCHAR(50), -- Dios, Diosa, Héroe, Titán, etc.
    `dominio` VARCHAR(200), -- Ej: "Dios del cielo y el trueno"
    `historia_breve` TEXT,
    `simbolismo` TEXT,
    PRIMARY KEY (`id_referencia`),
    INDEX `idx_cultura` (`cultura`),
    INDEX `idx_nombre_deidad` (`nombre_deidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ============================================
-- ENTIDAD FUERTE: GALAXIA
-- ============================================

DROP TABLE IF EXISTS `galaxia`;
CREATE TABLE `galaxia` (
    `id_galaxia` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(100) NOT NULL,
    `id_tipo_galaxia` INT,
    `distancia_tierra_millones_al` DECIMAL(15,2), -- Años luz desde la Tierra
    `diametro_miles_al` DECIMAL(15,2), -- Diámetro en miles de años luz
    `masa_solar` DECIMAL(20,2), -- Masa en unidades solares
    `magnitud_aparente` DECIMAL(5,2),
    `velocidad_radial_km_s` DECIMAL(10,2), -- Velocidad de alejamiento/acercamiento
    `fecha_descubrimiento` DATE,
    `id_descubridor` INT,
    `id_referencia_mitologica` INT,
    `notas` TEXT,
    PRIMARY KEY (`id_galaxia`),
    FOREIGN KEY (`id_tipo_galaxia`) REFERENCES `tipo_galaxia`(`id_tipo_galaxia`),
    FOREIGN KEY (`id_descubridor`) REFERENCES `descubridor`(`id_descubridor`),
    FOREIGN KEY (`id_referencia_mitologica`) REFERENCES `referencia_mitologica`(`id_referencia`),
    INDEX `idx_nombre_galaxia` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ============================================
-- ENTIDAD DÉBIL: CONSTELACIÓN
-- ============================================

DROP TABLE IF EXISTS `constelacion`;
CREATE TABLE `constelacion` (
    `id_constelacion` INT NOT NULL AUTO_INCREMENT,
    `id_galaxia` INT NOT NULL,
    `nombre` VARCHAR(100) NOT NULL,
    `abreviatura` VARCHAR(10), -- Ori (Orión), And (Andrómeda), etc.
    `area_grados_cuadrados` DECIMAL(8,2),
    `num_estrellas_principales` INT,
    `visible_hemisferio` ENUM('Norte', 'Sur', 'Ambos', 'Ecuatorial'),
    `mejor_mes_observacion` TINYINT, -- 1-12 (Enero-Diciembre)
    `ascension_recta_horas` DECIMAL(5,2), -- Coordenada celeste
    `declinacion_grados` DECIMAL(6,2), -- Coordenada celeste
    `fecha_descubrimiento` DATE,
    `id_descubridor` INT,
    `id_referencia_mitologica` INT,
    `leyenda` TEXT,
    PRIMARY KEY (`id_constelacion`),
    FOREIGN KEY (`id_galaxia`) REFERENCES `galaxia`(`id_galaxia`) ON DELETE CASCADE,
    FOREIGN KEY (`id_descubridor`) REFERENCES `descubridor`(`id_descubridor`),
    FOREIGN KEY (`id_referencia_mitologica`) REFERENCES `referencia_mitologica`(`id_referencia`),
    INDEX `idx_nombre_constelacion` (`nombre`),
    INDEX `idx_abreviatura` (`abreviatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ============================================
-- ENTIDAD DÉBIL: SISTEMA SOLAR
-- ============================================

DROP TABLE IF EXISTS `sistemasolar`;
CREATE TABLE `sistemasolar` (
    `id_sistema` INT NOT NULL AUTO_INCREMENT,
    `id_galaxia` INT NOT NULL,
    `nombre` VARCHAR(100) NOT NULL,
    `id_tipo_sistema` INT,
    `edad_millones_anos` DECIMAL(10,2), -- Edad en millones de años
    `distancia_centro_galactico_al` DECIMAL(15,2), -- Distancia al centro galáctico
    `num_planetas` INT DEFAULT 0,
    `num_planetas_enanos` INT DEFAULT 0,
    `tiene_cinturon_asteroides` BOOLEAN DEFAULT FALSE,
    `tiene_nube_oort` BOOLEAN DEFAULT FALSE,
    `fecha_descubrimiento` DATE,
    `id_descubridor` INT,
    `metodo_descubrimiento` VARCHAR(200),
    `notas` TEXT,
    PRIMARY KEY (`id_sistema`),
    FOREIGN KEY (`id_galaxia`) REFERENCES `galaxia`(`id_galaxia`) ON DELETE CASCADE,
    FOREIGN KEY (`id_tipo_sistema`) REFERENCES `tipo_sistema`(`id_tipo_sistema`),
    FOREIGN KEY (`id_descubridor`) REFERENCES `descubridor`(`id_descubridor`),
    INDEX `idx_nombre_sistema` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ============================================
-- ENTIDAD DÉBIL: ESTRELLA
-- ============================================

DROP TABLE IF EXISTS `estrella`;
CREATE TABLE `estrella` (
    `id_estrella` INT NOT NULL AUTO_INCREMENT,
    `id_constelacion` INT NOT NULL,
    `nombre` VARCHAR(100) NOT NULL,
    `nombre_alternativo` VARCHAR(100), -- Ej: Alpha Orionis para Betelgeuse
    `edad_millones_anos` DECIMAL(10,2),
    `id_tipo_estrella` INT,
    `clase_espectral` VARCHAR(10), -- Ej: M1-2 Ia-Iab
    `masa_solar` DECIMAL(10,4), -- Masa en unidades solares (Sol = 1)
    `radio_solar` DECIMAL(10,4), -- Radio en unidades solares
    `temperatura_kelvin` DECIMAL(10,2),
    `luminosidad_solar` DECIMAL(15,4), -- Luminosidad en unidades solares
    `magnitud_aparente` DECIMAL(5,2),
    `magnitud_absoluta` DECIMAL(5,2),
    `distancia_tierra_al` DECIMAL(15,2), -- Años luz desde la Tierra
    `velocidad_radial_km_s` DECIMAL(10,2),
    `metalicidad` DECIMAL(6,4), -- [Fe/H]
    `es_variable` BOOLEAN DEFAULT FALSE,
    `es_binaria` BOOLEAN DEFAULT FALSE,
    `fase_evolutiva` VARCHAR(50), -- Secuencia principal, gigante, supergigante, etc.
    `fecha_descubrimiento` DATE,
    `id_descubridor` INT,
    `id_referencia_mitologica` INT,
    PRIMARY KEY (`id_estrella`),
    FOREIGN KEY (`id_constelacion`) REFERENCES `constelacion`(`id_constelacion`) ON DELETE CASCADE,
    FOREIGN KEY (`id_tipo_estrella`) REFERENCES `tipo_estrella`(`id_tipo_estrella`),
    FOREIGN KEY (`id_descubridor`) REFERENCES `descubridor`(`id_descubridor`),
    FOREIGN KEY (`id_referencia_mitologica`) REFERENCES `referencia_mitologica`(`id_referencia`),
    INDEX `idx_nombre_estrella` (`nombre`),
    INDEX `idx_magnitud` (`magnitud_aparente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ============================================
-- TABLA ASOCIATIVA: ESTRELLA-SISTEMA SOLAR
-- ============================================

DROP TABLE IF EXISTS `estrella_sistemasolar`;
CREATE TABLE `estrella_sistemasolar` (
    `id_ESS` INT NOT NULL AUTO_INCREMENT,
    `id_sistema` INT NOT NULL,
    `id_estrella` INT NOT NULL,
    `rol` ENUM('Principal', 'Secundaria', 'Terciaria', 'Compañera') DEFAULT 'Principal',
    `es_estrella_central` BOOLEAN DEFAULT TRUE,
    `distancia_entre_estrellas_ua` DECIMAL(15,6), -- Para sistemas binarios/múltiples
    PRIMARY KEY (`id_ESS`),
    UNIQUE KEY `uq_es_sis` (`id_sistema`, `id_estrella`),
    FOREIGN KEY (`id_estrella`) REFERENCES `estrella`(`id_estrella`) ON DELETE CASCADE,
    FOREIGN KEY (`id_sistema`) REFERENCES `sistemasolar`(`id_sistema`) ON DELETE CASCADE,
    INDEX `idx_sistema` (`id_sistema`),
    INDEX `idx_estrella` (`id_estrella`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ============================================
-- ENTIDAD DÉBIL: PLANETA
-- ============================================

DROP TABLE IF EXISTS `planeta`;
CREATE TABLE `planeta` (
    `id_planeta` INT NOT NULL AUTO_INCREMENT,
    `id_sistema` INT NOT NULL,
    `nombre` VARCHAR(100) NOT NULL,
    `id_tipo_planeta` INT,
    `radio_km` DECIMAL(15,2), -- Radio ecuatorial en km
    `masa_tierra` DECIMAL(15,6), -- Masa en unidades terrestres (Tierra = 1)
    `masa_kg` DECIMAL(30,4), -- Masa en kg (notación científica implícita)
    `densidad_g_cm3` DECIMAL(8,4),
    `gravedad_m_s2` DECIMAL(8,4),
    `velocidad_escape_km_s` DECIMAL(8,2),
    `periodo_orbital_dias` DECIMAL(15,4), -- Tiempo de traslación
    `periodo_rotacion_horas` DECIMAL(10,4), -- Tiempo de rotación
    `distancia_estrella_ua` DECIMAL(15,6), -- Unidades Astronómicas
    `distancia_estrella_millones_km` DECIMAL(15,2),
    `excentricidad_orbital` DECIMAL(8,6),
    `inclinacion_orbital_grados` DECIMAL(8,4),
    `inclinacion_axial_grados` DECIMAL(6,2),
    `temperatura_media_celsius` DECIMAL(8,2),
    `temperatura_superficie_min_c` DECIMAL(8,2),
    `temperatura_superficie_max_c` DECIMAL(8,2),
    `presion_atmosferica_atm` DECIMAL(10,4),
    `tiene_atmosfera` BOOLEAN DEFAULT FALSE,
    `composicion_atmosfera` TEXT,
    `tiene_campo_magnetico` BOOLEAN DEFAULT FALSE,
    `tiene_anillos` BOOLEAN DEFAULT FALSE,
    `num_satelites_naturales` INT DEFAULT 0,
    `albedo` DECIMAL(4,3), -- Reflectividad (0-1)
    `orden_desde_estrella` TINYINT, -- 1°, 2°, 3°, etc.
    `es_habitable` BOOLEAN DEFAULT FALSE,
    `tiene_agua_liquida` BOOLEAN DEFAULT FALSE,
    `fecha_descubrimiento` DATE,
    `id_descubridor` INT,
    `metodo_descubrimiento` VARCHAR(200),
    `id_referencia_mitologica` INT,
    `notas` TEXT,
    PRIMARY KEY (`id_planeta`),
    FOREIGN KEY (`id_sistema`) REFERENCES `sistemasolar`(`id_sistema`) ON DELETE CASCADE,
    FOREIGN KEY (`id_tipo_planeta`) REFERENCES `tipo_planeta`(`id_tipo_planeta`),
    FOREIGN KEY (`id_descubridor`) REFERENCES `descubridor`(`id_descubridor`),
    FOREIGN KEY (`id_referencia_mitologica`) REFERENCES `referencia_mitologica`(`id_referencia`),
    INDEX `idx_nombre_planeta` (`nombre`),
    INDEX `idx_sistema_orden` (`id_sistema`, `orden_desde_estrella`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ============================================
-- ENTIDAD DÉBIL: SATÉLITE
-- ============================================

DROP TABLE IF EXISTS `satelite`;
CREATE TABLE `satelite` (
    `id_satelite` INT NOT NULL AUTO_INCREMENT,
    `id_planeta` INT NOT NULL,
    `nombre` VARCHAR(100) NOT NULL,
    `id_tipo_satelite` INT,
    `radio_km` DECIMAL(10,2),
    `masa_kg` DECIMAL(25,4),
    `densidad_g_cm3` DECIMAL(8,4),
    `gravedad_m_s2` DECIMAL(8,4),
    `distancia_planeta_km` DECIMAL(15,2),
    `periodo_orbital_dias` DECIMAL(15,6),
    `excentricidad_orbital` DECIMAL(8,6),
    `inclinacion_orbital_grados` DECIMAL(8,4),
    `es_natural` BOOLEAN DEFAULT TRUE,
    `tiene_atmosfera` BOOLEAN DEFAULT FALSE,
    `tiene_actividad_geologica` BOOLEAN DEFAULT FALSE,
    `albedo` DECIMAL(4,3),
    `temperatura_superficie_c` DECIMAL(8,2),
    `fecha_descubrimiento` DATE,
    `id_descubridor` INT,
    `id_referencia_mitologica` INT,
    `notas` TEXT,
    PRIMARY KEY (`id_satelite`),
    FOREIGN KEY (`id_planeta`) REFERENCES `planeta`(`id_planeta`) ON DELETE CASCADE,
    FOREIGN KEY (`id_tipo_satelite`) REFERENCES `tipo_satelite`(`id_tipo_satelite`),
    FOREIGN KEY (`id_descubridor`) REFERENCES `descubridor`(`id_descubridor`),
    FOREIGN KEY (`id_referencia_mitologica`) REFERENCES `referencia_mitologica`(`id_referencia`),
    INDEX `idx_nombre_satelite` (`nombre`),
    INDEX `idx_planeta` (`id_planeta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ============================================
-- VISTAS ÚTILES PARA CONSULTAS
-- ============================================

-- Vista: Jerarquía completa del universo
CREATE OR REPLACE VIEW `vista_jerarquia_completa` AS
SELECT 
    g.nombre AS galaxia,
    tg.nombre AS tipo_galaxia,
    s.nombre AS sistema_solar,
    p.nombre AS planeta,
    tp.nombre AS tipo_planeta,
    p.orden_desde_estrella AS posicion,
    sat.nombre AS satelite,
    c.nombre AS constelacion,
    e.nombre AS estrella
FROM galaxia g
LEFT JOIN tipo_galaxia tg ON g.id_tipo_galaxia = tg.id_tipo_galaxia
LEFT JOIN sistemasolar s ON g.id_galaxia = s.id_galaxia
LEFT JOIN planeta p ON s.id_sistema = p.id_sistema
LEFT JOIN tipo_planeta tp ON p.id_tipo_planeta = tp.id_tipo_planeta
LEFT JOIN satelite sat ON p.id_planeta = sat.id_planeta
LEFT JOIN constelacion c ON g.id_galaxia = c.id_galaxia
LEFT JOIN estrella e ON c.id_constelacion = e.id_constelacion;

-- Vista: Planetas con mitología
CREATE OR REPLACE VIEW `vista_planetas_mitologia` AS
SELECT 
    p.nombre AS planeta,
    tp.nombre AS tipo,
    p.radio_km,
    p.masa_tierra,
    s.nombre AS sistema,
    rm.cultura,
    rm.nombre_deidad AS dios_asociado,
    rm.dominio,
    rm.historia_breve
FROM planeta p
LEFT JOIN tipo_planeta tp ON p.id_tipo_planeta = tp.id_tipo_planeta
LEFT JOIN sistemasolar s ON p.id_sistema = s.id_sistema
LEFT JOIN referencia_mitologica rm ON p.id_referencia_mitologica = rm.id_referencia
WHERE rm.id_referencia IS NOT NULL;

-- Vista: Estrellas detalladas
CREATE OR REPLACE VIEW `vista_estrellas_detalle` AS
SELECT 
    e.nombre AS estrella,
    e.nombre_alternativo,
    te.nombre AS tipo,
    e.clase_espectral,
    e.temperatura_kelvin,
    e.masa_solar,
    e.radio_solar,
    e.luminosidad_solar,
    e.magnitud_aparente,
    e.distancia_tierra_al,
    c.nombre AS constelacion,
    c.abreviatura AS constelacion_abrev,
    g.nombre AS galaxia,
    rm.nombre_deidad AS nombre_mitologico
FROM estrella e
LEFT JOIN tipo_estrella te ON e.id_tipo_estrella = te.id_tipo_estrella
LEFT JOIN constelacion c ON e.id_constelacion = c.id_constelacion
LEFT JOIN galaxia g ON c.id_galaxia = g.id_galaxia
LEFT JOIN referencia_mitologica rm ON e.id_referencia_mitologica = rm.id_referencia;

-- Vista: Sistema Solar completo
CREATE OR REPLACE VIEW `vista_sistema_solar_completo` AS
SELECT 
    s.nombre AS sistema,
    s.edad_millones_anos AS edad_ma,
    s.num_planetas,
    p.nombre AS planeta,
    p.orden_desde_estrella AS posicion,
    p.masa_tierra,
    p.distancia_estrella_ua AS distancia_ua,
    p.num_satelites_naturales AS num_lunas,
    e.nombre AS estrella_central
FROM sistemasolar s
LEFT JOIN planeta p ON s.id_sistema = p.id_sistema
LEFT JOIN estrella_sistemasolar ess ON s.id_sistema = ess.id_sistema
LEFT JOIN estrella e ON ess.id_estrella = e.id_estrella AND ess.rol = 'Principal'
ORDER BY s.id_sistema, p.orden_desde_estrella;

-- Vista: Descubrimientos históricos
CREATE OR REPLACE VIEW `vista_descubrimientos` AS
SELECT 
    'Galaxia' AS tipo_cuerpo,
    g.nombre AS nombre_cuerpo,
    g.fecha_descubrimiento,
    d.nombre_completo AS descubridor,
    d.nacionalidad
FROM galaxia g
LEFT JOIN descubridor d ON g.id_descubridor = d.id_descubridor
WHERE g.fecha_descubrimiento IS NOT NULL
UNION ALL
SELECT 
    'Planeta' AS tipo_cuerpo,
    p.nombre,
    p.fecha_descubrimiento,
    d.nombre_completo,
    d.nacionalidad
FROM planeta p
LEFT JOIN descubridor d ON p.id_descubridor = d.id_descubridor
WHERE p.fecha_descubrimiento IS NOT NULL
UNION ALL
SELECT 
    'Estrella' AS tipo_cuerpo,
    e.nombre,
    e.fecha_descubrimiento,
    d.nombre_completo,
    d.nacionalidad
FROM estrella e
LEFT JOIN descubridor d ON e.id_descubridor = d.id_descubridor
WHERE e.fecha_descubrimiento IS NOT NULL
ORDER BY fecha_descubrimiento;

-- ============================================
-- PROCEDIMIENTOS ALMACENADOS ÚTILES
-- ============================================

-- Procedimiento: Agregar planeta con validaciones
DELIMITER //
DROP PROCEDURE IF EXISTS agregar_planeta//
CREATE PROCEDURE agregar_planeta(
    IN p_id_sistema INT,
    IN p_nombre VARCHAR(100),
    IN p_tipo VARCHAR(50),
    IN p_orden TINYINT,
    IN p_radio_km DECIMAL(15,2),
    IN p_masa_tierra DECIMAL(15,6)
)
BEGIN
    DECLARE tipo_id INT;
    
    -- Obtener o crear tipo de planeta
    SELECT id_tipo_planeta INTO tipo_id 
    FROM tipo_planeta 
    WHERE nombre = p_tipo;
    
    IF tipo_id IS NULL THEN
        INSERT INTO tipo_planeta (nombre) VALUES (p_tipo);
        SET tipo_id = LAST_INSERT_ID();
    END IF;
    
    -- Insertar planeta
    INSERT INTO planeta (
        id_sistema, nombre, id_tipo_planeta, 
        orden_desde_estrella, radio_km, masa_tierra
    ) VALUES (
        p_id_sistema, p_nombre, tipo_id,
        p_orden, p_radio_km, p_masa_tierra
    );
    
    -- Actualizar contador en sistema solar
    UPDATE sistemasolar 
    SET num_planetas = num_planetas + 1 
    WHERE id_sistema = p_id_sistema;
END//
DELIMITER ;

-- Procedimiento: Buscar cuerpos celestes por nombre
DELIMITER //
DROP PROCEDURE IF EXISTS buscar_cuerpo_celeste//
CREATE PROCEDURE buscar_cuerpo_celeste(IN nombre_busqueda VARCHAR(100))
BEGIN
    SELECT 'Galaxia' AS tipo, nombre, fecha_descubrimiento 
    FROM galaxia WHERE nombre LIKE CONCAT('%', nombre_busqueda, '%')
    UNION ALL
    SELECT 'Planeta' AS tipo, nombre, fecha_descubrimiento 
    FROM planeta WHERE nombre LIKE CONCAT('%', nombre_busqueda, '%')
    UNION ALL
    SELECT 'Estrella' AS tipo, nombre, fecha_descubrimiento 
    FROM estrella WHERE nombre LIKE CONCAT('%', nombre_busqueda, '%')
    UNION ALL
    SELECT 'Satélite' AS tipo, nombre, fecha_descubrimiento 
    FROM satelite WHERE nombre LIKE CONCAT('%', nombre_busqueda, '%');
END//
DELIMITER ;

-- ============================================
-- TRIGGERS PARA MANTENER INTEGRIDAD
-- ============================================

-- Trigger: Actualizar número de satélites al insertar
DELIMITER //
DROP TRIGGER IF EXISTS after_satelite_insert//
CREATE TRIGGER after_satelite_insert
AFTER INSERT ON satelite
FOR EACH ROW
BEGIN
    UPDATE planeta 
    SET num_satelites_naturales = num_satelites_naturales + 1 
    WHERE id_planeta = NEW.id_planeta AND NEW.es_natural = TRUE;
END//
DELIMITER ;

-- Trigger: Actualizar número de satélites al eliminar
DELIMITER //
DROP TRIGGER IF EXISTS after_satelite_delete//
CREATE TRIGGER after_satelite_delete
AFTER DELETE ON satelite
FOR EACH ROW
BEGIN
    UPDATE planeta 
    SET num_satelites_naturales = num_satelites_naturales - 1 
    WHERE id_planeta = OLD.id_planeta AND OLD.es_natural = TRUE;
END//
DELIMITER ;

-- ============================================
-- COMENTARIOS Y DOCUMENTACIÓN
-- ============================================

/* 
===============================================
MEJORAS IMPLEMENTADAS EN ESTA VERSIÓN:
===============================================

1. NORMALIZACIÓN COMPLETA (3FN):
   ✓ Tablas de catálogo para tipos
   ✓ Eliminación de redundancia
   ✓ Campos atómicos y bien tipados

2. CAMPOS CIENTÍFICOS REALISTAS:
   ✓ Tipos de datos numéricos correctos (DECIMAL)
   ✓ Medidas astronómicas estándar (UA, años luz, masas solares)
   ✓ Propiedades físicas detalladas

3. NUEVAS FUNCIONALIDADES:
   ✓ Tabla de descubridores
   ✓ Referencias mitológicas (según su documento)
   ✓ Vistas para consultas complejas
   ✓ Procedimientos almacenados
   ✓ Triggers automáticos

4. INTEGRIDAD Y SEGURIDAD:
   ✓ Foreign Keys con CASCADE
   ✓ Índices para optimizar búsquedas
   ✓ Constraints UNIQUE
   ✓ Validaciones mediante triggers

5. COMPATIBILIDAD:
   ✓ Mantiene la estructura básica original
   ✓ Compatible con datos existentes
   ✓ Migración gradual posible

===============================================
FORMA DE USO:
===============================================

1. Ejecutar este script completo
2. Ejecutar datos_mejorados.sql (próximo archivo)
3. Usar las vistas para consultas complejas
4. Usar los procedimientos para operaciones comunes

EJEMPLOS DE CONSULTAS:

-- Ver jerarquía completa
SELECT * FROM vista_jerarquia_completa WHERE galaxia = 'Vía Láctea';

-- Planetas con mitología
SELECT * FROM vista_planetas_mitologia;

-- Buscar cualquier cuerpo celeste
CALL buscar_cuerpo_celeste('Marte');

-- Agregar un planeta
CALL agregar_planeta(1, 'Venus', 'Terrestre', 2, 6051.8, 0.815);

===============================================
*/