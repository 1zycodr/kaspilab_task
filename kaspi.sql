-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: localhost    Database: kaspi
-- ------------------------------------------------------
-- Server version	5.7.35-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `V_NOTPROCESSED`
--

DROP TABLE IF EXISTS `V_NOTPROCESSED`;
/*!50001 DROP VIEW IF EXISTS `V_NOTPROCESSED`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `V_NOTPROCESSED` AS SELECT 
 1 AS `id`,
 1 AS `key`,
 1 AS `index`,
 1 AS `date`,
 1 AS `open`,
 1 AS `high`,
 1 AS `low`,
 1 AS `close`,
 1 AS `adjclose`,
 1 AS `volume`,
 1 AS `region`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `V_PROCESSED`
--

DROP TABLE IF EXISTS `V_PROCESSED`;
/*!50001 DROP VIEW IF EXISTS `V_PROCESSED`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `V_PROCESSED` AS SELECT 
 1 AS `year`,
 1 AS `month`,
 1 AS `low`,
 1 AS `open`,
 1 AS `currency`,
 1 AS `exchange`,
 1 AS `region`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` int(11) DEFAULT NULL,
  `index` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `open` decimal(10,0) DEFAULT NULL,
  `high` decimal(10,0) DEFAULT NULL,
  `low` decimal(10,0) DEFAULT NULL,
  `close` decimal(10,0) DEFAULT NULL,
  `adjclose` decimal(10,0) DEFAULT NULL,
  `volume` decimal(15,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1124571 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region` varchar(100) DEFAULT NULL,
  `exchange` varchar(100) DEFAULT NULL,
  `index` varchar(100) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processed`
--

DROP TABLE IF EXISTS `processed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` int(11) DEFAULT NULL,
  `index` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `open` decimal(10,0) DEFAULT NULL,
  `high` decimal(10,0) DEFAULT NULL,
  `low` decimal(10,0) DEFAULT NULL,
  `close` decimal(10,0) DEFAULT NULL,
  `adjclose` decimal(10,0) DEFAULT NULL,
  `volume` decimal(15,0) DEFAULT NULL,
  `closeUSD` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=938035 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processed`
--

LOCK TABLES `processed` WRITE;
/*!40000 ALTER TABLE `processed` DISABLE KEYS */;
/*!40000 ALTER TABLE `processed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `V_NOTPROCESSED`
--

/*!50001 DROP VIEW IF EXISTS `V_NOTPROCESSED`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dbuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `V_NOTPROCESSED` AS select `data`.`id` AS `id`,`data`.`key` AS `key`,`data`.`index` AS `index`,`data`.`date` AS `date`,`data`.`open` AS `open`,`data`.`high` AS `high`,`data`.`low` AS `low`,`data`.`close` AS `close`,`data`.`adjclose` AS `adjclose`,`data`.`volume` AS `volume`,`info`.`region` AS `region` from (`data` join `info` on((`info`.`index` = `data`.`index`))) where (not(`data`.`key` in (select distinct `processed`.`key` from `processed`))) order by `info`.`region` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `V_PROCESSED`
--

/*!50001 DROP VIEW IF EXISTS `V_PROCESSED`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dbuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `V_PROCESSED` AS select year(`processed`.`date`) AS `year`,month(`processed`.`date`) AS `month`,min(`processed`.`low`) AS `low`,max(`processed`.`open`) AS `open`,`info`.`currency` AS `currency`,`info`.`exchange` AS `exchange`,`info`.`region` AS `region` from (`processed` join `info` on((`info`.`index` = `processed`.`index`))) group by `info`.`region`,`info`.`exchange`,`info`.`currency`,`year`,`month` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-28 19:44:31
