# Universos - Base de Datos del Universo

![MySQL](https://img.shields.io/badge/MySQL-8.0-blue)
![Normalización](https://img.shields.io/badge/Normalización-3FN-green)
![Estado](https://img.shields.io/badge/Estado-En%20Desarrollo-yellow)

## Descripción del Proyecto

Base de datos relacional que modela la estructura jerárquica del universo, incluyendo galaxias, constelaciones, sistemas solares, estrellas, planetas y satélites. El proyecto integra información científica con referencias culturales y mitológicas, especialmente de la mitología griega y romana.

**Institución:** Benemérita Universidad Autónoma de Puebla (BUAP)  
**Materia:** Bases de Datos  
**Profesora:** Meliza Contreras  
**Periodo:** Otoño 2025

## Equipo de Desarrollo

- **Steffany Paola Galicia Arriaga**
- **Ivan Luna Martínez**
- **Yael Valencia Cruz**
- **Gonzalo Montiel Santos**

## Objetivos

1. Diseñar e implementar un modelo de base de datos relacional normalizado
2. Registrar información científica sobre cuerpos celestes
3. Vincular el conocimiento astronómico con referencias mitológicas
4. Crear una herramienta educativa y organizada para consultas astronómicas
5. Mantener la integridad referencial y optimizar consultas

## Estructura del Proyecto

```
Universos_BDD/
├── README.md                    # Este archivo
├── .gitignore                   # Protección de archivos sensibles
├── universos.sql                # Estructura original de la BD
├── datos.sql                    # Datos originales de ejemplo
└── Universos_documentación.docx       # Documentación del proyecto
```

## Arquitectura de la Base de Datos

### Entidades Principales

#### 1. **Galaxia** (Entidad Fuerte)
- Representa agrupaciones masivas de sistemas estelares
- Ejemplo: Vía Láctea, Andrómeda

#### 2. **Constelación** (Entidad Débil)
- Patrones de estrellas visibles desde la Tierra
- Vinculadas con mitología
- Ejemplo: Orión, Casiopea

#### 3. **Sistema Solar** (Entidad Débil)
- Conjunto de cuerpos que orbitan una o varias estrellas
- Ejemplo: Sistema Solar, Kepler-452

#### 4. **Estrella** (Entidad Débil)
- Cuerpos celestes que generan luz y energía
- Clasificadas por tipo espectral
- Ejemplo: Sol, Betelgeuse, Rigel

#### 5. **Planeta** (Entidad Débil)
- Cuerpos que orbitan estrellas
- Clasificados por tipo (terrestre, gaseoso, etc.)
- Ejemplo: Tierra, Marte, Júpiter

#### 6. **Satélite** (Entidad Débil)
- Cuerpos que orbitan planetas
- Naturales o artificiales
- Ejemplo: Luna, Fobos, Titán

### Entidades de Soporte

- **Descubridor**: Astrónomos y científicos históricos
- **Referencia Mitológica**: Conexión con mitología griega/romana
- **Catálogos de Tipos**: Normalización de tipos de cuerpos celestes

## Modelo Entidad-Relación

### Relaciones Principales

```
Galaxia (1) ─contiene─> (N) Constelación
Galaxia (1) ─posee────> (N) Sistema Solar
Constelación (1) ─incluye──> (N) Estrella
Sistema Solar (1) ─se compone─> (0..N) Planeta
Sistema Solar (N) ←─tiene─→ (N) Estrella [tabla asociativa]
Planeta (1) ─es orbitado por─> (0..N) Satélite
```

## Instalación y Uso

### Requisitos Previos

- MySQL 8.0 o superior
- MySQL Workbench (opcional, recomendado)
- Cliente MySQL CLI

### Instalación

#### Opción 1: Estructura Mejorada (Recomendada)

```bash
# 1. Crear la base de datos con estructura mejorada
mysql -u root -p < universos_mejorado.sql

# 2. Cargar datos de ejemplo mejorados
mysql -u root -p < datos_mejorados.sql
```

#### Opción 2: Estructura Original

```bash
# 1. Crear la base de datos original
mysql -u root -p < universos.sql

# 2. Cargar datos originales
mysql -u root -p < datos.sql
```

### Verificación de Instalación

```sql
USE universos;

-- Verificar tablas creadas
SHOW TABLES;

-- Contar registros
SELECT 'Galaxias' AS Tabla, COUNT(*) AS Total FROM galaxia
UNION ALL SELECT 'Planetas', COUNT(*) FROM planeta
UNION ALL SELECT 'Estrellas', COUNT(*) FROM estrella;
```

## Ejemplos de Consultas

### Consultas Básicas

```sql
-- Listar todos los planetas del Sistema Solar
SELECT nombre, orden_desde_estrella, masa_tierra, num_satelites_naturales
FROM planeta
WHERE id_sistema = 1
ORDER BY orden_desde_estrella;

-- Ver estrellas más brillantes de Orión
SELECT nombre, magnitud_aparente, temperatura_kelvin, distancia_tierra_al
FROM estrella
WHERE id_constelacion = (SELECT id_constelacion FROM constelacion WHERE nombre = 'Orión')
ORDER BY magnitud_aparente;
```

### Consultas con Mitología

```sql
-- Planetas con sus deidades asociadas
SELECT 
    p.nombre AS planeta,
    rm.nombre_deidad AS dios,
    rm.cultura,
    rm.dominio
FROM planeta p
INNER JOIN referencia_mitologica rm ON p.id_referencia_mitologica = rm.id_referencia;
```

### Uso de Vistas

```sql
-- Ver jerarquía completa
SELECT * FROM vista_jerarquia_completa WHERE galaxia = 'Vía Láctea';

-- Planetas con mitología
SELECT * FROM vista_planetas_mitologia;

-- Sistema Solar completo
SELECT * FROM vista_sistema_solar_completo WHERE sistema = 'Sistema Solar';
```

### Uso de Procedimientos Almacenados

```sql
-- Buscar cualquier cuerpo celeste
CALL buscar_cuerpo_celeste('Marte');

-- Agregar un nuevo planeta
CALL agregar_planeta(1, 'Neptuno', 'Gigante de Hielo', 8, 24622, 17.15);
```

## Características Técnicas

### Normalización
- ✅ **Primera Forma Normal (1FN)**: Todos los campos son atómicos
- ✅ **Segunda Forma Normal (2FN)**: Sin dependencias parciales
- ✅ **Tercera Forma Normal (3FN)**: Sin dependencias transitivas

### Mejoras Implementadas

1. **Tipos de Datos Correctos**
   - `DECIMAL` para medidas numéricas (en lugar de VARCHAR)
   - `BOOLEAN` para banderas
   - `ENUM` para valores controlados

2. **Integridad Referencial**
   - Foreign Keys con `ON DELETE CASCADE`
   - Índices en campos de búsqueda frecuente
   - Constraints UNIQUE donde corresponde

3. **Optimización**
   - Índices en nombres y campos de búsqueda
   - Vistas predefinidas para consultas complejas
   - Procedimientos almacenados para operaciones comunes

4. **Triggers Automáticos**
   - Actualización automática de contadores
   - Validaciones de integridad

## 📚 Documentación Adicional

### Campos Científicos Incluidos

Para cada cuerpo celeste se incluyen medidas reales:

- **Estrellas**: masa solar, radio solar, temperatura, luminosidad, magnitud
- **Planetas**: masa, radio, densidad, gravedad, períodos orbitales
- **Satélites**: órbita, composición, características físicas

### Referencias Culturales

El proyecto integra mitología greco-romana:
- **Planetas**: Júpiter (Zeus), Marte (Ares), Venus (Afrodita)
- **Constelaciones**: Orión, Andrómeda, Perseo, Casiopea
- **Satélites**: Fobos, Deimos, Titán, Europa

## Seguridad

### Archivos Protegidos (.gitignore)

El archivo `.gitignore` protege:
- ✅ Credenciales y configuraciones
- ✅ Documentos personales del equipo
- ✅ Backups con datos reales
- ✅ Archivos temporales del sistema

### Buenas Prácticas

- 🔒 Nunca subir contraseñas reales al repositorio
- 🔒 Usar datos de ejemplo en archivos públicos
- 🔒 Mantener backups locales seguros
- 🔒 Revisar commits antes de publicar

## 🤝 Contribuciones

Este es un proyecto académico del equipo. Para sugerencias o mejoras:

1. Revisar la estructura actual
2. Proponer cambios documentados
3. Respetar la normalización existente
4. Mantener consistencia en nomenclatura

## Contacto

**Institución:** Benemérita Universidad Autónoma de Puebla  
**Facultad:** Ciencias de la Computación  
**Materia:** Bases de Datos  
**Profesora:** Meliza Contreras

## Licencia

Proyecto académico para uso educativo - BUAP 2025

---

## Agradecimientos

- A la profesora Meliza Contreras por la guía en el proyecto
- A la NASA y ESA por datos astronómicos públicos
- A la comunidad de astrónomos por el conocimiento compartido

---

**Última actualización:** Diciembre 2025  
**Versión de la Base de Datos:** 2.0 (Mejorada y Normalizada)