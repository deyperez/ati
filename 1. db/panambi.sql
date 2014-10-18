CREATE USER 'panambi'@'localhost' IDENTIFIED BY 'panambi';
GRANT USAGE ON panambi.* TO 'panambi'@'localhost';
CREATE DATABASE  IF NOT EXISTS `panambi` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `panambi`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: panambi
-- ------------------------------------------------------
-- Server version	5.6.14

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
-- Table structure for table `pnbactions`
--

DROP TABLE IF EXISTS `pnbactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbactions` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(75) NOT NULL,
  `qualifiers` text NOT NULL,
  `response` varchar(75) NOT NULL,
  `response_vars` text NOT NULL,
  `active` tinyint(4) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores user defined actions triggered by certain events';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbactions`
--

LOCK TABLES `pnbactions` WRITE;
/*!40000 ALTER TABLE `pnbactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbactions_log`
--

DROP TABLE IF EXISTS `pnbactions_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbactions_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `action_id` (`action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores a log of triggered actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbactions_log`
--

LOCK TABLES `pnbactions_log` WRITE;
/*!40000 ALTER TABLE `pnbactions_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbactions_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbalert`
--

DROP TABLE IF EXISTS `pnbalert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbalert` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `alert_type` tinyint(4) NOT NULL COMMENT '1 - MOBILE, 2 - EMAIL',
  `alert_recipient` varchar(200) DEFAULT NULL,
  `alert_code` varchar(30) DEFAULT NULL,
  `alert_confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `alert_lat` varchar(150) DEFAULT NULL,
  `alert_lon` varchar(150) DEFAULT NULL,
  `alert_radius` tinyint(4) NOT NULL DEFAULT '20',
  `alert_ip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_alert_code` (`alert_code`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores alerts subscribers information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbalert`
--

LOCK TABLES `pnbalert` WRITE;
/*!40000 ALTER TABLE `pnbalert` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbalert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbalert_category`
--

DROP TABLE IF EXISTS `pnbalert_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbalert_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alert_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alert_id` (`alert_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores subscriber alert categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbalert_category`
--

LOCK TABLES `pnbalert_category` WRITE;
/*!40000 ALTER TABLE `pnbalert_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbalert_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbalert_sent`
--

DROP TABLE IF EXISTS `pnbalert_sent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbalert_sent` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL,
  `alert_id` bigint(20) unsigned NOT NULL,
  `alert_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`),
  KEY `alert_id` (`alert_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores a log of alerts sent out to subscribers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbalert_sent`
--

LOCK TABLES `pnbalert_sent` WRITE;
/*!40000 ALTER TABLE `pnbalert_sent` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbalert_sent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbapi_banned`
--

DROP TABLE IF EXISTS `pnbapi_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbapi_banned` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `banned_ipaddress` varchar(50) NOT NULL,
  `banned_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='For logging banned API IP addresses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbapi_banned`
--

LOCK TABLES `pnbapi_banned` WRITE;
/*!40000 ALTER TABLE `pnbapi_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbapi_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbapi_log`
--

DROP TABLE IF EXISTS `pnbapi_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbapi_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_task` varchar(10) NOT NULL,
  `api_parameters` varchar(100) NOT NULL,
  `api_records` tinyint(11) NOT NULL,
  `api_ipaddress` varchar(50) NOT NULL,
  `api_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='For logging API activities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbapi_log`
--

LOCK TABLES `pnbapi_log` WRITE;
/*!40000 ALTER TABLE `pnbapi_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbapi_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbapi_settings`
--

DROP TABLE IF EXISTS `pnbapi_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbapi_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_record_limit` int(11) NOT NULL DEFAULT '20',
  `max_record_limit` int(11) DEFAULT NULL,
  `max_requests_per_ip_address` int(11) DEFAULT NULL,
  `max_requests_quota_basis` int(11) DEFAULT NULL,
  `modification_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='For storing API logging settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbapi_settings`
--

LOCK TABLES `pnbapi_settings` WRITE;
/*!40000 ALTER TABLE `pnbapi_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbapi_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbbadge`
--

DROP TABLE IF EXISTS `pnbbadge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbbadge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores description of badges to be assigned';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbbadge`
--

LOCK TABLES `pnbbadge` WRITE;
/*!40000 ALTER TABLE `pnbbadge` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbbadge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbbadge_users`
--

DROP TABLE IF EXISTS `pnbbadge_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbbadge_users` (
  `user_id` int(11) unsigned NOT NULL,
  `badge_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`badge_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores assigned badge information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbbadge_users`
--

LOCK TABLES `pnbbadge_users` WRITE;
/*!40000 ALTER TABLE `pnbbadge_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbbadge_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbcategory`
--

DROP TABLE IF EXISTS `pnbcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbcategory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(10) NOT NULL DEFAULT 'en_US',
  `category_position` tinyint(4) NOT NULL DEFAULT '0',
  `category_title` varchar(255) DEFAULT NULL,
  `category_description` text,
  `category_color` varchar(20) DEFAULT NULL,
  `category_image` varchar(255) DEFAULT NULL,
  `category_image_thumb` varchar(255) DEFAULT NULL,
  `category_visible` tinyint(4) NOT NULL DEFAULT '1',
  `category_trusted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_visible` (`category_visible`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Holds information about categories defined for a deployment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbcategory`
--

LOCK TABLES `pnbcategory` WRITE;
/*!40000 ALTER TABLE `pnbcategory` DISABLE KEYS */;
INSERT INTO `pnbcategory` VALUES (1,0,'en_US',0,'Agresion verbal','Comentarios inapropiados y amenazas','9900CC',NULL,NULL,1,0),(2,0,'en_US',1,'Agresion fisica','Violencia fisica no sexual','3300FF',NULL,NULL,1,0),(3,0,'en_US',2,'Agresion sexual','De cualquier tipo','663300',NULL,NULL,1,0),(4,0,'en_US',3,'Miedo','Sensacion de inseguridad en general','339900',NULL,NULL,1,1);
/*!40000 ALTER TABLE `pnbcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbcategory_lang`
--

DROP TABLE IF EXISTS `pnbcategory_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbcategory_lang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `category_title` varchar(255) DEFAULT NULL,
  `category_description` text,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds translations for category titles and descriptions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbcategory_lang`
--

LOCK TABLES `pnbcategory_lang` WRITE;
/*!40000 ALTER TABLE `pnbcategory_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbcategory_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbcity`
--

DROP TABLE IF EXISTS `pnbcity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbcity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `city_lat` varchar(150) DEFAULT NULL,
  `city_lon` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Stores cities of countries retrieved by user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbcity`
--

LOCK TABLES `pnbcity` WRITE;
/*!40000 ALTER TABLE `pnbcity` DISABLE KEYS */;
INSERT INTO `pnbcity` VALUES (1,115,'Nairobi','-1.283253','36.817245'),(2,115,'Nakuru','-0.283300','36.066600'),(3,115,'Mombasa','-4.050520','39.667169'),(4,115,'Meru','0.050003','37.650006'),(5,115,'Malindi','-3.216599','40.116593'),(6,115,'Machakos','-1.521248','37.266088'),(7,115,'Kitale','1.018076','35.000236'),(8,115,'Kisii','-0.669412','34.767794'),(9,115,'Kibwezi','-2.410098','37.965766'),(10,115,'Kericho','-0.366600','35.283300'),(11,115,'Kakamega','0.283300','34.750000'),(12,115,'Garissa','-0.466597','39.633292'),(13,115,'Nyeri','-0.419296','36.951701'),(14,115,'Thika','-1.036649','37.077523'),(15,115,'Dadaab','0.055918','40.305419'),(16,115,'Kisumu','-0.102911','34.754176'),(17,115,'Eldoret','0.519833','35.271548');
/*!40000 ALTER TABLE `pnbcity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbcluster`
--

DROP TABLE IF EXISTS `pnbcluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbcluster` (
  `id` int(11) NOT NULL,
  `location_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `latitude_min` double NOT NULL,
  `longitude_min` double NOT NULL,
  `latitude_max` double NOT NULL,
  `longitude_max` double NOT NULL,
  `child_count` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `left_side` int(11) NOT NULL,
  `right_side` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `incident_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `incident_id` (`incident_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores information used for clustering of reports on the map.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbcluster`
--

LOCK TABLES `pnbcluster` WRITE;
/*!40000 ALTER TABLE `pnbcluster` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbcluster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbcomment`
--

DROP TABLE IF EXISTS `pnbcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbcomment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT '0',
  `comment_author` varchar(100) DEFAULT NULL,
  `comment_email` varchar(120) DEFAULT NULL,
  `comment_description` text,
  `comment_ip` varchar(100) DEFAULT NULL,
  `comment_spam` tinyint(4) NOT NULL DEFAULT '0',
  `comment_active` tinyint(4) NOT NULL DEFAULT '0',
  `comment_date` datetime DEFAULT NULL,
  `comment_date_gmt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores comments made on reports';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbcomment`
--

LOCK TABLES `pnbcomment` WRITE;
/*!40000 ALTER TABLE `pnbcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbcountry`
--

DROP TABLE IF EXISTS `pnbcountry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbcountry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` varchar(10) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `capital` varchar(100) DEFAULT NULL,
  `cities` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 COMMENT='Stores a list of all countries and their capital cities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbcountry`
--

LOCK TABLES `pnbcountry` WRITE;
/*!40000 ALTER TABLE `pnbcountry` DISABLE KEYS */;
INSERT INTO `pnbcountry` VALUES (1,'AD','Andorra','Andorra la Vella',0),(2,'AE','United Arab Emirates','Abu Dhabi',0),(3,'AF','Afghanistan','Kabul',0),(4,'AG','Antigua and Barbuda','St. John\'s',0),(5,'AI','Anguilla','The Valley',0),(6,'AL','Albania','Tirana',0),(7,'AM','Armenia','Yerevan',0),(8,'AN','Netherlands Antilles','Willemstad',0),(9,'AO','Angola','Luanda',0),(10,'AQ','Antarctica','',0),(11,'AR','Argentina','Buenos Aires',0),(12,'AS','American Samoa','Pago Pago',0),(13,'AT','Austria','Vienna',0),(14,'AU','Australia','Canberra',0),(15,'AW','Aruba','Oranjestad',0),(16,'AX','Aland Islands','Mariehamn',0),(17,'AZ','Azerbaijan','Baku',0),(18,'BA','Bosnia and Herzegovina','Sarajevo',0),(19,'BB','Barbados','Bridgetown',0),(20,'BD','Bangladesh','Dhaka',0),(21,'BE','Belgium','Brussels',0),(22,'BF','Burkina Faso','Ouagadougou',0),(23,'BG','Bulgaria','Sofia',0),(24,'BH','Bahrain','Manama',0),(25,'BI','Burundi','Bujumbura',0),(26,'BJ','Benin','Porto-Novo',0),(27,'BL','Saint BarthÃ©lemy','Gustavia',0),(28,'BM','Bermuda','Hamilton',0),(29,'BN','Brunei','Bandar Seri Begawan',0),(30,'BO','Bolivia','La Paz',0),(31,'BR','Brazil','BrasÃ­lia',0),(32,'BS','Bahamas','Nassau',0),(33,'BT','Bhutan','Thimphu',0),(34,'BV','Bouvet Island','',0),(35,'BW','Botswana','Gaborone',0),(36,'BY','Belarus','Minsk',0),(37,'BZ','Belize','Belmopan',0),(38,'CA','Canada','Ottawa',0),(39,'CC','Cocos Islands','West Island',0),(40,'CD','Democratic Republic of the Congo','Kinshasa',0),(41,'CF','Central African Republic','Bangui',0),(42,'CG','Congo Brazzavile','Brazzaville',0),(43,'CH','Switzerland','Berne',0),(44,'CI','Ivory Coast','Yamoussoukro',0),(45,'CK','Cook Islands','Avarua',0),(46,'CL','Chile','Santiago',0),(47,'CM','Cameroon','YaoundÃ©',0),(48,'CN','China','Beijing',0),(49,'CO','Colombia','BogotÃ¡',0),(50,'CR','Costa Rica','San JosÃ©',0),(51,'CS','Serbia and Montenegro','Belgrade',0),(52,'CU','Cuba','Havana',0),(53,'CV','Cape Verde','Praia',0),(54,'CX','Christmas Island','Flying Fish Cove',0),(55,'CY','Cyprus','Nicosia',0),(56,'CZ','Czech Republic','Prague',0),(57,'DE','Germany','Berlin',0),(58,'DJ','Djibouti','Djibouti',0),(59,'DK','Denmark','Copenhagen',0),(60,'DM','Dominica','Roseau',0),(61,'DO','Dominican Republic','Santo Domingo',0),(62,'DZ','Algeria','Algiers',0),(63,'EC','Ecuador','Quito',0),(64,'EE','Estonia','Tallinn',0),(65,'EG','Egypt','Cairo',0),(66,'EH','Western Sahara','El-Aaiun',0),(67,'ER','Eritrea','Asmara',0),(68,'ES','Spain','Madrid',0),(69,'ET','Ethiopia','Addis Ababa',0),(70,'FI','Finland','Helsinki',0),(71,'FJ','Fiji','Suva',0),(72,'FK','Falkland Islands','Stanley',0),(73,'FM','Micronesia','Palikir',0),(74,'FO','Faroe Islands','TÃ³rshavn',0),(75,'FR','France','Paris',0),(76,'GA','Gabon','Libreville',0),(77,'GB','United Kingdom','London',0),(78,'GD','Grenada','St. George\'s',0),(79,'GE','Georgia','Tbilisi',0),(80,'GF','French Guiana','Cayenne',0),(81,'GG','Guernsey','St Peter Port',0),(82,'GH','Ghana','Accra',0),(83,'GI','Gibraltar','Gibraltar',0),(84,'GL','Greenland','Nuuk',0),(85,'GM','Gambia','Banjul',0),(86,'GN','Guinea','Conakry',0),(87,'GP','Guadeloupe','Basse-Terre',0),(88,'GQ','Equatorial Guinea','Malabo',0),(89,'GR','Greece','Athens',0),(90,'GS','South Georgia and the South Sandwich Islands','Grytviken',0),(91,'GT','Guatemala','Guatemala City',0),(92,'GU','Guam','HagÃ¥tÃ±a',0),(93,'GW','Guinea-Bissau','Bissau',0),(94,'GY','Guyana','Georgetown',0),(95,'HK','Hong Kong','Hong Kong',0),(96,'HM','Heard Island and McDonald Islands','',0),(97,'HN','Honduras','Tegucigalpa',0),(98,'HR','Croatia','Zagreb',0),(99,'HT','Haiti','Port-au-Prince',0),(100,'HU','Hungary','Budapest',0),(101,'ID','Indonesia','Jakarta',0),(102,'IE','Ireland','Dublin',0),(103,'IL','Israel','Jerusalem',0),(104,'IM','Isle of Man','Douglas, Isle of Man',0),(105,'IN','India','New Delhi',0),(106,'IO','British Indian Ocean Territory','Diego Garcia',0),(107,'IQ','Iraq','Baghdad',0),(108,'IR','Iran','Tehran',0),(109,'IS','Iceland','ReykjavÃ­k',0),(110,'IT','Italy','Rome',0),(111,'JE','Jersey','Saint Helier',0),(112,'JM','Jamaica','Kingston',0),(113,'JO','Jordan','Amman',0),(114,'JP','Japan','Tokyo',0),(115,'KE','Kenya','Nairobi',17),(116,'KG','Kyrgyzstan','Bishkek',0),(117,'KH','Cambodia','Phnom Penh',0),(118,'KI','Kiribati','South Tarawa',0),(119,'KM','Comoros','Moroni',0),(120,'KN','Saint Kitts and Nevis','Basseterre',0),(121,'KP','North Korea','Pyongyang',0),(122,'KR','South Korea','Seoul',0),(123,'KW','Kuwait','Kuwait City',0),(124,'KY','Cayman Islands','George Town',0),(125,'KZ','Kazakhstan','Astana',0),(126,'LA','Laos','Vientiane',0),(127,'LB','Lebanon','Beirut',0),(128,'LC','Saint Lucia','Castries',0),(129,'LI','Liechtenstein','Vaduz',0),(130,'LK','Sri Lanka','Colombo',0),(131,'LR','Liberia','Monrovia',0),(132,'LS','Lesotho','Maseru',0),(133,'LT','Lithuania','Vilnius',0),(134,'LU','Luxembourg','Luxembourg',0),(135,'LV','Latvia','Riga',0),(136,'LY','Libya','Tripolis',0),(137,'MA','Morocco','Rabat',0),(138,'MC','Monaco','Monaco',0),(139,'MD','Moldova','Chi_in_u',0),(140,'ME','Montenegro','Podgorica',0),(141,'MF','Saint Martin','Marigot',0),(142,'MG','Madagascar','Antananarivo',0),(143,'MH','Marshall Islands','Uliga',0),(144,'MK','Macedonia','Skopje',0),(145,'ML','Mali','Bamako',0),(146,'MM','Myanmar','Yangon',0),(147,'MN','Mongolia','Ulan Bator',0),(148,'MO','Macao','Macao',0),(149,'MP','Northern Mariana Islands','Saipan',0),(150,'MQ','Martinique','Fort-de-France',0),(151,'MR','Mauritania','Nouakchott',0),(152,'MS','Montserrat','Plymouth',0),(153,'MT','Malta','Valletta',0),(154,'MU','Mauritius','Port Louis',0),(155,'MV','Maldives','MalÃ©',0),(156,'MW','Malawi','Lilongwe',0),(157,'MX','Mexico','Mexico City',0),(158,'MY','Malaysia','Kuala Lumpur',0),(159,'MZ','Mozambique','Maputo',0),(160,'NA','Namibia','Windhoek',0),(161,'NC','New Caledonia','NoumÃ©a',0),(162,'NE','Niger','Niamey',0),(163,'NF','Norfolk Island','Kingston',0),(164,'NG','Nigeria','Abuja',0),(165,'NI','Nicaragua','Managua',0),(166,'NL','Netherlands','Amsterdam',0),(167,'NO','Norway','Oslo',0),(168,'NP','Nepal','Kathmandu',0),(169,'NR','Nauru','Yaren',0),(170,'NU','Niue','Alofi',0),(171,'NZ','New Zealand','Wellington',0),(172,'OM','Oman','Muscat',0),(173,'PA','Panama','Panama City',0),(174,'PE','Peru','Lima',0),(175,'PF','French Polynesia','Papeete',0),(176,'PG','Papua New Guinea','Port Moresby',0),(177,'PH','Philippines','Manila',0),(178,'PK','Pakistan','Islamabad',0),(179,'PL','Poland','Warsaw',0),(180,'PM','Saint Pierre and Miquelon','Saint-Pierre',0),(181,'PN','Pitcairn','Adamstown',0),(182,'PR','Puerto Rico','San Juan',0),(183,'PS','Palestinian Territory','East Jerusalem',0),(184,'PT','Portugal','Lisbon',0),(185,'PW','Palau','Koror',0),(186,'PY','Paraguay','AsunciÃ³n',0),(187,'QA','Qatar','Doha',0),(188,'RE','Reunion','Saint-Denis',0),(189,'RO','Romania','Bucharest',0),(190,'RS','Serbia','Belgrade',0),(191,'RU','Russia','Moscow',0),(192,'RW','Rwanda','Kigali',0),(193,'SA','Saudi Arabia','Riyadh',0),(194,'SB','Solomon Islands','Honiara',0),(195,'SC','Seychelles','Victoria',0),(196,'SD','Sudan','Khartoum',0),(197,'SE','Sweden','Stockholm',0),(198,'SG','Singapore','Singapur',0),(199,'SH','Saint Helena','Jamestown',0),(200,'SI','Slovenia','Ljubljana',0),(201,'SJ','Svalbard and Jan Mayen','Longyearbyen',0),(202,'SK','Slovakia','Bratislava',0),(203,'SL','Sierra Leone','Freetown',0),(204,'SM','San Marino','San Marino',0),(205,'SN','Senegal','Dakar',0),(206,'SO','Somalia','Mogadishu',0),(207,'SR','Suriname','Paramaribo',0),(208,'ST','Sao Tome and Principe','SÃ£o TomÃ©',0),(209,'SV','El Salvador','San Salvador',0),(210,'SY','Syria','Damascus',0),(211,'SZ','Swaziland','Mbabane',0),(212,'TC','Turks and Caicos Islands','Cockburn Town',0),(213,'TD','Chad','N\'Djamena',0),(214,'TF','French Southern Territories','Martin-de-ViviÃ¨s',0),(215,'TG','Togo','LomÃ©',0),(216,'TH','Thailand','Bangkok',0),(217,'TJ','Tajikistan','Dushanbe',0),(218,'TK','Tokelau','',0),(219,'TL','East Timor','Dili',0),(220,'TM','Turkmenistan','Ashgabat',0),(221,'TN','Tunisia','Tunis',0),(222,'TO','Tonga','Nuku\'alofa',0),(223,'TR','Turkey','Ankara',0),(224,'TT','Trinidad and Tobago','Port of Spain',0),(225,'TV','Tuvalu','Vaiaku',0),(226,'TW','Taiwan','Taipei',0),(227,'TZ','Tanzania','Dar es Salaam',0),(228,'UA','Ukraine','Kiev',0),(229,'UG','Uganda','Kampala',0),(230,'UM','United States Minor Outlying Islands','',0),(231,'US','United States','Washington',0),(232,'UY','Uruguay','Montevideo',0),(233,'UZ','Uzbekistan','Tashkent',0),(234,'VA','Vatican','Vatican City',0),(235,'VC','Saint Vincent and the Grenadines','Kingstown',0),(236,'VE','Venezuela','Caracas',0),(237,'VG','British Virgin Islands','Road Town',0),(238,'VI','U.S. Virgin Islands','Charlotte Amalie',0),(239,'VN','Vietnam','Hanoi',0),(240,'VU','Vanuatu','Port Vila',0),(241,'WF','Wallis and Futuna','MatÃ¢\'Utu',0),(242,'WS','Samoa','Apia',0),(243,'YE','Yemen','Sanâ€˜aâ€™',0),(244,'YT','Mayotte','Mamoudzou',0),(245,'ZA','South Africa','Pretoria',0),(246,'ZM','Zambia','Lusaka',0),(247,'ZW','Zimbabwe','Harare',0),(248,'XK','Kosovo','Pristina',0),(249,'SS','South Sudan','Juba',0);
/*!40000 ALTER TABLE `pnbcountry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbexternalapp`
--

DROP TABLE IF EXISTS `pnbexternalapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbexternalapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Info on external apps(mobile) that work with your deployment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbexternalapp`
--

LOCK TABLES `pnbexternalapp` WRITE;
/*!40000 ALTER TABLE `pnbexternalapp` DISABLE KEYS */;
INSERT INTO `pnbexternalapp` VALUES (1,'iPhone','http://download.ushahidi.com/track_download.php?download=ios'),(2,'Android','http://download.ushahidi.com/track_download.php?download=android');
/*!40000 ALTER TABLE `pnbexternalapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbfeed`
--

DROP TABLE IF EXISTS `pnbfeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbfeed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `feed_name` varchar(255) DEFAULT NULL,
  `feed_url` varchar(255) DEFAULT NULL,
  `feed_cache` text,
  `feed_active` tinyint(4) DEFAULT '1',
  `feed_update` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information about RSS Feeds a deployment subscribes to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbfeed`
--

LOCK TABLES `pnbfeed` WRITE;
/*!40000 ALTER TABLE `pnbfeed` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbfeed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbfeed_item`
--

DROP TABLE IF EXISTS `pnbfeed_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbfeed_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `feed_id` int(11) unsigned NOT NULL,
  `location_id` bigint(20) unsigned DEFAULT '0',
  `incident_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `item_title` varchar(255) DEFAULT NULL,
  `item_description` text,
  `item_link` varchar(255) DEFAULT NULL,
  `item_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_id` (`feed_id`),
  KEY `incident_id` (`incident_id`),
  KEY `location_id` (`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores feed items pulled from each RSS Feed';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbfeed_item`
--

LOCK TABLES `pnbfeed_item` WRITE;
/*!40000 ALTER TABLE `pnbfeed_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbfeed_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbfeed_item_category`
--

DROP TABLE IF EXISTS `pnbfeed_item_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbfeed_item_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_item_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `feed_item_category_ids` (`feed_item_id`,`category_id`),
  KEY `feed_item_id` (`feed_item_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores fetched feed items categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbfeed_item_category`
--

LOCK TABLES `pnbfeed_item_category` WRITE;
/*!40000 ALTER TABLE `pnbfeed_item_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbfeed_item_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbform`
--

DROP TABLE IF EXISTS `pnbform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_title` varchar(200) NOT NULL,
  `form_description` text,
  `form_active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `form_title` (`form_title`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores all report submission forms created(default+custom)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbform`
--

LOCK TABLES `pnbform` WRITE;
/*!40000 ALTER TABLE `pnbform` DISABLE KEYS */;
INSERT INTO `pnbform` VALUES (1,'Default Form','Default form, for report entry',1);
/*!40000 ALTER TABLE `pnbform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbform_field`
--

DROP TABLE IF EXISTS `pnbform_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbform_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '1',
  `field_name` varchar(200) DEFAULT NULL,
  `field_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - TEXTFIELD, 2 - TEXTAREA (FREETEXT), 3 - DATE, 4 - PASSWORD, 5 - RADIO, 6 - CHECKBOX',
  `field_required` tinyint(4) DEFAULT '0',
  `field_position` tinyint(4) NOT NULL DEFAULT '0',
  `field_default` text,
  `field_maxlength` int(11) NOT NULL DEFAULT '0',
  `field_width` smallint(6) NOT NULL DEFAULT '0',
  `field_height` tinyint(4) DEFAULT '5',
  `field_isdate` tinyint(4) NOT NULL DEFAULT '0',
  `field_ispublic_visible` tinyint(4) NOT NULL DEFAULT '0',
  `field_ispublic_submit` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_name` (`field_name`,`form_id`),
  KEY `fk_form_id` (`form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all custom form fields created by users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbform_field`
--

LOCK TABLES `pnbform_field` WRITE;
/*!40000 ALTER TABLE `pnbform_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbform_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbform_field_option`
--

DROP TABLE IF EXISTS `pnbform_field_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbform_field_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_field_id` int(11) NOT NULL DEFAULT '0',
  `option_name` varchar(200) DEFAULT NULL,
  `option_value` text,
  PRIMARY KEY (`id`),
  KEY `form_field_id` (`form_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options related to custom form fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbform_field_option`
--

LOCK TABLES `pnbform_field_option` WRITE;
/*!40000 ALTER TABLE `pnbform_field_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbform_field_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbform_response`
--

DROP TABLE IF EXISTS `pnbform_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbform_response` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_field_id` int(11) NOT NULL,
  `incident_id` bigint(20) unsigned NOT NULL,
  `form_response` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_form_field_id` (`form_field_id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores responses to custom form fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbform_response`
--

LOCK TABLES `pnbform_response` WRITE;
/*!40000 ALTER TABLE `pnbform_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbform_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbgeometry`
--

DROP TABLE IF EXISTS `pnbgeometry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbgeometry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL,
  `geometry` geometry NOT NULL,
  `geometry_label` varchar(150) DEFAULT NULL,
  `geometry_comment` varchar(255) DEFAULT NULL,
  `geometry_color` varchar(20) DEFAULT NULL,
  `geometry_strokewidth` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  SPATIAL KEY `geometry` (`geometry`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores map geometries i.e polygons, lines etc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbgeometry`
--

LOCK TABLES `pnbgeometry` WRITE;
/*!40000 ALTER TABLE `pnbgeometry` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbgeometry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbincident`
--

DROP TABLE IF EXISTS `pnbincident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbincident` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned NOT NULL,
  `form_id` int(11) NOT NULL DEFAULT '1',
  `locale` varchar(10) NOT NULL DEFAULT 'en_US',
  `user_id` int(11) unsigned DEFAULT NULL,
  `incident_title` varchar(255) DEFAULT NULL,
  `incident_description` longtext,
  `incident_date` datetime DEFAULT NULL,
  `incident_mode` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - WEB, 2 - SMS, 3 - EMAIL, 4 - TWITTER',
  `incident_active` tinyint(4) NOT NULL DEFAULT '0',
  `incident_verified` tinyint(4) NOT NULL DEFAULT '0',
  `incident_dateadd` datetime DEFAULT NULL,
  `incident_dateadd_gmt` datetime DEFAULT NULL,
  `incident_datemodify` datetime DEFAULT NULL,
  `incident_alert_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - Not Tagged for Sending, 1 - Tagged for Sending, 2 - Alerts Have Been Sent',
  `incident_zoom` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `incident_active` (`incident_active`),
  KEY `incident_date` (`incident_date`),
  KEY `form_id` (`form_id`),
  KEY `user_id` (`user_id`),
  KEY `incident_mode` (`incident_mode`),
  KEY `incident_verified` (`incident_verified`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores reports submitted';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbincident`
--

LOCK TABLES `pnbincident` WRITE;
/*!40000 ALTER TABLE `pnbincident` DISABLE KEYS */;
INSERT INTO `pnbincident` VALUES (1,1,1,'en_US',1,'Albañil maleducado','Hoy cruce frente a una obra y un albañil penso que si me gritaba amenazante que me iba a ****** todo mal si me agarraba iba a ser simpatico, pero en realidad me senti insegura y agredida','2014-10-10 12:54:00',1,1,1,NULL,NULL,'2014-10-18 02:46:39',2,16);
/*!40000 ALTER TABLE `pnbincident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbincident_category`
--

DROP TABLE IF EXISTS `pnbincident_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbincident_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `incident_category_ids` (`incident_id`,`category_id`),
  KEY `incident_id` (`incident_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Stores submitted reports categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbincident_category`
--

LOCK TABLES `pnbincident_category` WRITE;
/*!40000 ALTER TABLE `pnbincident_category` DISABLE KEYS */;
INSERT INTO `pnbincident_category` VALUES (2,1,1);
/*!40000 ALTER TABLE `pnbincident_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbincident_lang`
--

DROP TABLE IF EXISTS `pnbincident_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbincident_lang` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `incident_title` varchar(255) DEFAULT NULL,
  `incident_description` longtext,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds translations for report titles and descriptions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbincident_lang`
--

LOCK TABLES `pnbincident_lang` WRITE;
/*!40000 ALTER TABLE `pnbincident_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbincident_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbincident_person`
--

DROP TABLE IF EXISTS `pnbincident_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbincident_person` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `person_first` varchar(200) DEFAULT NULL,
  `person_last` varchar(200) DEFAULT NULL,
  `person_email` varchar(120) DEFAULT NULL,
  `person_phone` varchar(60) DEFAULT NULL,
  `person_ip` varchar(50) DEFAULT NULL,
  `person_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Holds information provided by people who submit reports';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbincident_person`
--

LOCK TABLES `pnbincident_person` WRITE;
/*!40000 ALTER TABLE `pnbincident_person` DISABLE KEYS */;
INSERT INTO `pnbincident_person` VALUES (1,1,'','','',NULL,NULL,'2014-10-18 02:46:39');
/*!40000 ALTER TABLE `pnbincident_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnblayer`
--

DROP TABLE IF EXISTS `pnblayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnblayer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layer_name` varchar(255) DEFAULT NULL,
  `layer_url` varchar(255) DEFAULT NULL,
  `layer_file` varchar(100) DEFAULT NULL,
  `layer_color` varchar(20) DEFAULT NULL,
  `layer_visible` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds static layer information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnblayer`
--

LOCK TABLES `pnblayer` WRITE;
/*!40000 ALTER TABLE `pnblayer` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnblayer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnblevel`
--

DROP TABLE IF EXISTS `pnblevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnblevel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level_title` varchar(200) DEFAULT NULL,
  `level_description` varchar(200) DEFAULT NULL,
  `level_weight` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Stores level of trust assigned to reporters of the platform';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnblevel`
--

LOCK TABLES `pnblevel` WRITE;
/*!40000 ALTER TABLE `pnblevel` DISABLE KEYS */;
INSERT INTO `pnblevel` VALUES (1,'SPAM + Delete','SPAM + Delete',-2),(2,'SPAM','SPAM',-1),(3,'Untrusted','Untrusted',0),(4,'Trusted','Trusted',1),(5,'Trusted + Verify','Trusted + Verify',2);
/*!40000 ALTER TABLE `pnblevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnblocation`
--

DROP TABLE IF EXISTS `pnblocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnblocation` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `latitude` double NOT NULL DEFAULT '0',
  `longitude` double NOT NULL DEFAULT '0',
  `location_visible` tinyint(4) NOT NULL DEFAULT '1',
  `location_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores location information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnblocation`
--

LOCK TABLES `pnblocation` WRITE;
/*!40000 ALTER TABLE `pnblocation` DISABLE KEYS */;
INSERT INTO `pnblocation` VALUES (1,'Bo. Jara',186,-25.277289,-57.60134,1,'2014-10-18 02:46:39');
/*!40000 ALTER TABLE `pnblocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbmaintenance`
--

DROP TABLE IF EXISTS `pnbmaintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbmaintenance` (
  `allowed_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`allowed_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Puts a site in maintenance mode if data exists in this table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbmaintenance`
--

LOCK TABLES `pnbmaintenance` WRITE;
/*!40000 ALTER TABLE `pnbmaintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbmaintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbmedia`
--

DROP TABLE IF EXISTS `pnbmedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbmedia` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `message_id` bigint(20) unsigned DEFAULT NULL,
  `badge_id` int(11) DEFAULT NULL,
  `media_type` tinyint(4) DEFAULT NULL COMMENT '1 - IMAGES, 2 - VIDEO, 3 - AUDIO, 4 - NEWS, 5 - PODCAST',
  `media_title` varchar(255) DEFAULT NULL,
  `media_description` longtext,
  `media_link` varchar(255) DEFAULT NULL,
  `media_medium` varchar(255) DEFAULT NULL,
  `media_thumb` varchar(255) DEFAULT NULL,
  `media_date` datetime DEFAULT NULL,
  `media_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`),
  KEY `location_id` (`location_id`),
  KEY `badge_id` (`badge_id`),
  KEY `message_id` (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores any media submitted along with a report';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbmedia`
--

LOCK TABLES `pnbmedia` WRITE;
/*!40000 ALTER TABLE `pnbmedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbmedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbmessage`
--

DROP TABLE IF EXISTS `pnbmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbmessage` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT '0',
  `incident_id` bigint(20) unsigned DEFAULT '0',
  `user_id` int(11) unsigned DEFAULT '0',
  `reporter_id` bigint(20) unsigned DEFAULT NULL,
  `service_messageid` varchar(100) DEFAULT NULL,
  `message_from` varchar(100) DEFAULT NULL,
  `message_to` varchar(100) DEFAULT NULL,
  `message` text,
  `message_detail` text,
  `message_type` tinyint(4) DEFAULT '1' COMMENT '1 - INBOX, 2 - OUTBOX (From Admin), 3 - DELETED',
  `message_date` datetime DEFAULT NULL,
  `message_level` tinyint(4) DEFAULT '0' COMMENT '0 - UNREAD, 1 - READ, 99 - SPAM',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `incident_id` (`incident_id`),
  KEY `reporter_id` (`reporter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores tweets, emails and SMS messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbmessage`
--

LOCK TABLES `pnbmessage` WRITE;
/*!40000 ALTER TABLE `pnbmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbopenid`
--

DROP TABLE IF EXISTS `pnbopenid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbopenid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `openid` varchar(255) NOT NULL,
  `openid_email` varchar(127) NOT NULL,
  `openid_server` varchar(255) NOT NULL,
  `openid_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores usersâ€™ openid information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbopenid`
--

LOCK TABLES `pnbopenid` WRITE;
/*!40000 ALTER TABLE `pnbopenid` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbopenid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbpage`
--

DROP TABLE IF EXISTS `pnbpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbpage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) NOT NULL,
  `page_description` longtext,
  `page_tab` varchar(100) NOT NULL,
  `page_active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores user created pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbpage`
--

LOCK TABLES `pnbpage` WRITE;
/*!40000 ALTER TABLE `pnbpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbpermissions`
--

DROP TABLE IF EXISTS `pnbpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Stores permissions used for access control';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbpermissions`
--

LOCK TABLES `pnbpermissions` WRITE;
/*!40000 ALTER TABLE `pnbpermissions` DISABLE KEYS */;
INSERT INTO `pnbpermissions` VALUES (1,'reports_view'),(2,'reports_edit'),(4,'reports_comments'),(5,'reports_download'),(6,'reports_upload'),(7,'messages'),(8,'messages_reporters'),(9,'stats'),(10,'settings'),(11,'manage'),(12,'users'),(13,'manage_roles'),(16,'reports_verify'),(17,'reports_approve'),(18,'admin_ui'),(19,'member_ui'),(20,'delete_all_reports');
/*!40000 ALTER TABLE `pnbpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbpermissions_roles`
--

DROP TABLE IF EXISTS `pnbpermissions_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbpermissions_roles` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores permissions assigned to roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbpermissions_roles`
--

LOCK TABLES `pnbpermissions_roles` WRITE;
/*!40000 ALTER TABLE `pnbpermissions_roles` DISABLE KEYS */;
INSERT INTO `pnbpermissions_roles` VALUES (1,14),(2,1),(2,2),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,14),(2,15),(2,16),(2,17),(2,18),(3,1),(3,2),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,20),(4,19);
/*!40000 ALTER TABLE `pnbpermissions_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbplugin`
--

DROP TABLE IF EXISTS `pnbplugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbplugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(100) NOT NULL,
  `plugin_url` varchar(250) DEFAULT NULL,
  `plugin_description` text,
  `plugin_priority` tinyint(4) DEFAULT '0',
  `plugin_active` tinyint(4) DEFAULT '0',
  `plugin_installed` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugin_name` (`plugin_name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Holds a list of all plugins installed on a deployment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbplugin`
--

LOCK TABLES `pnbplugin` WRITE;
/*!40000 ALTER TABLE `pnbplugin` DISABLE KEYS */;
INSERT INTO `pnbplugin` VALUES (1,'clickatell',NULL,NULL,0,0,0),(2,'frontlinesms',NULL,NULL,0,0,0),(3,'sharing',NULL,NULL,0,0,0),(4,'smssync',NULL,NULL,0,0,0);
/*!40000 ALTER TABLE `pnbplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbprivate_message`
--

DROP TABLE IF EXISTS `pnbprivate_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbprivate_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL,
  `from_user_id` int(11) DEFAULT '0',
  `private_subject` varchar(255) NOT NULL,
  `private_message` text NOT NULL,
  `private_message_date` datetime NOT NULL,
  `private_message_new` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores private messages sent between Members';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbprivate_message`
--

LOCK TABLES `pnbprivate_message` WRITE;
/*!40000 ALTER TABLE `pnbprivate_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbprivate_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbrating`
--

DROP TABLE IF EXISTS `pnbrating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbrating` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `comment_id` bigint(20) unsigned DEFAULT NULL,
  `rating` tinyint(4) DEFAULT '0',
  `rating_ip` varchar(100) DEFAULT NULL,
  `rating_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `incident_id` (`incident_id`),
  KEY `comment_id` (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores credibility ratings for reports and comments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbrating`
--

LOCK TABLES `pnbrating` WRITE;
/*!40000 ALTER TABLE `pnbrating` DISABLE KEYS */;
INSERT INTO `pnbrating` VALUES (1,0,1,NULL,1,'127.0.0.1','2014-10-18 02:53:19');
/*!40000 ALTER TABLE `pnbrating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbreporter`
--

DROP TABLE IF EXISTS `pnbreporter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbreporter` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `service_id` int(10) unsigned DEFAULT NULL,
  `level_id` int(11) unsigned DEFAULT NULL,
  `service_account` varchar(255) DEFAULT NULL,
  `reporter_first` varchar(200) DEFAULT NULL,
  `reporter_last` varchar(200) DEFAULT NULL,
  `reporter_email` varchar(120) DEFAULT NULL,
  `reporter_phone` varchar(60) DEFAULT NULL,
  `reporter_ip` varchar(50) DEFAULT NULL,
  `reporter_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `location_id` (`location_id`),
  KEY `service_id` (`service_id`),
  KEY `level_id` (`level_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information on report submitters via email, twitter and sms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbreporter`
--

LOCK TABLES `pnbreporter` WRITE;
/*!40000 ALTER TABLE `pnbreporter` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnbreporter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbroles`
--

DROP TABLE IF EXISTS `pnbroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbroles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `access_level` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Defines user access levels and privileges on a deployment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbroles`
--

LOCK TABLES `pnbroles` WRITE;
/*!40000 ALTER TABLE `pnbroles` DISABLE KEYS */;
INSERT INTO `pnbroles` VALUES (1,'login','Login privileges, granted after account confirmation',0),(2,'admin','Administrative user, has access to almost everything.',90),(3,'superadmin','Super administrative user, has access to everything.',100),(4,'member','Regular user with access only to the member area',10);
/*!40000 ALTER TABLE `pnbroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbroles_users`
--

DROP TABLE IF EXISTS `pnbroles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbroles_users` (
  `user_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores roles assigned to users registered on a deployment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbroles_users`
--

LOCK TABLES `pnbroles_users` WRITE;
/*!40000 ALTER TABLE `pnbroles_users` DISABLE KEYS */;
INSERT INTO `pnbroles_users` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `pnbroles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbscheduler`
--

DROP TABLE IF EXISTS `pnbscheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbscheduler` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scheduler_name` varchar(100) NOT NULL,
  `scheduler_last` int(10) unsigned NOT NULL DEFAULT '0',
  `scheduler_weekday` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_day` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_hour` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_minute` smallint(6) NOT NULL,
  `scheduler_controller` varchar(100) NOT NULL,
  `scheduler_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Stores schedules for cron jobs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbscheduler`
--

LOCK TABLES `pnbscheduler` WRITE;
/*!40000 ALTER TABLE `pnbscheduler` DISABLE KEYS */;
INSERT INTO `pnbscheduler` VALUES (1,'Feeds',1413601205,-1,-1,-1,0,'s_feeds',1),(2,'Alerts',1413602880,-1,-1,-1,-1,'s_alerts',1),(3,'Email',1413601205,-1,-1,-1,0,'s_email',1),(4,'Twitter',1413601205,-1,-1,-1,0,'s_twitter',1),(5,'Cleanup',1413601205,-1,-1,-1,0,'s_cleanup',1);
/*!40000 ALTER TABLE `pnbscheduler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbscheduler_log`
--

DROP TABLE IF EXISTS `pnbscheduler_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbscheduler_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `scheduler_id` int(10) unsigned NOT NULL,
  `scheduler_status` varchar(20) DEFAULT NULL,
  `scheduler_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scheduler_id` (`scheduler_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='Stores a log of scheduler actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbscheduler_log`
--

LOCK TABLES `pnbscheduler_log` WRITE;
/*!40000 ALTER TABLE `pnbscheduler_log` DISABLE KEYS */;
INSERT INTO `pnbscheduler_log` VALUES (1,1,'200',1413599823),(2,2,'200',1413599823),(3,3,'200',1413599823),(4,4,'200',1413599823),(5,5,'200',1413599823),(6,2,'200',1413599898),(7,2,'200',1413600025),(8,2,'200',1413600061),(9,2,'200',1413600123),(10,2,'200',1413600366),(11,2,'200',1413600427),(12,2,'200',1413600493),(13,2,'200',1413600551),(14,2,'200',1413600608),(15,2,'200',1413600661),(16,2,'200',1413600757),(17,2,'200',1413600781),(18,2,'200',1413600926),(19,2,'200',1413600963),(20,1,'200',1413601205),(21,2,'200',1413601205),(22,3,'200',1413601205),(23,4,'200',1413601205),(24,5,'200',1413601205),(25,2,'200',1413601533),(26,2,'200',1413602037),(27,2,'200',1413602044),(28,2,'200',1413602104),(29,2,'200',1413602168),(30,2,'200',1413602320),(31,2,'200',1413602774),(32,2,'200',1413602880);
/*!40000 ALTER TABLE `pnbscheduler_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbservice`
--

DROP TABLE IF EXISTS `pnbservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbservice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) DEFAULT NULL,
  `service_description` varchar(255) DEFAULT NULL,
  `service_url` varchar(255) DEFAULT NULL,
  `service_api` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Info on input sources i.e SMS, Email, Twitter';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbservice`
--

LOCK TABLES `pnbservice` WRITE;
/*!40000 ALTER TABLE `pnbservice` DISABLE KEYS */;
INSERT INTO `pnbservice` VALUES (1,'SMS','Text messages from phones',NULL,NULL),(2,'Email','Email messages sent to your deployment',NULL,NULL),(3,'Twitter','Tweets tweets tweets','http://twitter.com',NULL);
/*!40000 ALTER TABLE `pnbservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbsessions`
--

DROP TABLE IF EXISTS `pnbsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbsessions` (
  `session_id` varchar(127) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores session information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbsessions`
--

LOCK TABLES `pnbsessions` WRITE;
/*!40000 ALTER TABLE `pnbsessions` DISABLE KEYS */;
INSERT INTO `pnbsessions` VALUES ('p3g0rdp5f3t10tab1a6ddcnd27',1413601538,'27CHOqv83lXTGJPTvgvNfeIe5s8rgRsXTlzLO2QRdIKvBLK9jsM9ud2N7QfD1DzsWyOWoRnk6VJbSL5vc8gDO+cJFtBMmfTNLR76+HRl2Ls/Zi50rEjaUr9jw+SaPW0pBFzJBC05E5AcVjZqsu6UK5OUV9Un9ar1oDM6IYbFSZ1K98vpzNrpIsxWOPEvwM7O3SWXtJTIeLpyogU//3+dVM2GFaoHyYjPXvnmm5KMOM9rIM1id8KTI1DrThCxUJk0qcIUOalbYNcl9TQVI2BOgHJWzxQf7nyKKRNJquW/Q2cDbaScfY/zJNhnK2OFiL4AU1jxTTMo9z0dY2hurbVh1f7Zwlg8KmVR60qLaYbwHxA4m/QXg38WCwx6Ucr4UdqIKebs9EhMx9TxKGvEe97BnC4uZT4auDVDCUyu82eCcJL8vu0tfoiVDlMpJFbvxva/oJ4yfAGvrABSg0F5J5QNFO1Sdr6hbSpZW43B6dwkrXnUDXbRJAC1wBz4wfolJPNdX4TMsD+zyRYwIWiULyILTKh7StbK3i7z329VTiiOBq1+ekXgAos='),('ajfjenvpi3905qdi2d2p9l1c82',1413602880,'nzr26YkOiZHm84OOf9JtiV0wyUTVF5StIGYgbs4akVF+erziRIyB7u5mzFxsA+1lp9bJVDXDMSXWzlkh4jBa3msO1wrzTkS46sIYWNnEakBDXbqg3LsL7QukkscYeLwI90Q0yaddQZVZ/ledis/91hERHOpmpMUEYwIES2iqI8tIAOFF4Yk8g9YaXhwnlncunBh7qbGYRnpkmSgfP4bU99I55FtE9OJZlIll0J5g6RT7i5YmZIZ4x1lf0aqTOwcI8ZoPSL5yC/cAwPs+7FVZeQCCT+AukHWiZ3vSJSz9p3NwtOGaGPu0KE/bR6GCU4KJ8EksKphNWmxEeTEyc4N3PqDl3ErZB506zag6c3k+u+7eoMrunl1mGBSOin6uJtoRDwi580wJVcDLkrp2Yipu+NFnJM03w28MtQAHTLMma1+atRhNK/cVpamXgZYYP7D5drECBjQKg8SZB1y2z+FC+C3WzGLtn/o2ASFscJ012hICzs0EyUtz1MKtjxCF4TwQfcRMivzNs2CPbYNrN2RxrAP6SJ4Jp4Bqkq8ht33ChBSl343dl6xd/4rcNtTOeATel/rN2mNaf2GGHqccM1cAVuo8q3n30DKDhG6wAh/46a8ftGpSaVNmj+xHbZ0F+Yn+Dxu3H0CVeiduJzI9vDdziCiFKijuKDW3eXVIMlOX5GN2vGKqmx7ym7ZSdozCA5GBkF0ry+Q5eGqnASm5IFPrP+LJBX0uEbPuKhO5iCG26oLnRUheDPcpir5dKOHuV9YeZP+YskqUhzAa51HWzs/b2xHRKmal4v2oEDPyRiT4bOiIamLOGZxISpA8qXcga1DiKecu8pf5Q+hGvBJ5x0yN8TvH0AMD+l6BgOYgiXPmxDb8IMzfrSyTSlhXOAhAe8geFsvfj5iKyQfwml4o/XB5iSdE7xplX8t3i0R3naILyML89RLO0aOn1U5+6zHZDUppAgyUDcXdTr6BNV+s7i4gMFlPTTvKUPnonXaOTP/nhRL2CDjfcBFImXPcddteJ0eX85/HnWfPaIkpih7hBBavvk3O2cbf4HDzlgwfjI07vgdCu6NpITWadh8Tk3ui/C0NwdFHJqWqXi4ge/NaEvL25wJTChB0fwjRHpG6PK/wqbN3b+WGibH96u3WbTldmYPAeWNYer17iDObGuj5+4b2ILyc4emwm9Mfa570JKWyCw1YZv866M8YNmS3YBBxa+21q0Tp/wQ1o5uSXFDm6luLqw0YwMY1A4UndXtWw4wY26bqK+m6PcPU2DHli1uS7mXzrHTQm+Jypt2d8SMxkRnQtOqncFDWzO7U7GsgbaBO+dergf4U2RudVBQmAF4Mlfr4CxySaaw9zYjGYhUslkcqeGuTdRdjT3LhJ0uOnATZv0ARCZWAmP3hHCBjqHfoX+z00+5fyVlspxn0i8xwUp9X4yJaKWEXz9NblTh2U0ellgnfcu/4CniI');
/*!40000 ALTER TABLE `pnbsessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbsettings`
--

DROP TABLE IF EXISTS `pnbsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbsettings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL DEFAULT '' COMMENT 'Unique identifier for the configuration parameter',
  `value` text COMMENT 'Value for the settings parameter',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_settings_key` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbsettings`
--

LOCK TABLES `pnbsettings` WRITE;
/*!40000 ALTER TABLE `pnbsettings` DISABLE KEYS */;
INSERT INTO `pnbsettings` VALUES (1,'site_name','panambi'),(2,'site_tagline','Juntas podemos mas'),(3,'site_banner_id',NULL),(4,'site_email','rafaelpalau@gmail.com'),(5,'site_key',NULL),(6,'site_language','es_AR'),(7,'site_style','unicorn'),(8,'site_timezone','0'),(9,'site_contact_page','1'),(10,'site_help_page','1'),(11,'site_message',''),(12,'site_copyright_statement',''),(13,'site_submit_report_message',''),(14,'allow_reports','1'),(15,'allow_comments','1'),(16,'allow_feed','1'),(17,'allow_stat_sharing','1'),(18,'allow_clustering','1'),(19,'cache_pages','0'),(20,'cache_pages_lifetime','1800'),(21,'private_deployment','0'),(22,'default_map','osm_mapnik'),(23,'default_map_all','CC0000'),(24,'default_map_all_icon_id',NULL),(25,'api_google',''),(26,'api_live','Apumcka0uPOF2lKLorq8aeo4nuqfVVeNRqJjqOcLMJ9iMCTsnMsNd9_OvpA8gR0i'),(27,'api_akismet',''),(28,'default_country','186'),(29,'multi_country','0'),(30,'default_city','nairobi'),(31,'default_lat','-25.097366972003282'),(32,'default_lon','-57.56209373986696'),(33,'default_zoom','6'),(34,'items_per_page','5'),(35,'items_per_page_admin','20'),(36,'sms_provider',''),(37,'sms_no1',NULL),(38,'sms_no2',NULL),(39,'sms_no3',NULL),(40,'google_analytics',''),(41,'twitter_hashtags',NULL),(42,'blocks','news_block|reports_block'),(43,'blocks_per_row','2'),(44,'date_modify','2014-10-18 02:40:24'),(45,'stat_id','66780'),(46,'stat_key','f239c52af4c5e89b363a3e7ae01ad3'),(47,'email_username','panambi@panambi.org'),(48,'email_password','panambi'),(49,'email_port','25'),(50,'email_host','mail.panambi.org'),(51,'email_servertype',NULL),(52,'email_ssl',NULL),(53,'ftp_server',NULL),(54,'ftp_user_name',NULL),(55,'alerts_email','alerta@panambi.org'),(57,'facebook_appid',NULL),(58,'facebook_appsecret',NULL),(59,'db_version','119'),(60,'ushahidi_version','2.7.4'),(61,'allow_alerts','1'),(62,'require_email_confirmation','0'),(63,'manually_approve_users','0'),(64,'enable_timeline','1'),(65,'feed_geolocation_user',''),(66,'allow_feed_category','0'),(67,'max_upload_size','10'),(68,'forgot_password_secret','Y.Xm?vq5A],i:VQCc[3jDIn0TJex31M(37:`NydU@o;Sbi5N7E&,!}(6nqLMt}H`'),(69,'scheduler_lock','0'),(70,'timeline_graph','line'),(71,'timeline_point_label','0');
/*!40000 ALTER TABLE `pnbsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbuser_tokens`
--

DROP TABLE IF EXISTS `pnbuser_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbuser_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `user_agent` varchar(40) NOT NULL,
  `token` varchar(64) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_token` (`token`),
  KEY `fk_user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Stores browser tokens assigned to users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbuser_tokens`
--

LOCK TABLES `pnbuser_tokens` WRITE;
/*!40000 ALTER TABLE `pnbuser_tokens` DISABLE KEYS */;
INSERT INTO `pnbuser_tokens` VALUES (1,1,'d647834a5aa9838e116b58014c761d66aa130cdf','xt3M2ZACpxpBJDhQZ15xmtOgyZbORil0',1413599863,1414809463),(2,1,'d647834a5aa9838e116b58014c761d66aa130cdf','zTRzuBbRd9Te0PtQtRBxiD24wMSq2IOY',1413599910,1414809510),(3,1,'d647834a5aa9838e116b58014c761d66aa130cdf','ctRG5GcdskSqPrh8oA1yPFMNF7wSMd13',1413602066,1414811666);
/*!40000 ALTER TABLE `pnbuser_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbusers`
--

DROP TABLE IF EXISTS `pnbusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbusers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `riverid` varchar(128) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(127) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` char(50) NOT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` int(10) unsigned DEFAULT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Flag incase admin opts in for email notifications',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `color` varchar(6) NOT NULL DEFAULT 'FF0000',
  `code` varchar(30) DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `public_profile` tinyint(1) NOT NULL DEFAULT '1',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `needinfo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores registered usersâ€™ information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbusers`
--

LOCK TABLES `pnbusers` WRITE;
/*!40000 ALTER TABLE `pnbusers` DISABLE KEYS */;
INSERT INTO `pnbusers` VALUES (1,'','Administrator','rafaelpalau@gmail.com','admin','11019cd4f425455b0b3676bd3e57c5a754ec2ca82f9c9c0dda',4,1413602066,0,'2014-10-18 03:14:26','FF0000',NULL,1,0,1,0);
/*!40000 ALTER TABLE `pnbusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnbverified`
--

DROP TABLE IF EXISTS `pnbverified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pnbverified` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `verified_date` datetime DEFAULT NULL,
  `verified_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores all verified reports';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnbverified`
--

LOCK TABLES `pnbverified` WRITE;
/*!40000 ALTER TABLE `pnbverified` DISABLE KEYS */;
INSERT INTO `pnbverified` VALUES (1,1,1,'2014-10-18 02:46:39',1);
/*!40000 ALTER TABLE `pnbverified` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'panambi'
--

--
-- Dumping routines for database 'panambi'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-18 10:25:07
