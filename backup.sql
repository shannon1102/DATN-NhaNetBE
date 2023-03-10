-- MariaDB dump 10.19  Distrib 10.10.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tronet
-- ------------------------------------------------------
-- Server version	10.10.2-MariaDB-1:10.10.2+maria~ubu2204

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(1000) NOT NULL,
  `updatedAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `userId` int(11) NOT NULL,
  `postId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_c0354a9a009d3bb45a08655ce3b` (`userId`),
  KEY `FK_94a85bb16d24033a2afdd5df060` (`postId`),
  CONSTRAINT `FK_94a85bb16d24033a2afdd5df060` FOREIGN KEY (`postId`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_c0354a9a009d3bb45a08655ce3b` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES
(1,'string','2023-02-23 22:23:55','2023-02-23 22:23:55',0,3,1),
(2,'Ta c┼⌐ng muß╗æn c├│ mß╗Öt giao diß╗çn thß║¡t ─æß║╣p, m├á ta code ga qua .HiuuuHiuu','2023-02-24 00:07:01','2023-02-24 00:07:01',0,3,1),
(3,'Ta c┼⌐ng muß╗æn c├│ mß╗Öt giao diß╗çn thß║¡t ─æß║╣p, m├á ta code ga qua .HiuuuHiuu','2023-02-24 00:08:25','2023-02-24 00:08:25',0,3,1),
(4,'Ta c┼⌐ng muß╗æn c├│ mß╗Öt giao diß╗çn thß║¡t ─æß║╣p, m├á ta code ga qua .HiuuuHiuu','2023-02-24 00:09:11','2023-02-24 00:09:11',0,3,1),
(5,'Ta c┼⌐ng muß╗æn c├│ mß╗Öt giao diß╗çn thß║¡t ─æß║╣p, m├á ta code ga qua .HiuuuHiuu','2023-02-24 00:09:47','2023-02-24 00:09:47',0,3,1),
(6,'Alooooo','2023-02-24 00:13:26','2023-02-24 00:13:26',0,3,1),
(7,'Alooooo','2023-02-24 00:14:19','2023-02-24 00:14:19',0,3,1),
(8,'Aa','2023-02-24 00:17:16','2023-02-24 00:17:16',0,3,1),
(9,'Aa','2023-02-24 00:17:16','2023-02-24 00:17:16',0,3,1),
(10,'Aa','2023-02-24 00:17:18','2023-02-24 00:17:18',0,3,1),
(11,'dadad','2023-02-24 00:17:25','2023-02-24 00:17:25',0,3,1),
(12,'dadad','2023-02-24 00:18:29','2023-02-24 00:18:29',0,3,1),
(13,'AERWREWR','2023-02-24 00:18:38','2023-02-24 00:18:38',0,3,1),
(14,'TEstrealtime','2023-02-24 00:19:04','2023-02-24 00:19:04',0,3,2),
(15,'TEstttttt','2023-02-24 00:29:45','2023-02-24 00:29:45',0,3,1),
(16,'TEstttttt','2023-02-24 00:31:32','2023-02-24 00:31:32',0,3,1),
(17,'ADadad','2023-02-24 00:31:55','2023-02-24 00:31:55',0,3,2),
(18,'Cuß╗æi trß╗¥i m├óy trß║»ng bay l├í v├áng th╞░a thß╗¢t qu├í Phß║úi ch─âng l├í vß╗ü rß╗½ng m├╣a thu ─æi c├╣ng l├í M├╣a thu ra biß╗ân cß║ú theo d├▓ng n╞░ß╗¢c m├¬nh m├┤ng M├╣a thu v├áo hoa c├║c chß╗ë c├▓n anh v├á em chß╗ë c├▓n anh v├á em v├áo cuß╗æi m├╣a thu c┼⌐ Chß╗ë c├▓n anh v├á em T├¼nh ta nh╞░ h├áng c├óy ─æ├ú y├¬n m├╣a b├úo gi├│ T├¼nh ta nh╞░ d├▓ng s├┤ng ─æ├ú y├¬n ng├áy th├íc l┼⌐ Thß╗¥i gian nh╞░ ngß╗ìn gi├│ m├╣a ─æi c├╣ng th├íng n─âm ├Éuß╗òi theo m├╣a ─æi m├úi chß╗ë c├▓n anh v├á em Chß╗ë c├▓n anh v├á em c├╣ng t├¼nh y├¬u ß╗ƒ lß║íi ','2023-02-24 01:04:25','2023-02-24 01:04:25',0,3,2);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) NOT NULL,
  `customerPhone` varchar(255) NOT NULL,
  `customerEmail` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation`
--

DROP TABLE IF EXISTS `conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstUserId` int(11) NOT NULL,
  `secondUserId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_98d63971b91ff0e73d5d33e27e0` (`firstUserId`),
  KEY `FK_b746aee1c31fc1e4bdcb661fc04` (`secondUserId`),
  CONSTRAINT `FK_98d63971b91ff0e73d5d33e27e0` FOREIGN KEY (`firstUserId`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_b746aee1c31fc1e4bdcb661fc04` FOREIGN KEY (`secondUserId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation`
--

LOCK TABLES `conversation` WRITE;
/*!40000 ALTER TABLE `conversation` DISABLE KEYS */;
INSERT INTO `conversation` VALUES
(1,1,2,'2023-02-23 15:50:48','2023-02-23 15:50:48'),
(2,1,3,'2023-02-23 15:50:53','2023-02-23 15:50:53'),
(3,1,4,'2023-02-23 15:51:01','2023-02-23 15:51:01');
/*!40000 ALTER TABLE `conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposit`
--

DROP TABLE IF EXISTS `deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `customerName` varchar(255) NOT NULL,
  `customerEmail` varchar(255) NOT NULL,
  `customerPhone` varchar(255) NOT NULL,
  `customerAddress` varchar(255) NOT NULL,
  `paymentMethod` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_b3f1383d11c01f2b6e63c37575b` (`userId`),
  KEY `FK_84a2fbef338d17082daa1c92e1f` (`productId`),
  CONSTRAINT `FK_84a2fbef338d17082daa1c92e1f` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_b3f1383d11c01f2b6e63c37575b` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit`
--

LOCK TABLES `deposit` WRITE;
/*!40000 ALTER TABLE `deposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `id` varchar(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `provinceId` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_23a21b38208367a242b1dd3a424` (`provinceId`),
  CONSTRAINT `FK_23a21b38208367a242b1dd3a424` FOREIGN KEY (`provinceId`) REFERENCES `province` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `updatedAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `requesterId` int(11) NOT NULL,
  `addresseeId` int(11) NOT NULL,
  `statusCode` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_77431e45d96b9c20941edf49df2` (`requesterId`),
  KEY `FK_e482969c0ef69f005533209143e` (`addresseeId`),
  CONSTRAINT `FK_77431e45d96b9c20941edf49df2` FOREIGN KEY (`requesterId`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_e482969c0ef69f005533209143e` FOREIGN KEY (`addresseeId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
INSERT INTO `friend` VALUES
(1,'2023-02-23 00:19:48','2023-02-23 00:19:48',1,1,1),
(2,'2023-02-23 00:21:05','2023-02-23 00:21:05',1,2,2),
(3,'2023-02-23 00:21:34','2023-02-23 00:21:34',1,3,2),
(4,'2023-02-23 00:22:39','2023-02-23 00:22:39',4,4,1),
(5,'2023-02-23 00:22:52','2023-02-23 00:22:52',4,1,1);
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `updatedAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  `postId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e8fb739f08d47955a39850fac23` (`userId`),
  KEY `FK_3acf7c55c319c4000e8056c1279` (`postId`),
  CONSTRAINT `FK_3acf7c55c319c4000e8056c1279` FOREIGN KEY (`postId`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_e8fb739f08d47955a39850fac23` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
INSERT INTO `like` VALUES
(10,'2023-02-24 00:50:08','2023-02-24 00:50:08',3,1),
(11,'2023-02-24 02:54:31','2023-02-24 02:54:31',3,2);
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES
(1,'uploads/1677095065313-ReactHook.png','2023-02-23 02:44:25','2023-02-23 02:44:25','image'),
(2,'uploads/1677164415937-phim-hoat-hinh-trung-quoc-11-tuyet-dai-song-kieu.jpg','2023-02-23 22:00:16','2023-02-23 22:00:16','image'),
(3,'uploads/1677167271506-Bia.png','2023-02-23 22:47:51','2023-02-23 22:47:51','image'),
(4,'uploads/1677174209405-DTN.png','2023-02-24 00:43:29','2023-02-24 00:43:29','image');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_map`
--

DROP TABLE IF EXISTS `media_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mediaId` int(11) NOT NULL,
  `targetId` int(11) NOT NULL,
  `targetType` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_b1a2381502aa251698381100763` (`mediaId`),
  CONSTRAINT `FK_b1a2381502aa251698381100763` FOREIGN KEY (`mediaId`) REFERENCES `media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_map`
--

LOCK TABLES `media_map` WRITE;
/*!40000 ALTER TABLE `media_map` DISABLE KEYS */;
INSERT INTO `media_map` VALUES
(1,2,1,'post','2023-02-23 22:00:16','2023-02-23 22:00:16'),
(2,3,2,'post','2023-02-23 22:47:52','2023-02-23 22:47:52');
/*!40000 ALTER TABLE `media_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `conversationId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_446251f8ceb2132af01b68eb593` (`userId`),
  KEY `FK_7cf4a4df1f2627f72bf6231635f` (`conversationId`),
  CONSTRAINT `FK_446251f8ceb2132af01b68eb593` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7cf4a4df1f2627f72bf6231635f` FOREIGN KEY (`conversationId`) REFERENCES `conversation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES
(1,1,'eqeqeqeq',2,'2023-02-23 15:51:14','2023-02-23 15:51:14'),
(2,1,'eewewew',2,'2023-02-23 15:51:43','2023-02-23 15:51:43'),
(3,1,'dadadda',2,'2023-02-23 16:04:14','2023-02-23 16:04:14'),
(4,1,'dsadad',2,'2023-02-23 16:06:27','2023-02-23 16:06:27'),
(5,1,'dsdsddsadada',2,'2023-02-23 16:07:33','2023-02-23 16:07:33'),
(6,1,'dadsdsadadadadadad',2,'2023-02-23 16:07:41','2023-02-23 16:07:41'),
(7,1,'999',2,'2023-02-23 16:11:53','2023-02-23 16:11:53'),
(8,1,'okilraasdasdasdasdaeds',2,'2023-02-23 16:12:02','2023-02-23 16:12:02'),
(9,1,'oklirrereewerwre',2,'2023-02-23 16:12:13','2023-02-23 16:12:13'),
(10,1,'o',2,'2023-02-23 16:12:42','2023-02-23 16:12:42'),
(11,1,'00000000000',2,'2023-02-23 16:13:08','2023-02-23 16:13:08'),
(12,1,'okilytrtetrertetr',2,'2023-02-23 16:13:17','2023-02-23 16:13:17'),
(13,1,'pppppppppppp',2,'2023-02-23 16:13:24','2023-02-23 16:13:24'),
(14,1,'',2,'2023-02-23 16:14:33','2023-02-23 16:14:33'),
(15,1,'p',2,'2023-02-23 16:14:46','2023-02-23 16:14:46'),
(16,1,'dsdsdsd',2,'2023-02-23 16:26:17','2023-02-23 16:26:17'),
(17,1,'Dcmnr sao bh nhin no xau theeeeeeeeeeeeeeeee',2,'2023-02-23 17:00:51','2023-02-23 17:00:51'),
(18,1,'/vendors~main.chunk.js:364642:29\nPrivateRoute@http://localhost:3000/static/js/main.chunk.js:21876:22\nSwitch@http://localhost:3000/static/js/vendors~main.chunk.js:364844:29\nRouter@http://localhost:3000',2,'2023-02-23 17:00:59','2023-02-23 17:00:59'),
(19,1,'Check the render method of `Messenger`. See https://reactjs.org/link/warning-keys for more information.\ndiv\nMessenger@http://localhost:3000/static/js/main.chunk.js:18898:99\nRoute@http://localhost:3000/static/js/vendors~main.chunk.js:364642:29\nPrivateRoute@http://localhost:3000/static/js/main.chunk.js:21876:22\nSwitch@http://localhost:3000/static/js/vendors~main.chunk.js:364844:29\nRouter@http://localhost:3000/static/js/vendors~main.chunk.js:364261:30\nBrowserRouter@http://localhos',2,'2023-02-23 17:01:28','2023-02-23 17:01:28'),
(20,3,'Okieeee',2,'2023-02-23 17:08:02','2023-02-23 17:08:02'),
(21,3,'?????',2,'2023-02-23 17:08:10','2023-02-23 17:08:10'),
(22,3,'Howww\n',2,'2023-02-23 17:08:20','2023-02-23 17:08:20'),
(23,1,'oiiiii',2,'2023-02-23 17:08:57','2023-02-23 17:08:57'),
(24,1,'Daayayyaysysdadasda. DMcamcmakdsalkdjlakjdklajdklajdkajkldjakldjaksjdklajdadadad',2,'2023-02-23 17:09:11','2023-02-23 17:09:11'),
(25,3,'M bi Lgaaaaaaa ad',2,'2023-02-23 17:09:21','2023-02-23 17:09:21'),
(26,3,'Dacmmmmmmmcasdadad',2,'2023-02-23 17:09:34','2023-02-23 17:09:34'),
(27,3,'Vclrtrrtrtrtrt',2,'2023-02-23 17:09:42','2023-02-23 17:09:42'),
(28,1,'>>>>>>',2,'2023-02-23 17:09:51','2023-02-23 17:09:51'),
(29,1,'',2,'2023-02-23 17:09:54','2023-02-23 17:09:54'),
(30,1,'',2,'2023-02-23 17:09:54','2023-02-23 17:09:54'),
(31,1,'',2,'2023-02-23 17:09:55','2023-02-23 17:09:55'),
(32,1,'DAdasdasdasdadaddad',2,'2023-02-23 17:09:59','2023-02-23 17:09:59'),
(33,3,'DADsdsadsadsadadadada',2,'2023-02-23 17:10:08','2023-02-23 17:10:08'),
(34,1,'dsdsdsddsdsd',2,'2023-02-23 17:15:34','2023-02-23 17:15:34'),
(35,1,'',2,'2023-02-23 17:17:07','2023-02-23 17:17:07'),
(36,1,'etertetetet',2,'2023-02-23 17:31:26','2023-02-23 17:31:26'),
(37,1,'fsdfsf',2,'2023-02-23 21:50:47','2023-02-23 21:50:47'),
(38,1,'Add one',2,'2023-02-23 21:54:44','2023-02-23 21:54:44'),
(39,3,'Reeaa',2,'2023-02-23 21:55:50','2023-02-23 21:55:50'),
(40,3,'Aaaa',2,'2023-02-23 21:57:21','2023-02-23 21:57:21'),
(41,3,'Okeeeeee',2,'2023-02-23 21:57:29','2023-02-23 21:57:29'),
(42,3,'Gafgaga',2,'2023-02-23 21:57:34','2023-02-23 21:57:34');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,1616162823072,'createUserTable1616162823072'),
(2,1635780840134,'addRoleForUser1635780840134'),
(3,1635782638797,'addDeviceIdForUser1635782638797'),
(4,1635868577004,'createMediaTable1635868577004'),
(5,1635904983149,'createProductTable1635904983149'),
(6,1636467045819,'createTableOrder1636467045819'),
(7,1636468887437,'createTableOrderItem1636468887437'),
(8,1636945309070,'alterMediaTableChangeField1636945309070'),
(9,1636945826950,'createTableMediaMap1636945826950'),
(10,1638419531964,'createTableContact1638419531964'),
(11,1640407303930,'createProvide1640407303930'),
(12,1640407330797,'createDistrict1640407330797'),
(13,1640407340969,'createWard1640407340969'),
(14,1641189089196,'createTableUserMeta1641189089196'),
(15,1641293064406,'addOrderCode1641293064406'),
(16,1673923674316,'createPostTable1673923674316'),
(17,1673924218390,'createCommentTable1673924218390'),
(18,1673924651042,'createLikeTable1673924651042'),
(19,1675653509497,'createFriendTable1675653509497'),
(20,1676968237950,'createTableDeposit1676968237950'),
(24,1676968838424,'createTableMeeting1676968838424'),
(27,1677079937971,'createConversationTable1677079937971'),
(28,1677079981667,'createMesageTable1677079981667');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `totalPrice` int(11) NOT NULL,
  `totalComparePrice` int(11) NOT NULL,
  `customerName` varchar(255) NOT NULL,
  `customerEmail` varchar(255) NOT NULL,
  `customerPhone` varchar(255) NOT NULL,
  `customerAddress` varchar(255) NOT NULL,
  `paymentMethod` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `deliveryMethod` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `code` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK_caabe91507b3379c7ba73637b84` (`userId`),
  CONSTRAINT `FK_caabe91507b3379c7ba73637b84` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `comparePrice` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_646bf9ece6f45dbe41c203e06e0` (`orderId`),
  KEY `FK_904370c093ceea4369659a3c810` (`productId`),
  CONSTRAINT `FK_646bf9ece6f45dbe41c203e06e0` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`),
  CONSTRAINT `FK_904370c093ceea4369659a3c810` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `updatedAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5c1cf55c308037b5aca1038a131` (`userId`),
  CONSTRAINT `FK_5c1cf55c308037b5aca1038a131` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES
(1,'Ph├ám l├á nam nh├ón trong thi├¬n hß║í , phß║úi c├│ v├ái c├┤ g├íi sß╗æng chß║┐t ─æß╗â muß╗æn ─æ╞░ß╗úc ß╗ƒ b├¬n','2023-02-23 22:00:16','2023-02-23 22:00:16',0,3),
(2,'Thi├¬n hß║í v├┤ song ta l├á kß║╗ ─æß╗⌐ng ─æß║ºu ','2023-02-23 22:47:52','2023-02-23 22:47:52',0,3);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `numFloors` int(11) DEFAULT NULL,
  `numBedRooms` int(11) NOT NULL DEFAULT 0,
  `squaredMeterArea` int(11) NOT NULL DEFAULT 0,
  `lengthMeter` int(11) NOT NULL DEFAULT 0,
  `widthMeter` int(11) NOT NULL DEFAULT 0,
  `featureImageId` int(11) NOT NULL,
  `certificateOfLand` int(11) NOT NULL,
  `district` varchar(255) NOT NULL,
  `ward` varchar(255) NOT NULL,
  `houseType` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `price` bigint(20) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_77800490a869025cf330026fb00` (`featureImageId`),
  KEY `FK_329b8ae12068b23da547d3b4798` (`userId`),
  CONSTRAINT `FK_329b8ae12068b23da547d3b4798` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_77800490a869025cf330026fb00` FOREIGN KEY (`featureImageId`) REFERENCES `media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `id` varchar(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `isDeleted` int(11) DEFAULT NULL,
  `avatar` int(11) DEFAULT NULL,
  `coverPicture` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(200) DEFAULT 'user',
  `deviceId` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_065d4d8f3b5adb4a08841eae3c8` (`name`),
  UNIQUE KEY `UQ_e12875dfb3b1d92d7d7c5377e22` (`email`),
  UNIQUE KEY `UQ_8e1f623798118e629b46a9e6299` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'string',NULL,NULL,NULL,NULL,1,NULL,'string','string','$2b$10$68mg81wbwqFNO2xpuSpnK.TjK19fgGsQ0fh76jYw9z9RrkHuVOaUS','user',NULL),
(2,'string1',NULL,NULL,NULL,NULL,0,NULL,'string1','string1','$2b$10$vtZmgyJa8kgM5EVdBaLmB.0WFdDpQZddBsBd8WieTwXbD5zJWyxB6','user',NULL),
(3,'string2',NULL,NULL,NULL,NULL,4,NULL,'string2','string2','$2b$10$NjOTxJH3IyqtHJPDAiwNqOShr.l6k6/CNp.HVSNptWjgKj4cX/8Ti','user',NULL),
(4,'string4',NULL,NULL,NULL,NULL,0,NULL,'string4','string4','$2b$10$g79ZYWQ83752UBRHnvE7q.VNQDAZ/czoeVBoo2b7jkfLZPZ45p70W','user',NULL),
(5,'string5',NULL,NULL,NULL,NULL,0,NULL,'string5','string5','$2b$10$rx95KVy.0EZDGw4ddZmji.sfb9bRYCrCJBNtqLeGLV7SXKajRZCnK','user',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_f6c72c83c1787aee12530dbcd05` (`userId`),
  CONSTRAINT `FK_f6c72c83c1787aee12530dbcd05` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward`
--

DROP TABLE IF EXISTS `ward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward` (
  `id` varchar(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `districtId` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_19a3bc9b3be291e8b9bc2bb623b` (`districtId`),
  CONSTRAINT `FK_19a3bc9b3be291e8b9bc2bb623b` FOREIGN KEY (`districtId`) REFERENCES `district` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward`
--

LOCK TABLES `ward` WRITE;
/*!40000 ALTER TABLE `ward` DISABLE KEYS */;
/*!40000 ALTER TABLE `ward` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-24 12:32:44
