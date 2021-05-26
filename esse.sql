-- MySQL dump 10.19  Distrib 10.3.28-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: magento
-- ------------------------------------------------------
-- Server version	10.3.28-MariaDB-1:10.3.28+maria~focal

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
-- Table structure for table `inventory_geoname`
--

DROP TABLE IF EXISTS `inventory_geoname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_geoname` (
  `country_code` varchar(64) NOT NULL,
  `postcode` varchar(64) NOT NULL,
  `city` varchar(180) NOT NULL,
  `region` varchar(100) NOT NULL,
  `province` varchar(64) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_geoname`
--

LOCK TABLES `inventory_geoname` WRITE;
/*!40000 ALTER TABLE `inventory_geoname` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_geoname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_low_stock_notification_configuration`
--

DROP TABLE IF EXISTS `inventory_low_stock_notification_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_low_stock_notification_configuration` (
  `source_code` varchar(255) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `notify_stock_qty` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`source_code`,`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_low_stock_notification_configuration`
--

LOCK TABLES `inventory_low_stock_notification_configuration` WRITE;
/*!40000 ALTER TABLE `inventory_low_stock_notification_configuration` DISABLE KEYS */;
INSERT INTO `inventory_low_stock_notification_configuration` VALUES ('0001','produto-exemplo',NULL),('0001','teste-001',NULL),('default','produto-exemplo',NULL),('default','teste-001',NULL);
/*!40000 ALTER TABLE `inventory_low_stock_notification_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_order_notification`
--

DROP TABLE IF EXISTS `inventory_order_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_order_notification` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Order ID',
  `notification_sent` smallint(6) NOT NULL COMMENT 'Has Notification Been Sent For Order',
  `send_notification` smallint(6) NOT NULL COMMENT 'Should Notification Be Send For Order',
  PRIMARY KEY (`order_id`),
  CONSTRAINT `INVENTORY_ORDER_NOTIFICATION_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_order_notification`
--

LOCK TABLES `inventory_order_notification` WRITE;
/*!40000 ALTER TABLE `inventory_order_notification` DISABLE KEYS */;
INSERT INTO `inventory_order_notification` VALUES (1,1,1);
/*!40000 ALTER TABLE `inventory_order_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_pickup_location_order`
--

DROP TABLE IF EXISTS `inventory_pickup_location_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_pickup_location_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Order ID',
  `pickup_location_code` varchar(255) NOT NULL COMMENT 'Pickup Location Code',
  PRIMARY KEY (`order_id`),
  CONSTRAINT `INVENTORY_PICKUP_LOCATION_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_pickup_location_order`
--

LOCK TABLES `inventory_pickup_location_order` WRITE;
/*!40000 ALTER TABLE `inventory_pickup_location_order` DISABLE KEYS */;
INSERT INTO `inventory_pickup_location_order` VALUES (1,'0001');
/*!40000 ALTER TABLE `inventory_pickup_location_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_pickup_location_quote_address`
--

DROP TABLE IF EXISTS `inventory_pickup_location_quote_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_pickup_location_quote_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Quote Address ID',
  `pickup_location_code` varchar(255) NOT NULL COMMENT 'Pickup Location Code',
  PRIMARY KEY (`address_id`),
  CONSTRAINT `INV_PICKUP_LOCATION_QUOTE_ADDR_ADDR_ID_QUOTE_ADDR_ADDR_ID` FOREIGN KEY (`address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_pickup_location_quote_address`
--

LOCK TABLES `inventory_pickup_location_quote_address` WRITE;
/*!40000 ALTER TABLE `inventory_pickup_location_quote_address` DISABLE KEYS */;
INSERT INTO `inventory_pickup_location_quote_address` VALUES (4,'0001'),(7,'0001');
/*!40000 ALTER TABLE `inventory_pickup_location_quote_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_reservation`
--

DROP TABLE IF EXISTS `inventory_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_reservation` (
  `reservation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stock_id` int(10) unsigned NOT NULL,
  `sku` varchar(64) NOT NULL,
  `quantity` decimal(10,4) NOT NULL DEFAULT 0.0000,
  `metadata` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `INVENTORY_RESERVATION_STOCK_ID_SKU_QUANTITY` (`stock_id`,`sku`,`quantity`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_reservation`
--

LOCK TABLES `inventory_reservation` WRITE;
/*!40000 ALTER TABLE `inventory_reservation` DISABLE KEYS */;
INSERT INTO `inventory_reservation` VALUES (1,2,'produto-exemplo',-1.0000,'{\"event_type\":\"order_placed\",\"object_type\":\"order\",\"object_id\":\"\",\"object_increment_id\":\"000000001\"}'),(2,2,'produto-exemplo',1.0000,'{\"event_type\":\"shipment_created\",\"object_type\":\"order\",\"object_id\":\"1\",\"object_increment_id\":\"000000001\"}');
/*!40000 ALTER TABLE `inventory_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_shipment_source`
--

DROP TABLE IF EXISTS `inventory_shipment_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_shipment_source` (
  `shipment_id` int(10) unsigned NOT NULL,
  `source_code` varchar(255) NOT NULL,
  PRIMARY KEY (`shipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_shipment_source`
--

LOCK TABLES `inventory_shipment_source` WRITE;
/*!40000 ALTER TABLE `inventory_shipment_source` DISABLE KEYS */;
INSERT INTO `inventory_shipment_source` VALUES (1,'0001');
/*!40000 ALTER TABLE `inventory_shipment_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_source`
--

DROP TABLE IF EXISTS `inventory_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_source` (
  `source_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `enabled` smallint(5) unsigned NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `latitude` decimal(8,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `country_id` varchar(2) NOT NULL,
  `region_id` int(10) unsigned DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) NOT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `use_default_carrier_config` smallint(5) unsigned NOT NULL DEFAULT 1,
  `is_pickup_location_active` tinyint(1) NOT NULL DEFAULT 0,
  `frontend_name` varchar(255) DEFAULT '',
  `frontend_description` text DEFAULT NULL,
  PRIMARY KEY (`source_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_source`
--

LOCK TABLES `inventory_source` WRITE;
/*!40000 ALTER TABLE `inventory_source` DISABLE KEYS */;
INSERT INTO `inventory_source` VALUES ('0001','Retirada Na Loja',1,NULL,-23.548900,-46.638800,'BR',508,'São Paulo','São Paulo','Parque Anhangabaú, 30','01007-040','ACN ORGANIC FOOD - Parque Anhangabaú','gaqp@cin.ufpe.br','81997399333',NULL,1,1,'ACN ORGANIC FOOD - Parque Anhangabaú',NULL),('default','Default Source',1,'Default Source',0.000000,0.000000,'US',NULL,NULL,NULL,NULL,'00000',NULL,NULL,NULL,NULL,1,0,'Default Source',NULL);
/*!40000 ALTER TABLE `inventory_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_source_carrier_link`
--

DROP TABLE IF EXISTS `inventory_source_carrier_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_source_carrier_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_code` varchar(255) NOT NULL,
  `carrier_code` varchar(255) NOT NULL,
  `position` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`link_id`),
  KEY `INV_SOURCE_CARRIER_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` (`source_code`),
  CONSTRAINT `INV_SOURCE_CARRIER_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` FOREIGN KEY (`source_code`) REFERENCES `inventory_source` (`source_code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_source_carrier_link`
--

LOCK TABLES `inventory_source_carrier_link` WRITE;
/*!40000 ALTER TABLE `inventory_source_carrier_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_source_carrier_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_source_stock_link`
--

DROP TABLE IF EXISTS `inventory_source_stock_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_source_stock_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stock_id` int(10) unsigned NOT NULL,
  `source_code` varchar(255) NOT NULL,
  `priority` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_SOURCE_CODE` (`stock_id`,`source_code`),
  KEY `INV_SOURCE_STOCK_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` (`source_code`),
  KEY `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_PRIORITY` (`stock_id`,`priority`),
  CONSTRAINT `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_INVENTORY_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `inventory_stock` (`stock_id`) ON DELETE CASCADE,
  CONSTRAINT `INV_SOURCE_STOCK_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` FOREIGN KEY (`source_code`) REFERENCES `inventory_source` (`source_code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_source_stock_link`
--

LOCK TABLES `inventory_source_stock_link` WRITE;
/*!40000 ALTER TABLE `inventory_source_stock_link` DISABLE KEYS */;
INSERT INTO `inventory_source_stock_link` VALUES (1,1,'default',1),(2,2,'0001',2);
/*!40000 ALTER TABLE `inventory_source_stock_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_stock`
--

DROP TABLE IF EXISTS `inventory_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_stock` (
  `stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_stock`
--

LOCK TABLES `inventory_stock` WRITE;
/*!40000 ALTER TABLE `inventory_stock` DISABLE KEYS */;
INSERT INTO `inventory_stock` VALUES (1,'Default Stock'),(2,'Estoque Retirada Na Loja');
/*!40000 ALTER TABLE `inventory_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `inventory_stock_1`
--

DROP TABLE IF EXISTS `inventory_stock_1`;
/*!50001 DROP VIEW IF EXISTS `inventory_stock_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `inventory_stock_1` (
  `product_id` tinyint NOT NULL,
  `website_id` tinyint NOT NULL,
  `stock_id` tinyint NOT NULL,
  `quantity` tinyint NOT NULL,
  `is_salable` tinyint NOT NULL,
  `sku` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `inventory_stock_sales_channel`
--

DROP TABLE IF EXISTS `inventory_stock_sales_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_stock_sales_channel` (
  `type` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `stock_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`type`,`code`),
  KEY `INVENTORY_STOCK_SALES_CHANNEL_STOCK_ID_INVENTORY_STOCK_STOCK_ID` (`stock_id`),
  CONSTRAINT `INVENTORY_STOCK_SALES_CHANNEL_STOCK_ID_INVENTORY_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `inventory_stock` (`stock_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_stock_sales_channel`
--

LOCK TABLES `inventory_stock_sales_channel` WRITE;
/*!40000 ALTER TABLE `inventory_stock_sales_channel` DISABLE KEYS */;
INSERT INTO `inventory_stock_sales_channel` VALUES ('website','base',2);
/*!40000 ALTER TABLE `inventory_stock_sales_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_config_data`
--

DROP TABLE IF EXISTS `core_config_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_config_data` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Config ID',
  `scope` varchar(8) NOT NULL DEFAULT 'default' COMMENT 'Config Scope',
  `scope_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Config Scope ID',
  `path` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Config Path',
  `value` text DEFAULT NULL COMMENT 'Config Value',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Updated At',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB AUTO_INCREMENT=355 DEFAULT CHARSET=utf8 COMMENT='Config Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_config_data`
--

LOCK TABLES `core_config_data` WRITE;
/*!40000 ALTER TABLE `core_config_data` DISABLE KEYS */;
INSERT INTO `core_config_data` VALUES (1,'default',0,'yotpo/module_info/yotpo_installation_date','2021-05-16','2021-05-16 19:50:11'),(2,'default',0,'yotpo/sync_settings/orders_sync_start_date','2021-05-16','2021-05-16 19:50:11'),(3,'default',0,'catalog/search/engine','elasticsearch7','2021-05-16 19:50:13'),(4,'default',0,'catalog/search/elasticsearch7_server_hostname','elasticsearch','2021-05-16 19:50:13'),(5,'default',0,'catalog/search/elasticsearch7_server_port','9200','2021-05-16 19:50:13'),(6,'default',0,'catalog/search/elasticsearch7_enable_auth','0','2021-05-16 19:50:13'),(7,'default',0,'catalog/search/elasticsearch7_index_prefix','magento2','2021-05-16 19:50:13'),(8,'default',0,'catalog/search/elasticsearch7_server_timeout','15','2021-05-16 19:50:13'),(9,'default',0,'general/region/display_all','1','2021-05-16 19:50:13'),(10,'default',0,'general/region/state_required','BR','2021-05-24 01:20:46'),(11,'default',0,'catalog/category/root_id','2','2021-05-16 19:50:16'),(12,'default',0,'analytics/subscription/enabled','1','2021-05-16 19:50:19'),(13,'default',0,'crontab/default/jobs/analytics_subscribe/schedule/cron_expr','0 * * * *','2021-05-16 19:50:19'),(14,'default',0,'crontab/default/jobs/analytics_collect_data/schedule/cron_expr','00 02 * * *','2021-05-16 19:50:19'),(15,'default',0,'msp_securitysuite_recaptcha/frontend/enabled','0','2021-05-16 19:50:20'),(16,'default',0,'msp_securitysuite_recaptcha/backend/enabled','0','2021-05-16 19:50:20'),(17,'default',0,'twofactorauth/duo/application_key','l3HttWXss5xTqyWAoybGWh4ak2Lm2zEUphlyxa3cwfkL0SdLBHMqZA1r2YUUwXwE','2021-05-16 19:50:20'),(18,'website',0,'connector_configuration/transactional_data/order_statuses','canceled,closed,complete,fraud,holded,payment_review,paypal_canceled_reversal,paypal_reversed,pending,pending_payment,pending_paypal,processing','2021-05-16 19:50:20'),(19,'website',0,'connector_configuration/catalog_sync/catalog_type','simple,virtual,bundle,downloadable,grouped,configurable','2021-05-16 19:50:20'),(20,'website',0,'connector_configuration/catalog_sync/catalog_visibility','1,2,3,4','2021-05-16 19:50:20'),(21,'default',0,'connector_dynamic_content/external_dynamic_content_urls/passcode','hjXhDbX423TMdfB3AE5KJxZnPCb0aqqs','2021-05-16 19:50:20'),(22,'default',0,'connector_automation/review_settings/allow_non_subscribers','1','2021-05-16 19:50:20'),(23,'default',0,'connector_configuration/abandoned_carts/allow_non_subscribers','1','2021-05-16 19:50:20'),(24,'default',0,'sync_settings/addressbook/allow_non_subscribers','1','2021-05-16 19:50:20'),(25,'default',0,'connector_developer_settings/system_alerts/user_roles','1','2021-05-16 19:50:20'),(26,'default',0,'admin/usage/enabled','1','2021-05-16 20:09:02'),(27,'default',0,'general/country/default','BR','2021-05-16 20:14:34'),(28,'default',0,'general/country/destinations',NULL,'2021-05-16 20:14:34'),(29,'default',0,'general/locale/timezone','America/Sao_Paulo','2021-05-16 20:14:34'),(30,'default',0,'general/locale/code','pt_BR','2021-05-16 20:14:34'),(31,'default',0,'general/locale/weight_unit','kgs','2021-05-16 20:14:34'),(32,'default',0,'general/store_information/name',NULL,'2021-05-16 20:14:34'),(33,'default',0,'general/store_information/phone',NULL,'2021-05-16 20:14:34'),(34,'default',0,'general/store_information/hours',NULL,'2021-05-16 20:14:34'),(35,'default',0,'general/store_information/country_id','BR','2021-05-16 20:14:34'),(36,'default',0,'general/store_information/region_id','508','2021-05-16 20:14:34'),(37,'default',0,'general/store_information/postcode',NULL,'2021-05-16 20:14:34'),(38,'default',0,'general/store_information/city',NULL,'2021-05-16 20:14:34'),(39,'default',0,'general/store_information/street_line1',NULL,'2021-05-16 20:14:34'),(40,'default',0,'general/store_information/street_line2',NULL,'2021-05-16 20:14:34'),(41,'default',0,'general/store_information/merchant_vat_number',NULL,'2021-05-16 20:14:34'),(42,'default',0,'general/single_store_mode/enabled','0','2021-05-16 20:14:34'),(45,'default',0,'currency/options/base','BRL','2021-05-16 20:16:08'),(46,'default',0,'currency/fixerio/api_key',NULL,'2021-05-16 20:16:08'),(47,'default',0,'currency/fixerio/timeout','100','2021-05-16 20:16:08'),(48,'default',0,'currency/currencyconverterapi/api_key',NULL,'2021-05-16 20:16:08'),(49,'default',0,'currency/currencyconverterapi/timeout','100','2021-05-16 20:16:08'),(50,'default',0,'payment/amazon_payments/simplepath/publickey','-----BEGIN PUBLIC KEY-----\r\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuZRR570ONx/EF5KeV+co\r\n3mBG4kN/yGBshl4RMRrExyK4SzZuxmXW5lVGTzlIQaSwXLkHXzu3RvamOfWGGMpm\r\n17hmm1mYuimxZ6Ysc6cbi7gnfXr6YY4vciF1u77ForMy5gKOTGSKBu3TDGdu1RVz\r\nOqvVTA/GfqMD4tQdyeE51bAMH7mmTHulg/XABWHVoCaDZ7mNK0I/rIsu3OVApcaG\r\nBnACqxuSbg31tfAh3kWExDlw51FzPerY1qxCKNIuvui6cYdzwaNPyPQ+q3JXjKMQ\r\nqBNAnv/t/ob/VJPB2IVGwE3EGfL1xpE3/zR3jvvrjZlpz/p/ywMe/HPvFqloTvi7\r\nWwIDAQAB\r\n-----END PUBLIC KEY-----','2021-05-23 00:49:55'),(51,'default',0,'payment/amazon_payments/simplepath/privatekey','0:3:opG8EVrnDIoLr2AVjbSeRZ2H0ynkpM/UUyqUx/48MMm39v3eKz+DiL6mp2ieCI++OBzAvcIy7yU59MTcrTAea8fadnmM6EEOuMvaYaADjJ/+klfa2boKq2qurpmpyQl5Ib/yF541pa7bXM3ADFRj46y8UE+MChpHayHrKPu0vADSQAxZ8OoMUA+pgw/tWlVRFoO93tZZ1EoNQ3hT8Umudb/sO1AKSShigDF5VXOu9EltMZVntWLRrp1ETsesNGDAbU82EOLmIrk4JrVwFxIW/w7UvqTfVC7NRvr3c6ls9Fq3NW6nS2sr0DEvtj67oRSxaWJQ8oai5Z/xk28JGUevvRd4MGmE3suxpWIsh+o8NFuuCQt0Ws0tb5Mp4EybCY7VjxRMzcaz8Hs4MEBnwJvb2mh7aJ+Mge9iFaaIghkUUHuwn2p/+x0yIKDlA4j41kVECdS1tauTTOUBvOljk4fT1n15W1b0JgWGXTIYgnHSroo7Hom7FseTBbtNKlOpI773D13TmmV+5njoiTFlTu5zQ7GkIjuqspk1WO+oxI820aAcJfT5CAlkamtBXL9MU6rqsIre/iVFo1x8YgIyUjcSwlr2afzAUIeYot3F/F3b3cbr+q9PGhqo44CKO1YmhNWIwVTtTOZ7rjcMBkuva5+No21pbVCL8h83KCKNI/JhDlvjkqCpdQRz4YN/773YGhx9SQdwee2g7ftekM3E5lKIV+ShD7Uc/nDk6FVIj+XYpRdcCWvKGwc2atsjafHB+1jn4sQU93ew1uB4yDqbwGKfyeSqGuEDn9FGUg6aST+WG4LXQAaOahJT3uGTMyJINV4Tu2RJf7j2ERGIcRvBMVQoBFUv1/nXPNJY0o2eWI8Smg14KjXXA+1WuFjEFSS/aN73H0oUZ2Jm4aRT4WeeXH1HwQoAYQVhsfJ/6pX2SguNGUsn9kjLbOJYU7JA8Ttt3cgi9miytKqkaM+qlOtF3BfNR1EeOCKXZ2LnGWhqM7EiLMNaO/AT6ecjXscCiQzsV51VdOKxOMEgz6ujPA/3TFKuSDbbznvN9AAYWsQbJCEfT7tDFERq0FYi+ak4qGIdrvXlFt3NdJVpnDQO5P4JctzuYOELWldyBZ6uHmAHSWQJsCN5K2Sh32Wlk0zHmH+z3Dy8sWuz2ro2cGh/wC2MUQTmeF38/Nr5nzRZ2SojRxahqEb3dgMrc/bU3XFXSLDW9LfqD1PVhh/fH9QhIdRlDoc91e3nAJT5Auq9v3G4/tIJFgUPr9v1lDSIiwhL0RSeun5Rl9D5yD5T4tj/I6tYPvGjUlgDFye6NT+1surckJGyUp+r1Wgv8FNdUEjxCr6w2U8Zvl1BgUhN2qaN2OZd/TLYvJMd7siE30OGZfNVisa4DKvpqgdXr7RxnWiieXCyssVt0f1PSQJ8VuMKxK46JwlJMTHPvtnHOn3x/TGMV+4pCFF19naCIRkVWfDvK7T9nXPxDiJ8r0ysAZnFPXMKP5HSc/JWqN9ahRPC1DJPdApR/E8oqbqqaLCB1aQk5yqw7cbdG3+8DpjJtl8iJHCuhDVSvIK+R2jGKZq1ArjRuUMWNwG8hcwRM8ayeoACyjXhRzyGhYIXC5CT8HR0a4RaGdWSaTaxXZtj/Fmg5JouYu6nJbbt+4wuy11fCvUxHvu5aB8tupm4F0tbTSkWkIICCsrnNPCPC9U0l7MY88NFilMjT9o2jNJiXLDDRD6Egz472n7CG5VBRdOqMvXETUulb5L5WBCIrV9A8F+t4TwkYYyd93P0ulw+bICwsIUdYbCeWEKv7PYM7voHv1Aq8a8t+7EhaDqqY3WaJ7lzIXc2mVV4VQI2aMxahv5rktvPzTJnBAFLMzdUHWQzM4/7yVzbpR/4dI8NXlvWiE2zm/qyCD9KIhPOscEVz9Exb5yFYwmSFtrA6H2XBB17THjbMwoS3JCxkgX6wz1OOP2nRaL04FiP0wfYb4AfAiAofdK1JAOJ9LPF1WijT0g7kbrvsbe33AR8qaoxEfr0xuoERxi89mZSnPISsNHl6U7bAulo99cKkY++BSmc2rSr/M7EX3wm14Gb8dAIo6yQddLF66Modr4p1FfbNdmeNq4GAYw8rYl1FHwVSP05yZC5M0gUHzc5y5wnnw8LmBC91VkCLROahohbPnfiYcCXtFsTuMEKtoQWuoZAzAXMVlKVpmxzSSxSrwBVpbDW6bVQvlZgjFg/VozQd/atSeEobLwffBrVpN8YtS08/8apdeVP1NxlGm5FwnP5xCw4BLAkrUTZ2QuzcZn6fFo/dsAhqiC+xikS/JdOp6skzoScbQ==','2021-05-23 00:49:55'),(52,'default',0,'paypal/general/merchant_country',NULL,'2021-05-23 00:54:48'),(53,'default',0,'payment/paypal_express/active','0','2021-05-23 00:54:49'),(54,'default',0,'payment/paypal_express/in_context','0','2021-05-23 00:54:49'),(55,'default',0,'paypal/general/business_account',NULL,'2021-05-23 00:54:49'),(56,'default',0,'paypal/wpp/api_authentication','0','2021-05-23 00:54:49'),(57,'default',0,'paypal/wpp/api_username',NULL,'2021-05-23 00:54:49'),(58,'default',0,'paypal/wpp/api_password',NULL,'2021-05-23 00:54:49'),(59,'default',0,'paypal/wpp/api_signature',NULL,'2021-05-23 00:54:49'),(60,'default',0,'paypal/wpp/sandbox_flag','0','2021-05-23 00:54:49'),(61,'default',0,'paypal/wpp/use_proxy','0','2021-05-23 00:54:49'),(62,'default',0,'payment/paypal_express/title','PayPal Express Checkout','2021-05-23 00:54:49'),(63,'default',0,'payment/paypal_express/sort_order',NULL,'2021-05-23 00:54:49'),(64,'default',0,'payment/paypal_express/payment_action','Authorization','2021-05-23 00:54:49'),(65,'default',0,'payment/paypal_express/visible_on_product','1','2021-05-23 00:54:49'),(66,'default',0,'payment/paypal_express/visible_on_cart','1','2021-05-23 00:54:49'),(67,'default',0,'payment/paypal_express/allowspecific','0','2021-05-23 00:54:49'),(68,'default',0,'payment/paypal_express/debug','0','2021-05-23 00:54:49'),(69,'default',0,'payment/paypal_express/verify_peer','1','2021-05-23 00:54:49'),(70,'default',0,'payment/paypal_express/line_items_enabled','1','2021-05-23 00:54:49'),(71,'default',0,'payment/paypal_express/transfer_shipping_options','0','2021-05-23 00:54:49'),(72,'default',0,'paypal/wpp/button_flavor','dynamic','2021-05-23 00:54:49'),(73,'default',0,'payment/paypal_express/solution_type','Mark','2021-05-23 00:54:49'),(74,'default',0,'payment/paypal_express/require_billing_address','0','2021-05-23 00:54:49'),(75,'default',0,'payment/paypal_express/allow_ba_signup','never','2021-05-23 00:54:49'),(76,'default',0,'payment/paypal_express/skip_order_review_step','1','2021-05-23 00:54:49'),(77,'default',0,'payment/paypal_billing_agreement/active','1','2021-05-23 00:54:49'),(78,'default',0,'payment/paypal_billing_agreement/title','PayPal Billing Agreement','2021-05-23 00:54:49'),(79,'default',0,'payment/paypal_billing_agreement/sort_order',NULL,'2021-05-23 00:54:49'),(80,'default',0,'payment/paypal_billing_agreement/payment_action','Authorization','2021-05-23 00:54:49'),(81,'default',0,'payment/paypal_billing_agreement/allowspecific','0','2021-05-23 00:54:49'),(82,'default',0,'payment/paypal_billing_agreement/debug','0','2021-05-23 00:54:49'),(83,'default',0,'payment/paypal_billing_agreement/verify_peer','1','2021-05-23 00:54:49'),(84,'default',0,'payment/paypal_billing_agreement/line_items_enabled','0','2021-05-23 00:54:49'),(85,'default',0,'payment/paypal_billing_agreement/allow_billing_agreement_wizard','1','2021-05-23 00:54:49'),(86,'default',0,'paypal/fetch_reports/ftp_login',NULL,'2021-05-23 00:54:49'),(87,'default',0,'paypal/fetch_reports/ftp_password',NULL,'2021-05-23 00:54:49'),(88,'default',0,'paypal/fetch_reports/ftp_sandbox','0','2021-05-23 00:54:49'),(89,'default',0,'paypal/fetch_reports/ftp_ip',NULL,'2021-05-23 00:54:49'),(90,'default',0,'paypal/fetch_reports/ftp_path',NULL,'2021-05-23 00:54:49'),(91,'default',0,'paypal/fetch_reports/active','0','2021-05-23 00:54:49'),(92,'default',0,'paypal/fetch_reports/schedule','1','2021-05-23 00:54:49'),(93,'default',0,'paypal/fetch_reports/time','00,00,00','2021-05-23 00:54:49'),(94,'default',0,'paypal/style/logo',NULL,'2021-05-23 00:54:49'),(95,'default',0,'paypal/style/page_style',NULL,'2021-05-23 00:54:49'),(96,'default',0,'paypal/style/paypal_hdrimg',NULL,'2021-05-23 00:54:49'),(97,'default',0,'paypal/style/paypal_hdrbackcolor',NULL,'2021-05-23 00:54:49'),(98,'default',0,'paypal/style/paypal_hdrbordercolor',NULL,'2021-05-23 00:54:50'),(99,'default',0,'paypal/style/paypal_payflowcolor',NULL,'2021-05-23 00:54:50'),(100,'default',0,'paypal/style/checkout_page_button_customize','0','2021-05-23 00:54:50'),(101,'default',0,'paypal/style/product_page_button_customize','0','2021-05-23 00:54:50'),(102,'default',0,'paypal/style/cart_page_button_customize','0','2021-05-23 00:54:50'),(103,'default',0,'paypal/style/mini_cart_page_button_customize','0','2021-05-23 00:54:50'),(104,'default',0,'paypal/style/disable_funding_options',NULL,'2021-05-23 00:54:50'),(105,'default',0,'payment/braintree/active','0','2021-05-23 00:54:50'),(106,'default',0,'payment/braintree_paypal/active','0','2021-05-23 00:54:50'),(107,'default',0,'payment/braintree_paypal_paylater/active','0','2021-05-23 00:54:50'),(108,'default',0,'payment/braintree_cc_vault/active','0','2021-05-23 00:54:50'),(109,'default',0,'payment/braintree/title','Credit Card','2021-05-23 00:54:50'),(110,'default',0,'payment/braintree/environment','sandbox','2021-05-23 00:54:50'),(111,'default',0,'payment/braintree/payment_action','authorize','2021-05-23 00:54:50'),(112,'default',0,'payment/braintree/sandbox_merchant_id',NULL,'2021-05-23 00:54:50'),(113,'default',0,'payment/braintree/sandbox_public_key',NULL,'2021-05-23 00:54:50'),(114,'default',0,'payment/braintree/sandbox_private_key',NULL,'2021-05-23 00:54:50'),(115,'default',0,'payment/braintree_cc_vault/title','Stored Cards','2021-05-23 00:54:50'),(116,'default',0,'payment/braintree/merchant_account_id',NULL,'2021-05-23 00:54:50'),(117,'default',0,'payment/braintree/fraudprotection','0','2021-05-23 00:54:50'),(118,'default',0,'payment/braintree/fraudprotection_threshold',NULL,'2021-05-23 00:54:50'),(119,'default',0,'payment/braintree/debug','0','2021-05-23 00:54:50'),(120,'default',0,'payment/braintree/useccv','1','2021-05-23 00:54:50'),(121,'default',0,'payment/braintree/cctypes','AE,VI,MC,DI,JCB,DN,MI','2021-05-23 00:54:50'),(122,'default',0,'payment/braintree/sort_order',NULL,'2021-05-23 00:54:50'),(123,'default',0,'payment/braintree/allowspecific','0','2021-05-23 00:54:50'),(124,'default',0,'payment/braintree/specificcountry',NULL,'2021-05-23 00:54:50'),(125,'default',0,'payment/braintree/countrycreditcard','[]','2021-05-23 00:54:50'),(126,'default',0,'payment/braintree_ach_direct_debit/active','0','2021-05-23 00:54:50'),(127,'default',0,'payment/braintree_applepay/active','0','2021-05-23 00:54:50'),(128,'default',0,'payment/braintree_applepay/payment_action','authorize','2021-05-23 00:54:50'),(129,'default',0,'payment/braintree_applepay/merchant_name','Store','2021-05-23 00:54:50'),(130,'default',0,'payment/braintree_local_payment/active','0','2021-05-23 00:54:50'),(131,'default',0,'payment/braintree_googlepay/active','0','2021-05-23 00:54:50'),(132,'default',0,'payment/braintree_googlepay/payment_action','authorize','2021-05-23 00:54:50'),(133,'default',0,'payment/braintree_googlepay/btn_color','0','2021-05-23 00:54:50'),(134,'default',0,'payment/braintree_googlepay/merchant_id','testmode','2021-05-23 00:54:50'),(135,'default',0,'payment/braintree_googlepay/cctypes','VISA,MASTERCARD,AMEX','2021-05-23 00:54:50'),(136,'default',0,'payment/braintree_venmo/active','0','2021-05-23 00:54:50'),(137,'default',0,'payment/braintree_paypal/title','PayPal','2021-05-23 00:54:50'),(138,'default',0,'payment/braintree_paypal_vault/active','0','2021-05-23 00:54:50'),(139,'default',0,'payment/braintree_paypal/sort_order','2','2021-05-23 00:54:50'),(140,'default',0,'payment/braintree_paypal/merchant_name_override',NULL,'2021-05-23 00:54:50'),(141,'default',0,'payment/braintree_paypal/payment_action','authorize','2021-05-23 00:54:50'),(142,'default',0,'payment/braintree_paypal/allowspecific','0','2021-05-23 00:54:50'),(143,'default',0,'payment/braintree_paypal/specificcountry',NULL,'2021-05-23 00:54:50'),(144,'default',0,'payment/braintree_paypal/require_billing_address','0','2021-05-23 00:54:50'),(145,'default',0,'payment/braintree_paypal/debug','0','2021-05-23 00:54:50'),(146,'default',0,'payment/braintree_paypal/display_on_shopping_cart','1','2021-05-23 00:54:50'),(147,'default',0,'payment/braintree_paypal/button_paylater_cart_enable','0','2021-05-23 00:54:50'),(148,'default',0,'payment/braintree_paypal/message_cart_enable','0','2021-05-23 00:54:50'),(149,'default',0,'payment/braintree_paypal/disabled_funding_cart',NULL,'2021-05-23 00:54:50'),(150,'default',0,'payment/braintree_paypal/button_customise_cart','0','2021-05-23 00:54:50'),(151,'default',0,'payment/braintree_paypal/button_paylater_checkout_enable','1','2021-05-23 00:54:50'),(152,'default',0,'payment/braintree_paypal/message_checkout_enable','1','2021-05-23 00:54:50'),(153,'default',0,'payment/braintree_paypal/disabled_funding_checkout',NULL,'2021-05-23 00:54:50'),(154,'default',0,'payment/braintree_paypal/button_customise_checkout','0','2021-05-23 00:54:50'),(155,'default',0,'payment/braintree_paypal/button_productpage_enabled','0','2021-05-23 00:54:50'),(156,'default',0,'payment/braintree_paypal/button_paylater_productpage_enable','1','2021-05-23 00:54:50'),(157,'default',0,'payment/braintree_paypal/message_productpage_enable','1','2021-05-23 00:54:50'),(158,'default',0,'payment/braintree_paypal/disabled_funding_productpage',NULL,'2021-05-23 00:54:50'),(159,'default',0,'payment/braintree_paypal/button_customise_productpage','0','2021-05-23 00:54:50'),(160,'default',0,'payment/braintree/verify_3dsecure','0','2021-05-23 00:54:50'),(161,'default',0,'payment/braintree/threshold_amount',NULL,'2021-05-23 00:54:50'),(162,'default',0,'payment/braintree/verify_all_countries','0','2021-05-23 00:54:50'),(163,'default',0,'payment/braintree/verify_specific_countries',NULL,'2021-05-23 00:54:50'),(164,'default',0,'payment/braintree/descriptor_name',NULL,'2021-05-23 00:54:50'),(165,'default',0,'payment/braintree/descriptor_phone',NULL,'2021-05-23 00:54:50'),(166,'default',0,'payment/braintree/descriptor_url',NULL,'2021-05-23 00:54:50'),(167,'default',0,'payment/wps_express/active','0','2021-05-23 00:54:50'),(168,'default',0,'klarna/api/api_version','kp_eu','2021-05-23 00:54:50'),(169,'default',0,'klarna/api/merchant_id',NULL,'2021-05-23 00:54:50'),(170,'default',0,'klarna/api/shared_secret',NULL,'2021-05-23 00:54:50'),(171,'default',0,'klarna/api/test_mode','1','2021-05-23 00:54:50'),(172,'default',0,'klarna/api/debug','1','2021-05-23 00:54:50'),(173,'default',0,'payment/klarna_kp/active','0','2021-05-23 00:54:50'),(174,'default',0,'payment/klarna_kp/allowspecific','0','2021-05-23 00:54:50'),(175,'default',0,'payment/klarna_kp/enable_b2b','0','2021-05-23 00:54:50'),(176,'default',0,'payment/klarna_kp/data_sharing','1','2021-05-23 00:54:50'),(177,'default',0,'payment/klarna_kp/data_sharing_onload','1','2021-05-23 00:54:50'),(178,'default',0,'payment/klarna_kp/sort_order',NULL,'2021-05-23 00:54:50'),(179,'default',0,'checkout/klarna_kp_design/color_details',NULL,'2021-05-23 00:54:50'),(180,'default',0,'checkout/klarna_kp_design/color_border',NULL,'2021-05-23 00:54:50'),(181,'default',0,'checkout/klarna_kp_design/color_border_selected',NULL,'2021-05-23 00:54:50'),(182,'default',0,'checkout/klarna_kp_design/color_text',NULL,'2021-05-23 00:54:50'),(183,'default',0,'checkout/klarna_kp_design/color_radius_border',NULL,'2021-05-23 00:54:50'),(184,'default',0,'klarna/osm/enabled','0','2021-05-23 00:54:50'),(185,'default',0,'klarna/osm/data_id',NULL,'2021-05-23 00:54:50'),(186,'default',0,'klarna/osm/theme','default','2021-05-23 00:54:50'),(187,'default',0,'klarna/osm/product_enabled','1','2021-05-23 00:54:50'),(188,'default',0,'klarna/osm/product_placement_select','credit-promotion-small','2021-05-23 00:54:50'),(189,'default',0,'klarna/osm/cart_enabled','1','2021-05-23 00:54:50'),(190,'default',0,'klarna/osm/cart_placement_select','top-strip-promotion-standard','2021-05-23 00:54:50'),(191,'default',0,'payment/amazon_payment/merchant_id',NULL,'2021-05-23 00:54:50'),(192,'default',0,'payment/amazon_payment/access_key',NULL,'2021-05-23 00:54:50'),(193,'default',0,'payment/amazon_payment/secret_key',NULL,'2021-05-23 00:54:50'),(194,'default',0,'payment/amazon_payment/client_id',NULL,'2021-05-23 00:54:50'),(195,'default',0,'payment/amazon_payment/client_secret',NULL,'2021-05-23 00:54:50'),(196,'default',0,'payment/amazon_payment/credentials_json',NULL,'2021-05-23 00:54:50'),(197,'default',0,'payment/amazon_payment/payment_region',NULL,'2021-05-23 00:54:50'),(198,'default',0,'payment/amazon_payment/sandbox','0','2021-05-23 00:54:50'),(199,'default',0,'payment/amazon_payment/active','0','2021-05-23 00:54:50'),(200,'default',0,'payment/amazon_payment/lwa_enabled','0','2021-05-23 00:54:50'),(201,'default',0,'payment/amazon_payment/payment_action','authorize','2021-05-23 00:54:50'),(202,'default',0,'payment/amazon_payment/authorization_mode','synchronous','2021-05-23 00:54:50'),(203,'default',0,'payment/amazon_payment/update_mechanism','polling','2021-05-23 00:54:50'),(204,'default',0,'payment/amazon_payment/button_display_language',NULL,'2021-05-23 00:54:50'),(205,'default',0,'payment/amazon_payment/button_color','Gold','2021-05-23 00:54:50'),(206,'default',0,'payment/amazon_payment/button_size','medium','2021-05-23 00:54:50'),(207,'default',0,'payment/amazon_payment/amazon_login_in_popup','1','2021-05-23 00:54:50'),(208,'default',0,'payment/amazon_payment/pwa_pp_button_is_visible','1','2021-05-23 00:54:50'),(209,'default',0,'payment/amazon_payment/minicart_button_is_visible','1','2021-05-23 00:54:50'),(210,'default',0,'payment/amazonlogin/active','0','2021-05-23 00:54:50'),(211,'default',0,'payment/amazon_payment/storename',NULL,'2021-05-23 00:54:50'),(212,'default',0,'payment/amazon_payment/logging','1','2021-05-23 00:54:50'),(213,'default',0,'payment/amazon_payment/allowed_ips',NULL,'2021-05-23 00:54:50'),(214,'default',0,'payment/free/specificcountry',NULL,'2021-05-23 00:54:50'),(215,'default',0,'payment/checkmo/specificcountry',NULL,'2021-05-23 00:54:50'),(216,'default',0,'payment/checkmo/payable_to',NULL,'2021-05-23 00:54:50'),(217,'default',0,'payment/checkmo/mailing_address',NULL,'2021-05-23 00:54:50'),(218,'default',0,'payment/checkmo/min_order_total',NULL,'2021-05-23 00:54:50'),(219,'default',0,'payment/checkmo/max_order_total',NULL,'2021-05-23 00:54:50'),(220,'default',0,'payment/checkmo/sort_order',NULL,'2021-05-23 00:54:51'),(221,'default',0,'payment/banktransfer/specificcountry',NULL,'2021-05-23 00:54:51'),(222,'default',0,'payment/banktransfer/instructions',NULL,'2021-05-23 00:54:51'),(223,'default',0,'payment/banktransfer/min_order_total',NULL,'2021-05-23 00:54:51'),(224,'default',0,'payment/banktransfer/max_order_total',NULL,'2021-05-23 00:54:51'),(225,'default',0,'payment/banktransfer/sort_order',NULL,'2021-05-23 00:54:51'),(226,'default',0,'payment/cashondelivery/specificcountry',NULL,'2021-05-23 00:54:51'),(227,'default',0,'payment/cashondelivery/instructions',NULL,'2021-05-23 00:54:51'),(228,'default',0,'payment/cashondelivery/min_order_total',NULL,'2021-05-23 00:54:51'),(229,'default',0,'payment/cashondelivery/max_order_total',NULL,'2021-05-23 00:54:51'),(230,'default',0,'payment/cashondelivery/sort_order',NULL,'2021-05-23 00:54:51'),(231,'default',0,'payment/purchaseorder/specificcountry',NULL,'2021-05-23 00:54:51'),(232,'default',0,'payment/purchaseorder/min_order_total',NULL,'2021-05-23 00:54:51'),(233,'default',0,'payment/purchaseorder/max_order_total',NULL,'2021-05-23 00:54:51'),(234,'default',0,'payment/purchaseorder/sort_order',NULL,'2021-05-23 00:54:51'),(235,'default',0,'payment/mercadopago/public_key','TEST-d366d182-b464-4a84-8f92-3ee91e55c9e1','2021-05-23 00:54:51'),(236,'default',0,'payment/mercadopago/access_token','TEST-2490598533979952-052218-71aa6c799fe4d88bda438ee9e4645f74-263241237','2021-05-23 00:54:51'),(237,'default',0,'payment/mercadopago/order_status_approved','processing','2021-05-23 00:54:51'),(238,'default',0,'payment/mercadopago/order_status_in_process','pending','2021-05-23 00:54:51'),(239,'default',0,'payment/mercadopago/order_status_pending','pending','2021-05-23 00:54:51'),(240,'default',0,'payment/mercadopago/order_status_rejected','pending','2021-05-23 00:54:51'),(241,'default',0,'payment/mercadopago/order_status_cancelled','pending','2021-05-23 00:54:51'),(242,'default',0,'payment/mercadopago/order_status_chargeback','pending','2021-05-23 00:54:51'),(243,'default',0,'payment/mercadopago/order_status_in_mediation','pending','2021-05-23 00:54:51'),(244,'default',0,'payment/mercadopago/order_status_refunded','pending','2021-05-23 00:54:51'),(245,'default',0,'payment/mercadopago/order_status_partially_refunded','pending','2021-05-23 00:54:51'),(246,'default',0,'payment/mercadopago/refund_available','0','2021-05-23 00:54:51'),(247,'default',0,'payment/mercadopago/cancel_payment','0','2021-05-23 00:54:51'),(248,'default',0,'payment/mercadopago_custom/active','1','2021-05-23 00:54:51'),(249,'default',0,'payment/mercadopago_custom/title','Credit Card - Mercado Pago','2021-05-23 00:54:51'),(250,'default',0,'payment/mercadopago_custom/statement_descriptor',NULL,'2021-05-23 00:54:51'),(251,'default',0,'payment/mercadopago_custom/binary_mode','0','2021-05-23 00:54:51'),(252,'default',0,'payment/mercadopago_custom/banner_checkout',NULL,'2021-05-23 00:54:51'),(253,'default',0,'payment/mercadopago_custom/sort_order','-3','2021-05-23 00:54:51'),(254,'default',0,'payment/mercadopago_custom/gateway_mode','0','2021-05-23 00:54:51'),(255,'default',0,'payment/mercadopago_custom/wallet_button','0','2021-05-23 00:54:51'),(256,'default',0,'payment/mercadopago_customticket/active','0','2021-05-23 00:54:51'),(257,'default',0,'payment/mercadopago_customticket/title','Ticket - Mercado Pago','2021-05-23 00:54:51'),(258,'default',0,'payment/mercadopago_customticket/banner_checkout',NULL,'2021-05-23 00:54:51'),(259,'default',0,'payment/mercadopago_customticket/excluded_payment_methods',NULL,'2021-05-23 00:54:51'),(260,'default',0,'payment/mercadopago_customticket/sort_order','-2','2021-05-23 00:54:51'),(261,'default',0,'payment/mercadopago_basic/active','0','2021-05-23 00:54:51'),(262,'default',0,'payment/mercadopago_basic/title','Quiero pagar con Mercado Pago sin costo Adicional.','2021-05-23 00:54:51'),(263,'default',0,'payment/mercadopago_basic/auto_return','1','2021-05-23 00:54:51'),(264,'default',0,'payment/mercadopago_basic/excluded_payment_methods',NULL,'2021-05-23 00:54:51'),(265,'default',0,'payment/mercadopago_basic/max_installments','12','2021-05-23 00:54:51'),(266,'default',0,'payment/mercadopago_basic/statement_desc',NULL,'2021-05-23 00:54:51'),(267,'default',0,'payment/mercadopago_basic/binary_mode','0','2021-05-23 00:54:51'),(268,'default',0,'payment/mercadopago_basic/exp_time_pref',NULL,'2021-05-23 00:54:51'),(269,'default',0,'payment/mercadopago_basic/gateway_mode','0','2021-05-23 00:54:51'),(270,'default',0,'payment/mercadopago_basic/sort_order','-4','2021-05-23 00:54:51'),(271,'default',0,'payment/mercadopago/category_id','others','2021-05-23 00:54:51'),(272,'default',0,'payment/mercadopago/use_successpage_mp','1','2021-05-23 00:54:51'),(273,'default',0,'payment/mercadopago/consider_discount','0','2021-05-23 00:54:51'),(274,'default',0,'payment/mercadopago/email_order_create','1','2021-05-23 00:54:51'),(275,'default',0,'payment/mercadopago/email_order_update','pending,approved,in_process,in_mediation,rejected,cancelled,refunded','2021-05-23 00:54:51'),(276,'default',0,'payment/mercadopago/logs','1','2021-05-23 00:54:51'),(277,'default',0,'payment/mercadopago/sponsor_id','222567845','2021-05-23 00:54:52'),(278,'default',0,'payment/mercadopago/site_id','MLB','2021-05-23 00:54:52'),(279,'default',0,'currency/options/default','BRL','2021-05-23 12:45:06'),(280,'default',0,'currency/options/allow','BRL','2021-05-23 12:45:06'),(281,'default',0,'carriers/flatrate/active','1','2021-05-24 00:47:55'),(282,'default',0,'carriers/flatrate/title','Frete Padrão - Entrega em até 24 Horas','2021-05-24 00:47:57'),(283,'default',0,'carriers/flatrate/name','Motoboy','2021-05-24 00:50:15'),(284,'default',0,'carriers/flatrate/type','O','2021-05-24 00:47:57'),(285,'default',0,'carriers/flatrate/price','5.00','2021-05-24 00:47:57'),(286,'default',0,'carriers/flatrate/handling_type','F','2021-05-24 00:47:57'),(287,'default',0,'carriers/flatrate/handling_fee','0','2021-05-24 00:47:57'),(288,'default',0,'carriers/flatrate/specificerrmsg','Entrega padrão indisponíve','2021-05-24 00:47:57'),(289,'default',0,'carriers/flatrate/sallowspecific','1','2021-05-24 00:47:57'),(290,'default',0,'carriers/flatrate/specificcountry','BR','2021-05-24 00:47:57'),(291,'default',0,'carriers/flatrate/showmethod','0','2021-05-24 00:47:57'),(292,'default',0,'carriers/flatrate/sort_order',NULL,'2021-05-24 00:47:57'),(293,'default',0,'carriers/freeshipping/free_shipping_subtotal',NULL,'2021-05-24 00:47:57'),(294,'default',0,'carriers/freeshipping/specificcountry',NULL,'2021-05-24 00:47:57'),(295,'default',0,'carriers/freeshipping/showmethod','0','2021-05-24 00:47:57'),(296,'default',0,'carriers/freeshipping/sort_order',NULL,'2021-05-24 00:47:57'),(297,'default',0,'carriers/tablerate/handling_fee',NULL,'2021-05-24 00:47:57'),(298,'default',0,'carriers/tablerate/specificcountry',NULL,'2021-05-24 00:47:57'),(299,'default',0,'carriers/tablerate/showmethod','0','2021-05-24 00:47:57'),(300,'default',0,'carriers/tablerate/sort_order',NULL,'2021-05-24 00:47:57'),(301,'default',0,'carriers/instore/active','1','2021-05-24 00:47:57'),(302,'default',0,'carriers/instore/name','Retirar Na Loja','2021-05-24 00:47:57'),(303,'default',0,'carriers/instore/title','Retirar Na Loja','2021-05-24 00:47:57'),(304,'default',0,'carriers/instore/price','0.00','2021-05-24 00:47:57'),(305,'default',0,'carriers/instore/search_radius','200000','2021-05-24 00:47:57'),(306,'default',0,'carriers/instore/specificerrmsg','A retirada na loja não está disponível','2021-05-24 00:47:57'),(307,'default',0,'carriers/ups/shipper_number',NULL,'2021-05-24 00:47:57'),(308,'default',0,'carriers/ups/handling_fee',NULL,'2021-05-24 00:47:57'),(309,'default',0,'carriers/ups/free_shipping_enable','0','2021-05-24 00:47:57'),(310,'default',0,'carriers/ups/specificcountry',NULL,'2021-05-24 00:47:57'),(311,'default',0,'carriers/ups/showmethod','0','2021-05-24 00:47:57'),(312,'default',0,'carriers/ups/debug','0','2021-05-24 00:47:57'),(313,'default',0,'carriers/ups/sort_order',NULL,'2021-05-24 00:47:57'),(314,'default',0,'carriers/usps/userid',NULL,'2021-05-24 00:47:57'),(315,'default',0,'carriers/usps/password',NULL,'2021-05-24 00:47:57'),(316,'default',0,'carriers/usps/handling_fee',NULL,'2021-05-24 00:47:57'),(317,'default',0,'carriers/usps/free_shipping_enable','0','2021-05-24 00:47:57'),(318,'default',0,'carriers/usps/specificcountry',NULL,'2021-05-24 00:47:57'),(319,'default',0,'carriers/usps/debug','0','2021-05-24 00:47:57'),(320,'default',0,'carriers/usps/showmethod','0','2021-05-24 00:47:57'),(321,'default',0,'carriers/usps/sort_order',NULL,'2021-05-24 00:47:57'),(322,'default',0,'carriers/fedex/account',NULL,'2021-05-24 00:47:57'),(323,'default',0,'carriers/fedex/meter_number',NULL,'2021-05-24 00:47:57'),(324,'default',0,'carriers/fedex/key',NULL,'2021-05-24 00:47:57'),(325,'default',0,'carriers/fedex/password',NULL,'2021-05-24 00:47:57'),(326,'default',0,'carriers/fedex/handling_fee',NULL,'2021-05-24 00:47:57'),(327,'default',0,'carriers/fedex/residence_delivery','0','2021-05-24 00:47:57'),(328,'default',0,'carriers/fedex/smartpost_hubid',NULL,'2021-05-24 00:47:57'),(329,'default',0,'carriers/fedex/free_shipping_enable','0','2021-05-24 00:47:57'),(330,'default',0,'carriers/fedex/specificcountry',NULL,'2021-05-24 00:47:57'),(331,'default',0,'carriers/fedex/debug','0','2021-05-24 00:47:57'),(332,'default',0,'carriers/fedex/showmethod','0','2021-05-24 00:47:57'),(333,'default',0,'carriers/fedex/sort_order',NULL,'2021-05-24 00:47:57'),(334,'default',0,'carriers/dhl/id',NULL,'2021-05-24 00:47:57'),(335,'default',0,'carriers/dhl/password',NULL,'2021-05-24 00:47:57'),(336,'default',0,'carriers/dhl/handling_fee',NULL,'2021-05-24 00:47:57'),(337,'default',0,'carriers/dhl/free_method_nondoc',NULL,'2021-05-24 00:47:57'),(338,'default',0,'carriers/dhl/free_shipping_enable','0','2021-05-24 00:47:57'),(339,'default',0,'carriers/dhl/specificcountry',NULL,'2021-05-24 00:47:57'),(340,'default',0,'carriers/dhl/showmethod','0','2021-05-24 00:47:57'),(341,'default',0,'carriers/dhl/debug','0','2021-05-24 00:47:57'),(342,'default',0,'carriers/dhl/sandbox_mode','0','2021-05-24 00:47:57'),(343,'default',0,'carriers/dhl/sort_order',NULL,'2021-05-24 00:47:57'),(344,'default',0,'cataloginventory/source_selection_distance_based_google/api_key','AIzaSyAfGUHwN6FiuW8XzkGSBTlzVoeHIKJlq6w','2021-05-24 01:10:45'),(345,'default',0,'general/country/allow','BR','2021-05-24 01:20:46'),(346,'default',0,'general/country/optional_zip_countries',NULL,'2021-05-24 01:20:46'),(347,'default',0,'general/country/eu_countries',NULL,'2021-05-24 01:20:46'),(348,'default',0,'wa_chat/general/enable','1','2021-05-24 22:14:40'),(349,'default',0,'wa_chat/general/phone_number','+558197399333','2021-05-24 22:35:02'),(350,'default',0,'wa_chat/general/message','Hello! I am interested in your product','2021-05-24 22:14:40'),(351,'default',0,'wa_chat/general/position','bottom-right','2021-05-24 22:14:40'),(352,'default',0,'wa_chat/general/sparsh_whatsapp_chat_icon_upload','default/whatsapp-fale-conosco.png','2021-05-24 22:16:03'),(353,'default',0,'storelocator/google_api_key/frontend','AIzaSyAfGUHwN6FiuW8XzkGSBTlzVoeHIKJlq6w','2021-05-25 23:44:27'),(354,'default',0,'storelocator/google_api_key/backend','AIzaSyAfGUHwN6FiuW8XzkGSBTlzVoeHIKJlq6w','2021-05-25 23:44:28');
/*!40000 ALTER TABLE `core_config_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ideo_storelocator_category`
--

DROP TABLE IF EXISTS `ideo_storelocator_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ideo_storelocator_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Category ID',
  `name` varchar(100) NOT NULL COMMENT 'Name',
  `icon` text DEFAULT NULL COMMENT 'Icon',
  `is_active` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Is_active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Updated At',
  PRIMARY KEY (`category_id`),
  KEY `IDEO_STORELOCATOR_CATEGORY_CATEGORY_ID` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ideo_storelocator_category';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ideo_storelocator_category`
--

LOCK TABLES `ideo_storelocator_category` WRITE;
/*!40000 ALTER TABLE `ideo_storelocator_category` DISABLE KEYS */;
INSERT INTO `ideo_storelocator_category` VALUES (1,'ACN ORGANIC FOOD',NULL,1,'2021-05-25 23:42:32','2021-05-25 23:42:32');
/*!40000 ALTER TABLE `ideo_storelocator_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ideo_storelocator_store`
--

DROP TABLE IF EXISTS `ideo_storelocator_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ideo_storelocator_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Store ID',
  `category_id` int(11) DEFAULT NULL COMMENT 'Category ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'Name',
  `address` text DEFAULT NULL COMMENT 'Address',
  `postcode` varchar(100) DEFAULT NULL COMMENT 'Postcode',
  `city` varchar(100) DEFAULT NULL COMMENT 'City',
  `country` varchar(2) DEFAULT NULL COMMENT 'Country',
  `phone` varchar(100) NOT NULL DEFAULT '' COMMENT 'Phone',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT 'Email',
  `fax` varchar(100) NOT NULL DEFAULT '' COMMENT 'Fax',
  `website` varchar(100) NOT NULL DEFAULT '' COMMENT 'Website',
  `lat` text DEFAULT NULL COMMENT 'Lat',
  `lng` text DEFAULT NULL COMMENT 'Lng',
  `zoom` varchar(5) DEFAULT NULL COMMENT 'Zoom',
  `is_active` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Is_active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Updated At',
  PRIMARY KEY (`store_id`),
  KEY `IDEO_STORELOCATOR_STORE_STORE_ID` (`store_id`),
  KEY `IDEO_STORELOCATOR_STORE_CTGR_ID_IDEO_STORELOCATOR_CTGR_CTGR_ID` (`category_id`),
  CONSTRAINT `IDEO_STORELOCATOR_STORE_CTGR_ID_IDEO_STORELOCATOR_CTGR_CTGR_ID` FOREIGN KEY (`category_id`) REFERENCES `ideo_storelocator_category` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='ideo_storelocator_store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ideo_storelocator_store`
--

LOCK TABLES `ideo_storelocator_store` WRITE;
/*!40000 ALTER TABLE `ideo_storelocator_store` DISABLE KEYS */;
INSERT INTO `ideo_storelocator_store` VALUES (1,1,'ACN ORGANIC FOOD - Cantinho do Céu','Rua 13 de Maio, S/N','04849-529','São Paulo','BR','+5581997399333','gaqp@cin.ufpe.br','','','-23.5624367','-46.6541459','6',1,'2021-05-25 23:46:31','2021-05-25 23:46:31'),(2,1,'ACN ORGANIC FOOD -  Parque São José','Viela 16, S/N','04843-425','São Paulo','BR','+5581997399333','gaqp@cin.ufpe.br','','','-23.7807866','-46.693801','2',1,'2021-05-25 23:56:26','2021-05-25 23:58:58'),(3,1,'ACN ORGANIC FOOD -  Rua 18 de Abril',' Rua 18 de Abril, S/N','08226-021','São Paulo','BR','+5581997399333','gaqp@cin.ufpe.br','','','-23.5218548','-46.4620864','20',1,'2021-05-26 00:00:10','2021-05-26 00:02:25'),(4,1,'ACN ORGANIC FOOD - Travessa 19 de Agosto','Travessa 19 de Agosto, S/N','04180-112','São Paulo','BR','+5581997399333','gaqp@cin.ufpe.br','','','-23.561729','-46.406241','15',1,'2021-05-26 00:03:07','2021-05-26 00:05:38'),(5,1,'ACN ORGANIC FOOD - Rua 2 de Fevereiro','Rua 2 de Fevereiro, S/N','04236-094','São Paulo','BR','+5581997399333','gaqp@cin.ufpe.br','','','-23.616429','-46.592037','15',1,'2021-05-26 00:07:22','2021-05-26 00:07:22'),(6,1,'ACN ORGANIC FOOD - Rua 21 de Abril','Rua 21 de Abril, S/N','03047-000','São Paulo','BR','+5581997399333','gaqp@cin.ufpe.br','','','-23.541924','-46.605126','15',1,'2021-05-26 00:08:52','2021-05-26 00:10:07');
/*!40000 ALTER TABLE `ideo_storelocator_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `inventory_stock_1`
--

/*!50001 DROP TABLE IF EXISTS `inventory_stock_1`*/;
/*!50001 DROP VIEW IF EXISTS `inventory_stock_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`magento`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `inventory_stock_1` AS select distinct `legacy_stock_status`.`product_id` AS `product_id`,`legacy_stock_status`.`website_id` AS `website_id`,`legacy_stock_status`.`stock_id` AS `stock_id`,`legacy_stock_status`.`qty` AS `quantity`,`legacy_stock_status`.`stock_status` AS `is_salable`,`product`.`sku` AS `sku` from (`cataloginventory_stock_status` `legacy_stock_status` join `catalog_product_entity` `product` on(`legacy_stock_status`.`product_id` = `product`.`entity_id`)) */;
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

-- Dump completed on 2021-05-26  1:11:42
