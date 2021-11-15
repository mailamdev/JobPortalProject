-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: itjobapp_db
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add cors model',1,'add_corsmodel'),(2,'Can change cors model',1,'change_corsmodel'),(3,'Can delete cors model',1,'delete_corsmodel'),(4,'Can view cors model',1,'view_corsmodel'),(5,'Can add log entry',2,'add_logentry'),(6,'Can change log entry',2,'change_logentry'),(7,'Can delete log entry',2,'delete_logentry'),(8,'Can view log entry',2,'view_logentry'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add company',8,'add_company'),(30,'Can change company',8,'change_company'),(31,'Can delete company',8,'delete_company'),(32,'Can view company',8,'view_company'),(33,'Can add job type',9,'add_jobtype'),(34,'Can change job type',9,'change_jobtype'),(35,'Can delete job type',9,'delete_jobtype'),(36,'Can view job type',9,'view_jobtype'),(37,'Can add level',10,'add_level'),(38,'Can change level',10,'change_level'),(39,'Can delete level',10,'delete_level'),(40,'Can view level',10,'view_level'),(41,'Can add location',11,'add_location'),(42,'Can change location',11,'change_location'),(43,'Can delete location',11,'delete_location'),(44,'Can view location',11,'view_location'),(45,'Can add post',12,'add_post'),(46,'Can change post',12,'change_post'),(47,'Can delete post',12,'delete_post'),(48,'Can view post',12,'view_post'),(49,'Can add skill tag',13,'add_skilltag'),(50,'Can change skill tag',13,'change_skilltag'),(51,'Can delete skill tag',13,'delete_skilltag'),(52,'Can view skill tag',13,'view_skilltag'),(53,'Can add saved jobs',14,'add_savedjobs'),(54,'Can change saved jobs',14,'change_savedjobs'),(55,'Can delete saved jobs',14,'delete_savedjobs'),(56,'Can view saved jobs',14,'view_savedjobs'),(57,'Can add applied_ job',15,'add_applied_job'),(58,'Can change applied_ job',15,'change_applied_job'),(59,'Can delete applied_ job',15,'delete_applied_job'),(60,'Can view applied_ job',15,'view_applied_job'),(61,'Can add application',16,'add_application'),(62,'Can change application',16,'change_application'),(63,'Can delete application',16,'delete_application'),(64,'Can view application',16,'view_application'),(65,'Can add access token',17,'add_accesstoken'),(66,'Can change access token',17,'change_accesstoken'),(67,'Can delete access token',17,'delete_accesstoken'),(68,'Can view access token',17,'view_accesstoken'),(69,'Can add grant',18,'add_grant'),(70,'Can change grant',18,'change_grant'),(71,'Can delete grant',18,'delete_grant'),(72,'Can view grant',18,'view_grant'),(73,'Can add refresh token',19,'add_refreshtoken'),(74,'Can change refresh token',19,'change_refreshtoken'),(75,'Can delete refresh token',19,'delete_refreshtoken'),(76,'Can view refresh token',19,'view_refreshtoken'),(77,'Can add id token',20,'add_idtoken'),(78,'Can change id token',20,'change_idtoken'),(79,'Can delete id token',20,'delete_idtoken'),(80,'Can view id token',20,'view_idtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corsheaders_corsmodel`
--

DROP TABLE IF EXISTS `corsheaders_corsmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corsheaders_corsmodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cors` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corsheaders_corsmodel`
--

LOCK TABLES `corsheaders_corsmodel` WRITE;
/*!40000 ALTER TABLE `corsheaders_corsmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `corsheaders_corsmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_jobapp_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_jobapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapp_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-10-17 15:35:55.548462','3','tuyendungsendo',3,'',7,1),(2,'2021-10-17 15:43:23.930026','4','sendovn',3,'',7,1),(3,'2021-10-17 15:49:49.737861','5','sendovn',3,'',7,1),(4,'2021-10-17 16:10:34.975511','1','Sendo',1,'[{\"added\": {}}]',8,1),(5,'2021-10-17 16:19:14.584196','1','Thực tập sinh',1,'[{\"added\": {}}]',10,1),(6,'2021-10-17 16:19:21.213189','2','Mới tốt nghiệp',1,'[{\"added\": {}}]',10,1),(7,'2021-10-17 16:19:25.773268','3','Nhân viên',1,'[{\"added\": {}}]',10,1),(8,'2021-10-17 16:19:53.932235','4','Trưởng nhóm',1,'[{\"added\": {}}]',10,1),(9,'2021-10-17 16:20:00.952461','5','Quản lý',1,'[{\"added\": {}}]',10,1),(10,'2021-10-17 16:20:51.718534','6','Giám Đốc và Cấp Cao Hơn',1,'[{\"added\": {}}]',10,1),(11,'2021-10-17 16:21:13.207151','3','Nhân viên (Có kinh nghiệm)',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',10,1),(12,'2021-10-17 16:21:52.272257','1','Hồ Chí Minh',1,'[{\"added\": {}}]',11,1),(13,'2021-10-17 16:21:55.861067','2','Hà Nội',1,'[{\"added\": {}}]',11,1),(14,'2021-10-17 16:21:59.355856','3','Đà Nẵng',1,'[{\"added\": {}}]',11,1),(15,'2021-10-17 16:23:00.161360','4','Hải Phòng',1,'[{\"added\": {}}]',11,1),(16,'2021-10-17 16:23:06.402665','5','Cần Thơ',1,'[{\"added\": {}}]',11,1),(17,'2021-10-17 16:23:11.645555','6','Biên Hòa',1,'[{\"added\": {}}]',11,1),(18,'2021-10-17 16:23:20.448960','7','Huế',1,'[{\"added\": {}}]',11,1),(19,'2021-10-17 16:23:43.589663','6','Đồng Nai',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',11,1),(20,'2021-10-17 16:23:58.127645','8','Bình Dương',1,'[{\"added\": {}}]',11,1),(21,'2021-10-17 16:24:04.926137','9','Khác',1,'[{\"added\": {}}]',11,1),(22,'2021-10-17 16:24:19.189583','1','Toàn thời gian',1,'[{\"added\": {}}]',9,1),(23,'2021-10-17 16:24:25.652875','2','Bán thời gian',1,'[{\"added\": {}}]',9,1),(24,'2021-10-17 16:24:34.608055','3','Làm việc online',1,'[{\"added\": {}}]',9,1),(25,'2021-10-17 16:25:37.069076','1','JavaScript',1,'[{\"added\": {}}]',13,1),(26,'2021-10-17 16:25:49.677142','2','Java',1,'[{\"added\": {}}]',13,1),(27,'2021-10-17 16:26:12.464543','3','.NET',1,'[{\"added\": {}}]',13,1),(28,'2021-10-17 16:26:17.807747','4','C#',1,'[{\"added\": {}}]',13,1),(29,'2021-10-17 16:26:20.824674','5','PHP',1,'[{\"added\": {}}]',13,1),(30,'2021-10-17 16:26:23.467285','6','Python',1,'[{\"added\": {}}]',13,1),(31,'2021-10-17 16:26:26.435178','7','C++',1,'[{\"added\": {}}]',13,1),(32,'2021-10-17 16:26:29.078766','8','iOS',1,'[{\"added\": {}}]',13,1),(33,'2021-10-17 16:26:31.736220','9','Android',1,'[{\"added\": {}}]',13,1),(34,'2021-10-17 16:26:34.176814','10','Mobile',1,'[{\"added\": {}}]',13,1),(35,'2021-10-17 16:26:38.109994','11','Flutter',1,'[{\"added\": {}}]',13,1),(36,'2021-10-17 16:26:41.126276','12','React Native',1,'[{\"added\": {}}]',13,1),(37,'2021-10-17 16:26:44.118777','13','Tester',1,'[{\"added\": {}}]',13,1),(38,'2021-10-17 16:26:47.550870','14','Product Manager',1,'[{\"added\": {}}]',13,1),(39,'2021-10-17 16:26:50.801933','15','Business Analyst',1,'[{\"added\": {}}]',13,1),(40,'2021-10-17 16:26:54.003202','16','Project Manager',1,'[{\"added\": {}}]',13,1),(41,'2021-10-17 16:26:57.200108','17','System Admin',1,'[{\"added\": {}}]',13,1),(42,'2021-10-17 16:27:00.709828','18','DevOps',1,'[{\"added\": {}}]',13,1),(43,'2021-10-17 16:27:04.587021','19','System Engineer',1,'[{\"added\": {}}]',13,1),(44,'2021-10-17 16:27:08.271511','20','Data Analyst',1,'[{\"added\": {}}]',13,1),(45,'2021-10-17 16:27:11.805875','21','Game',1,'[{\"added\": {}}]',13,1),(46,'2021-10-17 16:27:22.607850','22','UI/UX Design',1,'[{\"added\": {}}]',13,1),(47,'2021-10-17 16:27:26.707767','23','Golang',1,'[{\"added\": {}}]',13,1),(48,'2021-10-17 16:27:30.408847','24','Cloud',1,'[{\"added\": {}}]',13,1),(49,'2021-10-17 16:27:36.376477','25','HTML/CSS',1,'[{\"added\": {}}]',13,1),(50,'2021-10-17 16:27:39.384614','26','Unity',1,'[{\"added\": {}}]',13,1),(51,'2021-10-17 16:27:42.820835','27','IT Security',1,'[{\"added\": {}}]',13,1),(52,'2021-10-17 16:27:46.521543','28','IT Support',1,'[{\"added\": {}}]',13,1),(53,'2021-10-17 16:27:49.259519','29','IT helpdesk',1,'[{\"added\": {}}]',13,1),(54,'2021-10-17 16:27:55.452680','30','Database',1,'[{\"added\": {}}]',13,1),(55,'2021-10-17 16:27:59.209624','31','Front-End',1,'[{\"added\": {}}]',13,1),(56,'2021-10-17 16:28:01.786553','32','Back-End',1,'[{\"added\": {}}]',13,1),(57,'2021-10-17 16:28:04.722293','33','QA QC',1,'[{\"added\": {}}]',13,1),(58,'2021-10-17 16:28:07.938582','34','NodeJS',1,'[{\"added\": {}}]',13,1),(59,'2021-10-17 16:28:10.591464','35','ReactJS',1,'[{\"added\": {}}]',13,1),(60,'2021-10-17 16:28:13.600360','36','VueJS',1,'[{\"added\": {}}]',13,1),(61,'2021-10-17 16:28:19.835692','37','Laravel',1,'[{\"added\": {}}]',13,1),(62,'2021-10-17 16:28:22.763262','38','ASP.NET',1,'[{\"added\": {}}]',13,1),(63,'2021-10-17 16:28:26.020453','39','Angular',1,'[{\"added\": {}}]',13,1),(64,'2021-10-17 16:28:29.327416','40','AngularJS',1,'[{\"added\": {}}]',13,1),(65,'2021-10-17 16:28:33.800352','41','Network',1,'[{\"added\": {}}]',13,1),(66,'2021-10-17 16:29:04.122830','24','Cloud',3,'',13,1),(67,'2021-10-17 16:31:24.093634','1','Mobile Developer (Flutter)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"post-skilltag relationship\", \"object\": \"Post_skill_tags object (2)\"}}]',12,1),(68,'2021-10-17 16:34:52.302288','2','Backend Developer (Golang/ NodeJS/.Net)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"post-skilltag relationship\", \"object\": \"Post_skill_tags object (4)\"}}, {\"added\": {\"name\": \"post-skilltag relationship\", \"object\": \"Post_skill_tags object (5)\"}}, {\"added\": {\"name\": \"post-skilltag relationship\", \"object\": \"Post_skill_tags object (6)\"}}]',12,1),(69,'2021-10-17 16:37:44.844778','3','Frontend Developer (ReactJS)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"post-skilltag relationship\", \"object\": \"Post_skill_tags object (8)\"}}, {\"added\": {\"name\": \"post-skilltag relationship\", \"object\": \"Post_skill_tags object (9)\"}}, {\"added\": {\"name\": \"post-skilltag relationship\", \"object\": \"Post_skill_tags object (10)\"}}]',12,1),(70,'2021-10-19 05:58:19.572666','7','pacomsolution',3,'',7,1),(71,'2021-10-19 05:59:16.320408','8','pacomsolution',3,'',7,1),(72,'2021-10-19 06:00:45.256801','9','pacomsolution',3,'',7,1),(73,'2021-10-19 06:01:29.233664','10','pacomsolution',3,'',7,1),(74,'2021-10-19 06:02:14.974482','11','pacomsolution',3,'',7,1),(75,'2021-10-19 06:02:33.162485','12','pacomsolution',3,'',7,1),(76,'2021-10-19 06:03:35.407562','13','pacomsolution',3,'',7,1),(77,'2021-10-19 06:04:47.132281','14','pacomsolution',3,'',7,1),(78,'2021-10-19 06:06:35.021105','15','pacomsolution',3,'',7,1),(79,'2021-10-19 07:40:32.959328','16','pacomsolution',3,'',7,1),(80,'2021-10-19 07:46:39.380991','17','pacomsolution',3,'',7,1),(81,'2021-10-19 07:50:33.786899','19','innerbus',3,'',7,1),(82,'2021-10-19 07:56:12.650656','21','tosscareer',3,'',7,1),(83,'2021-10-19 07:57:21.980246','22','tosscareer',3,'',7,1),(84,'2021-10-19 07:58:36.892332','23','tosscareer',3,'',7,1),(85,'2021-10-19 08:00:39.520583','20','innerbus',3,'',7,1),(86,'2021-10-20 07:44:13.900792','4','feeee',1,'[{\"added\": {}}]',12,1),(87,'2021-10-24 15:48:05.283694','2','VNIB Tech',2,'[{\"changed\": {\"fields\": [\"Name\", \"description\", \"Address\", \"Website\"]}}]',8,1),(88,'2021-10-24 16:09:17.667073','3','Toss (Viva Republica Vietnam)',1,'[{\"added\": {}}]',8,1),(89,'2021-10-24 16:11:52.533491','4','PACOM SOLUTIONS',1,'[{\"added\": {}}]',8,1),(90,'2021-10-24 16:15:54.657407','4','feeee',3,'',12,1),(91,'2021-10-24 17:11:13.912078','8','Bình Dương',3,'',11,1),(92,'2021-10-24 17:11:13.972083','7','Huế',3,'',11,1),(93,'2021-10-24 17:11:13.996079','6','Đồng Nai',3,'',11,1),(94,'2021-10-24 17:11:14.015078','4','Hải Phòng',3,'',11,1),(95,'2021-10-25 05:23:39.529544','5','Mobile Apps Developer (iOS/ Android)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"post-skilltag relationship\", \"object\": \"Post_skill_tags object (13)\"}}, {\"added\": {\"name\": \"post-skilltag relationship\", \"object\": \"Post_skill_tags object (14)\"}}]',12,1),(96,'2021-10-25 05:24:17.306834','5','Mobile Apps Developer (iOS/ Android)',2,'[{\"changed\": {\"fields\": [\"Location\"]}}]',12,1),(97,'2021-10-25 05:27:09.845289','6','Front-end Developer ( ReactJS, VueJS)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"post-skilltag relationship\", \"object\": \"Post_skill_tags object (16)\"}}, {\"added\": {\"name\": \"post-skilltag relationship\", \"object\": \"Post_skill_tags object (17)\"}}]',12,1),(98,'2021-10-25 05:31:53.446810','7','Full-Stack Developer',1,'[{\"added\": {}}, {\"added\": {\"name\": \"post-skilltag relationship\", \"object\": \"Post_skill_tags object (19)\"}}, {\"added\": {\"name\": \"post-skilltag relationship\", \"object\": \"Post_skill_tags object (20)\"}}, {\"added\": {\"name\": \"post-skilltag relationship\", \"object\": \"Post_skill_tags object (21)\"}}]',12,1),(99,'2021-10-25 05:34:52.436179','42','AI (Artificial Intelligence)',1,'[{\"added\": {}}]',13,1),(100,'2021-10-25 05:35:06.987602','8','AI Engineer',1,'[{\"added\": {}}, {\"added\": {\"name\": \"post-skilltag relationship\", \"object\": \"Post_skill_tags object (23)\"}}, {\"added\": {\"name\": \"post-skilltag relationship\", \"object\": \"Post_skill_tags object (24)\"}}]',12,1),(101,'2021-10-25 05:43:36.428992','26','cozwork',1,'[{\"added\": {}}]',7,1),(102,'2021-10-25 05:44:52.386606','5','CÔNG TY CỔ PHẦN COZWORK',1,'[{\"added\": {}}]',8,1),(103,'2021-10-25 05:48:02.678783','9','Internship Developer',1,'[{\"added\": {}}, {\"added\": {\"name\": \"post-skilltag relationship\", \"object\": \"Post_skill_tags object (26)\"}}]',12,1),(104,'2021-10-25 05:54:08.708263','5','CÔNG TY CỔ PHẦN COZWORK',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(105,'2021-10-25 06:29:45.662863','6','Front-end Developer ( ReactJS, VueJS)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',12,1),(106,'2021-10-25 06:44:37.976986','3','Frontend Developer (ReactJS)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',12,1),(107,'2021-11-04 05:16:21.509031','20','121',3,'',12,1),(108,'2021-11-04 05:17:04.182379','19','wefedf',3,'',12,1),(109,'2021-11-04 05:17:04.250932','18','asd',3,'',12,1),(110,'2021-11-04 05:17:04.326923','17','dwd',3,'',12,1),(111,'2021-11-04 05:17:04.377890','16','tesst',3,'',12,1),(112,'2021-11-04 05:17:04.426774','15','tesst',3,'',12,1),(113,'2021-11-04 05:17:04.476226','14','test',3,'',12,1),(114,'2021-11-04 05:17:04.524824','13','tesst',3,'',12,1),(115,'2021-11-04 05:17:04.566199','12','test',3,'',12,1),(116,'2021-11-04 05:17:04.607012','11','test',3,'',12,1),(117,'2021-11-04 05:17:04.652427','10','t4st',3,'',12,1),(118,'2021-11-04 05:49:48.038245','25','aaaaaaa',3,'',12,1),(119,'2021-11-04 05:49:48.062579','24','qqqqqqqqqq',3,'',12,1),(120,'2021-11-04 05:49:48.078874','23','âss',3,'',12,1),(121,'2021-11-04 05:49:48.100880','22','sdsd',3,'',12,1),(122,'2021-11-04 05:49:48.116893','21','âssa',3,'',12,1),(123,'2021-11-04 05:50:59.849179','26','aaaaaaa',3,'',12,1),(124,'2021-11-04 06:02:06.344213','28','DevOps Engineer',3,'',12,1),(125,'2021-11-07 07:36:19.061362','8','AI Engineer',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',12,1),(126,'2021-11-07 10:36:15.906172','2','AI Engineer',2,'[{\"changed\": {\"fields\": [\"Summary\"]}}]',15,1),(127,'2021-11-07 11:19:40.215390','31','fptsoftware',1,'[{\"added\": {}}]',7,1),(128,'2021-11-07 11:21:04.731178','8','FPT Software HCM',1,'[{\"added\": {}}]',8,1),(129,'2021-11-07 11:25:49.640550','5','Mobile Apps Developer (iOS/ Android)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',12,1),(130,'2021-11-07 11:29:04.819399','5','Mobile Apps Developer (iOS/ Android)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',12,1),(131,'2021-11-07 11:29:37.397705','5','Mobile Apps Developer (iOS/ Android)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',12,1),(132,'2021-11-07 11:32:41.433867','1','Sendo',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',8,1),(133,'2021-11-10 05:39:17.313222','33','sda',3,'',12,1),(134,'2021-11-10 05:39:28.776578','36','rqewa',3,'',7,1),(135,'2021-11-10 05:39:28.794578','35','rqew',3,'',7,1),(136,'2021-11-10 05:46:22.140557','39','gdsgs',3,'',7,1),(137,'2021-11-10 05:46:22.156547','38','gdsg',3,'',7,1),(138,'2021-11-10 05:46:22.169559','37','asa',3,'',7,1),(139,'2021-11-15 09:36:46.437281','2','AI Engineer',3,'',15,1),(140,'2021-11-15 09:38:41.900442','3','Frontend Developer (ReactJS)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',12,1),(141,'2021-11-15 09:39:19.477536','3','Frontend Developer (ReactJS)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',12,1),(142,'2021-11-15 09:41:10.997941','2','Backend Developer (Golang/ NodeJS/.Net)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',12,1),(143,'2021-11-15 09:41:52.324979','1','Mobile Developer (Flutter)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',12,1),(144,'2021-11-15 09:43:01.740918','1','Mobile Developer (Flutter)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',12,1),(145,'2021-11-15 09:43:47.101868','8','AI Engineer',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',12,1),(146,'2021-11-15 09:44:21.039453','3','Toss (Viva Republica Vietnam)',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',8,1),(147,'2021-11-15 09:44:41.749804','3','Toss (Viva Republica Vietnam)',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',8,1),(148,'2021-11-15 09:46:39.120676','7','Full-Stack Developer',2,'[{\"changed\": {\"fields\": [\"content\", \"Salary\"]}}]',12,1),(149,'2021-11-15 09:47:12.453932','4','PACOM SOLUTIONS',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',8,1),(150,'2021-11-15 09:48:20.886874','6','Front-end Developer ( ReactJS, VueJS)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',12,1),(151,'2021-11-15 09:50:24.277084','9','Internship Developer',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'admin','logentry'),(4,'auth','group'),(3,'auth','permission'),(5,'contenttypes','contenttype'),(1,'corsheaders','corsmodel'),(15,'jobapp','applied_job'),(8,'jobapp','company'),(9,'jobapp','jobtype'),(10,'jobapp','level'),(11,'jobapp','location'),(12,'jobapp','post'),(14,'jobapp','savedjobs'),(13,'jobapp','skilltag'),(7,'jobapp','user'),(17,'oauth2_provider','accesstoken'),(16,'oauth2_provider','application'),(18,'oauth2_provider','grant'),(20,'oauth2_provider','idtoken'),(19,'oauth2_provider','refreshtoken'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-10-17 09:25:34.969432'),(2,'contenttypes','0002_remove_content_type_name','2021-10-17 09:25:35.149493'),(3,'auth','0001_initial','2021-10-17 09:25:35.690227'),(4,'auth','0002_alter_permission_name_max_length','2021-10-17 09:25:35.835159'),(5,'auth','0003_alter_user_email_max_length','2021-10-17 09:25:35.848493'),(6,'auth','0004_alter_user_username_opts','2021-10-17 09:25:35.861478'),(7,'auth','0005_alter_user_last_login_null','2021-10-17 09:25:35.870545'),(8,'auth','0006_require_contenttypes_0002','2021-10-17 09:25:35.879595'),(9,'auth','0007_alter_validators_add_error_messages','2021-10-17 09:25:35.892036'),(10,'auth','0008_alter_user_username_max_length','2021-10-17 09:25:35.904023'),(11,'auth','0009_alter_user_last_name_max_length','2021-10-17 09:25:35.916048'),(12,'auth','0010_alter_group_name_max_length','2021-10-17 09:25:35.946550'),(13,'auth','0011_update_proxy_permissions','2021-10-17 09:25:35.960526'),(14,'auth','0012_alter_user_first_name_max_length','2021-10-17 09:25:35.971194'),(15,'jobapp','0001_initial','2021-10-17 09:25:38.952636'),(16,'admin','0001_initial','2021-10-17 09:25:39.203934'),(17,'admin','0002_logentry_remove_auto_add','2021-10-17 09:25:39.230027'),(18,'admin','0003_logentry_add_action_flag_choices','2021-10-17 09:25:39.245974'),(19,'corsheaders','0001_initial','2021-10-17 09:25:39.287502'),(20,'corsheaders','0002_alter_corsmodel_id','2021-10-17 09:25:39.496484'),(21,'oauth2_provider','0001_initial','2021-10-17 09:25:41.321749'),(22,'oauth2_provider','0002_auto_20190406_1805','2021-10-17 09:25:41.421040'),(23,'oauth2_provider','0003_auto_20201211_1314','2021-10-17 09:25:41.552462'),(24,'oauth2_provider','0004_auto_20200902_2022','2021-10-17 09:25:42.465186'),(25,'sessions','0001_initial','2021-10-17 09:25:42.541753'),(26,'jobapp','0002_auto_20211017_1716','2021-10-17 10:16:45.033026');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('584x8cg1o7plz90wgtqwbngc1zx99dd4','.eJxVjDsOwjAQBe_iGllZO_6Ekp4zWOvdNQ6gRIqTCnF3iJQC2jcz76USbmtNW5MljazOCtTpd8tID5l2wHecbrOmeVqXMetd0Qdt-jqzPC-H-3dQsdVvPRAFzuCd7xAtGGeHkAk8gi92sFIMxBINSQxI3AugsZFZenJifBfU-wPigTf-:1mc2XC:xFrAgif01Ll_3NMOC9vC7nx4761k_dgMJUznllpc9uE','2021-10-31 09:32:50.216413'),('e3lwukv66dz06wtk5igksvphls7ijnxy','.eJxVjDsOwjAQBe_iGllZO_6Ekp4zWOvdNQ6gRIqTCnF3iJQC2jcz76USbmtNW5MljazOCtTpd8tID5l2wHecbrOmeVqXMetd0Qdt-jqzPC-H-3dQsdVvPRAFzuCd7xAtGGeHkAk8gi92sFIMxBINSQxI3AugsZFZenJifBfU-wPigTf-:1mmYPE:LRd5wSEWWwtlDPlR4U16yAjzDw-vpyPjhKbq6UW1tac','2021-11-29 09:36:04.059499'),('xa7m3j3tlvrm447mddckcxm3wpg93paq','.eJxVjDsOwjAQBe_iGllZO_6Ekp4zWOvdNQ6gRIqTCnF3iJQC2jcz76USbmtNW5MljazOCtTpd8tID5l2wHecbrOmeVqXMetd0Qdt-jqzPC-H-3dQsdVvPRAFzuCd7xAtGGeHkAk8gi92sFIMxBINSQxI3AugsZFZenJifBfU-wPigTf-:1mhkjW:XkuwcS0lYOsZNwJJg9i10TZAwN4kPLhQbh2AfkFdGg0','2021-11-16 03:45:10.942819');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapp_applied_job`
--

DROP TABLE IF EXISTS `jobapp_applied_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapp_applied_job` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_applied` datetime(6) NOT NULL,
  `cv` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jobapp_applied_job_post_id_343f3160_fk_jobapp_post_id` (`post_id`),
  KEY `jobapp_applied_job_user_id_00ba8e2d_fk_jobapp_user_id` (`user_id`),
  CONSTRAINT `jobapp_applied_job_post_id_343f3160_fk_jobapp_post_id` FOREIGN KEY (`post_id`) REFERENCES `jobapp_post` (`id`),
  CONSTRAINT `jobapp_applied_job_user_id_00ba8e2d_fk_jobapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapp_applied_job`
--

LOCK TABLES `jobapp_applied_job` WRITE;
/*!40000 ALTER TABLE `jobapp_applied_job` DISABLE KEYS */;
INSERT INTO `jobapp_applied_job` VALUES (1,'2021-10-17 16:43:02.333406','employee/cv/thanhPham-Cv_F0VvcAF.pdf','Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. \nNemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. \nNeque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.',2,2),(3,'2021-11-04 14:50:53.944405','employee/cv/Information-Technology-Resume.pdf','I\'m a IT Specialist with over 7+ years of experience in information security and digital forensics. Expert with a wide variety of security, engineering, networking, and operating system software. Possesses an Associate Degree in Information Security and Digital Forensics.\n',27,29),(4,'2021-11-07 15:15:43.782805','employee/cv/Android-Resume.pdf','A forward-thinking developer offering more than four years of experience building, integrating, testing, and supporting Android applications for mobile and tablet devices on the Android platform seeks a position with a top technology firm.',31,2),(5,'2021-11-07 15:17:38.806666','employee/cv/Data-Scientist-Resume.pdf',' 5 years of professional experience, including 2+ years of work experience in Big Data, Hadoop Development and Ecosystem Analytics. 4+ years of professional experience with enterprise databases and data warehouse management and query languages.',30,2),(6,'2021-11-07 15:21:01.465073','employee/cv/CV_NguyenHong.pdf','Seeking a Senior Systems Engineering position with team lead responsibilities that will utilize project management and problem solving skills gained from education and extensive work experience within the computer industry.',30,29);
/*!40000 ALTER TABLE `jobapp_applied_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapp_company`
--

DROP TABLE IF EXISTS `jobapp_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapp_company` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address` (`address`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `website` (`website`),
  CONSTRAINT `jobapp_company_user_id_9ab71843_fk_jobapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapp_company`
--

LOCK TABLES `jobapp_company` WRITE;
/*!40000 ALTER TABLE `jobapp_company` DISABLE KEYS */;
INSERT INTO `jobapp_company` VALUES (1,'Sendo','<h5>C&ocirc;ng ty Cổ phần C&ocirc;ng nghệ Sen Đỏ - Đơn vị sở hữu s&agrave;n TMĐT h&agrave;ng đầu Việt Nam</h5>\r\n\r\n<p><em><strong>We are SENDO &ndash; one of biggest E-commerce companies running by the SENDO Technology Join Stock Company, has been invested by FPT, EContext Asia, BeeNext, Beenos, SBI, SoftBank, Daiwa PI Partners and SKS Ventures. Our ambition is to become the top shopping center in Vietnam in the near future.</strong></em></p>\r\n\r\n<p>Work with many latest stack technology, at backend we apply Microservice model base on RPC protocol, Pub/Sub service, base on many top softwares such as ElasticSearch, MySQL, MongoDb, Redis... at frontend we apply high fashion technologies base on PWA, Reactjs, Redux, Webpack...- A great opportunity to develop large-scale data products for a leading e-commerce marketplace with millions of visits per month</p>','company/sendo-1-w324h3242x.png','Tòa nhà FPT Tân Thuận, Lô 29B-31B-33B Tân Thuận, Phường Tân Thuận Đông, Quận 7, Thành phố Hồ Chí Min','http://careers.sendo.vn/',6),(2,'VNIB Tech','<p><strong>Communicate, Collaborate and Create value with InnerBeans</strong></p><p>Innerbus was established in Seoul, Korea in 2001. Now it is a leading supplier of advanced software and solutions, servicing global customers in Log analysis. Innerbus is using industry-standard technology platforms and delivering flexible robust solutions to our global customers.&nbsp;</p><p><strong>Our Vision, Target and Motto:</strong></p><ul><li>Vision: To provide the best log analysis service for whole world.&nbsp;<br>Target: Offer global customers with valuable information after analyzing all logs.</li><li>Motto: Success appears in sincerity, and profit comes from faithfulness.</li></ul><p>To boost its target, Innerbus is expanding its operation to foreign countries like Singapore, Thailand, and Vietnam.</p><p>In Vietnam, Innerbus was founded in 2016 in HCMC, named VNIB TECH Co. Ltd</p>','company/VNIB_qezMj33.jpg','307 Nguyễn Văn Trỗi, Phường 1, Quận Tân Bình, TP. Hồ Chí Minh','https://www.innerbeans.com/',25),(3,'Toss (Viva Republica Vietnam)','<h5><strong>Exciting Vision, Enlightening Experience</strong></h5>\r\n\r\n<p>Toss, the 1st Unicorn Fintech company in Korea with over 10 million users, is now in Vietnam! We are looking for a new member who wants to be part of Toss Vietnam. Toss provides the financial platform with many financial services, such as managing a bank account, card, lending, etc.</p>\r\n\r\n<p>Toss has partnered with CIMB Vietnam Bank to launch Toss Card by CIMB, the debit card product, and is ready to expand more financial services in Vietnam.</p>\r\n\r\n<p>We have gathered under one and only one goal, &quot;to make history in the Fintech industry.&quot; Toss has made finance easier, faster, and better in many ways: money transfer, insurance, payments, securities, and banking. We dream of the impossible and work with the team members who make the impossible possible. Toss is getting ready to change finance in Vietnam. Join the team and be part of making history.</p>','company/Toss-logo.png','Toà nhà VPBank, 89 Láng Hạ, Đống Đa, Hà Nội','https://toss.vn/',24),(4,'PACOM SOLUTIONS','<h5><strong>C&ocirc;ng ty cổ phần PACOM SOLUTIONS với tập thể l&atilde;nh đạo đam m&ecirc; v&agrave; s&aacute;ng tạo</strong></h5>\r\n\r\n<p>Đội ngũ nh&acirc;n vi&ecirc;n nhiệt huyết v&agrave; chuy&ecirc;n nghiệp, ch&uacute;ng t&ocirc;i hướng đến trở th&agrave;nh một c&ocirc;ng ty chuy&ecirc;n về giải ph&aacute;p v&agrave; c&ocirc;ng nghệ h&agrave;ng đầu tại Việt Nam. L&agrave; một c&ocirc;ng ty trẻ nhưng mỗi th&agrave;nh vi&ecirc;n của ch&uacute;ng t&ocirc;i đều đ&atilde; c&oacute; nhiều năm kinh nghiệm l&agrave;m việc trong lĩnh vực ph&aacute;t triển ứng dụng phần mềm. Ch&uacute;ng t&ocirc;i đang &aacute;p dụng c&aacute;c qui tr&igrave;nh quản l&iacute; dự &aacute;n v&agrave; quản l&iacute; chất lượng dựa tr&ecirc;n CMMI3 với mong muốn đ&aacute;p ứng tốt hơn nữa c&aacute;c y&ecirc;u cầu của kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<p>Hiện tại c&ocirc;ng ty đang c&oacute; tr&ecirc;n 20 nh&acirc;n vi&ecirc;n, chủ yếu l&agrave;m c&aacute;c ứng dụng cho app mobile v&agrave; thiết kế web site. Để c&ocirc;ng ty ng&agrave;y c&agrave;ng lớn mạnh th&igrave; ch&uacute;ng t&ocirc;i cần đến sự hợp t&aacute;c từ ph&iacute;a c&aacute;c bạn lập tr&igrave;nh vi&ecirc;n. H&atilde;y apply v&agrave;o c&ocirc;ng ty v&agrave; c&ugrave;ng ch&uacute;ng t&ocirc;i vươn xa bạn nh&eacute;.</p>','company/pacom.jpg','N04B2 khu đô thị Dịch Vọng, Cầu Giấy, Hà Nội','https://pacomsolution.com/',18),(5,'CÔNG TY CỔ PHẦN COZWORK','<p>C&ocirc;ng ty Cổ phần COZWork th&agrave;nh lập ng&agrave;y 12/02/2020 với mục ti&ecirc;u cung cấp cho kh&aacute;ch h&agrave;ng những sản phẩm, dịch vụ v&agrave; giải ph&aacute;p CNTT đ&aacute;ng tin cậy v&agrave; hiệu quả cao nhất.</p>\r\n\r\n<p>COZWork hoạt động trong lĩnh vực phần mềm, chuy&ecirc;n sản xuất, gia c&ocirc;ng c&aacute;c sản phẩm, dịch vụ phần mềm theo y&ecirc;u cầu từ ph&iacute;a kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<p>Với lực lượng c&aacute;n bộ nh&acirc;n vi&ecirc;n chuy&ecirc;n nghiệp, được đ&agrave;o tạo b&agrave;i bản v&agrave; c&oacute; nhiều kinh nghiệm hoạt động trong lĩnh vực CNTT, ch&uacute;ng t&ocirc;i lu&ocirc;n tự tin c&oacute; thể mang đến cho kh&aacute;ch h&agrave;ng sự h&agrave;i l&ograve;ng nhất th&ocirc;ng qua c&aacute;c giải ph&aacute;p, sản phẩm v&agrave; dịch vụ của ch&uacute;ng t&ocirc;i.</p>\r\n\r\n<p>&nbsp;</p>','company/cozwork.png','66 Nguyễn Bá Tuyển, P12, Q Tân Bình, TP.HCM','https://cozwork.com/',26),(6,'Titan Technology Corporation','<h4>Titan Technology is the place where we care about individuals.</h4><p>Titan Technology Corporation is a software outsourcing services company founded in 2013 by a professional team, with a big vision and mission to provide the best services to our clients.</p><p>We are delivering a leading service for global clients in various categories, committed to the highest level of customer satisfaction, contributing to the nation’s prosperity and providing to our employees with the most favorable working environment, enabling them to express their own color under Titan’s home.</p><p>We have ability to offer comprehensive knowledge, experience of various domains and industries in software development thank for our proven Engagement Models, help us not only deliver high-quality services but also minimize costs and maximize benefits for our valued clients.</p><p>With great resource of talent and long-year working experience, we confidence to broaden our client data list to other oversea markets in the upcoming year and become a leading global corporation in providing comprehensive software development.</p><p>You are welcome to become a part of our team:</p><ul><li>- Friendly and helpful team</li><li>- Comfortable working conditions</li><li>- Good career growth opportunities</li><li>- Interesting and challenging projects</li><li>- Healthy environment for self-realization and creativity</li><li>- Competitive salary, that depends on skills &amp; capabilities</li></ul>','company/Titan.jpeg','40A Lam Sơn, Phường 02, Quận Tân Bình, Thành phố Hồ Chí Minh','https://www.titancorpvn.com',27),(7,'Viettel Digital','<p><strong>1. Giới thiệu về Viettel Digital:</strong></p><p>Viettel Digital – Tổng Công ty thành viên thứ 8 của Tập đoàn Công nghiệp – Viễn thông Quân đội</p><p>Sự ra đời của Tổng Công ty nhằm tạo nền móng cho quá trình chuyển dịch số, thực hiện chiến lược phát triển của Viettel trong giai đoạn mới – giai đoạn Kiến tạo xã hội số. Từ nay tới 2025, Tổng Công ty đặt hai mục tiêu trọng tâm lớn: Có 26 triệu khách hàng trên hệ sinh thái; phát triển 600.000 điểm chấp nhận thanh toán &amp; cung cấp dịch vụ.&nbsp;</p><p><strong>Sứ mệnh của chúng tôi</strong></p><p>- Phổ cập dịch vụ số từ thành thị tới nông thôn</p><p>- Bùng nổ thanh toán số với phương thức Mobile Banking</p><p>- Là nền tảng, hạ tầng tài chính số - thương mại số</p><p>- Góp phần giữ gìn nền kinh tế nước nhà</p><p><strong>Sản phẩm của chúng tôi</strong></p><p>- Lĩnh vực tài chính số: Hệ sinh thái và ngân hàng số ViettelPay, ViettelPay Pro, Bank Plus, Mobile Money</p><p>- Lĩnh vực dịch vụ dữ liệu: Triển khai dịch vụ Digital marketing, Quảng cáo số dựa trên dữ liệu điện tử, Big data</p>','company/viettel-digital-logo.png','Tầng 44 - 45 Keangnam Landmark, Phường Mễ Trì, Quận Nam Từ Liêm, Thành phố Hà Nội','https://digital.viettel.vn/',30),(8,'FPT Software HCM','<h4><strong>The leading provider of software outsourcing services in Vietnam</strong></h4>\r\n\r\n<p>&ldquo;&nbsp;<em>FPT Software is part of FPT Corporation (FPT &ndash; HoSE) &ndash; the global leading technology, outsourcing and IT services group headquartered in Vietnam with nearly US$2 billion in revenue and more than 13,000 employees. Qualified with CMMI Level 5 &amp; ISO 27001:2013, ASPICE LEVEL 3, FPT Software delivers world-class services in Smart factory, Digital platform, RPA, AI, IoT, Enterprise Mobilization, Cloud, AR/VR, Embedded System, Managed service, Testing, Platform modernization, Business Applications, Application Service, BPO and more services globally from delivery centers across the United States, Japan, Europe, Korea, China, Australia, Vietnam and the Asia Pacific.&nbsp;</em><br />\r\n<br />\r\n<em>In 2017, FPT Software has been placed in top 10 of the ranking for three consecutive years. Among top 10, FPT Software is the only IT Company.&nbsp;</em></p>','company/fptsoft.jpg','Đường D1 Phường Tân Phú District 9 Ho Chi Minh','https://www.fpt-software.com/',31),(9,'TMA Solutions','<p><i><strong>TMA</strong></i> is the leading software outsourcing company in Vietnam with 1900 engineers. With more than 19 years of experience in providing software services for many world leading companies. We have built a strong technical and management team that can handle large and complex projects. Our people were selected from top Universities in Vietnam and overseas, and 40% of them have overseas experience.</p><p>Why Join Us?</p><p>As one of the leading IT companies in Vietnam, we value our people and always want to support our staff with all the best conditions that we can. Here come some of the featured benefits, if you want to learn more about what we are offering, let\'s join us today!</p><ul><li>Many training opportunities in Vietnam and Oversea (230+ courses in TMA Training Center and 40% have overseas experience).</li><li>Competitive benefit package (bonus, total health insurance, loan fund, team building fund ...).</li><li>Friendly environment, open culture and many outdoor activities.</li></ul>','company/a0968acc26a1c2ae214b85f53d3b8d65.jpg','Tòa nhà TMA, Công viên phần mềm Quang Trung, Phường Tân Chánh Hiệp, Quận 12, Thành phố Hồ Chí Minh','https://www.tma.vn/',40),(10,'MB Bank','<p><i><strong>Ngân Hàng TMCP Quân Đội</strong></i></p><p><strong>1. Tầm nhìn</strong><br>Trở thành một trong những ngân hàng tốt nhất Việt Nam, hướng tới vị trí trong top 3, với định vị là một ngân hàng cộng đồng, có đội ngũ nhân viên thân thiện và điểm giao dịch thuận lợi.<br><strong>2. Phương châm chiến lược</strong><br>Tăng trưởng mạnh, tạo sự khác biệt và bền vững bằng văn hóa kỷ luật, đội ngũ nhân sự tinh thông về nghiệp vụ, cam kết cao và được tổ chức khoa học.</p>','company/mbbank.png','Tòa nhà MB, số 63 Lê Văn Lương, Trung Hòa Cau Giay Ha Noi','https://mbbank.com.vn/',33);
/*!40000 ALTER TABLE `jobapp_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapp_jobtype`
--

DROP TABLE IF EXISTS `jobapp_jobtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapp_jobtype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapp_jobtype`
--

LOCK TABLES `jobapp_jobtype` WRITE;
/*!40000 ALTER TABLE `jobapp_jobtype` DISABLE KEYS */;
INSERT INTO `jobapp_jobtype` VALUES (2,'Bán thời gian'),(3,'Làm việc online'),(1,'Toàn thời gian');
/*!40000 ALTER TABLE `jobapp_jobtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapp_level`
--

DROP TABLE IF EXISTS `jobapp_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapp_level` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapp_level`
--

LOCK TABLES `jobapp_level` WRITE;
/*!40000 ALTER TABLE `jobapp_level` DISABLE KEYS */;
INSERT INTO `jobapp_level` VALUES (6,'Giám Đốc và Cấp Cao Hơn'),(2,'Mới tốt nghiệp'),(3,'Nhân viên (Có kinh nghiệm)'),(5,'Quản lý'),(1,'Thực tập sinh'),(4,'Trưởng nhóm');
/*!40000 ALTER TABLE `jobapp_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapp_location`
--

DROP TABLE IF EXISTS `jobapp_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapp_location` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapp_location`
--

LOCK TABLES `jobapp_location` WRITE;
/*!40000 ALTER TABLE `jobapp_location` DISABLE KEYS */;
INSERT INTO `jobapp_location` VALUES (5,'Cần Thơ'),(3,'Đà Nẵng'),(2,'Hà Nội'),(1,'Hồ Chí Minh'),(9,'Khác');
/*!40000 ALTER TABLE `jobapp_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapp_post`
--

DROP TABLE IF EXISTS `jobapp_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapp_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `salary` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint NOT NULL,
  `creater_id` bigint NOT NULL,
  `job_type_id` bigint NOT NULL,
  `level_id` bigint NOT NULL,
  `location_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobapp_post_company_id_2dcac9f5_fk_jobapp_company_id` (`company_id`),
  KEY `jobapp_post_creater_id_f4054227_fk_jobapp_user_id` (`creater_id`),
  KEY `jobapp_post_job_type_id_0de28d5d_fk_jobapp_jobtype_id` (`job_type_id`),
  KEY `jobapp_post_level_id_df1bb2b7_fk_jobapp_level_id` (`level_id`),
  KEY `jobapp_post_location_id_93cad625_fk_jobapp_location_id` (`location_id`),
  CONSTRAINT `jobapp_post_company_id_2dcac9f5_fk_jobapp_company_id` FOREIGN KEY (`company_id`) REFERENCES `jobapp_company` (`id`),
  CONSTRAINT `jobapp_post_creater_id_f4054227_fk_jobapp_user_id` FOREIGN KEY (`creater_id`) REFERENCES `jobapp_user` (`id`),
  CONSTRAINT `jobapp_post_job_type_id_0de28d5d_fk_jobapp_jobtype_id` FOREIGN KEY (`job_type_id`) REFERENCES `jobapp_jobtype` (`id`),
  CONSTRAINT `jobapp_post_level_id_df1bb2b7_fk_jobapp_level_id` FOREIGN KEY (`level_id`) REFERENCES `jobapp_level` (`id`),
  CONSTRAINT `jobapp_post_location_id_93cad625_fk_jobapp_location_id` FOREIGN KEY (`location_id`) REFERENCES `jobapp_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapp_post`
--

LOCK TABLES `jobapp_post` WRITE;
/*!40000 ALTER TABLE `jobapp_post` DISABLE KEYS */;
INSERT INTO `jobapp_post` VALUES (1,'Mobile Developer (Flutter)','<p><strong>Job Description</strong></p>\r\n\r\n<p>Maintain and build new functions for Sendo mobile app</p>\r\n\r\n<p>Collaborate with cross-functional inside native mobile application</p>\r\n\r\n<p>Continuously discover, evaluate, and implement new technologies to maximize development efficiency</p>\r\n\r\n<p><strong>Requirement</strong></p>\r\n\r\n<ul>\r\n	<li>Strong knowledge and at least 1 year experience mobile application development</li>\r\n	<li>A deep familiarity advance native application development with at least one of these: Android: Java - Android Studio, Gradle | iOS: Swift - xCode, Cocoapods, Objective C is a plus | Flutter: Dart</li>\r\n	<li>Good knowledge and experience with 3rd party libraries and APIs.</li>\r\n	<li>Good knowledge and experience with UI &amp; UX.</li>\r\n	<li>Strong knowledge of Client-Server Communication.&nbsp;</li>\r\n	<li>Familiarity with JSON and REST-based APIs.</li>\r\n	<li>Have published one or more apps in the Play Store or App Store is a plus</li>\r\n	<li>Have experience with React Native is a plus</li>\r\n</ul>\r\n\r\n<p><strong>Benefit</strong></p>\r\n\r\n<ul>\r\n	<li>Competitive salary and benefits including extra medical insurance.</li>\r\n	<li>13th-month salary.</li>\r\n	<li>Performance Review 2 times/year</li>\r\n	<li>Company and team-building trip every year</li>\r\n	<li>Gift on special days like birthday, Tet and Holidays</li>\r\n	<li>Many fun and meaning activities such as sport&nbsp; and social clubs</li>\r\n	<li>Opportunity to training both technical and soft skills to develop your career path</li>\r\n</ul>','2021-10-17 16:31:24.043639','2021-11-15 09:43:01.721918',1,'Thương lượng',1,6,1,3,1),(2,'Backend Developer (Golang/ NodeJS/.Net)','<p><strong>Job Description</strong></p>\r\n\r\n<p>Apply directly to ta@sendo.vn</p>\r\n\r\n<ul>\r\n	<li>Write scalable, robust, testable, efficient, and easily maintainable code.</li>\r\n	<li>Write document, review code and support technical for junior members.</li>\r\n	<li>Collaborate to R&amp;D, System, Product, Seller teams to build or maintain Sendo&rsquo;s products.</li>\r\n	<li>Working in squad Account to improve Sign in/up flow, User Authentication, Authorization, User Segmentation to help improve buyers &amp; sellers experience</li>\r\n</ul>\r\n\r\n<p><strong>Requirement</strong></p>\r\n\r\n<ul>\r\n	<li>Have knowledge in the following technologies: Linux, Docker, Kubernetes, Nginx, Git, Jenkins</li>\r\n	<li>Experience with one or more general purpose programming languages, including but not limited to: Golang (preferred)/Nodejs/PHP/.NET/Java</li>\r\n	<li>Experience working on both relational and non-relational databases (MySQL, MongoDB) and comfortable with writing and maintaining performant SQL queries.</li>\r\n	<li>Experience working on Redis for caching/speeding up apps performance.</li>\r\n	<li>Excellent working attitude, problem solving skill, critical thinking, and communication skill.</li>\r\n	<li>Previous success developing and shipping a large-scale application with a user-empathetic mindset</li>\r\n	<li>Enjoy technical challenges and are eager to explore new technologies</li>\r\n</ul>\r\n\r\n<p><strong>Benefit</strong></p>\r\n\r\n<ul>\r\n	<li>Competitive salary and benefits including extra medical insurance.</li>\r\n	<li>13th month salary</li>\r\n	<li>Attractive performance bonus</li>\r\n	<li>Opportunity to become Sendo&rsquo;s shareholder through ESOP plan</li>\r\n	<li>Annual company trips and team buildings</li>\r\n	<li>Gifts on birthday, Tet and Holidays</li>\r\n	<li>Sport and social clubs</li>\r\n	<li>Opportunities for both technical and soft skill training</li>\r\n	<li>Annual performance review for salary raise and promotion</li>\r\n</ul>','2021-10-17 16:34:52.235247','2021-11-15 09:41:10.978898',1,'Thương lượng',1,6,1,3,1),(3,'Frontend Developer (ReactJS)','<p><strong>Job Description</strong></p>\r\n\r\n<ul>\r\n	<li>Develop new user-facing features using&nbsp;<strong>Javascript and React.js</strong>.</li>\r\n	<li>Build reusable components and front-end libraries for future use.</li>\r\n	<li>Optimizing components for maximum performance across a vast array of web-capable devices and browsers.</li>\r\n	<li>Build web applications &ndash; Follow coding standards, write automated test cases, deployment scripts.</li>\r\n	<li>Assist in improving app architectures &ndash; Explore existing systems, determines areas of maintainability scalability extensibility.</li>\r\n	<li>Translate designs and style guides provided by the UI/UX team into high-performance functional user interfaces.</li>\r\n	<li>Contribute to continual improvement by suggesting new and emerging front-end technologies.</li>\r\n</ul>\r\n\r\n<p><strong>Requirement</strong></p>\r\n\r\n<ul>\r\n	<li>At least 2-year experience skilled at front-end/full-stack engineering using&nbsp;<strong>JavaScript</strong>, and&nbsp;<strong>6-month&nbsp;of experience about ReactJS</strong>. Experience in back-end development is a big advantage</li>\r\n	<li>Ability to learn new technologies is important because technologies are continuously changing.</li>\r\n	<li>Having experiences on creating your own products in ReactJS is a big plus.</li>\r\n	<li><strong>Understand &#39;Thinking in React&#39; and how ReactJS works.</strong><br />\r\n	Experience with state management: Flux/<strong>Redux</strong>. Knowledge of new Context APIs is a big plus.</li>\r\n	<li>Good understanding of&nbsp;<strong>Webpack &amp; Web Performance Optimization.</strong></li>\r\n	<li>Familiarity with RESTful APIs.</li>\r\n	<li>Fluency in HTML5 and CSS3. Familiar with CSS preprocessors: SASS/SCSS/LESS is a big plus.</li>\r\n</ul>\r\n\r\n<p><strong>Benefit</strong></p>\r\n\r\n<ul>\r\n	<li>Competitive salary and benefits including extra medical insurance.</li>\r\n	<li>13th month salary</li>\r\n	<li>Attractive performance bonus</li>\r\n	<li>Opportunity to become Sendo&rsquo;s shareholder through ESOP plan</li>\r\n	<li>Annual company trips and team buildings</li>\r\n	<li>Gifts on birthday, Tet and Holidays</li>\r\n	<li>Sport and social clubs</li>\r\n	<li>Opportunities for both technical and soft skill training</li>\r\n	<li>Annual performance review for salary raise and promotion</li>\r\n</ul>','2021-10-17 16:37:44.782775','2021-11-15 09:39:19.442537',1,'Thương lượng',1,6,1,3,1),(5,'Mobile Apps Developer (iOS/ Android)','<h5><strong>M&ocirc; tả c&ocirc;ng việc:</strong></h5>\r\n\r\n<ul>\r\n	<li>Tham gia ph&aacute;t triển ứng dụng tr&ecirc;n android hoặc iOS</li>\r\n	<li>Đọc/viết t&agrave;i liệu kỹ thuật.</li>\r\n	<li>Nghi&ecirc;n cứu nắm bắt c&ocirc;ng nghệ mới th&iacute;ch hợp để giải quyết vấn đề.L&agrave;m việc theo m&ocirc; h&igrave;nh Agile, Scrum.</li>\r\n	<li>L&agrave;m việc dưới sự l&atilde;nh đạo của Technical Architect v&agrave; b&aacute;o c&aacute;o c&ocirc;ng việc với Team Leader.</li>\r\n</ul>\r\n\r\n<h5><strong>Y&ecirc;u cầu&nbsp;chuy&ecirc;n m&ocirc;n:</strong></h5>\r\n\r\n<ul>\r\n	<li>C&oacute; kiến thức về OOP v&agrave; Design Patterns.</li>\r\n	<li>Hiểu về kiến tr&uacute;c: MVVM, MVC, MVP&hellip;</li>\r\n	<li>Biết sử dụng &iacute;t nhất một trong số c&aacute;c c&ocirc;ng cụ quản l&yacute; source code GIT, Bitbucket.</li>\r\n	<li>C&oacute; kinh nghiệm l&agrave;m việc với JIRA hoặc c&aacute;c c&ocirc;ng cụ quản l&yacute; task.</li>\r\n	<li>Quen thuộc với quy tr&igrave;nh ph&aacute;t triển bằng Agile.</li>\r\n	<li>C&oacute; sản phẩm được public tr&ecirc;n Store l&agrave; lợi thế.</li>\r\n</ul>\r\n\r\n<h5><strong>Ph&uacute;c lợi:</strong></h5>\r\n\r\n<ul>\r\n	<li>Được l&agrave;m việc trong m&ocirc;i trường chuy&ecirc;n nghiệp, năng động.</li>\r\n	<li>Được đ&agrave;o tạo c&aacute;c kỹ năng nghiệp vụ n&acirc;ng cao.</li>\r\n	<li>Thưởng sinh nh&acirc;t, thưởng c&aacute;c ng&agrave;y lễ/tết, lương cạnh tranh hấp dẫn</li>\r\n	<li>Kh&aacute;m sức khỏe định kỳ h&agrave;ng năm</li>\r\n	<li>Được đăng k&yacute; Bảo hiểm x&atilde; hội, Bảo hiểm y tế v&agrave; c&aacute;c ph&iacute; bảo hiểm kh&aacute;c đầy đủ theo quy định của ph&aacute;p luật.</li>\r\n	<li>Được tham gia c&aacute;c hoạt động teambuilding, events, company trip&hellip; của c&ocirc;ng ty.</li>\r\n	<li>Đ&atilde;i ngộ xứng đ&aacute;ng.</li>\r\n	<li>C&ocirc;ng ty l&agrave;m việc từ thứ 2 &ndash; thứ 6 ( thứ 7, CN nghỉ)</li>\r\n</ul>','2021-10-25 05:23:39.466499','2021-11-07 11:29:37.377697',1,'Thỏa Thuận',4,18,1,2,2),(6,'Front-end Developer ( ReactJS, VueJS)','<h5><strong>M&ocirc; tả c&ocirc;ng việc:</strong></h5>\r\n\r\n<ul>\r\n	<li>X&acirc;y dựng v&agrave; ph&aacute;t triển c&aacute;c dự &aacute;n.</li>\r\n	<li>Sửa lỗi v&agrave; cải thiện t&iacute;nh năng, hiệu suất của c&aacute;c hệ thống, ứng dụng.</li>\r\n	<li>Nghi&ecirc;n cứu c&aacute;c c&ocirc;ng nghệ mới để &aacute;p dụng cho c&aacute;c dự &aacute;n của kh&aacute;ch h&agrave;ng v&agrave; ứng dụng của c&ocirc;ng ty.</li>\r\n</ul>\r\n\r\n<h5><strong>Y&ecirc;u cầu c&ocirc;ng việc:</strong></h5>\r\n\r\n<ul>\r\n	<li>C&oacute; từ 2-3 năm kinh nghiệm lập tr&igrave;nh trở l&ecirc;n.</li>\r\n	<li>Th&agrave;nh thạo VueJS, NuxtJS, NextJS,...</li>\r\n	<li>C&oacute; kinh nghiệm l&agrave;m việc với cơ sở dữ liệu MySQL.</li>\r\n	<li>Biết c&aacute;ch tổ chức code, x&acirc;y dựng m&ocirc; h&igrave;nh ph&aacute;t triển dự &aacute;n l&agrave; một lợi thế.</li>\r\n</ul>\r\n\r\n<h5><strong>Y&ecirc;u cầu chung:</strong></h5>\r\n\r\n<ul>\r\n	<li>C&oacute; khả năng tự học v&agrave; cập nhật c&ocirc;ng nghệ mới.</li>\r\n	<li>C&oacute; khả năng đọc v&agrave; chỉnh sửa c&aacute;c thư viện.</li>\r\n	<li>C&oacute; kinh nghiệm l&agrave;m việc với c&aacute;c framework l&agrave; một lợi thế.</li>\r\n</ul>','2021-10-25 05:27:09.778247','2021-11-15 09:48:20.855856',1,'Up to 1,500 USD',4,18,1,3,2),(7,'Full-Stack Developer','<h5><strong>M&ocirc; tả c&ocirc;ng việc:</strong></h5>\r\n\r\n<ul>\r\n	<li>Tham gia ph&aacute;t triển c&aacute;c sản phẩm phục vụ cho h&agrave;ng trăm ngh&igrave;n kh&aacute;ch h&agrave;ng về c&aacute;c mảng T&agrave;i ch&iacute;nh kế to&aacute;n, Điều h&agrave;nh doanh nghiệp, Quản l&yacute; b&aacute;n h&agrave;ng cũng như eLearning</li>\r\n	<li>Tham gia thiết kế hệ thống, x&acirc;y dựng v&agrave; tối ưu sản phẩm đ&aacute;p ứng h&agrave;ng trăm ngh&igrave;n người sử dụng đồng thời</li>\r\n	<li>Tham gia nghi&ecirc;n cứu v&agrave; ứng dụng c&aacute;c c&ocirc;ng nghệ mới v&agrave;o sản phẩm: Blockchain, AI, Machine Learning, BigData, RPA, &hellip;</li>\r\n	<li>Phối hợp c&ugrave;ng đội ngũ BA ph&acirc;n t&iacute;ch, thiết kế, đưa ra giải ph&aacute;p để ph&aacute;t triển phần mềm đ&aacute;p ứng đ&uacute;ng, đủ c&aacute;c y&ecirc;u cầu của người d&ugrave;ng cuối.</li>\r\n	<li>Đ&agrave;o tạo chia sẻ kiến thức, kinh nghiệm n&acirc;ng cao năng lực đội ngũ</li>\r\n</ul>\r\n\r\n<h5><strong>Y&ecirc;u cầu c&ocirc;ng việc:</strong></h5>\r\n\r\n<ul>\r\n	<li>Tốt nghiệp ĐH/CĐ chuy&ecirc;n ng&agrave;nh CNTT hoặc c&aacute;c chuy&ecirc;n ng&agrave;nh li&ecirc;n quan</li>\r\n	<li>C&oacute; tối thiểu 3 năm kinh nghiệm ph&aacute;t triển c&aacute;c sản phẩm nền tảng Web với c&aacute;c c&ocirc;ng nghệ: ASP.NET, MVC, WebAPI, VueJS/Angular/ReactJS</li>\r\n	<li>C&oacute; kinh nghiệm thiết kế v&agrave; tối ưu database SQL Server, MySQL, PostgreSQL. hoặc NoSQL: MongoDB, CouchBase, Redis, RabbitMQ, &hellip;</li>\r\n	<li>C&oacute; kinh nghiệm l&agrave;m sản phẩm với kiến tr&uacute;c Micro Service, nắm vững c&aacute;c nguy&ecirc;n l&yacute; OOP, Design Pattern, SOLID</li>\r\n	<li>Ưu ti&ecirc;n ứng vi&ecirc;n th&iacute;ch l&agrave;m product, tư duy l&agrave;m sản phẩm cao, sản phẩm hướng người d&ugrave;ng cuối.</li>\r\n	<li>Giao tiếp tốt, chủ động, khả năng l&agrave;m việc nh&oacute;m tốt, kỹ năng giải quyết vấn đề tốt</li>\r\n</ul>','2021-10-25 05:31:53.381385','2021-11-15 09:46:39.098675',1,'20Tr - 35Tr VND',3,24,1,3,2),(8,'AI Engineer','<p><strong>Job Description:</strong></p>\r\n\r\n<p>VNIB Tech is a software developing company established in 2016 and located at Tan Binh district.&nbsp;</p>\r\n\r\n<p>We are a leading supplier specializing in developing Software Mobile (iOS,&nbsp; Android), Website, Platform, Testing, and System Network Management.&nbsp;</p>\r\n\r\n<p>Currently, our company is seeking three AI members for new AI Team that enjoys solving problems and willing to learn new things as follow:</p>\r\n\r\n<p><strong>Job Responsibilities:</strong></p>\r\n\r\n<ul>\r\n	<li>ML technology research required for service.&nbsp;</li>\r\n	<li>Model design and learning for rapid prototype creation and testing and service application model development.&nbsp;</li>\r\n	<li>Service module and RESTful API development.</li>\r\n</ul>\r\n\r\n<p><strong>Job Requirements:</strong></p>\r\n\r\n<ul>\r\n	<li>Those who have proactive and logical thinking skills and smooth communication.&nbsp;</li>\r\n	<li>Those who have advanced mathematical and statistical knowledge for data analysis and preprocessing.</li>\r\n	<li>Modeling and learning using deep learning frameworks (Tenserflow, Keras)&nbsp;</li>\r\n	<li>Those who have experienced an open-source application project.&nbsp;</li>\r\n	<li>Those who have experienced in recommendation system development.</li>\r\n	<li>Those who have experienced in risk and load prediction of Linux system, and development of anomaly detection models.</li>\r\n	<li>Those who can use Python and it&#39;s open-source libraries (pandas, numpy, scikit-learn, etc.).</li>\r\n	<li>Those who understand Linux and experience in using Linux.</li>\r\n</ul>','2021-10-25 05:35:06.930643','2021-11-15 09:43:47.070863',1,'Up to 1,800 USD',2,25,1,3,1),(9,'Internship Developer','<h5><strong>M&ocirc; tả c&ocirc;ng việc</strong></h5>\r\n\r\n<p>Tham gia chương tr&igrave;nh training full stack developer của c&ocirc;ng ty</p>\r\n\r\n<p>L&agrave;m project thực h&agrave;nh h&agrave;ng tuần/h&agrave;ng th&aacute;ng/tổng kết c&ugrave;ng c&aacute;c th&agrave;nh vi&ecirc;n kh&aacute;c.</p>\r\n\r\n<p>L&agrave;m quen với quy tr&igrave;nh l&agrave;m việc thực tế của c&ocirc;ng ty.</p>\r\n\r\n<h5><strong>Y&ecirc;u cầu c&ocirc;ng việc</strong></h5>\r\n\r\n<p>Kỹ sư v&agrave; cử nh&acirc;n tốt nghiệp hoặc sắp tốt nghiệp đại học c&aacute;c ng&agrave;nh CNTT</p>\r\n\r\n<p>C&oacute; kỹ năng lập tr&igrave;nh ng&ocirc;n ngữ bất kỳ</p>\r\n\r\n<p>C&oacute; khả năng l&agrave;m việc nh&oacute;m cũng như l&agrave;m việc độc lập.</p>\r\n\r\n<p>C&oacute; đam m&ecirc; với Code</p>\r\n\r\n<p>Kh&ocirc;ng y&ecirc;u cầu ng&ocirc;n ngữ cụ thể, sẵn s&agrave;ng học v&agrave; lập tr&igrave;nh ng&ocirc;n ngữ mới theo y&ecirc;u cầu dự &aacute;n (c&oacute; thời gian học ng&ocirc;n ngữ mới).</p>\r\n\r\n<p>Hiểu biết về CSS, JS, HTML. C&oacute; thể code front-end framework như VueJS, ReactJS l&agrave; một điểm cộng lớn.</p>\r\n\r\n<p>Hiểu biết về Web Service, Google Cloud. C&oacute; thể code back-end framework như Java Spring MVC, PHP,...</p>\r\n\r\n<p>Quyền lợi</p>\r\n\r\n<p>Được hỗ trợ chi ph&iacute; đi lại trong qu&aacute; tr&igrave;nh thực tập.</p>\r\n\r\n<p>C&oacute; cơ hội trở th&agrave;nh nh&acirc;n vi&ecirc;n ch&iacute;nh thức của c&ocirc;ng ty sau khi tốt nghiệp</p>\r\n\r\n<p>M&ocirc;i trường th&acirc;n thiện gần gũi</p>\r\n\r\n<p>Được training những kỹ năng cần thiết để c&oacute; thể l&agrave;m việc dự &aacute;n thực tế.</p>\r\n\r\n<p>Được Senior c&oacute; kinh nghiệm giảng vi&ecirc;n hỗ trợ, hướng dẫn l&agrave;m đồ &aacute;n tốt nghiệp, quyển b&aacute;o c&aacute;o tốt nghiệp</p>\r\n\r\n<h3>&nbsp;</h3>','2021-10-25 05:48:02.629772','2021-11-15 09:50:24.245084',1,'2,000,000 VNĐ',5,26,1,1,1),(27,'DevOps Engineer','<p><strong>Mô tả công việc:</strong></p><ul><li>Manage day to day tasks including cloud configurations, access management, integration issues and CI/CD Build/Release status.</li><li>Identify opportunities for improving security, monitoring, reliability, and scalability of our production services.</li><li>Review and improve performance system.</li><li>Work with customer support teams and project delivery teams.</li><li>Work with teams to follow good security practices and standards.</li><li>Other tasks assigned by line manager.</li><li>Daily / Weekly / On-demand report the progress and status of the assigned tasks.</li></ul><p><strong>Yêu cầu công việc:</strong></p><ul><li>Degree in System/Networking or relevant.</li><li>1+ years of DevOps Engineer.</li><li>At least 1 years of experience to work on Cloud (Azure, AWS) environment.</li><li>Good knowledge about full circle of DevOps.</li><li>Good understanding of Windows, scripting and multi-tiered architecture designs.</li><li>Good knowledge with IaC by terraform or ARM.</li><li>Good English communication and documentation.</li><li>Good at analytical and problem-solving skills.</li><li>Able to research &amp; learn new technology.</li></ul>','2021-11-04 06:01:36.017979','2021-11-04 06:01:36.043553',1,'Up to $1000',6,27,1,3,1),(29,'Automation Tester','<p><strong>Mô tả công việc:</strong></p><p>Viettel Digital đang tuyển dụng những Automation Tester đẳng cấp như sau:</p><ul><li>- Đưa ra các giải pháp/chiến lược cho kiểm thử tự động.</li></ul><p>- Lập kế hoạch kiểm thử cho team automation test.</p><p>- Đào tạo, tư vấn cho nhóm kiểm thử tự động về lựa chọn, thiết kế và cải tiến các Framework, Tool khác nhau tương ứng với các chiến lược kiểm thử cho Automation test.</p><p>- Phối hợp với team manual test để hiểu các mục tiêu của dự án, nắm được các luồng nghiệp vụ hệ thống để từ đó đánh giá và đưa ra được phạm vi cần automation test, đáp ứng được yêu cầu dự án và có tính khả thi. Từ đó, thiết kế kịch bản automation test tương ứng.</p><p>- Có khả năng đưa ra các giải pháp nhằm cải tiến, nâng cao hiệu quả của automation test trong quá trình làm việc.</p><p>- Nghiên cứu, đánh giá và cải tiến các tool automation test thường xuyên.</p><p>- Chủ động trong công việc, có mối quan hệ tốt với các thành viên khác trong nhóm.</p><p>- Báo cáo công việc, đánh giá hiệu quả của việc automation test với dự án hiện tại hàng tuần, hàng tháng cho quản lý trực tiếp</p><p><strong>Yêu cầu công việc:</strong></p><p>- Có ít nhất 02 năm kinh nghiệm kiểm thử (trong đó ít nhất 1 năm kinh nghiệm kiểm thử tự động) gồm web, app (Android, IOS).</p><p>- Có kiến thức tốt về các framework khác nhau, các phương pháp tiếp cận khác nhau trong kiểm thử tự động.</p><p>- Có kinh nghiệm trong việc xây dựng, phát triển các framework kiểm thử tự động bằng Selenium, Katalon.</p><p>- Có kiến thức tốt về các phương pháp kiểm thử phần mềm, các công cụ kiểm thử tự động và quy trình kiểm thử phần mềm.</p><p>- Thành thạo automation test, viết kịch bản với bất kì ngôn ngữ lập trình hướng đối tượng nào (Java, PHP, C#….)</p><p>- Có kinh nghiệm sử dụng các kỹ thuật kiểm thử khác nhau để viết kịch bản kiểm thử cho manual và automation test.</p><p>- Có kinh nghiệm làm việc với Agile/Scrum.</p><p>- Có kinh nghiệm acceptance test-driven development (ATDD), automated unit testing (AUT), and behavior-driven development (BDD).</p><p>- Có kiến thức tốt về SCM tools bao gồm Git, subversion.</p><p>- Có kinh nghiệm sử dụng tối thiểu 2 ngôn ngữ lập trình hướng đối tượng.</p><p>- Có kiến thức tốt về performance testing and security testing. Sử dụng thành thạo các công cụ kiểm thử hiệu năng là một lợi thế.</p><p>- Tư duy logic tốt, sáng tạo trong công việc.</p><p>- Biết quản lý công việc và thời gian hiệu quả.</p><p>- Ưu tiên tốt nghiệp đại học loại Khá trở lên, chuyên ngành Công nghệ thông tin, Kỹ sư phần mềm, Kiểm thử phần mềm. Đặc biệt ưu tiên các trường Học viện Công nghệ Bưu chính Viễn thông, Đại học Bách khoa Hà Nội,...</p>','2021-11-07 15:04:49.174491','2021-11-07 15:04:49.270615',1,'Up to 2,000 USD',7,30,1,3,2),(30,'Data Engineer','<p><strong>Mô tả công việc:</strong></p><p>Viettel Digital đang tuyển dụng những Data Engineer đẳng cấp như sau:</p><p>- Nghiên cứu và xây dựng các công nghệ lưu trữ và dữ liệu (bao gồm dữ liệu có cấu trúc, không có cấu trúc và bán cấu trúc)</p><p>- Xây dựng, duy trì và phát triển data pipeline</p><p>- Thực hiện (ETL) bằng cách thu gom, chuyển đổi và đưa dữ liệu tới Data Warehouse thông qua các công cụ như Pentaho Kettle, Talend, Inaplex Inaport</p><p>- Xây dựng và triển khai các hệ thống Ad Hoc Report, OLAP View, Chấm điểm tín dụng (Credit Scoring), hệ thống Phát hiện bất thường</p><p>- Phối hợp chặt chẽ với các phòng ban khác để thu thập dữ liệu cho doanh nghiệp, từ đó giúp cho doanh nghiệp cải thiện sản phẩm và đưa ra những quyết định nhanh chóng</p><p>- Đảm bảo chắc chắn và chính xác các dữ liệu quan trọng của doanh nghiệp</p><p>- Xác định những tài sản dữ liệu của doanh nghiệp và biết cách sử dụng các công nghệ Big Data như Hadoop Distributed File System, Spark, Hadoop ecosystem, Pig, Sqoop, Kafka, Kinesis</p><p>- Làm báo cáo số liệu theo yêu cầu</p><p><strong>Yêu cầu công việc:</strong></p><ul><li>- Có ít nhất 2 năm kinh nghiệm</li><li>- Kỹ năng nghiên cứu phân tích</li><li>- Hiểu biết về thuật toán đặc biệt các thuật toán text classification và model classification, naming recognition</li><li>- Kỹ năng tối ưu tốt ưu tiên các bạn có kinh nghiệm làm việc với các bài toán tối ưu</li><li>- Sử dụng thành thạo Python hoặc Java</li><li>- Biết sử dụng C/C++ là một lợi thế</li><li>- Biết sử dụng elasticsearch hoặc Mongodb</li><li>- Biết sử dụng redis và memcache là 1 lợi thế</li><li>- Biết sử dụng và xử lý giải pháp ngôn ngữ tự nhiên</li><li>- Ưu tiên các bạn có thành tích trong các kỳ thi lập trình như acm, olympic tin học hoặc có thành tích trong nghiên cứu khoa học</li><li>- Ưu tiên tốt nghiệp đại học loại Khá, Giỏi từ các chuyên ngành Công nghệ thông tin, Kỹ sư phần mềm, Khoa học máy tính tại các trường Đại học Bách khoa Hà Nội, Đại học Công nghệ, Học viện Công nghệ Bưu chính Viễn thông, …</li></ul>','2021-11-07 15:07:29.310226','2021-11-07 15:07:29.327909',1,'Up to 2,500 USD',7,30,1,3,2),(31,'Android Developer','<p><strong>Mô tả công việc:</strong></p><p>- Phát triển các ứng dụng mobile Fintech (Mobile Banking, Ngân hàng số, Ví điện tử) cho các đối tượng khách hàng khác nhau.</p><p>- Phối hợp với đội UI/UX xây dựng giao diện ứng dụng.</p><p>- Phối hợp các phòng ban khác để phát triển tính năng sản phẩm.</p><p>- Xây dựng Unit Tests.</p><p>- Phát triển framework cho bên khác tích hợp.</p><p>- Nghiên cứu, sử dụng và phát triển các công nghệ mới và các module cho ứng dụng.</p><p><strong>Yêu cầu công việc:</strong></p><ul><li>- Có ít nhất 2 năm kinh nghiệm xây dựng các ứng dụng Android native sử dụng ngôn ngữ Java/Kotlin.</li><li>- Có kinh nghiệm sử dụng các thư viện của Google và các third party libraries khác</li><li>- Có kinh nghiệm sử dụng Git.</li><li>- Sử dụng tốt Android Studio và các công cụ phát triển, quản lý source code, đồ hoạ.</li><li>- Có kinh nghiệm làm việc với RESTFUL API, JSON, XML.</li><li>- Có hiểu biết về OOP.</li><li>- Có hiểu biết về Design Pattern.</li><li>- Có kinh nghiệm làm việc với các ứng dụng xử lý bất đồng bộ, xử lý đa luồng, quản lý memory.</li><li>- Có kinh nghiệm làm việc với Gradle, Realm, Firebase, Fabric,…</li><li>- Có kinh nghiệm làm việc về Cloud Messaging và Analytics.</li><li>- Có kinh nghiệm phát triển framework / SDK là một lợi thế.</li><li>- Có kinh nghiệm làm việc theo mô hình Agile/Scrum.</li><li>- Có kinh nghiệm submit app lên Play Store.</li><li>- Ưu tiên tốt nghiệp đại học loại Khá trở lên, chuyên ngành Công nghệ thông tin, Kỹ sư phần mềm. Đặc biệt ưu tiên các trường Học viện Công nghệ Bưu chính Viễn thông, Đại học Bách khoa Hà Nội,...</li></ul>','2021-11-07 15:09:07.542091','2021-11-07 15:09:07.601828',1,'Up to 2,000 USD',7,30,1,3,2),(32,'Solution Architect','<p><strong>Mô tả công việc:</strong></p><ul><li>- Viettel Digital đang tìm kiếm các Solution Architect giàu kinh nghiệm chinh chiến như sau:</li><li>- Phân tích yêu cầu kỹ thuật của sản phẩm, lựa chọn công nghệ và xây dựng kiến trúc hệ thống cho sản phẩm và hệ thống nội bộ của công ty</li><li>- Đánh giá cấu trúc hệ thống hiện tại, đề xuất các giải pháp để cải thiện hệ thống, giám sát và hướng dẫn team dev thực hiện các giải - pháp đưa ra</li><li>- Phân tích yêu cầu dự án, thiết kế giải pháp cho từng dự án cụ thể</li><li>- Giải quyết các vấn đề kỹ thuật phát sinh</li><li>- Nghiên cứu các công nghệ hiện và đề xuất thay đổi khi cần thiết</li></ul><p><strong>Yêu cầu công việc:</strong></p><ul><li>- Có ít nhất 02 năm kinh nghiệm ở vị trí Solution Architect, Solution Design hoặc các vị trí tương đương, (ưu tiên kinh nghiệm thiết kế các hệ thống lớn, đặc biệt là các hệ thống tài chính)</li><li>- Sở hữu ít nhất 04 năm kinh nghiệm Software Developer (ưu tiên các Developer sử dụng ngôn ngữ Java, JavaScript)</li><li>- Yêu thích tìm hiểu công nghệ, cập nhật xu hướng công nghệ mới và có khả năng phân tích ứng dụng công nghệ trong các bài toán cụ thể</li><li>- Hiểu biết và nắm vững quy trình phát triển phần mềm</li><li>- Am hiểu các hệ điều hành và cơ sở dữ liệu khác nhau</li><li>- Ưu tiên tốt nghiệp đại học loại Khá trở lên, chuyên ngành Công nghệ thông tin, Kỹ sư phần mềm. Đặc biệt ưu tiên các trường Học viện Công nghệ Bưu chính Viễn thông, Đại học Bách khoa Hà Nội,...</li></ul>','2021-11-07 15:11:49.483669','2021-11-07 15:11:49.501326',1,'Up to 3,000 USD',7,30,1,3,2),(34,'.NET Developer','<p><strong>Mô tả:</strong></p><ul><li>- Take an active role in both client-side and server-side programming</li><li>- Develop Enterprise Web applications using Angular 6 or above</li><li>- Develop Enterprise Web applications using ASP.NET MVC</li><li>- Develop REST Web Services using ASP.NET Web API</li><li>- Develop WCF Web Services</li><li>- Develop SQL queries using Entity Framework.</li><li>- Develop in Cloud based applications/Services.</li><li>- Be a team player and actively participate in developing new features to support the business growth and maintain the existing applications.</li><li>- Actively participate in the SDLC process.</li><li>Understand the business process and deliver high Quality product with customer focus.</li></ul><p><strong>Yêu cầu công việc:</strong></p><ul><li>- Working experience in .NET Framework &amp; Web application development</li><li>- Experience in Azure Cloud (experience in Azure Func will be advantage)</li><li>- Good knowledge on design principles and best practices in implementing REST APIs</li><li>- Knowledge of HTTP REST/JSON concepts</li><li>- Technical skill HTML5, Web Service, JSON, JavaScript, AJAX, React</li><li>- Experience in SQL, MySQL</li><li>- Knowledge of XML, JSON, Framework, database and OOP concept</li><li>- Microservice</li></ul>','2021-11-10 05:51:56.307056','2021-11-10 05:51:56.333650',1,'Thương lượng',9,40,1,3,1),(35,'Technical Lead','<p><strong>Job Description</strong>:</p><p>&nbsp;We are looking for the Technical Lead who can help us to build the Web Application. The candidate is required to have experience of both hard skills (Python, Django, Knockout JS, Restful API, AWS, Docker, CICD, Linux, etc.) and soft skills (team leading).<br>He/ She needs to manage a team to deliver the software in both features and non-feature requirements (e.g. performance, scalable, maintainable, flexible, etc.). He/ she is able to do the code review and also coach train team members to raise the team’s quality.<br>Responsibilities:<br>* Drive the team of developers in creating high quality code in an agile development environment utilizing applied technology stack<br>* Lead development team to map technical requirements into architecture and technical design tasks, plan releases and deliver on commitments based on business needs<br>* Conduct review code reviews and of team members to ensure alignment with set standards and requirements<br>* Proactively identify and provide solutions to&nbsp; application code-related issues, review and provide feedback to any required final user documentation<br>* Drive and support team to release new features, troubleshoot, fix issues while the system is still running stably in good security, scalability and performance<br>* Communicate high-level technical strategy and product vision, encourage technical discussions, promote cross-functional projects, and facilitate code reviews to drive the delivery of high-quality code into production and on-time completion of projects.<br>* Promote and lead innovation of product solutions and best practices<br>* Influence the team’s success through technicalas well as people leadership skills</p><p><strong>Required skills/Experience</strong>:</p><p>&nbsp; The candidate is required to have experience of both hard skills (Python, Django, JavaScript, Knockout JS, Restful API, AWS, Docker, CICD, Linux, etc.) and soft skills (team leading).</p><p><strong>Years of experiences</strong>: 4 years</p>','2021-11-10 05:55:03.445704','2021-11-10 05:55:03.463554',1,'15-30 triệu',9,40,1,4,1),(36,'Tester Manager','<p><strong>Job Description:</strong></p><ul><li>Luôn cập nhật phương pháp hay nhất về Testing và hướng dẫn triển khai cho các team thực hiện</li><li>Thiết kế chiến lược kiểm thử và liên tục cải tiến cho quy trình Testing</li><li>Tổ chức Review các kế hoạch kiểm thử và testcase kiểm thử của các team</li><li>Phát triển đội ngũ Testing, dẫn dắt, coaching các thành viên Manual Test, Automation Test về cả kỹ thuật và kỹ năng mềm</li><li>Phối hợp chặt chẽ với Dev, BA và các CBQL, các Team Agile, PO để đảm bảo nguồn lực và chất lượng sản phẩm</li><li>Hỗ trợ tuyển dụng nhân sự Automation Test, Manual Test</li><li>Phát triển văn hóa đội ngũ</li></ul><p><strong>Your Skills and Experience:</strong></p><ul><li>Tốt nghiệp Đại học/Cao học trở lên chuyên ngành khoa học máy tính,kỹ thuật phần mềm hoặc công nghệ thông tin.</li><li>Tối thiểu 10 năm kinh nghiệm trong kiểm thử phần mềm</li><li>Kỹ năng lãnh đạo xuất sắc với ít nhất 3 năm kinh nghiệm quản lý con người</li><li>Có kinh nghiệm về Tự động hóa kiểm thử, Kiểm thử API, Kiểm tra hiệu suất , Kiểm tra di động, Kiểm tra bảo mật, Kiểm tra thâm nhập là những lợi thế rất lớn.</li><li>Kinh nghiệm làm Agile/Scrum</li></ul><p><strong>Why You\'ll Love Working Here:</strong></p><ul><li>Mức lương cạnh tranh, hấp dãn (Thưởng xếp loại thực hiện công việc 6 tháng/lần, thưởng sinh nhật ngân hàng, thưởng các ngày lễ tết trong năm…).</li><li>Chế độ phúc lợi cạnh tranh: Du lịch hàng năm, Khám sức khỏe định kì hàng năm; Gói bảo hiểm sức khỏe; Các hoạt động tri ân, chăm lo đời sống tinh thần CBNV và Thân nhân...</li><li>Môi trường làm việc chuyên nghiệp, thân thiện, cởi mở.</li><li>Được làm việc với các hệ thống hiện đại, tiên tiến nhất thị trường, áp dụng các công nghệ hàng đầu về an ninh bảo mật để đảm bảo an toàn cho người sử dụng.</li><li>Cơ hội học hỏi nghiệp vụ ngân hàng.</li></ul>','2021-11-10 06:02:39.908987','2021-11-10 06:02:39.924672',1,'Thương lượng',10,33,1,5,2);
/*!40000 ALTER TABLE `jobapp_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapp_post_skill_tags`
--

DROP TABLE IF EXISTS `jobapp_post_skill_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapp_post_skill_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `skilltag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobapp_post_skill_tags_post_id_skilltag_id_6d41900b_uniq` (`post_id`,`skilltag_id`),
  KEY `jobapp_post_skill_ta_skilltag_id_3e7afb38_fk_jobapp_sk` (`skilltag_id`),
  CONSTRAINT `jobapp_post_skill_ta_skilltag_id_3e7afb38_fk_jobapp_sk` FOREIGN KEY (`skilltag_id`) REFERENCES `jobapp_skilltag` (`id`),
  CONSTRAINT `jobapp_post_skill_tags_post_id_84017c07_fk_jobapp_post_id` FOREIGN KEY (`post_id`) REFERENCES `jobapp_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapp_post_skill_tags`
--

LOCK TABLES `jobapp_post_skill_tags` WRITE;
/*!40000 ALTER TABLE `jobapp_post_skill_tags` DISABLE KEYS */;
INSERT INTO `jobapp_post_skill_tags` VALUES (1,1,8),(2,1,11),(5,2,3),(6,2,23),(3,2,32),(4,2,34),(9,3,1),(10,3,25),(7,3,31),(8,3,35),(12,5,8),(13,5,9),(14,5,10),(15,6,31),(16,6,35),(17,6,36),(21,7,30),(19,7,35),(20,7,36),(18,7,38),(22,8,6),(23,8,39),(24,8,42),(26,9,31),(25,9,32),(36,27,18),(40,29,10),(39,29,13),(41,30,2),(42,30,6),(43,30,7),(44,30,20),(45,30,30),(47,31,2),(46,31,9),(48,31,10),(50,32,1),(49,32,2),(52,34,3),(54,34,4),(53,34,38),(58,35,1),(57,35,6),(56,35,14),(55,35,16),(59,36,13);
/*!40000 ALTER TABLE `jobapp_post_skill_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapp_savedjobs`
--

DROP TABLE IF EXISTS `jobapp_savedjobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapp_savedjobs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_saved` datetime(6) NOT NULL,
  `post_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jobapp_savedjobs_post_id_3dd9c3ed_fk_jobapp_post_id` (`post_id`),
  KEY `jobapp_savedjobs_user_id_f9c2e60e_fk_jobapp_user_id` (`user_id`),
  CONSTRAINT `jobapp_savedjobs_post_id_3dd9c3ed_fk_jobapp_post_id` FOREIGN KEY (`post_id`) REFERENCES `jobapp_post` (`id`),
  CONSTRAINT `jobapp_savedjobs_user_id_f9c2e60e_fk_jobapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapp_savedjobs`
--

LOCK TABLES `jobapp_savedjobs` WRITE;
/*!40000 ALTER TABLE `jobapp_savedjobs` DISABLE KEYS */;
INSERT INTO `jobapp_savedjobs` VALUES (2,'2021-11-04 14:51:28.327219',5,29),(3,'2021-11-07 14:52:04.156448',6,2),(4,'2021-11-07 14:52:27.512763',1,2),(5,'2021-11-07 14:52:34.841537',8,2),(6,'2021-11-15 09:40:23.690535',3,2);
/*!40000 ALTER TABLE `jobapp_savedjobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapp_skilltag`
--

DROP TABLE IF EXISTS `jobapp_skilltag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapp_skilltag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapp_skilltag`
--

LOCK TABLES `jobapp_skilltag` WRITE;
/*!40000 ALTER TABLE `jobapp_skilltag` DISABLE KEYS */;
INSERT INTO `jobapp_skilltag` VALUES (3,'.NET'),(42,'AI (Artificial Intelligence)'),(9,'Android'),(39,'Angular'),(40,'AngularJS'),(38,'ASP.NET'),(32,'Back-End'),(15,'Business Analyst'),(4,'C#'),(7,'C++'),(20,'Data Analyst'),(30,'Database'),(18,'DevOps'),(11,'Flutter'),(31,'Front-End'),(21,'Game'),(23,'Golang'),(25,'HTML/CSS'),(8,'iOS'),(29,'IT helpdesk'),(27,'IT Security'),(28,'IT Support'),(2,'Java'),(1,'JavaScript'),(37,'Laravel'),(10,'Mobile'),(41,'Network'),(34,'NodeJS'),(5,'PHP'),(14,'Product Manager'),(16,'Project Manager'),(6,'Python'),(33,'QA QC'),(12,'React Native'),(35,'ReactJS'),(17,'System Admin'),(19,'System Engineer'),(13,'Tester'),(22,'UI/UX Design'),(26,'Unity'),(36,'VueJS');
/*!40000 ALTER TABLE `jobapp_skilltag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapp_user`
--

DROP TABLE IF EXISTS `jobapp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapp_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_recruiter` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapp_user`
--

LOCK TABLES `jobapp_user` WRITE;
/*!40000 ALTER TABLE `jobapp_user` DISABLE KEYS */;
INSERT INTO `jobapp_user` VALUES (1,'pbkdf2_sha256$260000$372HdzZ1NDgELUyg3FZKfY$btW29vWlijdg6oHTYqg4SeNDZRbBWFMfg/LPLGzVDIk=','2021-11-15 09:36:03.899549',1,'admin','','','mailam2120@gmail.com',1,1,'2021-10-17 09:31:41.572239','',NULL,0),(2,'pbkdf2_sha256$260000$hnAdta1w9bDNJ1qv8Fxlx9$sk93bL0/rkv5DFJliHK7aIjznNFLRDb55ocagUjP9GY=',NULL,0,'mailam','Mai','Lâm','ltxmai221@gmail.com',0,1,'2021-10-17 11:38:11.455934','uploads/2021/11/m-logo.jpg','0981537154',0),(6,'pbkdf2_sha256$260000$Z5wdpJAE7rbJ8AL1L0HiQe$jlnAQC5Xoue4fOnmWq0Gu+T8plgJ/xOBLTIPY+d4mcQ=',NULL,0,'sendovn','Hà','Phan','ta@sendo.vn',0,1,'2021-10-17 15:50:28.481063','','02873001188',1),(18,'pbkdf2_sha256$260000$lzUfQC5k9IcqUa9SFXMHmc$zXCzNjXjFNi0he3gulqtagiho9rPOigYqB5k9cCLQyk=',NULL,0,'pacomsolution','Vy','Nguyễn','career@pacom-solution.com',0,1,'2021-10-19 07:46:43.896101','','0972097189',1),(24,'pbkdf2_sha256$260000$cTlUi10tqRFrnkmYOyhdvv$vhQ5h9TgkBY+hvCRt1UsiePSw4BDc8iq7IG7XFgn18A=',NULL,0,'tosscareer','Minh','Hoàng','recruit.vn@toss.im',0,1,'2021-10-19 07:58:40.699621','','02869370375',1),(25,'pbkdf2_sha256$260000$Ko8In0a8tbPCbAqWe1T8X0$cKjXte4ry6J26/fX51LGvNHLTdjLGPR5XDNNENfuMMc=',NULL,0,'innerbus','Linh','Hà','recruitment.vn@innerbus.com',0,1,'2021-10-19 08:00:41.989198','','02866853365',1),(26,'cozwork',NULL,0,'cozwork','Trần','Phương  Anh','hr@cozwork.com',0,1,'2021-10-25 05:41:31.000000','uploads/2021/10/4602_A.jpg',NULL,1),(27,'pbkdf2_sha256$260000$eMNjySi2r7BHEJS7AjDZ1Y$fKvHyDZ8jX1hzjEFcqjPvlHdFvymBBPMzQcOMJPsK4c=',NULL,0,'titancorp','Nhi','Hoàng','recruitment@titancorpvn.com',0,1,'2021-11-04 03:23:17.750494','','02839977233',1),(28,'pbkdf2_sha256$260000$FT1CuWO0qTOu2jFsuqgUJd$/4zCdL/ygl7Pr4hd/u5So2C46+6z3ZNH0RKa8TtcLMU=',NULL,0,'quynhnhu','Như','Quỳnh','quynhnhu@gmail.com',0,1,'2021-11-04 14:29:10.262123','','0325749634',0),(29,'pbkdf2_sha256$260000$AZF8wvqkkuM0vwsoQ292D7$ou9/OXU7K/qgY55vyiev/S6xq7eEV9dxhX6lfBHLsZo=',NULL,0,'nguyenhong','Hồng','Nguyễn','nguyenhong@gmail.com',0,1,'2021-11-04 14:33:22.474880','','0979368234',0),(30,'pbkdf2_sha256$260000$IJgIoqEmFhUggbtiF1ne0R$JcaQ98pA9SgPyHe3bLzIblYG/ivFySSg8NSFMfM0hXE=',NULL,0,'vietteldigital','Anh Thư','Phạm','Tuyendung.digital@viettel.com.vn',0,1,'2021-11-05 11:09:20.484581','','0286353451',1),(31,'fptsoftware',NULL,0,'fptsoftware','Hoàng','Hải','fhcm.contact@fsoft.com.vn',0,1,'2021-11-07 11:14:10.000000','uploads/2021/11/fptsoft.jpg','02837362333',1),(32,'pbkdf2_sha256$260000$FdOfpTRnEL8XcXlOcox4T3$jwdOLGFSgo1sdZ5/kgGJxXr68do1HyE9OOo5Plx5EmE=',NULL,0,'test','test','test','test@gmail.com',0,1,'2021-11-08 16:21:30.192569','','2313',1),(33,'pbkdf2_sha256$260000$Lo07tyNGy8VRZ6PjFBljUR$ZBbv6UAr/wTii6y6jHXiTwbbZVBFNJolCc1Z3+Smnn0=',NULL,0,'mbbank','Lâm','Dương','Tuyendung@mbbank.com.vn',0,1,'2021-11-10 04:44:14.307576','','02462777222',1),(34,'pbkdf2_sha256$260000$r3Ni91QQoAWJqfsItWRtbQ$h3bofWUl6Bw263dAoImC/Sbsq0AeKTVSCyu3qwttfCk=',NULL,0,'basevn','Phương','Nguyễn Ngọc','contact@base.vn',0,1,'2021-11-10 04:48:36.963912','','0969608159',1),(40,'pbkdf2_sha256$260000$9rbEc2l0aAfQvv9Mv4KrV5$4IVtHIOd7apobIPlctMQEsRZo9A4vjf3qbjOTig1+oE=',NULL,0,'tmasolutions','Hồng','Trần','recruit@tma.com.vn',0,1,'2021-11-10 05:48:47.287990','','tmasolutions',1);
/*!40000 ALTER TABLE `jobapp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapp_user_groups`
--

DROP TABLE IF EXISTS `jobapp_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapp_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobapp_user_groups_user_id_group_id_ca1f0803_uniq` (`user_id`,`group_id`),
  KEY `jobapp_user_groups_group_id_fb9cc9eb_fk_auth_group_id` (`group_id`),
  CONSTRAINT `jobapp_user_groups_group_id_fb9cc9eb_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `jobapp_user_groups_user_id_404b2815_fk_jobapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapp_user_groups`
--

LOCK TABLES `jobapp_user_groups` WRITE;
/*!40000 ALTER TABLE `jobapp_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobapp_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapp_user_user_permissions`
--

DROP TABLE IF EXISTS `jobapp_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapp_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobapp_user_user_permissions_user_id_permission_id_4282ccc8_uniq` (`user_id`,`permission_id`),
  KEY `jobapp_user_user_per_permission_id_e34fe5eb_fk_auth_perm` (`permission_id`),
  CONSTRAINT `jobapp_user_user_per_permission_id_e34fe5eb_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `jobapp_user_user_permissions_user_id_fc5f8b77_fk_jobapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapp_user_user_permissions`
--

LOCK TABLES `jobapp_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `jobapp_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobapp_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_jobapp_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_jobapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'XUfhjl4QLyOglh5ElxUi5hqG5IKbIv','2021-10-17 21:38:18.241143','read write',1,2,'2021-10-17 11:38:18.241143','2021-10-17 11:38:18.241143',NULL,NULL),(2,'HBGs2LOAjpl6aGOXdO7kO1UtOpDk1p','2021-10-18 02:41:47.853690','read write',1,2,'2021-10-17 16:41:47.853690','2021-10-17 16:41:47.853690',NULL,NULL),(7,'mRbXmgV0ClGnpxejdszr2M46iUGQ01','2021-10-19 17:58:41.045107','read write',1,24,'2021-10-19 07:58:41.045107','2021-10-19 07:58:41.045107',NULL,NULL),(8,'5vTc9aM1KU0A7l5WawQHAkdTax15b3','2021-10-19 18:00:42.442786','read write',1,25,'2021-10-19 08:00:42.442786','2021-10-19 08:00:42.442786',NULL,NULL),(9,'u2rO8JwZYyT6KfeBlHEtBcYCwUAWBm','2021-10-20 00:11:39.565400','read write',1,25,'2021-10-19 14:11:39.565400','2021-10-19 14:11:39.565400',NULL,NULL),(10,'cs3I183bj61PVqM0TUF1i5SZ9EzSMd','2021-10-20 01:18:21.952619','read write',1,2,'2021-10-19 15:18:21.952619','2021-10-19 15:18:21.952619',NULL,NULL),(11,'fbtD4Xj7tIfCN5fSHn88UVR7MXF6Eh','2021-10-20 01:18:50.804163','read write',1,25,'2021-10-19 15:18:50.804163','2021-10-19 15:18:50.804163',NULL,NULL),(12,'BNTlSUZA962LNXgdyZE6kdsSbarFIg','2021-10-20 01:39:34.624408','read write',1,2,'2021-10-19 15:39:34.625405','2021-10-19 15:39:34.625405',NULL,NULL),(13,'MunTtooJiCtYGirMGatjkQwfEGS6aK','2021-10-20 01:40:00.751431','read write',1,25,'2021-10-19 15:40:00.751431','2021-10-19 15:40:00.751431',NULL,NULL),(14,'ayLE2MdgpLJsswEtUOAHm5NnHUZMNk','2021-10-20 14:23:52.272033','read write',1,2,'2021-10-20 04:23:52.273498','2021-10-20 04:23:52.273498',NULL,NULL),(15,'bHeCG0wTj1wgY2KS4tgNz9KFoOui5U','2021-10-20 14:24:27.509721','read write',1,25,'2021-10-20 04:24:27.509721','2021-10-20 04:24:27.509721',NULL,NULL),(16,'bQpYMPyWraoUJuW7374OOOIRDEApDG','2021-10-20 14:32:33.084130','read write',1,2,'2021-10-20 04:32:33.084130','2021-10-20 04:32:33.084130',NULL,NULL),(17,'x0YMvhViGXJ0hUt5Bgz81UixXkIzX4','2021-10-20 14:32:55.396569','read write',1,25,'2021-10-20 04:32:55.398991','2021-10-20 04:32:55.398991',NULL,NULL),(18,'ECgrvpmRaKic6o0dqBgGQKOGMowEUM','2021-10-20 14:38:05.690855','read write',1,2,'2021-10-20 04:38:05.696533','2021-10-20 04:38:05.696533',NULL,NULL),(19,'RP56qQKqys6psIoISnBobpdVfFO50K','2021-10-20 14:38:34.662291','read write',1,2,'2021-10-20 04:38:34.662291','2021-10-20 04:38:34.662291',NULL,NULL),(20,'bmtQvIbQMlcmA8wMGLH0dDr1jYXp1b','2021-10-20 14:38:57.457088','read write',1,25,'2021-10-20 04:38:57.457586','2021-10-20 04:38:57.457586',NULL,NULL),(21,'se6XCtrIsmJbnJOMFZctppXBeaiTXd','2021-10-20 16:58:07.326710','read write',1,25,'2021-10-20 06:58:07.326710','2021-10-20 06:58:07.326710',NULL,NULL),(22,'JcCwChHMdsvImjXF7MQffjuEZGNLui','2021-10-20 23:30:55.927039','read write',1,25,'2021-10-20 13:30:55.927039','2021-10-20 13:30:55.927039',NULL,NULL),(23,'JMqMIGqcqWL71V1aN9vghEtgqKaqF6','2021-10-25 16:12:40.064869','read write',1,2,'2021-10-25 06:12:40.065869','2021-10-25 06:12:40.065869',NULL,NULL),(24,'gLAIUm6ogvSdpBsr0JTMx3uI5wrkhL','2021-10-28 16:20:04.975741','read write',1,25,'2021-10-28 06:20:04.991787','2021-10-28 06:20:04.991787',NULL,NULL),(25,'oya6VE9y7hAERPAE9uqgRUUxG6gBI5','2021-10-28 16:20:08.875846','read write',1,25,'2021-10-28 06:20:08.876788','2021-10-28 06:20:08.876788',NULL,NULL),(26,'9gqyJmX8TNOF89EhNzl5tNzWNe1htG','2021-10-29 18:51:29.882787','read write',1,25,'2021-10-29 08:51:29.882787','2021-10-29 08:51:29.882787',NULL,NULL),(27,'7vfsqj1vUUIXMiR2ssjMX4rduf0814','2021-10-29 19:23:58.634886','read write',1,2,'2021-10-29 09:23:58.634886','2021-10-29 09:23:58.634886',NULL,NULL),(28,'L2IfhF2DxgVshgj2PuK9uza5rh5vTg','2021-10-29 19:31:48.540635','read write',1,25,'2021-10-29 09:31:48.540635','2021-10-29 09:31:48.540635',NULL,NULL),(29,'3HzpgZoiheZ1IifDyy2tVWoRXw7fpL','2021-10-30 12:20:48.842651','read write',1,25,'2021-10-30 02:20:48.842651','2021-10-30 02:20:48.842651',NULL,NULL),(30,'VZ8ljIO4WmboAD01r3kvAMMeJYIkfk','2021-11-01 19:05:16.751126','read write',1,25,'2021-11-01 09:05:16.752119','2021-11-01 09:05:16.752119',NULL,NULL),(31,'VfDMDDlcLlXXfGgu7PgpH1uSMgdOqz','2021-11-02 12:29:47.146120','read write',1,25,'2021-11-02 02:29:47.146120','2021-11-02 02:29:47.146120',NULL,NULL),(32,'LExfVqn8yM06wi8NJFH8ydbxyaYyng','2021-11-02 13:48:40.248372','read write',1,25,'2021-11-02 03:48:40.249409','2021-11-02 03:48:40.249409',NULL,NULL),(33,'3UrIyL3nItg8ymM6KyNYxrYC4u566s','2021-11-02 23:13:05.520660','read write',1,25,'2021-11-02 13:13:05.520660','2021-11-02 13:13:05.520660',NULL,NULL),(34,'DXhpDdRO2OSLoD8GjmiqV6VbFQXpOb','2021-11-03 16:36:23.162293','read write',1,2,'2021-11-03 06:36:23.162293','2021-11-03 06:36:23.162293',NULL,NULL),(35,'DSrl24bFau3kk2sadkdgTkHPlnV4b7','2021-11-03 16:37:04.066073','read write',1,25,'2021-11-03 06:37:04.066073','2021-11-03 06:37:04.066073',NULL,NULL),(36,'8G6M0gie58ccAr4B1rEcaxQZbLmsq4','2021-11-03 17:19:29.986874','read write',1,25,'2021-11-03 07:19:29.987883','2021-11-03 07:19:29.987883',NULL,NULL),(37,'1q8lxFegzqVfMHoivWHnrKbxC3HQf9','2021-11-04 01:21:14.099360','read write',1,25,'2021-11-03 15:21:14.099360','2021-11-03 15:21:14.099360',NULL,NULL),(38,'27v1D1TnVRbqjcSbtIDgJsQ7fyxtg4','2021-11-04 13:23:18.571559','read write',1,27,'2021-11-04 03:23:18.571559','2021-11-04 03:23:18.571559',NULL,NULL),(39,'WA2ZOnJyuUWXIk3eMbMXFp9oh2Rpqb','2021-11-04 13:26:25.371392','read write',1,27,'2021-11-04 03:26:25.371392','2021-11-04 03:26:25.371392',NULL,NULL),(40,'BRlFA9XhF53M0ONYiOZ7N5dWwInmRy','2021-11-04 18:09:15.237798','read write',1,25,'2021-11-04 08:09:15.237798','2021-11-04 08:09:15.237798',NULL,NULL),(41,'8KqLXBV3xPlCfkGv4pZ0GMRWjjX12J','2021-11-04 18:51:23.997292','read write',1,6,'2021-11-04 08:51:23.997292','2021-11-04 08:51:23.997292',NULL,NULL),(42,'pBzYqFp9yZIOPv6wFfaN5bnisi5zZX','2021-11-05 00:33:48.360158','read write',1,29,'2021-11-04 14:33:48.360158','2021-11-04 14:33:48.360158',NULL,NULL),(43,'jklGMILokSXL8E3VDA4BsISJcYTVoS','2021-11-05 00:52:43.259888','read write',1,27,'2021-11-04 14:52:43.259888','2021-11-04 14:52:43.259888',NULL,NULL),(44,'WUcNPmRzh4bLiH1JBbQodn8fMSYlt8','2021-11-05 17:13:28.054499','read write',1,2,'2021-11-05 07:13:28.054499','2021-11-05 07:13:28.054499',NULL,NULL),(45,'eg4NqEJR39YE5sBCMQuHSpfpkLvPWW','2021-11-05 21:09:20.881002','read write',1,30,'2021-11-05 11:09:20.881002','2021-11-05 11:09:20.881002',NULL,NULL),(46,'djtSgqZIVY99765BIt6eCHgoQnJ6xi','2021-11-05 21:15:05.018095','read write',1,30,'2021-11-05 11:15:05.018095','2021-11-05 11:15:05.018095',NULL,NULL),(47,'iSMH4HbTnwH05GM7cG1IfFVUE2h5nH','2021-11-07 12:29:18.201352','read write',1,2,'2021-11-07 02:29:18.201352','2021-11-07 02:29:18.201352',NULL,NULL),(48,'cgaFze6YwQ6jAnqIaF5gtxUoWMiE0H','2021-11-07 14:03:25.162147','read write',1,25,'2021-11-07 04:03:25.162147','2021-11-07 04:03:25.162147',NULL,NULL),(49,'LKuQUHbJFEl51az3j26DR8HiQgCv5m','2021-11-07 20:05:31.865166','read write',1,25,'2021-11-07 10:05:31.866128','2021-11-07 10:05:31.866128',NULL,NULL),(50,'a56VQgODowVomS7akOJKdr3IvH7phw','2021-11-07 21:24:14.522202','read write',1,2,'2021-11-07 11:24:14.522202','2021-11-07 11:24:14.522202',NULL,NULL),(51,'bMridXdAs06VVXOpB8DXixJemfK4Ye','2021-11-08 00:35:48.902760','read write',1,2,'2021-11-07 14:35:48.902760','2021-11-07 14:35:48.902760',NULL,NULL),(52,'PYbcEhHJUzcYXWfhIZo1hDcrKO0kgO','2021-11-08 00:56:00.269063','read write',1,30,'2021-11-07 14:56:00.269063','2021-11-07 14:56:00.269063',NULL,NULL),(53,'O2PhhcQQdl6k0g5UNL012rL1T3fnbX','2021-11-08 01:14:00.481825','read write',1,2,'2021-11-07 15:14:00.482271','2021-11-07 15:14:00.482271',NULL,NULL),(54,'6PFRzRItRAqSgPzDnuynUz3xRbRyME','2021-11-08 01:18:20.028013','read write',1,29,'2021-11-07 15:18:20.028389','2021-11-07 15:18:20.028542',NULL,NULL),(55,'7gDxDXe97kUlm8vKjmIZEISciIxCIl','2021-11-08 01:21:15.023916','read write',1,30,'2021-11-07 15:21:15.023916','2021-11-07 15:21:15.023916',NULL,NULL),(56,'glANlwgEofCSZ3IoJeXuQf4J9WilYL','2021-11-08 01:46:07.021159','read write',1,2,'2021-11-07 15:46:07.021159','2021-11-07 15:46:07.021159',NULL,NULL),(57,'wp9gdNPY35IEK14ythl1JT0SgBuAM1','2021-11-08 13:20:33.250756','read write',1,30,'2021-11-08 03:20:33.250756','2021-11-08 03:20:33.250756',NULL,NULL),(58,'vMrQwooemlX6C1HbeByrJoZsStcwgn','2021-11-09 01:43:07.425637','read write',1,25,'2021-11-08 15:43:07.425637','2021-11-08 15:43:07.425637',NULL,NULL),(59,'yZUWXWLkbL4jKon3sZRiGUyv6aSntW','2021-11-09 01:43:45.204962','read write',1,25,'2021-11-08 15:43:45.205930','2021-11-08 15:43:45.205930',NULL,NULL),(60,'6AChioGa9EOLCom5t4IW0sbFPr72rP','2021-11-09 01:50:33.698669','read write',1,2,'2021-11-08 15:50:33.698669','2021-11-08 15:50:33.698669',NULL,NULL),(61,'Mk20fK4qKLjPWOU6jqVZ3z9O6wZVEt','2021-11-09 02:00:12.918851','read write',1,25,'2021-11-08 16:00:12.918851','2021-11-08 16:00:12.918851',NULL,NULL),(62,'vZhkONE61Yn0SPoJL2qBHvHG3A9mVV','2021-11-09 02:21:30.608821','read write',1,32,'2021-11-08 16:21:30.608821','2021-11-08 16:21:30.608821',NULL,NULL),(63,'u1n8FsDArVZk1CSGLvtJZD7bep9HF8','2021-11-09 15:02:09.922480','read write',1,25,'2021-11-09 05:02:09.922480','2021-11-09 05:02:09.922480',NULL,NULL),(64,'FSJdV8H1xmacFd5wSPE2kbYc2QQDi6','2021-11-09 18:25:59.264645','read write',1,2,'2021-11-09 08:25:59.265681','2021-11-09 08:25:59.265681',NULL,NULL),(65,'2yONfVIviug64kJCf55csXoVfLU4eE','2021-11-10 13:09:40.992272','read write',1,25,'2021-11-10 03:09:40.994261','2021-11-10 03:09:40.994261',NULL,NULL),(66,'Uk7JdHZgvJp7GtoQG8rAUmCxRKiU7d','2021-11-10 13:32:53.154045','read write',1,2,'2021-11-10 03:32:53.154045','2021-11-10 03:32:53.154045',NULL,NULL),(67,'aixd9obCVOQA0xFChO8x9ivppNcggI','2021-11-10 13:35:50.460354','read write',1,30,'2021-11-10 03:35:50.460354','2021-11-10 03:35:50.460354',NULL,NULL),(68,'R6dDPtqvjkxvKv8gNgc6nJhPX4DrYQ','2021-11-10 14:32:32.786456','read write',1,30,'2021-11-10 04:32:32.786456','2021-11-10 04:32:32.786456',NULL,NULL),(70,'N19h8D1l7lyn9BK0CrEzAAdUq0xp5f','2021-11-10 15:48:47.656095','read write',1,40,'2021-11-10 05:48:47.656095','2021-11-10 05:48:47.656095',NULL,NULL),(71,'RJeipqBcmzWUjLg8lCPWeaZm1RuCzo','2021-11-10 15:50:21.482497','read write',1,40,'2021-11-10 05:50:21.482497','2021-11-10 05:50:21.482497',NULL,NULL),(72,'XHv4569jEeSaMWk1aFHcECqIS20RgJ','2021-11-10 15:56:46.505207','read write',1,33,'2021-11-10 05:56:46.505207','2021-11-10 05:56:46.505207',NULL,NULL),(73,'M7IyiiWvcg8xyEA3QffMTNZQ7X5UNO','2021-11-10 16:06:19.043557','read write',1,2,'2021-11-10 06:06:19.043557','2021-11-10 06:06:19.043557',NULL,NULL),(74,'faWVN4reoijzoXWRMXSpbFJI6xIn50','2021-11-10 16:24:55.268168','read write',1,30,'2021-11-10 06:24:55.269170','2021-11-10 06:24:55.269170',NULL,NULL),(75,'Sl2pL9J1psNDd8npq02CCGqWt04iKk','2021-11-15 19:37:16.485497','read write',1,2,'2021-11-15 09:37:16.485497','2021-11-15 09:37:16.485497',NULL,NULL),(76,'Xkx9c3vEYnUlwQkRHPZlX1L5qDcENA','2021-11-15 19:53:49.269400','read write',1,40,'2021-11-15 09:53:49.269400','2021-11-15 09:53:49.269400',NULL,NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_user_id_79829054_fk_jobapp_user_id` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_jobapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'69UZSOykjMDZ9s3h8gmsxEMpu64QPBP0vR6Nd0gj','','confidential','password','XrP7fYCcoVf3BA4ji18iH3ewUMptZOYvQdsztmG9JsZx8bbGO6P5OTOCfsbtsjrmboucQV0DbUWILvh4gT8yG71dg1urPrFnQd7rtuiBLGGcNTDyqZWk1peAHHXyNsBL','ITJobApp',1,0,'2021-10-17 09:43:20.328514','2021-10-17 09:43:20.328514','');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `claims` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_jobapp_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_jobapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idtoken_user_id_dd512b59_fk_jobapp_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idtoken_user_id_dd512b59_fk_jobapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_jobapp_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_jobapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'dEKFYLe8de1EhYhANTw2FBSnD9ClLT',1,1,2,'2021-10-17 11:38:18.288073','2021-10-17 11:38:18.288073',NULL),(2,'zR0CZFLHkyf8r3FaZmF775SQXgKgVK',2,1,2,'2021-10-17 16:41:47.875698','2021-10-17 16:41:47.875698',NULL),(7,'75WO8ukxPB8Kj3RzrDZjVT4WpExDLy',7,1,24,'2021-10-19 07:58:41.058309','2021-10-19 07:58:41.058309',NULL),(8,'VQydPkmZty8AJtybmkyx2fmyCZ5Xbw',8,1,25,'2021-10-19 08:00:42.456877','2021-10-19 08:00:42.456877',NULL),(9,'hIJHN4KTrCPlGSuBWLTLRqZRvmi7Rt',9,1,25,'2021-10-19 14:11:39.593414','2021-10-19 14:11:39.593414',NULL),(10,'hlFDRG6dRzEar6iwC4N0ZM5E3JCyOF',10,1,2,'2021-10-19 15:18:21.995333','2021-10-19 15:18:21.995333',NULL),(11,'rG4a4xfouIaTXA4mBayXExhJbGLlqk',11,1,25,'2021-10-19 15:18:50.817191','2021-10-19 15:18:50.817191',NULL),(12,'wjqsfSQZyzvbDJHu3Bf66aWbzarjDc',12,1,2,'2021-10-19 15:39:34.639421','2021-10-19 15:39:34.639421',NULL),(13,'oSyLBA3iwL3e5ls9gq5vS1JNcVdUuC',13,1,25,'2021-10-19 15:40:00.775405','2021-10-19 15:40:00.775405',NULL),(14,'bPpARH763XNTJsOzTjps9ZYpWMZvWN',14,1,2,'2021-10-20 04:23:52.362351','2021-10-20 04:23:52.362351',NULL),(15,'QT1ZzR1pQ90TXgKkRUc50S3of4Y22a',15,1,25,'2021-10-20 04:24:27.562597','2021-10-20 04:24:27.562597',NULL),(16,'Zw162BlCA8uug2auv5eXGGEidbj5rh',16,1,2,'2021-10-20 04:32:33.210811','2021-10-20 04:32:33.210811',NULL),(17,'nM9wmSoPCXW5dVecDMMhruDdKp2uIy',17,1,25,'2021-10-20 04:32:55.432417','2021-10-20 04:32:55.432417',NULL),(18,'s3dB18HQGq8GgE2CexzL4oyjtL6tJA',18,1,2,'2021-10-20 04:38:05.774497','2021-10-20 04:38:05.774497',NULL),(19,'hMayIYsXkK0yzPsMwotikwDZtdhcbn',19,1,2,'2021-10-20 04:38:34.745535','2021-10-20 04:38:34.745535',NULL),(20,'ZRlM6xAuQVQMfeGHxPfxwMbZ6QrxTp',20,1,25,'2021-10-20 04:38:57.536288','2021-10-20 04:38:57.536288',NULL),(21,'noyBZ9JtsKkWhuGmDNS5vDO7g2qHz3',21,1,25,'2021-10-20 06:58:07.357978','2021-10-20 06:58:07.357978',NULL),(22,'5wELvPN9qgfctAdp0ovh3pbgvVD3LE',22,1,25,'2021-10-20 13:30:55.973921','2021-10-20 13:30:55.973921',NULL),(23,'cuUnK46I2mS4CuLYGXWsgN2TPCfbod',23,1,2,'2021-10-25 06:12:40.107871','2021-10-25 06:12:40.107871',NULL),(24,'4xI8xWAEiR6OSgvp6A4Duivuy568ug',24,1,25,'2021-10-28 06:20:05.138718','2021-10-28 06:20:05.138718',NULL),(25,'jx8XAkUQEqfHrD63JKn0IYVvmUF2eB',25,1,25,'2021-10-28 06:20:09.217668','2021-10-28 06:20:09.217668',NULL),(26,'ijLnOMlkz7k35utNcvzjWBD7VUmF3D',26,1,25,'2021-10-29 08:51:29.941047','2021-10-29 08:51:29.941047',NULL),(27,'lnTogtxTNjSK2SpMfYkiEEj1lgsJlC',27,1,2,'2021-10-29 09:23:58.657885','2021-10-29 09:23:58.657885',NULL),(28,'Q0O0QalBBhN56Wne5qp4H7RUMm4MLj',28,1,25,'2021-10-29 09:31:48.554636','2021-10-29 09:31:48.554636',NULL),(29,'TVJVU5rciiuwN5pj7YWpLcOV4GSi9P',29,1,25,'2021-10-30 02:20:48.933470','2021-10-30 02:20:48.933470',NULL),(30,'GmEo3QuZbXS23EpJmNCX0BMCgU1uOu',30,1,25,'2021-11-01 09:05:16.831835','2021-11-01 09:05:16.831835',NULL),(31,'oW8CD7hSwDyqu08zURm8Gwkw4jC7dq',31,1,25,'2021-11-02 02:29:47.210051','2021-11-02 02:29:47.210051',NULL),(32,'1ZibHRLecPwpAuKBJo9fw7j333Bamd',32,1,25,'2021-11-02 03:48:40.273457','2021-11-02 03:48:40.273457',NULL),(33,'1O8dFIEBb5pqPphklAUMLnGkTJsBWr',33,1,25,'2021-11-02 13:13:05.665820','2021-11-02 13:13:05.665820',NULL),(34,'GY3La4vaUyHynFYeKlJN52j81nFue1',34,1,2,'2021-11-03 06:36:23.209168','2021-11-03 06:36:23.209168',NULL),(35,'zPnqrrKJd95G3iUxzq7EseyR82E5YG',35,1,25,'2021-11-03 06:37:04.085353','2021-11-03 06:37:04.085353',NULL),(36,'IAdBy88Uu4ETtOjCVrGysQn6ZsZYyp',36,1,25,'2021-11-03 07:19:30.008952','2021-11-03 07:19:30.008952',NULL),(37,'WQ16mJlUgPaLXFPp7JrHtiEJA26h0Z',37,1,25,'2021-11-03 15:21:14.162793','2021-11-03 15:21:14.162793',NULL),(38,'Vf0xuiBhZLtANPYH9ryx5EXwkqvBPm',38,1,27,'2021-11-04 03:23:18.625079','2021-11-04 03:23:18.625079',NULL),(39,'Y5cV5mKJOFShKZ2lokuSfCfS607bYJ',39,1,27,'2021-11-04 03:26:25.389599','2021-11-04 03:26:25.389599',NULL),(40,'e0bcwEKafewCUhgDIXp6QRAE0DyMnS',40,1,25,'2021-11-04 08:09:15.285808','2021-11-04 08:09:15.285808',NULL),(41,'05ldYbOp160KlmZ1zUh5rLBU3n6ATG',41,1,6,'2021-11-04 08:51:24.014295','2021-11-04 08:51:24.014295',NULL),(42,'SkpeUGvDDrmB03kXW15RkevIoYR3k1',42,1,29,'2021-11-04 14:33:48.391411','2021-11-04 14:33:48.391411',NULL),(43,'jvHYRo9QtKztFsFJyXdR3ohlqwsvZ5',43,1,27,'2021-11-04 14:52:43.259888','2021-11-04 14:52:43.259888',NULL),(44,'GGkmCUzMeqci8oHxfKmBRmzqAey57i',44,1,2,'2021-11-05 07:13:28.126276','2021-11-05 07:13:28.126276',NULL),(45,'IGnbIktRiFnU3IdbpyFLL5vAqMkA5A',45,1,30,'2021-11-05 11:09:20.896629','2021-11-05 11:09:20.896629',NULL),(46,'rJHxC8NbLhJWj4siF7xpobTN6iF4R5',46,1,30,'2021-11-05 11:15:05.041330','2021-11-05 11:15:05.041330',NULL),(47,'BiqFqWegXp3hBG9h88gXckASFqOx0n',47,1,2,'2021-11-07 02:29:18.231777','2021-11-07 02:29:18.231777',NULL),(48,'IqjDu4pM6xygWu7WbL3skec5jxlba1',48,1,25,'2021-11-07 04:03:25.209031','2021-11-07 04:03:25.209031',NULL),(49,'wxDOrrmJhvK0fmA18sjIFzZHlt4oiV',49,1,25,'2021-11-07 10:05:31.913786','2021-11-07 10:05:31.913786',NULL),(50,'yXng2e3qhujEH6tD5OwbbIfg2g1z89',50,1,2,'2021-11-07 11:24:14.537872','2021-11-07 11:24:14.537872',NULL),(51,'Ic1B1YpL08MRoAGfDvWSVvV74GJwuX',51,1,2,'2021-11-07 14:35:49.000338','2021-11-07 14:35:49.000495',NULL),(52,'K9qdLKW6ZO8QDl8SuwbzdPBbfGl4Rf',52,1,30,'2021-11-07 14:56:00.332892','2021-11-07 14:56:00.332892',NULL),(53,'ONVyQDb5WTudLHqNMPQdgJ1jWbaAfj',53,1,2,'2021-11-07 15:14:00.547283','2021-11-07 15:14:00.547283',NULL),(54,'Lb68gLW0HjdVVoTuPpruTNteil2uTA',54,1,29,'2021-11-07 15:18:20.044992','2021-11-07 15:18:20.044992',NULL),(55,'2r9mcdgGq1RCAHMf0Wi91lld142u1y',55,1,30,'2021-11-07 15:21:15.039697','2021-11-07 15:21:15.039697',NULL),(56,'GsZLoVKGyKoiwDdUWucjEad0oo6h4n',56,1,2,'2021-11-07 15:46:07.105414','2021-11-07 15:46:07.105414',NULL),(57,'zAiIdo5jjN7ZX38MfwYrJNdd5fNX4R',57,1,30,'2021-11-08 03:20:33.313250','2021-11-08 03:20:33.313250',NULL),(58,'W2dydNiluLS0ts4vby5L47pclitUeS',58,1,25,'2021-11-08 15:43:07.503769','2021-11-08 15:43:07.503769',NULL),(59,'xKDXTNKojMuF0B8x3HJemSCv2uHqSv',59,1,25,'2021-11-08 15:43:45.230922','2021-11-08 15:43:45.230922',NULL),(60,'fhVLH9zYXQz4i1AGODnHQ1QmEDfSZA',60,1,2,'2021-11-08 15:50:33.720666','2021-11-08 15:50:33.720666',NULL),(61,'9HzSQ8qtnwwVtadm5kZB9qrT9AGKA7',61,1,25,'2021-11-08 16:00:12.934475','2021-11-08 16:00:12.934475',NULL),(62,'X3dDKfLkOBsZ2KHh1ekXyWyFga5ihg',62,1,32,'2021-11-08 16:21:30.624406','2021-11-08 16:21:30.624406',NULL),(63,'FxGtGkCOBM4VJdxMyBTAOUg5o7QNMK',63,1,25,'2021-11-09 05:02:09.989306','2021-11-09 05:02:09.989306',NULL),(64,'nqQcdQa7Q4JyeaCLWT2ICfTHRZPB4V',64,1,2,'2021-11-09 08:25:59.285679','2021-11-09 08:25:59.285679',NULL),(65,'eeHHjA68rcAJ14h2y8kajTnwmW3Yai',65,1,25,'2021-11-10 03:09:41.056283','2021-11-10 03:09:41.056283',NULL),(66,'6Kg3FoDBHDoj24DX4Gy2BhKrSJCEVq',66,1,2,'2021-11-10 03:32:53.169626','2021-11-10 03:32:53.169626',NULL),(67,'M1S93YaO5AYxBdSeC6tuQKwaiwoC4M',67,1,30,'2021-11-10 03:35:50.474373','2021-11-10 03:35:50.474373',NULL),(68,'p5UOL8t4vV95rurhC0J4ZLbeXLhQUP',68,1,30,'2021-11-10 04:32:32.864807','2021-11-10 04:32:32.864807',NULL),(70,'keA0Ymw0dmjT7bRY6aL7HykUQUi8Ft',70,1,40,'2021-11-10 05:48:47.667274','2021-11-10 05:48:47.667274',NULL),(71,'xOEXOgN9SPspdZA5pAmOZyiIz94WTS',71,1,40,'2021-11-10 05:50:21.504509','2021-11-10 05:50:21.504509',NULL),(72,'4lWm7zFcksS2uxStTYvLREApO9HE40',72,1,33,'2021-11-10 05:56:46.519212','2021-11-10 05:56:46.519212',NULL),(73,'w83uU5tRNoJ7SHcDQBwAcGUS7MsB86',73,1,2,'2021-11-10 06:06:19.058715','2021-11-10 06:06:19.058715',NULL),(74,'09Mwgpv79dDGFKXb8JlyHil6CY9HQB',74,1,30,'2021-11-10 06:24:55.291168','2021-11-10 06:24:55.291168',NULL),(75,'5pkjeaLILX5wjbtfq64ChjGHKrxSfY',75,1,2,'2021-11-15 09:37:16.516469','2021-11-15 09:37:16.516469',NULL),(76,'j39O0JXDsqzEn6Q2e0DUdOcPDjj8rY',76,1,40,'2021-11-15 09:53:49.285023','2021-11-15 09:53:49.285023',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-15 17:05:13
