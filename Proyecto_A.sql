-- MySQL dump 10.19  Distrib 10.3.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Proyecto_A
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
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categoria` (
  `ID_categoria` int(11) NOT NULL,
  `XPATH_url_principal` varchar(250) DEFAULT NULL,
  `XPATH_url_especifico` varchar(250) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `ID_noticia` int(11) DEFAULT NULL,
  `ID_prensa` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_categoria`),
  KEY `ID_prensa` (`ID_prensa`),
  KEY `ID_noticia` (`ID_noticia`),
  CONSTRAINT `Categoria_ibfk_1` FOREIGN KEY (`ID_prensa`) REFERENCES `Medio_de_prensa` (`ID_prensa`),
  CONSTRAINT `Categoria_ibfk_2` FOREIGN KEY (`ID_noticia`) REFERENCES `Noticia` (`ID_noticia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fundadores`
--

DROP TABLE IF EXISTS `Fundadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fundadores` (
  `Fecha_nacimiento` date DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `ID_Fundador` int(11) NOT NULL,
  `ID_prensa` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Fundador`),
  KEY `ID_prensa` (`ID_prensa`),
  CONSTRAINT `Fundadores_ibfk_1` FOREIGN KEY (`ID_prensa`) REFERENCES `Medio_de_prensa` (`ID_prensa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fundadores`
--

LOCK TABLES `Fundadores` WRITE;
/*!40000 ALTER TABLE `Fundadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fundadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medio_de_prensa`
--

DROP TABLE IF EXISTS `Medio_de_prensa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Medio_de_prensa` (
  `ID_prensa` int(11) NOT NULL,
  `Anio_fundacion` date DEFAULT NULL,
  `URL_sitio_web` varchar(255) DEFAULT NULL,
  `Cobertura` varchar(255) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_prensa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medio_de_prensa`
--

LOCK TABLES `Medio_de_prensa` WRITE;
/*!40000 ALTER TABLE `Medio_de_prensa` DISABLE KEYS */;
/*!40000 ALTER TABLE `Medio_de_prensa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Noticia`
--

DROP TABLE IF EXISTS `Noticia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Noticia` (
  `ID_noticia` int(11) NOT NULL,
  `XPATH_titulo` varchar(250) DEFAULT NULL,
  `XPATH_contenido` varchar(250) DEFAULT NULL,
  `XPATH_url` varchar(250) DEFAULT NULL,
  `XPATH_fecha` varchar(250) DEFAULT NULL,
  `ID_prensa` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_noticia`),
  KEY `ID_prensa` (`ID_prensa`),
  CONSTRAINT `Noticia_ibfk_1` FOREIGN KEY (`ID_prensa`) REFERENCES `Medio_de_prensa` (`ID_prensa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Noticia`
--

LOCK TABLES `Noticia` WRITE;
/*!40000 ALTER TABLE `Noticia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Noticia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Redes_sociales`
--

DROP TABLE IF EXISTS `Redes_sociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Redes_sociales` (
  `ID_red` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Num_seguidores` int(11) DEFAULT NULL,
  `Plataforma` varchar(50) DEFAULT NULL,
  `ID_prensa` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_red`),
  KEY `ID_prensa` (`ID_prensa`),
  CONSTRAINT `Redes_sociales_ibfk_1` FOREIGN KEY (`ID_prensa`) REFERENCES `Medio_de_prensa` (`ID_prensa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Redes_sociales`
--

LOCK TABLES `Redes_sociales` WRITE;
/*!40000 ALTER TABLE `Redes_sociales` DISABLE KEYS */;
/*!40000 ALTER TABLE `Redes_sociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ubicacion`
--

DROP TABLE IF EXISTS `Ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ubicacion` (
  `ID_ubicacion` int(11) NOT NULL,
  `Region` varchar(50) DEFAULT NULL,
  `Pais` varchar(50) DEFAULT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  `Continente` varchar(50) DEFAULT NULL,
  `ID_prensa` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_ubicacion`),
  KEY `ID_prensa` (`ID_prensa`),
  CONSTRAINT `Ubicacion_ibfk_1` FOREIGN KEY (`ID_prensa`) REFERENCES `Medio_de_prensa` (`ID_prensa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ubicacion`
--

LOCK TABLES `Ubicacion` WRITE;
/*!40000 ALTER TABLE `Ubicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ubicacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-22 22:07:04
