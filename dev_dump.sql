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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'John Doe','john@example.com','This is a test contact message.','2025-06-07 23:14:36','2025-06-07 23:14:36');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience_project`
--

DROP TABLE IF EXISTS `experience_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience_project` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `experience_id` bigint unsigned NOT NULL,
  `project_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `experience_project_experience_id_foreign` (`experience_id`),
  KEY `experience_project_project_id_foreign` (`project_id`),
  CONSTRAINT `experience_project_experience_id_foreign` FOREIGN KEY (`experience_id`) REFERENCES `experiences` (`id`) ON DELETE CASCADE,
  CONSTRAINT `experience_project_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience_project`
--

LOCK TABLES `experience_project` WRITE;
/*!40000 ALTER TABLE `experience_project` DISABLE KEYS */;
INSERT INTO `experience_project` VALUES (25,13,19,'2025-08-01 04:24:48','2025-08-01 04:24:48'),(26,13,20,'2025-08-02 01:58:17','2025-08-02 01:58:17'),(27,13,21,'2025-08-02 04:42:11','2025-08-02 04:42:11'),(28,14,22,'2025-08-02 07:20:51','2025-08-02 07:20:51'),(29,14,23,'2025-08-02 08:29:48','2025-08-02 08:29:48'),(30,15,24,'2025-08-02 23:34:10','2025-08-02 23:34:10'),(32,16,25,'2025-08-04 01:37:29','2025-08-04 01:37:29'),(33,17,26,'2025-11-15 22:53:40','2025-11-15 22:53:40');
/*!40000 ALTER TABLE `experience_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiences`
--

DROP TABLE IF EXISTS `experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiences`
--

LOCK TABLES `experiences` WRITE;
/*!40000 ALTER TABLE `experiences` DISABLE KEYS */;
INSERT INTO `experiences` VALUES (13,'プログラミングスクール受講','オンラインキャンプ','2023年1月〜2023年5月','・PHPとMySQL(phpMyAdmin)でのDB構築/操作を中心としたバックエンドの基礎を学習。\n・簡単なCRUD機能を実装しながら、HTML/CSSによるフロントの基本構築も行う。\n\n＊英語会話受講。\n＊PGスクールを英語受講。','2025-08-01 02:26:09','2025-11-15 21:44:55'),(14,'個人開発（飲食店向け）','飲食店','2023年7月〜2024年3月','従業員として勤務しながら開発。\n・商材撮影/画像編集。\n・設計(基本設計、DB設計、デザイン)。\n・開発(開発/本番環境構築、Frontend、Backend、本番環境デプロイ)。\n・運用/改修。\n・マニュアル作成。\nなど一貫して担当。','2025-08-02 07:20:51','2025-11-15 21:41:44'),(15,'業務系Webエンジニア（社内SE）','建設業','2024年4月〜現在','・建設系の社内IT担当チームとして、複数の社内業務システムや社内外Webサイトの改修/保守/運用を担当。','2025-08-02 22:42:33','2025-11-15 22:56:48'),(16,'個人開発（ポートフォリオサイト）','個人プロジェクト','2025年4月〜2025年7月','・構想〜要件定義/設計〜開発〜一般公開までの流れの経験と、設計力/開発力/継続力/忍耐力などの証明の一つになると考え、制作物と人物像を紹介する当サイトを開発。\n・自己の今後のブランディングも兼ねて活用。','2025-08-03 00:34:52','2025-11-15 21:53:35'),(17,'個人開発（資産運用AI）','個人プロジェクト','2025年2月〜現在','個人的課題を解決する目的で開発を開始。\n・MVP 含め、バージョン5までの構想を策定済み。\n・保守性/拡張性/セキュリティ/整合性/リアルタイム性を重視した開発方針。\n・テストは自動化可能な設計を計画中。\n・予定環境　→プロトタイプ：VPS。\n　　　　　　→正式版：AWSへ移行予定。\n\n<<補足>>\n現階では、研究開発目的として、公開情報から一部データ取得を行っおり、商用利用/再配布は行わず、将来的に公的API/ライセンスデータソースに完全移行予定。','2025-11-15 22:53:40','2025-11-15 22:54:55');
/*!40000 ALTER TABLE `experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_06_07_163813_create_posts_table',1),(5,'2025_06_08_030312_create_skills_table',1),(6,'2025_06_08_054047_create_profiles_table',1),(7,'2025_06_08_054056_create_projects_table',1),(8,'2025_06_08_054111_create_project_skill_table',1),(9,'2025_06_08_054119_create_contacts_table',1),(10,'2025_06_22_090441_create_experiences_table',2),(11,'2025_06_28_005547_create_personal_access_tokens_table',3),(12,'2025_06_28_112353_create_experience_project_table',4),(13,'2025_07_06_022519_add_category_to_skills_table',5),(14,'2025_07_26_061440_change_image_url_to_image_urls_in_projects_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'api-token-name','a09a7aaba7a1c9d6cbb0e68b8854dcb36e20aebe151247fe5edf89e45db4898c','[\"*\"]','2025-07-13 22:52:07',NULL,'2025-06-27 21:15:19','2025-07-13 22:52:07'),(2,'App\\Models\\User',1,'admin-token','a2a9d35e11ded7113b1968d8da7a3a6baf9bfe9947baa7ec0e7387c4e9f25c8c','[\"*\"]',NULL,NULL,'2025-07-08 15:56:41','2025-07-08 15:56:41'),(3,'App\\Models\\User',1,'admin-token','2084db2896f26423f8587720e893828b44943d808d60225783cde4f8be5eda78','[\"*\"]',NULL,NULL,'2025-07-08 15:57:15','2025-07-08 15:57:15'),(4,'App\\Models\\User',1,'admin-token','1e7a700d165f624e31dfb79f3b732c6afc65a65733795668b53f7abb371b793d','[\"*\"]',NULL,NULL,'2025-07-08 16:05:59','2025-07-08 16:05:59'),(5,'App\\Models\\User',1,'admin-token','f67bf627ea0b166991c2ceab7cf81d70564026a4d1d490db5230e541f733150b','[\"*\"]',NULL,NULL,'2025-07-08 16:06:15','2025-07-08 16:06:15'),(22,'App\\Models\\User',1,'admin-token','019a351012ac63d6aeec10a8d6b2c06dde48da569f8038f2f521d392df0f34c2','[\"*\"]','2025-07-13 15:55:07',NULL,'2025-07-12 22:24:23','2025-07-13 15:55:07'),(27,'App\\Models\\User',1,'admin-token','8215ffbb0924039abbe2d3a82cbe2645d6bf0b0f4b021267f43e65a3990289c8','[\"*\"]',NULL,NULL,'2025-07-13 23:18:18','2025-07-13 23:18:18'),(28,'App\\Models\\User',1,'admin-token','6f9bb2f8ae05f594fe3fbbb3630891fe5c76e7eb9c581e79ff05e8b3a6f8472e','[\"*\"]','2025-07-14 01:24:25',NULL,'2025-07-13 23:34:30','2025-07-14 01:24:25'),(29,'App\\Models\\User',1,'admin-token','aed497171ddb969e3d628992c556cd77006240a6cdcb3107334ea3e93d2ae88f','[\"*\"]',NULL,NULL,'2025-07-17 03:48:27','2025-07-17 03:48:27');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sns_links` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profiles_user_id_foreign` (`user_id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,1,'I am a full-stack developer with a passion for learning.','Tokyo, Japn','https://example.com',NULL,NULL,'2025-06-07 23:14:36','2025-06-07 23:14:36');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_skill`
--

DROP TABLE IF EXISTS `project_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_skill` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint unsigned NOT NULL,
  `skill_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_skill_project_id_foreign` (`project_id`),
  KEY `project_skill_skill_id_foreign` (`skill_id`),
  CONSTRAINT `project_skill_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_skill_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_skill`
--

LOCK TABLES `project_skill` WRITE;
/*!40000 ALTER TABLE `project_skill` DISABLE KEYS */;
INSERT INTO `project_skill` VALUES (116,19,1,'2025-08-01 04:12:49','2025-08-01 04:12:49'),(117,19,2,'2025-08-01 04:12:49','2025-08-01 04:12:49'),(118,20,1,'2025-08-02 01:58:09','2025-08-02 01:58:09'),(119,20,2,'2025-08-02 01:58:09','2025-08-02 01:58:09'),(120,20,4,'2025-08-02 01:58:09','2025-08-02 01:58:09'),(121,20,16,'2025-08-02 01:58:09','2025-08-02 01:58:09'),(122,21,1,'2025-08-02 04:40:04','2025-08-02 04:40:04'),(123,21,2,'2025-08-02 04:40:04','2025-08-02 04:40:04'),(124,21,4,'2025-08-02 04:40:04','2025-08-02 04:40:04'),(125,21,16,'2025-08-02 04:40:04','2025-08-02 04:40:04'),(126,22,1,'2025-08-02 05:11:37','2025-08-02 05:11:37'),(127,22,2,'2025-08-02 05:11:37','2025-08-02 05:11:37'),(128,22,30,'2025-08-02 06:03:07','2025-08-02 06:03:07'),(129,22,32,'2025-08-02 06:03:07','2025-08-02 06:03:07'),(130,20,30,'2025-08-02 06:18:00','2025-08-02 06:18:00'),(131,20,32,'2025-08-02 06:18:00','2025-08-02 06:18:00'),(132,19,30,'2025-08-02 06:18:16','2025-08-02 06:18:16'),(133,19,32,'2025-08-02 06:18:16','2025-08-02 06:18:16'),(134,19,28,'2025-08-02 06:18:16','2025-08-02 06:18:16'),(135,20,28,'2025-08-02 06:18:23','2025-08-02 06:18:23'),(136,21,28,'2025-08-02 06:18:29','2025-08-02 06:18:29'),(137,23,1,'2025-08-02 08:20:25','2025-08-02 08:20:25'),(138,23,2,'2025-08-02 08:20:25','2025-08-02 08:20:25'),(139,23,4,'2025-08-02 08:20:25','2025-08-02 08:20:25'),(140,23,16,'2025-08-02 08:20:25','2025-08-02 08:20:25'),(141,23,30,'2025-08-02 08:20:25','2025-08-02 08:20:25'),(142,23,32,'2025-08-02 08:20:25','2025-08-02 08:20:25'),(143,24,3,'2025-08-02 23:31:52','2025-08-02 23:31:52'),(144,24,1,'2025-08-02 23:31:52','2025-08-02 23:31:52'),(145,24,2,'2025-08-02 23:31:52','2025-08-02 23:31:52'),(146,24,4,'2025-08-02 23:31:52','2025-08-02 23:31:52'),(147,24,34,'2025-08-02 23:38:52','2025-08-02 23:38:52'),(148,24,36,'2025-08-02 23:38:52','2025-08-02 23:38:52'),(149,24,33,'2025-08-02 23:42:13','2025-08-02 23:42:13'),(150,21,35,'2025-08-02 23:42:36','2025-08-02 23:42:36'),(151,20,35,'2025-08-02 23:42:55','2025-08-02 23:42:55'),(152,23,35,'2025-08-02 23:43:10','2025-08-02 23:43:10'),(153,25,10,'2025-08-03 00:44:48','2025-08-03 00:44:48'),(154,25,29,'2025-08-03 00:44:48','2025-08-03 00:44:48'),(155,25,3,'2025-08-03 00:44:48','2025-08-03 00:44:48'),(156,25,4,'2025-08-03 00:44:48','2025-08-03 00:44:48'),(157,25,5,'2025-08-03 00:44:48','2025-08-03 00:44:48'),(158,25,16,'2025-08-03 00:44:48','2025-08-03 00:44:48'),(159,25,30,'2025-08-03 00:44:48','2025-08-03 00:44:48'),(160,25,32,'2025-08-03 00:44:48','2025-08-03 00:44:48'),(161,26,3,'2025-10-31 15:45:13','2025-10-31 15:45:13'),(162,26,10,'2025-10-31 15:45:13','2025-10-31 15:45:13'),(163,26,7,'2025-10-31 15:45:13','2025-10-31 15:45:13'),(164,26,29,'2025-10-31 15:45:13','2025-10-31 15:45:13'),(165,26,13,'2025-10-31 15:45:13','2025-10-31 15:45:13'),(166,26,15,'2025-10-31 15:45:13','2025-10-31 15:45:13'),(167,26,14,'2025-10-31 15:45:13','2025-10-31 15:45:13'),(168,26,17,'2025-10-31 15:45:13','2025-10-31 15:45:13'),(169,26,26,'2025-10-31 15:45:13','2025-10-31 15:45:13'),(170,26,20,'2025-10-31 15:45:13','2025-10-31 15:45:13'),(171,26,32,'2025-10-31 15:45:13','2025-10-31 15:45:13'),(172,26,30,'2025-10-31 15:45:13','2025-10-31 15:45:13'),(173,26,28,'2025-10-31 15:45:13','2025-10-31 15:45:13');
/*!40000 ALTER TABLE `project_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `demo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_urls` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_user_id_foreign` (`user_id`),
  CONSTRAINT `projects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (19,1,'コーヒー豆オンラインショップ','HTMLとCSSによる静的Webサイト。 \n架空のカフェサイトを題材に、ヘッダー、バナー、商品一覧、予約フォーム、フッターといった主要セクションを構築。',NULL,'https://github.com/yuya-inada/coffee_bean/blob/main/coffee-bean/index.html',NULL,'2025-08-01 04:12:49','2025-11-15 22:04:00','[\"http://localhost:8000/images/coffee_1.jpeg\", \"http://localhost:8000/images/coffee_2.jpeg\", \"http://localhost:8000/images/coffee_3.jpeg\", \"http://localhost:8000/images/coffee_4.jpeg\"]'),(20,1,'Minimart Catalog','プログラミングスクールで開発した商品管理アプリ。\n基本的なCRUD機能の実装である、ユーザー登録、商品の登録・編集・削除機能を実装。\nPHPとMySQL（phpMyAdmin）を用いて構築しており、商品とカテゴリーはリレーションを実現。',NULL,'https://github.com/yuya-inada/minimart_catalog',NULL,'2025-08-02 01:58:09','2025-11-15 22:13:26','[\"http://localhost:8000/images/minima_1.jpeg\", \"http://localhost:8000/images/minima_2.jpeg\", \"http://localhost:8000/images/minima_3.jpeg\", \"http://localhost:8000/images/minima_4.jpeg\", \"http://localhost:8000/images/minima_5.jpeg\", \"http://localhost:8000/images/minima_6.jpeg\"]'),(21,1,'ブログ投稿システム（オリジナルCMS）','シンプルなブログ管理システム。\nユーザー登録・ログイン機能を備え、カテゴリ別に記事を投稿・管理可能。\nまた、プロフィール画面の作成やログインなど、実際のWebサービスに近い仕組みを意識し実装。',NULL,NULL,NULL,'2025-08-02 04:40:04','2025-11-15 22:14:33','[\"http://localhost:8000/images/blog_1.jpeg\", \"http://localhost:8000/images/blog_2.jpeg\"]'),(22,1,'ボトルメニューサイト','・商材撮影/画像編集。\n・開発(開発/本番環境構築、Frontend、Backend、本番環境デプロイ)。\n・運用/改修。\n\nお店で使うメニュー表として、ボトルワインを紹介するWebサイトを開発。\n写真撮影〜設計〜開発〜QRコード化まで一貫して担当。\nデザインなどは現場スタックへのヒアリングやUI試作を経て、実装。\n操作性はシンプルに構築。\nFileZillaを使用してデプロイ。\n確認作業は各デバイスで行う。\nお客様と会話する余白を残すため、HTML/CSSのみで構築(お店の特徴を活かす仕様)。\nGitHubにソース公開中。','https://adamsing.website/index.html','https://github.com/yuya-inada/new_qrmenu',NULL,'2025-08-02 05:11:37','2025-11-15 22:25:30','[\"http://localhost:8000/images/bottle_1.jpeg\", \"http://localhost:8000/images/bottle_2.jpeg\", \"http://localhost:8000/images/bottle_3.jpeg\", \"http://localhost:8000/images/bottle_4.jpeg\"]'),(23,1,'飲食店向け棚卸し管理システム','・開発(環境構築、Frontend、Backend)。\n・設計(基本設計、DB設計、デザイン)。\n・運用/改修。\n\n飲食店における棚卸し作業の効率化とミス削減を目的に開発。\n全工程を一貫して担当。\n基本的なCRUD機能を中心に、現場スタッフへのヒアリングやUI試作を経て、操作性と実用性に合わせて設計し、実装。\n　→ログイン、ユーザーや商材、関連企業の登録/編集/削除、在庫カウント機能等。\n　→カテゴリー別、企業別等での一覧画面。\n　→入力/重複チェック。\n操作マニュアルを作成し、共有。\n＊運用は終わっていたが、2024年8月頃〜2025年4月頃まで、休日に勉強として改修を行う。\n　→MVC風。\n　→ボタン生成クラス。\n　→セキュリティ対策(SQLインジェクションなど)。\n　→一覧表は1ファイルで完結等。\nGitHubでソース公開中。',NULL,'https://github.com/yuya-inada/bk-inventory',NULL,'2025-08-02 08:20:25','2025-11-15 22:25:57','[\"http://localhost:8000/images/invent_1.jpeg\", \"http://localhost:8000/images/invent_2.jpeg\", \"http://localhost:8000/images/invent_3.jpeg\", \"http://localhost:8000/images/invent_4.jpeg\", \"http://localhost:8000/images/invent_5.jpeg\", \"http://localhost:8000/images/invent_6.jpeg\", \"http://localhost:8000/images/invent_7.jpeg\", \"http://localhost:8000/images/invent_8.jpeg\", \"http://localhost:8000/images/invent_9.jpeg\"]'),(24,1,'建設会社 社内システム保守・改修プロジェクト','・改修/保守/運用。\n・テスト実施。\n\n建設系の社内IT担当チームとして、複数の社内業務システムや社内外Webサイトの改修/保守/運用を担当。\n▪️下記作業例。\n　・PDFやExcel、CSVデータの取込/出力機能の改修/実装。\n　・メール通知機能や本文などの改修。\n　・CRUD操作に対応した所員情報管理システムの開発。\n　・社内外向けのWebサイトの文言修正やプレスリリース、トピックの追加掲載対応。\n　・DBやPHPバージョンアップに伴う調査/報告/対応/提案。\n・レガシーな環境下だったが、基本的/本質的なものは変わらないので、多くを学べた。\n【基本的】\n　配列、ループ、トランザクション管理など。\n【本質的】\n　①アーキテクチャ設計(データの流れ、責務分離など)。\n　②データ設計(モデリング思考、リレーション)。\n　③抽象化と再利用(クラス設計、関数設計)。',NULL,NULL,NULL,'2025-08-02 23:31:52','2025-11-15 22:59:43','[\"http://localhost:8000/images/kajima_1.jpeg\"]'),(25,1,'Portfolio Site','・開発(開発/本番環境構築、Backend、Frontend、サイト公開)。\n・目標設定,要件定義、画面設計、DB設計、API設計、デザイン。\n・テスト実施。\n・保守/運用/改修。\n\nReactとLaravelを用いて開発。\n・プロジェクト/経歴の登録/編集/削除機能実装。\n・ログイン機能実装(開発環境下でログイン/プロジェクトや経歴の登録/編集/削除を行う)。\n・「Used Skills」セクションのスキルアイコンは、プロジェクト登録時に選択されたスキルが連動して即時反映)。\n　→整合性や効率性の向上目的：使用スキルの漏れやズレを排除。\n・「Experience」セクションは、プロジェクトとの紐付け機能実装。\n　→UX改善目的：「この経歴期間中に、このプロジェクトに携わっている」という認識を容易に。\n・APIテストにはPostmanを使用。\n・「.env」「gitignore」での管理によるセキュリティ強化(DB接続情報、APIキー等を保護)。\n・UIはダーク系を採用し、落ち着いたデザインを実現。\n・GitHubにソース公開中。\n・READMEに詳細記載。\n・ConoHaVPSを本番環境にし、一般公開中。\n・ドメイン取得済み。\n\n※遊び心として、アイコン上部のスウィッチボタンで愛犬紹介文に切り替わる仕様も設ける。','https://www.owlione.com/','https://github.com/yuya-inada/portfolio-site',NULL,'2025-08-03 00:44:48','2025-11-15 22:24:33','[\"http://localhost:8000/images/port_1.jpeg\", \"http://localhost:8000/images/port_2.jpeg\", \"http://localhost:8000/images/port_3.jpeg\", \"http://localhost:8000/images/port_4.jpeg\", \"http://localhost:8000/images/port_5.jpeg\", \"http://localhost:8000/images/port_6.jpeg\", \"http://localhost:8000/images/port_7.jpeg\", \"http://localhost:8000/images/port_8.jpeg\"]'),(26,1,'資産運用AIシステム(個人開発)','【MVP開発フェーズ】。\n・開発(環境構築、Backend、Frontend)。\n・目標設定、要件定義、基本設計、画面設計、DB設計、API設計、デザイン、MVP。\n・テスト実装、実施(予定。)\n・保守/運用/改修/拡張。\n\n・目標設定等から要件定義等に落とし込み。\n・create.xyz(生成AI)を活用してホーム画面等のレイアウト作成。\n・他画面は、Figmaを活用して作成。\n・DBの設計/構築。\n・APIエンドポイント設計。\n・MVP開発に着手。\n・API連携によるCAVや市場データを収集する基盤機能の実装(自動化中)。\n・データ収集機能のログ機能実装(ユーザー行動ログも追加予定)。\n・ログイン/アカウント作成機能、権限別操作制御、ユーザー情報/設定画面を実装。\n・「.env」「gitignore」の管理によるセキュリティ強化(DB接続情報、APIキー等を保護)。\n・UIはダーク系を採用し、落ち着いたデザインを実現。\n・GitHubにソース公開中(重要モジュールを除く)。\n・READMEに開発詳細を明記。\n\n<<補足>>\n現階では、研究開発目的として、公開情報から一部データ取得を行っており、商用利用/再配布は行わず、将来的に公的API/ライセンスデータソースに完全移行予定。',NULL,'https://github.com/yuya-inada/nowl-dev',NULL,'2025-10-31 15:45:13','2025-11-15 22:30:55','[\"http://localhost:8000/images/Nowl_1.jpeg\"]');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0iAyDWMHJbX65yDV2LzimSWXq9Be9IBUJ5g79IWv',NULL,'127.0.0.1','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','ZXlKcGRpSTZJa1JXUjNsS1p6ZEdXR1pEV1VGV2RIWnlkVzA1TVZFOVBTSXNJblpoYkhWbElqb2lkMk5xY3pod1FqWjNOV1pCUzFseGEyaHNibVU1U21SR1pFZHVLM2d2WVRSd0wzUTJXa2xyUlRRMGVtZGtRM2RQV1RScVlXeEJXbGx5TlZoR1QzQkdSRUV6TkhGSE9WSldWRTlLTVhVdlJGTTFRbVZVSzFKcmF6aHdUVWxoVUdOaE1sSnpkV3hvTmpkeVl5OUtiR1ZEYXpOU2JqaDNiM2RGYjAxWGQzWjJiR05qY1VFMlVISnlPVkppUVhCd1RrNXlLM0p1VW0xM1IxTm9SVEJQTlRaS2QydDRhVnAzY1N0UGREZFpabmxZTVhnMmQxTnlRa3R3YlhNMVp6TlplVGR3YUdsblVtMHhaRXRFTHpoUWNXSkRjbTlUVW1zMVNHMXVNVm92YmtsNVdWZHhZbFJqTTBSTmMwMDVVM001YUVOTU5UZG1UemRNYW5rNVNWRXdPRlp4ZENJc0ltMWhZeUk2SWpOalltTmpOMlkyTXpnMVptRXlabUV6T0dFMk9ETXhaVGczTUdRMFpEQTBPR1E0T1RnNFltTmlaR1prTWpSbVpHUTRaVE5oWXpjM1pqWXpPREZoTUdJaUxDSjBZV2NpT2lJaWZRPT0=',1754756833),('1MMeJkt3TltFpE0XUk85bA6EdxnRFqBXSUqgMe3P',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJblZaVVZOelZHaFpWMmxpZUN0dVlrcDFRaXRJZVdjOVBTSXNJblpoYkhWbElqb2lLMFkxYm5OTlFqaFdkRGgxTUZSdGRXSllWMWRPYVZaM1Z5OVVZWFpRV21vcmMwdFVVRkJJTjJ3MmJrSlJUMDVKZVdaUGFHNHZSRmwxUjNoSlFWTkNRa1JYV21aR1FrNWpNM3BzZVcxcE16aGlWV1pIVVhJeWFqbExjR1F3TmtWVWVpOHhabFV4UTA1aldHOXJVMWw2VW1WMmQxcDFZMWxUUTB4NmRFVkZVak5OT0hsd1l6VlJaMjVRU2pJemFqZzRhMVI1Y0ZwSVN6SXdVSGMwZVZZNGJtRkRabWRGTUd0MmFuVTRkakZHWkRBNWFFTjZVRTVIZDNNMWVrbzVOSFJJYlZZMWQybERXblJIV0hjclVrWm1OMDR2TTAxT1dtTm1WRVV4ZUN0dk9FbDFWRUZoWldFeE9HWmxSbmR0Ym5SeU1UQXJjUzlUV1ZCbVVGQmpMMncwTlNJc0ltMWhZeUk2SW1ZMFlqZ3dNR0V4TXpJMk1EVXpaVEk1TVRjMVpHTTJObU0wTkRBeU4yVTFOalkwTnpNeE9HRTVaalk1TmpNMU4yUmhZemt4WmpjM056QmpZamhoWVdFaUxDSjBZV2NpT2lJaWZRPT0=',1754400111),('1rD8Ekq7KHIfQysRK5wSVE6HACTf2B4QGpEsXsw9',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJblJ2UjJFeFYyVXZjSFZ1WjBjNVRWWTVkR0ZGUlZFOVBTSXNJblpoYkhWbElqb2lNa0p6TWxGTlUycDBiR2R5ZEVKSGQwTjJRVmRsU1hvNE5XSnJNR0psZFd0RlJFaENRbFJyVGtGWE1raHRXbk41TVRaaFl6UTRjWGRpZUdoQ1VrNHpiMUpNUlc4clpTODVZMngwVG1kMFNFSlZjbVJLVkhWWWJsaGxMM05ZYTAxNlVDdEtTbEJFVnk5TGVWZGhibXN4U21KaGFVMVJlRkppV25Gek5VcFdXVnAyZW00eU1uZHlPVEV3Vm5GbWVYcGhOSEZGYTI5SmVWVXhaVXhzTW5Zd2FtbEJObTk1T1U1amNGRnBjVGhOUTNBelZUTktOVEl6T1hwT1NUaHhNa1JEYkhreVYwMUxTMmRMYlZoV1NYWTNOMkZuYkVOSFJVcE9jM1YxY21abVduTlBUaTlNVnpGd1QwaG9kMWw1U2xOWmFqZHhVMjlGUVdKbGFESjNlazFXTkNJc0ltMWhZeUk2SWpobU1HTmpOemM0WWpkbVpETTNOMlprTTJWaE5qWXlPVEk1TnpFNU1tTmpNekV6WWpBeFltSTFaVEUyTTJNek0yWmlaR0ZpT1daa01ERXdZemRrWmpJaUxDSjBZV2NpT2lJaWZRPT0=',1762344557),('2xdwmq1xLgeTi0zqKn6LEFsgxMn2QN6w5MKKR6Y6',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJalZUTUZwRE1WZEViMEZNUVRCNVNFdE5abTVOWmtFOVBTSXNJblpoYkhWbElqb2lSRU5zZG1zdlYyNDNiM000Y1d0VmIxUTJMMnN5Ums1QmNUWnljV2syYWpWTlVHeFdaRE5wYWtaSFFXaDFWRkp1VG5Cak5XdEVMMmxNWjFsd1VVUkdZbE5CZEZOSFkwczRWbW8xZDJZMEwwUktTV1IzYTB0WGJ5ODFaSHBNV25CMFkydGlXRzVVTURsdlYwRkZZM1I0Y0RaRk1tbGpXWGRNVGxKMWJsZFZZV0oxVFVaV2NXZE1ORWhIU0daQmNVcE1kV3h5TUhSME1HTlBZakp1YUZGV01uSjFjVXh4Y0VWRFdISnJOSGhqV0RGblFUTXhRVFV5WVVnMWMzVTRReXRLVkcxMlV6RTBWR1JEVFVJMFRYQldVM2xKUVU5dVJrdGxia3hXVURsRmJqaHNTek13WjNJdldYTjJaM2xXTVhaWmNtbGpiVWsxVUZKTGMxZ3ZlbEI2ZUNJc0ltMWhZeUk2SW1Wa1pESm1ZVEUyTnpkak5tWTRNRGs0WlRaaU5UWTVNV05tWldFek9UbG1ZakZsWVdOalpHTXlPR1V3WVdWbE56bGlZamt4TmpreFpUZGpaalUzWXpVaUxDSjBZV2NpT2lJaWZRPT0=',1762242711),('49ixywrfjA1HLqgbBljtMmIk1YrY2MlXohmVhExr',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJbmx0WW1KaGMwVTFNbkpyVDJvNFNIRkhja0Z4TWtFOVBTSXNJblpoYkhWbElqb2lhamwwWTA5ME1raElkM0p4UVRoNVoxUm9Sa0Y1YzNsNVpFWkVTRVpoY2xSSlQyVnBlVEpuT1UxdGJpdEtiVXh5T1V3elRrOWtkVGgyY0Rod2NrSTJjekpOVFRod2FHMWhPRkZWTTNaTldqSlJTVXB5VTBrclRFbGhaRlJXUms1bUt5ODRTbXNyTTFaV1RtcFRRekI1WkM5SGVXOWtlWEZsVm5CS01VUm1iWHBOY2l0alltNU1WekIzTjJKS1luVndNVEp5Y21KSVZTOTNNa0Z4YUhkWFRuQnRNbUpVYkdsd1owcERRVzlzVkdGTGFTdDBUMnhIWkZkaWFHVXJPR1JrV0VoMFQyNXdOblpFVjNRek0zQjJPU3RLTHpVNVRIWnNNMHhoWlU5dlVGbGtOMEpuYURCalNsSXlaRk5xWnpKRVdtUldVRnBtV200eEwxUXZUbGhYVEhSMFZXNXlhVVF4T1hKMVYwSk1aMFpYU21aelltZE9Xa1psWkcxTVQxUklPVEpzT1VGa2NrNDRiMVpwVEZWMVUweEllRWxXTm1wbVVsazVjbnBQTmxsSFdYVmhkMjUyV1RabE4zRjNVVkpNTURSYVpEWldha3hDWWxKVVRUTllOalpGYWxGVVVTOUdNblp2UFNJc0ltMWhZeUk2SWpGbU1XTTJOelpsT0dSbE9ETmtNemN5WkRaaVlXUmlaR1l4TlRreVlXWmtOakJpT0dNM01tVmxPV1JqWVRrNVlqTXlZbVExTmpVM1lqUmpZbVF6WlRVaUxDSjBZV2NpT2lJaWZRPT0=',1761462805),('5erVG4oBhnGcdTPSg0q90TtQe7UJlhM3MypH9SxV',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJa1JWU1RKbk1uRmtkR1ZGYzNoTk5uTXlRbGRVZWxFOVBTSXNJblpoYkhWbElqb2lieTlqVlVaQ1NUWktNR0ZPTldrNFdWVkhLMlJ0ZGt4MVUwVlZMMVpWY1VSeWEycHBURUZFZEU4NVlVTjFVV3RtYmxkNlNVUnFVM0Z2V1hsM2MwMW9RM2R6VUM5eWRtbzBlRkl2UkRSaWRFWlJaR2xOY1hSWVR5dDNPV2RFT0Rsa2JUWlpRMUJtVUdFMU9WSnhabkIzY0ZGdVZVZEdZbmhLYmxsaVRIUmxiMFpWTWpKWVZUaHNUbTlGVXpaM1dUWnpUV0ZTTVdkaFdtaFBTM1JJTm5kcksyRXdWa2xsWTNnMmFtWklVSEZZWVVNMFduQllSaTlvTUZORVJVOUpialJHT0dsVVFrdG9MMVpETTFwTlNtNVBMMmxFV2xscWEzVkVla1p6ZHpaNlpuTkdSWEZJVkZwSWEwOUhhazE2WlV4MGRHaEdOSEZaVW5OWVpHUmlOalpOU1NJc0ltMWhZeUk2SWpsbU4yRXlOREU1TjJNMVlURmlNelE0WW1aa01UUXdZelUwWTJRd05qVmpaV1prT1RrNFpXWmxZbVkzTWpZNU9USTVORFUxTkRsa016TmlNMlZrT0RZaUxDSjBZV2NpT2lJaWZRPT0=',1754896490),('5ydsTPefXpXe8c5ipEJ9OApzrzxMOkXQuwDdli5m',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJbVU1VnpkUFVtOXBObEppU25WdllXcEJURUZsUmxFOVBTSXNJblpoYkhWbElqb2lRM2R5YTNOTWNtUnJSMDFvVTBZMlprSmhWSFUyY210Rk5WVjJZVkkwUW5SU05YSlROMVZhTDJGaVNWWk5VVlZOTXpFNE5IWXJhbEZyYkVONGJVcFZSbG8wY1VkcFEyZFdWVTF0YkdKd2NUQTVURkF6ZDBSMlRsZHRUMHB5UkZoaWQwODJRMFJ0UlZsRFJXUTJZVmR2Y1c1eVdGbEVXWFl5T0hWM0x6TlFkblJxYzNwelEyNUpZMk5XZUZKRVRqZEhUVUZrTTNkYVVsWjVWVVpSUlVzM2JISTNibWh4TjFaa2VqTjBXR3hoWlVGVk5tZHlSamhMWjNkbVRFdHdlRlpZWVZkNmFUQnhTbkpsWld0bVIyNXdhRUZQUTI5cmVIbEhUWFptTUdWTGR5dE9SM2RPZFhoQ01tbERjbmR2U0V4SVQzRXdlRkUyYVVsTFUwcDVabFZ0ZHlJc0ltMWhZeUk2SW1JNE1UZGhPVFZpTldJMFlURTBaamt5TWpOaU5EVTBOemcwWmpkaE1UTmtOV1V3WWpJd1pUbG1NR1EyTW1FM1l6QXdNR1UzWWpNMllXRm1Nek5oWVRjaUxDSjBZV2NpT2lJaWZRPT0=',1754839992),('5z1Dbaym6xM1rnunE8bdhmxdlh1yz5IMgZxRoCoa',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJbGhyZUZsdU5EWlpSVzlDUlRkaFlVc3hUVlZJWW1jOVBTSXNJblpoYkhWbElqb2lLMlZvZG1Gd1FrODVibGxuYW1jNWNuUXlZM05ZUkd0RmNUWllRWHByYmtKUVVtVnZUbXhoWW1aQk9TOU5ibko0WVc1Qk5HZGFiblZZU0hoMFRVbFFUbWhpV1hkdlpsTnFjMHQyU2xoeFdtdFFSVm8xZERKd09TdGpaMWRHUjB4NVV6bGlSV1JQT0VOdlVFTndabnBUT1RCS1RucGhWRXQ0ZDNkWFZuTTVhV3RyWTJsTlZ6TmhNR1JtVFdsVVNFeEpXVkpWTmpaVFMydEljSE5EVGxSWVVVUnRla0kxZG5WMlVuQkdTM0Y0ZUdrMFpqQXZVM0p3VTJaUUwyWXhRVGgzYkVFM1YzSmFTR0Y1Um05dE9YVmFaaTloYUd3eVZrNVBXVzFRZDBKaVZHRmtUekJHTnpBMlRUVnpSekpSZFZaVE9WTkxTMEp2WTJSdFFUSllNRk51VUNJc0ltMWhZeUk2SWpFM09URmxaV1kzT1RZME1USmxaVE0yWWpCa1pURTJOekpqT1RneU1qZzRPR1poTURCaFpqZGlZekkyTWpFMk1ESTFNRGMyTm1RM01EZGxZbVpqWVdJaUxDSjBZV2NpT2lJaWZRPT0=',1761474257),('7X3RCfsNaCLlyK8fqLTbSuOiRGpmumTLrhcHnbux',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJalkzV1U0eWNEbHJiMWxDT0RjMlEyMW1PSE5hU0djOVBTSXNJblpoYkhWbElqb2lRbXB1VDNWa01uTXJkbUpaVWtOWGQxRldRU3RXYzFkWlRIQmtObTVNTDNKVVltbzBNSE53TkU5dWNFWjVUbmxQYkRCRFN6RnpVMGQ1YkZKd2RXRkdWMGhvV0hNdlpHdERRVXN2YUhKVlkzbHhhbHB2YlU5cVNtWTJaMHhsTm5Sa1pEaEVLM3B4VGpSWmNHdE9SWFJXVG1SQmFtVjJORVppT0dKMmQyeHlLeTlRUXpZNE5EaEJSRGR1VGpKNU1FcHJPRlFyVFRBM05FVnVhR3g2U0ZSUVRURTVZVkFyWVdGM1EwNUZkazUxWkhkYWR6aFZSV1ZJYlVwamMwMWpjVmRXVFdkVk5WaGpZMGRqUW5SQlVXTjRRVTFOYWxWTFdITjJNbkZQTjNwQlpYaFJkbTVtWm5jemRFWjJTMmhNUjFsUWRWTlpNa0ZGVDFSdFV6UldhM3BJTnlJc0ltMWhZeUk2SWpNNFpXRmxaVEl6WXpGa056Rmlaak0xTmpkaE9XSmxabUZoTTJJM1pETTJOMkZpT1dRMFpHSXpOamt3WVRCa1pqQXdORFU0TldSaU56TmtOemRqTldFaUxDSjBZV2NpT2lJaWZRPT0=',1762090243),('8J6m8YBz4dPPCVytofXvufeNNalY8MB1dqUIQh0C',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJbVk1YTJncmVEZG5TVGN6TUdaV1JrZEpZVlJKYlVFOVBTSXNJblpoYkhWbElqb2lUWG8xU0ZWQ1NsSjRPR3BoUm1kRE1qTTNiMVJXYzI5b09VczNaazFwWVN0alNHTjJkMGwzY0ZwcWVHdFZUWFZRWm5CWlNtMXJWVXc0WkRSeFRrbGxMMGR4U2xBMFptbFJMMXB3YUVOSGJtTTFVSG80Y3k5clprTlVVMDVCY1dNMGNGaHVWMVJzV1Uxa1MwSmlNR0U1TjJsSWJXTnJURXM1ZDJneU5YbFFiMFZNUkVkTU1qUldWMnBwVGtoWWRXOVBlWG94Wm5CR2NWaDNkelpWVEU1UFNUUlFiMWRJT1dwQlYydDFVR3hxT1RacWVFVXdRVXhKUlZKUVNuVnNXbGhVTVVGcE5EZFRVRGhDTjFaMFVHczBMM2wxZVVWWVZVeEpWRXRXU0d0bFN6ZEtZa1I2WTNsdVEzZERRV2hyTlRWamNVczRha3BKVjFaVVNUQTJURWt5VGlJc0ltMWhZeUk2SW1VNE5tUmhNR1EwWW1VNE0yRXlPR1ZsWlRRNVltSXlNalF5WkRaak9UWTFZVE0wTXpJNVltUTVNMkk1TVdVM1pERXhaV1V5TW1FMVltSTJPV1F3T1RnaUxDSjBZV2NpT2lJaWZRPT0=',1761962306),('8jGHZlb2gw0ygGBmF9l9O1FOvPomtgD5jr3u2qJn',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJbFZGVFZoUGIyWXpPRWxzTVVWeFdWRlpWalZtYUZFOVBTSXNJblpoYkhWbElqb2lTRlZrYTJnNGVURnljSEJWZDFoa01IcEdTMmxTT1dvdlMwODRVakV3Y1RabGQwTlpVbTR6TDFBelpFTXpUWEJaTkRVeVpqUjNSRTQxV21nNEsxTk1hRTFIWVVaSEt5OUlVVVpIV1RWUFJsaEtXVUptYms1UE1FOU1UbTFZWkVkT2N5OVJSbVp6WkRoVVdVaHRkSE5GVkdwemVUTTFPRU5qTXpoU1VqSnlSbEpKZEV0UE1WbFdXa05hU0ZKMGJqTlBkWFoxVnpaUVdrNUlia3d5V0dndlRsUnBWa2d3WjFJcldHSnZhRkJxVEd4TVZYWnpUbVp4TTBrdlVrSXJXVVF4UVhsaE5FUk1ORmd4VVRaVFNEZHNSbFJwU21vMFNYWmFWSGxZWldsSGMxaExiazVIYW5BNGNuaGxTRUpOVjIxeFZFcFdZaTlvT0VaWVIwMVBTWFV3VmlJc0ltMWhZeUk2SW1SbU1qZzJORFJsWVRSa09EVTJZVE0xTmpBM056QTRPVFpoTURrM1lURXdZMkl5TlRCbU0yWTJORFk0TVdZM00yUTBaVEE1WWpreE1HRXdZemd5TmpraUxDSjBZV2NpT2lJaWZRPT0=',1761738355),('9NJ0NHmEVDoquYHw7DIq3E3k32HmiC5F3ctSDy5e',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJbXBQTlVJeUwwSTBlVTFvY2tOS05qTnVURlYwVUZFOVBTSXNJblpoYkhWbElqb2lVWE5vVFhaNVFXcFRabFF6VERSdGMwVjRhVTV1WldsU01XbGtaVEI0Ym05NmFtMXZNR2hqTmxaUFdIQjRSakpqZUhvMlJHSnFObmcxZVRSbU4weGhlVnBKV1Roa1EwcGpSaTl5U1c1eFlVVXJXbTVQVDNnd0wyOUxUVVF4VjBOSGFEQkJWVVJVUzNvNWVsSnFVa1JvVlRaUUwzRkpNMUJOWWt4UVRWQXJTRVJFVjFNeVFVdEZUVXh5WVV4aGNuWlBVMFZ3WkhoSFFqQnRSMFo2V21KMmJGUXZSWGR5VUM5VUszaE9XRFozWkZsRVkxcDRhVkExTUdSVldHWk9OVFZpUVZNMFVWcHJXWFZCUTAxd09VTnZXRVp0ZW04eVYzTkhaWFpwWWpaeFZrdERTVlJWV0VSalVIUlVjV1l5VGxWMGJFRm9WRGR3WlhoaE5rVmhibkoxS3lJc0ltMWhZeUk2SWpnd05ETTFObVF5TmpGaVkySm1NelJrTlRBM09UVTVNRGd6WkRJME9UVTRaRFZsTXpVd016Y3hNek15TjJZeE1EUmtaREkxTVdJeVpURTRNRGszTkRNaUxDSjBZV2NpT2lJaWZRPT0=',1762516958),('ACPDPvLgyWciaK6wSpnT9D3X3ii0cx53zgDVVoWx',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJa1phTjJ4ek9YbDNWa0V2Wm1wYVJqUklSVlpwT0djOVBTSXNJblpoYkhWbElqb2llRGxyTkcxeFdteGpUMDVKUWxwTFRWcEpVM1pIYjJsU1FXTllVVEI2V0dWdlVGWk1OSE5LTHpsVVVYTm1WazE2VjNSdmEyMWxlazFyYlVGU2VUZ3hRMVJpT1ZsNGRFWXJNbFZ5ZDFGV1kyRm9hak53WlVjclVUZHZWV013VlN0aU4wZDFkVmxIWW5sWlpuWk9NVlpsVFRWcGJ6QjVXVm8yZVdsblRUQTFla1V3ZW5GblEzUmFWSFZITlc0MU55dFRja3RVYVd3eUsyc3haalZJVkhkdmQzVk1ZMkpoY0dwdVFWY3dRMWR2V20xU015c3lWVlY1VWtRdmRYbzVZbXgyV1M5b1ZqRTFka1l2YXpkek4xZHNRMHhTZWxScFQxVlpWVTlNUkd4b1MyOXpkMFEzWmtSUmMweGFNWHBuTTNsd1VWVXljV1p2VlZsWFVuWTVTa3BTWVNJc0ltMWhZeUk2SW1RME1qazJaV0k1WldOalpUQmhaR0l5TlRCa1l6VXhNakE0TkdWbE5EUmtaakUwTXpFeE5EZGhPRFl6TUdOaE16VTBaRGszWWpoa1pUVXhNV013Wm1NaUxDSjBZV2NpT2lJaWZRPT0=',1754659611),('aipyOJJKHMBXRz0jpAeXS84dh0nsk07IICNm3s0l',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJbVZFV2tSa05WVnNOQ3RCY1d0M0wxRmlRMGhHTTJjOVBTSXNJblpoYkhWbElqb2liMjl0UTJkVVRYaFNTRVpWT0RjMWFXOTFiVTlpTTAxT00yOTViRkpYYldwTVMxRm1MMlZyVkd4R1FtSjZXRXRVZEhCaGMxWnRUVkJzVDFKbVl5OUhjM1pYZURoTGFGZDVSVkl4T0ZWUFkzVmtRazVZUmxkVVNFMHpWbkEzYlZJMFZuQlJNVEJwVW5aR05sUXJWV1ZzTVVkcVMwNUlkWGhNZWpoclJXTXphMGw2ZW10emVqQktaSE4wVjBadU9YWXlObTVTUm1rMlFrUk1iRThyVHpCdVRYZFBha3cxYTA1clRFOHpjalpGVlZkVVJYY3dUVTltYkZKTVlVVmpkMkZZTjA5Rk5rdDFZWGxZWlRZek0ybDZaR0ZsVDJocVZGVk5aa2hFYW5sek1WQXJSVTFHZEVnck9VUnVXbHBDTkdweE5XVXdXSEJwWTB0WWJsZ3JZekYyUlNJc0ltMWhZeUk2SW1Rd1lXVXhNemszTURJeE1qVTRNemsyT1ROak1ERTBaakUxWkRobFptVTFaREUxTURjMU0yVTFZamRqTVdKak16azNPR0ZtTVdVNFpqQmpaRE5pT1dVaUxDSjBZV2NpT2lJaWZRPT0=',1754221731),('aRA8xwWb2knFPHxWjc3n1pUNZwbcnDQikys6LVJ6',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','ZXlKcGRpSTZJalE1YTNkUU56QTFOMjFsWmpOUE5IWXpOMVJzZFVFOVBTSXNJblpoYkhWbElqb2lTM051ZUZKaE1DOUNXWGx4TjA1cmQwZEJZVGQyY1hkR1NHVnVNMnh5VlhoWVFXZE1SV0o1ZEhsTFVGUmhaRGcwWkhWTVNsWllLM2hxZDFsSGVXaGlhRFpWV0hSVk9HZDRkbk5TUm1Ob1dFc3pTVVJsY1dOUFprRjVaRU5tTVhacE5qYzVhVXRJYUU5b1NVVnVUelYwZVV3MVlWUk9iVEVyY1RnMEswczNiMEpRYlVoVmIyeDZkazF0UTJWc1RuQnRTWGhDU0VOUUwyYzBWbmRHYUUxQ04zaDVXbUl4ZEV0b01WcFViekZUU3pKbmJYVmpOSEpPTURJdk9YSnlla3RUWldreFFYVmhjWGg1U0hKTVkwOWlURWswUTJvMEwwNHdlazFXYTNZM1dXSkZVVmhJYUdRck1tb3ZjRGgyYkRCNk5TdDRaVEJuWlU1VlZIVkpOazVwY3lJc0ltMWhZeUk2SWpWaU1tSTFZelF6TjJVMk4yWTVORGMyTURFek1EazBOV1UzTm1JeFlqRm1OMll3WmprM01HVTVOREpqWkRJNVpERTNOekE0T1RKaU1qRmxNVE0wWTJNaUxDSjBZV2NpT2lJaWZRPT0=',1763280763),('ASEKubK09nKb5hkPhPHuIQrYPthn7hW7WhRWwTCp',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJbXhHZHpaT2JtZEdUbVI0SzB3d04wOHhVRWhTZVVFOVBTSXNJblpoYkhWbElqb2lNbXRoVlRkcFpHczFiMVlyUkVFdldWazVVMUF3VlRKWVJFWnNZeTlPVVhObGEzZFpibE5QV201a2JVOWhNVEZvYkZoVmVFaDBWSGhNS3pSVVdsVlpiemwwUjIxc2VYTm1SRFJqTVRKTFdXVk9abE5PWVdGMGVFazFlVEF5WW05eGRVTldPRk00WlVGdlJFbGFWWE50ZVdReWRIWk5hVmREYVRSc1FucElSSEJwY1hKM1NXeGtWVFZsVjBaT055dGliV2RvWkVwUVExRkpjVUZSWTBORE0xZFFaRmhMTkZCSFdUbHFOMFpLWjA1clMyVnhVbmxxUjBsaGJUVk1kV1EzU1U5bE4waG1PREZ5YkdSWGNWQmhZMEk1VVhwSWJuRldkR0pzYTAxVlRtaDRMMW8zTXpGRmMzRjJZM00xTUhGQlQzSndhazVETldaVFFpOTJkbFZJYkNJc0ltMWhZeUk2SW1Rd1pqRm1Nams0WTJGaU56SXdNR1k0WTJWaE5ERmhOamRsWldVNU1XWmhNak01TVdVek1XRTBZVFF6TldJd01qVTNOems0TnpZeU9HRTJOalZpTjJVaUxDSjBZV2NpT2lJaWZRPT0=',1754891619),('b7NccDTUedP6E7tQNkq5GbS4Pnd4cFemBgEMK1iv',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJbXBzYm5kNWRHWkRiRTVVYWtkQlNERm1RWEZwWm1jOVBTSXNJblpoYkhWbElqb2lSbTAwWW1WMFpFOUtNa3R2WTFWM1NIQmpPVFJrWW1SbGRrdGtValF2VERsck5WbENVMFEyY0dka00ySlBjamR6U1hVeU1tWkRZMU4wV0dOaWMzY3JTVVpJZDFWVlNYb3pNbEl5SzB0WFdrRk5SVzR6ZUdsMlJVbzVjVlp1Um5CT2FpdG5MelZtUTBneFRTOVhZMmN3TjFWVVNGbFBjWE0wWm1aMlp5dElTa3hVUVhscVozaFRlakl5YWxoWWNFUXhibXBEYkRSaFptZ3dXazVHYW5VNFpqVnJSVVpzWlUxa01qWXdaVzlqUkhJM05GbERkMlEyYWtsMFVIcHhiMlJ1WlRKaVdUQTBTRmx6Y1Zwc1YzUkNjVUpyVlhWTU9EWk5Ra2hOTkRoRFFrb3JXRTFsY2pGcmNsQTJLMlZhVXpWTWNVcHhabkZ1UzI5VlkweG1aM0pSU3lJc0ltMWhZeUk2SWpnMVpEQTROamhoTlRVMk5EaGtaVGs0WmpFMFpUWXpZbUV3TldSak1ESmpPRFJtTnpNd01HVm1aVGxpTm1VNE5UTmpPV001WlRVME5tVXpZbVJpTnpnaUxDSjBZV2NpT2lJaWZRPT0=',1761981880),('BPMSfJxT6YGXYfWIBFkqTx4BOL4l9VALbPQgn3mB',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJa1ZPZFVwT0wwSmFhbk5WT0VOS1JHTjViVXc1VW1jOVBTSXNJblpoYkhWbElqb2lPWGswWjJFM2JYTm9WMlZ2VDBjMFVHbGxiR0ZyVldKSVdrZDJXVlUxTkdoVGNXTTJXbXhzVFZJM1kzQjJUM0pGWW5wdWRWTmxaR3BzZWpGVWNsSTFTell6WmxaNlJVRnhWVUpJU21saloycFlSa3RPVUZseVVtNXNZbkZqTUU5T1ZHNTVSa0kxUkdscVF6QmpWV05zWTNSdGIzcFJhMmhoYzNGMlVURkVRMHB5V0RZMVIxSllRM0pRWWtvNGRsVkhTR1Z6VGxCTGFWbDRTVWd2VFVOdE9XSlFWVFpuYjI0MFVsaEtSaTgwVURGT1JGbDNTVmh1ZG5CSGNpOW1WVWsyY2s5c1RFSlFMemh1Wm1sR1kyNXBVR1F6UmpKbWNYVjFaU3RMVWpsMGFEbHZUR0pRVVV0a00yOU1hQzgxUlVNeGFUVmpNazk1WVc5a1FsWjZNRXRCY2lJc0ltMWhZeUk2SWpoaFlXUXpNbU5pTVRjNFlqUmtPRE5pTnpVeE5HSXdOekpqTldWbFpqWTROMkkxWXpGa056RXhOR00zWXpOa056aGtPREF5TldRMU56VmtZek00TURnaUxDSjBZV2NpT2lJaWZRPT0=',1754833655),('cmHFLDQRPHaQyZl8wpeelDiT6kWzpQAD0jWY7lfv',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJbXBtU25BME1WazRXbVJFVFdaaVJURkxWaTlZYjJjOVBTSXNJblpoYkhWbElqb2lUV2c0ZWpRM01VNXRUbU5NVkZobmFGcEZWbkkxYjNsSVpGcFNabWxTU0hoek5WUlZZVk5ZV1VONldtSm9aWEZPTUcxclpucE9ZbWhqZFROaGFEVkZMMUpMYkRGWE9IRkJRM1ZpTUhabGFFeEVlbEprT0VoT2RHdFplazE2UTJVeFFpOVRWV2gzYlM5VmQwTjJkMnRNUzJ4UGNWSmxWVmQzUnk5V1YzVlJha2xIWTBaMlFXTjNNRmM0UTBsa2FHc3dMMUZyVkcwd2NuQjNZa2RVUTFCaWVXdzFWRWMyVjJOaEwzb3dhRW93ZWpFeU5FcDVZelJwVWxSMlFVOUZSbmRuVTJkTmVXNUlUbEpYTDFWVVFUUmlUVUpwVEdWVFpXeE5lRWR5VUVwNmJHOTZkVEJKWWt0V2RFNWxXVE56T1hoSFUycHBOR3RpU0dseGIwVXZWSG93YnlJc0ltMWhZeUk2SWpZMVlXVXdZakV4TkRFek16QmpZemRrWTJJM056VmlOakU0TldNM1pqTXpOVEkzWWpnelpXWTVNRGcyWlRjME5qYzFNamd3TmpSbE9EazNNVGxrT0dFaUxDSjBZV2NpT2lJaWZRPT0=',1761653648),('das5rFSEFzEROM4J5QSQ0MzgsbLd7lJ80StDGhny',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJbkl6VkZSbWFuSjJSV3B2TmpkeFUzVmphMXBWVFVFOVBTSXNJblpoYkhWbElqb2laMmhaY1hWalRDOUhUVWhXVDBSNE5HSm9VbEpFYVZkd2FuVm5NWEU1VkhKblJqRlpOVTlaWlZab04xTTBZMnM1ZFhJNU9VRmFZbVJLVW1ack1HMUJOekU0Y0ZZeWMwczNRelY1WmxGQ1VuTnFaelZFSzBsdU56bDVOV1pDT1RabVpuSkxTbUp2VVc5cGIwRkZjV2xVYkROd2QwNURSR0l3Vml0WE1rTm1ZV2hIYXpCMGQydFFUVFJvUTNKbGFVdzVSVzlDUWt0T2FsazRiRGs1YTJsemFuaFlaVWRoWjJvMWNVRjRZMVJyWWpNclpVRlZablJXYnlzMVJVbHdNbk01ZFdkd04yZFliSFJ3ZWtWR2JXeG5TMWx3VlhCUVVIbENObWhrTkRrd2QxUlRTRmMzZHpSMGJXdG9LMEpVYXpsaFQwWmtkRmRNUTJwV0sxWkJTV2QzT0NJc0ltMWhZeUk2SW1FNFpqUXdNMlZoTXpnNVlUVTROelEwTnpabE56TTRNVFU0Tm1Ga09HUTVaRGd5TmpneVpHRmpPV1l3TlRabE16WXlNRFJrTVRrMk9UVTNPREEwTnpZaUxDSjBZV2NpT2lJaWZRPT0=',1754734306),('dS7wAKrmOebA3481uRJTNX42BfmSJYCQsdfAbbuf',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJa1JFWlRZeUswY3ZTMDAzTTFaMU1XcHZVMHQ0V0hjOVBTSXNJblpoYkhWbElqb2lRMGx0YUhSMk1WZDBVREZqVFcxb2R5OXJTVGsxTVVKQ1dsSTRTUzlxZEVKWFdHOWxhVlZQWmtKS1YyOUdlakpHZUVwbE1IRjJNbW93ZUZSek5ERlFlSEZTWkZJemEwNVNPVkJFT0ZwbFZ6QnJWRUYwUkdaUFFWazRlblpZTVZCTVdUbFhTak51VlZreWFsRndXak5vY1dkcmVsRkRaWGd2TVVsS1pWSkNTaTk2V0Rad1ZUQkhka0p6ZVZwWlVHOHZWM0Z0ZGxsR2NETnFLMkV2TWs1cGFWVXdMM1IxTUdwMEwwWjROR050YTFwTWNVeHRlbEJKUkhka05TdHdVbFZPWm5acGJuRnFSU3RCYWtWUlYwTk1SR0pKUkZCR1JrUkpjMVIwYkU5SlZuWmtUbTVEVW5kU1pGY3ZWVTlEZGtwRFFWSTRUVGxZUldGUFJ6RlZSVmM1UkNJc0ltMWhZeUk2SWpNMU5HVm1NR1kxWm1NNFkyVmxOV1ppTkRBMk5EZ3dabVE0TlRNMlptVTBOemRqTVRJd01qVmtZak0yWmpVNFpUZ3haR0U0WkdVNE5qWTVaakk0Tm1ZaUxDSjBZV2NpT2lJaWZRPT0=',1761463323),('E53lyctKHBOt2Irt6jAagSl0jkxTAJVKrdBdxlHr',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJbHBKVEcxTlpYUm1UMmg1VVRSVlRFcG1SVkp2YW1jOVBTSXNJblpoYkhWbElqb2lUVkJGU1hOSWFVcExVWEpWWW1SYUwzVlhRU3RZWlRGcVNFRXlVRUZVYVRjM1NGUlFha0kxUkROaGVHWmlVekowTVhSR01YVkpTelJSWkRaUlNESnFOeXRHZUdSNmJ5OHJaekZSUmxGd1IzZG1OMng1WkVKeVZETjZUakpTVmpSamFITjZkME5hTlRJMmVFZ3pSblJNTnpnMllXOW9RMnhXZFhoV2VFTnlhRzlGYjJ3ck1XUXdXWGxVU0d4WFNITkhNVlU1Y2tVeVR6RXhabk5LVG05VFozWjFUVXBhV1dkR2NHWmpTa3RTT0Zob1dVY3lUVlJvVFZsRmRuTndiblUyVmpkS1QyaFpNMWQxVWtSQ2NHUkxRbHBOVEhoeU5tVlRka3BKU1UxR0wydEhaRTB3UTBaVVQzbDJiR2MwWmxwVVl6RkhaVXhxUjNobU1ESkNSbmRYWlNJc0ltMWhZeUk2SW1Ga1pEZ3dZalU1TWpjeE5tTXhNMlV5TVRGbVpqTTJNRFEwWW1ReU1HVTROamxrWTJWalpUazNNRE0yTkRRNE56VmpPR0UwT1dZeU1EZzNOVFprWldJaUxDSjBZV2NpT2lJaWZRPT0=',1762085081),('eOZSBNJL5iyCWVvaU8ZUiSHewl5JxFwp01DqwGkH',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJazlYU2t4cmRYYzNkVE5tWW5veU5GVjVlbXBOVDJjOVBTSXNJblpoYkhWbElqb2libmxLUTJaWVZqUmpWMkZUVVM5TWVqaHVURXRZYm5WRU9FSnZiMnRqVWtoSVprcG1hV1ZLUkVsak5WUkpRVEJXZVRSNmRVNXpUMHN5YkVWQk5WRmtNbkZFV2s1S1RpdDVaMWRCVEhnM1ZqWnlWelpTUlhabk0wWlRla1V3VW01UVF6WlRXV0prZFVaQ1IxVjRTMVJ2ZDA5TVdqbHpiMkpUUVU5YVoxTjZVWFpXUkU0eWIzaFZiU3R3VFdkcFRWUmFlVUZ2UW5Rd1VYUkVSako1WWs5d2RtRlBUV3QwYVZCQllWaGpNM0E1U1VWamVEQmtSQzlPUXpZeE1YSldOMVJqVjA1d1lTdDBiR0ZEWmtGVFZ6WjRNVnBhUlhveGRqWXlObEl6T1VOMlYwSnlNV012V1hKbVVYVjVLME41UVZSU01WRkZZVmRpWW05cE1FRnZRVUpSWmlJc0ltMWhZeUk2SWprME5XVmxZMlV5Tm1KaVlXUmtNMlkxWmpNM1pqTXpZalkwTnpsak5HVmxOR0l3WTJRNFpERmpZemhpTnpBNU1XTTVNVGhsT0dJNE5qbG1OalJoWWpNaUxDSjBZV2NpT2lJaWZRPT0=',1761565152),('g5zMnsCCMAeXHAqOr25xerIL76pL0O2rAaobDqLh',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJblZ1VUV0aWFVaE1aekoyV0ZZM1VFaENNREJHZWxFOVBTSXNJblpoYkhWbElqb2lXRlpHTlVSeVpVWkxVRGxFVVc1UVduWlJWelV2UldoMFZIaHlOVFpaWm13emVITXZjblIzYm5KUFlqbFJVSE0zVGtadlUwbDRNRkZSU2k4NFMzRlBZMnRxYVRkblVEY3piV1ZXY0dweEsybEJVWGhpWVhKWVVYZG9ZV0puYUZwUFFtWTJOVXA0YldwdVNqVldaM2RQV1VKTmJuQkpXVmhLTkZvMVpETXhURkZJYzBwRmVYa3lOMEp5U1dsWE1XZHBiekZOUldsRlRqRlZVa2RXTm1wb1ltMVBOemxWWjBWcFJsaEpaRlZ1UkZoaFNrRmxlakk1YjJwM1VXODNjRlJVVUVZeFV6bFFlSGxzZDJsSk1HOTBRamx6WkcwM2NrOXlUMHRITkN0NVJWSkVjMkpHUzJKeWFUQlpaMWt4VW5VNGQyODFkRTV4ZFN0TWVXNW1MemhPY1NJc0ltMWhZeUk2SW1Jd01UbGxNek14WVRNeFpHUm1OakV6TkRjMllUQXlaak5qWmpFM00yWTRObVEyTlRrek9XSXhPR05tTkRReVkyVXlOamhrTTJOak56azNZVGhqTkRZaUxDSjBZV2NpT2lJaWZRPT0=',1754225735),('g9oID69hOQIHOfbTG9BSh9WYhb9UBtWb17JJxX1o',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJbFJVY1V0NVlrNDFZVmd2YVhJME5VaGFNMDQwWmtFOVBTSXNJblpoYkhWbElqb2lNMnQ0Ym5kM1R6RkZiRTlYTXpGVmRXZzJXVmhDYVRGUmRIVlJja3RqYzFoNVRtNTFlVzFVT0dGWVJURTNRWGN4YVd4NlVqTjRSRWhDV2tKb1oyTlVMMmhKVWtKM1ZHeGxTbkY2YWtKNVdrMVVNa2huYm1kbU1IcEJjRXRwWjJsR1JGbEhXRGhEVGtWQmFqVkRMelVyWmxSWGFsZHVNRWwzVEVOV2VsWjRWamhTVVVKcFUxWm1MMWh1VFZKNGJYRmtVWFp6UkdWQ2VuTm1lbEJGZWpoWFdrOHJRMmgzTlVVMWEwdDNOU3RtTkdoUlF5OVBiRTVKVldaVmVVUjVUVmxQYjJ0bVJYb3lhMnAxVDJ0WlVHODVlR1F2Y21oVlNHUkROV2RFVWxweFNXZERaSFZhTW1GemNWTldabFkxUmxkRFFuZEtVVTR2VUhWTFZIbE1hSGRzUXlJc0ltMWhZeUk2SWpRNVpUSmlOelEzTURVek1qVTFaakl3WW1RMk1EY3hNbU5qTlRCaVlUSmlOalZqT0RJd01qaGtaVEl5TVRJMFlXTmpOV1V3WkRGaFlUSTBZVFl6WmpNaUxDSjBZV2NpT2lJaWZRPT0=',1754312917),('k6PsPWwXrn5HZoiVoBDoWdqR4fyC7ATMtnKzm8t1',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJa1ZIZFVaYWNFMXhRMDU0UzJ4QmJTOVdabFpWY25jOVBTSXNJblpoYkhWbElqb2lRbWRqVG5ONlp6RklhSEUyZDBGVU5pOTBkbWxGZEdOVVozRmpVVFpFUkRadVZUQkRkako2VldoSGRDdDJlRzg0VjBsSlNIaDZlbGxKYVd0NVRsSk5TM0JyTVc1TmFUVlNMMHR6VVhCRU0yTTVaVTkzVURKcEswMUtUVUpNZFhJM1VFUnVhemhKY1ZjMVJVdFRRVlZXVFRWVlFWZFBUM2hRTjBKNWNtSXhNMk5CY25ScVRHMVNlVFpLVmxOSlVpOWthWEk1T1dWeFNuVmtVM0ozZUZOd1dYQk5UVnBMZUZkdldXVTBjblo0T1c5d1oyWlJhVGx3V25wMFVFRkVOVFl3ZEdZMlkwZHBOMVpaVEM5U1FtNXdUelZWT0hGdmVsbGhSVzVGY2pCcFpGSlRRMUpZVld3MlFrVmxkMHA1YzJWbU5XVkpNU3RsVVZCQlpHNU9lRkpXWkNJc0ltMWhZeUk2SW1VeVpEQTNabVprT1RFd05XVXdPV0ZtWWpBM01HRTBORFl5TXpVM05tRmtabVV3WWpoak1HVXhOMkl6WWpZeE5EQmpaREpqTnpObFpHTTFORGcxWkRnaUxDSjBZV2NpT2lJaWZRPT0=',1762078026),('kkrY4QsuKOb2vy2Ttbfn7529CpTHVgZecGUCUbFm',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJa2hrVW1zdlRYQnBVMDVCY20xMU9Ib3ZURTVtVkhjOVBTSXNJblpoYkhWbElqb2lPV3B2YWpobUszaEZWbUkxTmxOaUwzRk1ObnBRUjJweU1UQTFXbmxETjNVcmQyeEpjbXhyY0doaVRESTROVTVCTkVoMFFqWlZVV3BJTjFaMGNIaG5iVEp4WlZBdmVTczJTMjFLYUZsaGFsVXJkbVYxWlRaUWJUWm1OR1U0Y2xSTFdGVkZibTF4U0VSUGQwSXZhbmR2ZVRkME9GaG9VRmxGYlZneGEzaDZObmRTTVZNdlZrMW5iamd4YUdaNFpHdEtNMUp2VjNaUVNqRmthRUZFTkVOSGQxbHpVVkJzTm5OT2NsUktTUzlqTDFrdlVVdzRLM1p2VlZCNFRuTkplVTFpYlZWaVJHbDZWbEpRUjFKUVNsRnBia3RQWWxWVGFsaGxSV1JyVDJ3cllrSTRaR295Wm1kdmQyMVVURkZSVVhCak9FdEdPV1pMWmtWS2EyWjJNVTVCYlNJc0ltMWhZeUk2SW1WaFlUUXhZV0pqTWpjNU9XRTFZVE16TURZelptSXlNRGRqWXpVM05HVXpPRGt6T1RRMU5UZGpPRE0zWlRVeU1HWXdZelk1T0dKallqQTVOakk0WW1FaUxDSjBZV2NpT2lJaWZRPT0=',1754481195),('mJrRvbkJlaNE4p2qeDJXHORpPAZOEm1Hyxr1qL77',NULL,'127.0.0.1','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','ZXlKcGRpSTZJbkJVYTBaRFlrbzNiaXROYldveVVtaGFUekF5ZEZFOVBTSXNJblpoYkhWbElqb2ljMDlYWlVKemVtcG9jVE5HWlZOU1NGUjNSU3QzTUVORWFYQk5ZVEI0YjBJMFJWRkNhMUJoUW14aGFWZHlRV0pNWVcxTWNqVktXa3hsTVcxTFJVdHBhelJKZUVWWlVtcERhazRyV0cxalRIRkJNVlozV1RKRVN6bGhXRzlETVd0VFRIWjNhMEozTmpWaVZWbGtWR05YTjBzME5uZHRNM1JpWVhwemNVSjJaRlZNV25NM1ozZGlNVFZ5V1RSWU4zVnhPRlF4YWxOTmEwRkpXRXc1ZVRKblZ6WnVTREZvTTBvelFWcEJRWEpaYldOTWF5dDBkRE5XUjNKdmVHWm1XWEU0ZFZkeFNFTkNWRmhOUVRST2JrMVpiWE5KZW1SdU5IcEJRV295UkU4eGExWkpWVko2V1hSd0wyZzFOV3QzYlUxU2F6TmtiRUkwU0dORFFpc3hjV2xTUnlJc0ltMWhZeUk2SW1FNE1EVXlaRGxpTURZNFlXVTJZalkxWXpOaU9HSmxOV0ZpWmpBek9UWTBNR1U0TXpBeFpXSmhPRFk0TURObU1qVTVZVEZtTkdWaU9HRXdNRGRsWWpVaUxDSjBZV2NpT2lJaWZRPT0=',1754727162),('nHzX9dq1MDeLKCHnjUWHt2mseZqHXsfHEcuQGJYb',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJblpLU0d0WE1qVkRSSEY0ZFRKdmIydHdZbnAwWm5jOVBTSXNJblpoYkhWbElqb2lkR3hKWTJaWU1UWlpWbFppYlRGelZGbG5XV1ZZU0Rod1dHNUZZbGszY3k4NGJVZ3ZibmxtVGpWM09YVnRhMXBqVm1oTWRrbFZMMlZ4UW14cVF5dFZjVGRwUlZsc2MzUlRaMUowZG1JM09FeEZSblZCU0hreVEyTnpNR1ZEVldSS2NEZHVLMmc0U1d0SFpUaFdXV2MzWlRFclkyOUVVVk5KTkVGV09Ib3JSMWx5VjJGS0swNHJabkpMYVhaaE5UQlZlRnBqVUVwV1J5dEtWVnB0UldaSU1YQnpXRUpxVFZRMUszSXhRVzlhZGxsTVJtc3pNa2RTVTA5elVWTTNWRGhtY1hsUGMxZHFVVWxaZDFwcFVWQjROWFpSV0dVNU1WaHJTMGh2ZUhOSVNGVlFhSGR2YkRZdlFXNWhMM1UwYlUxRVdWSjZXbE5sZGtkQldWcHdZa1ptY2lJc0ltMWhZeUk2SW1JelpHVmlPVGs0TWpreU1XRXhZMll5TlRBeFkyVmpNV1V5T0RCak5HTTNaREprWlRFeFl6Vm1ORGRqTXpObE5URXpaREZsTXpCa09UTmlaRGxsWXpFaUxDSjBZV2NpT2lJaWZRPT0=',1754806583),('Ny0ZxU3htBOhttwS7pL1yU7usEUYqXThE8ffZID5',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJbTg1ZUdRMmJuVjNMM0JGYUU1cVlqaE1VREZQT1hjOVBTSXNJblpoYkhWbElqb2lPREpwUlc1MWJWSndZVEJLWVhaUFJFaExka2cyY210eFFuRllkRFp0ZERkeGNqRmhSVk0xTDNkMWVrRTNLMms1VDBwMU5FazVkVUZHWTFOYVRuRXZTMGRFVlVkS2JrSk5aaTlsUTA5VVR6SnpjMHN5VGpNNVRsUTFWMDExVlM4NUswRlhOSHA0YzBKNmFtZG1ZamRzYzBwak56TlJiMUZ1YTNKMmRub3lOVmxQVTFaR1JtRllkbkpPT0dSTWFXbEpPR0pGWVhoSmVEVm9hamM0WjA5a2NuQndkSEJ0ZVRoNmRtRXpUbGhYU2tGT0wxVllXR055U0ZweGEwc3dkbEJvZGt0cFRrdGpRVkpxZG1wSVVsZzFOWEZVVmpGQ2IxTkJkRmR3Y0VwVkt6RlJRMUJwUkVseUszWlNNR1JUZDNaRUswSnFXakJXTWpseVNHZHZlRzEzT1NJc0ltMWhZeUk2SWpFek1EY3pabUZrT1RnME9ESXhNMlpqTmpoaU1UZ3pObVk0WXpGbU1UbGlOakZpTURZMlltRTFZVEE0WW1ZMU1tTm1OVEJpTVRnNE9XVXlZek5pTTJFaUxDSjBZV2NpT2lJaWZRPT0=',1762136361),('pQSIgsjoM4OTgEAeUiLflLG2KEAXjSjl5vBAJuPZ',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','ZXlKcGRpSTZJamRHYjFGQ1l6SjRaVkIzZFRGWFNVcE5abU5DVjFFOVBTSXNJblpoYkhWbElqb2liVTEzVWpOcGJVOWlWSFJ3VFVOSk1WSXZMMGxSUjFwbFMydE1RbnBwTmxkeGRqQTBaME5NVDNSWU1WbERPRWswUVZkTVVEZExTRkE0VWs1U1RVMVVTbHBYVW1kS01teFJOV1JXUWt4SGEzbEtja1JuYWk5RVpXeDRNa1kzUjNOT1dtdHlOSGg2VDJKcVdYaGljSG94VHpkRVVUWnVUWEJ5TlVsNlNIWlRNWEo2VEhaSFVtbFZTVUpUUlhOMVNVTlRZMnRIVFM5bWNTOHdNRkI2YlZKR1NuUlFkMWhvZGpReldGcHJaRnBYYVN0TVpFdDVjMWxtTWtOTlEwMUVZV2hSZEhvMVEzQkpRa3BGVUdwbFdEUklXVWxRV0ZJMVlXODBWeTlqT0hwV1RqRjZhRzEwT0U1bVJGRjFRVk5xUmpSNlVTOXNWbkJ6T1VWNGJGQm5lbXhoZHlJc0ltMWhZeUk2SWpFME1qRXdZbU14T0RKbU5tSTFPRFk0TWpCaVpUWTVZamszTTJKaFpURmlabUpsWXpGa05XTXhNV1ptWkRFMU1UazJObVJrWlRCall6TTBaR1k1T1RFaUxDSjBZV2NpT2lJaWZRPT0=',1763187365),('px80bu3NDOPs7vcaHPAJdr9iJTAucdBzxvHDCMyl',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJamxMZVVsQ1ozTjFiWHB0ZWtWNmVIWmhVSFJxYkZFOVBTSXNJblpoYkhWbElqb2laU3RqYURFdk9WcFFiRVZqWmpKSGNtbFNNM05XT1ZOblRYUnhSbGxUWjFKREsya3llbXhhZEdac1JGVTFjMkl4U0hoMVVrbzBVekpOTjBsMU5XOVdiR1Z6WVhwc1ltMVpjRVJFTjBObFVIVm1WRGQ0YldGb2Jub3laSEpIUjFCa01VRnFWSE0yVDBkTFZHTXpWamcwVDFKM1JqaFdiM0ozUm1aS01WSkZZUzlQVG5SdVoySm1kbFZNYjJKb2JEZG5ZV2htY2twaVNqaHRZV0ZKWVdVemRGUk1Za1ZsTDNKeEwyWTFTM2xGZFZOWFFqZGpTRTVZYWxZM2JFTjVNRTFsZFhoWVMzWTFXVTgzZDFVMVdVTTRNRVZuYlRkbFZtZG5VRk53SzBwNmNWcFFkMG8xWVhoclJUVldVa3AxZUdGQmJVTmtNRlpaYkROdk5Xc3ZZVzlPU0NJc0ltMWhZeUk2SWpVeE1EQm1NbVV4TmpBellqUmxaRGczT1RKaVpUTTBZV1l5WVRBNE1XTXdabVF5Wm1aaVlqUm1aRE16TmpRMU9UaG1NekF6WTJRME5tUTRPVFZoTWpNaUxDSjBZV2NpT2lJaWZRPT0=',1761977271),('qAwFiae37Tum06y7p4030e5No5R4JaZISctctb7C',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJa0l4WjFGWUwwaEtlbUprVFVzeVpWbGFiR0pJZEhjOVBTSXNJblpoYkhWbElqb2lWV0V3VEZGbEwxcHRNVVJ3VUM5RGNHSkNjWFJPZURaM2NXZHFXRVkxVkc0MmJFOWtNMEZpVUdOV1dGaElTVE00VUVVclVrcDViVGcwVlZSeWFHWlpkMFpyVEM5aWNWcEpWRzR5VG5aQmNGSlRkVWN3WXpKeVkxY3JVMmRJZVcxalVFeEVlakYwZG1SRmMxZHlZMWQ2YTBSd1ZpdFZMMWhITkdOT1ZVTkdVVzgwWm1oeFNESTNSVWR4ZEdvd05USm1LM3BvYlUxeVJXbHFMMVJyZG1GcmRVdGFhMVZDTnpORWEwb3ZjbmxPUm5WTFRVOHZWalJuZFdJd1ZHZElOMUJXVDFwb1ptTnBaVGg0VjFaTE1FUkJNMlZMWmpBMk5WSldNRFZKYUU5a1RrbFVUVTFsYUdSeVRHbHpLMGwxVUdWSFdsTm5kMlp2YzAxVVpFZFJieXN4WXlJc0ltMWhZeUk2SWpjeE5XRmpaVEEzTlRWa1pUZ3hOelprWkRrMU5qWXpPR0V3TURjMU56TmtNVFk1TURjME56SXlPRGsxTldZMFkyVTBNREkzTVROaVlXSmhPV0poTm1NaUxDSjBZV2NpT2lJaWZRPT0=',1754567503),('QulS6TmtahBkVJu6wrpQ28HCN8hQlFeee0b2INVH',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJbkZQZUUxdVFqZERXRE5oYVVWcmVtZHNTVzVzU0ZFOVBTSXNJblpoYkhWbElqb2lMeTh3YjJrcmRGaEZjVU55TUVSMFJqWTRTSFE1WlRndk5UbHRlbGxOY0RSbWFrbzJURE51VTB0U1YwRkNXbkZLVVhWamNHNTJaWGRDZDNONVRXTTJRVE40YjB0eFdFbFpTVUk0ZDFocmVFNVVkR0ZyVDFGeGQxZE9WMWxDU2xwNmFFOVBhMFJ0VG5CQ1JsWjRhVmQyTlhWbGJtSnhWM0p6YVdwamNESlBSU3NyWXpCemR6SnROMjU0WldKNFIydHRTMFI2YzBkclZHcHdNa3h2Tms4clpGRmplVEV3VHpCV01XTjNVMjA0U2pjdmJIWlNiMlZ0YWs1TWRYbHhka3hpWkhCd05HRjBhRlpFUm10cWJtVjFTRk5zVmtjNWRHWnphWEpuZEVabE9Fc3JXa05HVUcxa05ETTVhWE5STm5ock9XZzJRemhrU2xOMlZWTmhXVE5SVmlJc0ltMWhZeUk2SWpGaU5EVm1PVGswWW1Zd01qVTVOMll3TmpNM01HWTNaVEZpWkROalpUUmxaVFF6WkRreU9EVTBPVFpoT1RNM016WmhOVFF5TkRneU9ERmtNR1JqTlRjaUxDSjBZV2NpT2lJaWZRPT0=',1762129551),('rEzBaZQDPLJCHNX4K3YXeFs0tmYs1PM6GR6i5yVS',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJa2hVYzBNeFkxQXlLMDVtY0VGb1puTlJZMEpYWjBFOVBTSXNJblpoYkhWbElqb2ljRVJKS3pNM0x6a3lRa2RxVm1FMFZIaHhUVWgzT1dWaU5qWktiSEU0Y1ZsV2JYcFFNVGRSZVc5Q0szRjJNbVpaYWtvelJIQnVTazVLYVRaeWVsRXhkVFV4UVhkTGVubG5SMnMwZDFGTU4xQjZjalYzWnpremFFY3hPRU0wTTJRMWJ6SlZSVXROUjBScWMxVmhlUzlGTjBzeFJGZEplRlZwYmtadVdtTjBhSFpJVlZZMWIydE9VeTlPUlVSRGRDOUtiVUp3VTNGeGJYRTVXSGhKYnpSTWRIcG5NbTE2VDJKeFNtcG9XSEIwVlVsaFduQndaR1ZvY2xaNGNVbDRNbk5vV1hjM2JrTnFhSFZuTWpSTWJXUjFiWEIxVTA1Q1FURjBjM2Q1ZVc5U2FqQkVNRmhtVGpSWVdWTlhXRVZXUW1Wd1JpdGxjRUZhS3pnd1oxRjRVVzB2WVNJc0ltMWhZeUk2SWpobU5XTTJZbUl6TnpCbU56RmpNR013TUdVd09HSXlOamhpTlRWa056SmlOVFJtWWpNelpqTmhOR001TURJMU5HTXhOR1l3WVRneVpEZ3pNekl3T0RBaUxDSjBZV2NpT2lJaWZRPT0=',1761997393),('RIPIhBhVqgCuqrg3rQNy58dxXDvPwMl9AmlabW9x',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJalpaYUVKaE1sZHNORFIxTm1NNE5XTlFSazk2TmtFOVBTSXNJblpoYkhWbElqb2lSVE5ZY0VvMWJFVXhWbkJGY2xGUFUxZGlNSG92YkhjMU1pOXdkamcyY0Rsb1RWQTJaamN3Ukc1NGJGTTJUbmR1WXpoV2NVOUJXVzUwZFRCS1RGaDFZWFJTZUVSTFEwNUVNVU5pYzFkS01XTlBPWGgwUWtsREsxTXJUMFJvYW1oSGNtaE5OREJMUjJvNFQxUmFSM2xIVmk5M1FXcDNVRUowVDBSUlozTlFjSEpuV25STmVHdHVNaXRJVDAwMU5tUktaVUUzWVdwSWVGaEJabUZ4WjBOVU1tNXhRVXA2VGpORWNVSlBRVXR3YzBGc1YwVXZielF6UlVWQ1UzcFZOa04xYjNoeU9YVkVWVFZHTjBGVVluaGlRbXQyV0hoRVVITXlVR3RMZWtkM05XNTBhVGcxVUROclRERklZVWMxV0ROU01FSnhOa2hwVEVSR0swVkNWRlZCZUNJc0ltMWhZeUk2SWpCaFltUTFOemczTldSbFl6azVaVEZqWWpVMVlXTm1OREl6T1dOaFlqQm1NMkU1WmpFek9EVTJabUUzTnpBMllqTXhZVGt6WXpjNU9USTBZbU0xTkdRaUxDSjBZV2NpT2lJaWZRPT0=',1754710178),('RJii6fgtIHfye75j9IFQyGBgC0jTSSkmKqfqfGaG',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJa3AwYm1kUk5VdFllSE5pSzJwV2JrMDNNRTFKTVZFOVBTSXNJblpoYkhWbElqb2ljMk56ZUdSd1JERlVjamhZY2tscVltWTVTRkJLZGpWUk5WQnVkVUprVTJaT1N6RmtaRXhqTlVkQ1VXeHphamRSTkZKV0wyVk1jSEo2UjNoaWNHNHdhV05vVDJ4MFkyMXhTVnBsU20xSVZHVlRRbmRDUVZNM2N6SkhRbEY2ZWxkalMzaG9VVnAwTkRZeE9URnlSRlZsUVZWaVVsbGtVbWxPY2l0WGJUSm1RV3hoVDNKWmVqaHVSRFIzY21aS2MzZ3pOWFZ6UVZwNUwwUTVObkYzVld0SlQyWllXbXBHZFhaTE5sSmpaMEpzYldKVFIyaDFRazFwYjJONWFsbDNjaTlUUkRjeFJYQm5MekJVUzBVMGVWWlJjM2xNUm05UVdERkdkVzU1ZEZOT2FrZE5VV2g0THpVMlVXdHhjWFJvY1RaclJ6UjNXVnBDUm5VeFkycEVVbEZDVHlJc0ltMWhZeUk2SW1Vd016UmlORFpoTnpWak1HWmlNekJsT0RZM1ltVm1aVGhsTldObFlUSTRaVFkyTm1Jek5tVmlZMlpsTnpoak1tRTVNV0kxWWpsbE1tSXhNekJtTldJaUxDSjBZV2NpT2lJaWZRPT0=',1754653387),('rT85zONCwbKCrpCQ3vcM4LTBxGDk7yJHGxybF39B',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJak5yZWpkSWJVRm9UMk5LT0hGR0swcDVSV2h4VjJjOVBTSXNJblpoYkhWbElqb2lRa3d2UjJac00zQjViWEJLT0U1RlNETXpiSFl5YVZaWFJ6VjRTSEUzYzJWQmMxRXdiRTE2VTBOWVdFVnNVM0ZWTnpZelVHSTBUbkpXUzNkbGR6Wm5RMXB4YjBoUFlrVk1hSEp2ZUhablQyczRhVmdyTUVkcFZEVkJOekp5V0c5MFR6UlhaRXBhTVVvM0swbFBNMDFGWldsSE1VTlJOblpPYjJoR1IwTm1TaTkxWTFrMVpuQnVjV3BzY1V4eVJFSktSaTlIV2xGcWRIcDRjbEl6VHlzelEwbExjWEJpYUhsb09WQkJiR2swVkUweU5uSmpjVEF3TDJJNGRGa3liVzRyY1dkSkt5OXlaVWRwTW1scWIyazBlWFZaUVZkdmFpOHhabmRZWWl0blpVa3dNRFpLTjNWSkwwZ3ZWSGxqT1dsNGRqVklPVmRPVmtsU05uUnBNQ3RsT1NJc0ltMWhZeUk2SWpVNU9UY3hORFF6TmpkaU1tRXpNV1EyTWpsa1lUTXdNelUzTkdVelpqSXlaREkwTkdWa09UWTBNRE0yWVRSa05ETTVOV1poWmpJd01HUm1ZV1JrWWpnaUxDSjBZV2NpT2lJaWZRPT0=',1754790846),('rvBZ9lO1Xi3KUFI6f7CqRra1RiISILfNdiUg4JvA',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJbHBNZEhWelZ5ODVjMVYxUkdkNVdXZExVekUwVFhjOVBTSXNJblpoYkhWbElqb2lkSGxKVkhKMldra3pTVkJZVURVclZWSkxRMGcwYlVoeWJHRXZNVkUzWW5jdlExZHhhV1ZwV1doeWJGZDZkbVp5ZW5GSU1tVk1SbUpKY214RE0yeDFVMkZ5WTJWNldGYzRRVE56U3pneVptWXdMMjU2U3paWk1GQjFUaXR4WjJObmMzaHFPVFJITnpVdmVFVllLMmgxV0ZGd2ExZFNXRXhMWWl0WloyZEdSekI0YmtWV1YxWkNZVXBLZVdoTGVsZHJlV3hxWXpOVk5WUnNjbm80VW1aSWVFaFRXVUpzYm1wV1JqRkNOblE1VFVGQldFTlpWMkZ6UVV0a1RFeG9hV0poWWpKRk1ERnFWRk56VTJscE4zbFFSa2RyY1U0MGQxb3JRakJaYzJGSVMwaFlTa3huVFRKaGNXbDZZak14ZFdSd1RFY3paVVZDZUVsc1lrUjBUbEU1WWlJc0ltMWhZeUk2SWpZM1lUUTBabUkyTURSa1ltTXpNekV4TkdOaFpEbGpORFJtWXprNE0yUmxPR0ppTlRsalpESmpZVFUwTXpaaU5USTNNVFl3WWpZM05UaGxaRFZqTURBaUxDSjBZV2NpT2lJaWZRPT0=',1761826174),('s5UNlKi5kugRa9GjQ3gFXmCSITpS6mkwHdoZzAWJ',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJbHBKVEZsb1IzWkxZazlMVWxsMlQzaDRUa2d5ZEZFOVBTSXNJblpoYkhWbElqb2ljMEZCZFhKUmRsbFhPRXQwYVhCTEsyVTFNMFJZTkVKQ1Z6QmFjVVpWUVVOR1NrbFNRekpKVERBM1VpOHJLMmRWYkc5S2NrRkdZVlpNVjFGd05uZzVOVlJpVldrdk1GWkdNV0lyUzFkbFJFOXhObmd5ZEdRNGR6Rk1iRlJEYTJobWVYVllUVkJWVDFkS2IyWkNWV2w0V0RoMGJGSkRjMGMwUnpGamJtdE5jQzlwT1drNFNIQjRVRTlUU0VwTWNreElSMGxqY0dzeFYycERXbTk0TmtOaFNGSnRXRlJ1UjNReFJGVlVTVFUzTm05S1p6STNWVWhDU21jeVEyOVpMeTlGUld4MlVHdERRbnBpYlc4NWNYTnlTRlZUYUVneVdDOUpZM2d6TkVsaVJXMUpRMUpPYm1ONVVsVTVhVmhNYWtadU0zWXdTbTlFUnpkUFprWlNUeXQxZFNJc0ltMWhZeUk2SWpBd1lqTXpNRFV4WW1RME16UXlNelEyTnpRME56RmlOVGN4WVRReFpqVmxNMlV6TXpVNFptVTFNelZpTVdNMVpqazJPV0poTkdJeVpURTVaR1F3TlRnaUxDSjBZV2NpT2lJaWZRPT0=',1754487593),('SKyChd1GTh0eIWPYNSEIbrh1CPiphs9Iw0m2qx1d',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJbnB2UzBsWk1XTnFOV1p4UzFGNFZsQkNWVUZGVlVFOVBTSXNJblpoYkhWbElqb2lkRTRyY1hVNGNtVmxVbWxSWWxaMGJGWkhaVzVJVG1aWVlreGxkbVkwT1hScE5EbDVaVFpxV2toYWVsUlFkalprTW5sS01UaFVXR1pYUzFCRk1uVjZjWEJpWTJsUVlTODFlRXBCZEVNNVYwNDJiSE4zVDBaYVpYQXJabTVEYmxKemFtUlJNVGQ1UmpkYVlYbHFiVE50ZG5Kc1psbDNVbTFwYm04dmFuTm1RM2s0V25wNmEwZHJVRTVQUzB4UE5uVktWRzFuTmtvdmFETlFWMWhCYTNOQ1VqazRhMGh2UTNkQ0swc3lRMmwwTWxWNFRXSndUekpQVGk5WmJrTndNMlJqZWtkR1EwOHlTa1Y0U0VWaFJFZGxVM2xNTWtkMmJEUkNURU50TVN0cVowWlNkWFpMUlRGV1drTjViUzlyVlRKbFZqaHJTbkp4ZUN0MWRtbGlUMGh1U1NJc0ltMWhZeUk2SWpGaU16WmpabVV5WlRrMVpEbGpZV001Tm1Nek5ETmtOVE0yWmpVMU1EazBNamN5WXpFNE1qTm1ZVGszWXpneFl6QTBZakUyTUdVMU5EZzRabVpsTjJVaUxDSjBZV2NpT2lJaWZRPT0=',1761830476),('t178Tp1fLZ9ozv4JZG2cAcEaN3rqNwHevVa0f0l3',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJbVZUVDNSQ1RFeHBkVXREUVhkUUswVk5aMkkzTkhjOVBTSXNJblpoYkhWbElqb2lXbXBoY2pKaVlrbDJVbTg0WVhWUVZXcG1kMDltVTBjM01YUXdPR1JsU2xab1QyZERlbThyVlZkbVdUUmhiRzVXYUdSc0wzUk9jMHNyVlVReFExSnhURkpoY0d4SVptaGlaM1pUTnlzNVZUaEhaVTFzUVRkalRteFBVRk54TldOWVVFUlpNMHBhYTNKUFdrNDRka3hUZDBnelJUTjFUbGRSZEhKNFpVUTFhWFIxVjBSdWJuRTJXVE00UkhJNFpYaGFOR2hVTjBKNVFsQm5lRGx4TW14RFpXVTJaRnAxUzJGM1lXbG9NbUUxTm5Od1VFODNiazFDYWpJdmRXUmljVEozY0ZkQlQyRnlaVXRvVVZsU05IRjRTR3hvTm5WWFdXeFNhemRLV210QldWaDROMjlSZHprcmRrNDVPWFZPVG1nMFVtOU5LMVIzTjNSTFRIQkJaSFl3VUNJc0ltMWhZeUk2SW1ZMFpESXhPREZpTmpBd1lUYzFNamN6TTJVNE1HTmpaVFUyWldReVlqZzNNemRtTW1SbU5UVTJOekE1Wm1Jd09XWmhPRFJtWkRjd1l6RXlNVFEyTkdJaUxDSjBZV2NpT2lJaWZRPT0=',1762005071),('tyEg2XSnSzytrVy6bBRDOUJG89RNxnjKGzIppQNC',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJbkpvYVdkUlJISm1la1ZDWXk5RWEwYzVXVk5HYkdjOVBTSXNJblpoYkhWbElqb2lWV3B0TjBzemVtc3pNVkJ0VUcweVoyWmpRVUo2Y1dkTVRVTTVkeTloUzBFMVIzSnRSamxMVW0xelJVMVZMeTgwYm01QlozaDBPVTAxUWxRd1ZuUllTR0ptWTI0eE4yOUJZbGx3VTBKaFJuRnpiSEV3YkZCQ0wzZFdSRWQ2YjI1MlIwaHBZWFprVjFRNVlqZFVNVEpFTVdOek5WZEdNbFEyUkV4M1UyMXViM0pyVVVSS1pXSjNNRVZMZFhaWGJIaDBiRlUyUnpCWFJuWnlTM0UwVGpCWFEyRktTbkZHV0RsTWIxQTRUMUUyVmxJMmFuVkhPRk5GZWpKUGJFMDNOVFJFZDJwS1YxSklRWFJxTkhad09VbENVbmxrWTNaeWFGaHlkVWhJZDFoUlFWTmhMMDVRWkhSQ1RUbGxSbFExTDFZMEwxQnBXak5zUVhodFJEaFFaSGM0YkNJc0ltMWhZeUk2SW1Oak0yVmxaak0zWkRjeE9XSmhNams0WTJNek1tSTBNV1V3TTJRd04yTmpZekJrWlRSbU9EY3hZemMyWkdVd1pXUmxOREV3TURReE5EVTFPR1ZsT1dVaUxDSjBZV2NpT2lJaWZRPT0=',1754795523),('UAlgfV1hJTUkPRk9ZfzmVgzFsmrZTvJMm5ek0bsn',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','ZXlKcGRpSTZJblZLU2t4RFFsRjZSVlZ6WkhFNWRtNWhaVnB3TDBFOVBTSXNJblpoYkhWbElqb2lhSFJ1ZFdFcldtbG1UbTFZWkVaTGFtZGxabkpUS3pGalFrY3pLeXRaS3pGNk9IWkhaMFVyYlZJd056aEtZbE5VYmk4dk5XVlJVMDg0TlRWdVVHODJMM2d3Wm1GaFFXSXhZekpaUW5CT2NrOHJNR0ZOY1hCeWVGbExZazg0VUVWSGVXaGFkRTVIUjFoRk0yTjFObkJYVWxBMlJYSm9WbWM0UXk4ek1tbzBUSFYwVWpZMVVXNXJUV3R2VnpoUlJ5dDFhbTlwTkd4NVZ6VldWek4yUWtoSFdFdHFjRW8zUnpoc01sbE9hbXBwVUU1c2EwWllSRVpuUW5kVmRFZzFZemh2TkVOWk5WSlVjUzlEVW5KeFNtczBNMFZUYlhOSFFsTkJjR1oyYWtwd1IxTk5VeTlvZEhWeldVeFNUemsxY0dSWmFXcFBSSE5aYjA5eWVWQm1jMDU0UmlJc0ltMWhZeUk2SW1JMU0yWTVNbUl6WlRsaU1XUm1OR1JrTlRZM09XRmlOV1E1T0RsaFltRmpZMkl6WmpabU5HSXlPVEZtWTJWa05qSTVPV0k0T0RZeVlUVTBaR1U1WmpraUxDSjBZV2NpT2lJaWZRPT0=',1763191153),('W6wlV4spa2MiWJTF965i2FGIi8rkm9tFelZcU1pm',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJbTQ1WldOTFFWSjJOVU0wV0dobmRFOHpZMHd6TWxFOVBTSXNJblpoYkhWbElqb2lMMlkzVW5WRGMwTkxWMjV0UzNSb1pIbElia1JWY0ZWTU5UTjNka1JxZFROalZIaFhibFptU1VWUE5FZElkemMyT0dwUVZrcFBTMlF4Tm1OdVJEQmFOMUJuVFdoU01rdHFNR0pHVG1WS1N6QjJNamcwUWpCUWVrNUtTa1ZsVW05YU5EWkZWMVZyUm5BclVqUlJRa0o1VlRSblFYWTJNMkp1YVRaS05FaEZORTlzTDNSdGJpOVRSMlJXWkVzMEx6TmxaM1pSTTJSa1JVeHBUbXN4WVhGS1dFTXhjMnRNTWxaUFVrdHRhelp2VUZJeFRsVTBPV1Z6YzFKVmVGcHNSVFpDY21obGQyMUVkWGRDV0dSUk1WaG1jazl5VEdoR1NtWkNPRFF5Tm1JelIwdHBTa054UlRaeU5GVndObGcwT1c0MFdVTjVXWEpxT1dkWWJIRk1aM2g2U2lJc0ltMWhZeUk2SW1ZMk9UYzJaRGRpTVRjNE1UWXpZakptT1Rnek5ESmxOemczWkRKaU1XVXpOVGczTWpFMk5UazRZVFk1T0daaVpqTTFaR1ppTnpVNU4ySmxNV0l3TW1NaUxDSjBZV2NpT2lJaWZRPT0=',1761467115),('WKCpsNX9si0KU1ZGMfpWzzTB9PZIrTM9LSMl1PWw',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','ZXlKcGRpSTZJbmx6WTNNNFRHc3pPRFJTZEROVlowbFVlVTF1U0ZFOVBTSXNJblpoYkhWbElqb2lPRXBuVkc5b1UwcFlTelp2YUhKUmJuWlhMMnBPYm1SS0wxcFVjMWhGTmpKeWExcDZTVXRETWtnM2MwdDVhbXBQWVcxbU5IZE9WV3BhYW5sdlZFOUdTM1JTTUM5U1RHOXBiR1Y0TUhZMWNuRnpWVmxtU2xKT1NUaDBiSEZFTVdZck1UUjFTR2RYYWpOcmNYSkxhWFpVTjFkdFZWSkRjRzFJTUhabFExUTRUVWhOYWpKc0swZG1UMEpFWXpJME4xb3dhVzVXWW5VM05VSjRkWEFyTjBaMU5XRmxhVU5CUkRNNVVucE5UMjlpVFc5d1ZqaGtNMHAzTVZJNFZtaFNSa2xVZVU5TVNWSnVWa2RTWVZGTGNXcHhVR3N2Ukd3eGNYUjZNVGc0TWtsQlZUZEZOSFkwS3pSWk5TdHZOMU5uTW1kbFQxSktjVVZRZVZVelVrbG9lbmxIY2lJc0ltMWhZeUk2SW1Zek9UUTJOV1ZqTldObFpqWXpZVEE0T0dFMk1qZGlPRGt5T0RnM01EVTBORFExT1dGbVpHUm1OMk0xTWpZeU5qUXhPV0ZsWkRCaFpUZzVPV05rTXpVaUxDSjBZV2NpT2lJaWZRPT0=',1763199393),('YlIB0kjdzm13VGW83PaKsJNLNUCxw31jiTpU0DRG',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJaXM1VVRkMmNWWkdaMWRyWWxnNU5WQTVWa2s1TjBFOVBTSXNJblpoYkhWbElqb2lhMDlWYVcwclQxQndNRWN2WVZadVVVWjViV1JsTDFOT04yeFVkMGRLVnpWTFNGcG1kMU54Vlc1WWVqaFFUemhvVUdkNVYyaEdhRmg0Y1ZKNmVTc3JSVXhOVERkbGFuVnlNbU5QY25GbkwyWk1hVzFqWVhGQlRHd3dRMUkyZGtSMWIydzBOSGxhY0c1R09GZzNTa00zVEZWV1ZYZG5TV2t3UjB4WVIxWndkME5NSzBWeGVFMU1TVmRXUTNSaVpXdFBRM05ZUzJOd1Zta3dUSGhOVmtKT2RuTmlTQ3RPZVVsd1lrcFBSM056YVZsQk1UZE5WVzVwTURkV1kwcGlSVlpwV0ZWR2FreHJRa2QzYm5RNFJYUmlWbkYzYkVsU1NsZG9ObTVxWjBnemJFNVVSM1YwV1hwMGNVVmtaa2xpV1ZOclpVWmpaV1poTjBodmNHZHplSGRPWWlJc0ltMWhZeUk2SWpObU5qTTJaVFExWW1Kak9ERTBPV0kwTW1FME5UQXhZek13TVRJeE1HUmxaR1V6T1RRMk1qSmlNekpqTkdGalpXVmhaRGN5TkdOaU5XWTROR1UzTVdJaUxDSjBZV2NpT2lJaWZRPT0=',1762147655),('zcWdAnPTrF7M1rSgD3i0mpdw02wXyxPwcQqCWInT',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','ZXlKcGRpSTZJbkJYY2xweFIxbDRjVWx0TW1GYWFDdExZbWxQT0VFOVBTSXNJblpoYkhWbElqb2lLMU5qTVd4YVFYbEpabEZ3ZGpWSVVsbzVXVmh4V0hRclJqbDJRemcwT1RoelJuVXJTRVZWV1RCNVMyVmpUUzlGTldKa1lWQlpjM1J4U0ROM2RraHBkRXR1YlZkWlFVdENjblV6VEdkWVRETkhNRU16WVRVNWVTOU1kRVpSZUZkRFJsaG5NazUwVG5oMU9XRnlXVVk0WlZSRGRYTkJNRkZHUlZaV1ZXUnNMM2xqV2pCNk9XNHhMM2RGUW1GUU0wb3dSa0phUm1sSVdUSTRWVkJGWldnemRFaGtkMDlrYkZoQ1ZqZFpZWFptVFVVNFRWVk9jM0pOYVhGaGVIbEtVVlkzTkVGVlduUmxLMjVNYUcxSFExWjVWbmhCYTFwRlVDdDRNRTlZVHpCd2JrNHlMeTlRZVV4bWVrcDNkbEZ6UlZjd1VVSTNjSHBWY1hGc2VYSklMelJ0Y1NJc0ltMWhZeUk2SWpKaU1UTmpNalUyTjJaa1lUUmxaVFJtTUdGak5XRTBaV1F5WVRJeU9UQm1ZakJqTW1GalpUVTFNbVZoWVdaak1qSTBaV0ZtTkdNME1tUXdZalEzTWpJaUxDSjBZV2NpT2lJaWZRPT0=',1762043111),('ZSKxjBUFfbN9bptq8Rile1POeMSH39BqmmUI9EeZ',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJbWhRVGxaamRrNDNRemxrV0V4MVEzbFRjVnByTVhjOVBTSXNJblpoYkhWbElqb2ljSHBqUkhkaFdWWmhhbmhHY0dwQ1EzYzFXRmx5UzBSd1VFYzBObVYzWW1OclJrVnJSVzlEV0U1a1lVOW5RU3RSWTFWV1JITjJRMWxFWkd0dFltbHhNR3BsUTBSYVpqSTJVR1p6YzBWd1NqUTBXRXhLTXpCWU1XVkdibGR3WkN0cWJrdEZVa3huTUVOcFlWSmtXVlZMV0VJNVFqbExWbFJqUjNWTFZYcGtVMmhxUWtNeWExTlRjM295TURKS09XaEpVbEZqVXpOYVNtcERNMlJqYWpCd1YweEhWMFZDYTBwVmNUbHpSamxyV1c5eFdHdHdMMm8yU0VFelpsSTJNMk41Ym1GVGJFTXZibGhCVlV0RVFUaHFiMEpETlhOblV6aHVVbGhrTVVvNFJITnpWVE5YUVhCTWRVRnVUWEV2Y0RKaloydFdjU3Q0Tkc0clFUaHNibGRvZWlJc0ltMWhZeUk2SWpJNFlqRTJOREJsTWpsaVpUZzNabUkzTnpVeE56VmpNekZqTlRCaFptRTJZell3TVRkbVpETTNNekkzTXpOaE1EQmlZV0l4TTJReE9UWTRabUUxTkdJaUxDSjBZV2NpT2lJaWZRPT0=',1754827242),('ZXezF7MJXCeLrfZoGLYbukQqncuK05fr15jlxuZW',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJalo1VVhoTmNtaHZjRWhHT1VOVWVHNUNTSGw0ZUZFOVBTSXNJblpoYkhWbElqb2lXR3MyTTBNelRUbE5VVE41ZVVkcFlUZGtkRTFvWld0SFpHVk5lRmMxTWxsTlUyb3hObWRtWmpOaGRUaFVVa280ZG5aM1duZGpWelExVmsxUWNVTk9lRXhRWkUxQk1uQlFVMWQwYTNoaVNsRlJXVlV4VjBzMUwyUXhPR2RxYzFSTFdGRlNRVmx0VlZscFIwSndhV1JsV0VGbWIwUXhWekJ1V1V0M2JHaG5kVWRHTnpoYVZITkhVaTh3WVhoaVRHNWhkWEJRWlVWcGVITTRiMGM1UkVnelVrOTVkRkJUWVZKTE0xZEthVlpFTkhac1pGUXdkSG8yYzJ4M0swVm9ORll2SzNwV2NDdEhWVTk2Y0hOc09FZ3pRazFJYjJwUU5GWm5iV2hhWjBvMVEweG9Vbk42U1d0bGVYUnRZVEpNVEM4clpWaG1kMUUzWVZSeVNHNWhiRE14Y2lJc0ltMWhZeUk2SW1WbE1XSTFOV0l4TVdGa05HRXhOekUwWWpaa1pUTm1ZakprWlRrM1pXTTFNMkUxTXpRMFpqSmhNekEzT1dJd01qQXhObVl5TUdZM1ptUTFZak0zT1dJaUxDSjBZV2NpT2lJaWZRPT0=',1754823396);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `skills_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'HTML','Frontend','fab fa-html5','Markup language for web pages.','2025-06-07 23:14:36','2025-07-05 17:27:39'),(2,'CSS','Frontend','fab fa-css3-alt','Style sheet language for designing web pages.','2025-06-07 23:14:36','2025-07-05 17:27:39'),(3,'JavaScript','Frontend','fab fa-js','Programming language for interactive web apps.','2025-06-07 23:14:36','2025-07-05 17:27:39'),(4,'PHP','Backend','fab fa-php','Server-side scripting language.','2025-06-07 23:14:36','2025-07-05 17:27:39'),(5,'Laravel','Backend','fab fa-laravel','PHP web framework for modern applications.','2025-06-07 23:14:36','2025-07-05 17:28:11'),(6,'Vue.js','Frontend','fab fa-js',NULL,'2025-06-27 16:57:31','2025-07-05 17:27:39'),(7,'TypeScript','Frontend','devicon-typescript-plain',NULL,'2025-07-05 17:19:48','2025-07-05 17:32:14'),(8,'Next.js','Frontend','devicon-nextjs-original',NULL,'2025-07-05 17:35:10','2025-07-05 17:42:11'),(9,'Sass','Frontend','devicon-sass-original','CSS preprocessor with variables, mixins, and nesting.','2025-07-05 17:43:05','2025-07-05 17:43:05'),(10,'Tailwind CSS','Frontend','devicon-tailwindcss-plain','Utility-first CSS framework for styling.','2025-07-05 17:43:23','2025-07-05 17:43:23'),(11,'Node.js','Backend','devicon-nodejs-plain','JavaScript runtime built on Chrome\'s V8 engine for backend development.','2025-07-05 17:45:28','2025-07-05 17:45:28'),(12,'Express','Backend','devicon-express-original','Minimalist web framework for Node.js.','2025-07-05 17:45:37','2025-07-05 17:45:37'),(13,'Python','Backend','devicon-python-plain','High-level programming language known for readability and versatility.','2025-07-05 17:45:45','2025-07-05 17:45:45'),(14,'FastAPI','Backend','devicon-fastapi-plain','Modern Python web framework for building APIs quickly and efficiently.','2025-07-05 17:45:56','2025-07-05 17:45:56'),(15,'Spring Boot','Backend','devicon-spring-plain','Java-based framework for creating standalone, production-grade Spring applications.','2025-07-05 17:46:04','2025-07-05 17:46:04'),(16,'MySQL','Database','devicon-mysql-plain','Popular open-source relational database.','2025-07-05 17:46:13','2025-07-05 17:46:13'),(17,'PostgreSQL','Database','devicon-postgresql-plain','Advanced open-source relational database with rich features.','2025-07-05 17:46:20','2025-07-05 17:46:20'),(18,'MongoDB','Database','devicon-mongodb-plain','NoSQL database for scalable and flexible data storage.','2025-07-05 17:46:30','2025-07-05 17:46:30'),(19,'Jest','Other','devicon-jest-plain','JavaScript testing framework maintained by Meta.','2025-07-05 17:46:40','2025-07-05 17:46:40'),(20,'Docker','Other','devicon-docker-plain','Platform for developing, shipping, and running applications in containers.','2025-07-05 17:46:48','2025-07-05 17:46:48'),(21,'GitHub Actions','DevOps','fab fa-github','CI/CD automation with GitHub Actions.','2025-07-05 17:50:28','2025-07-05 17:50:28'),(22,'CI/CD','DevOps','fas fa-sync-alt','Continuous Integration and Continuous Deployment.','2025-07-05 17:50:43','2025-07-05 17:50:43'),(23,'AWS','Infrastructure','fab fa-aws','Amazon Web Services cloud platform.','2025-07-05 17:50:55','2025-07-05 17:50:55'),(24,'GCP','Infrastructure','fab fa-google','Google Cloud Platform services.','2025-07-05 17:51:07','2025-07-05 17:51:07'),(25,'Nginx','Infrastructure','fab fa-nginx','High performance web server and reverse proxy.','2025-07-05 17:51:26','2025-07-05 17:51:26'),(26,'Figma','Other','fab fa-figma','Collaborative interface design tool.','2025-07-05 17:51:40','2025-07-13 17:39:25'),(27,'Notion','Other','fas fa-sticky-note','All-in-one workspace for notes and project management.','2025-07-05 17:51:50','2025-07-13 17:39:25'),(28,'Slack','Other','fab fa-slack','Team communication and collaboration platform.','2025-07-05 17:52:25','2025-07-13 17:39:25'),(29,'React','Frontend','devicon-react-original','JavaScript library for building user interfaces.','2025-07-10 00:11:20','2025-07-10 00:11:20'),(30,'Git','Other','fa-brands fa-git-alt','バージョン管理システム。ソースコードの履歴管理に使用。','2025-08-02 05:37:48','2025-08-02 06:16:19'),(32,'GitHub','Other','fa-brands fa-github','Gitリポジトリのホスティングサービス。チーム開発や公開に利用。','2025-08-02 05:40:38','2025-08-02 06:16:23'),(33,'OracleDB','Database','fa-solid fa-database',NULL,'2025-08-02 23:38:24','2025-08-02 23:40:25'),(34,'Object browser','Other','fa-solid fa-cubes',NULL,'2025-08-02 23:38:24','2025-08-02 23:38:24'),(35,'phpMyAdmin','Other','fa-solid fa-database',NULL,'2025-08-02 23:38:24','2025-08-02 23:38:24'),(36,'Teams','Other','fa-brands fa-microsoft',NULL,'2025-08-02 23:38:26','2025-08-02 23:38:26');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Test User','test@example.com',NULL,'$2y$12$BMGuBxCV5THoi74b3MIyxuJx6xsLCFxvxS2sHzRpaCdJJ1xv78Kj.',NULL,'2025-06-07 23:14:36','2025-07-25 17:08:19');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-16 17:19:09
