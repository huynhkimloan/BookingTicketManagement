-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: bookingticketdb
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookingticket`
--

DROP TABLE IF EXISTS `bookingticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookingticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookingdate` datetime NOT NULL,
  `quantity` int DEFAULT '1',
  `active` tinyint(1) DEFAULT '1',
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_bookingticket_idx` (`user_id`),
  CONSTRAINT `fk_user_bookingticket` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingticket`
--

LOCK TABLES `bookingticket` WRITE;
/*!40000 ALTER TABLE `bookingticket` DISABLE KEYS */;
INSERT INTO `bookingticket` VALUES (1,'2022-01-16 00:00:00',1,1,2),(2,'2022-01-17 00:00:00',1,1,6),(3,'2022-01-18 00:00:00',1,1,2),(4,'2022-01-19 00:00:00',1,1,6);
/*!40000 ALTER TABLE `bookingticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Xe Khách Thường '),(2,'Xe Khách Vip');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  `trip_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_comment_idx` (`user_id`),
  KEY `fk_trip_comment_idx` (`trip_id`),
  CONSTRAINT `fk_trip_comment` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`),
  CONSTRAINT `fk_user_comment` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Trải nghiệm tuyệt vời','2022-08-03 00:00:00',6,6);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `user_id_driver` int NOT NULL,
  `identitycard` int NOT NULL,
  `address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `dateofbirth` date NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `license` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id_driver`),
  KEY `fk_user_driver_idx` (`user_id_driver`),
  CONSTRAINT `fk_user_driver` FOREIGN KEY (`user_id_driver`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (3,215571830,'Bình Định','1970-12-13','Nam','D1'),(7,215574356,'Phú Yên','1960-12-13','Nam','D1'),(8,215571832,'Phú Yên','1975-12-13','Nam','D1');
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driverdetail`
--

DROP TABLE IF EXISTS `driverdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driverdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trip_id` int DEFAULT NULL,
  `user_id_driver` int DEFAULT NULL,
  `role` enum('Assistant','Driver','MainDriver') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_driver_trip_idx` (`trip_id`,`user_id_driver`),
  KEY `fk_driver_driverdetail_idx` (`user_id_driver`),
  CONSTRAINT `fk_driver_driverdetail` FOREIGN KEY (`user_id_driver`) REFERENCES `driver` (`user_id_driver`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_trip_driverdetail` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driverdetail`
--

LOCK TABLES `driverdetail` WRITE;
/*!40000 ALTER TABLE `driverdetail` DISABLE KEYS */;
INSERT INTO `driverdetail` VALUES (4,6,3,'MainDriver'),(5,6,7,'Driver'),(6,7,3,'Assistant'),(7,7,8,'MainDriver');
/*!40000 ALTER TABLE `driverdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `user_id_employee` int NOT NULL,
  `identitycard` int NOT NULL,
  `address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `dateofbirth` date NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`user_id_employee`),
  KEY `fk_user_employee_idx` (`user_id_employee`),
  CONSTRAINT `fk_user_employee` FOREIGN KEY (`user_id_employee`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (2,215571830,'Phú Yên','2001-10-06','Nữ');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengercar`
--

DROP TABLE IF EXISTS `passengercar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengercar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `numberplate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seats` int NOT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_passengecar_idx` (`category_id`),
  CONSTRAINT `fk_category_passengecar` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengercar`
--

LOCK TABLES `passengercar` WRITE;
/*!40000 ALTER TABLE `passengercar` DISABLE KEYS */;
INSERT INTO `passengercar` VALUES (1,'Đức Tâm','77_B1',21,2),(2,'Đức Hiền','77_B2',35,1),(3,'Tân Sinh','78_C1',21,2),(4,'Thống Nhất','78_A2',35,1);
/*!40000 ALTER TABLE `passengercar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `id` int NOT NULL AUTO_INCREMENT,
  `routename` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `startingpoint` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `destination` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'HCM-BĐ','Tp HCM','BĐ',300),(2,'HCM-PY','Tp HCM','PY',250),(3,'PY-HCM','PY','Tp HCM',250),(4,'BĐ-HCM','BĐ','Tp HCM',300);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticketdetail`
--

DROP TABLE IF EXISTS `ticketdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticketdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `seatposition` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paymentmethod` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `totalprice` decimal(10,0) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `passengercar_id` int DEFAULT NULL,
  `bookingticket_id` int DEFAULT NULL,
  `trip_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_passengercar_ticketdetail_idx` (`passengercar_id`),
  KEY `fk_trip_ticketdetail_idx1` (`bookingticket_id`),
  KEY `fk_trip_ticketdetail_idx` (`trip_id`),
  CONSTRAINT `fk_bookingticket_ticketdetail` FOREIGN KEY (`bookingticket_id`) REFERENCES `bookingticket` (`id`),
  CONSTRAINT `fk_passengercar_ticketdetail` FOREIGN KEY (`passengercar_id`) REFERENCES `passengercar` (`id`),
  CONSTRAINT `fk_trip_ticketdetail` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticketdetail`
--

LOCK TABLES `ticketdetail` WRITE;
/*!40000 ALTER TABLE `ticketdetail` DISABLE KEYS */;
INSERT INTO `ticketdetail` VALUES (2,'A1','Tiền mặt',300,1,NULL,NULL,6),(3,'A2','Momo',250,1,NULL,NULL,7);
/*!40000 ALTER TABLE `ticketdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coachname` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `departureday` date NOT NULL,
  `departuretime` time NOT NULL,
  `arrivaltime` time NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `route_id` int DEFAULT NULL,
  `user_id_employee` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_route_trip_idx` (`route_id`),
  KEY `fk_employee_trip_idx` (`user_id_employee`),
  CONSTRAINT `fk_employee_trip` FOREIGN KEY (`user_id_employee`) REFERENCES `employee` (`user_id_employee`),
  CONSTRAINT `fk_route_trip` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (6,'HCM-BĐ','2022-08-02','16:00:00','04:00:00',1,1,2),(7,'HCM-PY','2022-08-03','19:00:00','06:00:00',1,2,2),(8,'HCM-PY','2022-08-02','19:00:00','05:00:00',1,2,2),(9,'HCM-BĐ','2022-08-04','17:00:00','06:00:00',1,1,2);
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tripdetail`
--

DROP TABLE IF EXISTS `tripdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tripdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `passengercar_id` int DEFAULT NULL,
  `trip_id` int DEFAULT NULL,
  `emptyseat` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_trip_tripdetail_idx` (`trip_id`),
  KEY `fk_passengercar_tripdetail_idx` (`passengercar_id`),
  CONSTRAINT `fk_passengercar_tripdetail` FOREIGN KEY (`passengercar_id`) REFERENCES `passengercar` (`id`),
  CONSTRAINT `fk_trip_tripdetail` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tripdetail`
--

LOCK TABLES `tripdetail` WRITE;
/*!40000 ALTER TABLE `tripdetail` DISABLE KEYS */;
INSERT INTO `tripdetail` VALUES (1,3,6,3),(2,1,6,1),(3,4,7,1);
/*!40000 ALTER TABLE `tripdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `avatar` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `userrole` enum('Customer','Admin','Employee','Driver') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Phan Hiền','phanhien','12072001',NULL,NULL,'abc',1,'Admin'),(2,'Huỳnh Loan','huynhloan','6102001',NULL,NULL,'abc',1,'Employee'),(3,'Phan A','phana','123456',NULL,NULL,'abc',1,'Driver'),(4,'Huỳnh Loan','huynhloan1','111111',NULL,NULL,'abc',1,'Admin'),(6,'Phan Thị Hiền','hien','111111',NULL,NULL,'abc',1,'Customer'),(7,'Phan B','phanb','123456',NULL,NULL,'abc',1,'Driver'),(8,'Phan C','phanc','123456',NULL,NULL,'abc',1,'Driver'),(9,'Diệu Hiền','hien1','111111',NULL,NULL,'abc',1,'Customer'),(10,'Kim Loan','loan','123456',NULL,NULL,'abc',1,'Customer');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-03 23:51:41
