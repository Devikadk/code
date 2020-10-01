-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: esb_db
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

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
-- Table structure for table `esb_request`
--

DROP TABLE IF EXISTS `esb_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esb_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` varchar(45) NOT NULL,
  `dest_id` varchar(45) NOT NULL,
  `message_type` varchar(45) NOT NULL,
  `reference_id` varchar(45) NOT NULL,
  `message_id` varchar(45) NOT NULL,
  `received_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_location` text,
  `status` varchar(20) NOT NULL,
  `status_details` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esb_request`
--

LOCK TABLES `esb_request` WRITE;
/*!40000 ALTER TABLE `esb_request` DISABLE KEYS */;
INSERT INTO `esb_request` VALUES (96,'RIYA','dest','Email','INV-PROFILE-889712','x','2020-09-25 15:59:13','1','1','ÉÃUH‰å¿'),(97,'RIYA','dest','Email','INV-PROFILE-889712','x','2020-09-25 15:59:26','1','1','ÉÃUH‰å¿'),(98,'RIYA','RazorPay','CreditReport','INV-PROFILE-889712','id','2020-09-26 04:22:03','/home/riya/ganga/esb_app/bmd_files/116_57/bmd_razorpay.xml','done','1'),(99,'RIYA','RazorPay','CreditReport','INV-PROFILE-889712','id','2020-09-26 04:22:03','/home/riya/ganga/esb_app/bmd_files/117_50/bmd_razorpay2.xml','done','1'),(100,'RIYA','RazorPay','CreditReport','INV-PROFILE-889712','id','2020-09-26 04:22:03','/home/riya/ganga/esb_app/bmd_files/117_50/bmd_razorpay3.xml','done','1'),(101,'RIYA','RazorPay','CreditReport','INV-PROFILE-889712','id','2020-09-26 04:22:03','/home/riya/ganga/esb_app/bmd_files/117_50/bmd_razorpay.xml','done','1'),(102,'RIYA','RazorPay','CreditReport','INV-PROFILE-889712','id','2020-09-26 04:22:08','/home/riya/ganga/esb_app/bmd_files/118_64/bmd_razorpay2.xml','done','1'),(103,'RIYA','RazorPay','CreditReport','INV-PROFILE-889712','id','2020-09-26 04:22:08','/home/riya/ganga/esb_app/bmd_files/118_64/bmd_razorpay3.xml','done','1'),(104,'RIYA','RazorPay','CreditReport','INV-PROFILE-889712','id','2020-09-26 04:22:08','/home/riya/ganga/esb_app/bmd_files/118_64/bmd_razorpay.xml','done','1'),(105,'RIYA','dest','Email','INV-PROFILE-889712','id','2020-09-26 04:22:13','/home/riya/ganga/esb_app/bmd_files/118_64/bmd.xml','done','1'),(106,'RIYA2','dest2','Email','INV-PROFILE-889712','id','2020-09-26 04:22:17','/home/riya/ganga/esb_app/bmd_files/118_64/bmd2.xml','done','1'),(107,'RIYA','RazorPay','CreditReport','INV-PROFILE-889712','id','2020-09-26 04:22:14','/home/riya/ganga/esb_app/bmd_files/118_64/bmd_razorpay.xml','done','1'),(108,'RIYA','RazorPay','CreditReport','INV-PROFILE-889712','id','2020-09-26 04:22:14','/home/riya/ganga/esb_app/bmd_files/118_64/bmd_razorpay2.xml','done','1'),(109,'RIYA','RazorPay','CreditReport','INV-PROFILE-889712','id','2020-09-26 04:22:18','/home/riya/ganga/esb_app/bmd_files/119_29/bmd_razorpay2.xml','done','1');
/*!40000 ALTER TABLE `esb_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes` (
  `route_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(45) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `message_type` varchar(45) NOT NULL,
  `is_active` bit(1) NOT NULL,
  PRIMARY KEY (`route_id`),
  UNIQUE KEY `UK_sender_dest_msg_type` (`message_type`,`destination`,`sender`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (12,'RIYA','RazorPay','CreditReport',_binary ''),(17,'RIYA','dest','Email',_binary ''),(18,'RIYA2','dest2','Email',_binary '');
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transform_config`
--

DROP TABLE IF EXISTS `transform_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transform_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL,
  `config_key` varchar(45) NOT NULL,
  `config_value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_route_config` (`route_id`,`config_key`),
  KEY `route_idx` (`route_id`),
  CONSTRAINT `fk_route` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transform_config`
--

LOCK TABLES `transform_config` WRITE;
/*!40000 ALTER TABLE `transform_config` DISABLE KEYS */;
INSERT INTO `transform_config` VALUES (2,12,':IFSC_CODE','value'),(4,18,'JSON','value'),(9,17,'JSON','value');
/*!40000 ALTER TABLE `transform_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport_config`
--

DROP TABLE IF EXISTS `transport_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) DEFAULT NULL,
  `config_key` varchar(45) DEFAULT NULL,
  `config_value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_route_config` (`config_key`,`route_id`),
  KEY `route_idx` (`route_id`),
  CONSTRAINT `route` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport_config`
--

LOCK TABLES `transport_config` WRITE;
/*!40000 ALTER TABLE `transport_config` DISABLE KEYS */;
INSERT INTO `transport_config` VALUES (3,12,'HTTP','https://ifsc.razorpay.com/'),(5,18,'SMTP','riyatoteja@gmail.com'),(7,17,'SMTP','riyatoteja1998@gmail.com');
/*!40000 ALTER TABLE `transport_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-26 11:55:35
