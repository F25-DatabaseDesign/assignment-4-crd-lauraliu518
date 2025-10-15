-- MySQL dump 10.13  Distrib 8.0.43, for macos15 (arm64)
--
-- Host: localhost    Database: unitedhelpers
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `volunteerId` int NOT NULL,
  `taskCode` int NOT NULL,
  `startDateTime` datetime NOT NULL,
  `endDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`volunteerId`,`taskCode`,`startDateTime`),
  KEY `fk_assignment_taskCode__task_taskCode` (`taskCode`),
  CONSTRAINT `fk_assignment_taskCode__task_taskCode` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`),
  CONSTRAINT `fk_assignment_volunteerId__volunteer_volunteerId` FOREIGN KEY (`volunteerId`) REFERENCES `volunteer` (`volunteerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,101,'2025-03-01 08:00:00',NULL),(1,104,'2025-03-02 09:00:00',NULL),(2,102,'2025-03-01 08:00:00',NULL),(2,104,'2025-03-03 08:30:00',NULL),(3,102,'2025-03-02 10:00:00',NULL),(3,107,'2025-03-04 09:00:00',NULL),(4,108,'2025-03-05 08:00:00',NULL),(5,103,'2025-03-01 09:00:00',NULL),(6,106,'2025-03-02 13:00:00',NULL),(7,109,'2025-03-03 09:00:00',NULL),(8,110,'2025-03-01 14:00:00','2025-03-01 18:00:00'),(9,111,'2025-03-02 08:00:00',NULL),(10,112,'2025-03-06 09:00:00',NULL),(11,104,'2025-03-04 09:00:00',NULL),(12,112,'2025-03-06 09:30:00',NULL);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemId` int NOT NULL AUTO_INCREMENT,
  `itemDescription` varchar(120) NOT NULL,
  `itemValue` decimal(8,2) NOT NULL,
  `quantityOnHand` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Gauze Roll',1.20,8000),(2,'Antiseptic Wipes',0.10,20000),(3,'Bandage Pack',2.40,6000),(4,'Canned Beans 16oz',1.50,15000),(5,'Rice Bag 1kg',2.10,12000),(6,'Baby Diapers (M)',0.30,22000),(7,'Baby Diapers (L)',0.50,10000),(8,'Toy Car',1.00,3000),(9,'Doll',1.50,2500),(10,'Soap Bar',0.40,16000),(11,'Toothbrush',0.60,14000),(12,'Toothpaste 100ml',1.10,13000),(13,'Feminine Pads (10pk)',1.30,11000);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageId` int NOT NULL AUTO_INCREMENT,
  `taskCode` int NOT NULL,
  `packageTypeId` int NOT NULL,
  `packageCreateDate` datetime NOT NULL,
  `packageWeight` decimal(8,2) NOT NULL,
  PRIMARY KEY (`packageId`),
  KEY `fk_package_taskCode__task_taskCode` (`taskCode`),
  KEY `fk_package_packageTypeId__package_type_packageTypeId` (`packageTypeId`),
  CONSTRAINT `fk_package_packageTypeId__package_type_packageTypeId` FOREIGN KEY (`packageTypeId`) REFERENCES `package_type` (`packageTypeId`),
  CONSTRAINT `fk_package_taskCode__task_taskCode` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,102,1,'2025-03-01 00:00:00',2.10),(2,102,1,'2025-03-01 00:00:00',2.05),(3,102,3,'2025-03-01 00:00:00',3.40),(4,102,3,'2025-03-02 00:00:00',3.35),(5,102,2,'2025-03-02 00:00:00',2.80),(6,104,3,'2025-03-03 00:00:00',3.50),(7,104,3,'2025-03-03 00:00:00',3.55),(8,104,3,'2025-03-04 00:00:00',3.60),(9,105,1,'2025-03-04 00:00:00',2.00),(10,107,2,'2025-03-04 00:00:00',2.70),(11,107,2,'2025-03-04 00:00:00',2.65),(12,108,4,'2025-03-05 00:00:00',1.80),(13,108,4,'2025-03-05 00:00:00',1.85),(14,112,3,'2025-03-06 00:00:00',3.45);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_contents`
--

DROP TABLE IF EXISTS `package_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_contents` (
  `itemId` int NOT NULL,
  `packageId` int NOT NULL,
  `itemQuantity` int NOT NULL,
  PRIMARY KEY (`itemId`,`packageId`),
  KEY `fk_package_contents_packageId__package_packageId` (`packageId`),
  CONSTRAINT `fk_package_contents_itemId__item_itemId` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `fk_package_contents_packageId__package_packageId` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_contents`
--

LOCK TABLES `package_contents` WRITE;
/*!40000 ALTER TABLE `package_contents` DISABLE KEYS */;
INSERT INTO `package_contents` VALUES (1,1,3),(1,2,2),(1,9,3),(2,1,5),(2,2,4),(2,9,4),(3,1,2),(3,2,2),(3,9,1),(4,3,4),(4,4,4),(4,6,5),(4,7,5),(4,8,5),(4,14,4),(5,3,1),(5,4,1),(5,6,1),(5,7,1),(5,8,1),(5,14,2),(6,5,2),(6,10,2),(6,11,2),(7,5,2),(7,10,2),(7,11,2),(9,5,1),(9,10,1),(9,11,1),(10,12,2),(10,13,2),(11,12,1),(11,13,1),(12,12,2),(12,13,2);
/*!40000 ALTER TABLE `package_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_type`
--

DROP TABLE IF EXISTS `package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_type` (
  `packageTypeId` int NOT NULL,
  `packageTypeName` varchar(100) NOT NULL,
  PRIMARY KEY (`packageTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_type`
--

LOCK TABLES `package_type` WRITE;
/*!40000 ALTER TABLE `package_type` DISABLE KEYS */;
INSERT INTO `package_type` VALUES (1,'basic medical'),(2,'child-care'),(3,'food'),(4,'hygiene');
/*!40000 ALTER TABLE `package_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_list`
--

DROP TABLE IF EXISTS `packing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_list` (
  `packingListId` int NOT NULL AUTO_INCREMENT,
  `packingListName` varchar(100) NOT NULL,
  `packingListDescription` text,
  PRIMARY KEY (`packingListId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_list`
--

LOCK TABLES `packing_list` WRITE;
/*!40000 ALTER TABLE `packing_list` DISABLE KEYS */;
INSERT INTO `packing_list` VALUES (1,'MedicalSupplies','Gauze, bandages, antiseptic. Check expiry dates.'),(2,'FoodSupplies','Non-perishable foods only; no meat; add can opener per 10th box.'),(3,'ChildcareSupplies','Toys, diapers; avoid choking hazards; mix sizes.'),(4,'PersonalHygieneSupplies','Soap, toothbrush, toothpaste, feminine products, wipes, towel, tissue.');
/*!40000 ALTER TABLE `packing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `taskCode` int NOT NULL,
  `packingListId` int DEFAULT NULL,
  `taskTypeId` int NOT NULL,
  `taskStatusId` int NOT NULL,
  `taskDescription` varchar(200) NOT NULL,
  PRIMARY KEY (`taskCode`),
  KEY `fk_task_taskTypeId__task_type_taskTypeId` (`taskTypeId`),
  KEY `fk_task_taskStatusId__task_status_taskStatusId` (`taskStatusId`),
  KEY `fk_task_packingListId__packing_list_packingListId` (`packingListId`),
  CONSTRAINT `fk_task_packingListId__packing_list_packingListId` FOREIGN KEY (`packingListId`) REFERENCES `packing_list` (`packingListId`),
  CONSTRAINT `fk_task_taskStatusId__task_status_taskStatusId` FOREIGN KEY (`taskStatusId`) REFERENCES `task_status` (`taskStatusId`),
  CONSTRAINT `fk_task_taskTypeId__task_type_taskTypeId` FOREIGN KEY (`taskTypeId`) REFERENCES `task_type` (`taskTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (101,NULL,1,2,'Respond to emergency help line'),(102,1,2,1,'Prepare 5,000 medical/food/child-care packages (mixed)'),(103,NULL,3,1,'Inventory organization and management on Warehouse A'),(104,2,2,2,'Prepare 1,000 food packages'),(105,1,2,4,'Repack damaged medical kits and check expired products'),(106,NULL,1,2,'Front desk response'),(107,3,2,1,'Pack 500 child-care packages'),(108,4,2,1,'Pack 800 hygiene packages'),(109,NULL,3,1,'Data entry for volunteer application forms'),(110,NULL,1,3,'Data entry for donors'),(111,NULL,4,1,'Truck loading for dispatch'),(112,2,2,1,'Emergency food box packing');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_status`
--

DROP TABLE IF EXISTS `task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_status` (
  `taskStatusId` int NOT NULL,
  `taskStatusName` varchar(50) NOT NULL,
  PRIMARY KEY (`taskStatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_status`
--

LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;
INSERT INTO `task_status` VALUES (1,'open'),(2,'ongoing'),(3,'completed'),(4,'paused'),(5,'cancelled');
/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_type`
--

DROP TABLE IF EXISTS `task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_type` (
  `taskTypeId` int NOT NULL,
  `taskTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`taskTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_type`
--

LOCK TABLES `task_type` WRITE;
/*!40000 ALTER TABLE `task_type` DISABLE KEYS */;
INSERT INTO `task_type` VALUES (1,'recurring'),(2,'packing'),(3,'administrative'),(4,'logistics');
/*!40000 ALTER TABLE `task_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer` (
  `volunteerId` int NOT NULL AUTO_INCREMENT,
  `volunteerName` varchar(100) NOT NULL,
  `volunteerAddress` varchar(200) DEFAULT NULL,
  `volunteerTelephone` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`volunteerId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES (1,'Ava Amber','12 Bay Ave, Brooklyn, NY','917-555-0101'),(2,'Noah Patel','88 River Rd, Jersey City, NJ','201-555-0192'),(3,'Sam Johnson','44 Maple St, Newark, NJ','973-555-0118'),(4,'Lia Garcia','902 Pine Ln, Queens, NY','646-555-0134'),(5,'Emma Davis','5 Orchard Pl, Hoboken, NJ','201-555-0177'),(6,'Ethan Liu','77 Prospect Ave, Brooklyn, NY','718-555-0140'),(7,'Sophia Smith','3 Harbor Ct, Staten Island, NY','347-555-0186'),(8,'James Kim','210 W 19th St, New York, NY','212-555-0155'),(9,'Olivia Nguyen','9 Cedar Dr, Queens, NY','646-555-0166'),(10,'Lucas Brown','61 Elm Rd, Bronx, NY','718-555-0123'),(11,'Grace Park','11 Grove St, New York, NY','212-555-0198'),(12,'Henry Torres','130 Greenpoint Ave, Brooklyn, NY','718-555-0197');
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-15 15:28:22
