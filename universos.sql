CREATE DATABASE  IF NOT EXISTS `universos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `universos`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: universos
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `constelacion`
--

DROP TABLE IF EXISTS `constelacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `constelacion` (
  `id_constelacion` int NOT NULL AUTO_INCREMENT,
  `id_galaxia` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_descubrimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_constelacion`),
  KEY `fk_constelacion_galaxia` (`id_galaxia`),
  CONSTRAINT `fk_constelacion_galaxia` FOREIGN KEY (`id_galaxia`) REFERENCES `galaxia` (`id_galaxia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constelacion`
--

LOCK TABLES `constelacion` WRITE;
/*!40000 ALTER TABLE `constelacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `constelacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estrella`
--

DROP TABLE IF EXISTS `estrella`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estrella` (
  `id_estrella` int NOT NULL AUTO_INCREMENT,
  `id_constelacion` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `edad` varchar(50) DEFAULT NULL,
  `tipo_estrella` varchar(50) DEFAULT NULL,
  `fecha_descubrimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_estrella`),
  KEY `fk_estrella_constelacion` (`id_constelacion`),
  CONSTRAINT `fk_estrella_constelacion` FOREIGN KEY (`id_constelacion`) REFERENCES `constelacion` (`id_constelacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estrella`
--

LOCK TABLES `estrella` WRITE;
/*!40000 ALTER TABLE `estrella` DISABLE KEYS */;
/*!40000 ALTER TABLE `estrella` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estrella_sistemasolar`
--

DROP TABLE IF EXISTS `estrella_sistemasolar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estrella_sistemasolar` (
  `id_ESS` int NOT NULL AUTO_INCREMENT,
  `id_sistema` int NOT NULL,
  `id_estrella` int NOT NULL,
  PRIMARY KEY (`id_ESS`),
  UNIQUE KEY `uq_es_sis` (`id_sistema`,`id_estrella`),
  KEY `fk_es_sis_estrella` (`id_estrella`),
  CONSTRAINT `fk_es_sis_estrella` FOREIGN KEY (`id_estrella`) REFERENCES `estrella` (`id_estrella`),
  CONSTRAINT `fk_es_sis_sistema` FOREIGN KEY (`id_sistema`) REFERENCES `sistemasolar` (`id_sistema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estrella_sistemasolar`
--

LOCK TABLES `estrella_sistemasolar` WRITE;
/*!40000 ALTER TABLE `estrella_sistemasolar` DISABLE KEYS */;
/*!40000 ALTER TABLE `estrella_sistemasolar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galaxia`
--

DROP TABLE IF EXISTS `galaxia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galaxia` (
  `id_galaxia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha_descubrimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_galaxia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galaxia`
--

LOCK TABLES `galaxia` WRITE;
/*!40000 ALTER TABLE `galaxia` DISABLE KEYS */;
/*!40000 ALTER TABLE `galaxia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planeta`
--

DROP TABLE IF EXISTS `planeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planeta` (
  `id_planeta` int NOT NULL AUTO_INCREMENT,
  `id_sistema` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_planeta` varchar(50) DEFAULT NULL,
  `tamano` varchar(50) DEFAULT NULL,
  `fecha_descubrimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_planeta`),
  KEY `fk_planeta_sistema` (`id_sistema`),
  CONSTRAINT `fk_planeta_sistema` FOREIGN KEY (`id_sistema`) REFERENCES `sistemasolar` (`id_sistema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planeta`
--

LOCK TABLES `planeta` WRITE;
/*!40000 ALTER TABLE `planeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `planeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `satelite`
--

DROP TABLE IF EXISTS `satelite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `satelite` (
  `id_satelite` int NOT NULL AUTO_INCREMENT,
  `id_planeta` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_satelite` varchar(50) DEFAULT NULL,
  `fecha_descubrimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_satelite`),
  KEY `fk_satelite_planeta` (`id_planeta`),
  CONSTRAINT `fk_satelite_planeta` FOREIGN KEY (`id_planeta`) REFERENCES `planeta` (`id_planeta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `satelite`
--

LOCK TABLES `satelite` WRITE;
/*!40000 ALTER TABLE `satelite` DISABLE KEYS */;
/*!40000 ALTER TABLE `satelite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistemasolar`
--

DROP TABLE IF EXISTS `sistemasolar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sistemasolar` (
  `id_sistema` int NOT NULL AUTO_INCREMENT,
  `id_galaxia` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `edad` varchar(50) DEFAULT NULL,
  `fecha_descubrimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_sistema`),
  KEY `fk_sistema_galaxia` (`id_galaxia`),
  CONSTRAINT `fk_sistema_galaxia` FOREIGN KEY (`id_galaxia`) REFERENCES `galaxia` (`id_galaxia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistemasolar`
--

LOCK TABLES `sistemasolar` WRITE;
/*!40000 ALTER TABLE `sistemasolar` DISABLE KEYS */;
/*!40000 ALTER TABLE `sistemasolar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-25  0:17:02
