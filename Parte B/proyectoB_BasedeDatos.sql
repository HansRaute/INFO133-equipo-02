-- MySQL dump 10.19  Distrib 10.3.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: proyectoB_BasedeDatos
-- ------------------------------------------------------
-- Server version	10.3.38-MariaDB-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Centros_de_salud`
--

DROP TABLE IF EXISTS `Centros_de_salud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Centros_de_salud` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `id_comuna` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_comuna` (`id_comuna`),
  CONSTRAINT `Centros_de_salud_ibfk_1` FOREIGN KEY (`id_comuna`) REFERENCES `Comuna` (`id_comuna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Centros_de_salud`
--

LOCK TABLES `Centros_de_salud` WRITE;
/*!40000 ALTER TABLE `Centros_de_salud` DISABLE KEYS */;
/*!40000 ALTER TABLE `Centros_de_salud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comuna`
--

DROP TABLE IF EXISTS `Comuna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comuna` (
  `id_comuna` int(11) NOT NULL,
  `superficie` float DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `alcalde` varchar(20) DEFAULT NULL,
  `poblacion` int(11) DEFAULT NULL,
  `num_region` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_comuna`),
  KEY `num_region` (`num_region`),
  CONSTRAINT `Comuna_ibfk_1` FOREIGN KEY (`num_region`) REFERENCES `Region` (`num_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comuna`
--

LOCK TABLES `Comuna` WRITE;
/*!40000 ALTER TABLE `Comuna` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comuna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estadisticas_laborales`
--

DROP TABLE IF EXISTS `Estadisticas_laborales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estadisticas_laborales` (
  `id` int(11) NOT NULL,
  `h_laborantes` int(11) DEFAULT NULL,
  `m_laborantes` int(11) DEFAULT NULL,
  `h_desocupados` int(11) DEFAULT NULL,
  `m_desocupadas` int(11) DEFAULT NULL,
  `id_comuna` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_comuna` (`id_comuna`),
  CONSTRAINT `Estadisticas_laborales_ibfk_1` FOREIGN KEY (`id_comuna`) REFERENCES `Comuna` (`id_comuna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estadisticas_laborales`
--

LOCK TABLES `Estadisticas_laborales` WRITE;
/*!40000 ALTER TABLE `Estadisticas_laborales` DISABLE KEYS */;
/*!40000 ALTER TABLE `Estadisticas_laborales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Indice_bienestar`
--

DROP TABLE IF EXISTS `Indice_bienestar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Indice_bienestar` (
  `id` int(11) NOT NULL,
  `año` int(11) DEFAULT NULL,
  `ingresos` float DEFAULT NULL,
  `gastos` float DEFAULT NULL,
  `id_comuna` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_comuna` (`id_comuna`),
  CONSTRAINT `Indice_bienestar_ibfk_1` FOREIGN KEY (`id_comuna`) REFERENCES `Comuna` (`id_comuna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Indice_bienestar`
--

LOCK TABLES `Indice_bienestar` WRITE;
/*!40000 ALTER TABLE `Indice_bienestar` DISABLE KEYS */;
/*!40000 ALTER TABLE `Indice_bienestar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pais`
--

DROP TABLE IF EXISTS `Pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pais` (
  `id_pais` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pais`
--

LOCK TABLES `Pais` WRITE;
/*!40000 ALTER TABLE `Pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Region`
--

DROP TABLE IF EXISTS `Region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Region` (
  `num_region` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Region`
--

LOCK TABLES `Region` WRITE;
/*!40000 ALTER TABLE `Region` DISABLE KEYS */;
/*!40000 ALTER TABLE `Region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transporte`
--

DROP TABLE IF EXISTS `Transporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transporte` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `id_comuna` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_comuna` (`id_comuna`),
  CONSTRAINT `Transporte_ibfk_1` FOREIGN KEY (`id_comuna`) REFERENCES `Comuna` (`id_comuna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transporte`
--

LOCK TABLES `Transporte` WRITE;
/*!40000 ALTER TABLE `Transporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transporte` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-14 11:12:31
