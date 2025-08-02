-- MySQL dump 10.13  Distrib 9.3.0, for macos15.2 (arm64)
--
-- Host: localhost    Database: portfolio_site_db
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `skills_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'HTML','Frontend','fab fa-html5','Markup language for web pages.','2025-06-07 23:14:36','2025-07-05 17:27:39'),(2,'CSS','Frontend','fab fa-css3-alt','Style sheet language for designing web pages.','2025-06-07 23:14:36','2025-07-05 17:27:39'),(3,'JavaScript','Frontend','fab fa-js','Programming language for interactive web apps.','2025-06-07 23:14:36','2025-07-05 17:27:39'),(4,'PHP','Backend','fab fa-php','Server-side scripting language.','2025-06-07 23:14:36','2025-07-05 17:27:39'),(5,'Laravel','Backend','fab fa-laravel','PHP web framework for modern applications.','2025-06-07 23:14:36','2025-07-05 17:28:11'),(6,'Vue.js','Frontend','fab fa-js',NULL,'2025-06-27 16:57:31','2025-07-05 17:27:39'),(7,'TypeScript','Frontend','devicon-typescript-plain',NULL,'2025-07-05 17:19:48','2025-07-05 17:32:14'),(8,'Next.js','Frontend','devicon-nextjs-original',NULL,'2025-07-05 17:35:10','2025-07-05 17:42:11'),(9,'Sass','Frontend','devicon-sass-original','CSS preprocessor with variables, mixins, and nesting.','2025-07-05 17:43:05','2025-07-05 17:43:05'),(10,'Tailwind CSS','Frontend','devicon-tailwindcss-plain','Utility-first CSS framework for styling.','2025-07-05 17:43:23','2025-07-05 17:43:23'),(11,'Node.js','Backend','devicon-nodejs-plain','JavaScript runtime built on Chrome\'s V8 engine for backend development.','2025-07-05 17:45:28','2025-07-05 17:45:28'),(12,'Express','Backend','devicon-express-original','Minimalist web framework for Node.js.','2025-07-05 17:45:37','2025-07-05 17:45:37'),(13,'Python','Backend','devicon-python-plain','High-level programming language known for readability and versatility.','2025-07-05 17:45:45','2025-07-05 17:45:45'),(14,'FastAPI','Backend','devicon-fastapi-plain','Modern Python web framework for building APIs quickly and efficiently.','2025-07-05 17:45:56','2025-07-05 17:45:56'),(15,'Spring Boot','Backend','devicon-spring-plain','Java-based framework for creating standalone, production-grade Spring applications.','2025-07-05 17:46:04','2025-07-05 17:46:04'),(16,'MySQL','Database','devicon-mysql-plain','Popular open-source relational database.','2025-07-05 17:46:13','2025-07-05 17:46:13'),(17,'PostgreSQL','Database','devicon-postgresql-plain','Advanced open-source relational database with rich features.','2025-07-05 17:46:20','2025-07-05 17:46:20'),(18,'MongoDB','Database','devicon-mongodb-plain','NoSQL database for scalable and flexible data storage.','2025-07-05 17:46:30','2025-07-05 17:46:30'),(19,'Jest','Other','devicon-jest-plain','JavaScript testing framework maintained by Meta.','2025-07-05 17:46:40','2025-07-05 17:46:40'),(20,'Docker','Other','devicon-docker-plain','Platform for developing, shipping, and running applications in containers.','2025-07-05 17:46:48','2025-07-05 17:46:48'),(21,'GitHub Actions','DevOps','fab fa-github','CI/CD automation with GitHub Actions.','2025-07-05 17:50:28','2025-07-05 17:50:28'),(22,'CI/CD','DevOps','fas fa-sync-alt','Continuous Integration and Continuous Deployment.','2025-07-05 17:50:43','2025-07-05 17:50:43'),(23,'AWS','Infrastructure','fab fa-aws','Amazon Web Services cloud platform.','2025-07-05 17:50:55','2025-07-05 17:50:55'),(24,'GCP','Infrastructure','fab fa-google','Google Cloud Platform services.','2025-07-05 17:51:07','2025-07-05 17:51:07'),(25,'Nginx','Infrastructure','fab fa-nginx','High performance web server and reverse proxy.','2025-07-05 17:51:26','2025-07-05 17:51:26'),(26,'Figma','Other','fab fa-figma','Collaborative interface design tool.','2025-07-05 17:51:40','2025-07-13 17:39:25'),(27,'Notion','Other','fas fa-sticky-note','All-in-one workspace for notes and project management.','2025-07-05 17:51:50','2025-07-13 17:39:25'),(28,'Slack','Other','fab fa-slack','Team communication and collaboration platform.','2025-07-05 17:52:25','2025-07-13 17:39:25'),(29,'React','Frontend','devicon-react-original','JavaScript library for building user interfaces.','2025-07-10 00:11:20','2025-07-10 00:11:20');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-31 19:27:17
