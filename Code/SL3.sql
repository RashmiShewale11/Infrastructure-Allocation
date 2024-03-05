-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: SL3
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

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
-- Table structure for table `assistant_info`
--

DROP TABLE IF EXISTS `assistant_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assistant_info` (
  `assistant_id` varchar(15) NOT NULL,
  `assistant_name` varchar(15) NOT NULL,
  `mob_no` char(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`assistant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assistant_info`
--

LOCK TABLES `assistant_info` WRITE;
/*!40000 ALTER TABLE `assistant_info` DISABLE KEYS */;
INSERT INTO `assistant_info` VALUES ('I2k12873498','Rashmi','7507200477','rashmi@gmail.com'),('I2K34126789','Shubham','8237317225','shubham@gmail.com'),('I2k34126790','shivani','7218867653','shivani@gmail.com'),('I2K34126791','Mayuri','9922702900','mayuri@gmail.com');
/*!40000 ALTER TABLE `assistant_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom_details`
--

DROP TABLE IF EXISTS `classroom_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classroom_details` (
  `class_no` varchar(10) NOT NULL,
  `lab_no` varchar(10) NOT NULL,
  `capacity` int(11) NOT NULL,
  PRIMARY KEY (`class_no`),
  KEY `lab_no` (`lab_no`),
  CONSTRAINT `classroom_details_ibfk_1` FOREIGN KEY (`lab_no`) REFERENCES `lab_details` (`lab_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom_details`
--

LOCK TABLES `classroom_details` WRITE;
/*!40000 ALTER TABLE `classroom_details` DISABLE KEYS */;
INSERT INTO `classroom_details` VALUES ('A1-104','A1-101',80),('A1-105','A1-101',70),('A2-104','A2-101',70),('A2-105','A2-101',75),('A3-104','A3-101',75),('A3-105','A3-101',75),('A3-106','A3-102',80),('A3_108','A3-102',70);
/*!40000 ALTER TABLE `classroom_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom_time`
--

DROP TABLE IF EXISTS `classroom_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classroom_time` (
  `class_no` varchar(10) NOT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  `flag` int(2) NOT NULL,
  `day` varchar(10) NOT NULL,
  KEY `class_no` (`class_no`),
  CONSTRAINT `classroom_time_ibfk_1` FOREIGN KEY (`class_no`) REFERENCES `classroom_details` (`class_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom_time`
--

LOCK TABLES `classroom_time` WRITE;
/*!40000 ALTER TABLE `classroom_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `classroom_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_info`
--

DROP TABLE IF EXISTS `dept_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept_info` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(15) NOT NULL,
  `hod_id` varchar(15) NOT NULL,
  `hod_name` varchar(15) NOT NULL,
  `hod_email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`dept_id`,`hod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_info`
--

LOCK TABLES `dept_info` WRITE;
/*!40000 ALTER TABLE `dept_info` DISABLE KEYS */;
INSERT INTO `dept_info` VALUES (1,'IT','H2K12455555','Mr.Sonkamble','hod1@gmail.com'),(2,'CM','H2K12455556','Mr.Ingle','ingle2@gmail.com'),(3,'E&TC','H2K124555557','Mr.Ravidra','ravindra3@gmail.com');
/*!40000 ALTER TABLE `dept_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_details`
--

DROP TABLE IF EXISTS `lab_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_details` (
  `lab_no` varchar(10) NOT NULL,
  `assistant_id` varchar(15) NOT NULL,
  `capacity` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  PRIMARY KEY (`lab_no`),
  KEY `dept_id` (`dept_id`),
  KEY `assistant_id` (`assistant_id`),
  CONSTRAINT `lab_details_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `dept_info` (`dept_id`),
  CONSTRAINT `lab_details_ibfk_2` FOREIGN KEY (`assistant_id`) REFERENCES `assistant_info` (`assistant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_details`
--

LOCK TABLES `lab_details` WRITE;
/*!40000 ALTER TABLE `lab_details` DISABLE KEYS */;
INSERT INTO `lab_details` VALUES ('A1-101','I2K34126791',22,3),('A2-101','I2k34126790',24,2),('A3-101','I2k12873498',25,1),('A3-102','I2K34126789',20,1);
/*!40000 ALTER TABLE `lab_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_time`
--

DROP TABLE IF EXISTS `lab_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_time` (
  `lab_id` int(11) NOT NULL,
  `lab_no` varchar(10) NOT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  `day` varchar(10) NOT NULL,
  `avail_day` int(1) DEFAULT NULL,
  `flag` int(2) NOT NULL,
  PRIMARY KEY (`lab_id`),
  KEY `lab_no` (`lab_no`),
  CONSTRAINT `lab_time_ibfk_1` FOREIGN KEY (`lab_no`) REFERENCES `lab_details` (`lab_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_time`
--

LOCK TABLES `lab_time` WRITE;
/*!40000 ALTER TABLE `lab_time` DISABLE KEYS */;
INSERT INTO `lab_time` VALUES (1,'A1-101','08:00:00','10:00:00','Monday',1,0),(2,'A2-101','08:00:00','10:00:00','Monday',1,0),(3,'A1-101','01:00:00','03:00:00','Monday',1,0),(4,'A2-101','10:15:00','12:15:00','Monday',1,0),(5,'A3-101','09:00:00','11:00:00','Monday',1,0),(6,'A3-101','11:15:00','01:15:00','Tuesday',2,0),(7,'A3-101','02:00:00','04:00:00','Wednesday',3,0);
/*!40000 ALTER TABLE `lab_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_info`
--

DROP TABLE IF EXISTS `teacher_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_info` (
  `mis_id` varchar(15) NOT NULL,
  `fname` varchar(10) DEFAULT NULL,
  `mname` varchar(10) DEFAULT NULL,
  `lname` varchar(10) DEFAULT NULL,
  `mob_no` char(10) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `set_password` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`mis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_info`
--

LOCK TABLES `teacher_info` WRITE;
/*!40000 ALTER TABLE `teacher_info` DISABLE KEYS */;
INSERT INTO `teacher_info` VALUES ('I2k17205098','Shubham','Ajay','Mapara','8237317225','mapara.shubham@gmail.com','shubham@123'),('I2k17205105','Shivani','Vijay','Rajmane','7218867653','shivani.rajmane123@gmail.com','shivani@123'),('I2k17205108','Rashmi','Madhukar','Shewale','7507200477','rashmimshewale@gmail.com','rashmi@123');
/*!40000 ALTER TABLE `teacher_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger on_insert after insert on teacher_info for each row
begin
insert into teacher_login values(new.mis_id,new.set_password);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `teacher_login`
--

DROP TABLE IF EXISTS `teacher_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_login` (
  `mis_id` varchar(15) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  UNIQUE KEY `mis_id` (`mis_id`),
  CONSTRAINT `teacher_login_ibfk_1` FOREIGN KEY (`mis_id`) REFERENCES `teacher_info` (`mis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_login`
--

LOCK TABLES `teacher_login` WRITE;
/*!40000 ALTER TABLE `teacher_login` DISABLE KEYS */;
INSERT INTO `teacher_login` VALUES ('I2k17205105','shivani@123'),('I2k17205098','shubham@123'),('I2k17205108','rashmi@123');
/*!40000 ALTER TABLE `teacher_login` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-11 21:04:10
