-- MySQL dump 10.16  Distrib 10.1.20-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.20-MariaDB-1~jessie

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
-- Current Database: `spotweb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `spotweb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `spotweb`;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resourceid` varchar(128) NOT NULL DEFAULT '',
  `cachetype` int(11) NOT NULL DEFAULT '0',
  `stamp` int(11) NOT NULL DEFAULT '0',
  `metadata` text,
  `ttl` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cache_1` (`resourceid`,`cachetype`),
  KEY `idx_cache_2` (`cachetype`,`stamp`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentsfull`
--

DROP TABLE IF EXISTS `commentsfull`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commentsfull` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageid` varchar(128) NOT NULL DEFAULT '',
  `fromhdr` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `stamp` int(11) DEFAULT NULL,
  `usersignature` varchar(255) DEFAULT NULL,
  `userkey` varchar(512) DEFAULT NULL,
  `spotterid` varchar(32) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `hashcash` varchar(255) DEFAULT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `verified` tinyint(1) DEFAULT NULL,
  `avatar` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_commentsfull_1` (`messageid`),
  CONSTRAINT `commentsfull_ibfk_1` FOREIGN KEY (`messageid`) REFERENCES `commentsxover` (`messageid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentsfull`
--

LOCK TABLES `commentsfull` WRITE;
/*!40000 ALTER TABLE `commentsfull` DISABLE KEYS */;
/*!40000 ALTER TABLE `commentsfull` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentsposted`
--

DROP TABLE IF EXISTS `commentsposted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commentsposted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ouruserid` int(11) NOT NULL DEFAULT '0',
  `messageid` varchar(128) NOT NULL DEFAULT '',
  `inreplyto` varchar(128) NOT NULL DEFAULT '',
  `randompart` varchar(32) NOT NULL DEFAULT '',
  `rating` int(11) NOT NULL DEFAULT '0',
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `stamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_commentsposted_1` (`messageid`),
  KEY `idx_commentspostedrel_1` (`ouruserid`),
  CONSTRAINT `commentsposted_ibfk_1` FOREIGN KEY (`ouruserid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentsposted`
--

LOCK TABLES `commentsposted` WRITE;
/*!40000 ALTER TABLE `commentsposted` DISABLE KEYS */;
/*!40000 ALTER TABLE `commentsposted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentsxover`
--

DROP TABLE IF EXISTS `commentsxover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commentsxover` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageid` varchar(128) NOT NULL DEFAULT '',
  `nntpref` varchar(128) NOT NULL DEFAULT '',
  `spotrating` int(11) DEFAULT '0',
  `moderated` tinyint(1) DEFAULT NULL,
  `stamp` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_commentsxover_1` (`messageid`),
  KEY `idx_commentsxover_2` (`nntpref`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentsxover`
--

LOCK TABLES `commentsxover` WRITE;
/*!40000 ALTER TABLE `commentsxover` DISABLE KEYS */;
/*!40000 ALTER TABLE `commentsxover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debuglog`
--

DROP TABLE IF EXISTS `debuglog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debuglog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stamp` int(11) NOT NULL DEFAULT '0',
  `microtime` varchar(16) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debuglog`
--

LOCK TABLES `debuglog` WRITE;
/*!40000 ALTER TABLE `debuglog` DISABLE KEYS */;
/*!40000 ALTER TABLE `debuglog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filtercounts`
--

DROP TABLE IF EXISTS `filtercounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filtercounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0',
  `filterhash` varchar(40) CHARACTER SET ascii NOT NULL DEFAULT '',
  `currentspotcount` int(11) NOT NULL DEFAULT '0',
  `lastvisitspotcount` int(11) NOT NULL DEFAULT '0',
  `lastupdate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_filtercounts_1` (`userid`,`filterhash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filtercounts`
--

LOCK TABLES `filtercounts` WRITE;
/*!40000 ALTER TABLE `filtercounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `filtercounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filters`
--

DROP TABLE IF EXISTS `filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0',
  `filtertype` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '',
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `icon` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `torder` int(11) NOT NULL DEFAULT '0',
  `tparent` int(11) NOT NULL DEFAULT '0',
  `tree` text CHARACTER SET ascii,
  `valuelist` text COLLATE utf8_unicode_ci,
  `sorton` varchar(128) CHARACTER SET ascii DEFAULT NULL,
  `sortorder` varchar(128) CHARACTER SET ascii DEFAULT NULL,
  `enablenotify` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_filters_1` (`userid`,`filtertype`,`tparent`,`torder`),
  CONSTRAINT `filters_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (67,1,'filter','Image','film',0,0,'cat0_z0',NULL,NULL,NULL,0),(68,1,'filter','DivX','divx',0,67,'cat0_z0_a0',NULL,NULL,NULL,0),(69,1,'filter','WMV','wmv',1,67,'cat0_z0_a1',NULL,NULL,NULL,0),(70,1,'filter','MPEG','mpg',2,67,'cat0_z0_a2',NULL,NULL,NULL,0),(71,1,'filter','DVD','dvd',3,67,'cat0_z0_a3,cat0_z0_a10',NULL,NULL,NULL,0),(72,1,'filter','HD','hd',4,67,'cat0_z0_a4,cat0_z0_a6,cat0_z0_a7,cat0_z0_a8,cat0_z0_a9',NULL,NULL,NULL,0),(73,1,'filter','Series','tv',5,67,'cat0_z1',NULL,NULL,NULL,0),(74,1,'filter','Books','book',6,67,'cat0_z2',NULL,NULL,NULL,0),(75,1,'filter','Dutch','book',0,74,'cat0_z2_c11',NULL,NULL,NULL,0),(76,1,'filter','English','book',1,74,'cat0_z2_c10',NULL,NULL,NULL,0),(77,1,'filter','Others','book',2,74,'cat0_z2,~cat0_z2_c10,~cat0_z2_c11',NULL,NULL,NULL,0),(78,1,'filter','Erotica','female',7,67,'cat0_z3',NULL,NULL,NULL,0),(79,1,'filter','Hetero','female',0,78,'cat0_z3_d75,cat0_z3_d23',NULL,NULL,NULL,0),(80,1,'filter','Gay male','female',1,78,'cat0_z3_d74,cat0_z3_d24',NULL,NULL,NULL,0),(81,1,'filter','Gay female','female',2,78,'cat0_z3_d73,cat0_z3_d25',NULL,NULL,NULL,0),(82,1,'filter','Bi','female',3,78,'cat0_z3_d72,cat0_z3_d26',NULL,NULL,NULL,0),(83,1,'filter','Sounds','music',2,0,'cat1',NULL,NULL,NULL,0),(84,1,'filter','Compressed','music',0,83,'cat1_a0,cat1_a3,cat1_a5,cat1_a6',NULL,NULL,NULL,0),(85,1,'filter','Lossless','music',1,83,'cat1_a2,cat1_a4,cat1_a7,cat1_a8',NULL,NULL,NULL,0),(86,1,'filter','Games','controller',3,0,'cat2',NULL,NULL,NULL,0),(87,1,'filter','Windows','windows',0,86,'cat2_a0',NULL,NULL,NULL,0),(88,1,'filter','Mac / Linux','linux',1,86,'cat2_a1,cat2_a2',NULL,NULL,NULL,0),(89,1,'filter','Playstation','playstation',2,86,'cat2_a3,cat2_a4,cat2_a5,cat2_a12',NULL,NULL,NULL,0),(90,1,'filter','XBox','xbox',3,86,'cat2_a6,cat2_a7',NULL,NULL,NULL,0),(91,1,'filter','Nintendo','nintendo_ds',4,86,'cat2_a8,cat2_a9,cat2_a10,cat2_a11',NULL,NULL,NULL,0),(92,1,'filter','Smartphone / PDA','pda',5,86,'cat2_a13,cat2_a14,cat2_a15',NULL,NULL,NULL,0),(93,1,'filter','Applications','application',4,0,'cat3',NULL,NULL,NULL,0),(94,1,'filter','Windows','vista',0,93,'cat3_a0',NULL,NULL,NULL,0),(95,1,'filter','Mac / Linux / OS2','linux',1,93,'cat3_a1,cat3_a2,cat3_a3',NULL,NULL,NULL,0),(96,1,'filter','Navigation','ipod',1,93,'cat3_a5',NULL,NULL,NULL,0),(97,1,'filter','Windows Phone','pda',2,93,'cat3_a4',NULL,NULL,NULL,0),(98,1,'filter','Apple iOS','mac',2,93,'cat3_a6',NULL,NULL,NULL,0),(99,1,'filter','Android','phone',3,93,'cat3_a7',NULL,NULL,NULL,0),(100,2,'filter','Image','film',0,0,'cat0_z0',NULL,NULL,NULL,0),(101,2,'filter','DivX','divx',0,100,'cat0_z0_a0',NULL,NULL,NULL,0),(102,2,'filter','WMV','wmv',1,100,'cat0_z0_a1',NULL,NULL,NULL,0),(103,2,'filter','MPEG','mpg',2,100,'cat0_z0_a2',NULL,NULL,NULL,0),(104,2,'filter','DVD','dvd',3,100,'cat0_z0_a3,cat0_z0_a10',NULL,NULL,NULL,0),(105,2,'filter','HD','hd',4,100,'cat0_z0_a4,cat0_z0_a6,cat0_z0_a7,cat0_z0_a8,cat0_z0_a9',NULL,NULL,NULL,0),(106,2,'filter','Series','tv',5,100,'cat0_z1',NULL,NULL,NULL,0),(107,2,'filter','Books','book',6,100,'cat0_z2',NULL,NULL,NULL,0),(108,2,'filter','Dutch','book',0,107,'cat0_z2_c11',NULL,NULL,NULL,0),(109,2,'filter','English','book',1,107,'cat0_z2_c10',NULL,NULL,NULL,0),(110,2,'filter','Others','book',2,107,'cat0_z2,~cat0_z2_c10,~cat0_z2_c11',NULL,NULL,NULL,0),(111,2,'filter','Erotica','female',7,100,'cat0_z3',NULL,NULL,NULL,0),(112,2,'filter','Hetero','female',0,111,'cat0_z3_d75,cat0_z3_d23',NULL,NULL,NULL,0),(113,2,'filter','Gay male','female',1,111,'cat0_z3_d74,cat0_z3_d24',NULL,NULL,NULL,0),(114,2,'filter','Gay female','female',2,111,'cat0_z3_d73,cat0_z3_d25',NULL,NULL,NULL,0),(115,2,'filter','Bi','female',3,111,'cat0_z3_d72,cat0_z3_d26',NULL,NULL,NULL,0),(116,2,'filter','Sounds','music',2,0,'cat1',NULL,NULL,NULL,0),(117,2,'filter','Compressed','music',0,116,'cat1_a0,cat1_a3,cat1_a5,cat1_a6',NULL,NULL,NULL,0),(118,2,'filter','Lossless','music',1,116,'cat1_a2,cat1_a4,cat1_a7,cat1_a8',NULL,NULL,NULL,0),(119,2,'filter','Games','controller',3,0,'cat2',NULL,NULL,NULL,0),(120,2,'filter','Windows','windows',0,119,'cat2_a0',NULL,NULL,NULL,0),(121,2,'filter','Mac / Linux','linux',1,119,'cat2_a1,cat2_a2',NULL,NULL,NULL,0),(122,2,'filter','Playstation','playstation',2,119,'cat2_a3,cat2_a4,cat2_a5,cat2_a12',NULL,NULL,NULL,0),(123,2,'filter','XBox','xbox',3,119,'cat2_a6,cat2_a7',NULL,NULL,NULL,0),(124,2,'filter','Nintendo','nintendo_ds',4,119,'cat2_a8,cat2_a9,cat2_a10,cat2_a11',NULL,NULL,NULL,0),(125,2,'filter','Smartphone / PDA','pda',5,119,'cat2_a13,cat2_a14,cat2_a15',NULL,NULL,NULL,0),(126,2,'filter','Applications','application',4,0,'cat3',NULL,NULL,NULL,0),(127,2,'filter','Windows','vista',0,126,'cat3_a0',NULL,NULL,NULL,0),(128,2,'filter','Mac / Linux / OS2','linux',1,126,'cat3_a1,cat3_a2,cat3_a3',NULL,NULL,NULL,0),(129,2,'filter','Navigation','ipod',1,126,'cat3_a5',NULL,NULL,NULL,0),(130,2,'filter','Windows Phone','pda',2,126,'cat3_a4',NULL,NULL,NULL,0),(131,2,'filter','Apple iOS','mac',2,126,'cat3_a6',NULL,NULL,NULL,0),(132,2,'filter','Android','phone',3,126,'cat3_a7',NULL,NULL,NULL,0),(133,3,'filter','Image','film',0,0,'cat0_z0','',NULL,NULL,0),(134,3,'filter','DivX','divx',0,133,'cat0_z0_a0','',NULL,NULL,0),(135,3,'filter','WMV','wmv',1,133,'cat0_z0_a1','',NULL,NULL,0),(136,3,'filter','MPEG','mpg',2,133,'cat0_z0_a2','',NULL,NULL,0),(137,3,'filter','DVD','dvd',3,133,'cat0_z0_a3,cat0_z0_a10','',NULL,NULL,0),(138,3,'filter','HD','hd',4,133,'cat0_z0_a4,cat0_z0_a6,cat0_z0_a7,cat0_z0_a8,cat0_z0_a9','',NULL,NULL,0),(139,3,'filter','Series','tv',5,133,'cat0_z1','',NULL,NULL,0),(140,3,'filter','Books','book',6,133,'cat0_z2','',NULL,NULL,0),(141,3,'filter','Dutch','book',0,140,'cat0_z2_c11','',NULL,NULL,0),(142,3,'filter','English','book',1,140,'cat0_z2_c10','',NULL,NULL,0),(143,3,'filter','Others','book',2,140,'cat0_z2,~cat0_z2_c10,~cat0_z2_c11','',NULL,NULL,0),(144,3,'filter','Erotica','female',7,133,'cat0_z3','',NULL,NULL,0),(145,3,'filter','Hetero','female',0,144,'cat0_z3_d75,cat0_z3_d23','',NULL,NULL,0),(146,3,'filter','Gay male','female',1,144,'cat0_z3_d74,cat0_z3_d24','',NULL,NULL,0),(147,3,'filter','Gay female','female',2,144,'cat0_z3_d73,cat0_z3_d25','',NULL,NULL,0),(148,3,'filter','Bi','female',3,144,'cat0_z3_d72,cat0_z3_d26','',NULL,NULL,0),(149,3,'filter','Sounds','music',2,0,'cat1','',NULL,NULL,0),(150,3,'filter','Compressed','music',0,149,'cat1_a0,cat1_a3,cat1_a5,cat1_a6','',NULL,NULL,0),(151,3,'filter','Lossless','music',1,149,'cat1_a2,cat1_a4,cat1_a7,cat1_a8','',NULL,NULL,0),(152,3,'filter','Games','controller',3,0,'cat2','',NULL,NULL,0),(153,3,'filter','Windows','windows',0,152,'cat2_a0','',NULL,NULL,0),(154,3,'filter','Mac / Linux','linux',1,152,'cat2_a1,cat2_a2','',NULL,NULL,0),(155,3,'filter','Playstation','playstation',2,152,'cat2_a3,cat2_a4,cat2_a5,cat2_a12','',NULL,NULL,0),(156,3,'filter','XBox','xbox',3,152,'cat2_a6,cat2_a7','',NULL,NULL,0),(157,3,'filter','Nintendo','nintendo_ds',4,152,'cat2_a8,cat2_a9,cat2_a10,cat2_a11','',NULL,NULL,0),(158,3,'filter','Smartphone / PDA','pda',5,152,'cat2_a13,cat2_a14,cat2_a15','',NULL,NULL,0),(159,3,'filter','Applications','application',4,0,'cat3','',NULL,NULL,0),(160,3,'filter','Windows','vista',0,159,'cat3_a0','',NULL,NULL,0),(161,3,'filter','Mac / Linux / OS2','linux',1,159,'cat3_a1,cat3_a2,cat3_a3','',NULL,NULL,0),(162,3,'filter','Navigation','ipod',1,159,'cat3_a5','',NULL,NULL,0),(163,3,'filter','Windows Phone','pda',2,159,'cat3_a4','',NULL,NULL,0),(164,3,'filter','Apple iOS','mac',2,159,'cat3_a6','',NULL,NULL,0),(165,3,'filter','Android','phone',3,159,'cat3_a7','',NULL,NULL,0),(166,4,'filter','Image','film',0,0,'cat0_z0','',NULL,NULL,0),(167,4,'filter','DivX','divx',0,166,'cat0_z0_a0','',NULL,NULL,0),(168,4,'filter','WMV','wmv',1,166,'cat0_z0_a1','',NULL,NULL,0),(169,4,'filter','MPEG','mpg',2,166,'cat0_z0_a2','',NULL,NULL,0),(170,4,'filter','DVD','dvd',3,166,'cat0_z0_a3,cat0_z0_a10','',NULL,NULL,0),(171,4,'filter','HD','hd',4,166,'cat0_z0_a4,cat0_z0_a6,cat0_z0_a7,cat0_z0_a8,cat0_z0_a9','',NULL,NULL,0),(172,4,'filter','Series','tv',5,166,'cat0_z1','',NULL,NULL,0),(173,4,'filter','Books','book',6,166,'cat0_z2','',NULL,NULL,0),(174,4,'filter','Dutch','book',0,173,'cat0_z2_c11','',NULL,NULL,0),(175,4,'filter','English','book',1,173,'cat0_z2_c10','',NULL,NULL,0),(176,4,'filter','Others','book',2,173,'cat0_z2,~cat0_z2_c10,~cat0_z2_c11','',NULL,NULL,0),(177,4,'filter','Erotica','female',7,166,'cat0_z3','',NULL,NULL,0),(178,4,'filter','Hetero','female',0,177,'cat0_z3_d75,cat0_z3_d23','',NULL,NULL,0),(179,4,'filter','Gay male','female',1,177,'cat0_z3_d74,cat0_z3_d24','',NULL,NULL,0),(180,4,'filter','Gay female','female',2,177,'cat0_z3_d73,cat0_z3_d25','',NULL,NULL,0),(181,4,'filter','Bi','female',3,177,'cat0_z3_d72,cat0_z3_d26','',NULL,NULL,0),(182,4,'filter','Sounds','music',2,0,'cat1','',NULL,NULL,0),(183,4,'filter','Compressed','music',0,182,'cat1_a0,cat1_a3,cat1_a5,cat1_a6','',NULL,NULL,0),(184,4,'filter','Lossless','music',1,182,'cat1_a2,cat1_a4,cat1_a7,cat1_a8','',NULL,NULL,0),(185,4,'filter','Games','controller',3,0,'cat2','',NULL,NULL,0),(186,4,'filter','Windows','windows',0,185,'cat2_a0','',NULL,NULL,0),(187,4,'filter','Mac / Linux','linux',1,185,'cat2_a1,cat2_a2','',NULL,NULL,0),(188,4,'filter','Playstation','playstation',2,185,'cat2_a3,cat2_a4,cat2_a5,cat2_a12','',NULL,NULL,0),(189,4,'filter','XBox','xbox',3,185,'cat2_a6,cat2_a7','',NULL,NULL,0),(190,4,'filter','Nintendo','nintendo_ds',4,185,'cat2_a8,cat2_a9,cat2_a10,cat2_a11','',NULL,NULL,0),(191,4,'filter','Smartphone / PDA','pda',5,185,'cat2_a13,cat2_a14,cat2_a15','',NULL,NULL,0),(192,4,'filter','Applications','application',4,0,'cat3','',NULL,NULL,0),(193,4,'filter','Windows','vista',0,192,'cat3_a0','',NULL,NULL,0),(194,4,'filter','Mac / Linux / OS2','linux',1,192,'cat3_a1,cat3_a2,cat3_a3','',NULL,NULL,0),(195,4,'filter','Navigation','ipod',1,192,'cat3_a5','',NULL,NULL,0),(196,4,'filter','Windows Phone','pda',2,192,'cat3_a4','',NULL,NULL,0),(197,4,'filter','Apple iOS','mac',2,192,'cat3_a6','',NULL,NULL,0),(198,4,'filter','Android','phone',3,192,'cat3_a7','',NULL,NULL,0);
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouppermissions`
--

DROP TABLE IF EXISTS `grouppermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouppermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) NOT NULL DEFAULT '0',
  `permissionid` int(11) NOT NULL DEFAULT '0',
  `objectid` varchar(128) NOT NULL DEFAULT '',
  `deny` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_grouppermissions_1` (`groupid`,`permissionid`,`objectid`),
  CONSTRAINT `grouppermissions_ibfk_1` FOREIGN KEY (`groupid`) REFERENCES `securitygroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouppermissions`
--

LOCK TABLES `grouppermissions` WRITE;
/*!40000 ALTER TABLE `grouppermissions` DISABLE KEYS */;
INSERT INTO `grouppermissions` VALUES (78,1,1,'',0),(79,2,0,'',0),(80,2,1,'',0),(81,2,2,'',0),(82,2,3,'',0),(83,2,4,'',0),(84,2,7,'',0),(85,2,9,'',0),(86,2,10,'',0),(87,2,22,'',0),(88,2,26,'',0),(89,3,5,'',0),(90,3,6,'',0),(91,3,8,'',0),(92,3,11,'',0),(93,3,12,'',0),(94,3,14,'',0),(95,3,15,'',0),(96,3,16,'',0),(97,3,17,'',0),(98,3,18,'',0),(99,3,19,'',0),(100,3,20,'',0),(101,3,23,'',0),(102,3,24,'',0),(103,3,33,'',0),(104,3,34,'',0),(105,3,36,'',0),(106,3,37,'',0),(107,3,38,'',0),(108,3,39,'',0),(109,2,7,'avatar',0),(110,3,24,'rss',0),(111,3,24,'newznabapi',0),(112,3,24,'getnzb',0),(113,3,24,'getspot',0),(114,3,5,'disable',0),(115,3,5,'client-sabnzbd',0),(116,3,31,'',0),(117,2,31,'welcomemail',0),(118,3,31,'email',0),(119,3,31,'notifo',0),(120,3,31,'twitter',0),(121,3,31,'prowl',0),(122,3,31,'nma',0),(123,3,31,'boxcar',0),(124,4,31,'growl',0),(125,3,32,'',0),(126,3,32,'watchlist_handled',0),(127,3,32,'spot_posted',0),(128,3,32,'nzb_handled',0),(129,3,32,'report_posted',0),(130,4,5,'push-sabnzbd',0),(131,4,5,'save',0),(132,4,5,'runcommand',0),(133,4,5,'nzbget',0),(134,4,18,'erasedls',0),(135,5,13,'',0),(136,5,21,'',0),(137,5,25,'',0),(138,5,27,'',0),(139,5,28,'',0),(140,5,29,'',0),(141,5,30,'',0),(142,5,35,'',0),(143,5,40,'',0),(144,5,41,'',0),(145,5,32,'retriever_finished',0),(146,5,32,'user_added',0),(147,3,32,'newspots_for_filter',0),(148,3,23,'we1rdo',0),(149,3,23,'mobile',0),(150,5,42,'',0),(151,5,43,'',0),(152,5,44,'',0),(153,5,45,'',0),(154,4,5,'nzbvortex',0);
/*!40000 ALTER TABLE `grouppermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moderatedringbuffer`
--

DROP TABLE IF EXISTS `moderatedringbuffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moderatedringbuffer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageid` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_moderatedringbuffer_1` (`messageid`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderatedringbuffer`
--

LOCK TABLES `moderatedringbuffer` WRITE;
/*!40000 ALTER TABLE `moderatedringbuffer` DISABLE KEYS */;
/*!40000 ALTER TABLE `moderatedringbuffer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0',
  `stamp` int(11) NOT NULL DEFAULT '0',
  `objectid` varchar(128) NOT NULL DEFAULT '',
  `type` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_notifications_1` (`userid`),
  KEY `idx_notifications_2` (`sent`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permaudit`
--

DROP TABLE IF EXISTS `permaudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stamp` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `permissionid` int(11) NOT NULL DEFAULT '0',
  `objectid` varchar(128) NOT NULL DEFAULT '',
  `result` tinyint(1) NOT NULL DEFAULT '1',
  `ipaddr` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permaudit`
--

LOCK TABLES `permaudit` WRITE;
/*!40000 ALTER TABLE `permaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `permaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportsposted`
--

DROP TABLE IF EXISTS `reportsposted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportsposted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ouruserid` int(11) NOT NULL DEFAULT '0',
  `messageid` varchar(128) NOT NULL DEFAULT '',
  `inreplyto` varchar(128) NOT NULL DEFAULT '',
  `randompart` varchar(32) NOT NULL DEFAULT '',
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `stamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_reportsposted_1` (`messageid`),
  UNIQUE KEY `idx_reportsposted_2` (`inreplyto`,`ouruserid`),
  KEY `idx_reportspostedrel_1` (`ouruserid`),
  CONSTRAINT `reportsposted_ibfk_1` FOREIGN KEY (`ouruserid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportsposted`
--

LOCK TABLES `reportsposted` WRITE;
/*!40000 ALTER TABLE `reportsposted` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportsposted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportsxover`
--

DROP TABLE IF EXISTS `reportsxover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportsxover` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageid` varchar(128) NOT NULL DEFAULT '',
  `fromhdr` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keyword` varchar(128) NOT NULL DEFAULT '',
  `nntpref` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_reportsxover_1` (`messageid`),
  KEY `idx_reportsxover_2` (`nntpref`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportsxover`
--

LOCK TABLES `reportsxover` WRITE;
/*!40000 ALTER TABLE `reportsxover` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportsxover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups`
--

DROP TABLE IF EXISTS `securitygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_securitygroups_1` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups`
--

LOCK TABLES `securitygroups` WRITE;
/*!40000 ALTER TABLE `securitygroups` DISABLE KEYS */;
INSERT INTO `securitygroups` VALUES (5,'Administrators'),(1,'Anonymous user - closed system'),(2,'Anonymous user - open system'),(3,'Authenticated users'),(4,'Trusted users');
/*!40000 ALTER TABLE `securitygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionid` varchar(128) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `hitcount` int(11) DEFAULT NULL,
  `lasthit` int(11) DEFAULT NULL,
  `ipaddr` varchar(45) NOT NULL DEFAULT '',
  `devicetype` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sessions_1` (`sessionid`),
  KEY `idx_sessions_2` (`lasthit`),
  KEY `idx_sessions_3` (`sessionid`,`userid`),
  KEY `idx_sessionsrel_1` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,'1nd69invzghj0zjvgcfjq8qak16sphmiqog3rmaz16k7a3speyop6fof4u',3,2,1483782344,'192.168.2.111','full'),(2,'mu09qzxafp8risx66xi37am1gmf6rv9qk78vvfmpviye6h7ci8orj9anqhdi',2,16,1484502988,'192.168.2.111','full');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `serialized` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_settings_1` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (3,'settingsversion','0.28',0),(4,'securityversion','0.32',0),(5,'publickey','-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDHTXkj/bAJvJOU+V0v7V08Wd54\n0sv5A1daOTCNzDDNRu1SiNFGGqlJNO19V25zMnyet97cn0gkCyMBEmMNzBLmUoAH\nyUYJqvNx3pWEuJO8Zz0IKSlr3orZz4CgUs5L/YTgZSkXVmDLewD/N775nGB1y4PR\nJIEMJ5HsJZbWHuVJeQIDAQAB\n-----END PUBLIC KEY-----\n',0),(6,'privatekey','-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMdNeSP9sAm8k5T5\nXS/tXTxZ3njSy/kDV1o5MI3MMM1G7VKI0UYaqUk07X1XbnMyfJ633tyfSCQLIwES\nYw3MEuZSgAfJRgmq83HelYS4k7xnPQgpKWveitnPgKBSzkv9hOBlKRdWYMt7AP83\nvvmcYHXLg9EkgQwnkewlltYe5Ul5AgMBAAECgYEAvw4kp/zkiaDt9SzLSUuJSnZ4\nT2j8Qf0S+xnB0tzAl7h7fthLjaG3UMddNv/ekK4ASwLGsMY8mNjYOInQzQQpxFJ7\nAtFDheiTDOFyWgAdq+5oNurrSqFyy+wrsucIzxSBLqIwyPxDq4wpy9nErrp9klBb\nxt3TFyyAnB3+y5UkqhECQQDm6Ei/jaoFulML+QSckBgB9bBL1sOIjq/dD2YfwyrS\npbrN7IkhnPA+w2uoJRrod7DHjDbp/KPCl5VgKOvX+TIFAkEA3PX2eo3t/597XBDk\nOcL9s/NRvVOc5yxA1dvp6yYQR7luCQpM1W6kAH6HYhM5U2urbAFBOFRHu3/Ng0d7\nthxP5QJAbichjT/nfBQGyg9hQ875pPWvxH4PiXWIL8zIyx4vr42gL9xHDuHvOgG/\nudb5nyx6CLe6+qSq+omVmOnsmHsogQJAFyAa8sql7Qn49DLEYBM7UDkYBfOZSUyF\nYJyKh9TNAWSz0nhkgDX7Lh4P90DB0CxFnaEn/Ug81a/Th3jUxsOBzQJAGKdkTuz+\nZWbRvzMHeigBPmEW5YqplejjE+g6SaixVhb/OZVy2vWBrad75xJhWs2IbflizTDh\n5nGraao+GBFRDQ==\n-----END PRIVATE KEY-----\n',0),(7,'pass_salt','lw12vhhwd1oly7zl8ehx8qfkt50w8pjztrrf7d5hew8vfrbx6da0jtjoo01bpbnh2abmn1sgdy4w1ecyqmt5j2z1dikxm54kobl5an31j71b2in8f24f6kkf',0),(8,'hdr_group','free.pt',0),(9,'nzb_group','alt.binaries.ftd',0),(10,'comment_group','free.usenet',0),(11,'report_group','free.willey',0),(12,'rsa_keys','a:3:{i:2;a:2:{s:6:\"modulo\";s:64:\"ys8WSlqonQMWT8ubG0tAA2Q07P36E+CJmb875wSR1XH7IFhEi0CCwlUzNqBFhC+P\";s:8:\"exponent\";s:4:\"AQAB\";}i:3;a:2:{s:6:\"modulo\";s:64:\"uiyChPV23eguLAJNttC/o0nAsxXgdjtvUvidV2JL+hjNzc4Tc/PPo2JdYvsqUsat\";s:8:\"exponent\";s:4:\"AQAB\";}i:4;a:2:{s:6:\"modulo\";s:64:\"1k6RNDVD6yBYWR6kHmwzmSud7JkNV4SMigBrs+jFgOK5Ldzwl17mKXJhl+su/GR9\";s:8:\"exponent\";s:4:\"AQAB\";}}',1),(13,'xsrfsecret','g72yo0jk',0),(14,'cookie_expires','30',0),(15,'sendwelcomemail','1',0),(16,'twitter_consumer_key','LRJCpeHASigYtWEmxoNPA',0),(17,'twitter_consumer_secret','QvwZglJNpzAnoVDt40uUyu5dRDlVFVs4ddxfEkYp7A',0),(18,'boxcar_api_key','pOQM9O2AnEWL0RjSoHln',0),(19,'boxcar_api_secret','7CwTFfX7KeAKfjM1DJjg5s9qcHm4cwmLkxQgW9fe',0),(20,'auditlevel','0',0),(21,'system_languages','a:2:{s:5:\"nl_NL\";s:10:\"Nederlands\";s:5:\"en_US\";s:7:\"English\";}',1),(22,'retention','0',0),(23,'retentiontype','fullonly',0),(24,'deny_robots','',0),(25,'nntp_nzb','a:6:{s:4:\"host\";s:11:\"news.4ux.nl\";s:4:\"user\";s:0:\"\";s:4:\"pass\";s:0:\"\";s:3:\"enc\";s:3:\"ssl\";s:4:\"port\";i:563;s:5:\"buggy\";b:0;}',1),(26,'nntp_hdr','a:6:{s:4:\"host\";s:11:\"news.4ux.nl\";s:4:\"user\";s:0:\"\";s:4:\"pass\";s:0:\"\";s:3:\"enc\";s:3:\"ssl\";s:4:\"port\";i:563;s:5:\"buggy\";b:0;}',1),(27,'nntp_post','a:6:{s:4:\"host\";s:11:\"news.4ux.nl\";s:4:\"user\";s:0:\"\";s:4:\"pass\";s:0:\"\";s:3:\"enc\";s:3:\"ssl\";s:4:\"port\";i:563;s:5:\"buggy\";b:0;}',1),(28,'retrieve_newer_than','0',0),(29,'retrieve_full','',0),(30,'prefetch_image','',0),(31,'prefetch_nzb','',0),(32,'retrieve_comments','1',0),(33,'retrieve_full_comments','',0),(34,'retrieve_reports','1',0),(35,'retrieve_increment','5000',0),(36,'spot_moderation','act',0),(37,'prepare_statistics','1',0),(38,'external_blacklist','1',0),(39,'blacklist_url','http://jijhaatmij.hopto.me/blacklist.txt',0),(40,'external_whitelist','1',0),(41,'whitelist_url','http://jijhaatmij.hopto.me/whitelist.txt',0),(42,'enable_timing','',0),(43,'cache_path','./cache',0),(44,'enable_stacktrace','1',0),(45,'systemfrommail','spotweb@example.com',0),(46,'customcss','',0),(47,'systemtype','shared',0),(48,'imageover_subcats','1',0),(49,'newuser_grouplist','a:3:{i:0;a:2:{s:7:\"groupid\";i:2;s:4:\"prio\";i:1;}i:1;a:2:{s:7:\"groupid\";i:3;s:4:\"prio\";i:2;}i:2;a:2:{s:7:\"groupid\";i:4;s:4:\"prio\";i:3;}}',1),(50,'nonauthenticated_userid','1',0),(51,'custom_admin_userid','4',0),(52,'valid_templates','a:1:{s:6:\"we1rdo\";s:6:\"we1rdo\";}',1),(53,'ms_translator_clientid','',0),(54,'ms_translator_clientsecret','',0),(63,'schemaversion','0.68',NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spots`
--

DROP TABLE IF EXISTS `spots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageid` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '',
  `poster` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `subcata` varchar(64) CHARACTER SET ascii DEFAULT NULL,
  `subcatb` varchar(64) CHARACTER SET ascii DEFAULT NULL,
  `subcatc` varchar(64) CHARACTER SET ascii DEFAULT NULL,
  `subcatd` varchar(64) CHARACTER SET ascii DEFAULT NULL,
  `subcatz` varchar(64) CHARACTER SET ascii DEFAULT NULL,
  `stamp` int(10) unsigned DEFAULT NULL,
  `reversestamp` int(11) DEFAULT '0',
  `filesize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `moderated` tinyint(1) DEFAULT NULL,
  `commentcount` int(11) DEFAULT '0',
  `spotrating` int(11) DEFAULT '0',
  `reportcount` int(11) DEFAULT '0',
  `spotterid` varchar(32) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `editstamp` int(10) unsigned DEFAULT NULL,
  `editor` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_spots_1` (`messageid`),
  KEY `idx_spots_2` (`stamp`),
  KEY `idx_spots_3` (`reversestamp`),
  KEY `idx_spots_4` (`category`,`subcata`,`subcatb`,`subcatc`,`subcatd`,`subcatz`),
  KEY `idx_spots_5` (`spotterid`),
  FULLTEXT KEY `idx_fts_spots_1` (`poster`),
  FULLTEXT KEY `idx_fts_spots_2` (`title`),
  FULLTEXT KEY `idx_fts_spots_3` (`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spots`
--

LOCK TABLES `spots` WRITE;
/*!40000 ALTER TABLE `spots` DISABLE KEYS */;
/*!40000 ALTER TABLE `spots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spotsfull`
--

DROP TABLE IF EXISTS `spotsfull`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spotsfull` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageid` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '',
  `verified` tinyint(1) DEFAULT NULL,
  `usersignature` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  `userkey` varchar(512) CHARACTER SET ascii DEFAULT NULL,
  `xmlsignature` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  `fullxml` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_spotsfull_1` (`messageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spotsfull`
--

LOCK TABLES `spotsfull` WRITE;
/*!40000 ALTER TABLE `spotsfull` DISABLE KEYS */;
/*!40000 ALTER TABLE `spotsfull` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spotsposted`
--

DROP TABLE IF EXISTS `spotsposted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spotsposted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageid` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '',
  `ouruserid` int(11) NOT NULL DEFAULT '0',
  `stamp` int(10) unsigned DEFAULT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `subcats` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  `filesize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fullxml` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_spotsposted_1` (`messageid`),
  KEY `idx_spotspostedrel_1` (`ouruserid`),
  CONSTRAINT `spotsposted_ibfk_1` FOREIGN KEY (`ouruserid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spotsposted`
--

LOCK TABLES `spotsposted` WRITE;
/*!40000 ALTER TABLE `spotsposted` DISABLE KEYS */;
/*!40000 ALTER TABLE `spotsposted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spotstatelist`
--

DROP TABLE IF EXISTS `spotstatelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spotstatelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageid` varchar(128) NOT NULL DEFAULT '',
  `ouruserid` int(11) DEFAULT '0',
  `download` int(11) DEFAULT NULL,
  `watch` int(11) DEFAULT NULL,
  `seen` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_spotstatelist_1` (`messageid`,`ouruserid`),
  KEY `idx_spotstatelistrel_1` (`ouruserid`),
  CONSTRAINT `spotstatelist_ibfk_1` FOREIGN KEY (`ouruserid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spotstatelist`
--

LOCK TABLES `spotstatelist` WRITE;
/*!40000 ALTER TABLE `spotstatelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `spotstatelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spotteridblacklist`
--

DROP TABLE IF EXISTS `spotteridblacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spotteridblacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spotterid` varchar(32) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `ouruserid` int(11) NOT NULL DEFAULT '0',
  `idtype` int(11) NOT NULL DEFAULT '0',
  `origin` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  `doubled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_spotteridblacklist_1` (`spotterid`,`ouruserid`,`idtype`),
  KEY `idx_spotteridblacklist_2` (`ouruserid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spotteridblacklist`
--

LOCK TABLES `spotteridblacklist` WRITE;
/*!40000 ALTER TABLE `spotteridblacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `spotteridblacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usenetstate`
--

DROP TABLE IF EXISTS `usenetstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usenetstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `infotype` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '',
  `curarticlenr` int(11) DEFAULT '0',
  `curmessageid` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '',
  `lastretrieved` int(11) DEFAULT '0',
  `nowrunning` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usenetstate_1` (`infotype`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usenetstate`
--

LOCK TABLES `usenetstate` WRITE;
/*!40000 ALTER TABLE `usenetstate` DISABLE KEYS */;
INSERT INTO `usenetstate` VALUES (1,'Base',0,'',0,0),(2,'Spots',0,'',0,0),(3,'Comments',0,'',0,0),(4,'Reports',0,'',0,0);
/*!40000 ALTER TABLE `usenetstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0',
  `groupid` int(11) NOT NULL DEFAULT '0',
  `prio` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroups_1` (`userid`,`groupid`),
  KEY `idx_usergroupsrel_1` (`groupid`),
  CONSTRAINT `usergroups_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usergroups_ibfk_2` FOREIGN KEY (`groupid`) REFERENCES `securitygroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
INSERT INTO `usergroups` VALUES (26,1,1,1),(27,2,2,1),(28,2,3,2),(29,2,4,3),(30,2,5,4),(31,3,2,1),(32,3,3,2),(33,3,4,3),(34,4,2,1),(35,4,3,2),(36,4,4,3),(37,4,5,4);
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `passhash` varchar(40) CHARACTER SET ascii NOT NULL DEFAULT '',
  `lastname` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mail` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `apikey` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `lastvisit` int(11) NOT NULL DEFAULT '0',
  `lastread` int(11) NOT NULL DEFAULT '0',
  `lastapiusage` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_users_1` (`username`),
  UNIQUE KEY `idx_users_2` (`mail`),
  UNIQUE KEY `idx_users_4` (`apikey`),
  KEY `idx_users_3` (`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'anonymous','Jane','','Doe','john@example.com','294de3557d9d00b3d2d8a1e6aab028cf',0,0,1483780921,0,0),(2,'admin','admin','88a2759238879154e5396e43f84562889bdae818','user','spotwebadmin@example.com','21232f297a57a5a743894a0e4a801fc3',1484502908,1484502908,1483780921,0,0),(3,'user','user','88a2759238879154e5396e43f84562889bdae818','doe','user@example.com','c803fde10033d814b42cdea22f6553ce',0,0,1483780921,0,1),(4,'myadmin','Spot','88a2759238879154e5396e43f84562889bdae818','Web','spotweb@example.com','c5651868d605efe07a3637482cf567d9',0,0,1483780921,0,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersettings`
--

DROP TABLE IF EXISTS `usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0',
  `privatekey` text CHARACTER SET ascii,
  `publickey` text CHARACTER SET ascii,
  `avatar` text CHARACTER SET ascii,
  `otherprefs` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usersettings_1` (`userid`),
  CONSTRAINT `usersettings_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersettings`
--

LOCK TABLES `usersettings` WRITE;
/*!40000 ALTER TABLE `usersettings` DISABLE KEYS */;
INSERT INTO `usersettings` VALUES (1,1,'','',NULL,'a:26:{s:7:\"perpage\";i:25;s:15:\"date_formatting\";s:5:\"human\";s:15:\"normal_template\";s:6:\"we1rdo\";s:15:\"mobile_template\";s:6:\"mobile\";s:15:\"tablet_template\";s:6:\"we1rdo\";s:14:\"count_newspots\";b:1;s:17:\"mouseover_subcats\";b:1;s:13:\"keep_seenlist\";b:1;s:15:\"auto_markasread\";b:1;s:17:\"keep_downloadlist\";b:1;s:14:\"keep_watchlist\";b:1;s:17:\"nzb_search_engine\";s:8:\"nzbindex\";s:13:\"show_filesize\";b:1;s:16:\"show_reportcount\";b:1;s:19:\"minimum_reportcount\";i:1;s:14:\"show_nzbbutton\";b:1;s:13:\"show_multinzb\";b:1;s:9:\"customcss\";s:0:\"\";s:18:\"newspotdefault_tag\";s:9:\"anonymous\";s:19:\"newspotdefault_body\";s:0:\"\";s:13:\"user_language\";s:5:\"en_US\";s:12:\"show_avatars\";b:1;s:27:\"usemailaddress_for_gravatar\";b:1;s:11:\"nzbhandling\";a:7:{s:6:\"action\";s:7:\"disable\";s:9:\"local_dir\";s:4:\"/tmp\";s:14:\"prepare_action\";s:5:\"merge\";s:7:\"command\";s:0:\"\";s:7:\"sabnzbd\";a:4:{s:3:\"url\";s:0:\"\";s:6:\"apikey\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";}s:6:\"nzbget\";a:5:{s:4:\"host\";s:0:\"\";s:4:\"port\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"timeout\";i:15;}s:9:\"nzbvortex\";a:3:{s:4:\"host\";s:0:\"\";s:4:\"port\";s:0:\"\";s:6:\"apikey\";s:0:\"\";}}s:13:\"notifications\";a:7:{s:6:\"boxcar\";a:3:{s:5:\"email\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:5:\"growl\";a:4:{s:4:\"host\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:3:\"nma\";a:3:{s:3:\"api\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:6:\"notifo\";a:4:{s:8:\"username\";s:0:\"\";s:3:\"api\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:5:\"prowl\";a:3:{s:6:\"apikey\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:7:\"twitter\";a:7:{s:11:\"screen_name\";s:0:\"\";s:13:\"request_token\";s:0:\"\";s:20:\"request_token_secret\";s:0:\"\";s:12:\"access_token\";s:0:\"\";s:19:\"access_token_secret\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:5:\"email\";a:2:{s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}}s:16:\"defaultsortfield\";s:0:\"\";}'),(2,2,'','',NULL,'a:26:{s:7:\"perpage\";i:25;s:15:\"date_formatting\";s:5:\"human\";s:15:\"normal_template\";s:6:\"we1rdo\";s:15:\"mobile_template\";s:6:\"mobile\";s:15:\"tablet_template\";s:6:\"we1rdo\";s:14:\"count_newspots\";b:1;s:17:\"mouseover_subcats\";b:1;s:13:\"keep_seenlist\";b:1;s:15:\"auto_markasread\";b:1;s:17:\"keep_downloadlist\";b:1;s:14:\"keep_watchlist\";b:1;s:17:\"nzb_search_engine\";s:8:\"nzbindex\";s:13:\"show_filesize\";b:1;s:16:\"show_reportcount\";b:1;s:19:\"minimum_reportcount\";i:1;s:14:\"show_nzbbutton\";b:1;s:13:\"show_multinzb\";b:1;s:9:\"customcss\";s:0:\"\";s:18:\"newspotdefault_tag\";s:5:\"admin\";s:19:\"newspotdefault_body\";s:0:\"\";s:13:\"user_language\";s:5:\"en_US\";s:12:\"show_avatars\";b:1;s:27:\"usemailaddress_for_gravatar\";b:1;s:11:\"nzbhandling\";a:7:{s:6:\"action\";s:7:\"disable\";s:9:\"local_dir\";s:4:\"/tmp\";s:14:\"prepare_action\";s:5:\"merge\";s:7:\"command\";s:0:\"\";s:7:\"sabnzbd\";a:4:{s:3:\"url\";s:0:\"\";s:6:\"apikey\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";}s:6:\"nzbget\";a:5:{s:4:\"host\";s:0:\"\";s:4:\"port\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"timeout\";i:15;}s:9:\"nzbvortex\";a:3:{s:4:\"host\";s:0:\"\";s:4:\"port\";s:0:\"\";s:6:\"apikey\";s:0:\"\";}}s:13:\"notifications\";a:7:{s:6:\"boxcar\";a:3:{s:5:\"email\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:5:\"growl\";a:4:{s:4:\"host\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:3:\"nma\";a:3:{s:3:\"api\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:6:\"notifo\";a:4:{s:8:\"username\";s:0:\"\";s:3:\"api\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:5:\"prowl\";a:3:{s:6:\"apikey\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:7:\"twitter\";a:7:{s:11:\"screen_name\";s:0:\"\";s:13:\"request_token\";s:0:\"\";s:20:\"request_token_secret\";s:0:\"\";s:12:\"access_token\";s:0:\"\";s:19:\"access_token_secret\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:5:\"email\";a:2:{s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}}s:16:\"defaultsortfield\";s:0:\"\";}'),(3,3,'-----BEGIN PRIVATE KEY-----\nMIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAKNaAhzAfo5LSA7k\nDKVWsjOQwpSDf2tIs/1T98GAIhSaTyO0idAVgoQQNJNKj527XW6dmwWz1MQg5aZk\ndOatX3/LFEL0yOwd/HitZLvClfZgivaFUVeUqoQxQNUWXLt+v956g32pIAb7Qkc4\nsYU+cWiJfTbnoCRffyV4IsLk8OXHAgMBAAECgYEAjE7vqYqeKdL33fJ7+jhxcGFT\nAQXCGICmOV46XPaWT2QLvfuAtD8FkDHrNujAWxdotW6ijU9d3ejz2OxIjSs17ss9\n7LQqUyfk3liHr6K2x1IuoJshIhsmjEQcQHE+zTBxIdS4GHNsUOKlKilzzrad/WyI\noYieaOkcWHMuF2k+8YECQQDQlWWIleBO2w0E6l7x8aEHU3yEMhYoPeQruucFl7FX\nB2I5RAuM9vIlMVv9TJD2noQP1HCsW2eJiAyOhFqdrbtXAkEAyHxRhoH/X+lYmx3c\nfFpJjnPW4QHfJ7uO0bHuXjGE1ng+O9rFrla4il1Vw5STv7LJEX0ypLP3whhX1kCM\nhIATEQJBALF2mmdGFQ0iZAZNnbA9w6KnDmau8pkUZ2ApacshT9nax2Avm6A4rrak\nMz7keOXK4lNRjPen4QRrgztyMmK7YIsCQHhVZfl9/XHr9SrleXmKF6xRCyBypyaK\nBOcIDTKsNjckZPY4EX7avlkOPHPvsd7VyKmeo88H1iXBxrbqd2zwEoECQDHohl/k\nc91NtcaKgxkdTVee5EefdJ+hayPffbSVjKSa+v+/KKa7JyuXVDJS9FBjoa/Bzckn\n9B6/Y8sjym4T6co=\n-----END PRIVATE KEY-----\n','-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCjWgIcwH6OS0gO5AylVrIzkMKU\ng39rSLP9U/fBgCIUmk8jtInQFYKEEDSTSo+du11unZsFs9TEIOWmZHTmrV9/yxRC\n9MjsHfx4rWS7wpX2YIr2hVFXlKqEMUDVFly7fr/eeoN9qSAG+0JHOLGFPnFoiX02\n56AkX38leCLC5PDlxwIDAQAB\n-----END PUBLIC KEY-----\n',NULL,'a:26:{s:7:\"perpage\";i:25;s:15:\"date_formatting\";s:5:\"human\";s:15:\"normal_template\";s:6:\"we1rdo\";s:15:\"mobile_template\";s:6:\"mobile\";s:15:\"tablet_template\";s:6:\"we1rdo\";s:14:\"count_newspots\";b:1;s:17:\"mouseover_subcats\";b:1;s:13:\"keep_seenlist\";b:1;s:15:\"auto_markasread\";b:1;s:17:\"keep_downloadlist\";b:1;s:14:\"keep_watchlist\";b:1;s:17:\"nzb_search_engine\";s:8:\"nzbindex\";s:13:\"show_filesize\";b:1;s:16:\"show_reportcount\";b:1;s:19:\"minimum_reportcount\";i:1;s:14:\"show_nzbbutton\";b:1;s:13:\"show_multinzb\";b:1;s:9:\"customcss\";s:0:\"\";s:18:\"newspotdefault_tag\";s:4:\"user\";s:19:\"newspotdefault_body\";s:0:\"\";s:13:\"user_language\";s:5:\"en_US\";s:12:\"show_avatars\";b:1;s:27:\"usemailaddress_for_gravatar\";b:1;s:11:\"nzbhandling\";a:7:{s:6:\"action\";s:7:\"disable\";s:9:\"local_dir\";s:4:\"/tmp\";s:14:\"prepare_action\";s:5:\"merge\";s:7:\"command\";s:0:\"\";s:7:\"sabnzbd\";a:4:{s:3:\"url\";s:0:\"\";s:6:\"apikey\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";}s:6:\"nzbget\";a:5:{s:4:\"host\";s:0:\"\";s:4:\"port\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"timeout\";i:15;}s:9:\"nzbvortex\";a:3:{s:4:\"host\";s:0:\"\";s:4:\"port\";s:0:\"\";s:6:\"apikey\";s:0:\"\";}}s:13:\"notifications\";a:7:{s:6:\"boxcar\";a:3:{s:5:\"email\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:5:\"growl\";a:4:{s:4:\"host\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:3:\"nma\";a:3:{s:3:\"api\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:6:\"notifo\";a:4:{s:8:\"username\";s:0:\"\";s:3:\"api\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:5:\"prowl\";a:3:{s:6:\"apikey\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:7:\"twitter\";a:7:{s:11:\"screen_name\";s:0:\"\";s:13:\"request_token\";s:0:\"\";s:20:\"request_token_secret\";s:0:\"\";s:12:\"access_token\";s:0:\"\";s:19:\"access_token_secret\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:5:\"email\";a:2:{s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}}s:16:\"defaultsortfield\";s:0:\"\";}'),(4,4,'-----BEGIN PRIVATE KEY-----\nMIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAKT7NDLlWLHaR5uv\nQMk/nVislubjt3hsUMrpJMpF9SBb78OQ+Ku4UUneXW/h7s5Sq1prFliOKRvYzZVC\n+ICYMQLTI0HoV02EUvKIdgVzioJkkd44JG2ec4eMpl4uMimEh7ZMHcFL5MnisIpr\nD956xTEA9w/AH6Ab5aeU2mBglhw/AgMBAAECgYEAovjvKHO8OPxaDmWBxwtLQIRF\nENHTtGazLK5ARHv02EFZSMPVkbQiwKijflkeELxDPq9YRKQx4as58f9VAZrVldEC\nY7pSdSJ9G5FX3kJb0pfICAL7kskVGrEVpGoqLx6xhFNg/Usmk/AZ3RpPjtCy9xNy\nzK3yHbMPIt3qlXPwuGkCQQDaJrH0icYu0QPfnYWAASpTMnkaNADi1z2oj6m6X2+g\nIUEyCBkmLCln7ARpyFEGVt1J6vbwYQVQzbyF0cNqhqubAkEAwZrwSQCX2v9H2RAt\nsTbIE3tWUNhS7qE8hUYvxvX1S3WsdITjxjdsJCUKSO31ZcbsxSMWQgysMhjCwYHM\n4bn2LQJBAIbFcRtKIo25w1La1icGkUdk3zw49HMv1n/UgV8KpsOex9BJAIB8t/fj\n77YKc0QfVgbcikJnLgmFkPp7ZObi3BECQQC08+G9+cX1NECtCsgKKI+cVdz5Nxdc\nXms4jb8+EMkxvExxo3tY2phCuDQCshZ5CBJot0Cofzu6nxX40x7xo2QJAkBt1X3/\n4Gr3U+V2lpxEZu6mzgO0aIzy+u5OnjIWsvDyhI81Fn6VhI/6qt2hsqc1PstkEgjZ\nnBPtekJ4QQJGzSrH\n-----END PRIVATE KEY-----\n','-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCk+zQy5Vix2kebr0DJP51YrJbm\n47d4bFDK6STKRfUgW+/DkPiruFFJ3l1v4e7OUqtaaxZYjikb2M2VQviAmDEC0yNB\n6FdNhFLyiHYFc4qCZJHeOCRtnnOHjKZeLjIphIe2TB3BS+TJ4rCKaw/eesUxAPcP\nwB+gG+WnlNpgYJYcPwIDAQAB\n-----END PUBLIC KEY-----\n',NULL,'a:26:{s:7:\"perpage\";i:25;s:15:\"date_formatting\";s:5:\"human\";s:15:\"normal_template\";s:6:\"we1rdo\";s:15:\"mobile_template\";s:6:\"mobile\";s:15:\"tablet_template\";s:6:\"we1rdo\";s:14:\"count_newspots\";b:1;s:17:\"mouseover_subcats\";b:1;s:13:\"keep_seenlist\";b:1;s:15:\"auto_markasread\";b:1;s:17:\"keep_downloadlist\";b:1;s:14:\"keep_watchlist\";b:1;s:17:\"nzb_search_engine\";s:8:\"nzbindex\";s:13:\"show_filesize\";b:1;s:16:\"show_reportcount\";b:1;s:19:\"minimum_reportcount\";i:1;s:14:\"show_nzbbutton\";b:1;s:13:\"show_multinzb\";b:1;s:9:\"customcss\";s:0:\"\";s:18:\"newspotdefault_tag\";s:7:\"myadmin\";s:19:\"newspotdefault_body\";s:0:\"\";s:13:\"user_language\";s:5:\"en_US\";s:12:\"show_avatars\";b:1;s:27:\"usemailaddress_for_gravatar\";b:1;s:11:\"nzbhandling\";a:7:{s:6:\"action\";s:7:\"disable\";s:9:\"local_dir\";s:4:\"/tmp\";s:14:\"prepare_action\";s:5:\"merge\";s:7:\"command\";s:0:\"\";s:7:\"sabnzbd\";a:4:{s:3:\"url\";s:0:\"\";s:6:\"apikey\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";}s:6:\"nzbget\";a:5:{s:4:\"host\";s:0:\"\";s:4:\"port\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"timeout\";i:15;}s:9:\"nzbvortex\";a:3:{s:4:\"host\";s:0:\"\";s:4:\"port\";s:0:\"\";s:6:\"apikey\";s:0:\"\";}}s:13:\"notifications\";a:7:{s:6:\"boxcar\";a:3:{s:5:\"email\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:5:\"growl\";a:4:{s:4:\"host\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:3:\"nma\";a:3:{s:3:\"api\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:6:\"notifo\";a:4:{s:8:\"username\";s:0:\"\";s:3:\"api\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:5:\"prowl\";a:3:{s:6:\"apikey\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:7:\"twitter\";a:7:{s:11:\"screen_name\";s:0:\"\";s:13:\"request_token\";s:0:\"\";s:20:\"request_token_secret\";s:0:\"\";s:12:\"access_token\";s:0:\"\";s:19:\"access_token_secret\";s:0:\"\";s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}s:5:\"email\";a:2:{s:7:\"enabled\";b:0;s:6:\"events\";a:7:{s:17:\"watchlist_handled\";b:0;s:11:\"nzb_handled\";b:0;s:18:\"retriever_finished\";b:0;s:13:\"report_posted\";b:0;s:11:\"spot_posted\";b:0;s:10:\"user_added\";b:0;s:19:\"newspots_for_filter\";b:0;}}}s:16:\"defaultsortfield\";s:0:\"\";}');
/*!40000 ALTER TABLE `usersettings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-15 17:57:28
