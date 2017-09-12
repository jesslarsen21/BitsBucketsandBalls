CREATE DATABASE  IF NOT EXISTS `scrummybear` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `scrummybear`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: scrummybear
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `level2`
--

DROP TABLE IF EXISTS `level2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level2` (
  `stud_id` int(11) unsigned NOT NULL,
  `r1_score` int(11) unsigned NOT NULL DEFAULT '0',
  `r2_score` int(11) unsigned NOT NULL DEFAULT '0',
  `r3_score` int(11) unsigned NOT NULL DEFAULT '0',
  `r4_score` int(11) unsigned NOT NULL DEFAULT '0',
  `r5_score` int(11) unsigned NOT NULL DEFAULT '0',
  `r6_score` int(11) unsigned NOT NULL DEFAULT '0',
  `r7_score` int(11) unsigned NOT NULL DEFAULT '0',
  `r8_score` int(11) unsigned NOT NULL DEFAULT '0',
  `r9_score` int(11) unsigned NOT NULL DEFAULT '0',
  `r10_score` int(11) unsigned NOT NULL DEFAULT '0',
  `r11_score` int(11) unsigned NOT NULL DEFAULT '0',
  `r12_score` int(11) unsigned NOT NULL DEFAULT '0',
  `r14_score` int(11) unsigned NOT NULL DEFAULT '0',
  `r15_score` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stud_id`),
  CONSTRAINT `level2_id` FOREIGN KEY (`stud_id`) REFERENCES `students` (`stud_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level2`
--

LOCK TABLES `level2` WRITE;
/*!40000 ALTER TABLE `level2` DISABLE KEYS */;
INSERT INTO `level2` VALUES (869073,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `level2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-20 22:15:03
