-- ============================================
-- DATOS DE EJEMPLO MEJORADOS
-- Base de Datos: Universos
-- Compatible con estructura mejorada
-- ============================================

USE `universos`;

-- ============================================
-- 1. CATÁLOGOS (Datos base normalizados)
-- ============================================

-- Tipos de Galaxias
INSERT INTO `tipo_galaxia` (`nombre`, `descripcion`) VALUES
('Espiral', 'Galaxia con brazos espirales y núcleo central brillante'),
('Espiral Barrada', 'Galaxia espiral con barra central de estrellas'),
('Elíptica', 'Galaxia de forma elipsoidal sin estructura espiral definida'),
('Irregular', 'Galaxia sin forma geométrica definida'),
('Lenticular', 'Galaxia intermedia entre espiral y elíptica');

-- Tipos de Sistemas Solares
INSERT INTO `tipo_sistema` (`nombre`, `descripcion`) VALUES
('Estelar Simple', 'Sistema con una sola estrella central'),
('Binario', 'Sistema con dos estrellas orbitándose mutuamente'),
('Múltiple', 'Sistema con tres o más estrellas'),
('Exoplanetario', 'Sistema planetario fuera del Sistema Solar'),
('Planetario', 'Sistema con planetas confirmados');

-- Tipos de Estrellas
INSERT INTO `tipo_estrella` (`nombre`, `clase_espectral`, `temperatura_min_kelvin`, `temperatura_max_kelvin`, `descripcion`) VALUES
('Enana Roja', 'M', 2300, 3900, 'Estrella pequeña y fría de baja masa'),
('Enana Amarilla', 'G', 5200, 6000, 'Estrella de secuencia principal como el Sol'),
('Enana Blanca', 'D', 8000, 40000, 'Remanente estelar denso y caliente'),
('Gigante Roja', 'K-M', 3000, 5000, 'Estrella evolucionada expandida y fría'),
('Supergigante Roja', 'M', 3000, 4000, 'Estrella masiva en fase avanzada muy expandida'),
('Supergigante Azul', 'O-B', 10000, 50000, 'Estrella masiva muy luminosa y caliente'),
('Gigante Azul', 'B', 10000, 30000, 'Estrella masiva caliente y brillante'),
('Estrella G-type', 'G', 5300, 6000, 'Estrella similar al Sol');

-- Tipos de Planetas
INSERT INTO `tipo_planeta` (`nombre`, `descripcion`) VALUES
('Terrestre', 'Planeta rocoso con superficie sólida'),
('Rocoso', 'Planeta con composición principalmente rocosa'),
('Gigante Gaseoso', 'Planeta grande compuesto principalmente de hidrógeno y helio'),
('Gigante de Hielo', 'Planeta con núcleo rocoso cubierto de hielos de agua, metano y amoníaco'),
('Enano', 'Cuerpo que orbita el Sol pero no ha limpiado su órbita'),
('Exoplaneta', 'Planeta ubicado fuera del Sistema Solar'),
('Super-Tierra', 'Exoplaneta rocoso más grande que la Tierra pero menor que Neptuno');

-- Tipos de Satélites
INSERT INTO `tipo_satelite` (`nombre`, `descripcion`) VALUES
('Natural', 'Satélite formado naturalmente junto al planeta'),
('Natural Irregular', 'Satélite capturado con órbita irregular'),
('Natural Regular', 'Satélite formado junto con el planeta'),
('Artificial', 'Satélite construido y lanzado por humanos'),
('Luna Mayor', 'Satélite natural de gran tamaño');

-- ============================================
-- 2. DESCUBRIDORES HISTÓRICOS
-- ============================================

INSERT INTO `descubridor` (`nombre_completo`, `nacionalidad`, `fecha_nacimiento`, `fecha_fallecimiento`, `biografia_breve`) VALUES
('Galileo Galilei', 'Italiana', '1564-02-15', '1642-01-08', 'Astrónomo, físico e ingeniero italiano, pionero de la observación astronómica telescópica'),
('William Herschel', 'Alemana-Británica', '1738-11-15', '1822-08-25', 'Astrónomo y compositor, descubridor de Urano y varios satélites'),
('Charles Messier', 'Francesa', '1730-06-26', '1817-04-12', 'Astrónomo francés famoso por su catálogo de objetos celestes'),
('Edwin Hubble', 'Estadounidense', '1889-11-20', '1953-09-28', 'Astrónomo que demostró la expansión del universo'),
('Asaph Hall', 'Estadounidense', '1829-10-15', '1907-11-22', 'Astrónomo descubridor de las lunas de Marte'),
('Christiaan Huygens', 'Neerlandesa', '1629-04-14', '1695-07-08', 'Matemático, físico y astrónomo, descubridor de Titán'),
('Giovanni Cassini', 'Italiana-Francesa', '1625-06-08', '1712-09-14', 'Astrónomo y matemático, descubridor de satélites de Saturno'),
('Michel Mayor', 'Suiza', '1942-01-12', NULL, 'Astrofísico, codescubridor del primer exoplaneta orbitando una estrella tipo solar'),
('Didier Queloz', 'Suiza', '1966-02-23', NULL, 'Astrónomo, codescubridor del primer exoplaneta 51 Pegasi b');

-- ============================================
-- 3. REFERENCIAS MITOLÓGICAS
-- ============================================

INSERT INTO `referencia_mitologica` (`cultura`, `nombre_deidad`, `tipo_entidad`, `dominio`, `historia_breve`, `simbolismo`) VALUES
('Griega', 'Gaia', 'Diosa Primordial', 'Diosa de la Tierra', 'Personificación de la Tierra, madre de todos los dioses y titanes', 'Tierra, fertilidad, naturaleza'),
('Romana', 'Terra', 'Diosa', 'Diosa de la Tierra', 'Equivalente romano de Gaia', 'Tierra, maternidad'),
('Griega', 'Ares', 'Dios', 'Dios de la guerra', 'Hijo de Zeus y Hera, dios de la guerra brutal y violenta', 'Guerra, violencia, valor'),
('Romana', 'Marte', 'Dios', 'Dios de la guerra', 'Equivalente romano de Ares, también asociado con la agricultura', 'Guerra, agricultura'),
('Romana', 'Júpiter', 'Dios', 'Rey de los dioses', 'Dios supremo del panteón romano, equivalente a Zeus', 'Poder, trueno, justicia'),
('Griega', 'Zeus', 'Dios', 'Rey de los dioses', 'Gobernante del Olimpo, dios del cielo y el trueno', 'Poder, autoridad, cielo'),
('Romana', 'Saturno', 'Dios', 'Dios de la agricultura', 'Dios de la agricultura y el tiempo, equivalente a Cronos', 'Tiempo, agricultura, cosecha'),
('Griega', 'Cronos', 'Titán', 'Titán del tiempo', 'Líder de los Titanes, padre de Zeus', 'Tiempo'),
('Griega', 'Selene', 'Diosa', 'Diosa de la Luna', 'Personificación de la Luna, hermana de Helios', 'Luna, ciclos, noche'),
('Griega', 'Orión', 'Héroe', 'Cazador gigante', 'Gigante cazador, hijo de Poseidón, amante de Artemisa', 'Caza, fuerza'),
('Griega', 'Andrómeda', 'Princesa', 'Princesa de Etiopía', 'Hija de Cefeo y Casiopea, rescatada por Perseo', 'Belleza, sacrificio'),
('Griega', 'Perseo', 'Héroe', 'Héroe matador de Medusa', 'Hijo de Zeus, mató a Medusa y rescató a Andrómeda', 'Heroísmo, valentía'),
('Griega', 'Casiopea', 'Reina', 'Reina de Etiopía', 'Madre de Andrómeda, castigada por su vanidad', 'Vanidad, belleza'),
('Griega', 'Fobos', 'Daimon', 'Personificación del miedo', 'Hijo de Ares, personificación del miedo en batalla', 'Miedo, terror'),
('Griega', 'Deimos', 'Daimon', 'Personificación del pavor', 'Hijo de Ares, personificación del pavor en batalla', 'Pavor, terror'),
('Griega', 'Pegaso', 'Criatura', 'Caballo alado', 'Caballo alado nacido de la sangre de Medusa', 'Inspiración, libertad'),
('Griega', 'Titán', 'Raza divina', 'Raza de dioses primordiales', 'Deidades anteriores a los olímpicos, hijos de Gaia y Urano', 'Poder primordial');

-- ============================================
-- 4. GALAXIAS
-- ============================================

INSERT INTO `galaxia` (`nombre`, `id_tipo_galaxia`, `distancia_tierra_millones_al`, `diametro_miles_al`, `magnitud_aparente`, `fecha_descubrimiento`, `id_descubridor`, `id_referencia_mitologica`) VALUES
('Vía Láctea', 2, 0, 105.7, -26.74, '1610-03-10', 1, NULL),
('Andrómeda', 2, 2.537, 220, 3.44, '1764-10-17', 3, 11),
('Messier 87', 3, 53.5, 120, 8.6, '1781-12-20', 3, NULL),
('Triángulo', 1, 2.73, 60, 5.72, '1764-08-25', 3, NULL),
('Remolino', 1, 23, 76, 8.4, '1773-10-13', 3, NULL);

-- ============================================
-- 5. CONSTELACIONES
-- ============================================

INSERT INTO `constelacion` (`id_galaxia`, `nombre`, `abreviatura`, `area_grados_cuadrados`, `num_estrellas_principales`, `visible_hemisferio`, `mejor_mes_observacion`, `fecha_descubrimiento`, `id_referencia_mitologica`, `leyenda`) VALUES
(1, 'Orión', 'Ori', 594, 7, 'Ambos', 1, '1550-01-01', 10, 'Orión era un cazador gigante que fue colocado entre las estrellas tras su muerte'),
(1, 'Cruz del Sur', 'Cru', 68, 5, 'Sur', 5, '1600-03-22', NULL, 'Constelación característica del hemisferio sur, utilizada para navegación'),
(2, 'Pegaso', 'Peg', 1121, 9, 'Norte', 10, '1750-04-06', 16, 'Representa al caballo alado nacido de la sangre de Medusa'),
(1, 'Andrómeda', 'And', 722, 3, 'Norte', 11, '1612-12-15', 11, 'Princesa etíope encadenada a una roca como sacrificio a un monstruo marino'),
(1, 'Casiopea', 'Cas', 598, 5, 'Norte', 11, '1600-01-01', 13, 'Reina de Etiopía castigada por su vanidad');

-- ============================================
-- 6. SISTEMAS SOLARES
-- ============================================

INSERT INTO `sistemasolar` (`id_galaxia`, `nombre`, `id_tipo_sistema`, `edad_millones_anos`, `distancia_centro_galactico_al`, `num_planetas`, `tiene_cinturon_asteroides`, `fecha_descubrimiento`, `metodo_descubrimiento`) VALUES
(1, 'Sistema Solar', 1, 4600, 26000, 8, TRUE, '1630-05-24', 'Observación directa'),
(2, 'Kepler-452', 4, 6000, NULL, 1, FALSE, '2015-07-23', 'Método de tránsito (telescopio espacial Kepler)'),
(1, 'Alpha Centauri', 2, 4850, 26710, 1, FALSE, '1839-12-01', 'Observación directa'),
(1, 'TRAPPIST-1', 1, 7600, NULL, 7, FALSE, '2016-05-02', 'Método de tránsito');

-- ============================================
-- 7. ESTRELLAS
-- ============================================

INSERT INTO `estrella` (`id_constelacion`, `nombre`, `nombre_alternativo`, `edad_millones_anos`, `id_tipo_estrella`, `clase_espectral`, `masa_solar`, `radio_solar`, `temperatura_kelvin`, `luminosidad_solar`, `magnitud_aparente`, `magnitud_absoluta`, `distancia_tierra_al`, `fase_evolutiva`, `fecha_descubrimiento`, `id_referencia_mitologica`) VALUES
(1, 'Betelgeuse', 'Alpha Orionis', 8, 5, 'M1-2 Ia-Iab', 20.0, 887.0, 3500, 126000, 0.42, -5.85, 548, 'Supergigante roja', '1920-12-30', NULL),
(1, 'Rigel', 'Beta Orionis', 8, 7, 'B8 Ia', 23.0, 78.9, 11000, 120000, 0.13, -7.84, 863, 'Supergigante azul', '1910-06-15', NULL),
(3, '51 Pegasi', 'Helvetios', 6000, 8, 'G5V', 1.11, 1.237, 5571, 1.27, 5.49, 4.52, 50.9, 'Secuencia principal', '1995-10-06', 16),
(1, 'Bellatrix', 'Gamma Orionis', 25, 7, 'B2 III', 8.6, 5.75, 22000, 9211, 1.64, -2.72, 250, 'Gigante azul', '1600-01-01', NULL),
(4, 'Alpheratz', 'Alpha Andromedae', 60, 7, 'B9p', 3.8, 2.7, 13800, 200, 2.06, -0.3, 97, 'Subgigante', '1600-01-01', NULL),
(1, 'Sol', 'Sun', 4600, 2, 'G2V', 1.0, 1.0, 5778, 1.0, -26.74, 4.83, 0.0000158, 'Secuencia principal', NULL, NULL);

-- ============================================
-- 8. RELACIÓN ESTRELLA-SISTEMA SOLAR
-- ============================================

INSERT INTO `estrella_sistemasolar` (`id_sistema`, `id_estrella`, `rol`, `es_estrella_central`) VALUES
(1, 6, 'Principal', TRUE),  -- Sol en Sistema Solar
(2, 3, 'Principal', TRUE),  -- 51 Pegasi en Kepler-452
(1, 1, 'Principal', FALSE), -- Betelgeuse visible desde Sistema Solar
(1, 2, 'Principal', FALSE); -- Rigel visible desde Sistema Solar

-- ============================================
-- 9. PLANETAS DEL SISTEMA SOLAR
-- ============================================

INSERT INTO `planeta` (`id_sistema`, `nombre`, `id_tipo_planeta`, `radio_km`, `masa_tierra`, `masa_kg`, `densidad_g_cm3`, `gravedad_m_s2`, `velocidad_escape_km_s`, `periodo_orbital_dias`, `periodo_rotacion_horas`, `distancia_estrella_ua`, `distancia_estrella_millones_km`, `excentricidad_orbital`, `inclinacion_orbital_grados`, `inclinacion_axial_grados`, `temperatura_media_celsius`, `presion_atmosferica_atm`, `tiene_atmosfera`, `composicion_atmosfera`, `tiene_campo_magnetico`, `tiene_anillos`, `num_satelites_naturales`, `albedo`, `orden_desde_estrella`, `es_habitable`, `tiene_agua_liquida`, `fecha_descubrimiento`, `id_referencia_mitologica`) VALUES

-- Mercurio
(1, 'Mercurio', 2, 2439.7, 0.055, 3.3011e23, 5.427, 3.7, 4.25, 87.97, 1407.6, 0.387, 57.9, 0.2056, 7.005, 0.034, 167, 0, FALSE, 'Trazas de oxígeno, sodio, hidrógeno, helio', TRUE, FALSE, 0, 0.142, 1, FALSE, FALSE, '1631-11-07', NULL),

-- Venus
(1, 'Venus', 2, 6051.8, 0.815, 4.8675e24, 5.243, 8.87, 10.36, 224.7, 5832.5, 0.723, 108.2, 0.0067, 3.39, 177.36, 464, 92, TRUE, '96.5% CO2, 3.5% N2', FALSE, FALSE, 0, 0.689, 2, FALSE, FALSE, '1610-01-07', NULL),

-- Tierra
(1, 'Tierra', 1, 6371.0, 1.0, 5.972e24, 5.514, 9.807, 11.186, 365.25, 24.0, 1.0, 149.6, 0.0167, 0.0, 23.44, 15, 1, TRUE, '78% N2, 21% O2, 1% Ar', TRUE, FALSE, 1, 0.306, 3, TRUE, TRUE, NULL, 1),

-- Marte
(1, 'Marte', 2, 3389.5, 0.107, 6.4171e23, 3.933, 3.721, 5.03, 686.98, 24.6, 1.524, 227.9, 0.0934, 1.85, 25.19, -65, 0.006, TRUE, '95% CO2, 3% N2, 1.6% Ar', FALSE, FALSE, 2, 0.250, 4, FALSE, TRUE, '1659-09-13', 4),

-- Júpiter
(1, 'Júpiter', 3, 69911, 317.8, 1.8982e27, 1.326, 24.79, 59.5, 4332.59, 9.9, 5.203, 778.5, 0.0489, 1.303, 3.13, -110, NULL, TRUE, '89% H2, 10% He, 1% otros', TRUE, TRUE, 79, 0.503, 5, FALSE, FALSE, '1610-01-07', 5),

-- Saturno
(1, 'Saturno', 3, 58232, 95.16, 5.6834e26, 0.687, 10.44, 35.5, 10759.22, 10.7, 9.537, 1427, 0.0565, 2.485, 26.73, -140, NULL, TRUE, '96% H2, 3% He, 1% otros', TRUE, TRUE, 82, 0.499, 6, FALSE, FALSE, '1610-01-01', 7),

-- Urano
(1, 'Urano', 4, 25362, 14.54, 8.6810e25, 1.271, 8.87, 21.3, 30688.5, 17.2, 19.191, 2871, 0.0457, 0.773, 97.77, -195, NULL, TRUE, '83% H2, 15% He, 2% CH4', TRUE, TRUE, 27, 0.488, 7, FALSE, FALSE, '1781-03-13', NULL),

-- Neptuno  
(1, 'Neptuno', 4, 24622, 17.15, 1.02413e26, 1.638, 11.15, 23.5, 60182, 16.1, 30.07, 4495, 0.0113, 1.767, 28.32, -200, NULL, TRUE, '80% H2, 19% He, 1% CH4', TRUE, TRUE, 14, 0.442, 8, FALSE, FALSE, '1846-09-23', NULL);

-- Exoplaneta Kepler-452b
INSERT INTO `planeta` (`id_sistema`, `nombre`, `id_tipo_planeta`, `radio_km`, `masa_tierra`, `periodo_orbital_dias`, `distancia_estrella_ua`, `temperatura_media_celsius`, `orden_desde_estrella`, `es_habitable`, `fecha_descubrimiento`, `metodo_descubrimiento`) VALUES
(2, 'Kepler-452b', 6, 9000, 5.0, 384.8, 1.046, -8, 1, TRUE, '2015-07-23', 'Método de tránsito');

-- ============================================
-- 10. SATÉLITES NATURALES
-- ============================================

INSERT INTO `satelite` (`id_planeta`, `nombre`, `id_tipo_satelite`, `radio_km`, `masa_kg`, `densidad_g_cm3`, `gravedad_m_s2`, `distancia_planeta_km`, `periodo_orbital_dias`, `tiene_atmosfera`, `temperatura_superficie_c`, `fecha_descubrimiento`, `id_descubridor`, `id_referencia_mitologica`) VALUES

-- Luna de la Tierra
(3, 'Luna', 5, 1737.4, 7.342e22, 3.344, 1.62, 384400, 27.321661, FALSE, -53, NULL, NULL, 9),

-- Satélites de Marte
(4, 'Fobos', 2, 11.267, 1.0659e16, 1.876, 0.0057, 9376, 0.31891, FALSE, -40, '1877-08-18', 5, 14),
(4, 'Deimos', 2, 6.2, 1.4762e15, 1.471, 0.003, 23463, 1.263, FALSE, -40, '1877-08-12', 5, 15),

-- Principales satélites de Júpiter (Lunas Galileanas)
(5, 'Ío', 3, 1821.6, 8.9319e22, 3.528, 1.796, 421700, 1.769, TRUE, -143, '1610-01-08', 1, NULL),
(5, 'Europa', 3, 1560.8, 4.7998e22, 3.013, 1.314, 671034, 3.551, TRUE, -160, '1610-01-08', 1, NULL),
(5, 'Ganímedes', 5, 2634.1, 1.4819e23, 1.942, 1.428, 1070412, 7.155, TRUE, -163, '1610-01-07', 1, NULL),
(5, 'Calisto', 3, 2410.3, 1.0759e23, 1.834, 1.235, 1882709, 16.689, TRUE, -139, '1610-01-07', 1, NULL),

-- Principal satélite de Saturno
(6, 'Titán', 5, 2574.7, 1.3452e23, 1.880, 1.352, 1221870, 15.945, TRUE, -179, '1655-03-25', 6, NULL),
(6, 'Encélado', 3, 252.1, 1.08e20, 1.609, 0.113, 237948, 1.370, TRUE, -198, '1789-08-28', 2, NULL),

-- Principales satélites de Urano
(7, 'Titania', 3, 788.9, 3.527e21, 1.711, 0.379, 435910, 8.706, FALSE, -203, '1787-01-11', 2, NULL),
(7, 'Oberón', 3, 761.4, 3.014e21, 1.630, 0.346, 583520, 13.463, FALSE, -198, '1787-01-11', 2, NULL),

-- Principal satélite de Neptuno
(8, 'Tritón', 5, 1353.4, 2.14e22, 2.061, 0.779, 354759, 5.877, TRUE, -235, '1846-10-10', 2, NULL);

-- ============================================
-- VERIFICACIÓN DE DATOS INSERTADOS
-- ============================================

-- Contar registros por tabla
SELECT 'Galaxias' AS Tabla, COUNT(*) AS Total FROM galaxia
UNION ALL SELECT 'Constelaciones', COUNT(*) FROM constelacion
UNION ALL SELECT 'Sistemas Solares', COUNT(*) FROM sistemasolar
UNION ALL SELECT 'Estrellas', COUNT(*) FROM estrella
UNION ALL SELECT 'Planetas', COUNT(*) FROM planeta
UNION ALL SELECT 'Satélites', COUNT(*) FROM satelite
UNION ALL SELECT 'Descubridores', COUNT(*) FROM descubridor
UNION ALL SELECT 'Referencias Mitológicas', COUNT(*) FROM referencia_mitologica;

-- ============================================
-- CONSULTAS DE EJEMPLO
-- ============================================

-- Ver planetas del Sistema Solar con mitología
SELECT 
    p.orden_desde_estrella AS 'Posición',
    p.nombre AS 'Planeta',
    tp.nombre AS 'Tipo',
    ROUND(p.distancia_estrella_ua, 3) AS 'Distancia (UA)',
    p.num_satelites_naturales AS 'Lunas',
    rm.nombre_deidad AS 'Dios Asociado',
    rm.cultura AS 'Mitología'
FROM planeta p
LEFT JOIN tipo_planeta tp ON p.id_tipo_planeta = tp.id_tipo_planeta
LEFT JOIN sistemasolar s ON p.id_sistema = s.id_sistema
LEFT JOIN referencia_mitologica rm ON p.id_referencia_mitologica = rm.id_referencia
WHERE s.nombre = 'Sistema Solar'
ORDER BY p.orden_desde_estrella;

-- Ver estrellas de Orión
SELECT 
    e.nombre AS 'Estrella',
    te.nombre AS 'Tipo',
    e.temperatura_kelvin AS 'Temperatura (K)',
    e.magnitud_aparente AS 'Magnitud',
    e.distancia_tierra_al AS 'Distancia (años luz)'
FROM estrella e
LEFT JOIN tipo_estrella te ON e.id_tipo_estrella = te.id_tipo_estrella
LEFT JOIN constelacion c ON e.id_constelacion = c.id_constelacion
WHERE c.nombre = 'Orión'
ORDER BY e.magnitud_aparente;

-- ============================================
-- FIN DEL SCRIPT DE DATOS
-- ============================================