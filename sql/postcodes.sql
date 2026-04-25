-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: world
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `postcodes`
--

DROP TABLE IF EXISTS `postcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postcodes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The postal code value (alphanumeric, country-specific format)',
  `country_id` mediumint unsigned NOT NULL,
  `country_code` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` mediumint unsigned DEFAULT NULL,
  `state_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` mediumint unsigned DEFAULT NULL,
  `locality_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Human-readable place name associated with the postcode',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Granularity: full | outward | sector | district | area',
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `source` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Originating data source for license/attribution tracking (e.g. openplz, wikidata, census)',
  `wikiDataId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Wikidata Q-ID for cross-referencing',
  `created_at` timestamp NOT NULL DEFAULT '2014-01-01 12:01:01',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `flag` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_postcodes_code` (`code`),
  KEY `idx_postcodes_country_code` (`country_id`,`code`),
  KEY `idx_postcodes_state` (`state_id`),
  KEY `idx_postcodes_city` (`city_id`),
  CONSTRAINT `postcodes_city_fk` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE SET NULL,
  CONSTRAINT `postcodes_country_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `postcodes_state_fk` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='Postal codes (issue #1039) - Tier 4: one row per postcode';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postcodes`
--

/*!40000 ALTER TABLE `postcodes` DISABLE KEYS */;
INSERT INTO `postcodes` VALUES (1,'AD100',6,'AD',489,'02',NULL,'Canillo','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(2,'AD200',6,'AD',487,'03',NULL,'Encamp','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(3,'AD300',6,'AD',491,'05',NULL,'Ordino','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(4,'AD400',6,'AD',493,'04',NULL,'La Massana','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(5,'AD500',6,'AD',488,'07',NULL,'Andorra la Vella','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(6,'AD600',6,'AD',490,'06',NULL,'Sant Julia de Loria','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(7,'AD700',6,'AD',492,'08',NULL,'Escaldes-Engordany','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(8,'96799',5,'AS',NULL,NULL,NULL,'American Samoa','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(9,'97133',189,'BL',NULL,NULL,NULL,'Saint-Barthelemy','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(10,'96941',143,'FM',2581,'PNI',NULL,'Pohnpei','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(11,'96942',143,'FM',2580,'TRK',NULL,'Chuuk','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(12,'96943',143,'FM',2582,'YAP',NULL,'Yap','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(13,'96944',143,'FM',2583,'KSA',NULL,'Kosrae','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(14,'97300',76,'GF',NULL,NULL,NULL,'Cayenne','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(15,'97310',76,'GF',NULL,NULL,NULL,'Kourou','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(16,'97320',76,'GF',NULL,NULL,NULL,'Saint-Laurent-du-Maroni','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(17,'GX11 1AA',84,'GI',NULL,NULL,NULL,'Gibraltar','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(18,'3900',86,'GL',5383,'SM',NULL,'Nuuk','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(19,'3911',86,'GL',5382,'QE',NULL,'Sisimiut','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(20,'3912',86,'GL',5382,'QE',NULL,'Maniitsoq','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(21,'3920',86,'GL',5380,'KU',NULL,'Qaqortoq','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(22,'3922',86,'GL',5380,'KU',NULL,'Nanortalik','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(23,'3940',86,'GL',5383,'SM',NULL,'Paamiut','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(24,'3950',86,'GL',5381,'QT',NULL,'Aasiaat','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(25,'3952',86,'GL',5379,'AV',NULL,'Ilulissat','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(26,'3971',86,'GL',5379,'AV',NULL,'Qaanaaq','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(27,'3980',86,'GL',5383,'SM',NULL,'Ittoqqortoormiit','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(28,'9485',125,'LI',451,'02',NULL,'Nendeln','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(29,'9486',125,'LI',455,'04',NULL,'Schaanwald','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(30,'9487',125,'LI',457,'03',NULL,'Bendern','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(31,'9488',125,'LI',449,'08',NULL,'Schellenberg','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(32,'9490',125,'LI',452,'11',NULL,'Vaduz','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(33,'9491',125,'LI',453,'06',NULL,'Ruggell','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(34,'9492',125,'LI',451,'02',NULL,'Eschen','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(35,'9493',125,'LI',455,'04',NULL,'Mauren','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(36,'9494',125,'LI',450,'07',NULL,'Schaan','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(37,'9495',125,'LI',459,'09',NULL,'Triesen','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(38,'9496',125,'LI',458,'01',NULL,'Balzers','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(39,'9497',125,'LI',456,'10',NULL,'Triesenberg','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(40,'9498',125,'LI',454,'05',NULL,'Planken','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(41,'98000',145,'MC',NULL,NULL,NULL,'Monaco','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(42,'97150',190,'MF',NULL,NULL,NULL,'Saint-Martin','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(43,'96960',137,'MH',5656,'MAJ',NULL,'Majuro','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(44,'96970',137,'MH',5652,'KWA',NULL,'Ebeye','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(45,'96950',164,'MP',NULL,NULL,NULL,'Saipan','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(46,'96951',164,'MP',NULL,NULL,NULL,'Rota','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(47,'96952',164,'MP',NULL,NULL,NULL,'Tinian','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(48,'98800',157,'NC',5225,'01',NULL,'Noumea','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(49,'98860',157,'NC',5226,'02',NULL,'Kone','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(50,'98820',157,'NC',5227,'03',NULL,'We','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(51,'96940',168,'PW',NULL,NULL,NULL,'Palau','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(52,'47890',192,'SM',58,'07',NULL,'San Marino','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(53,'47891',192,'SM',65,'09',NULL,'Serravalle','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(54,'47892',192,'SM',59,'01',NULL,'Acquaviva','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(55,'47893',192,'SM',61,'06',NULL,'Borgo Maggiore','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(56,'47894',192,'SM',60,'02',NULL,'Chiesanuova','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(57,'47895',192,'SM',64,'03',NULL,'Domagnano','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(58,'47896',192,'SM',62,'04',NULL,'Faetano','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(59,'47897',192,'SM',66,'05',NULL,'Fiorentino','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(60,'47898',192,'SM',63,'08',NULL,'Montegiardino','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(61,'00120',238,'VA',NULL,NULL,NULL,'Citta del Vaticano','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(62,'98600',243,'WF',5707,'UV',NULL,'Mata-Utu','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1),(63,'97600',141,'YT',5404,'03',NULL,'Mamoudzou','full',NULL,NULL,'manual',NULL,'2026-04-25 17:16:28','2026-04-25 17:16:28',1);
/*!40000 ALTER TABLE `postcodes` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-25 17:18:26
