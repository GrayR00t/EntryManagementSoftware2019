-- MySQL dump 10.17  Distrib 10.3.15-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: myflaskapp
-- ------------------------------------------------------
-- Server version	10.3.15-MariaDB-1

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
-- Table structure for table `visitor`
--

DROP TABLE IF EXISTS `visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guestname` varchar(100) DEFAULT NULL,
  `guestemail` varchar(100) DEFAULT NULL,
  `guestphone` int(10) DEFAULT NULL,
  `hostname` varchar(100) DEFAULT NULL,
  `hostemail` varchar(100) DEFAULT NULL,
  `hostphone` int(10) DEFAULT NULL,
  `checkin` datetime DEFAULT NULL,
  `checkout` datetime DEFAULT NULL,
  `visitedaddress` varchar(300) DEFAULT NULL,
  `register_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor`
--

LOCK TABLES `visitor` WRITE;
/*!40000 ALTER TABLE `visitor` DISABLE KEYS */;
INSERT INTO `visitor` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-11-26 04:16:10'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-11-26 04:16:48');
/*!40000 ALTER TABLE `visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor1`
--

DROP TABLE IF EXISTS `visitor1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitor1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guestname` varchar(100) DEFAULT NULL,
  `guestemail` varchar(100) DEFAULT NULL,
  `guestphone` varchar(10) DEFAULT NULL,
  `hostname` varchar(100) DEFAULT NULL,
  `hostemail` varchar(100) DEFAULT NULL,
  `hostphone` varchar(10) DEFAULT NULL,
  `checkin` datetime DEFAULT NULL,
  `checkout` datetime DEFAULT NULL,
  `visitedaddress` varchar(300) DEFAULT NULL,
  `register_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor1`
--

LOCK TABLES `visitor1` WRITE;
/*!40000 ALTER TABLE `visitor1` DISABLE KEYS */;
/*!40000 ALTER TABLE `visitor1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor2`
--

DROP TABLE IF EXISTS `visitor2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitor2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guestname` varchar(100) DEFAULT NULL,
  `guestemail` varchar(100) DEFAULT NULL,
  `guestphone` varchar(10) DEFAULT NULL,
  `hostname` varchar(100) DEFAULT NULL,
  `hostemail` varchar(100) DEFAULT NULL,
  `hostphone` varchar(10) DEFAULT NULL,
  `checkin` varchar(100) DEFAULT NULL,
  `checkout` varchar(100) DEFAULT NULL,
  `visitedaddress` varchar(300) DEFAULT NULL,
  `register_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor2`
--

LOCK TABLES `visitor2` WRITE;
/*!40000 ALTER TABLE `visitor2` DISABLE KEYS */;
INSERT INTO `visitor2` VALUES (1,'Neeraj','ns28@iitbbs.ac.in','8004789080','Somu Kumar','ns28@iitbbs.ac.in','8004789080','12/10/2018 3:10 AM','12/10/2018 3:10 AM','ABCD','2019-11-26 04:56:19'),(2,'neeraj','ns28@iitbbs.ac.in','8004789080','Aryaman Sinha','as79@iitbbs.ac.in','8004789080','13/12/19 4:00 PM','13/11/19 8:00 PM','ABCD','2019-11-26 06:16:00'),(3,'Neeraj','ns28@iitbbs.ac.in','8004789080','Somu Kumar','ns28@iitbbs.ac.in','8004789080','12/10/2018 3:10 AM','18-06-12 10:34:09','ABCD','2019-11-26 06:31:58'),(4,'Neeraj','ns28@iitbbs.ac.in','8004789080','Somu Kumar','ns28@iitbbs.ac.in','8004789080','12/10/2018 3:10 AM','18-06-12 10:34:09 AM','ABCD','2019-11-26 07:26:32'),(5,'Neeraj','ns28@iitbbs.ac.in','8004789080','Somu Kumar','ns28@iitbbs.ac.in','8004789080','12/10/2018 3:10 AM','18-06-12 10:34:09 AM','ABCD','2019-11-26 07:27:15'),(6,'Neeraj','ns28@iitbbs.ac.in','8004789080','Somu Kumar','ns28@iitbbs.ac.in','8004789080','12/10/2018 3:10 AM','18-06-12 10:34 PM','ABCD','2019-11-26 07:34:27'),(7,'Neeraj','ns28@iitbbs.ac.in','8004789080','Somu Kumar','ns28@iitbbs.ac.in','8004789080','12/10/2018 3:10 AM','12/10/2018 3:10 AM','ABCD','2019-11-26 07:37:18'),(8,'Neeraj','ns28@iitbbs.ac.in','8004789080','Somu Kumar','ns28@iitbbs.ac.in','8004789080','12/10/2018 3:10 AM','18-06-12 10:34:09 AM','ABCD','2019-11-26 07:39:07'),(9,'Neeraj','ns28@iitbbs.ac.in','8004789080','Somu Kumar','ns28@iitbbs.ac.in','8004789080','12/10/2018 3:10 AM','18-06-12 10:34:09','ABCD','2019-11-26 07:41:24'),(10,'Neeraj','ns28@iitbbs.ac.in','8004789080','Somu Kumar','npattinson1999@gmail.com','9668617972','12/10/2018 3:10 AM','18-06-12 10:34:09 AM','ABCD','2019-11-26 10:38:29'),(11,'Neeraj','ns28@iitbbs.ac.in','8004789080','Somu Kumar','npattinson1999@gmail.com','8004789080','12/10/2018 3:10 AM','18-06-12 10:34:09 AM','ABCD','2019-11-26 10:39:38'),(12,'Neeraj','ns28@iitbbs.ac.in','8004789080','Somu Kumar','npattinson1999@gmail.com','8004789080','12/10/2018 3:10 AM','18-06-12 10:34 PM','ABCD','2019-11-26 10:43:48'),(13,'Neeraj','ns28@iitbbs.ac.in','8004789080','Somu Kumar','npattinson1999@gmail.com','8004789080','12/10/2018 3:10 AM','12/10/2018 3:10 AM','ABCD','2019-11-26 10:50:45'),(14,'Neeraj','ns28@iitbbs.ac.in','8004789080','Somu Kumar','npattinson1999@gmail.com','8004789080','12/10/2018 3:10 AM','12/10/2018 3:10 AM','ABCD','2019-11-26 10:59:56'),(15,'Neeraj','ns28@iitbbs.ac.in','8004789080','Somu Kumar','npattinson1999@gmail.com','8004789080','12/10/2018 3:10 AM','12/10/2018 3:10 AM','ABCD','2019-11-26 11:47:32');
/*!40000 ALTER TABLE `visitor2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-26  6:57:07
