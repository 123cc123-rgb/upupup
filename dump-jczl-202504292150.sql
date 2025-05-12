-- MySQL dump 10.13  Distrib 8.4.4, for Win64 (x86_64)
--
-- Host: localhost    Database: jczl
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add banner',7,'add_banner'),(26,'Can change banner',7,'change_banner'),(27,'Can delete banner',7,'delete_banner'),(28,'Can view banner',7,'view_banner'),(29,'Can add base settings',8,'add_basesettings'),(30,'Can change base settings',8,'change_basesettings'),(31,'Can delete base settings',8,'delete_basesettings'),(32,'Can view base settings',8,'view_basesettings'),(33,'Can add can shu settings',9,'add_canshusettings'),(34,'Can change can shu settings',9,'change_canshusettings'),(35,'Can delete can shu settings',9,'delete_canshusettings'),(36,'Can view can shu settings',9,'view_canshusettings'),(37,'Can add jiu fen type',10,'add_jiufentype'),(38,'Can change jiu fen type',10,'change_jiufentype'),(39,'Can delete jiu fen type',10,'delete_jiufentype'),(40,'Can view jiu fen type',10,'view_jiufentype'),(41,'Can add tou su type',11,'add_tousutype'),(42,'Can change tou su type',11,'change_tousutype'),(43,'Can delete tou su type',11,'delete_tousutype'),(44,'Can view tou su type',11,'view_tousutype'),(45,'Can add tu wen type',12,'add_tuwentype'),(46,'Can change tu wen type',12,'change_tuwentype'),(47,'Can delete tu wen type',12,'delete_tuwentype'),(48,'Can view tu wen type',12,'view_tuwentype'),(49,'Can add user',13,'add_user'),(50,'Can change user',13,'change_user'),(51,'Can delete user',13,'delete_user'),(52,'Can view user',13,'view_user'),(53,'Can add yi chang type',14,'add_yichangtype'),(54,'Can change yi chang type',14,'change_yichangtype'),(55,'Can delete yi chang type',14,'delete_yichangtype'),(56,'Can view yi chang type',14,'view_yichangtype'),(57,'Can add yi chang',15,'add_yichang'),(58,'Can change yi chang',15,'change_yichang'),(59,'Can delete yi chang',15,'delete_yichang'),(60,'Can view yi chang',15,'view_yichang'),(61,'Can add tu wen',16,'add_tuwen'),(62,'Can change tu wen',16,'change_tuwen'),(63,'Can delete tu wen',16,'delete_tuwen'),(64,'Can view tu wen',16,'view_tuwen'),(65,'Can add tou su',17,'add_tousu'),(66,'Can change tou su',17,'change_tousu'),(67,'Can delete tou su',17,'delete_tousu'),(68,'Can view tou su',17,'view_tousu'),(69,'Can add jiu fen',18,'add_jiufen'),(70,'Can change jiu fen',18,'change_jiufen'),(71,'Can delete jiu fen',18,'delete_jiufen'),(72,'Can view jiu fen',18,'view_jiufen'),(73,'Can add ji fen log',19,'add_jifenlog'),(74,'Can change ji fen log',19,'change_jifenlog'),(75,'Can delete ji fen log',19,'delete_jifenlog'),(76,'Can view ji fen log',19,'view_jifenlog'),(77,'Can add talk',20,'add_talk'),(78,'Can change talk',20,'change_talk'),(79,'Can delete talk',20,'delete_talk'),(80,'Can view talk',20,'view_talk'),(81,'Can add comments',21,'add_comments'),(82,'Can change comments',21,'change_comments'),(83,'Can delete comments',21,'delete_comments'),(84,'Can view comments',21,'view_comments');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$eLVNw2Vgx7n9cHg1I4vn8i$5f78e24+NlPVkqOCnPnphxjVmT6kyjGgEzqNLrlnEBM=','2025-04-29 20:21:41.675945',1,'cc','','','3379601253@qq.com',1,1,'2025-04-27 19:51:50.642417');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-04-27 20:01:44.066222','1','CanShuSettings object (1)',1,'[{\"added\": {}}]',9,1),(2,'2025-04-27 20:01:55.347908','1','CanShuSettings object (1)',2,'[{\"changed\": {\"fields\": [\"App_serct\"]}}]',9,1),(3,'2025-04-27 20:03:35.975930','1','BaseSettings object (1)',1,'[{\"added\": {}}]',8,1),(4,'2025-04-27 20:20:31.072406','1','Charlie',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5bc6\\u7801\", \"\\u7528\\u6237\\u540d\"]}}]',13,1),(5,'2025-04-27 20:22:44.462518','2','biu',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5bc6\\u7801\", \"\\u7528\\u6237\\u540d\"]}}]',13,1),(6,'2025-04-27 20:23:09.677096','1','普法宣传',1,'[{\"added\": {}}]',12,1),(7,'2025-04-27 20:23:20.726928','2','反诈预警',1,'[{\"added\": {}}]',12,1),(8,'2025-04-27 20:23:27.324509','3','活动通知',1,'[{\"added\": {}}]',12,1),(9,'2025-04-27 20:25:29.502298','1','TuWen object (1)',1,'[{\"added\": {}}]',16,1),(10,'2025-04-27 20:26:16.201072','2','TuWen object (2)',1,'[{\"added\": {}}]',16,1),(11,'2025-04-27 20:27:00.582137','3','TuWen object (3)',1,'[{\"added\": {}}]',16,1),(12,'2025-04-27 20:27:23.396300','4','TuWen object (4)',1,'[{\"added\": {}}]',16,1),(13,'2025-04-27 20:29:48.072060','1','Banner object (1)',1,'[{\"added\": {}}]',7,1),(14,'2025-04-27 20:29:53.157777','2','Banner object (2)',1,'[{\"added\": {}}]',7,1),(15,'2025-04-27 20:29:58.804964','3','Banner object (3)',1,'[{\"added\": {}}]',7,1),(16,'2025-04-27 21:12:54.075258','22','Alexander',2,'[{\"changed\": {\"fields\": [\"\\u8eab\\u4efd\"]}}]',13,1),(17,'2025-04-27 21:12:59.156561','13','Mia',2,'[{\"changed\": {\"fields\": [\"\\u8eab\\u4efd\"]}}]',13,1),(18,'2025-04-27 21:13:04.225402','7','Ava',2,'[{\"changed\": {\"fields\": [\"\\u8eab\\u4efd\"]}}]',13,1),(19,'2025-04-27 21:13:09.458615','5','Olivia',2,'[{\"changed\": {\"fields\": [\"\\u8eab\\u4efd\"]}}]',13,1),(20,'2025-04-27 21:13:15.158202','11','Isabella',2,'[{\"changed\": {\"fields\": [\"\\u8eab\\u4efd\"]}}]',13,1),(21,'2025-04-27 21:13:22.424738','9','Sophia',2,'[{\"changed\": {\"fields\": [\"\\u8eab\\u4efd\"]}}]',13,1),(22,'2025-04-27 21:13:28.824082','17','Amelia',2,'[{\"changed\": {\"fields\": [\"\\u8eab\\u4efd\"]}}]',13,1),(23,'2025-04-27 21:36:57.966509','20','Ethan',2,'[{\"changed\": {\"fields\": [\"\\u8eab\\u4efd\"]}}]',13,1),(24,'2025-04-27 21:37:04.845990','8','William',2,'[{\"changed\": {\"fields\": [\"\\u8eab\\u4efd\"]}}]',13,1),(25,'2025-04-27 21:37:10.198449','19','Harper',2,'[{\"changed\": {\"fields\": [\"\\u8eab\\u4efd\"]}}]',13,1),(26,'2025-04-27 21:37:16.431873','15','Charlotte',2,'[{\"changed\": {\"fields\": [\"\\u8eab\\u4efd\"]}}]',13,1),(27,'2025-04-27 21:37:22.446065','4','Liam',2,'[{\"changed\": {\"fields\": [\"\\u8eab\\u4efd\"]}}]',13,1),(28,'2025-04-27 21:37:28.531006','18','Mason',2,'[{\"changed\": {\"fields\": [\"\\u8eab\\u4efd\"]}}]',13,1),(29,'2025-04-27 21:37:38.564163','14','Elijah',2,'[{\"changed\": {\"fields\": [\"\\u8eab\\u4efd\"]}}]',13,1),(30,'2025-04-27 21:56:01.610652','1','邻里纠纷',1,'[{\"added\": {}}]',10,1),(31,'2025-04-27 21:56:08.851776','2','物业相关纠纷',1,'[{\"added\": {}}]',10,1),(32,'2025-04-27 21:56:15.317881','3','公共资源纠纷',1,'[{\"added\": {}}]',10,1),(33,'2025-04-27 21:56:23.925728','4','经济与合同纠纷',1,'[{\"added\": {}}]',10,1),(34,'2025-04-27 21:56:34.302362','5','人身安全与权益纠纷',1,'[{\"added\": {}}]',10,1),(35,'2025-04-27 21:57:30.765888','6','商业与商户纠纷',1,'[{\"added\": {}}]',10,1),(36,'2025-04-27 21:57:34.644704','7','其他',1,'[{\"added\": {}}]',10,1),(37,'2025-04-27 22:03:38.827870','1','公共设施故障',1,'[{\"added\": {}}]',14,1),(38,'2025-04-27 22:03:56.496849','2','社区安全隐患',1,'[{\"added\": {}}]',14,1),(39,'2025-04-27 22:04:04.329911','3','环境污染问题',1,'[{\"added\": {}}]',14,1),(40,'2025-04-27 22:04:35.459204','1','公共服务问题',1,'[{\"added\": {}}]',11,1),(41,'2025-04-27 22:04:43.412016','2','违法行为举报',1,'[{\"added\": {}}]',11,1),(42,'2025-04-27 22:04:55.355594','3','社区管理问题',1,'[{\"added\": {}}]',11,1),(43,'2025-04-27 22:05:08.522783','4','消费纠纷投诉',1,'[{\"added\": {}}]',11,1),(44,'2025-04-27 22:05:12.111154','5','其他',1,'[{\"added\": {}}]',11,1),(45,'2025-04-27 22:06:17.321146','6','廉洁纪律问题',1,'[{\"added\": {}}]',11,1),(46,'2025-04-27 22:06:56.350983','4','异常人员预警',1,'[{\"added\": {}}]',14,1),(47,'2025-04-27 22:07:00.038111','5','其他',1,'[{\"added\": {}}]',14,1),(48,'2025-04-28 09:14:24.564998','1','YiChang object (1)',1,'[{\"added\": {}}]',15,1),(49,'2025-04-28 09:14:59.524353','2','YiChang object (2)',1,'[{\"added\": {}}]',15,1),(50,'2025-04-28 09:15:39.724160','3','YiChang object (3)',1,'[{\"added\": {}}]',15,1),(51,'2025-04-28 09:16:22.935771','4','YiChang object (4)',1,'[{\"added\": {}}]',15,1),(52,'2025-04-28 09:16:59.410151','5','YiChang object (5)',1,'[{\"added\": {}}]',15,1),(53,'2025-04-28 09:18:39.980819','6','YiChang object (6)',1,'[{\"added\": {}}]',15,1),(54,'2025-04-28 09:19:19.263749','7','YiChang object (7)',1,'[{\"added\": {}}]',15,1),(55,'2025-04-28 09:20:23.997483','8','YiChang object (8)',1,'[{\"added\": {}}]',15,1),(56,'2025-04-28 09:21:51.975334','9','YiChang object (9)',1,'[{\"added\": {}}]',15,1),(57,'2025-04-28 09:22:36.945318','10','YiChang object (10)',1,'[{\"added\": {}}]',15,1),(58,'2025-04-28 09:23:39.307905','11','YiChang object (11)',1,'[{\"added\": {}}]',15,1),(59,'2025-04-28 09:24:35.704242','12','YiChang object (12)',1,'[{\"added\": {}}]',15,1),(60,'2025-04-28 09:25:29.472651','13','YiChang object (13)',1,'[{\"added\": {}}]',15,1),(61,'2025-04-28 09:26:39.424426','14','YiChang object (14)',1,'[{\"added\": {}}]',15,1),(62,'2025-04-28 10:21:09.505520','1','TouSu object (1)',2,'[{\"changed\": {\"fields\": [\"\\u6295\\u8bc9\\u8d44\\u6e90id\"]}}]',17,1),(63,'2025-04-28 10:21:16.560320','1','TouSu object (1)',2,'[{\"changed\": {\"fields\": [\"\\u6295\\u8bc9\\u8d44\\u6e90id\"]}}]',17,1),(64,'2025-04-28 11:00:43.889483','13','TouSu object (13)',2,'[{\"changed\": {\"fields\": [\"\\u6295\\u8bc9\\u7c7b\\u578b\"]}}]',17,1),(65,'2025-04-28 11:00:56.989163','11','TouSu object (11)',2,'[{\"changed\": {\"fields\": [\"\\u6295\\u8bc9\\u7c7b\\u578b\"]}}]',17,1),(66,'2025-04-28 11:01:12.013790','2','TouSu object (2)',2,'[{\"changed\": {\"fields\": [\"\\u6295\\u8bc9\\u7c7b\\u578b\"]}}]',17,1),(67,'2025-04-28 11:01:19.952184','10','TouSu object (10)',2,'[{\"changed\": {\"fields\": [\"\\u6295\\u8bc9\\u7c7b\\u578b\"]}}]',17,1),(68,'2025-04-28 11:01:30.368105','9','TouSu object (9)',2,'[{\"changed\": {\"fields\": [\"\\u6295\\u8bc9\\u7c7b\\u578b\"]}}]',17,1),(69,'2025-04-28 11:01:37.228443','8','TouSu object (8)',2,'[{\"changed\": {\"fields\": [\"\\u6295\\u8bc9\\u7c7b\\u578b\"]}}]',17,1),(70,'2025-04-28 11:01:45.290871','7','TouSu object (7)',2,'[{\"changed\": {\"fields\": [\"\\u6295\\u8bc9\\u7c7b\\u578b\"]}}]',17,1),(71,'2025-04-28 11:01:59.721165','6','TouSu object (6)',2,'[]',17,1),(72,'2025-04-28 11:02:07.705945','5','TouSu object (5)',2,'[{\"changed\": {\"fields\": [\"\\u6295\\u8bc9\\u7c7b\\u578b\"]}}]',17,1),(73,'2025-04-28 11:02:16.904042','4','TouSu object (4)',2,'[{\"changed\": {\"fields\": [\"\\u6295\\u8bc9\\u7c7b\\u578b\"]}}]',17,1),(74,'2025-04-28 11:02:27.962796','3','TouSu object (3)',2,'[{\"changed\": {\"fields\": [\"\\u6295\\u8bc9\\u7c7b\\u578b\"]}}]',17,1),(75,'2025-04-28 11:22:16.172414','2','JiuFen object (2)',1,'[{\"added\": {}}]',18,1),(76,'2025-04-28 11:24:01.248772','3','JiuFen object (3)',1,'[{\"added\": {}}]',18,1),(77,'2025-04-28 11:25:25.355484','4','JiuFen object (4)',1,'[{\"added\": {}}]',18,1),(78,'2025-04-28 11:27:00.976393','5','JiuFen object (5)',1,'[{\"added\": {}}]',18,1),(79,'2025-04-28 11:28:48.052750','6','JiuFen object (6)',1,'[{\"added\": {}}]',18,1),(80,'2025-04-28 11:30:15.926027','7','JiuFen object (7)',1,'[{\"added\": {}}]',18,1),(81,'2025-04-28 11:32:44.611908','8','JiuFen object (8)',1,'[{\"added\": {}}]',18,1),(82,'2025-04-28 11:36:39.384158','9','JiuFen object (9)',1,'[{\"added\": {}}]',18,1),(83,'2025-04-28 11:36:51.313597','2','JiuFen object (2)',2,'[{\"changed\": {\"fields\": [\"\\u8c03\\u89e3\\u72b6\\u6001\"]}}]',18,1),(84,'2025-04-28 11:38:52.819479','10','JiuFen object (10)',1,'[{\"added\": {}}]',18,1),(85,'2025-04-28 11:40:30.883289','11','JiuFen object (11)',1,'[{\"added\": {}}]',18,1),(86,'2025-04-28 11:42:17.657602','12','JiuFen object (12)',1,'[{\"added\": {}}]',18,1),(87,'2025-04-28 11:45:18.844114','13','JiuFen object (13)',1,'[{\"added\": {}}]',18,1),(88,'2025-04-28 11:46:44.315815','1','JiFenLog object (1)',1,'[{\"added\": {}}]',19,1),(89,'2025-04-28 11:47:18.849775','2','JiFenLog object (2)',1,'[{\"added\": {}}]',19,1),(90,'2025-04-29 19:26:42.387692','1','YiChang object (1)',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\", \"\\u624b\\u673a\\u53f7\"]}}]',15,1),(91,'2025-04-29 19:27:15.220665','1','TouSu object (1)',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\"]}}]',17,1),(92,'2025-04-29 19:27:30.519862','1','JiuFen object (1)',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\"]}}]',18,1),(93,'2025-04-29 19:28:15.317520','1','JiuFen object (1)',2,'[{\"changed\": {\"fields\": [\"\\u8c03\\u89e3\\u72b6\\u6001\"]}}]',18,1),(94,'2025-04-29 19:39:34.658954','5','TuWen object (5)',1,'[{\"added\": {}}]',16,1),(95,'2025-04-29 19:48:23.692103','1','暴雨导致小区停电超12小时！物业紧急预案呢',1,'[{\"added\": {}}]',20,1),(96,'2025-04-29 19:49:06.551634','2','垃圾清运时间为何突然改到凌晨5点？',1,'[{\"added\": {}}]',20,1),(97,'2025-04-29 19:49:37.749608','3','楼上每晚剁肉馅到半夜，沟通无果求支招！',1,'[{\"added\": {}}]',20,1),(98,'2025-04-29 19:50:09.975042','4','绿化带被私自改成停车位，没人管吗？',1,'[{\"added\": {}}]',20,1),(99,'2025-04-29 19:51:16.698306','1','Comments object (1)',1,'[{\"added\": {}}]',21,1),(100,'2025-04-29 19:51:45.106707','2','Comments object (2)',1,'[{\"added\": {}}]',21,1),(101,'2025-04-29 19:52:02.871077','16','物业小李',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u540d\"]}}]',13,1),(102,'2025-04-29 19:52:33.094274','16','碧桂园物业小李',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u540d\"]}}]',13,1),(103,'2025-04-29 19:52:55.000780','21','东湖社区李主任',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u540d\"]}}]',13,1),(104,'2025-04-29 19:53:35.399127','3','Comments object (3)',1,'[{\"added\": {}}]',21,1),(105,'2025-04-29 19:54:02.683304','4','Comments object (4)',1,'[{\"added\": {}}]',21,1),(106,'2025-04-29 19:54:29.129421','5','Comments object (5)',1,'[{\"added\": {}}]',21,1),(107,'2025-04-29 19:55:01.097063','5','小区门禁刷脸系统强制推行是否合法？',1,'[{\"added\": {}}]',20,1),(108,'2025-04-29 19:55:35.914368','6','公共晾衣杆被私装地锁霸占怎么办？',1,'[{\"added\": {}}]',20,1),(109,'2025-04-29 19:55:57.408564','7','社区食堂定价过高，老年人吃不消！',1,'[{\"added\": {}}]',20,1),(110,'2025-04-29 19:56:14.356001','8','健身老刘',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u540d\"]}}]',13,1),(111,'2025-04-29 19:57:49.102357','6','Comments object (6)',1,'[{\"added\": {}}]',21,1),(112,'2025-04-29 19:59:07.308015','10','红星恒大业委会赵叔',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u540d\", \"\\u5730\\u5740\"]}}]',13,1),(113,'2025-04-29 20:00:25.010386','7','Comments object (7)',1,'[{\"added\": {}}]',21,1),(114,'2025-04-29 20:00:34.013345','1','暴雨导致小区停电超12小时！物业紧急预案呢',2,'[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u7f6e\\u9876\"]}}]',20,1),(115,'2025-04-29 20:01:22.275269','8','Comments object (8)',1,'[{\"added\": {}}]',21,1),(116,'2025-04-29 20:01:38.990604','7','社区食堂定价过高，老年人吃不消！',2,'[{\"changed\": {\"fields\": [\"\\u70b9\\u8d5e\\u6570\"]}}]',20,1),(117,'2025-04-29 20:01:48.284306','3','楼上每晚剁肉馅到半夜，沟通无果求支招！',2,'[{\"changed\": {\"fields\": [\"\\u70b9\\u8d5e\\u6570\"]}}]',20,1),(118,'2025-04-29 20:01:52.510042','1','暴雨导致小区停电超12小时！物业紧急预案呢',2,'[{\"changed\": {\"fields\": [\"\\u70b9\\u8d5e\\u6570\"]}}]',20,1),(119,'2025-04-29 20:01:58.274481','5','小区门禁刷脸系统强制推行是否合法？',2,'[{\"changed\": {\"fields\": [\"\\u70b9\\u8d5e\\u6570\"]}}]',20,1),(120,'2025-04-29 20:02:04.191020','4','绿化带被私自改成停车位，没人管吗？',2,'[{\"changed\": {\"fields\": [\"\\u70b9\\u8d5e\\u6570\"]}}]',20,1),(121,'2025-04-29 20:29:01.451879','22','Alexander',2,'[{\"changed\": {\"fields\": [\"\\u5730\\u5740\"]}}]',13,1),(122,'2025-04-29 20:29:25.300098','21','东湖社区李主任',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5730\\u5740\"]}}]',13,1),(123,'2025-04-29 20:29:44.581529','20','Ethan',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5730\\u5740\"]}}]',13,1),(124,'2025-04-29 20:29:55.881818','19','Harper',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5730\\u5740\"]}}]',13,1),(125,'2025-04-29 20:30:12.714407','18','Mason',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5730\\u5740\"]}}]',13,1),(126,'2025-04-29 20:30:29.230460','17','Amelia',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5730\\u5740\"]}}]',13,1),(127,'2025-04-29 20:30:41.346698','16','碧桂园物业小李',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5730\\u5740\"]}}]',13,1),(128,'2025-04-29 20:30:54.362118','15','Charlotte',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5730\\u5740\"]}}]',13,1),(129,'2025-04-29 20:31:05.945201','14','Elijah',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5730\\u5740\"]}}]',13,1),(130,'2025-04-29 20:31:19.560700','13','Mia',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5730\\u5740\"]}}]',13,1),(131,'2025-04-29 20:31:34.110395','12','Benjamin',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5730\\u5740\"]}}]',13,1),(132,'2025-04-29 20:31:57.292300','11','Isabella',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5730\\u5740\"]}}]',13,1),(133,'2025-04-29 20:32:13.325663','9','Sophia',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5730\\u5740\"]}}]',13,1),(134,'2025-04-29 20:32:39.423166','8','健身老刘',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5730\\u5740\"]}}]',13,1),(135,'2025-04-29 20:32:53.371989','7','Ava',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5730\\u5740\"]}}]',13,1),(136,'2025-04-29 20:33:14.221874','6','Noah',2,'[{\"changed\": {\"fields\": [\"\\u5730\\u5740\"]}}]',13,1),(137,'2025-04-29 20:33:24.155143','6','Noah',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\"]}}]',13,1),(138,'2025-04-29 20:33:36.505621','5','Olivia',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5730\\u5740\"]}}]',13,1),(139,'2025-04-29 20:33:53.236568','4','Liam',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5730\\u5740\"]}}]',13,1),(140,'2025-04-29 20:34:14.618391','3','Emma',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5730\\u5740\"]}}]',13,1),(141,'2025-04-29 20:34:30.085334','2','biu',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\", \"\\u5730\\u5740\"]}}]',13,1),(142,'2025-04-29 20:34:46.200424','22','Alexander',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\"]}}]',13,1),(143,'2025-04-29 20:35:04.715652','10','红星恒大业委会赵叔',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\"]}}]',13,1),(144,'2025-04-29 20:35:47.529898','1','Charlie',2,'[{\"changed\": {\"fields\": [\"\\u5730\\u5740\"]}}]',13,1),(145,'2025-04-29 20:37:18.954189','2','JiFenLog object (2)',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\"]}}]',19,1),(146,'2025-04-29 20:37:22.532523','1','JiFenLog object (1)',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\"]}}]',19,1),(147,'2025-04-29 20:39:41.398243','8','询问驿站地址',2,'[{\"changed\": {\"fields\": [\"\\u4f5c\\u8005\"]}}]',20,1),(148,'2025-04-29 20:39:45.398443','1','暴雨导致小区停电超12小时！物业紧急预案呢',2,'[{\"changed\": {\"fields\": [\"\\u4f5c\\u8005\"]}}]',20,1),(149,'2025-04-29 20:39:56.083067','8','询问驿站地址',2,'[{\"changed\": {\"fields\": [\"\\u4f5c\\u8005\"]}}]',20,1),(150,'2025-04-29 20:40:01.397642','1','暴雨导致小区停电超12小时！物业紧急预案呢',2,'[{\"changed\": {\"fields\": [\"\\u4f5c\\u8005\"]}}]',20,1),(151,'2025-04-29 20:40:08.439578','5','Comments object (5)',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\"]}}]',21,1),(152,'2025-04-29 20:40:19.882715','5','Comments object (5)',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\"]}}]',21,1),(153,'2025-04-29 21:47:48.437387','1','CanShuSettings object (1)',2,'[{\"changed\": {\"fields\": [\"App_id\", \"App_serct\"]}}]',9,1),(154,'2025-04-29 21:49:38.981382','2','JiFenLog object (2)',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\"]}}]',19,1),(155,'2025-04-29 21:49:43.597215','1','JiFenLog object (1)',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\"]}}]',19,1);
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'index','banner'),(8,'index','basesettings'),(9,'index','canshusettings'),(21,'index','comments'),(19,'index','jifenlog'),(18,'index','jiufen'),(10,'index','jiufentype'),(20,'index','talk'),(17,'index','tousu'),(11,'index','tousutype'),(16,'index','tuwen'),(12,'index','tuwentype'),(13,'index','user'),(15,'index','yichang'),(14,'index','yichangtype'),(6,'sessions','session');
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
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-27 19:49:25.060316'),(2,'auth','0001_initial','2025-04-27 19:49:25.426148'),(3,'admin','0001_initial','2025-04-27 19:49:25.518236'),(4,'admin','0002_logentry_remove_auto_add','2025-04-27 19:49:25.525054'),(5,'admin','0003_logentry_add_action_flag_choices','2025-04-27 19:49:25.530046'),(6,'contenttypes','0002_remove_content_type_name','2025-04-27 19:49:25.654670'),(7,'auth','0002_alter_permission_name_max_length','2025-04-27 19:49:25.795284'),(8,'auth','0003_alter_user_email_max_length','2025-04-27 19:49:25.842155'),(9,'auth','0004_alter_user_username_opts','2025-04-27 19:49:25.857776'),(10,'auth','0005_alter_user_last_login_null','2025-04-27 19:49:25.889753'),(11,'auth','0006_require_contenttypes_0002','2025-04-27 19:49:25.889753'),(12,'auth','0007_alter_validators_add_error_messages','2025-04-27 19:49:25.905370'),(13,'auth','0008_alter_user_username_max_length','2025-04-27 19:49:25.936623'),(14,'auth','0009_alter_user_last_name_max_length','2025-04-27 19:49:25.983894'),(15,'auth','0010_alter_group_name_max_length','2025-04-27 19:49:26.031040'),(16,'auth','0011_update_proxy_permissions','2025-04-27 19:49:26.031040'),(17,'auth','0012_alter_user_first_name_max_length','2025-04-27 19:49:26.077905'),(18,'index','0001_initial','2025-04-27 19:49:26.530986'),(19,'index','0002_talk_comments_user_dianzan_list','2025-04-27 19:49:26.812205'),(20,'index','0003_talk_is_top','2025-04-27 19:49:26.859070'),(21,'index','0004_user_address_user_role','2025-04-27 19:49:26.968439'),(22,'sessions','0001_initial','2025-04-27 19:49:26.984288');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9prgcp65stduwuw5iw277sror3304b0i','.eJyllc1uozAQgF8l4pwmNuAfetz7PsFSRbYZB9rERDGoW1V597VxKhribkpzMjDj-eaPmfdkI_qu3vQWjpumSh4TnCw_f5NCvYDxgupZmG27Uq3pjo1ceZXVWWpXv9sKdr_OuhcGamFrdxshzRjlTGccMFVKpQVHGoTAoFmeVZxVJOWpxCzLqkqhAtKCYFKwXFKCIPdG92B662z9eS8TI_ZQJo-LMinLnhKG_JFRcAeDSruDS4HLZOk0Gudz0NXCLrR4UM7bIOqPuyBZ1-0e1uHj5hWabd15AfLv0FT-GSOET8uFg4vDIdxqTAV_w6ULh7iUgyeawhcu-Nw82LqBXRU09j6D1utchUeYFj48lqpbtj9MT6Ib_FxLYcFC1zVma4PCGFkWIrvkZiods_tzrhLG1v1X5Pz0NEk6vlRIv5n0XAP27iKqJz1xfwmYa05vLc3YLdv_TcUoGOOjsdRTDQOIex7nlM8Edf0rmCmJ3SQxxeTQcVz-BNi9HWAK5VOoFMZ8GJnRu-Ol0XYRCYgV4OtPUkRD1_pSEU3ITOJzo8Hs2u2EiVEsiRr5P4VA5ruk4Dwf0JTOZL41qnZTdorEs5D3VPHsQKSOOI04Qd2QHrCqmNsubW_7KSI2hD4j7upPD4zFlcd6CAQaDslmd02vr348TG4w7gksEGORRQeL277-kATNTaDYvUwJsYHiKhVaUYq5e6LduxXfTTcE5lcbIr0cA-T0lJz-AXYrrgM:1u9FQp:16l0KHyB2DeRgaWSVoHf1Xu6ZsKlyrtZX0yQszlHMeY','2025-05-12 11:45:23.459418'),('hyq177ievog9vql9bu29a5jq3h67lc25','.eJyllc1uozAQgF8l4pwmNuAfetz7PsFSRbYZB9rERDGoW1V597VxKhribkpzMjDj-eaPmfdkI_qu3vQWjpumSh4TnCw_f5NCvYDxgupZmG27Uq3pjo1ceZXVWWpXv9sKdr_OuhcGamFrdxshzRjlTGccMFVKpQVHGoTAoFmeVZxVJOWpxCzLqkqhAtKCYFKwXFKCIPdG92B662z9eS8TI_ZQJo-LMinLnhKG_JFRcAeDSruDS4HLZOk0Gudz0NXCLrR4UM7bIOqPuyBZ1-0e1uHj5hWabd15AfLv0FT-GSOET8uFg4vDIdxqTAV_w6ULh7iUgyeawhcu-Nw82LqBXRU09j6D1utchUeYFj48lqpbtj9MT6Ib_FxLYcFC1zVma4PCGFkWIrvkZiods_tzrhLG1v1X5Pz0NEk6vlRIv5n0XAP27iKqJz1xfwmYa05vLc3YLdv_TcUoGOOjsdRTDQOIex7nlM8Edf0rmCmJ3SQxxeTQcVz-BNi9HWAK5VOoFMZ8GJnRu-Ol0XYRCYgV4OtPUkRD1_pSEU3ITOJzo8Hs2u2EiVEsiRr5P4VA5ruk4Dwf0JTOZL41qnZTdorEs5D3VPHsQKSOOI04Qd2QHrCqmNsubW_7KSI2hD4j7upPD4zFlcd6CAQaDslmd02vr348TG4w7gksEGORRQeL277-kATNTaDYvUwJsYHiKhVaUYq5e6LduxXfTTcE5lcbIr0cA-T0lJz-AXYrrgM:1u9lGZ:GBI14K5L8q6Z-Ej1X6Z-aON9tihN4gQ5SoTPgAgqz0A','2025-05-13 21:44:55.708185');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_banner`
--

DROP TABLE IF EXISTS `index_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_banner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_banner`
--

LOCK TABLES `index_banner` WRITE;
/*!40000 ALTER TABLE `index_banner` DISABLE KEYS */;
INSERT INTO `index_banner` VALUES (1,'2025-04-27 20:29:48.069187','2025-04-27 20:29:48.069187','banner/banner1.jpg'),(2,'2025-04-27 20:29:53.155148','2025-04-27 20:29:53.155148','banner/banner2.jpg'),(3,'2025-04-27 20:29:58.792756','2025-04-27 20:29:58.792756','banner/banner3.jpg');
/*!40000 ALTER TABLE `index_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_basesettings`
--

DROP TABLE IF EXISTS `index_basesettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_basesettings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `media_url` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_basesettings`
--

LOCK TABLES `index_basesettings` WRITE;
/*!40000 ALTER TABLE `index_basesettings` DISABLE KEYS */;
INSERT INTO `index_basesettings` VALUES (1,'2025-04-27 20:03:35.975930','2025-04-27 20:03:35.975930','http://127.0.0.1:8000/media/');
/*!40000 ALTER TABLE `index_basesettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_canshusettings`
--

DROP TABLE IF EXISTS `index_canshusettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_canshusettings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `app_id` varchar(64) DEFAULT NULL,
  `app_serct` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_canshusettings`
--

LOCK TABLES `index_canshusettings` WRITE;
/*!40000 ALTER TABLE `index_canshusettings` DISABLE KEYS */;
INSERT INTO `index_canshusettings` VALUES (1,'2025-04-27 20:01:44.065946','2025-04-29 21:47:48.437387','wx05ad629f88264b45','a0840e328687eb54fd71d4614b60866a');
/*!40000 ALTER TABLE `index_canshusettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_comments`
--

DROP TABLE IF EXISTS `index_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `content` longtext,
  `data_id` varchar(64) DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `talk_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_author_id_566f7611_fk_index_user_id` (`author_id`),
  KEY `index_comments_talk_id_10b27541_fk_index_talk_id` (`talk_id`),
  CONSTRAINT `index_comments_author_id_566f7611_fk_index_user_id` FOREIGN KEY (`author_id`) REFERENCES `index_user` (`id`),
  CONSTRAINT `index_comments_talk_id_10b27541_fk_index_talk_id` FOREIGN KEY (`talk_id`) REFERENCES `index_talk` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_comments`
--

LOCK TABLES `index_comments` WRITE;
/*!40000 ALTER TABLE `index_comments` DISABLE KEYS */;
INSERT INTO `index_comments` VALUES (1,'2025-04-29 19:51:16.693108','2025-04-29 19:51:16.693108','我家有充电宝和蜡烛，3栋的邻居可以来102室取用！','883c064a-bfc2-49be-a4bc-f524364ac3c8',5,1),(2,'2025-04-29 19:51:45.106707','2025-04-29 19:51:45.106707','支持楼主！建议给靠近垃圾站的住户安装隔音窗','883c064a-bfc2-49be-a4bc-f524364ac3c8',5,2),(3,'2025-04-29 19:53:35.399127','2025-04-29 19:53:35.399127','已联系供电局抢修，临时发电机正送往小区，保安正在逐栋排查被困居民！','883c064a-bfc2-49be-a4bc-f524364ac3c8',16,1),(4,'2025-04-29 19:54:02.683304','2025-04-29 19:54:02.683304','因夏季垃圾腐坏加速，调整是为避免异味扩散。本周五晚7点将在居委会召开听证会，欢迎报名参与协商！','883c064a-bfc2-49be-a4bc-f524364ac3c8',21,2),(5,'2025-04-29 19:54:29.128424','2025-04-29 20:40:19.882715','建议买份耳塞先应急，我家有多的可以送您！','883c064a-bfc2-49be-a4bc-f524364ac3c8',1,3),(6,'2025-04-29 19:57:49.102357','2025-04-29 19:57:49.102357','拟修订《小区公约》：公共区域私占行为纳入失信名单','883c064a-bfc2-49be-a4bc-f524364ac3c8',10,6),(7,'2025-04-29 20:00:25.010386','2025-04-29 20:00:25.010386','社区已协调街道救援队携带担架支援，需要帮助的居民请拨打24小时值班电话012-269632','883c064a-bfc2-49be-a4bc-f524364ac3c8',21,1),(8,'2025-04-29 20:01:22.275269','2025-04-29 20:01:22.275269','支持曝光！建议每栋楼选个监督员轮流巡查','883c064a-bfc2-49be-a4bc-f524364ac3c8',14,4);
/*!40000 ALTER TABLE `index_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_jifenlog`
--

DROP TABLE IF EXISTS `index_jifenlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_jifenlog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `text` longtext,
  `jifen` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_jifenlog_user_id_2303545b_fk_index_user_id` (`user_id`),
  CONSTRAINT `index_jifenlog_user_id_2303545b_fk_index_user_id` FOREIGN KEY (`user_id`) REFERENCES `index_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_jifenlog`
--

LOCK TABLES `index_jifenlog` WRITE;
/*!40000 ALTER TABLE `index_jifenlog` DISABLE KEYS */;
INSERT INTO `index_jifenlog` VALUES (1,'2025-04-28 11:46:44.315815','2025-04-29 21:49:43.597215','2025-04-28 11:46:44.315815','用户上报异常且避免重大损失',5,1),(2,'2025-04-28 11:47:18.848779','2025-04-29 21:49:38.981382','2025-04-28 11:47:18.848779','用户积极参与活动',5,1);
/*!40000 ALTER TABLE `index_jifenlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_jiufen`
--

DROP TABLE IF EXISTS `index_jiufen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_jiufen` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  `img1` varchar(100) DEFAULT NULL,
  `img2` varchar(100) DEFAULT NULL,
  `data_id` varchar(64) DEFAULT NULL,
  `state` smallint NOT NULL,
  `apply_user` varchar(64) DEFAULT NULL,
  `apply_phone` varchar(64) DEFAULT NULL,
  `apply_address` varchar(64) DEFAULT NULL,
  `other_user` varchar(64) DEFAULT NULL,
  `other_phone` varchar(64) DEFAULT NULL,
  `other_address` varchar(64) DEFAULT NULL,
  `text` longtext,
  `suqiu` longtext,
  `created_date` date NOT NULL,
  `type_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_jiufen_type_id_a76367a4_fk_index_jiufentype_id` (`type_id`),
  KEY `index_jiufen_user_id_af0ab4d9_fk_index_user_id` (`user_id`),
  CONSTRAINT `index_jiufen_type_id_a76367a4_fk_index_jiufentype_id` FOREIGN KEY (`type_id`) REFERENCES `index_jiufentype` (`id`),
  CONSTRAINT `index_jiufen_user_id_af0ab4d9_fk_index_user_id` FOREIGN KEY (`user_id`) REFERENCES `index_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_jiufen`
--

LOCK TABLES `index_jiufen` WRITE;
/*!40000 ALTER TABLE `index_jiufen` DISABLE KEYS */;
INSERT INTO `index_jiufen` VALUES (1,'2025-04-28 11:08:56.203978','2025-04-29 19:28:15.317520','file/WGXZUCODTCtN8d9c471b8b9fa527895e9c4f5b47e94e.jpg','','','5e957315-3743-4c74-97ed-78f0e2058d1d',1,'张泽同','13696387896','江苏省徐州市','宋一夫','13696321238','江苏省宿迁市','宋一夫殴打本人导致受伤','书面道歉，并且赔偿4000元医药费','2025-04-28',1,1),(2,'2025-04-28 11:22:16.172414','2025-04-28 11:36:51.313597','','','','883c064a-bfc2-49be-a4bc-f524364ac3c8',3,'张三','15911223344','江苏省南京市','春华苑3栋301室业主王某','15977889900','滨江区春晓路18号春华苑','在公共楼道加装防盗门侵占25cm公共空间，阻碍消防通道正常使用（消防部门认定违规）','1. 7日内拆除违建门体 2. 恢复楼道原状 3. 支付占用费（200元/月×18个月）','2025-04-28',1,3),(3,'2025-04-28 11:24:01.248772','2025-04-28 11:24:01.248772','','','','883c064a-bfc2-49be-a4bc-f524364ac3c8',0,'李四','15944556677','江苏省南京市','鼎峰物业公司','15900112233','世纪大道100号环球金融中心29层','将小区游泳池外包给第三方经营，收费标准提高300%且限制业主免费使用时段（原合同约定业主权益）','1. 恢复业主免费权益 2. 退还多收费用 3. 解约违规外包合同','2025-04-28',2,4),(4,'2025-04-28 11:25:25.355484','2025-04-28 11:25:25.355484','','','','883c064a-bfc2-49be-a4bc-f524364ac3c8',0,'王五','15955667788','江苏省南京市','阳光新城业委会','15912345678','洪山区珞喻路726号阳光新城','擅自使用专项维修基金购买理财产品（涉及金额85万元），导致电梯大修延误引发停运事故','1. 追回全部理财资金 2. 业委会成员集体辞职 3. 建立资金使用公示制度','2025-04-28',2,4),(5,'2025-04-28 11:27:00.976393','2025-04-28 11:27:00.976393','','','','883c064a-bfc2-49be-a4bc-f524364ac3c8',1,'赵六','15955667788','江苏省南京市','迅捷电梯维保公司','15923456789','锦江区东大街下东大街段258号','未按合同要求每月2次维保，故障维修响应超4小时（合同约定2小时），导致业主被困事故翻倍','1. 终止服务合同 2. 赔偿被困业主每人3000元 3. 公开半年维保记录','2025-04-28',2,5),(6,'2025-04-28 11:28:48.052750','2025-04-28 11:28:48.052750','','','','883c064a-bfc2-49be-a4bc-f524364ac3c8',2,'张伟','15900112233','江苏省南京市','美居装饰工程有限公司','15967890123','市南区香港中路76号裕源大厦','装修工程偷换材料（合同约定圣象地板，实际使用山寨产品），甲醛检测超标4.2倍','1. 全屋地板更换 2. 支付检测治理费2.8万 3. 三倍赔偿差价','2025-04-28',4,7),(7,'2025-04-28 11:30:15.924540','2025-04-28 11:30:15.924540','','','','883c064a-bfc2-49be-a4bc-f524364ac3c8',2,'马力','15967890123','江苏省南京市','川味坊火锅店','15911223344','五华区东风西路99号顺城购物中心','违规改建排烟管道（未报备物业），油烟倒灌至楼上美容院造成客户流失','1. 10日内改造排烟系统 2. 赔偿营业额损失（每月2.5万） 3. 第三方环境检测','2025-04-28',6,8),(8,'2025-04-28 11:32:44.611908','2025-04-28 11:32:44.611908','','','','883c064a-bfc2-49be-a4bc-f524364ac3c8',0,'郑正','15990123456','江苏省南京市','极速达快递驿站','15944556677','南城区鸿福路200号第一国际','未经同意将业主包裹放入自提柜（超期收取保管费），多次投诉未果','1. 停止强制入柜 2. 退还保管费（累计380元） 3. 建立包裹交付确认机制','2025-04-28',7,9),(9,'2025-04-28 11:36:39.384158','2025-04-28 11:36:39.384158','','','','883c064a-bfc2-49be-a4bc-f524364ac3c8',0,'马驰','15977889900','江苏省南京市','广场舞团队A队（领队王某）','15934567890','望京街道方恒国际中心南广场','长期占用社区篮球场（18:30-21:30）并私自加装照明设备，导致青少年无法进行体育活动','1. 恢复场地原用途 2. 拆除违规照明 3. 建立分时段使用制度','2025-04-28',3,10),(10,'2025-04-28 11:38:52.819479','2025-04-28 11:38:52.819479','','','','883c064a-bfc2-49be-a4bc-f524364ac3c8',0,'夏梅','15934567890','江苏省南京市','乐享游乐场运营方','15990123456','重庆市渝中区长江一路62号大坪龙湖时代天街','未检修老化安全扣（上次检修记录2021年），导致游客高空坠落造成腰椎骨折','1. 承担医疗费+康复费28万 2. 停业整顿 3. 建立双人巡检制度','2025-04-28',5,11),(11,'2025-04-28 11:40:30.867701','2025-04-28 11:40:30.867701','','','','883c064a-bfc2-49be-a4bc-f524364ac3c8',0,'春霞','15912345678','江苏省南京市','速达货运公司','15978901234','友谊路32号津利华大酒店附楼','运输途中损坏明清家具（保价金额80万），以\"不可抗力\"为由拒赔（实际为捆扎不当）','1. 按保价全额赔偿 2. 支付文物鉴定费1.2万 3. 公开道歉','2025-04-28',4,13),(12,'2025-04-28 11:42:17.657602','2025-04-28 11:42:17.657602','','','','883c064a-bfc2-49be-a4bc-f524364ac3c8',0,'杨洋','15933445566','江苏省南京市','绿城雅园7号楼业主张某','15999001122','鼓楼区中山北路200号绿城雅园','在私家花园内违规搭建鸽舍（饲养信鸽42只），羽毛粪便污染相邻住户晾晒衣物，引发过敏性皮炎','1. 15日内清理鸽舍 2. 支付衣物干洗费1800元 3. 承担医疗检查费用3200元','2025-04-28',1,15),(13,'2025-04-28 11:45:18.844114','2025-04-28 11:45:18.844114','','','','883c064a-bfc2-49be-a4bc-f524364ac3c8',0,'陈辉','15933489632','江苏省南京市','北辰三角洲9幢1305业主张正','17763985213','海定区学院路北辰三角洲','对方多次将垃圾乱扔，导致楼道环境脏乱差','对方主动将楼道卫生打扫干净，并以后绝对不再乱扔垃圾','2025-04-28',1,18);
/*!40000 ALTER TABLE `index_jiufen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_jiufentype`
--

DROP TABLE IF EXISTS `index_jiufentype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_jiufentype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_jiufentype`
--

LOCK TABLES `index_jiufentype` WRITE;
/*!40000 ALTER TABLE `index_jiufentype` DISABLE KEYS */;
INSERT INTO `index_jiufentype` VALUES (1,'2025-04-27 21:56:01.610652','2025-04-27 21:56:01.610652','邻里纠纷'),(2,'2025-04-27 21:56:08.851776','2025-04-27 21:56:08.851776','物业相关纠纷'),(3,'2025-04-27 21:56:15.317881','2025-04-27 21:56:15.317881','公共资源纠纷'),(4,'2025-04-27 21:56:23.925728','2025-04-27 21:56:23.925728','经济与合同纠纷'),(5,'2025-04-27 21:56:34.302362','2025-04-27 21:56:34.302362','人身安全与权益纠纷'),(6,'2025-04-27 21:57:30.765888','2025-04-27 21:57:30.765888','商业与商户纠纷'),(7,'2025-04-27 21:57:34.644704','2025-04-27 21:57:34.644704','其他');
/*!40000 ALTER TABLE `index_jiufentype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_talk`
--

DROP TABLE IF EXISTS `index_talk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_talk` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `content` longtext,
  `likeCount` int NOT NULL,
  `data_id` varchar(64) DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `is_top` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_talk_author_id_d821e805_fk_index_user_id` (`author_id`),
  CONSTRAINT `index_talk_author_id_d821e805_fk_index_user_id` FOREIGN KEY (`author_id`) REFERENCES `index_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_talk`
--

LOCK TABLES `index_talk` WRITE;
/*!40000 ALTER TABLE `index_talk` DISABLE KEYS */;
INSERT INTO `index_talk` VALUES (1,'2025-04-29 19:48:23.691110','2025-04-29 20:40:01.396676','暴雨导致小区停电超12小时！物业紧急预案呢','“从下午开始停电到现在，电梯停运、手机没信号！老人困在高层下不来，物业连应急灯都没启动！这种极端天气应急预案是摆设吗？”',3,'883c064a-bfc2-49be-a4bc-f524364ac3c8',1,1),(2,'2025-04-29 19:49:06.551634','2025-04-29 19:49:06.551634','垃圾清运时间为何突然改到凌晨5点？','“清运车每天5点作业，孩子总被吵醒哭闹！改时间前是否征求过居民意见？有无替代方案？”',0,'883c064a-bfc2-49be-a4bc-f524364ac3c8',2,0),(3,'2025-04-29 19:49:37.747104','2025-04-29 20:01:48.284306','楼上每晚剁肉馅到半夜，沟通无果求支招！','403住户连续一周深夜剁肉馅，上门沟通反被骂多管闲事！求问合法投诉渠道！',7,'883c064a-bfc2-49be-a4bc-f524364ac3c8',3,0),(4,'2025-04-29 19:50:09.963657','2025-04-29 20:02:04.190008','绿化带被私自改成停车位，没人管吗？','5栋前的草坪被铲平浇了水泥，物业装没看见！公共空间成私人停车场，业委会到底管不管事？',1,'883c064a-bfc2-49be-a4bc-f524364ac3c8',4,0),(5,'2025-04-29 19:55:01.097063','2025-04-29 20:01:58.273481','小区门禁刷脸系统强制推行是否合法？','未经业主投票就安装人脸识别门禁，老人小孩信息被采集后如何保障？强烈要求恢复刷卡出入！',3,'883c064a-bfc2-49be-a4bc-f524364ac3c8',9,0),(6,'2025-04-29 19:55:35.914368','2025-04-29 19:55:35.914368','公共晾衣杆被私装地锁霸占怎么办？','2号楼前晾衣杆被加装三把地锁，晒被子要交‘使用费’！这种歪风必须整治！',0,'883c064a-bfc2-49be-a4bc-f524364ac3c8',9,0),(7,'2025-04-29 19:55:57.408564','2025-04-29 20:01:38.989606','社区食堂定价过高，老年人吃不消！','一荤两素涨到25元，比外卖还贵！说好的老年人补贴呢？请公布成本明细！',3,'883c064a-bfc2-49be-a4bc-f524364ac3c8',8,0),(8,'2025-04-29 20:08:19.279964','2025-04-29 20:39:56.082070','询问驿站地址','请问诸位东湖碧桂园新的快递驿站搬迁到哪里了啦？孩子找不到寄快递的地方了',0,'285ca5e7-712f-4c82-b8a8-75d6e177eda2',1,0);
/*!40000 ALTER TABLE `index_talk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_tousu`
--

DROP TABLE IF EXISTS `index_tousu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_tousu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  `another_user` varchar(64) DEFAULT NULL,
  `text` longtext,
  `phone` varchar(64) DEFAULT NULL,
  `is_ni` smallint NOT NULL,
  `img1` varchar(100) DEFAULT NULL,
  `img2` varchar(100) DEFAULT NULL,
  `data_id` varchar(64) DEFAULT NULL,
  `created_date` date NOT NULL,
  `type_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tousu_type_id_3c6a1638_fk_index_tousutype_id` (`type_id`),
  KEY `index_tousu_user_id_574c14de_fk_index_user_id` (`user_id`),
  CONSTRAINT `index_tousu_type_id_3c6a1638_fk_index_tousutype_id` FOREIGN KEY (`type_id`) REFERENCES `index_tousutype` (`id`),
  CONSTRAINT `index_tousu_user_id_574c14de_fk_index_user_id` FOREIGN KEY (`user_id`) REFERENCES `index_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_tousu`
--

LOCK TABLES `index_tousu` WRITE;
/*!40000 ALTER TABLE `index_tousu` DISABLE KEYS */;
INSERT INTO `index_tousu` VALUES (1,'2025-04-28 10:08:41.923001','2025-04-29 19:27:15.219669','file/uhytxJZzrlrp8d9c471b8b9fa527895e9c4f5b47e94e.jpg','栖霞区仙林街道城管','城管暴力执法，殴打他人','13696327896',1,'','','e5258fa7-db40-4806-b34e-a84caf0e36d9','2025-04-28',2,1),(2,'2025-04-28 10:08:41.923001','2025-04-28 11:01:12.013790','file/uhytxJZzrlrp8d9c471b8b9fa527895e9c4f5b47e94e.jpg','福田供电公司','福田区CBD片区突发大规模停电事故（2023.8.15 14:00-22:00），证券交易所等重要机构受影响，未发布正式故障通报','15911223344',1,'','','e5258fa7-db40-4806-b34e-a84caf0e36d9','2025-04-28',1,3),(3,'2025-04-28 10:08:41.923001','2025-04-28 11:02:27.962796','file/uhytxJZzrlrp8d9c471b8b9fa527895e9c4f5b47e94e.jpg','成都燃气集团','锦江区某老旧小区燃气管道泄漏（经检测甲烷浓度达1.8%），抢修拖延4小时致周边500户居民紧急疏散','15922334455',1,'','','e5258fa7-db40-4806-b34e-a84caf0e36d9','2025-04-28',1,4),(4,'2025-04-28 10:08:41.923001','2025-04-28 11:02:16.904042','file/uhytxJZzrlrp8d9c471b8b9fa527895e9c4f5b47e94e.jpg','西安公交集团','地铁施工期间未增开临时线路，导致高新区早高峰通勤时间超2小时，公交APP实时数据持续显示异常','15933445566',1,'','','e5258fa7-db40-4806-b34e-a84caf0e36d9','2025-04-28',1,5),(5,'2025-04-28 10:08:41.923001','2025-04-28 11:02:07.705945','file/uhytxJZzrlrp8d9c471b8b9fa527895e9c4f5b47e94e.jpg','鲜果乐生鲜超市（静安店）','篡改进口车厘子原产地标签（智利→澳洲），高价销售过期冷链食品','15944556677',1,'','','e5258fa7-db40-4806-b34e-a84caf0e36d9','2025-04-28',4,6),(6,'2025-04-28 10:08:41.923001','2025-04-28 11:01:59.721165','file/uhytxJZzrlrp8d9c471b8b9fa527895e9c4f5b47e94e.jpg','鑫海化工有限公司','夜间通过暗管向长江支流排放含重金属废水（COD超标120倍），伪造环保监测数据','15955667788',1,'','','e5258fa7-db40-4806-b34e-a84caf0e36d9','2025-04-28',2,7),(7,'2025-04-28 10:08:41.923001','2025-04-28 11:01:45.289874','file/uhytxJZzrlrp8d9c471b8b9fa527895e9c4f5b47e94e.jpg','白云新城街道办','放任违规搭建阳光房（涉及12户顶层业主），导致建筑承重结构受损','15966778899',1,'','','e5258fa7-db40-4806-b34e-a84caf0e36d9','2025-04-28',3,8),(8,'2025-04-28 10:08:41.923001','2025-04-28 11:01:37.227241','file/uhytxJZzrlrp8d9c471b8b9fa527895e9c4f5b47e94e.jpg','星耀直播平台','主播虚假宣传翡翠原石','15977889900',1,'','','e5258fa7-db40-4806-b34e-a84caf0e36d9','2025-04-28',4,9),(9,'2025-04-28 10:08:41.923001','2025-04-28 11:01:30.368105','file/uhytxJZzrlrp8d9c471b8b9fa527895e9c4f5b47e94e.jpg','悦途租车','归还车辆时虚构划痕索赔3800元，行车记录仪数据被恶意删除','15988990011',1,'','','e5258fa7-db40-4806-b34e-a84caf0e36d9','2025-04-28',4,10),(10,'2025-04-28 10:08:41.923001','2025-04-28 11:01:19.952184','file/uhytxJZzrlrp8d9c471b8b9fa527895e9c4f5b47e94e.jpg','南山市税务稽查二科','科长王某收受企业贿赂后，将查实的偷税金额从580万修改为80万','15999001122',1,'','','e5258fa7-db40-4806-b34e-a84caf0e36d9','2025-04-28',5,11),(11,'2025-04-28 10:08:41.923001','2025-04-28 11:00:56.989163','file/uhytxJZzrlrp8d9c471b8b9fa527895e9c4f5b47e94e.jpg','省医疗采购中心','在CT设备招标中设置排他性条款，中标价高出市场均价220万/台，相关人员持有供应商股票','15900112233',1,'','','e5258fa7-db40-4806-b34e-a84caf0e36d9','2025-04-28',5,12),(12,'2025-04-28 10:08:41.923001','2025-04-28 10:08:41.935849','file/uhytxJZzrlrp8d9c471b8b9fa527895e9c4f5b47e94e.jpg','南山区粤海城管','城管暴力执法，殴打他人','15912345678',1,'','','e5258fa7-db40-4806-b34e-a84caf0e36d9','2025-04-28',2,13),(13,'2025-04-28 10:08:41.923001','2025-04-28 11:00:43.888344','file/uhytxJZzrlrp8d9c471b8b9fa527895e9c4f5b47e94e.jpg','星空天文研学机构','未兑现专业望远镜观测承诺，实际使用手机星图软件教学，拒绝全额退款','15923456789',1,'','','e5258fa7-db40-4806-b34e-a84caf0e36d9','2025-04-28',4,14);
/*!40000 ALTER TABLE `index_tousu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_tousutype`
--

DROP TABLE IF EXISTS `index_tousutype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_tousutype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_tousutype`
--

LOCK TABLES `index_tousutype` WRITE;
/*!40000 ALTER TABLE `index_tousutype` DISABLE KEYS */;
INSERT INTO `index_tousutype` VALUES (1,'2025-04-27 22:04:35.458208','2025-04-27 22:04:35.458208','公共服务问题'),(2,'2025-04-27 22:04:43.412016','2025-04-27 22:04:43.412016','违法行为举报'),(3,'2025-04-27 22:04:55.355594','2025-04-27 22:04:55.355594','社区管理问题'),(4,'2025-04-27 22:05:08.521787','2025-04-27 22:05:08.521787','消费纠纷投诉'),(5,'2025-04-27 22:05:12.111154','2025-04-27 22:05:12.111154','廉洁纪律问题'),(6,'2025-04-27 22:06:17.320150','2025-04-27 22:06:17.320150','其他');
/*!40000 ALTER TABLE `index_tousutype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_tuwen`
--

DROP TABLE IF EXISTS `index_tuwen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_tuwen` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `created_date` date NOT NULL,
  `text` longtext,
  `img` varchar(100) DEFAULT NULL,
  `type_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tuwen_type_id_e404fd21_fk_index_tuwentype_id` (`type_id`),
  CONSTRAINT `index_tuwen_type_id_e404fd21_fk_index_tuwentype_id` FOREIGN KEY (`type_id`) REFERENCES `index_tuwentype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_tuwen`
--

LOCK TABLES `index_tuwen` WRITE;
/*!40000 ALTER TABLE `index_tuwen` DISABLE KEYS */;
INSERT INTO `index_tuwen` VALUES (1,'2025-04-27 20:25:29.501324','2025-04-27 20:25:29.501324','“最美科技工作者”学习宣传活动的通知','2025-04-27','为全面贯彻党的二十大和二十届二中、三中全会精神，大力弘扬科学家精神，服务朝阳高质量发展，激发科技工作者的荣誉感、自豪感、责任感，营造关注和尊重科技工作者良好氛围。现在全区广泛开展“最美科技工作者”学习宣传活动','tuwen/屏幕截图_2025-04-27_202516.png',3),(2,'2025-04-27 20:26:16.201072','2025-04-27 20:26:16.201072','阳光体育活力校园展示交流活动开启报名','2025-04-27','为深入贯彻党的二十大和二十届二中、三中全会精神，落实全国教育大会精神，实施《教育强国建设规划纲要（2024—2035年》，进一步树立“健康第一”教育理念，健全德智体美劳全面培养体系，加快补齐体育教育短板，促进学生健康成长、全面发展，中国教育学会体育与卫生分会拟于5月15日至18日联合教育部中小学体育教学指导委员会、重庆市教育学会于重庆共同主办第六届中小学促进学生体质强健校长研讨会暨阳光体育活力校园展示交流活动。','tuwen/屏幕截图_2025-04-25_215637.png',3),(3,'2025-04-27 20:27:00.582137','2025-04-27 20:27:00.582137','公安部出品《防诈手册》','2025-04-27','为进一步扩大反诈宣传覆盖面，提高广大群众防骗意识，国家反诈中心制作了《防范电信网络诈骗宣传手册》，向广大人民群众介绍了十种常见的电信网络诈骗类型，揭批了诈骗犯罪手法、文末有防骗神器，同时进行了防骗提示。','tuwen/屏幕截图_2025-04-25_215826.png',2),(4,'2025-04-27 20:27:23.382702','2025-04-27 20:27:23.382702','每日一典|一起学习《中华人民共和国民法典》','2025-04-27','民法典共7编、1260条，各编依次为总则、物权、合同、人格权、婚姻家庭、继承、侵权责任，以及附则。通篇贯穿以人民为中心的发展思想，着眼满足人民对美好生活的需要，对公民的人身权、财产权、人格权等作出明确详实的规定，并规定侵权责任，明确权利受到削弱、减损、侵害时的请求权和救济权等，体现了对人民权利的充分保障，被誉为“新时代人民权利的宣言书”。今天我们学习第二编 物权 第二分编 所有权 第七章 相邻关系 第二百八十八条、第二百八十九条。','tuwen/屏幕截图_2025-04-25_215741.png',1),(5,'2025-04-29 19:39:34.650073','2025-04-29 19:39:34.650073','反诈知识竞赛报名','2025-04-29','近期电信诈骗案件频发，为保护人民群众生命财产安全，我街道拟于2025年4月30日于东湖社区党群服务中心开展反诈知识竞赛。','tuwen/deering.jpg',3);
/*!40000 ALTER TABLE `index_tuwen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_tuwentype`
--

DROP TABLE IF EXISTS `index_tuwentype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_tuwentype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_tuwentype`
--

LOCK TABLES `index_tuwentype` WRITE;
/*!40000 ALTER TABLE `index_tuwentype` DISABLE KEYS */;
INSERT INTO `index_tuwentype` VALUES (1,'2025-04-27 20:23:09.677096','2025-04-27 20:23:09.677096','普法宣传'),(2,'2025-04-27 20:23:20.726928','2025-04-27 20:23:20.726928','反诈预警'),(3,'2025-04-27 20:23:27.323520','2025-04-27 20:23:27.323520','活动通知');
/*!40000 ALTER TABLE `index_tuwentype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_user`
--

DROP TABLE IF EXISTS `index_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `phone` varchar(128) DEFAULT NULL,
  `open_id` varchar(64) DEFAULT NULL,
  `avatar` varchar(100) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `username` varchar(64) NOT NULL,
  `address` longtext,
  `role` smallint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_user`
--

LOCK TABLES `index_user` WRITE;
/*!40000 ALTER TABLE `index_user` DISABLE KEYS */;
INSERT INTO `index_user` VALUES (1,'2025-04-27 20:18:14.466982','2025-04-29 21:42:07.778651','61afe6519d044ae59e5153e193df505a','17758036983','ozyOd54DuJIyiokjgR8rRw2sVuE4','avatar/20250427090051.jpg','abc123','Charlie','江苏省南京市栖霞区仙林街道中共南京市栖霞区委员会南京市栖霞区人民政府',0),(2,'2025-04-27 20:19:05.379636','2025-04-29 20:34:30.085334','98ebcf863ae647d5a1ccf06ce50e17cb','13696327896','ozyOd56vtR54V4nWKq3EXTZG_fLQ','avatar/t016eeb47f29fa12fa0.jpg','bb123456','biu','陆家嘴环路123号银城大厦东塔26层2608室',0),(3,'2025-04-27 20:18:14.466982','2025-04-29 20:34:14.602008','a3e8b0125f2d4a9cb7890c1d3e5f7a21','15911223344','xYzAbC123dEfGhIjKlMnOpQrStUv','avatar/t011408ea7ac25f372c.jpg','p@ssw0rd1','Emma','七莘路3555号万科城市花园新区6栋1501室',1),(4,'2025-04-27 20:18:14.466982','2025-04-29 20:33:53.219504','b45c6d78e901234567890fedcba54321','15922334455','qWeRtYuIoP123aSbCdEfGhJkLmZ','avatar/wallhaven-1pd1o9.jpg','test1234','Liam','真北路788号近铁城市广场北座公寓21层2103室',0),(5,'2025-04-27 20:18:14.466982','2025-04-29 20:33:36.505621','c56d7e89fa1234567890123456789abc','15933445566','zXcVbNmAsDfGhJkLpOiUyTrEwQ2','avatar/wallparper.jpg','myp@ss2','Olivia','海宁路555号龙之梦雅士大厦D栋14层1407室',0),(6,'2025-04-27 20:18:14.466982','2025-04-29 20:33:24.155143','d67e8f901b234567890123456789abcd','15944556677','kLjHgFdSqAzXcVbNmQwErTyUiOp','avatar/wallparper2.jpg','abc987zy','Noah','邯郸路220号复旦大学教职工宿舍区10栋502室',1),(7,'2025-04-27 20:18:14.466982','2025-04-29 20:32:53.355870','e78f9a012c34567890123456789abcde','15955667788','pOiUyTrEwQzXcVbNmAsDfGhJkL','avatar/OHR.SanGiovanni_ZH-CN3184593519_UHD.jpg','qwerty88','Ava','天山路1718号缤谷广场西座7层701室',0),(8,'2025-04-27 20:18:14.466982','2025-04-29 20:32:39.423166','f89a0b123d4567890123456789abcdef','15966778899','mNbVcXzZlKjHgFdSqApOiUyTrEw','avatar/OHR.QuebecFrontenac_ZH-CN9519096458_UHD.jpg','1qaz2wsx','健身老刘','延安中路1000号嘉里中心行政公寓12层1204室',2),(9,'2025-04-27 20:18:14.466982','2025-04-29 20:32:13.308174','0a1b2c3d4e5f67890fedcba54321fedc','15977889900','aQsWdEfRgTzXcVbNmJlKyHuGiOp','avatar/OHR.GroundhogThree_ZH-CN6720558481_UHD.jpg','zxcvbnm1','Sophia','中山南路28号外滩SOHO C座19层1909室',0),(10,'2025-04-27 20:18:14.466982','2025-04-29 20:35:04.715652','1b2c3d4e5f6a7890123456789abcdef0','15988990011','bErTyUiOpLkJhGfDsAqWeRtZuIo','avatar/75e11ee1522d6da30a7ba3842751ba3.jpg','pass1234','红星恒大业委会赵叔','沙湾街道红星恒大12幢1单元102户',1),(11,'2025-04-27 20:18:14.466982','2025-04-29 20:31:57.292300','2c3d4e5f6a7b890123456789abcdef01','15999001122','cVbNmAsDfGhJkLpOiUyTrEwQzX','avatar/OHR.AtraniAmalfi_ZH-CN6391731688_UHD.jpg','test5678','Isabella','龙华路2577号创意大院2号楼8层808室',0),(12,'2025-04-27 20:18:14.466982','2025-04-29 20:31:34.110395','3d4e5f6a7b8c90123456789abcdef012','15900112233','dFgHjKlMnOqRsTuVwXyZaBcDeFg','avatar/mac3.jpg','mima2023','Benjamin','世纪大道100号环球金融中心公寓楼32层3201室',1),(13,'2025-04-27 20:18:14.466982','2025-04-29 20:31:19.560700','4e5f6a7b8c9d0123456789abcdef0123','15912345678','eRtYuIvOpQwErTyUiOpLkJhGfDs','avatar/mac2.jpg','hello123','Mia','沪太路3999号智慧湾科创园B区6号楼1106室',0),(14,'2025-04-27 20:18:14.466982','2025-04-29 20:31:05.945201','5f6a7b8c9d0e123456789abcdef01234','15923456789','fGhJkLmNoPqRsTuVwXyZaBcDeFg','avatar/mac1.jpg','welcome1','Elijah','虹泉路1000号韩国街金汇花园1单元805室',0),(15,'2025-04-27 20:18:14.466982','2025-04-29 20:30:54.362118','6a7b8c9d0e1f23456789abcdef012345','15934567890','gHiJkLmNoPrStUvWxYzAbCdEfGh','avatar/Desktop-1920x1080-Sailing_rDvNoUL.jpg','pass2023','Charlotte','金沙江路188号环球港住宅区3栋2102室',0),(16,'2025-04-27 20:18:14.466982','2025-04-29 20:30:41.346698','7b8c9d0e1f2a3456789abcdef0123456','15945678901','hIjKlMnOpQrStUvWxYzAbCdEfGh','avatar/Desktop-1920x1080-Sailing.jpg','abc12345','碧桂园物业小李','四川北路1666号中信广场西塔18层1803室',1),(17,'2025-04-27 20:18:14.466982','2025-04-29 20:30:29.213735','8c9d0e1f2a3b456789abcdef01234567','15956789012','iJkLmNoPqRsTuVwXyZaBcDeFgHi','avatar/Desktop-1920x1080-Lakeside.jpg','nanjing1','Amelia','国定路335号创智天地园区7号楼501室',0),(18,'2025-04-27 20:18:14.466982','2025-04-29 20:30:12.714407','9d0e1f2a3b4c56789abcdef012345678','15967890123','jKlMnOpQrStUvWxYzAbCdEfGhIj','avatar/Desktop-1920x1080-Deering.jpg','testtest','Mason','虹桥路1999号天山星城9栋304室',0),(19,'2025-04-27 20:18:14.466982','2025-04-29 20:29:55.881818','0e1f2a3b4c5d6789abcdef0123456789','15978901234','kLmNoPrStUvWxYzAbCdEfGhIjKl','avatar/Desktop-1920x1080-Campus.jpg','iloveyou','Harper','南京西路1788号恒隆广场公寓C栋22层2205室',0),(20,'2025-04-27 20:18:14.466982','2025-04-29 20:29:44.566578','1f2a3b4c5d6e7890bcdef0123456789a','15989012345','lMnOpQrStUvWxYzAbCdEfGhIjKk','avatar/deering.jpg','sunshine','Ethan','淮海中路1024号梧桐公馆5单元1207室',2),(21,'2025-04-27 20:18:14.466982','2025-04-29 20:29:25.300098','2a3b4c5d6e7f8901cdef0123456789ab','15990123456','mNoPqRsTuVwXyZaBcDeFgHiJkLl','avatar/7257241410_1a87dc5888_b.jpg','football','东湖社区李主任','南京东路233号世纪商务中心3号楼2108室',1),(22,'2025-04-27 20:18:14.466982','2025-04-29 20:34:46.200424','3b4c5d6e7f8a9012def0123456789abc','15901234567','nOpQrStUvWxYzAbCdEfGhIjKlMm','avatar/t011408ea7ac25f372c_l2nJksn.jpg','spring20','Alexander','张江镇科苑路888号创新科技大厦A座15层1503室',0);
/*!40000 ALTER TABLE `index_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_user_dianzan_list`
--

DROP TABLE IF EXISTS `index_user_dianzan_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_user_dianzan_list` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `talk_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_dianzan_list_user_id_talk_id_57907c18_uniq` (`user_id`,`talk_id`),
  KEY `index_user_dianzan_list_talk_id_de8ded7e_fk_index_talk_id` (`talk_id`),
  CONSTRAINT `index_user_dianzan_list_talk_id_de8ded7e_fk_index_talk_id` FOREIGN KEY (`talk_id`) REFERENCES `index_talk` (`id`),
  CONSTRAINT `index_user_dianzan_list_user_id_ec96e193_fk_index_user_id` FOREIGN KEY (`user_id`) REFERENCES `index_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_user_dianzan_list`
--

LOCK TABLES `index_user_dianzan_list` WRITE;
/*!40000 ALTER TABLE `index_user_dianzan_list` DISABLE KEYS */;
INSERT INTO `index_user_dianzan_list` VALUES (1,1,1);
/*!40000 ALTER TABLE `index_user_dianzan_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_yichang`
--

DROP TABLE IF EXISTS `index_yichang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_yichang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `text` longtext,
  `phone` varchar(64) DEFAULT NULL,
  `created_date` date NOT NULL,
  `type_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_yichang_type_id_e8b4e59d_fk_index_yichangtype_id` (`type_id`),
  KEY `index_yichang_user_id_dd414a1c_fk_index_user_id` (`user_id`),
  CONSTRAINT `index_yichang_type_id_e8b4e59d_fk_index_yichangtype_id` FOREIGN KEY (`type_id`) REFERENCES `index_yichangtype` (`id`),
  CONSTRAINT `index_yichang_user_id_dd414a1c_fk_index_user_id` FOREIGN KEY (`user_id`) REFERENCES `index_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_yichang`
--

LOCK TABLES `index_yichang` WRITE;
/*!40000 ALTER TABLE `index_yichang` DISABLE KEYS */;
INSERT INTO `index_yichang` VALUES (1,'2025-04-28 09:14:24.564998','2025-04-29 19:26:42.386695','','朝阳区人民广场南侧长椅处','一名疑似精神异常人员在广场长时间徘徊，存在攻击性言语','17758036983','2025-04-28',4,1),(2,'2025-04-28 09:14:59.524353','2025-04-28 09:14:59.524353','','长宁街道花园小区2栋301室','独居老人连续3天未取快递，社区上门发现其昏迷','15911223344','2025-04-28',4,3),(3,'2025-04-28 09:15:39.724160','2025-04-28 09:15:39.724160','','西郊工业园区东侧荒地','废弃工厂周边发现大量医疗垃圾非法倾倒','15933445566','2025-04-28',3,5),(4,'2025-04-28 09:16:22.935771','2025-04-28 09:16:22.935771','','南华路39号幸福里小区','老旧小区外墙瓷砖大面积脱落未修复','15955667788','2025-04-28',2,7),(5,'2025-04-28 09:16:59.410151','2025-04-28 09:16:59.410151','','阳光幼儿园东侧围墙','幼儿园围栏间隙过大，儿童可钻出至马路','15956789012','2025-04-28',2,17),(6,'2025-04-28 09:18:39.980819','2025-04-28 09:18:39.980819','','解放西路步行街第12号井位','商业街井盖缺失3日未修复','15989012345','2025-04-28',2,20),(7,'2025-04-28 09:19:19.263749','2025-04-28 09:19:19.263749','','中山北路与解放路交叉口','主干道路口红绿灯系统故障引发多起抢行事故','15977889900','2025-04-28',1,9),(8,'2025-04-28 09:20:23.997483','2025-04-28 09:20:23.997483','','高新区科技园信号塔','网络基站遭雷击','15923456789','2025-04-28',5,14),(9,'2025-04-28 09:21:51.974741','2025-04-28 09:21:51.974741','','大学城理工学院实验楼外围','外籍人员深夜在高校实验室区徘徊，经查无合法访问权限','15934567890','2025-04-28',4,15),(10,'2025-04-28 09:22:36.944322','2025-04-28 09:22:36.944322','','青山镇王家村灌溉渠上游','农田灌溉渠遭化工厂偷排含铬废水，鱼类大面积死亡','15978901234','2025-04-28',3,19),(11,'2025-04-28 09:23:39.307905','2025-04-28 09:23:39.307905','','胜利村137号自建房片区','城中村私拉电线为电动车充电引发连环短路','15945678901','2025-04-28',2,16),(12,'2025-04-28 09:24:35.704242','2025-04-28 09:24:35.704242','','世纪豪庭小区3号楼电梯间','高层住宅电梯年检过期仍运行，多次发生骤停故障','15978901234','2025-04-28',2,19),(13,'2025-04-28 09:25:29.472651','2025-04-28 09:25:29.472651','','金茂国际社区B区地下车库','地下车库消防通道被电动车长期堵塞，存在火灾逃生隐患','15944556677','2025-04-28',2,6),(14,'2025-04-28 09:26:39.423791','2025-04-28 09:26:39.423791','','梧桐大道沿线12个公交站点','智慧公交站台显示屏集体黑屏，实时信息无法查询','15900112233','2025-04-28',1,12);
/*!40000 ALTER TABLE `index_yichang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_yichangtype`
--

DROP TABLE IF EXISTS `index_yichangtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_yichangtype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_yichangtype`
--

LOCK TABLES `index_yichangtype` WRITE;
/*!40000 ALTER TABLE `index_yichangtype` DISABLE KEYS */;
INSERT INTO `index_yichangtype` VALUES (1,'2025-04-27 22:03:38.827870','2025-04-27 22:03:38.827870','公共设施故障'),(2,'2025-04-27 22:03:56.496849','2025-04-27 22:03:56.496849','社区安全隐患'),(3,'2025-04-27 22:04:04.329911','2025-04-27 22:04:04.329911','环境污染问题'),(4,'2025-04-27 22:06:56.350983','2025-04-27 22:06:56.350983','异常人员预警'),(5,'2025-04-27 22:07:00.037115','2025-04-27 22:07:00.037115','其他');
/*!40000 ALTER TABLE `index_yichangtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'jczl'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-29 21:50:26
