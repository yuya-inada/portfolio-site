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
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT IGNORE INTO `contacts` VALUES (1,'John Doe','john@example.com','This is a test contact message.','2025-06-07 23:14:36','2025-06-07 23:14:36');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `experience_project`
--

LOCK TABLES `experience_project` WRITE;
/*!40000 ALTER TABLE `experience_project` DISABLE KEYS */;
INSERT IGNORE INTO `experience_project` VALUES (25,13,19,'2025-08-01 04:24:48','2025-08-01 04:24:48'),(26,13,20,'2025-08-02 01:58:17','2025-08-02 01:58:17'),(27,13,21,'2025-08-02 04:42:11','2025-08-02 04:42:11'),(28,14,22,'2025-08-02 07:20:51','2025-08-02 07:20:51'),(29,14,23,'2025-08-02 08:29:48','2025-08-02 08:29:48'),(30,15,24,'2025-08-02 23:34:10','2025-08-02 23:34:10'),(32,16,25,'2025-08-04 01:37:29','2025-08-04 01:37:29');
/*!40000 ALTER TABLE `experience_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `experiences`
--

LOCK TABLES `experiences` WRITE;
/*!40000 ALTER TABLE `experiences` DISABLE KEYS */;
INSERT IGNORE INTO `experiences` VALUES (13,'プログラミングスクール受講','オンラインキャンプ','2023年1月〜2023年5月','PHPを中心としたバックエンドの基礎を学習。\nHTML/CSSによるフロントエンドの基本構築や、PHPとphpMyAdminを用いたデータベース操作、簡単なCRUD処理（登録・表示・編集・削除）を実装しながら、Webアプリケーションの基礎を習得。＊英語での受講。','2025-08-01 02:26:09','2025-08-02 06:40:36'),(14,'個人開発（飲食店向け）','飲食店','2023年7月〜2024年3月','飲食店に勤務していた際、業務の合間に上司の了承を得て、店舗向けのボトルメニュー閲覧サイトを作成。\nHTML/CSSのみで構成されており、操作性や導線はシンプルながらも、お客様との対話のきっかけを生み出し、店舗のファン化・差別化に寄与しました。','2025-08-02 07:20:51','2025-08-02 22:24:13'),(15,'業務系Webエンジニア（社内SE）','建設業','2024年4月〜現在','建設会社にて、社内システムの改修・保守・運用を担当。\nCSVファイルの取り込み・出力機能、メール送信条件の修正、所員情報や業務内容の登録システムなどの機能改善を行ったほか、日本語・英語対応の社内外向けWebサイトの修正にも従事。\n現場の声を反映した改善提案や、不具合対応、定常業務も担い、業務効率化に貢献。\n\n・使用技術：PHP、JavaScript、Oracle DB、Object Browser　等。\n・規模：IT担当チーム　8名。','2025-08-02 22:42:33','2025-08-02 23:25:55'),(16,'個人開発（ポートフォリオサイト）','個人プロジェクト','2025年4月〜2025年7月','React（フロントエンド）とLaravel（バックエンド）を用いて、自身の職務経歴・スキルを可視化・管理できるポートフォリオサイトを制作。\n要件定義、UIデザイン、バックエンド設計、API開発、データベース設計、テスト作業（Postman）まで一貫して担当。GitやGitHubを利用した開発環境構築、VPS（個人契約）へのデプロイも実施。','2025-08-03 00:34:52','2025-08-03 00:34:52');
/*!40000 ALTER TABLE `experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT IGNORE INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_06_07_163813_create_posts_table',1),(5,'2025_06_08_030312_create_skills_table',1),(6,'2025_06_08_054047_create_profiles_table',1),(7,'2025_06_08_054056_create_projects_table',1),(8,'2025_06_08_054111_create_project_skill_table',1),(9,'2025_06_08_054119_create_contacts_table',1),(10,'2025_06_22_090441_create_experiences_table',2),(11,'2025_06_28_005547_create_personal_access_tokens_table',3),(12,'2025_06_28_112353_create_experience_project_table',4),(13,'2025_07_06_022519_add_category_to_skills_table',5),(14,'2025_07_26_061440_change_image_url_to_image_urls_in_projects_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT IGNORE INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'api-token-name','a09a7aaba7a1c9d6cbb0e68b8854dcb36e20aebe151247fe5edf89e45db4898c','[\"*\"]','2025-07-13 22:52:07',NULL,'2025-06-27 21:15:19','2025-07-13 22:52:07'),(2,'App\\Models\\User',1,'admin-token','a2a9d35e11ded7113b1968d8da7a3a6baf9bfe9947baa7ec0e7387c4e9f25c8c','[\"*\"]',NULL,NULL,'2025-07-08 15:56:41','2025-07-08 15:56:41'),(3,'App\\Models\\User',1,'admin-token','2084db2896f26423f8587720e893828b44943d808d60225783cde4f8be5eda78','[\"*\"]',NULL,NULL,'2025-07-08 15:57:15','2025-07-08 15:57:15'),(4,'App\\Models\\User',1,'admin-token','1e7a700d165f624e31dfb79f3b732c6afc65a65733795668b53f7abb371b793d','[\"*\"]',NULL,NULL,'2025-07-08 16:05:59','2025-07-08 16:05:59'),(5,'App\\Models\\User',1,'admin-token','f67bf627ea0b166991c2ceab7cf81d70564026a4d1d490db5230e541f733150b','[\"*\"]',NULL,NULL,'2025-07-08 16:06:15','2025-07-08 16:06:15'),(22,'App\\Models\\User',1,'admin-token','019a351012ac63d6aeec10a8d6b2c06dde48da569f8038f2f521d392df0f34c2','[\"*\"]','2025-07-13 15:55:07',NULL,'2025-07-12 22:24:23','2025-07-13 15:55:07'),(27,'App\\Models\\User',1,'admin-token','8215ffbb0924039abbe2d3a82cbe2645d6bf0b0f4b021267f43e65a3990289c8','[\"*\"]',NULL,NULL,'2025-07-13 23:18:18','2025-07-13 23:18:18'),(28,'App\\Models\\User',1,'admin-token','6f9bb2f8ae05f594fe3fbbb3630891fe5c76e7eb9c581e79ff05e8b3a6f8472e','[\"*\"]','2025-07-14 01:24:25',NULL,'2025-07-13 23:34:30','2025-07-14 01:24:25'),(29,'App\\Models\\User',1,'admin-token','aed497171ddb969e3d628992c556cd77006240a6cdcb3107334ea3e93d2ae88f','[\"*\"]',NULL,NULL,'2025-07-17 03:48:27','2025-07-17 03:48:27'),(39,'App\\Models\\User',1,'admin-token','bc90fa8b6d53e257c5b0528015617c15ceec038df29839f39592883cd3cff476','[\"*\"]','2025-08-04 01:37:29',NULL,'2025-07-26 00:26:33','2025-08-04 01:37:29');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT IGNORE INTO `profiles` VALUES (1,1,'I am a full-stack developer with a passion for learning.','Tokyo, Japn','https://example.com',NULL,NULL,'2025-06-07 23:14:36','2025-06-07 23:14:36');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `project_skill`
--

LOCK TABLES `project_skill` WRITE;
/*!40000 ALTER TABLE `project_skill` DISABLE KEYS */;
INSERT IGNORE INTO `project_skill` VALUES (116,19,1,'2025-08-01 04:12:49','2025-08-01 04:12:49'),(117,19,2,'2025-08-01 04:12:49','2025-08-01 04:12:49'),(118,20,1,'2025-08-02 01:58:09','2025-08-02 01:58:09'),(119,20,2,'2025-08-02 01:58:09','2025-08-02 01:58:09'),(120,20,4,'2025-08-02 01:58:09','2025-08-02 01:58:09'),(121,20,16,'2025-08-02 01:58:09','2025-08-02 01:58:09'),(122,21,1,'2025-08-02 04:40:04','2025-08-02 04:40:04'),(123,21,2,'2025-08-02 04:40:04','2025-08-02 04:40:04'),(124,21,4,'2025-08-02 04:40:04','2025-08-02 04:40:04'),(125,21,16,'2025-08-02 04:40:04','2025-08-02 04:40:04'),(126,22,1,'2025-08-02 05:11:37','2025-08-02 05:11:37'),(127,22,2,'2025-08-02 05:11:37','2025-08-02 05:11:37'),(128,22,30,'2025-08-02 06:03:07','2025-08-02 06:03:07'),(129,22,32,'2025-08-02 06:03:07','2025-08-02 06:03:07'),(130,20,30,'2025-08-02 06:18:00','2025-08-02 06:18:00'),(131,20,32,'2025-08-02 06:18:00','2025-08-02 06:18:00'),(132,19,30,'2025-08-02 06:18:16','2025-08-02 06:18:16'),(133,19,32,'2025-08-02 06:18:16','2025-08-02 06:18:16'),(134,19,28,'2025-08-02 06:18:16','2025-08-02 06:18:16'),(135,20,28,'2025-08-02 06:18:23','2025-08-02 06:18:23'),(136,21,28,'2025-08-02 06:18:29','2025-08-02 06:18:29'),(137,23,1,'2025-08-02 08:20:25','2025-08-02 08:20:25'),(138,23,2,'2025-08-02 08:20:25','2025-08-02 08:20:25'),(139,23,4,'2025-08-02 08:20:25','2025-08-02 08:20:25'),(140,23,16,'2025-08-02 08:20:25','2025-08-02 08:20:25'),(141,23,30,'2025-08-02 08:20:25','2025-08-02 08:20:25'),(142,23,32,'2025-08-02 08:20:25','2025-08-02 08:20:25'),(143,24,3,'2025-08-02 23:31:52','2025-08-02 23:31:52'),(144,24,1,'2025-08-02 23:31:52','2025-08-02 23:31:52'),(145,24,2,'2025-08-02 23:31:52','2025-08-02 23:31:52'),(146,24,4,'2025-08-02 23:31:52','2025-08-02 23:31:52'),(147,24,34,'2025-08-02 23:38:52','2025-08-02 23:38:52'),(148,24,36,'2025-08-02 23:38:52','2025-08-02 23:38:52'),(149,24,33,'2025-08-02 23:42:13','2025-08-02 23:42:13'),(150,21,35,'2025-08-02 23:42:36','2025-08-02 23:42:36'),(151,20,35,'2025-08-02 23:42:55','2025-08-02 23:42:55'),(152,23,35,'2025-08-02 23:43:10','2025-08-02 23:43:10'),(153,25,10,'2025-08-03 00:44:48','2025-08-03 00:44:48'),(154,25,29,'2025-08-03 00:44:48','2025-08-03 00:44:48'),(155,25,3,'2025-08-03 00:44:48','2025-08-03 00:44:48'),(156,25,4,'2025-08-03 00:44:48','2025-08-03 00:44:48'),(157,25,5,'2025-08-03 00:44:48','2025-08-03 00:44:48'),(158,25,16,'2025-08-03 00:44:48','2025-08-03 00:44:48'),(159,25,30,'2025-08-03 00:44:48','2025-08-03 00:44:48'),(160,25,32,'2025-08-03 00:44:48','2025-08-03 00:44:48');
/*!40000 ALTER TABLE `project_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT IGNORE INTO `projects` VALUES (19,1,'コーヒー豆オンラインショップ','HTMLとCSSのみでWebサイトの見た目を再現。 \n架空のカフェサイトを題材に、ヘッダー、バナー、商品一覧、予約フォーム、フッターといった主要セクションを実装。',NULL,'https://github.com/yuya-inada/coffee_bean/blob/main/coffee-bean/index.html',NULL,'2025-08-01 04:12:49','2025-08-02 07:28:32','[\"http://localhost:8000/images/coffee_1.jpeg\", \"http://localhost:8000/images/coffee_2.jpeg\", \"http://localhost:8000/images/coffee_3.jpeg\", \"http://localhost:8000/images/coffee_4.jpeg\"]'),(20,1,'Minimart Catalog','プログラミングスクールで開発した商品管理アプリです。\nユーザー登録後、自身の商品やカテゴリー（セクション）を登録・編集・削除できます。\nPHPとMySQL（phpMyAdmin）を用いて構築しており、商品とカテゴリーはリレーションを持たせています。\n基本的なCRUD機能の実装を通じて、Webアプリケーション開発の基礎を学びました。\n\n・Tech: PHP / MySQL / HTML / CSS。\n•	Features: User registration, product & category management, relational DB, CRUD operations',NULL,'https://github.com/yuya-inada/minimart_catalog',NULL,'2025-08-02 01:58:09','2025-08-02 02:29:14','[\"http://localhost:8000/images/minima_1.jpeg\", \"http://localhost:8000/images/minima_2.jpeg\", \"http://localhost:8000/images/minima_3.jpeg\", \"http://localhost:8000/images/minima_4.jpeg\"]'),(21,1,'ブログ投稿システム（オリジナルCMS）','PHPとMySQLを使って開発したシンプルなブログ管理システムです。\nユーザー登録・ログイン機能を備え、カテゴリ別に記事を投稿・管理することができます。\nまた、プロフィール画面の作成やログインなど、実際のWebサービスに近い仕組みを意識して実装しました。',NULL,NULL,NULL,'2025-08-02 04:40:04','2025-08-02 04:40:04','[\"http://localhost:8000/images/blog_1.jpeg\", \"http://localhost:8000/images/blog_2.jpeg\"]'),(22,1,'ボトルメニューサイト','お店で使うメニュー表として、ボトル商材を紹介するWebサイトを制作しました。\n他メンバーとPowerPointでレイアウトを設計し、商材一覧・カテゴリ別ページ・ナビゲーション機能などを実装。\n写真撮影・編集やQRコード化までを担当し、実際の現場で使用されました。\nまた、iPhone・Android・PCなど複数デバイスで約15時間かけて表示やデザインの確認を行いました。\n現在は運用停止中ですが、商材追加や情報更新なども行っていました。','https://adamsing.website/index.html','https://github.com/yuya-inada/new_qrmenu',NULL,'2025-08-02 05:11:37','2025-08-02 08:28:36','[\"http://localhost:8000/images/bottle_1.jpeg\", \"http://localhost:8000/images/bottle_2.jpeg\", \"http://localhost:8000/images/bottle_3.jpeg\"]'),(23,1,'飲食店向け棚卸し管理システム','飲食店における棚卸し作業の効率化とミス削減を目的に、シンプルな棚卸し管理システムを開発しました。\nアカウント管理、商品登録・編集・削除、カテゴリー別・企業別・追加日別での一覧表示、数量カウント機能など、実際の運用に合わせて機能を設計。\n現場スタッフへのヒアリングやUI試作（PowerPoint）を経て、操作性と実用性を重視して作成しました。\nまた、セキュリティを考慮したログイン認証、JavaScriptを使った戻る機能、ナビゲーションの一元化、管理マニュアルの作成、テスト作業まで一貫して担当しました。',NULL,'https://github.com/yuya-inada/bk-inventory',NULL,'2025-08-02 08:20:25','2025-08-03 00:58:06','[\"http://localhost:8000/images/invent_1.jpeg\", \"http://localhost:8000/images/invent_2.jpeg\", \"http://localhost:8000/images/invent_3.jpeg\", \"http://localhost:8000/images/invent_4.jpeg\", \"http://localhost:8000/images/invent_5.jpeg\", \"http://localhost:8000/images/invent_6.jpeg\", \"http://localhost:8000/images/invent_7.jpeg\", \"http://localhost:8000/images/invent_8.jpeg\", \"http://localhost:8000/images/invent_9.jpeg\"]'),(24,1,'建設会社 社内システム保守・改修プロジェクト','建設会社の社内IT担当チームの一員として、複数の社内業務システムやWebサイトの改修・運用を担当しました。以下のような機能改善・保守対応を継続的に実施。\n・CSVデータ取込・出力機能：業務データ等の一括処理機能を実装・改修。\n・メール通知設定機能の修正：申請・承認などのタイミングで自動送信されるメールの条件式や本文等の変更などを修正。\n・所員、業務登録管理システム：CRUD操作に対応した業務管理ツール。検索性やUI改善も随時実施。\n・日英対応Webサイトの保守・更新：会社案内や採用情報などを含む、社内外向けWebページの文言修正・デザイン調整を担当。',NULL,NULL,NULL,'2025-08-02 23:31:52','2025-08-02 23:33:55','[\"http://localhost:8000/images/kajima_1.jpeg\"]'),(25,1,'Portfolio Site','制作物の成果と人物像を紹介する目的で開発したポートフォリオサイトです。\nReact（フロントエンド）と Laravel（バックエンド）を用いて、自身の経歴・プロジェクトを登録・管理できるシステムを構築しました。管理者認証機能付きで、スキル・プロジェクト・経歴情報の CRUD 操作が可能です。UI はダークモードを採用し、スマートで落ち着いたデザインに仕上げました。\nConoHa VPS を個人契約して本番環境にデプロイ済み。API テストには Postman を活用し、README に詳細なセットアップ・動作確認手順を記載しています。\n開発力や設計力を示すためのアピール材料として、今後の自己ブランディングに活用しています。\n\n※遊び心として、愛犬「ベルちゃん🐶」の紹介セクションも設けています。','https://www.owlione.com/','https://github.com/yuya-inada/portfolio-site',NULL,'2025-08-03 00:44:48','2025-08-03 00:58:53','[\"http://localhost:8000/images/port_1.jpeg\", \"http://localhost:8000/images/port_2.jpeg\", \"http://localhost:8000/images/port_3.jpeg\", \"http://localhost:8000/images/port_4.jpeg\", \"http://localhost:8000/images/port_5.jpeg\", \"http://localhost:8000/images/port_6.jpeg\", \"http://localhost:8000/images/port_7.jpeg\", \"http://localhost:8000/images/port_8.jpeg\"]');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT IGNORE INTO `sessions` VALUES ('1MMeJkt3TltFpE0XUk85bA6EdxnRFqBXSUqgMe3P',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJblZaVVZOelZHaFpWMmxpZUN0dVlrcDFRaXRJZVdjOVBTSXNJblpoYkhWbElqb2lLMFkxYm5OTlFqaFdkRGgxTUZSdGRXSllWMWRPYVZaM1Z5OVVZWFpRV21vcmMwdFVVRkJJTjJ3MmJrSlJUMDVKZVdaUGFHNHZSRmwxUjNoSlFWTkNRa1JYV21aR1FrNWpNM3BzZVcxcE16aGlWV1pIVVhJeWFqbExjR1F3TmtWVWVpOHhabFV4UTA1aldHOXJVMWw2VW1WMmQxcDFZMWxUUTB4NmRFVkZVak5OT0hsd1l6VlJaMjVRU2pJemFqZzRhMVI1Y0ZwSVN6SXdVSGMwZVZZNGJtRkRabWRGTUd0MmFuVTRkakZHWkRBNWFFTjZVRTVIZDNNMWVrbzVOSFJJYlZZMWQybERXblJIV0hjclVrWm1OMDR2TTAxT1dtTm1WRVV4ZUN0dk9FbDFWRUZoWldFeE9HWmxSbmR0Ym5SeU1UQXJjUzlUV1ZCbVVGQmpMMncwTlNJc0ltMWhZeUk2SW1ZMFlqZ3dNR0V4TXpJMk1EVXpaVEk1TVRjMVpHTTJObU0wTkRBeU4yVTFOalkwTnpNeE9HRTVaalk1TmpNMU4yUmhZemt4WmpjM056QmpZamhoWVdFaUxDSjBZV2NpT2lJaWZRPT0=',1754400111),('ACPDPvLgyWciaK6wSpnT9D3X3ii0cx53zgDVVoWx',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJa1phTjJ4ek9YbDNWa0V2Wm1wYVJqUklSVlpwT0djOVBTSXNJblpoYkhWbElqb2llRGxyTkcxeFdteGpUMDVKUWxwTFRWcEpVM1pIYjJsU1FXTllVVEI2V0dWdlVGWk1OSE5LTHpsVVVYTm1WazE2VjNSdmEyMWxlazFyYlVGU2VUZ3hRMVJpT1ZsNGRFWXJNbFZ5ZDFGV1kyRm9hak53WlVjclVUZHZWV013VlN0aU4wZDFkVmxIWW5sWlpuWk9NVlpsVFRWcGJ6QjVXVm8yZVdsblRUQTFla1V3ZW5GblEzUmFWSFZITlc0MU55dFRja3RVYVd3eUsyc3haalZJVkhkdmQzVk1ZMkpoY0dwdVFWY3dRMWR2V20xU015c3lWVlY1VWtRdmRYbzVZbXgyV1M5b1ZqRTFka1l2YXpkek4xZHNRMHhTZWxScFQxVlpWVTlNUkd4b1MyOXpkMFEzWmtSUmMweGFNWHBuTTNsd1VWVXljV1p2VlZsWFVuWTVTa3BTWVNJc0ltMWhZeUk2SW1RME1qazJaV0k1WldOalpUQmhaR0l5TlRCa1l6VXhNakE0TkdWbE5EUmtaakUwTXpFeE5EZGhPRFl6TUdOaE16VTBaRGszWWpoa1pUVXhNV013Wm1NaUxDSjBZV2NpT2lJaWZRPT0=',1754659611),('aipyOJJKHMBXRz0jpAeXS84dh0nsk07IICNm3s0l',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJbVZFV2tSa05WVnNOQ3RCY1d0M0wxRmlRMGhHTTJjOVBTSXNJblpoYkhWbElqb2liMjl0UTJkVVRYaFNTRVpWT0RjMWFXOTFiVTlpTTAxT00yOTViRkpYYldwTVMxRm1MMlZyVkd4R1FtSjZXRXRVZEhCaGMxWnRUVkJzVDFKbVl5OUhjM1pYZURoTGFGZDVSVkl4T0ZWUFkzVmtRazVZUmxkVVNFMHpWbkEzYlZJMFZuQlJNVEJwVW5aR05sUXJWV1ZzTVVkcVMwNUlkWGhNZWpoclJXTXphMGw2ZW10emVqQktaSE4wVjBadU9YWXlObTVTUm1rMlFrUk1iRThyVHpCdVRYZFBha3cxYTA1clRFOHpjalpGVlZkVVJYY3dUVTltYkZKTVlVVmpkMkZZTjA5Rk5rdDFZWGxZWlRZek0ybDZaR0ZsVDJocVZGVk5aa2hFYW5sek1WQXJSVTFHZEVnck9VUnVXbHBDTkdweE5XVXdXSEJwWTB0WWJsZ3JZekYyUlNJc0ltMWhZeUk2SW1Rd1lXVXhNemszTURJeE1qVTRNemsyT1ROak1ERTBaakUxWkRobFptVTFaREUxTURjMU0yVTFZamRqTVdKak16azNPR0ZtTVdVNFpqQmpaRE5pT1dVaUxDSjBZV2NpT2lJaWZRPT0=',1754221731),('das5rFSEFzEROM4J5QSQ0MzgsbLd7lJ80StDGhny',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJbkl6VkZSbWFuSjJSV3B2TmpkeFUzVmphMXBWVFVFOVBTSXNJblpoYkhWbElqb2laMmhaY1hWalRDOUhUVWhXVDBSNE5HSm9VbEpFYVZkd2FuVm5NWEU1VkhKblJqRlpOVTlaWlZab04xTTBZMnM1ZFhJNU9VRmFZbVJLVW1ack1HMUJOekU0Y0ZZeWMwczNRelY1WmxGQ1VuTnFaelZFSzBsdU56bDVOV1pDT1RabVpuSkxTbUp2VVc5cGIwRkZjV2xVYkROd2QwNURSR0l3Vml0WE1rTm1ZV2hIYXpCMGQydFFUVFJvUTNKbGFVdzVSVzlDUWt0T2FsazRiRGs1YTJsemFuaFlaVWRoWjJvMWNVRjRZMVJyWWpNclpVRlZablJXYnlzMVJVbHdNbk01ZFdkd04yZFliSFJ3ZWtWR2JXeG5TMWx3VlhCUVVIbENObWhrTkRrd2QxUlRTRmMzZHpSMGJXdG9LMEpVYXpsaFQwWmtkRmRNUTJwV0sxWkJTV2QzT0NJc0ltMWhZeUk2SW1FNFpqUXdNMlZoTXpnNVlUVTROelEwTnpabE56TTRNVFU0Tm1Ga09HUTVaRGd5TmpneVpHRmpPV1l3TlRabE16WXlNRFJrTVRrMk9UVTNPREEwTnpZaUxDSjBZV2NpT2lJaWZRPT0=',1754734306),('g5zMnsCCMAeXHAqOr25xerIL76pL0O2rAaobDqLh',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJblZ1VUV0aWFVaE1aekoyV0ZZM1VFaENNREJHZWxFOVBTSXNJblpoYkhWbElqb2lXRlpHTlVSeVpVWkxVRGxFVVc1UVduWlJWelV2UldoMFZIaHlOVFpaWm13emVITXZjblIzYm5KUFlqbFJVSE0zVGtadlUwbDRNRkZSU2k4NFMzRlBZMnRxYVRkblVEY3piV1ZXY0dweEsybEJVWGhpWVhKWVVYZG9ZV0puYUZwUFFtWTJOVXA0YldwdVNqVldaM2RQV1VKTmJuQkpXVmhLTkZvMVpETXhURkZJYzBwRmVYa3lOMEp5U1dsWE1XZHBiekZOUldsRlRqRlZVa2RXTm1wb1ltMVBOemxWWjBWcFJsaEpaRlZ1UkZoaFNrRmxlakk1YjJwM1VXODNjRlJVVUVZeFV6bFFlSGxzZDJsSk1HOTBRamx6WkcwM2NrOXlUMHRITkN0NVJWSkVjMkpHUzJKeWFUQlpaMWt4VW5VNGQyODFkRTV4ZFN0TWVXNW1MemhPY1NJc0ltMWhZeUk2SW1Jd01UbGxNek14WVRNeFpHUm1OakV6TkRjMllUQXlaak5qWmpFM00yWTRObVEyTlRrek9XSXhPR05tTkRReVkyVXlOamhrTTJOak56azNZVGhqTkRZaUxDSjBZV2NpT2lJaWZRPT0=',1754225735),('g9oID69hOQIHOfbTG9BSh9WYhb9UBtWb17JJxX1o',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJbFJVY1V0NVlrNDFZVmd2YVhJME5VaGFNMDQwWmtFOVBTSXNJblpoYkhWbElqb2lNMnQ0Ym5kM1R6RkZiRTlYTXpGVmRXZzJXVmhDYVRGUmRIVlJja3RqYzFoNVRtNTFlVzFVT0dGWVJURTNRWGN4YVd4NlVqTjRSRWhDV2tKb1oyTlVMMmhKVWtKM1ZHeGxTbkY2YWtKNVdrMVVNa2huYm1kbU1IcEJjRXRwWjJsR1JGbEhXRGhEVGtWQmFqVkRMelVyWmxSWGFsZHVNRWwzVEVOV2VsWjRWamhTVVVKcFUxWm1MMWh1VFZKNGJYRmtVWFp6UkdWQ2VuTm1lbEJGZWpoWFdrOHJRMmgzTlVVMWEwdDNOU3RtTkdoUlF5OVBiRTVKVldaVmVVUjVUVmxQYjJ0bVJYb3lhMnAxVDJ0WlVHODVlR1F2Y21oVlNHUkROV2RFVWxweFNXZERaSFZhTW1GemNWTldabFkxUmxkRFFuZEtVVTR2VUhWTFZIbE1hSGRzUXlJc0ltMWhZeUk2SWpRNVpUSmlOelEzTURVek1qVTFaakl3WW1RMk1EY3hNbU5qTlRCaVlUSmlOalZqT0RJd01qaGtaVEl5TVRJMFlXTmpOV1V3WkRGaFlUSTBZVFl6WmpNaUxDSjBZV2NpT2lJaWZRPT0=',1754312917),('kkrY4QsuKOb2vy2Ttbfn7529CpTHVgZecGUCUbFm',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJa2hrVW1zdlRYQnBVMDVCY20xMU9Ib3ZURTVtVkhjOVBTSXNJblpoYkhWbElqb2lPV3B2YWpobUszaEZWbUkxTmxOaUwzRk1ObnBRUjJweU1UQTFXbmxETjNVcmQyeEpjbXhyY0doaVRESTROVTVCTkVoMFFqWlZVV3BJTjFaMGNIaG5iVEp4WlZBdmVTczJTMjFLYUZsaGFsVXJkbVYxWlRaUWJUWm1OR1U0Y2xSTFdGVkZibTF4U0VSUGQwSXZhbmR2ZVRkME9GaG9VRmxGYlZneGEzaDZObmRTTVZNdlZrMW5iamd4YUdaNFpHdEtNMUp2VjNaUVNqRmthRUZFTkVOSGQxbHpVVkJzTm5OT2NsUktTUzlqTDFrdlVVdzRLM1p2VlZCNFRuTkplVTFpYlZWaVJHbDZWbEpRUjFKUVNsRnBia3RQWWxWVGFsaGxSV1JyVDJ3cllrSTRaR295Wm1kdmQyMVVURkZSVVhCak9FdEdPV1pMWmtWS2EyWjJNVTVCYlNJc0ltMWhZeUk2SW1WaFlUUXhZV0pqTWpjNU9XRTFZVE16TURZelptSXlNRGRqWXpVM05HVXpPRGt6T1RRMU5UZGpPRE0zWlRVeU1HWXdZelk1T0dKallqQTVOakk0WW1FaUxDSjBZV2NpT2lJaWZRPT0=',1754481195),('mJrRvbkJlaNE4p2qeDJXHORpPAZOEm1Hyxr1qL77',NULL,'127.0.0.1','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','ZXlKcGRpSTZJbkJVYTBaRFlrbzNiaXROYldveVVtaGFUekF5ZEZFOVBTSXNJblpoYkhWbElqb2ljMDlYWlVKemVtcG9jVE5HWlZOU1NGUjNSU3QzTUVORWFYQk5ZVEI0YjBJMFJWRkNhMUJoUW14aGFWZHlRV0pNWVcxTWNqVktXa3hsTVcxTFJVdHBhelJKZUVWWlVtcERhazRyV0cxalRIRkJNVlozV1RKRVN6bGhXRzlETVd0VFRIWjNhMEozTmpWaVZWbGtWR05YTjBzME5uZHRNM1JpWVhwemNVSjJaRlZNV25NM1ozZGlNVFZ5V1RSWU4zVnhPRlF4YWxOTmEwRkpXRXc1ZVRKblZ6WnVTREZvTTBvelFWcEJRWEpaYldOTWF5dDBkRE5XUjNKdmVHWm1XWEU0ZFZkeFNFTkNWRmhOUVRST2JrMVpiWE5KZW1SdU5IcEJRV295UkU4eGExWkpWVko2V1hSd0wyZzFOV3QzYlUxU2F6TmtiRUkwU0dORFFpc3hjV2xTUnlJc0ltMWhZeUk2SW1FNE1EVXlaRGxpTURZNFlXVTJZalkxWXpOaU9HSmxOV0ZpWmpBek9UWTBNR1U0TXpBeFpXSmhPRFk0TURObU1qVTVZVEZtTkdWaU9HRXdNRGRsWWpVaUxDSjBZV2NpT2lJaWZRPT0=',1754727162),('qAwFiae37Tum06y7p4030e5No5R4JaZISctctb7C',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJa0l4WjFGWUwwaEtlbUprVFVzeVpWbGFiR0pJZEhjOVBTSXNJblpoYkhWbElqb2lWV0V3VEZGbEwxcHRNVVJ3VUM5RGNHSkNjWFJPZURaM2NXZHFXRVkxVkc0MmJFOWtNMEZpVUdOV1dGaElTVE00VUVVclVrcDViVGcwVlZSeWFHWlpkMFpyVEM5aWNWcEpWRzR5VG5aQmNGSlRkVWN3WXpKeVkxY3JVMmRJZVcxalVFeEVlakYwZG1SRmMxZHlZMWQ2YTBSd1ZpdFZMMWhITkdOT1ZVTkdVVzgwWm1oeFNESTNSVWR4ZEdvd05USm1LM3BvYlUxeVJXbHFMMVJyZG1GcmRVdGFhMVZDTnpORWEwb3ZjbmxPUm5WTFRVOHZWalJuZFdJd1ZHZElOMUJXVDFwb1ptTnBaVGg0VjFaTE1FUkJNMlZMWmpBMk5WSldNRFZKYUU5a1RrbFVUVTFsYUdSeVRHbHpLMGwxVUdWSFdsTm5kMlp2YzAxVVpFZFJieXN4WXlJc0ltMWhZeUk2SWpjeE5XRmpaVEEzTlRWa1pUZ3hOelprWkRrMU5qWXpPR0V3TURjMU56TmtNVFk1TURjME56SXlPRGsxTldZMFkyVTBNREkzTVROaVlXSmhPV0poTm1NaUxDSjBZV2NpT2lJaWZRPT0=',1754567503),('RIPIhBhVqgCuqrg3rQNy58dxXDvPwMl9AmlabW9x',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJalpaYUVKaE1sZHNORFIxTm1NNE5XTlFSazk2TmtFOVBTSXNJblpoYkhWbElqb2lSVE5ZY0VvMWJFVXhWbkJGY2xGUFUxZGlNSG92YkhjMU1pOXdkamcyY0Rsb1RWQTJaamN3Ukc1NGJGTTJUbmR1WXpoV2NVOUJXVzUwZFRCS1RGaDFZWFJTZUVSTFEwNUVNVU5pYzFkS01XTlBPWGgwUWtsREsxTXJUMFJvYW1oSGNtaE5OREJMUjJvNFQxUmFSM2xIVmk5M1FXcDNVRUowVDBSUlozTlFjSEpuV25STmVHdHVNaXRJVDAwMU5tUktaVUUzWVdwSWVGaEJabUZ4WjBOVU1tNXhRVXA2VGpORWNVSlBRVXR3YzBGc1YwVXZielF6UlVWQ1UzcFZOa04xYjNoeU9YVkVWVFZHTjBGVVluaGlRbXQyV0hoRVVITXlVR3RMZWtkM05XNTBhVGcxVUROclRERklZVWMxV0ROU01FSnhOa2hwVEVSR0swVkNWRlZCZUNJc0ltMWhZeUk2SWpCaFltUTFOemczTldSbFl6azVaVEZqWWpVMVlXTm1OREl6T1dOaFlqQm1NMkU1WmpFek9EVTJabUUzTnpBMllqTXhZVGt6WXpjNU9USTBZbU0xTkdRaUxDSjBZV2NpT2lJaWZRPT0=',1754710178),('RJii6fgtIHfye75j9IFQyGBgC0jTSSkmKqfqfGaG',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJa3AwYm1kUk5VdFllSE5pSzJwV2JrMDNNRTFKTVZFOVBTSXNJblpoYkhWbElqb2ljMk56ZUdSd1JERlVjamhZY2tscVltWTVTRkJLZGpWUk5WQnVkVUprVTJaT1N6RmtaRXhqTlVkQ1VXeHphamRSTkZKV0wyVk1jSEo2UjNoaWNHNHdhV05vVDJ4MFkyMXhTVnBsU20xSVZHVlRRbmRDUVZNM2N6SkhRbEY2ZWxkalMzaG9VVnAwTkRZeE9URnlSRlZsUVZWaVVsbGtVbWxPY2l0WGJUSm1RV3hoVDNKWmVqaHVSRFIzY21aS2MzZ3pOWFZ6UVZwNUwwUTVObkYzVld0SlQyWllXbXBHZFhaTE5sSmpaMEpzYldKVFIyaDFRazFwYjJONWFsbDNjaTlUUkRjeFJYQm5MekJVUzBVMGVWWlJjM2xNUm05UVdERkdkVzU1ZEZOT2FrZE5VV2g0THpVMlVXdHhjWFJvY1RaclJ6UjNXVnBDUm5VeFkycEVVbEZDVHlJc0ltMWhZeUk2SW1Vd016UmlORFpoTnpWak1HWmlNekJsT0RZM1ltVm1aVGhsTldObFlUSTRaVFkyTm1Jek5tVmlZMlpsTnpoak1tRTVNV0kxWWpsbE1tSXhNekJtTldJaUxDSjBZV2NpT2lJaWZRPT0=',1754653387),('s5UNlKi5kugRa9GjQ3gFXmCSITpS6mkwHdoZzAWJ',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','ZXlKcGRpSTZJbHBKVEZsb1IzWkxZazlMVWxsMlQzaDRUa2d5ZEZFOVBTSXNJblpoYkhWbElqb2ljMEZCZFhKUmRsbFhPRXQwYVhCTEsyVTFNMFJZTkVKQ1Z6QmFjVVpWUVVOR1NrbFNRekpKVERBM1VpOHJLMmRWYkc5S2NrRkdZVlpNVjFGd05uZzVOVlJpVldrdk1GWkdNV0lyUzFkbFJFOXhObmd5ZEdRNGR6Rk1iRlJEYTJobWVYVllUVkJWVDFkS2IyWkNWV2w0V0RoMGJGSkRjMGMwUnpGamJtdE5jQzlwT1drNFNIQjRVRTlUU0VwTWNreElSMGxqY0dzeFYycERXbTk0TmtOaFNGSnRXRlJ1UjNReFJGVlVTVFUzTm05S1p6STNWVWhDU21jeVEyOVpMeTlGUld4MlVHdERRbnBpYlc4NWNYTnlTRlZUYUVneVdDOUpZM2d6TkVsaVJXMUpRMUpPYm1ONVVsVTVhVmhNYWtadU0zWXdTbTlFUnpkUFprWlNUeXQxZFNJc0ltMWhZeUk2SWpBd1lqTXpNRFV4WW1RME16UXlNelEyTnpRME56RmlOVGN4WVRReFpqVmxNMlV6TXpVNFptVTFNelZpTVdNMVpqazJPV0poTkdJeVpURTVaR1F3TlRnaUxDSjBZV2NpT2lJaWZRPT0=',1754487593);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT IGNORE INTO `skills` VALUES (1,'HTML','Frontend','fab fa-html5','Markup language for web pages.','2025-06-07 23:14:36','2025-07-05 17:27:39'),(2,'CSS','Frontend','fab fa-css3-alt','Style sheet language for designing web pages.','2025-06-07 23:14:36','2025-07-05 17:27:39'),(3,'JavaScript','Frontend','fab fa-js','Programming language for interactive web apps.','2025-06-07 23:14:36','2025-07-05 17:27:39'),(4,'PHP','Backend','fab fa-php','Server-side scripting language.','2025-06-07 23:14:36','2025-07-05 17:27:39'),(5,'Laravel','Backend','fab fa-laravel','PHP web framework for modern applications.','2025-06-07 23:14:36','2025-07-05 17:28:11'),(6,'Vue.js','Frontend','fab fa-js',NULL,'2025-06-27 16:57:31','2025-07-05 17:27:39'),(7,'TypeScript','Frontend','devicon-typescript-plain',NULL,'2025-07-05 17:19:48','2025-07-05 17:32:14'),(8,'Next.js','Frontend','devicon-nextjs-original',NULL,'2025-07-05 17:35:10','2025-07-05 17:42:11'),(9,'Sass','Frontend','devicon-sass-original','CSS preprocessor with variables, mixins, and nesting.','2025-07-05 17:43:05','2025-07-05 17:43:05'),(10,'Tailwind CSS','Frontend','devicon-tailwindcss-plain','Utility-first CSS framework for styling.','2025-07-05 17:43:23','2025-07-05 17:43:23'),(11,'Node.js','Backend','devicon-nodejs-plain','JavaScript runtime built on Chrome\'s V8 engine for backend development.','2025-07-05 17:45:28','2025-07-05 17:45:28'),(12,'Express','Backend','devicon-express-original','Minimalist web framework for Node.js.','2025-07-05 17:45:37','2025-07-05 17:45:37'),(13,'Python','Backend','devicon-python-plain','High-level programming language known for readability and versatility.','2025-07-05 17:45:45','2025-07-05 17:45:45'),(14,'FastAPI','Backend','devicon-fastapi-plain','Modern Python web framework for building APIs quickly and efficiently.','2025-07-05 17:45:56','2025-07-05 17:45:56'),(15,'Spring Boot','Backend','devicon-spring-plain','Java-based framework for creating standalone, production-grade Spring applications.','2025-07-05 17:46:04','2025-07-05 17:46:04'),(16,'MySQL','Database','devicon-mysql-plain','Popular open-source relational database.','2025-07-05 17:46:13','2025-07-05 17:46:13'),(17,'PostgreSQL','Database','devicon-postgresql-plain','Advanced open-source relational database with rich features.','2025-07-05 17:46:20','2025-07-05 17:46:20'),(18,'MongoDB','Database','devicon-mongodb-plain','NoSQL database for scalable and flexible data storage.','2025-07-05 17:46:30','2025-07-05 17:46:30'),(19,'Jest','Other','devicon-jest-plain','JavaScript testing framework maintained by Meta.','2025-07-05 17:46:40','2025-07-05 17:46:40'),(20,'Docker','Other','devicon-docker-plain','Platform for developing, shipping, and running applications in containers.','2025-07-05 17:46:48','2025-07-05 17:46:48'),(21,'GitHub Actions','DevOps','fab fa-github','CI/CD automation with GitHub Actions.','2025-07-05 17:50:28','2025-07-05 17:50:28'),(22,'CI/CD','DevOps','fas fa-sync-alt','Continuous Integration and Continuous Deployment.','2025-07-05 17:50:43','2025-07-05 17:50:43'),(23,'AWS','Infrastructure','fab fa-aws','Amazon Web Services cloud platform.','2025-07-05 17:50:55','2025-07-05 17:50:55'),(24,'GCP','Infrastructure','fab fa-google','Google Cloud Platform services.','2025-07-05 17:51:07','2025-07-05 17:51:07'),(25,'Nginx','Infrastructure','fab fa-nginx','High performance web server and reverse proxy.','2025-07-05 17:51:26','2025-07-05 17:51:26'),(26,'Figma','Other','fab fa-figma','Collaborative interface design tool.','2025-07-05 17:51:40','2025-07-13 17:39:25'),(27,'Notion','Other','fas fa-sticky-note','All-in-one workspace for notes and project management.','2025-07-05 17:51:50','2025-07-13 17:39:25'),(28,'Slack','Other','fab fa-slack','Team communication and collaboration platform.','2025-07-05 17:52:25','2025-07-13 17:39:25'),(29,'React','Frontend','devicon-react-original','JavaScript library for building user interfaces.','2025-07-10 00:11:20','2025-07-10 00:11:20'),(30,'Git','Other','fa-brands fa-git-alt','バージョン管理システム。ソースコードの履歴管理に使用。','2025-08-02 05:37:48','2025-08-02 06:16:19'),(32,'GitHub','Other','fa-brands fa-github','Gitリポジトリのホスティングサービス。チーム開発や公開に利用。','2025-08-02 05:40:38','2025-08-02 06:16:23'),(33,'OracleDB','Database','fa-solid fa-database',NULL,'2025-08-02 23:38:24','2025-08-02 23:40:25'),(34,'Object browser','Other','fa-solid fa-cubes',NULL,'2025-08-02 23:38:24','2025-08-02 23:38:24'),(35,'phpMyAdmin','Other','fa-solid fa-database',NULL,'2025-08-02 23:38:24','2025-08-02 23:38:24'),(36,'Teams','Other','fa-brands fa-microsoft',NULL,'2025-08-02 23:38:26','2025-08-02 23:38:26');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` VALUES (1,'Test User','test@example.com',NULL,'$2y$12$BMGuBxCV5THoi74b3MIyxuJx6xsLCFxvxS2sHzRpaCdJJ1xv78Kj.',NULL,'2025-06-07 23:14:36','2025-07-25 17:08:19');
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

-- Dump completed on 2025-08-09 20:32:12
