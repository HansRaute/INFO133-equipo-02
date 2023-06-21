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
-- Table structure for table `MedioDePrensa`
--

DROP TABLE IF EXISTS `MedioDePrensa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MedioDePrensa` (
  `ID_Prensa` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `AñoDeFundacion` int(11) DEFAULT NULL,
  `Cobertura` varchar(50) DEFAULT NULL,
  `NombreDeFundadores` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Prensa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MedioDePrensa`
--

LOCK TABLES `MedioDePrensa` WRITE;
/*!40000 ALTER TABLE `MedioDePrensa` DISABLE KEYS */;
/*!40000 ALTER TABLE `MedioDePrensa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RedesSociales`
--

DROP TABLE IF EXISTS `RedesSociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RedesSociales` (
  `ID_Red` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Num_Seguidores` int(11) DEFAULT NULL,
  `ID_Prensa` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Red`),
  KEY `ID_Prensa` (`ID_Prensa`),
  CONSTRAINT `RedesSociales_ibfk_1` FOREIGN KEY (`ID_Prensa`) REFERENCES `MedioDePrensa` (`ID_Prensa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RedesSociales`
--

LOCK TABLES `RedesSociales` WRITE;
/*!40000 ALTER TABLE `RedesSociales` DISABLE KEYS */;
/*!40000 ALTER TABLE `RedesSociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SitioWeb`
--

DROP TABLE IF EXISTS `SitioWeb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SitioWeb` (
  `IDS` int(11) NOT NULL,
  `Categoria` varchar(50) DEFAULT NULL,
  `URLCategoria` varchar(100) DEFAULT NULL,
  `URL_Principal` varchar(50) DEFAULT NULL,
  `ID_Prensa` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDS`),
  KEY `ID_Prensa` (`ID_Prensa`),
  CONSTRAINT `SitioWeb_ibfk_1` FOREIGN KEY (`ID_Prensa`) REFERENCES `MedioDePrensa` (`ID_Prensa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SitioWeb`
--

LOCK TABLES `SitioWeb` WRITE;
/*!40000 ALTER TABLE `SitioWeb` DISABLE KEYS */;
/*!40000 ALTER TABLE `SitioWeb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ubicacion`
--

DROP TABLE IF EXISTS `Ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ubicacion` (
  `IDU` int(11) NOT NULL,
  `Region` varchar(50) DEFAULT NULL,
  `Pais` varchar(50) DEFAULT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  `Continente` varchar(50) DEFAULT NULL,
  `ID_Prensa` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDU`),
  KEY `ID_Prensa` (`ID_Prensa`),
  CONSTRAINT `Ubicacion_ibfk_1` FOREIGN KEY (`ID_Prensa`) REFERENCES `MedioDePrensa` (`ID_Prensa`)
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

-- Dump completed on 2023-06-21 17:07:00
