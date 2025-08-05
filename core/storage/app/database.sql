-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 03, 2024 at 01:43 AM
-- Server version: 8.0.37
-- PHP Version: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xgenix_cc_xilancer_beta`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_email_verified` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '0: not verified, 1:verified',
  `email_verify_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'editor' COMMENT '1:super admin, 2:admin, 3:manager, 4:editor, 5:supporter 6:employee',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0:active, 1:inactive',
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `identity` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint NOT NULL,
  `admin_id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` bigint DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0=inactive, 1=active',
  `tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `category_id`, `admin_id`, `title`, `slug`, `content`, `image`, `views`, `status`, `tag_name`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'I will do figma website design or landing page UI UX design 1', 's-jksdnf-lksdf-sldkf-sdf-sd', '<p>Over the last several years, a number of factors—including the pandemic, shifting labor market dynamics, macroeconomic uncertainties, and technological advancements—have prompted a significant reevaluation of what “work” looks like among enterprise leaders. To help drive the growth and success of our enterprise business, and deliver work solutions to our largest clients, we were pleased to welcome Zoë Diamadi as Upwork’s General Manager (GM) of Enterprise.</p><p><br></p><p>\r\n</p><p>Zoë came to Upwork with over two decades of experience as a go-to-market leader, strategist, engineer, management consultant, and innovator at many companies across tech, talent, and B2B. Since joining in June of 2023, she has overseen and evolved Enterprise sales, product, engineering, and operations.\r\n</p><p>We spoke with Zoë about her critical role in helping enterprises navigate the changing global work environment and dynamic hiring climate, her reasons for joining Upwork, and how she plans to champion the delivery of a best-in-class Enterprise Suite offering to our largest customers.</p><p><br></p><p>\r\n</p><p>You have extensive background in technology and business. How has your journey prepared you for your role as GM of Enterprise at Upwork?\r\n</p><p>My journey has been an evolution through various domains, from engineering to management consulting, and what I like to call “intrapreneurship.” I spent six years as GM of LinkedIn Elevate, building the leading employee advocacy solution for enterprises, as well as time spent in executive positions for LinkedIn’s B2B organization, helping scale its three enterprise business lines.</p><p><br></p><p>\r\n</p><p>More recently, I served as an operating advisor at Bessemer Venture Partners. There, I guided portfolio companies on go-to-market topics spanning revenue growth, efficient scaling, and operational excellence for sales and post-sales functions.\r\n</p><p>These experiences have given me a holistic perspective on enterprises, their business strategies, and opportunities that drive growth. This journey has led me to my current role at Upwork.\r\n</p><p>I believe we are at a critical inflection point in the future of work, and frankly, \"work\" needs to catch up to the technologies that are now enabling it to happen. Upwork delivers an end-to-end offering that gives enterprise companies access to a wide breadth of highly skilled fractional to full-time professionals and workforce solutions, enabling them to achieve incredible business outcomes. I hope to help even more organizations discover, and scale with, the transformational value of Upwork.\r\n</p><p>What motivated you to join Upwork?</p><p><br></p><p>\r\n</p><p>Aside from what I feel is the perfect career fit, on a more personal level, I grew up in a small rural place in Greece. Every day, I saw firsthand how many talented and hardworking people were limited by their geography and couldn’t access the opportunities they wanted and were qualified for. These people in my memories represent an untapped pool of highly skilled talent who could have a huge impact on companies. Additionally, these companies and jobs represent a huge economic opportunity for these people to lift themselves, their families, and their communities up.\r\n</p><p>That’s why I’m so passionate about Upwork—and why I joined.</p>', '122', NULL, 1, 'sd asd ads,as as', '2023-12-10 19:20:24', '2023-12-11 20:53:37'),
(3, 1, 1, 'I will do figma website design or landing page UI UX design 234', 'as-dad-asd-asd-asd-asda-da', 'Over the last several years, a number of factors—including the pandemic, shifting labor market dynamics, macroeconomic uncertainties, and technological advancements—have prompted a significant reevaluation of what “work” looks like among enterprise leaders. To help drive the growth and success of our enterprise business, and deliver work solutions to our largest clients, we were pleased to welcome Zoë Diamadi as Upwork’s General Manager (GM) of Enterprise.\r\n<div>Zoë came to Upwork with over two decades of experience as a go-to-market leader, strategist, engineer, management consultant, and innovator at many companies across tech, talent, and B2B. Since joining in June of 2023, she has overseen and evolved Enterprise sales, product, engineering, and operations.\r\n</div><div>We spoke with Zoë about her critical role in helping enterprises navigate the changing global work environment and dynamic hiring climate, her reasons for joining Upwork, and how she plans to champion the delivery of a best-in-class Enterprise Suite offering to our largest customers.\r\n</div><div>You have extensive background in technology and business. How has your journey prepared you for your role as GM of Enterprise at Upwork?\r\n</div><div>My journey has been an evolution through various domains, from engineering to management consulting, and what I like to call “intrapreneurship.” I spent six years as GM of LinkedIn Elevate, building the leading employee advocacy solution for enterprises, as well as time spent in executive positions for LinkedIn’s B2B organization, helping scale its three enterprise business lines.\r\n</div><div>More recently, I served as an operating advisor at Bessemer Venture Partners. There, I guided portfolio companies on go-to-market topics spanning revenue growth, efficient scaling, and operational excellence for sales and post-sales functions.\r\n</div><div>These experiences have given me a holistic perspective on enterprises, their business strategies, and opportunities that drive growth. This journey has led me to my current role at Upwork.\r\n</div><div>I believe we are at a critical inflection point in the future of work, and frankly, \"work\" needs to catch up to the technologies that are now enabling it to happen. Upwork delivers an end-to-end offering that gives enterprise companies access to a wide breadth of highly skilled fractional to full-time professionals and workforce solutions, enabling them to achieve incredible business outcomes. I hope to help even more organizations discover, and scale with, the transformational value of Upwork.\r\n</div><div>What motivated you to join Upwork?\r\n</div><div>Aside from what I feel is the perfect career fit, on a more personal level, I grew up in a small rural place in Greece. Every day, I saw firsthand how many talented and hardworking people were limited by their geography and couldn’t access the opportunities they wanted and were qualified for. These people in my memories represent an untapped pool of highly skilled talent who could have a huge impact on companies. Additionally, these companies and jobs represent a huge economic opportunity for these people to lift themselves, their families, and their communities up.\r\n</div><div>That’s why I’m so passionate about Upwork—and why I joined.</div>', '121', NULL, 1, 'asdadasd,asd ,ads a', '2023-12-10 22:52:45', '2023-12-14 02:34:32'),
(4, 1, 1, 'I will do figma website design or landing page UI UX design 2', 'as-asd-asd-asd-asd', 'Over the last several years, a number of factors—including the pandemic, shifting labor market dynamics, macroeconomic uncertainties, and technological advancements—have prompted a significant reevaluation of what “work” looks like among enterprise leaders. To help drive the growth and success of our enterprise business, and deliver work solutions to our largest clients, we were pleased to welcome Zoë Diamadi as Upwork’s General Manager (GM) of Enterprise.\r\n<div>Zoë came to Upwork with over two decades of experience as a go-to-market leader, strategist, engineer, management consultant, and innovator at many companies across tech, talent, and B2B. Since joining in June of 2023, she has overseen and evolved Enterprise sales, product, engineering, and operations.\r\n</div><div>We spoke with Zoë about her critical role in helping enterprises navigate the changing global work environment and dynamic hiring climate, her reasons for joining Upwork, and how she plans to champion the delivery of a best-in-class Enterprise Suite offering to our largest customers.\r\n</div><div>You have extensive background in technology and business. How has your journey prepared you for your role as GM of Enterprise at Upwork?\r\n</div><div>My journey has been an evolution through various domains, from engineering to management consulting, and what I like to call “intrapreneurship.” I spent six years as GM of LinkedIn Elevate, building the leading employee advocacy solution for enterprises, as well as time spent in executive positions for LinkedIn’s B2B organization, helping scale its three enterprise business lines.\r\n</div><div>More recently, I served as an operating advisor at Bessemer Venture Partners. There, I guided portfolio companies on go-to-market topics spanning revenue growth, efficient scaling, and operational excellence for sales and post-sales functions.\r\n</div><div>These experiences have given me a holistic perspective on enterprises, their business strategies, and opportunities that drive growth. This journey has led me to my current role at Upwork.\r\n</div><div>I believe we are at a critical inflection point in the future of work, and frankly, \"work\" needs to catch up to the technologies that are now enabling it to happen. Upwork delivers an end-to-end offering that gives enterprise companies access to a wide breadth of highly skilled fractional to full-time professionals and workforce solutions, enabling them to achieve incredible business outcomes. I hope to help even more organizations discover, and scale with, the transformational value of Upwork.\r\n</div><div>What motivated you to join Upwork?\r\n</div><div>Aside from what I feel is the perfect career fit, on a more personal level, I grew up in a small rural place in Greece. Every day, I saw firsthand how many talented and hardworking people were limited by their geography and couldn’t access the opportunities they wanted and were qualified for. These people in my memories represent an untapped pool of highly skilled talent who could have a huge impact on companies. Additionally, these companies and jobs represent a huge economic opportunity for these people to lift themselves, their families, and their communities up.\r\n</div><div>That’s why I’m so passionate about Upwork—and why I joined.</div>', '119', NULL, 1, 'a sasda', '2023-12-10 22:53:11', '2023-12-14 02:34:57'),
(5, 1, 1, 'I will do figma website design or landing page UI UX design', 'i-will-do-figma-website-design-or-landing-page-ui-ux-design', 'Over the last several years, a number of factors—including the pandemic, shifting labor market dynamics, macroeconomic uncertainties, and technological advancements—have prompted a significant reevaluation of what “work” looks like among enterprise leaders. To help drive the growth and success of our enterprise business, and deliver work solutions to our largest clients, we were pleased to welcome Zoë Diamadi as Upwork’s General Manager (GM) of Enterprise.\r\n<div>\r\n</div><div>Zoë came to Upwork with over two decades of experience as a go-to-market leader, strategist, engineer, management consultant, and innovator at many companies across tech, talent, and B2B. Since joining in June of 2023, she has overseen and evolved Enterprise sales, product, engineering, and operations.\r\n</div><div>\r\n</div><div>We spoke with Zoë about her critical role in helping enterprises navigate the changing global work environment and dynamic hiring climate, her reasons for joining Upwork, and how she plans to champion the delivery of a best-in-class Enterprise Suite offering to our largest customers.\r\n</div><div>\r\n</div><div>You have extensive background in technology and business. How has your journey prepared you for your role as GM of Enterprise at Upwork?\r\n</div><div>My journey has been an evolution through various domains, from engineering to management consulting, and what I like to call “intrapreneurship.” I spent six years as GM of LinkedIn Elevate, building the leading employee advocacy solution for enterprises, as well as time spent in executive positions for LinkedIn’s B2B organization, helping scale its three enterprise business lines.\r\n</div><div>\r\n</div><div>More recently, I served as an operating advisor at Bessemer Venture Partners. There, I guided portfolio companies on go-to-market topics spanning revenue growth, efficient scaling, and operational excellence for sales and post-sales functions.\r\n</div><div>\r\n</div><div>These experiences have given me a holistic perspective on enterprises, their business strategies, and opportunities that drive growth. This journey has led me to my current role at Upwork.\r\n</div><div>\r\n</div><div>I believe we are at a critical inflection point in the future of work, and frankly, \"work\" needs to catch up to the technologies that are now enabling it to happen. Upwork delivers an end-to-end offering that gives enterprise companies access to a wide breadth of highly skilled fractional to full-time professionals and workforce solutions, enabling them to achieve incredible business outcomes. I hope to help even more organizations discover, and scale with, the transformational value of Upwork.\r\n</div><div>\r\n</div><div>What motivated you to join Upwork?\r\n</div><div>Aside from what I feel is the perfect career fit, on a more personal level, I grew up in a small rural place in Greece. Every day, I saw firsthand how many talented and hardworking people were limited by their geography and couldn’t access the opportunities they wanted and were qualified for. These people in my memories represent an untapped pool of highly skilled talent who could have a huge impact on companies. Additionally, these companies and jobs represent a huge economic opportunity for these people to lift themselves, their families, and their communities up.\r\n</div><div>\r\n</div><div>That’s why I’m so passionate about Upwork—and why I joined.</div>', '120', NULL, 1, 'dfsdf,sdfsdf,dsf sdf', '2023-12-11 17:57:15', '2024-06-12 11:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `identity` bigint NOT NULL,
  `is_project_job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0=inactive 1=active',
  `selected_category` int DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `short_description`, `slug`, `meta_title`, `meta_description`, `status`, `selected_category`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Design and Creative', 'This category describes design and creatives', 'design-and-creative', 'This category describes design and creatives', 'This category describes design and creatives', 1, NULL, '17', '2023-02-06 05:36:19', '2024-06-12 11:26:43'),
(2, 'Website Development', 'This category describes website development', 'website-development', NULL, NULL, 1, NULL, '18', '2023-02-06 05:48:16', '2023-11-06 01:09:38'),
(3, 'Customer Service', 'This category describes customer service', 'customer-service', NULL, NULL, 1, NULL, '19', '2023-02-06 05:48:36', '2023-11-06 01:09:17'),
(4, 'Mobile App Development', 'This category describes mobile app development', 'mobile-app-development', NULL, NULL, 1, NULL, '20', '2023-02-06 05:48:45', '2023-11-06 01:09:00'),
(5, 'Education & Teachings', 'This category describes Education', 'education', NULL, NULL, 1, NULL, '21', '2023-02-06 05:49:25', '2023-11-28 05:19:28'),
(9, 'Research', 'This category describes research', 'research', NULL, NULL, 1, NULL, '22', '2023-02-07 00:27:03', '2023-11-06 01:07:48'),
(11, 'Digital Marketing', 'This category describes digital marketing', 'digital-marketing', NULL, NULL, 1, NULL, '24', '2023-02-07 00:57:08', '2023-11-06 01:08:05'),
(13, 'Writing and Translation', 'This category describes writing and translation', 'writing-and-translation', NULL, NULL, 1, NULL, '21', '2023-02-07 00:58:39', '2023-11-06 01:08:24'),
(18, 'Website Design', 'This category describes website design', 'website-design', 'This category describes website design', 'This category describes website design', 1, NULL, '118', '2023-05-15 23:50:03', '2024-06-12 11:13:33');

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `ticket_id` bigint NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notify` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'admin, client, freelancer',
  `load_from` int NOT NULL DEFAULT '0',
  `is_synced` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint UNSIGNED NOT NULL,
  `country_id` int DEFAULT NULL,
  `state_id` int NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0=inactive 1=active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_id`, `state_id`, `city`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Dhanmondi', 1, '2023-01-29 00:52:22', '2023-01-29 00:52:22'),
(2, 2, 16, 'Lende Pral', 1, '2023-01-29 01:14:49', '2023-01-29 01:14:49'),
(4, 1, 2, 'Najirhat', 1, '2023-01-29 01:32:51', '2023-01-29 03:51:38'),
(15, 1, 1, '   Kalabagan', 1, '2023-01-29 05:12:55', '2023-01-29 05:12:55'),
(16, 1, 1, '   Nilkhet', 1, '2023-01-29 05:12:55', '2023-01-29 05:12:55'),
(17, 1, 1, 'sdfsd', 1, '2023-02-08 05:56:36', '2023-02-08 05:56:36'),
(18, 2, 16, 'zxczxc', 1, '2023-02-08 06:12:41', '2023-02-08 06:12:41'),
(19, 1, 3, 'zxczxczxc', 1, '2023-02-08 06:12:53', '2023-02-08 06:12:53'),
(20, 1, 18, 'sdfsdfs sd', 1, '2023-02-08 06:13:19', '2023-02-08 06:13:19');

-- --------------------------------------------------------

--
-- Table structure for table `client_notifications`
--

CREATE TABLE `client_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `identity` bigint NOT NULL,
  `client_id` bigint NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint UNSIGNED NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0=inactive 1=active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bangladesh', 1, '2023-01-25 01:48:20', '2023-01-27 23:17:33'),
(2, 'Argentina', 1, '2023-01-25 01:48:20', '2023-01-25 01:48:20'),
(6, 'United Kingdom', 1, '2023-01-28 01:01:55', '2023-01-28 01:01:55'),
(7, 'United States', 1, '2023-01-28 01:02:07', '2023-01-28 01:02:07'),
(8, 'Malayesia', 1, '2023-02-08 03:38:17', '2023-02-08 04:02:21'),
(9, 'Canada', 1, '2023-02-08 04:00:25', '2023-02-08 04:06:18'),
(10, 'Soudi Arabia', 1, '2023-02-08 04:00:31', '2023-02-08 04:01:51'),
(11, 'Pakistan', 1, '2023-02-08 04:00:38', '2023-02-08 04:01:33'),
(12, 'Australia', 1, '2023-02-08 04:00:46', '2023-02-08 04:00:46'),
(13, 'Norway', 1, '2023-02-08 04:00:58', '2023-02-08 04:00:58'),
(14, 'India', 1, '2023-02-08 04:01:13', '2023-02-08 04:01:13');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0=inactive,1=active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Order Management', 0, '2023-08-27 01:44:10', '2023-08-27 03:42:50'),
(2, 'Project Management', 1, '2023-08-27 01:49:45', '2023-08-27 03:44:07'),
(3, 'Account Management', 1, '2023-08-27 01:50:59', '2023-08-27 01:50:59'),
(7, 'Payment Management', 1, '2023-08-27 03:44:23', '2023-08-27 03:44:23');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=active 1=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `user_id`, `title`, `description`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 7, 'Outstanding Platform', 'I am working on Freelancer Platform since 2018 and I was amazed by the outcomes I got in my life Thanks to them for freeing me from 9-5 Now I can proudly say it is a outstanding platform', 5, 0, '2023-10-30 04:20:41', '2023-10-30 04:20:41'),
(2, 8, 'Useful Platform', 'I am working on Freelancer Platform since 2018 and I was amazed by the outcomes I got in my life Thanks to them for freeing me from 9-5 Now I can proudly say it is a outstanding platform', 5, 1, '2023-10-30 04:20:41', '2024-01-17 06:33:41'),
(3, 9, 'I Found Best Ever Client', 'I am working on Freelancer Platform since 2018 and I was amazed by the outcomes I got in my life Thanks to them for freeing me from 9-5 Now I can proudly say it is a outstanding platform', 5, 1, '2023-10-30 04:20:41', '2024-01-17 06:33:48'),
(4, 10, 'Friendly Support', 'I am working on Freelancer Platform since 2018 and I was amazed by the outcomes I got in my life Thanks to them for freeing me from 9-5 Now I can proudly say it is a outstanding platform', 5, 1, '2023-10-30 04:20:41', '2024-01-17 06:33:55'),
(5, 11, 'Outstanding Platform', 'I am working on Freelancer Platform since 2018 and I was amazed by the outcomes I got in my life Thanks to them for freeing me from 9-5 Now I can proudly say it is a outstanding platform', 5, 1, '2023-10-30 04:20:41', '2024-01-17 06:34:03'),
(6, 7, 'Outstanding Platform', 'I am working on Freelancer Platform since 2018 and I was amazed by the outcomes I got in my life Thanks to them for freeing me from 9-5 Now I can proudly say it is a outstanding platform', 5, 0, '2023-10-30 04:20:41', '2023-10-30 04:20:41'),
(7, 7, 'Easy Systems', 'I am working on Freelancer Platform since 2018 and I was amazed by the outcomes I got in my life Thanks to them for freeing me from 9-5 Now I can proudly say it is a outstanding platform', 5, 1, '2023-10-30 04:30:21', '2024-01-17 06:33:31');

-- --------------------------------------------------------

--
-- Table structure for table `form_builders`
--

CREATE TABLE `form_builders` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `success_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_builders`
--

INSERT INTO `form_builders` (`id`, `title`, `email`, `button_text`, `fields`, `success_message`, `created_at`, `updated_at`) VALUES
(1, 'Contact Form', 'contact@xilancer.com', 'Submit', '{\"success_message\":\"Your Message Successfully Send.\",\"field_type\":[\"text\",\"email\",\"tel\",\"textarea\"],\"field_name\":[\"your-name\",\"your-email\",\"your-phone\",\"your-message\"],\"field_placeholder\":[\"Your Name\",\"Your Email\",\"Your Phone\",\"Your Message\"],\"field_required\":[\"on\",\"on\"]}', 'Your Message Successfully Send.', '2022-12-29 04:52:45', '2023-11-28 06:27:30'),
(6, 'Test Form', 'test@filancer.com', 'Test', '{\"success_message\":\"Test\",\"field_type\":[\"text\"],\"field_name\":[\"your-name\"],\"field_placeholder\":[\"Your Name\"]}', 'Test', '2022-12-29 05:53:05', '2023-01-01 06:46:56');

-- --------------------------------------------------------

--
-- Table structure for table `freelancer_levels`
--

CREATE TABLE `freelancer_levels` (
  `id` bigint UNSIGNED NOT NULL,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0=inactive 1=active',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `freelancer_levels`
--

INSERT INTO `freelancer_levels` (`id`, `level`, `status`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Rated Plus', 1, '130', '2024-01-04 06:41:18', '2024-06-04 08:43:09'),
(2, 'Top Rated', 1, '128', '2024-01-04 06:41:53', '2024-01-04 06:41:53'),
(3, 'Rising Talent', 1, '126', '2024-01-04 06:42:17', '2024-01-04 06:42:17');

-- --------------------------------------------------------

--
-- Table structure for table `freelancer_level_rules`
--

CREATE TABLE `freelancer_level_rules` (
  `id` bigint UNSIGNED NOT NULL,
  `freelancer_level_id` bigint NOT NULL,
  `period` int NOT NULL,
  `avg_rating` double NOT NULL,
  `earning` double NOT NULL,
  `complete_order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `freelancer_level_rules`
--

INSERT INTO `freelancer_level_rules` (`id`, `freelancer_level_id`, `period`, `avg_rating`, `earning`, `complete_order`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 4.5, 10, 1, '2024-01-04 06:43:07', '2024-01-04 06:43:07'),
(2, 2, 9, 4.8, 10, 1, '2024-01-04 06:43:37', '2024-06-04 08:35:56'),
(3, 1, 12, 4, 10, 1, '2024-06-04 08:37:48', '2024-06-04 08:37:48');

-- --------------------------------------------------------

--
-- Table structure for table `freelancer_notifications`
--

CREATE TABLE `freelancer_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `identity` bigint NOT NULL,
  `freelancer_id` bigint NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `identity_verifications`
--

CREATE TABLE `identity_verifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `verify_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint NOT NULL,
  `state_id` bigint NOT NULL,
  `city_id` bigint NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `national_id_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `front_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `back_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint DEFAULT NULL COMMENT '1=verified, 2=rejected',
  `is_read` tinyint NOT NULL DEFAULT '0' COMMENT '1=read and 0=unread',
  `load_from` int NOT NULL DEFAULT '0',
  `is_synced` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `identity_verifications`
--

INSERT INTO `identity_verifications` (`id`, `user_id`, `verify_by`, `country_id`, `state_id`, `city_id`, `address`, `zipcode`, `national_id_number`, `front_image`, `back_image`, `status`, `is_read`, `load_from`, `is_synced`, `created_at`, `updated_at`) VALUES
(12, 1, 'National ID Card', 1, 1, 1, 'opfgvxcv', 'fd', '2546454', '1679390050-64197562ea113.png', '1679390050-64197562ea3e2.png', 1, 0, 0, 0, '2023-03-21 03:06:42', '2023-03-21 05:15:49'),
(13, 7, 'National ID Card', 1, 1, 1, 'gjkadfsd', 'hjgkhj', '576441', '1680670995-642d011358dee.png', '1680670995-642d011359127.png', 1, 0, 0, 0, '2023-03-21 03:12:26', '2023-08-23 22:46:58'),
(14, 8, 'National ID Card', 1, 2, 4, 'asd asdas dasd a', '345', '345345345', '1695124219-65098afb75c6f.png', '1695124219-65098afb75f56.png', 1, 0, 0, 0, '2023-09-19 05:27:15', '2023-09-19 05:51:20'),
(15, 2, 'National ID Card', 1, 1, 1, 'North Dhanmondi Dhaka', '1205', '090858967', '1695186732-650a7f2cdef42.png', '1695186732-650a7f2cdf123.png', NULL, 0, 0, 0, '2023-09-19 23:12:12', '2023-09-19 23:12:12');

-- --------------------------------------------------------

--
-- Table structure for table `individual_commission_settings`
--

CREATE TABLE `individual_commission_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `admin_commission_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_commission_charge` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `individual_commission_settings`
--

INSERT INTO `individual_commission_settings` (`id`, `user_id`, `admin_commission_type`, `admin_commission_charge`, `created_at`, `updated_at`) VALUES
(1, 7, 'percentage', 10, '2023-07-11 06:32:57', '2023-07-11 06:32:57');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_histories`
--

CREATE TABLE `job_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `job_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `reject_count` bigint DEFAULT NULL,
  `edit_count` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_histories`
--

INSERT INTO `job_histories` (`id`, `job_id`, `user_id`, `reject_count`, `edit_count`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 1, 0, '2023-06-05 04:00:29', '2023-11-25 07:34:08'),
(2, 6, 1, 2, 1, '2023-06-05 23:48:56', '2023-11-25 07:38:20'),
(3, 11, 1, 2, 1, '2023-09-20 07:17:56', '2023-11-25 06:07:29'),
(4, 12, 1, 2, 1, '2023-10-04 04:17:54', '2023-11-25 06:52:27'),
(5, 10, 1, 2, 1, '2023-11-05 23:29:23', '2023-11-25 07:37:03'),
(6, 9, 1, 2, 1, '2023-11-05 23:32:25', '2023-11-25 07:37:26'),
(7, 7, 1, 2, 1, '2023-11-05 23:42:10', '2023-11-26 23:37:27'),
(8, 4, 1, 2, 1, '2023-11-06 00:08:39', '2023-11-25 07:30:08'),
(9, 2, 1, 2, 1, '2023-11-06 00:17:13', '2023-11-25 07:26:37'),
(10, 1, 1, 2, 1, '2023-11-06 00:24:35', '2023-11-25 07:21:40'),
(11, 13, 1, 2, 1, '2023-11-06 00:45:49', '2023-11-27 01:15:57'),
(12, 14, 1, 2, 1, '2023-11-06 00:58:33', '2023-11-25 07:35:15'),
(13, 15, 1, 2, 1, '2023-11-06 01:24:11', '2023-11-25 07:33:48'),
(14, 8, 2, 2, 1, '2023-11-06 02:00:25', '2023-11-06 02:03:51'),
(15, 16, 1, 0, 1, '2024-04-26 06:54:55', '2024-04-26 06:54:55'),
(16, 36, 1, 0, 1, '2024-08-31 16:55:35', '2024-08-31 16:55:35');

-- --------------------------------------------------------

--
-- Table structure for table `job_posts`
--

CREATE TABLE `job_posts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` bigint NOT NULL,
  `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hourly_rate` int DEFAULT NULL,
  `estimated_hours` int DEFAULT NULL,
  `budget` double NOT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=pending/inactivate, 1=approve/publish',
  `current_status` tinyint NOT NULL DEFAULT '0' COMMENT '0=nothing, 1=in progress, 2=complete, 3=cancel',
  `on_off` tinyint NOT NULL DEFAULT '1' COMMENT '1=on, 0=off',
  `job_approve_request` tinyint NOT NULL DEFAULT '0' COMMENT '0=request for approve, 1=approve, 2=decline, 2=will change to 0 when the user edit the project.',
  `last_seen` timestamp NULL DEFAULT NULL,
  `last_apply_date` timestamp NULL DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `load_from` int NOT NULL DEFAULT '0',
  `is_synced` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_posts`
--

INSERT INTO `job_posts` (`id`, `user_id`, `title`, `slug`, `category`, `duration`, `level`, `description`, `type`, `hourly_rate`, `estimated_hours`, `budget`, `attachment`, `status`, `current_status`, `on_off`, `job_approve_request`, `last_seen`, `last_apply_date`, `meta_title`, `meta_description`, `meta_tags`, `load_from`, `is_synced`, `created_at`, `updated_at`) VALUES
(1, 1, 'Article Writer Needed ( Blog focusing on Immigration)', 'article-writer-needed---blog-focusing-on-immigration', 13, 'less than a week', 'not mandatory', '<p style=\"line-height: 1.4;\"><span style=\"color: rgb(14, 23, 36); font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\">We\'re on the lookout for a talented and passionate article writer to contribute compelling content to our blog, which centers around immigration topics. If you have a flair for storytelling, a deep understanding of immigration issues, and a knack for engaging readers, we invite you to be a part of our content creation journey.</span></p><p style=\"line-height: 1.4;\"><span style=\"color: rgb(14, 23, 36); font-family: Roboto, \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><br></span></p><p style=\"line-height: 2;\"><span style=\"color: rgb(14, 23, 36); font-size: 18px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><b>Scope of Work:</b></span></p><ul><li><font color=\"#0e1724\"><b>In-Depth Research:</b> Dive into immigration-related topics, staying updated on current events, policies, and global perspectives. 📚</font></li><li><font color=\"#0e1724\"><b>Engaging Content Creation:</b> Craft well-researched and engaging articles that resonate with our audience, covering a range of immigration subjects. ✍️</font></li><li><font color=\"#0e1724\"><b>Storytelling Mastery:</b> Weave narratives that humanize the immigration experience, making complex topics accessible and relatable. 🗣️</font></li><li><font color=\"#0e1724\"><b>SEO Integration:</b> Implement basic SEO principles to enhance the discoverability of our articles on search engines. 🔍</font></li></ul><p><span style=\"font-size: 18px;\"><b><font color=\"#000000\"><br></font></b></span></p><p style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b><font color=\"#000000\">Qualifications:</font></b></span></p><ul><li><font color=\"#424242\">Proven experience as a successful online English language instructor.\r\n</font></li><li><font color=\"#424242\">Bachelor\'s degree in English, Education, or a related field.\r\n</font></li><li><font color=\"#424242\">Native or near-native proficiency in English.\r\n</font></li><li><font color=\"#424242\">Excellent communication and interpersonal skills.\r\n</font></li><li><font color=\"#424242\">Familiarity with popular virtual teaching platforms.</font></li></ul><p><b style=\"font-size: 18px; color: var(--paragraph-color); text-align: var(--bs-body-text-align);\"><font color=\"#000000\"><br></font></b></p><p style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--paragraph-color); text-align: var(--bs-body-text-align);\"><font color=\"#000000\">Requirements:</font></b><br></p><p style=\"line-height: 1.4;\"><font color=\"#000000\"><span style=\"font-size: 14px;\">If you\'re a skilled wordsmith with a passion for shedding light on immigration matters, submit your application. Include writing samples showcasing your ability to tackle immigration-related topics and a brief cover letter expressing your interest.</span></font></p><p><span style=\"font-size: 18px;\"><b><font color=\"#000000\">\r\n</font></b></span></p><p><b><span style=\"font-size: 18px;\"><font color=\"#000000\"><br></font></span></b></p><p style=\"line-height: 2;\"><b><span style=\"font-size: 18px;\"><font color=\"#000000\">Please apply if you\'re only qualified.</font></span></b></p><p><span style=\"font-size: 14px;\"><font color=\"#000000\" style=\"\">We value diversity and encourage writers from all backgrounds to apply. Shortlisted candidates will be contacted for further discussions. 🌈</font></span></p>', 'fixed', NULL, NULL, 50, '1699251875-654886a31880f.txt', 1, 0, 1, 1, '2024-08-26 11:24:37', NULL, NULL, NULL, NULL, 0, 0, '2023-04-16 17:51:16', '2024-08-26 11:24:37'),
(2, 1, 'Real Estate Proposal Writer for U.S. Clients 🏡📄', 'submit-proposals-for-my-agency', 13, 'less than a week', 'not mandatory', '<p style=\"line-height: 1.4;\"><span style=\"font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\">We\'re in search of a skilled and articulate proposal writer to craft compelling documents for our real estate clients in the USA. As a key player in our team, you\'ll be responsible for translating our clients\' visions into persuasive proposals that showcase the unique value of their properties and services.</font></span></p><p><span style=\"\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\"><br></font></span></p><p><span style=\"font-size: 18px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><b><font color=\"#424242\">Responsibilities:</font></b></span></p><ul><li><font color=\"#424242\"><b>Client Collaboration:</b> Collaborate with our real estate clients to understand their goals, property features, and target audience.</font></li><li><font color=\"#424242\"><b>Content Creation:</b> Develop detailed and engaging proposals that highlight the key selling points of each property, including location advantages, amenities, and investment potential.</font></li><li><font color=\"#424242\"><b>Market Analysis:</b> Conduct market research to provide clients with relevant data and insights, supporting the value proposition presented in the proposals.</font></li><li><font color=\"#424242\"><b>Tailored Language:</b> Customize proposal language to resonate with diverse audiences, from potential buyers to investors and stakeholders.</font></li></ul><p><span style=\"font-size: 18px;\"><b><font color=\"#424242\"><br></font></b></span></p><p><span style=\"font-size: 18px;\"><b><font color=\"#424242\">Qualifications:</font></b></span></p><ul><li><font color=\"#424242\">Proven experience as a successful online English language instructor.\r\n</font></li><li><font color=\"#424242\">Bachelor\'s degree in English, Education, or a related field.\r\n</font></li><li><font color=\"#424242\">Native or near-native proficiency in English.\r\n</font></li><li><font color=\"#424242\">Excellent communication and interpersonal skills.\r\n</font></li><li><font color=\"#424242\">Familiarity with popular virtual teaching platforms.</font></li></ul><p><b style=\"font-size: 18px; text-align: var(--bs-body-text-align);\"><font color=\"#424242\"><br></font></b></p><p><font color=\"#424242\"><b style=\"font-size: 18px; text-align: var(--bs-body-text-align);\">Budget:</b><br></font></p><p><span style=\"font-size: 18px;\"><font color=\"#424242\"><span style=\"font-size: 14px;\">Open to negotiation based on experience and qualifications.</span><b>\r\n</b></font></span></p><p><span style=\"font-size: 18px;\"><b><font color=\"#424242\">\r\n</font></b></span></p><p><b><span style=\"font-size: 18px;\"><font color=\"#424242\"><br></font></span></b></p><p><b><span style=\"font-size: 18px;\"><font color=\"#424242\">Please apply if you\'re only qualified.</font></span></b></p>', 'fixed', NULL, NULL, 50, '1699251432-654884e887c26.txt', 1, 0, 1, 1, '2024-05-01 10:31:23', NULL, NULL, NULL, NULL, 0, 0, '2023-04-16 21:19:42', '2024-05-01 10:31:23'),
(4, 1, 'Full-time professional Android and iOS app developer', 'full-time-preffessional-android-and-ios-app-developer', 4, 'less than 2 month', 'not mandatory', '<p style=\"line-height: 1.4;\"><span style=\"color: rgb(14, 23, 36); font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\">Embark on a journey as a full-time Android and iOS app developer, shaping the future of our mobile applications. If you\'re passionate about crafting seamless user experiences, staying ahead in mobile technology, and contributing to innovative app solutions, we invite you to be a key player in our development journey.</span></p><p><span style=\"color: rgb(14, 23, 36); font-family: Roboto, \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><br></span></p><p><span style=\"color: rgb(14, 23, 36); font-size: 18px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><b>Responsibilities:</b></span></p><ul><li><font color=\"#0e1724\">App Development Mastery: Utilize your expertise to design, develop, test, and deploy high-quality Android and iOS applications.</font></li><li><font color=\"#0e1724\">Platform Innovation: Stay abreast of the latest mobile trends and technologies, bringing innovative ideas to enhance our app offerings.</font></li><li><font color=\"#0e1724\">Collaborative Work: Engage with designers and product managers to deliver exceptional app experiences.</font></li><li><font color=\"#0e1724\">Code Optimization: Implement best practices for code quality, performance, and maintainability.</font></li></ul><p><span style=\"font-size: 18px;\"><b><font color=\"#000000\"><br></font></b></span></p><p><span style=\"font-size: 18px;\"><b><font color=\"#000000\">Scope of Work:</font></b></span></p><ul><li>Proven experience as a successful online English language instructor.\r\n</li><li>Bachelor\'s degree in English, Education, or a related field.\r\n</li><li>Native or near-native proficiency in English.\r\n</li><li>Excellent communication and interpersonal skills.\r\n</li><li>Familiarity with popular virtual teaching platforms.</li></ul><p><b style=\"font-size: 18px; color: var(--paragraph-color); text-align: var(--bs-body-text-align);\"><font color=\"#000000\"><br></font></b></p><p><b style=\"font-size: 18px; color: var(--paragraph-color); text-align: var(--bs-body-text-align);\"><font color=\"#000000\">Budget:</font></b><br></p><p style=\"line-height: 1.4;\"><font color=\"#000000\"><span style=\"font-size: 14px;\">If you\'re a mobile app maestro ready to contribute to cutting-edge development, submit your application. Include your portfolio showcasing your app development projects and a brief cover letter expressing your passion for mobile innovation.</span></font></p>', 'fixed', NULL, NULL, 500, '1699250918-654882e6bbf98.pdf', 1, 0, 1, 1, '2024-04-18 17:22:24', NULL, NULL, NULL, NULL, 0, 0, '2023-05-24 17:17:27', '2024-04-18 17:22:24'),
(5, 1, 'Flutter Android & iOS mobile app development for eCommerce store', 'android-app-development', 4, 'less than a week', 'not mandatory', '<p style=\"line-height: 1.4;\"><span style=\"font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\">We\'re seeking a skilled Flutter developer to shape the future of mobile commerce. Join us in crafting a seamless Android and iOS mobile app for our eCommerce store, ensuring a cutting-edge and user-friendly shopping experience 🛒📱</font></span></p><p><font color=\"#424242\"><br></font></p><p style=\"line-height: 2;\"><span style=\"font-size: 18px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><b><font color=\"#424242\">Scope of Work:</font></b></span></p><ul><li><font color=\"#424242\"><b>Flutter Expertise:</b> Utilize your expertise to develop a unified mobile app for Android and iOS platforms.</font></li><li><font color=\"#424242\"><b>E-commerce Integration:</b> Seamlessly integrate the app with our existing eCommerce store, 🔒🔄</font></li><li><font color=\"#424242\"><b>User-Centric Design:</b> Create an engaging and intuitive user interface, optimizing the mobile 🎨👩‍💻</font></li><li><font color=\"#424242\"><b>Performance Optimization:</b> Implement best practices to ensure the app\'s performance, responsiveness, and swift loading times.⚙️🚀</font></li></ul><p><span style=\"font-size: 18px;\"><b><font color=\"#424242\"><br></font></b></span></p><p style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b><font color=\"#424242\">Requirements:</font></b></span></p><ul><li><font color=\"#424242\">Proven experience in developing Android and iOS apps using Flutter.\r\n</font></li><li><font color=\"#424242\">Expertise in integrating mobile apps with eCommerce platforms.\r\n</font></li><li><font color=\"#424242\">A portfolio showcasing successful mobile app projects.</font></li></ul><p><font color=\"#424242\"><br></font></p><p><b><span style=\"font-size: 18px;\"><font color=\"#424242\">Please apply if you\'re only qualified.</font></span></b></p>', 'fixed', NULL, NULL, 500, '1685861166-647c332e48e81.pdf', 1, 1, 1, 1, '2024-06-10 17:18:44', NULL, NULL, NULL, NULL, 0, 0, '2023-06-03 18:46:06', '2024-06-12 20:44:30'),
(6, 1, 'Website UI and HTML design for good website', 'website-ui-and-html-design-for-good-website-', 1, 'less than a month', 'midLevel', '<p><span style=\"color: rgb(14, 23, 36); font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\">We are in search of a skilled and engaging English Language Instructor to join our virtual teaching team. If you have a passion for language education and the ability to create dynamic online learning experiences, we want to hear from you!</span></p><p><span style=\"color: rgb(14, 23, 36); font-family: Roboto, \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><br></span></p><p style=\"line-height: 2;\"><span style=\"color: rgb(14, 23, 36); font-size: 18px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><b>Responsibilities:</b></span></p><ul><li><font color=\"#0e1724\">Conduct virtual English language classes catering to a diverse audience.\r\n</font></li><li><font color=\"#0e1724\">Develop and execute engaging lesson plans that enhance language proficiency and communication skills.\r\n</font></li><li><font color=\"#0e1724\">Provide constructive feedback to students to support their learning journey.\r\n</font></li><li><font color=\"#0e1724\">Cultivate an inclusive and supportive online learning environment.</font></li></ul><p><span style=\"font-size: 18px;\"><b><font color=\"#000000\"><br></font></b></span></p><p style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b><font color=\"#000000\">Qualifications:</font></b></span></p><ul><li>Proven experience as a successful online English language instructor.\r\n</li><li>Bachelor\'s degree in English, Education, or a related field.\r\n</li><li>Native or near-native proficiency in English.\r\n</li><li>Excellent communication and interpersonal skills.\r\n</li><li>Familiarity with popular virtual teaching platforms.</li></ul><p><b style=\"font-size: 18px; color: var(--paragraph-color); text-align: var(--bs-body-text-align);\"><font color=\"#000000\"><br></font></b></p><p style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--paragraph-color); text-align: var(--bs-body-text-align);\"><font color=\"#000000\">Budget:</font></b><br></p><p><span style=\"font-size: 18px;\"><font color=\"#000000\" style=\"\"><span style=\"font-size: 14px;\">Open to negotiation based on experience and qualifications.</span><b>\r\n</b></font></span></p><p><span style=\"font-size: 18px;\"><b><font color=\"#000000\">\r\n</font></b></span></p><p><b><span style=\"font-size: 18px;\"><font color=\"#000000\"><br></font></span></b></p><p><b><span style=\"font-size: 18px;\"><font color=\"#000000\">Please apply if you\'re only qualified.</font></span></b></p>', 'fixed', NULL, NULL, 250, '1699249858-65487ec28b030.txt', 1, 0, 1, 1, '2024-06-26 10:16:18', NULL, NULL, NULL, NULL, 0, 0, '2023-06-05 17:13:55', '2024-06-26 10:16:18'),
(7, 1, 'Website UI and HTML theme design for online shopping', 'website-ui-and-html-theme-design-for-online-shopping', 1, 'less than 2 month', 'senior', '<p style=\"line-height: 1.8;\"><span style=\"font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\">Join us in the creation of a digital masterpiece, redefining the online shopping realm! We\'re seeking a design virtuoso to weave a visually enchanting UI and HTML theme that will transport users to a realm of seamless, delightful, and unforgettable online shopping.</font></span></p><p><span style=\"\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\"><br></font></span></p><p style=\"line-height: 2;\"><span style=\"font-size: 18px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><b><font color=\"#424242\">Scope of Work:</font></b></span></p><ul><li><font color=\"#424242\"><b>User-Centric Design:</b> Craft an intuitive interface that guides users seamlessly through the shopping experience.</font></li><li><font color=\"#424242\"><b>Visual Impact:</b> Create a visually captivating masterpiece that embodies our brand identity</font></li><li><font color=\"#424242\"><b>Responsive Excellence:</b> Ensure a flawless dance of elements on screens of all sizes, from desktop to mobile.</font></li><li><font color=\"#424242\"><b>E-commerce Brilliance:</b> Apply e-commerce wisdom to make product showcasing, navigation, and checkout a captivating journey.</font></li></ul><p><font color=\"#424242\"><br></font></p><p style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b><font color=\"#424242\">Qualifications:</font></b></span></p><ul><li><font color=\"#424242\">Proven experience in UI/UX design for e-commerce.\r\n</font></li><li><font color=\"#424242\">Proficiency in Adobe XD, Sketch, or similar design tools.\r\n</font></li><li><font color=\"#424242\">A captivating portfolio showcasing past successes in online shopping design</font></li></ul><p><b style=\"font-size: 18px; text-align: var(--bs-body-text-align);\"><font color=\"#424242\"><br></font></b></p><p style=\"line-height: 2;\"><font color=\"#424242\"><b style=\"font-size: 18px; text-align: var(--bs-body-text-align);\">Budget:</b><br></font></p><p><span style=\"font-size: 18px;\"><font color=\"#424242\"><span style=\"font-size: 14px;\">Open to negotiation based on experience and qualifications.</span><b>\r\n</b></font></span></p><p><span style=\"font-size: 18px;\"><b><font color=\"#424242\">\r\n</font></b></span></p><p><b><span style=\"font-size: 18px;\"><font color=\"#424242\"><br></font></span></b></p><p><b><span style=\"font-size: 18px;\"><font color=\"#424242\">Please apply if you\'re only qualified.</font></span></b></p>', 'fixed', NULL, NULL, 200, '1699249329-65487cb1e839e.txt', 1, 0, 1, 1, '2024-04-27 10:21:27', NULL, NULL, NULL, NULL, 0, 0, '2023-09-11 06:45:09', '2024-04-27 10:21:27'),
(8, 2, 'I need a SEO Developer', 'i-need-a-seo-developer', 11, 'less than a month', 'not mandatory', '<p><span style=\"color: rgb(14, 23, 36); font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\">We are in search of a skilled and engaging English Language Instructor to join our virtual teaching team. If you have a passion for language education and the ability to create dynamic online learning experiences, we want to hear from you!</span></p><p><span style=\"color: rgb(14, 23, 36); font-family: Roboto, \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><br></span></p><p><span style=\"color: rgb(14, 23, 36); font-size: 18px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><b>Responsibilities:</b></span></p><ul><li><font color=\"#0e1724\">Conduct virtual English language classes catering to a diverse audience.\n</font></li><li><font color=\"#0e1724\">Develop and execute engaging lesson plans that enhance language proficiency and communication skills.\n</font></li><li><font color=\"#0e1724\">Provide constructive feedback to students to support their learning journey.\n</font></li><li><font color=\"#0e1724\">Cultivate an inclusive and supportive online learning environment.</font></li></ul><p><span style=\"font-size: 18px;\"><b><font color=\"#000000\"><br></font></b></span></p><p><span style=\"font-size: 18px;\"><b><font color=\"#000000\">Qualifications:</font></b></span></p><ul><li>Proven experience as a successful online English language instructor.\n</li><li>Bachelor\'s degree in English, Education, or a related field.\n</li><li>Native or near-native proficiency in English.\n</li><li>Excellent communication and interpersonal skills.\n</li><li>Familiarity with popular virtual teaching platforms.</li></ul><p><b style=\"font-size: 18px; color: var(--paragraph-color); text-align: var(--bs-body-text-align);\"><font color=\"#000000\"><br></font></b></p><p><b style=\"font-size: 18px; color: var(--paragraph-color); text-align: var(--bs-body-text-align);\"><font color=\"#000000\">Budget:</font></b><br></p><p><span style=\"font-size: 18px;\"><font color=\"#000000\" style=\"\"><span style=\"font-size: 14px;\">Open to negotiation based on experience and qualifications.</span><b>\n</b></font></span></p><p><span style=\"font-size: 18px;\"><b><font color=\"#000000\">\n</font></b></span></p><p><b><span style=\"font-size: 18px;\"><font color=\"#000000\"><br></font></span></b></p><p><b><span style=\"font-size: 18px;\"><font color=\"#000000\">Please apply if you\'re only qualified.</font></span></b></p>', 'fixed', NULL, NULL, 100, '1699257624-65489d18d695a.pdf', 1, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, 0, 0, '2023-09-19 23:56:28', '2023-11-06 02:03:51'),
(9, 1, 'Make a nice and clean logo design for my company identification', 'make-a-nice-and-clean-logo-design-for-my-company-identification', 1, 'less than a week', 'senior', '<p style=\"line-height: 1.4;\"><span style=\"font-size: 14px;\"><font color=\"#424242\">Embark on a creative collaboration to define and elevate your company\'s identity through a visually appealing and clean logo design. We are in search of a skilled graphic designer to craft a unique logo that encapsulates the essence and values of our brand.</font></span></p><p><span style=\"\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\"><br></font></span></p><p style=\"line-height: 2;\"><span style=\"font-size: 18px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><b><font color=\"#424242\">Scope of Work:</font></b></span></p><ul><li><span style=\"font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\"><b>Concept Development: </b>Work closely with our team to understand the core values and vision of our company, translating them into design concepts.</font></span></li><li><span style=\"font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\"><b>Creativity Unleashed:</b> Bring forth your creative prowess to develop unique and memorable logo options, ensuring they align with our brand identity.</font></span></li><li><span style=\"font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\"><b>Clean and Timeless Design:</b> Strive for simplicity and timelessness in the design, creating a logo that stands the test of trends and resonates with our audience.</font></span></li><li><span style=\"font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\"><b>Iterative Process:</b> Engage in an iterative design process, incorporating feedback and refining the chosen concept to perfection.</font></span></li></ul><p><span style=\"font-size: 18px;\"><b><font color=\"#424242\"><br></font></b></span></p><p style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b><font color=\"#424242\">Requirements:</font></b></span></p><ul><li><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><font color=\"#424242\">Proven experience in logo design, showcasing a diverse portfolio.\r\n</font></span></li><li><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><font color=\"#424242\">Strong creative and conceptual thinking skills.\r\n</font></span></li><li><font color=\"#424242\"><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">A keen eye for detail and a commitment to delivering clean and impactful designs..</span><br></font></li></ul><p><b style=\"font-size: 18px; text-align: var(--bs-body-text-align);\"><font color=\"#424242\"><br></font></b></p><p style=\"line-height: 2;\"><font color=\"#424242\"><b style=\"font-size: 18px; text-align: var(--bs-body-text-align);\">Note:</b><br></font></p><p><span style=\"font-size: 18px;\"><span style=\"font-size: 14px;\"><font color=\"#424242\">We value diversity and encourage designers from all background to apply. Shortlisted candidates will be invited for further discussions to ensure a collaborative and successful logo design process.\r\n</font></span></span></p><p><span style=\"font-size: 18px;\"><font color=\"#000000\" style=\"\"><span style=\"font-size: 14px;\"><br></span></font></span></p><p><span style=\"font-size: 18px;\"><font color=\"#000000\" style=\"\"><span style=\"font-size: 14px;\">\r\n</span></font></span></p>', 'fixed', NULL, NULL, 200, '1699248745-65487a691055a.txt', 1, 0, 1, 1, '2024-04-26 06:57:40', NULL, NULL, NULL, NULL, 0, 0, '2023-09-20 06:04:27', '2024-04-26 06:57:40'),
(10, 1, 'Full-time Full stack developer for long term project', 'full-time-full-stack-developer-for-long-term-project', 2, '1 Days', 'midLevel', '<p style=\"line-height: 1.4;\"><span style=\"font-size: 14px;\"><font color=\"#424242\">Embark on a dynamic journey as a Freelance Full Stack Developer, where your expertise meets project-driven opportunities. We\'re in search of a talented developer to engage in specific projects, contributing your skills to both frontend and backend development.</font></span></p><p><span style=\"\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\"><br></font></span></p><p><span style=\"font-size: 18px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><b><font color=\"#424242\"><br></font></b></span></p><p style=\"line-height: 2;\"><span style=\"font-size: 18px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><b><font color=\"#424242\">Role and Responsibilities:</font></b></span></p><ul><li><span style=\"font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\"><b>Project-Based Development: </b>Engage in project-specific development tasks, covering both frontend and backend requirements.</font></span></li><li><span style=\"font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\"><b>Technical Versatility:</b> Showcase proficiency in diverse technologies, frameworks, and languages relevant to the project scope.</font></span></li><li><span style=\"font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\"><b>Collaborative Contribution:</b> Work independently and collaboratively with our teams to ensure successful project outcomes.</font></span></li><li><span style=\"font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\"><b>Creative Problem-Solving:</b> Tackle project challenges with innovation and analytical thinking to deliver effective solutions.</font></span></li></ul><p><span style=\"font-size: 18px;\"><b><font color=\"#424242\"><br></font></b></span></p><p style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b><font color=\"#424242\">Requirements:</font></b></span></p><ul><li><font color=\"#424242\">Proven freelance experience as a Full Stack Developer.\r\n</font></li><li><font color=\"#424242\">Proficiency in various frontend and backend technologies, frameworks, and languages.\r\n</font></li><li><font color=\"#424242\">Strong problem-solving skills and effective communication for collaborative success.</font></li></ul><p><b style=\"font-size: 18px; text-align: var(--bs-body-text-align);\"><font color=\"#424242\"><br></font></b></p><p style=\"line-height: 2;\"><font color=\"#424242\"><b style=\"font-size: 18px; text-align: var(--bs-body-text-align);\">Compensation:</b><br></font></p><p><span style=\"font-size: 18px;\"><span style=\"font-size: 14px;\"><font color=\"#424242\">Fixed-rate, negotiable based on the project scope and your expertise.\r\n</font></span></span></p><p><span style=\"font-size: 18px;\"><span style=\"font-size: 14px;\"><font color=\"#424242\">\r\n</font></span></span></p><p><br></p>', 'fixed', NULL, NULL, 300, '1699248562-654879b26056f.pdf', 1, 0, 1, 1, '2024-08-01 01:36:18', NULL, NULL, NULL, NULL, 0, 0, '2023-09-20 06:10:35', '2024-08-01 01:36:18'),
(11, 1, 'Laravel Ecommerce Extension Developer Needed', 'laravel-ecommerce-extension-developer-needed', 2, 'less than a week', 'midLevel', '<p style=\"line-height: 1.4;\"><span style=\"font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\">Seeking a skilled Freelance Laravel E-commerce Extension Developer for a project-based opportunity. Join us for a one-time fixed-rate job to enhance our e-commerce platform with custom </font></span></p><p style=\"line-height: 1.4;\"><span style=\"font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\">extensions. Take on the challenge of creating unique Laravel extensions to enrich our e-commerce functionalities. This is a one-time fixed-rate job focusing on delivering specific project </font></span></p><p style=\"line-height: 1.4;\"><span style=\"font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\">requirements.</font></span></p><p style=\"line-height: 1.4;\"><font color=\"#424242\"><br></font></p><p style=\"line-height: 1.4;\"><font color=\"#424242\"><br></font></p><p style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b><font color=\"#424242\">Key Responsibilities:</font></b></span></p><ul><li><span style=\"font-size: 14px;\"><font color=\"#424242\"><span style=\"font-weight: bold; font-size: 14px;\">Extension Development:</span> Craft custom Laravel extensions to augment our e-commerce platform\'s capabilities.</font></span></li><li><span style=\"font-size: 14px;\"><font color=\"#424242\"><b>Integration:</b> Integrate new extensions seamlessly into our existing Laravel-based e-commerce setup.</font></span></li><li><span style=\"font-size: 14px;\"><font color=\"#424242\"><b>Customization:</b> Tailor extensions to meet precise project requirements, ensuring an enhanced user experience.</font></span></li><li><span style=\"font-size: 14px;\"><font color=\"#424242\"><b>Bug Fixing:</b> Collaborate on identifying and fixing bugs during the project to ensure smooth extension performance.</font></span></li></ul><p><b style=\"font-size: 18px; text-align: var(--bs-body-text-align);\"><font color=\"#424242\"><br></font></b></p><p style=\"line-height: 2;\"><font color=\"#424242\"><b style=\"font-size: 18px; text-align: var(--bs-body-text-align);\">Compensation:</b><br></font></p><p><span style=\"font-size: 14px;\"><font color=\"#424242\">Fixed-rate, negotiable based on experience and the proposed scope of extension development.</font></span></p><p><b><span style=\"font-size: 18px;\"><font color=\"#424242\"><br></font></span></b></p><p style=\"line-height: 2;\"><b><span style=\"font-size: 18px;\"><font color=\"#424242\">Note:\r\n</font></span></b></p><p><font color=\"#424242\"><span style=\"font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">We\'re looking for a creative freelancer passionate about shaping the future of e-commerce. Successful candidates may be invited for further discussions related to the freelance project.</span><br></font></p><p><br></p><p>\r\n</p>', 'fixed', NULL, NULL, 500, '1699247558-654875c61d50c.txt', 1, 2, 0, 1, '2024-05-01 10:31:05', NULL, NULL, NULL, NULL, 0, 0, '2023-09-20 06:48:17', '2024-05-01 10:31:05'),
(12, 1, 'E-Commerce Store Project in Laravel and VueJS 3', 'project-in-laravel-and-vuejs-3', 2, 'less than a month', 'senior', '<p style=\"line-height: 1.4;\"><span style=\"font-size: 14px;\">﻿</span><span>﻿</span><span style=\"color: rgb(14, 23, 36); font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\">Embark on a transformative journey with us as we craft a cutting-edge Dynamic Collaboration Hub that seamlessly integrates Laravel and Vue.js 3. We\'re on the lookout for a skilled development team to join us in bringing this vision to life.</span></p><p><span style=\"color: rgb(14, 23, 36); font-family: Roboto, \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><br></span></p><p style=\"line-height: 2;\"><span style=\"color: rgb(14, 23, 36); font-size: 18px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><b>Project Scope:</b></span></p><p style=\"line-height: 1.4;\"><span style=\"font-size: 14px;\">Imagine a collaborative space where users can effortlessly share ideas, documents, and insights. Our goal is to create a dynamic platform that fosters real-time collaboration, harnessing the power of Laravel\'s robust backend functionalities and Vue.js 3\'s reactive and user-friendly frontend capabilities.</span></p><p><span style=\"font-size: 18px;\"><b><font color=\"#000000\"><br></font></b></span></p><p style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b><font color=\"#000000\">Key Features:</font></b></span></p><ul><li style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\"><font color=\"#000000\" style=\"\"><span style=\"font-size: 14px;\"><b>Real-Time Collaboration:</b>&nbsp;Implement Vue.js 3 for responsive remote collaboration.</span></font></span></li><li style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\"><font color=\"#000000\" style=\"\"><span style=\"font-size: 14px;\"><b>Document Management:</b> Use Laravel for remote document management,</span></font></span></li><li style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\"><font color=\"#000000\" style=\"\"><span style=\"font-size: 14px;\"><b>Task and Project Management:</b> Develop Laravel-backed project management with Vue.js 3 for an intuitive remote interface.</span></font></span></li></ul><p style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--paragraph-color); text-align: var(--bs-body-text-align);\"><font color=\"#000000\">Requirements to apply:</font></b><br></p><ul><li><span style=\"font-size: 18px;\"><font color=\"#000000\" style=\"\"><span style=\"font-size: 14px;\">Proven experience in Laravel and Vue.js 3 development.\r\n</span></font></span></li><li><span style=\"font-size: 18px;\"><font color=\"#000000\" style=\"\"><span style=\"font-size: 14px;\">Familiarity with real-time collaboration features and document management systems.\r\n</span></font></span></li><li><span style=\"font-size: 18px;\"><font color=\"#000000\" style=\"\"><span style=\"font-size: 14px;\">Ability to design and implement responsive and user-friendly interfaces.\r\n</span></font></span></li><li><span style=\"font-size: 18px;\"><font color=\"#000000\" style=\"\"><span style=\"font-size: 14px;\">Strong problem-solving skills and a creative approach to addressing project challenges.</span></font></span></li></ul><p style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b><font color=\"#000000\">\r\n</font></b></span></p><p style=\"line-height: 2;\"><b style=\"color: var(--paragraph-color); text-align: var(--bs-body-text-align);\"><span style=\"font-size: 18px;\"><font color=\"#000000\">Please apply</font></span></b><br></p><p><span style=\"font-size: 14px;\"><font color=\"#000000\">We welcome creative insights and collaborative minds. Successful candidates may be invited for a discussion to further explore the project\'s intricacies.</font></span></p>', 'fixed', NULL, NULL, 50, '1699247291-654874bba36ad.pdf', 1, 0, 1, 1, '2024-03-16 21:29:50', NULL, NULL, NULL, NULL, 0, 0, '2023-10-04 04:12:56', '2024-03-16 21:29:50'),
(13, 1, 'Extreme experience in eBay research and listings', 'extreme-experience-in-ebay-research-and-listings', 9, 'less than a week', 'not mandatory', '<p style=\"line-height: 2;\"><font color=\"#0e1724\"><span style=\"font-size: 14px;\">Are you an eBay virtuoso with a flair for turning product listings into digital masterpieces? We\'re on the lookout for a Listings Optimization Specialist with a wealth of eBay expertise. If you\'re ready to elevate our online presence and drive sales, we want to collaborate with you!</span></font></p><p><span style=\"color: rgb(14, 23, 36); font-family: Roboto, \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><br></span></p><p style=\"line-height: 2;\"><span style=\"color: rgb(14, 23, 36); font-size: 18px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><b>Responsibilities:</b></span></p><ul><li><font color=\"#0e1724\">Dive deep into the eBay realm, conducting extensive market research to uncover trends, pricing strategies, and competitive landscapes.\r\n</font></li><li><font color=\"#0e1724\">Transcend ordinary listings by optimizing existing ones, ensuring they shine in the eBay spotlight.\r\n</font></li><li><font color=\"#0e1724\">Craft captivating and SEO-friendly product listings, transforming ordinary items into must-haves.\r\n</font></li><li><font color=\"#0e1724\">Stay ahead of the eBay curve, staying attuned to policies, algorithms, and the ever-evolving art of marketplace dynamics.\r\n</font></li><li><font color=\"#0e1724\">Deploy strategies that not only enhance product visibility but orchestrate a symphony of sales.</font></li></ul><p><span style=\"font-size: 18px;\"><b><font color=\"#000000\"><br></font></b></span></p><p style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b><font color=\"#000000\">Qualifications:</font></b></span></p><ul><li>Maestro-level expertise in eBay market research and listings optimization.\r\n</li><li>A portfolio of successful eBay sales stories where your touch made all the difference.\r\n</li><li>A virtuoso\'s understanding of eBay algorithms, SEO nuances, and the intricate dance of marketplace dynamics.\r\n</li><li>A meticulous eye for detail, turning product descriptions into arias that captivate and convert.\r\n</li><li>A keen sense of harmony with eBay policies, always in sync with updates and guidelines.</li></ul><p><b style=\"font-size: 18px; color: var(--paragraph-color); text-align: var(--bs-body-text-align);\"><font color=\"#000000\"><br></font></b></p><p style=\"line-height: 2;\"><font color=\"#000000\"><span style=\"font-size: 18px;\"><b>How to Apply:</b></span></font></p><p style=\"line-height: 1.4;\"><font color=\"#000000\"><span style=\"font-size: 14px;\">If you\'re ready to be the eBay maestro we\'ve been seeking, compose your application concerto. Submit your Xilancer proposal, including your resume, a crescendo of a cover letter showcasing your experience, and a few samples of eBay listings that have hit the right notes.</span></font></p><p><br></p>', 'fixed', NULL, NULL, 100, '1699252773-65488a251c02a.pdf', 1, 0, 1, 1, '2024-06-21 01:33:35', NULL, NULL, NULL, NULL, 0, 0, '2023-11-06 00:39:33', '2024-06-21 01:33:35'),
(14, 1, 'Virtual Spanish assistant, Customer support over the phone', 'virtual-spanish-assistant--customer-support-for-phone', 3, 'less than a month', 'senior', '<p style=\"line-height: 1.4;\"><span style=\"font-size: 14px; color: rgb(14, 23, 36); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">We are seeking a Virtual Spanish Assistant with excellent communication skills to provide top-notch customer support over the phone. If you are fluent in Spanish, customer-oriented, and thrive in a remote work environment, we want to connect with you!</span><br></p><p><span style=\"color: rgb(14, 23, 36); font-family: Roboto, \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><br></span></p><p style=\"line-height: 2;\"><span style=\"color: rgb(14, 23, 36); font-size: 18px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><b>Responsibilities:</b></span></p><ul><li><font color=\"#0e1724\">Fluent in Spanish with exceptional verbal communication skills.\r\n</font></li><li><font color=\"#0e1724\">Proven experience in customer support, particularly over the phone.\r\n</font></li><li><font color=\"#0e1724\">Strong problem-solving skills and the ability to handle challenging situations.\r\n</font></li><li><font color=\"#0e1724\">Excellent organizational skills to manage and document customer interactions effectively.\r\n</font></li><li><font color=\"#0e1724\">Reliable internet connection and a quiet workspace for virtual assistance.</font></li></ul><p><span style=\"font-size: 18px;\"><b><font color=\"#000000\"><br></font></b></span></p><p style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b><font color=\"#000000\">Duration:</font></b></span></p><ul><li>This is an ongoing position with the potential for a long-term collaboration.</li></ul><p style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--paragraph-color); text-align: var(--bs-body-text-align);\"><font color=\"#000000\">Budget:</font></b><br></p><p><span style=\"font-size: 18px;\"><font color=\"#000000\" style=\"\"><span style=\"font-size: 14px;\">Open to negotiation based on experience and qualifications.</span><b>\r\n</b></font></span></p><p><span style=\"font-size: 18px;\"><b><font color=\"#000000\">\r\n</font></b></span></p><p><b><span style=\"font-size: 18px;\"><font color=\"#000000\"><br></font></span></b></p><p><b><span style=\"font-size: 18px;\"><font color=\"#000000\">Note:</font></span></b></p><p><span style=\"font-size: 14px;\"><font color=\"#000000\" style=\"\">We value diversity and encourage applications from individuals of all backgrounds. Successful candidates will undergo a brief phone interview as part of the selection process.</font></span></p>', 'fixed', NULL, NULL, 500, '1699253437-65488cbd45a82.pdf', 1, 0, 1, 1, '2024-07-22 21:19:10', NULL, NULL, NULL, NULL, 0, 0, '2023-11-06 00:50:37', '2024-07-22 21:19:10'),
(15, 1, 'I Need a English language instructor for 3 months', 'ielts-training-for-3-month', 5, 'less than a month', 'midLevel', '<p style=\"line-height: 1.6;\"><span style=\"font-size: 14px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\">We are in search of a skilled and engaging English Language Instructor to join our virtual teaching team. If you have a passion for language education and the ability to create dynamic online learning experiences, we want to hear from you!</font></span></p><p><span style=\"\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><font color=\"#424242\"><br></font></span></p><p style=\"line-height: 2;\"><span style=\"font-size: 18px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 15px;=\"\" display:=\"\" inline=\"\" !important;\"=\"\"><b><font color=\"#424242\">Responsibilities:</font></b></span></p><ul><li><font color=\"#424242\">Conduct virtual English language classes catering to a diverse audience.\r\n</font></li><li><font color=\"#424242\">Develop and execute engaging lesson plans that enhance language proficiency and communication skills.\r\n</font></li><li><font color=\"#424242\">Provide constructive feedback to students to support their learning journey.\r\n</font></li><li><font color=\"#424242\">Cultivate an inclusive and supportive online learning environment.</font></li></ul><p><span style=\"font-size: 18px;\"><b><font color=\"#424242\"><br></font></b></span></p><p style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b><font color=\"#424242\">Qualifications:</font></b></span></p><ul><li><font color=\"#424242\">Proven experience as a successful online English language instructor.\r\n</font></li><li><font color=\"#424242\">Bachelor\'s degree in English, Education, or a related field.\r\n</font></li><li><font color=\"#424242\">Native or near-native proficiency in English.\r\n</font></li><li><font color=\"#424242\">Excellent communication and interpersonal skills.\r\n</font></li><li><font color=\"#424242\">Familiarity with popular virtual teaching platforms.</font></li></ul><p><b style=\"font-size: 18px; text-align: var(--bs-body-text-align);\"><font color=\"#424242\"><br></font></b></p><p style=\"line-height: 2;\"><font color=\"#424242\"><b style=\"font-size: 18px; text-align: var(--bs-body-text-align);\">Budget:</b><br></font></p><p><span style=\"font-size: 18px;\"><font color=\"#424242\"><span style=\"font-size: 14px;\">Open to negotiation based on experience and qualifications.</span><b>\r\n</b></font></span></p><p><span style=\"font-size: 18px;\"><b><font color=\"#424242\">\r\n</font></b></span></p><p><b><span style=\"font-size: 18px;\"><font color=\"#424242\"><br></font></span></b></p><p><b><span style=\"font-size: 18px;\"><font color=\"#424242\">Please apply if you\'re only qualified.</font></span></b></p>', 'fixed', NULL, NULL, 300, '1699255170-65489382671f1.pdf', 1, 0, 1, 1, '2024-07-16 10:19:12', NULL, NULL, NULL, NULL, 0, 0, '2023-11-06 01:19:30', '2024-07-16 10:19:12'),
(16, 1, 'bbbnjioibb', 'bbbnjioibb', 4, '1 Days', 'senior', 'bniibkjlojjsosndnfo josndod josnd k idndufbfkf. kdjdb', 'fixed', NULL, NULL, 20, '1714019797-6629ddd5ef541.jpg', 1, 1, 1, 1, '2024-06-26 10:15:42', NULL, NULL, NULL, NULL, 0, 0, '2024-04-25 08:36:37', '2024-06-26 10:15:42'),
(17, 1, 'gfcccff', 'gfcccff', 3, '1 Days', 'midLevel', 'tyttty yyyuu hhyvg vgyyt fggggg gggggfgt fgggggggt', 'fixed', NULL, NULL, 10, '', 1, 0, 1, 1, '2024-06-02 20:09:26', NULL, NULL, NULL, NULL, 0, 0, '2024-04-25 16:37:30', '2024-06-02 20:09:26'),
(18, 1, 'confecção de landing page', 'confecção-de-landing-page', 2, 'less than a week', 'not mandatory', 'desenvolvimento de uma landing page de alta conversão', 'fixed', NULL, NULL, 500, '', 1, 0, 1, 1, '2024-07-20 08:16:12', NULL, NULL, NULL, NULL, 0, 0, '2024-04-26 00:03:45', '2024-07-20 08:16:12');
INSERT INTO `job_posts` (`id`, `user_id`, `title`, `slug`, `category`, `duration`, `level`, `description`, `type`, `hourly_rate`, `estimated_hours`, `budget`, `attachment`, `status`, `current_status`, `on_off`, `job_approve_request`, `last_seen`, `last_apply_date`, `meta_title`, `meta_description`, `meta_tags`, `load_from`, `is_synced`, `created_at`, `updated_at`) VALUES
(19, 1, 'Build an app for me', 'build-an-app-for-me', 2, '1 Days', 'senior', 'bla bla bla bla bla bla bla bla bla bla bla bla bla', 'fixed', NULL, NULL, 50, '', 1, 1, 0, 1, '2024-08-13 21:14:29', NULL, NULL, NULL, NULL, 0, 0, '2024-04-26 09:13:07', '2024-08-13 21:14:29'),
(20, 1, 'Mitsubishi Cedia 4WD 4g15 7 gearbox sensors?', 'mitsubishi-cedia-4wd-4g15-7-gearbox-sensors', 3, 'less than a week', 'senior', 'Looking for gearbox for a Mitsubishi Cedia 4WD 4g15 7 sensors?', 'fixed', NULL, NULL, 1000, '', 1, 0, 1, 1, '2024-08-13 21:16:10', NULL, NULL, NULL, NULL, 0, 0, '2024-04-28 13:41:08', '2024-08-13 21:16:10'),
(21, 1, 'chikhuri', 'chikhuri', 2, 'less than a week', 'senior', 'cyvjbkbufud\nberukhi hukm dbl rfk u gcs tbn very week iv zeb uc serum icc zen oj bergh', 'fixed', NULL, NULL, 50000, '1716274626-664c45c2a4586.jpg', 1, 0, 1, 1, '2024-07-22 21:23:30', NULL, NULL, NULL, NULL, 0, 0, '2024-05-21 10:57:06', '2024-07-22 21:23:30'),
(22, 525, 'Full ecommerce wbsite for groccerryy', 'full-ecommerce-wbsite-for-groccerryy', 2, '2 Days', 'midLevel', 'got it thanks for the best of the best of the best of the best of the best of the best of the best of the best of the best of the best of the best of the best of the best', 'fixed', NULL, NULL, 4000, '1716707775-6652e1bfbb23a.gif', 1, 0, 1, 1, '2024-05-26 11:23:00', NULL, NULL, NULL, NULL, 0, 0, '2024-05-26 11:16:15', '2024-05-26 11:23:00'),
(23, 1, 'digital marketing', 'digital-marketing', 11, 'less than a month', 'junior', 'I need a social media marketing manager for my work.', 'fixed', NULL, NULL, 500, '', 1, 0, 1, 1, '2024-06-15 04:38:09', NULL, NULL, NULL, NULL, 0, 0, '2024-06-07 00:10:52', '2024-06-15 04:38:09'),
(24, 1, 'video editor', 'video-editor', 1, 'less than a month', 'senior', 'Need video editors for my project, I need short videos for my channel&nbsp;', 'fixed', NULL, NULL, 20, '', 1, 0, 1, 1, '2024-08-21 06:48:39', NULL, NULL, NULL, NULL, 0, 0, '2024-06-09 11:35:19', '2024-08-21 06:48:39'),
(25, 1, 'I need a plumber for a small job in kira', 'i-need-a-plumber-for-a-small-job-in-kira', 1, '1 Days', 'not mandatory', 'I need a quick fix not later than today for a vey small plumbing work on kira', 'fixed', NULL, NULL, 100000, '', 1, 0, 1, 1, '2024-08-26 11:24:21', NULL, NULL, NULL, NULL, 0, 0, '2024-06-18 18:48:45', '2024-08-26 11:24:21'),
(26, 1, 'cover letter', 'cover-letter', 13, '3 Days', 'senior', 'Cover letter for my application during this end of yr appointment with the dealership and then we can talk about to go get back with you tomorrow at all the cat can I get my dear brother and his wife and I have to do you have any questions 🙏 I will get&nbsp;', 'fixed', NULL, NULL, 50, '', 1, 0, 1, 1, '2024-07-27 13:38:01', NULL, NULL, NULL, NULL, 0, 0, '2024-06-20 20:01:21', '2024-07-27 13:38:01'),
(27, 1, 'huu dbjd uururh ueuhrh uuurhr flutter', 'huu-dbjd-uururh-ueuhrh-uuurhr-flutter', 4, '2 Days', 'senior', 'Abhjnjay husus&nbsp; hdhd jhdjdj duujdud hhfjduf djjrndu dudjfu dujrudis sujejsis djdjjdid d rjdkjensus sheidjebsueb dhej', 'fixed', NULL, NULL, 20, '', 1, 0, 1, 1, '2024-07-31 13:18:26', NULL, NULL, NULL, NULL, 0, 0, '2024-06-27 10:22:19', '2024-07-31 13:18:26'),
(28, 1, 'English to Spanish translation', 'english-to-spanish-translation', 13, '1 Days', 'senior', 'I need a professional English to Spanish translator for my articles.', 'fixed', NULL, NULL, 50, '', 1, 1, 1, 1, '2024-07-09 13:40:16', NULL, NULL, NULL, NULL, 0, 0, '2024-07-03 16:44:58', '2024-07-09 13:40:16'),
(29, 1, 'I need someone to take my package to Jordan', 'i-need-someone-to-take-my-package-to-jordan', 3, 'less than a week', 'not mandatory', '30kg to Jordan each kelo will cost $20 or best offer l need it to be there by next week, if you have any questions please feel free to ask me your questions or place your offer&nbsp;', 'fixed', NULL, NULL, 60, '', 1, 1, 1, 1, '2024-08-02 22:54:39', NULL, NULL, NULL, NULL, 0, 0, '2024-07-09 14:13:51', '2024-08-02 22:54:39'),
(30, 1, 'chttps://play.google.com/store/apps/details?id=com.xgenious.xilancer_client', 'chttpsplaygooglecomstoreappsdetailsidcomxgeniousxilancer-client', 4, '3 Days', 'junior', 'Cvfgggggggbbvcf<div>Ccvvvvvvvbbnnnhgfddvgggggggggbnn gffffffgg vbbgfdssd vvvdsefghhbh cffffcc</div>', 'fixed', NULL, NULL, 100, '1722152860-66a5f79c8e6ac.pdf', 1, 1, 1, 1, '2024-09-02 04:21:48', NULL, NULL, NULL, NULL, 0, 0, '2024-07-28 11:47:40', '2024-09-02 04:21:48'),
(31, 1, 'Hello test post....', 'hello-test-post', 1, '1 Days', 'midLevel', '<p>asd asdn aksjdnalskd mnlkasd asd asd asdasd asd asd</p>', 'fixed', NULL, NULL, 60, '', 1, 0, 1, 1, '2024-08-29 16:29:43', NULL, NULL, NULL, NULL, 0, 0, '2024-08-01 11:38:24', '2024-08-29 16:29:43'),
(32, 1, 'need a mobile app developer', 'need-a-mobile-app-developer', 4, 'less than a week', 'not mandatory', '<p>I\'m looking for a Mobile app developer&nbsp;</p><p><br></p>', 'fixed', NULL, NULL, 1000, '', 1, 0, 1, 1, '2024-08-02 22:51:35', NULL, NULL, NULL, NULL, 0, 0, '2024-08-01 17:43:30', '2024-08-02 22:51:35'),
(33, 1, 'test sk', 'test-sk', 1, '1 Days', 'senior', '<p>Nskbskabahaiahaiah s</p><p>Ebsiabajanaba</p><p>Kabaoajaoahaaouwlrnefldh</p><p><br></p>', 'fixed', NULL, NULL, 100, '', 1, 0, 1, 1, '2024-08-21 11:16:20', NULL, NULL, NULL, NULL, 0, 0, '2024-08-05 15:38:25', '2024-08-21 11:16:20'),
(34, 1, 'I need a highly experienced laravel developer', 'i-need-a-highly-experienced-laravel-developer', 2, '3 Days', 'senior', 'We make it’s easier for talents and businesses to connect and we make it absolutely less charges. Hire Talents or Get Hired from our platform and work independently', 'fixed', NULL, NULL, 3000, '', 1, 0, 1, 1, '2024-09-02 21:35:16', NULL, NULL, NULL, NULL, 0, 0, '2024-08-21 22:39:01', '2024-09-02 21:35:16'),
(35, 1, 'I need a highly experienced laravel developer for hourly basis', 'i-need-a-highly-experienced-laravel-developer-for-hourly-basis', 2, 'less than a week', 'not mandatory', '<p>We make it’s easier for talents and businesses to connect and we make it absolutely less charges. Hire Talents or Get Hired from our platform and work independently<br></p>', 'hourly', 20, 50, 0, '', 1, 1, 1, 1, '2024-08-31 17:00:33', NULL, 'We make it’s easier for talents and businesses t', 'We make it’s easier for talents and businesses t', NULL, 0, 0, '2024-08-31 16:50:43', '2024-08-31 17:01:51'),
(36, 1, 'E-Commerce Store Project in Laravel and VueJS 3 for hourly basis', 'e-commerce-store-project-in-laravel-and-vuejs-3-for-hourly-basis', 2, 'less than 2 month', 'junior', '<p>We make it’s easier for talents and businesses to connect and we make it absolutely less charges. Hire Talents or Get Hired from our platform and work independently<br></p>', 'hourly', 30, 15, 0, '', 1, 0, 1, 1, NULL, NULL, 'Hire Talents or Get Hired from our platform', 'Hire Talents or Get Hired from our platform', NULL, 0, 0, '2024-08-31 16:54:37', '2024-08-31 16:55:35'),
(37, 1, 'hayper', 'hayper', 9, 'less than a week', 'midLevel', '<p>Test test test test results&nbsp;</p><p><br></p><p><br></p><p><br></p><p><br></p>', 'fixed', NULL, NULL, 500, '', 1, 0, 1, 1, '2024-09-02 12:08:44', NULL, NULL, NULL, NULL, 0, 0, '2024-08-31 22:34:46', '2024-09-02 12:08:44');

-- --------------------------------------------------------

--
-- Table structure for table `job_post_skills`
--

CREATE TABLE `job_post_skills` (
  `id` bigint UNSIGNED NOT NULL,
  `job_post_id` bigint NOT NULL,
  `skill_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_post_skills`
--

INSERT INTO `job_post_skills` (`id`, `job_post_id`, `skill_id`, `created_at`, `updated_at`) VALUES
(8, 3, 2, '2023-04-17 18:36:06', '2023-04-17 18:36:06'),
(9, 3, 3, '2023-04-17 18:36:06', '2023-04-17 18:36:06'),
(10, 4, 1, '2023-05-24 17:17:27', '2023-05-24 17:17:27'),
(11, 4, 2, '2023-05-24 17:17:27', '2023-05-24 17:17:27'),
(12, 5, 1, '2023-06-03 18:46:06', '2023-06-03 18:46:06'),
(13, 5, 3, '2023-06-03 18:46:06', '2023-06-03 18:46:06'),
(25, 12, 4, '2023-11-05 22:54:02', '2023-11-05 22:54:02'),
(26, 12, 6, '2023-11-05 22:54:02', '2023-11-05 22:54:02'),
(27, 12, 21, '2023-11-05 23:00:34', '2023-11-05 23:00:34'),
(28, 12, 22, '2023-11-05 23:00:34', '2023-11-05 23:00:34'),
(29, 12, 23, '2023-11-05 23:00:34', '2023-11-05 23:00:34'),
(30, 11, 4, '2023-11-05 23:12:38', '2023-11-05 23:12:38'),
(31, 11, 6, '2023-11-05 23:12:38', '2023-11-05 23:12:38'),
(33, 11, 21, '2023-11-05 23:12:38', '2023-11-05 23:12:38'),
(34, 11, 22, '2023-11-05 23:12:38', '2023-11-05 23:12:38'),
(35, 11, 23, '2023-11-05 23:12:38', '2023-11-05 23:12:38'),
(36, 11, 26, '2023-11-05 23:24:45', '2023-11-05 23:24:45'),
(37, 10, 6, '2023-11-05 23:29:22', '2023-11-05 23:29:22'),
(38, 10, 7, '2023-11-05 23:29:22', '2023-11-05 23:29:22'),
(39, 10, 20, '2023-11-05 23:29:22', '2023-11-05 23:29:22'),
(40, 10, 24, '2023-11-05 23:29:23', '2023-11-05 23:29:23'),
(41, 10, 25, '2023-11-05 23:29:23', '2023-11-05 23:29:23'),
(42, 10, 26, '2023-11-05 23:29:23', '2023-11-05 23:29:23'),
(43, 9, 28, '2023-11-05 23:37:39', '2023-11-05 23:37:39'),
(44, 9, 29, '2023-11-05 23:37:39', '2023-11-05 23:37:39'),
(45, 9, 30, '2023-11-05 23:37:39', '2023-11-05 23:37:39'),
(46, 9, 31, '2023-11-05 23:37:39', '2023-11-05 23:37:39'),
(47, 9, 32, '2023-11-05 23:37:39', '2023-11-05 23:37:39'),
(48, 7, 7, '2023-11-05 23:42:10', '2023-11-05 23:42:10'),
(49, 7, 20, '2023-11-05 23:42:10', '2023-11-05 23:42:10'),
(50, 7, 21, '2023-11-05 23:42:10', '2023-11-05 23:42:10'),
(52, 7, 33, '2023-11-05 23:44:00', '2023-11-05 23:44:00'),
(53, 7, 34, '2023-11-05 23:44:00', '2023-11-05 23:44:00'),
(54, 6, 6, '2023-11-05 23:50:58', '2023-11-05 23:50:58'),
(55, 6, 7, '2023-11-05 23:50:58', '2023-11-05 23:50:58'),
(56, 6, 10, '2023-11-05 23:50:58', '2023-11-05 23:50:58'),
(57, 6, 20, '2023-11-05 23:50:58', '2023-11-05 23:50:58'),
(58, 6, 21, '2023-11-05 23:50:58', '2023-11-05 23:50:58'),
(59, 6, 33, '2023-11-05 23:50:59', '2023-11-05 23:50:59'),
(60, 5, 35, '2023-11-06 00:02:36', '2023-11-06 00:02:36'),
(61, 5, 36, '2023-11-06 00:02:36', '2023-11-06 00:02:36'),
(62, 4, 35, '2023-11-06 00:08:39', '2023-11-06 00:08:39'),
(63, 4, 36, '2023-11-06 00:08:39', '2023-11-06 00:08:39'),
(64, 2, 37, '2023-11-06 00:20:46', '2023-11-06 00:20:46'),
(65, 2, 38, '2023-11-06 00:20:46', '2023-11-06 00:20:46'),
(66, 2, 39, '2023-11-06 00:20:46', '2023-11-06 00:20:46'),
(67, 2, 40, '2023-11-06 00:20:47', '2023-11-06 00:20:47'),
(68, 1, 37, '2023-11-06 00:24:35', '2023-11-06 00:24:35'),
(69, 1, 41, '2023-11-06 00:27:33', '2023-11-06 00:27:33'),
(70, 1, 42, '2023-11-06 00:27:33', '2023-11-06 00:27:33'),
(72, 13, 44, '2023-11-06 00:39:33', '2023-11-06 00:39:33'),
(73, 13, 46, '2023-11-06 00:45:49', '2023-11-06 00:45:49'),
(74, 13, 47, '2023-11-06 00:45:49', '2023-11-06 00:45:49'),
(75, 13, 48, '2023-11-06 00:45:49', '2023-11-06 00:45:49'),
(77, 14, 49, '2023-11-06 00:58:33', '2023-11-06 00:58:33'),
(78, 14, 50, '2023-11-06 00:58:33', '2023-11-06 00:58:33'),
(79, 14, 51, '2023-11-06 00:58:33', '2023-11-06 00:58:33'),
(80, 15, 52, '2023-11-06 01:19:30', '2023-11-06 01:19:30'),
(81, 15, 53, '2023-11-06 01:19:30', '2023-11-06 01:19:30'),
(82, 15, 54, '2023-11-06 01:19:30', '2023-11-06 01:19:30'),
(84, 8, 45, '2023-11-06 02:03:51', '2023-11-06 02:03:51'),
(85, 8, 47, '2023-11-06 02:03:51', '2023-11-06 02:03:51'),
(86, 8, 53, '2023-11-06 02:03:51', '2023-11-06 02:03:51'),
(87, 8, 56, '2023-11-06 02:03:51', '2023-11-06 02:03:51'),
(88, 8, 57, '2023-11-06 02:03:51', '2023-11-06 02:03:51'),
(89, 15, 55, '2023-11-24 23:14:47', '2023-11-24 23:14:47'),
(91, 17, 1, '2024-04-25 16:37:30', '2024-04-25 16:37:30'),
(92, 17, 3, '2024-04-25 16:37:30', '2024-04-25 16:37:30'),
(93, 17, 4, '2024-04-25 16:37:30', '2024-04-25 16:37:30'),
(94, 18, 7, '2024-04-26 00:03:45', '2024-04-26 00:03:45'),
(95, 18, 22, '2024-04-26 00:03:45', '2024-04-26 00:03:45'),
(96, 16, 2, '2024-04-26 06:54:55', '2024-04-26 06:54:55'),
(97, 19, 2, '2024-04-26 09:13:07', '2024-04-26 09:13:07'),
(98, 20, 1, '2024-04-28 13:41:08', '2024-04-28 13:41:08'),
(99, 21, 7, '2024-05-21 10:57:06', '2024-05-21 10:57:06'),
(100, 21, 4, '2024-05-21 10:57:06', '2024-05-21 10:57:06'),
(101, 22, 6, '2024-05-26 11:16:15', '2024-05-26 11:16:15'),
(102, 23, 1, '2024-06-07 00:10:52', '2024-06-07 00:10:52'),
(103, 24, 29, '2024-06-09 11:35:19', '2024-06-09 11:35:19'),
(104, 25, 2, '2024-06-18 18:48:45', '2024-06-18 18:48:45'),
(105, 26, 38, '2024-06-20 20:01:21', '2024-06-20 20:01:21'),
(106, 27, 2, '2024-06-27 10:22:19', '2024-06-27 10:22:19'),
(107, 28, 37, '2024-07-03 16:44:58', '2024-07-03 16:44:58'),
(108, 29, 2, '2024-07-09 14:13:51', '2024-07-09 14:13:51'),
(109, 30, 1, '2024-07-28 11:47:40', '2024-07-28 11:47:40'),
(110, 31, 2, '2024-08-01 11:38:25', '2024-08-01 11:38:25'),
(111, 32, 3, '2024-08-01 17:43:30', '2024-08-01 17:43:30'),
(112, 33, 4, '2024-08-05 15:38:25', '2024-08-05 15:38:25'),
(113, 34, 4, '2024-08-21 22:39:02', '2024-08-21 22:39:02'),
(114, 34, 6, '2024-08-21 22:39:02', '2024-08-21 22:39:02'),
(115, 34, 7, '2024-08-21 22:39:02', '2024-08-21 22:39:02'),
(116, 34, 20, '2024-08-21 22:39:02', '2024-08-21 22:39:02'),
(117, 34, 10, '2024-08-21 22:39:02', '2024-08-21 22:39:02'),
(118, 34, 21, '2024-08-21 22:39:02', '2024-08-21 22:39:02'),
(119, 34, 23, '2024-08-21 22:39:02', '2024-08-21 22:39:02'),
(120, 34, 27, '2024-08-21 22:39:02', '2024-08-21 22:39:02'),
(121, 34, 26, '2024-08-21 22:39:02', '2024-08-21 22:39:02'),
(122, 35, 4, '2024-08-31 16:50:43', '2024-08-31 16:50:43'),
(123, 35, 6, '2024-08-31 16:50:43', '2024-08-31 16:50:43'),
(124, 36, 2, '2024-08-31 16:54:37', '2024-08-31 16:54:37'),
(125, 36, 3, '2024-08-31 16:54:37', '2024-08-31 16:54:37'),
(126, 36, 6, '2024-08-31 16:54:37', '2024-08-31 16:54:37'),
(127, 37, 1, '2024-08-31 22:34:46', '2024-08-31 22:34:46');

-- --------------------------------------------------------

--
-- Table structure for table `job_post_sub_categories`
--

CREATE TABLE `job_post_sub_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `job_post_id` bigint NOT NULL,
  `sub_category_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_post_sub_categories`
--

INSERT INTO `job_post_sub_categories` (`id`, `job_post_id`, `sub_category_id`, `created_at`, `updated_at`) VALUES
(5, 3, 21, '2023-04-17 18:36:06', '2023-04-17 18:36:06'),
(7, 5, 6, '2023-06-03 18:46:06', '2023-06-03 18:46:06'),
(8, 5, 8, '2023-06-03 18:46:06', '2023-06-03 18:46:06'),
(9, 6, 1, '2023-06-05 17:13:55', '2023-06-05 17:13:55'),
(10, 7, 1, '2023-09-11 06:45:09', '2023-09-11 06:45:09'),
(12, 9, 2, '2023-09-20 06:04:28', '2023-09-20 06:04:28'),
(18, 12, 20, '2023-11-05 22:54:02', '2023-11-05 22:54:02'),
(19, 12, 21, '2023-11-05 22:54:02', '2023-11-05 22:54:02'),
(20, 12, 22, '2023-11-05 22:54:02', '2023-11-05 22:54:02'),
(21, 11, 20, '2023-11-05 23:12:38', '2023-11-05 23:12:38'),
(22, 11, 21, '2023-11-05 23:12:38', '2023-11-05 23:12:38'),
(23, 11, 22, '2023-11-05 23:12:38', '2023-11-05 23:12:38'),
(24, 10, 21, '2023-11-05 23:29:22', '2023-11-05 23:29:22'),
(25, 10, 22, '2023-11-05 23:29:22', '2023-11-05 23:29:22'),
(27, 7, 24, '2023-11-05 23:42:10', '2023-11-05 23:42:10'),
(28, 6, 24, '2023-11-05 23:50:58', '2023-11-05 23:50:58'),
(29, 5, 5, '2023-11-06 00:01:23', '2023-11-06 00:01:23'),
(30, 5, 7, '2023-11-06 00:01:23', '2023-11-06 00:01:23'),
(31, 4, 5, '2023-11-06 00:08:39', '2023-11-06 00:08:39'),
(32, 4, 6, '2023-11-06 00:08:39', '2023-11-06 00:08:39'),
(33, 4, 7, '2023-11-06 00:08:39', '2023-11-06 00:08:39'),
(34, 4, 8, '2023-11-06 00:08:39', '2023-11-06 00:08:39'),
(35, 2, 26, '2023-11-06 00:17:12', '2023-11-06 00:17:12'),
(36, 2, 33, '2023-11-06 00:17:12', '2023-11-06 00:17:12'),
(37, 1, 26, '2023-11-06 00:24:35', '2023-11-06 00:24:35'),
(38, 1, 32, '2023-11-06 00:24:35', '2023-11-06 00:24:35'),
(39, 1, 31, '2023-11-06 00:28:07', '2023-11-06 00:28:07'),
(41, 13, 35, '2023-11-06 00:45:49', '2023-11-06 00:45:49'),
(43, 14, 36, '2023-11-06 00:58:33', '2023-11-06 00:58:33'),
(45, 15, 37, '2023-11-06 01:24:11', '2023-11-06 01:24:11'),
(46, 8, 29, '2023-11-06 02:00:25', '2023-11-06 02:00:25'),
(49, 17, 36, '2024-04-25 16:37:30', '2024-04-25 16:37:30'),
(50, 18, 21, '2024-04-26 00:03:45', '2024-04-26 00:03:45'),
(51, 16, 6, '2024-04-26 06:54:55', '2024-04-26 06:54:55'),
(52, 16, 7, '2024-04-26 06:54:55', '2024-04-26 06:54:55'),
(53, 19, 3, '2024-04-26 09:13:07', '2024-04-26 09:13:07'),
(54, 20, 36, '2024-04-28 13:41:08', '2024-04-28 13:41:08'),
(55, 21, 20, '2024-05-21 10:57:06', '2024-05-21 10:57:06'),
(56, 22, 3, '2024-05-26 11:16:15', '2024-05-26 11:16:15'),
(57, 22, 21, '2024-05-26 11:16:15', '2024-05-26 11:16:15'),
(58, 22, 22, '2024-05-26 11:16:15', '2024-05-26 11:16:15'),
(59, 23, 34, '2024-06-07 00:10:52', '2024-06-07 00:10:52'),
(60, 24, 2, '2024-06-09 11:35:19', '2024-06-09 11:35:19'),
(61, 25, 2, '2024-06-18 18:48:45', '2024-06-18 18:48:45'),
(62, 26, 26, '2024-06-20 20:01:21', '2024-06-20 20:01:21'),
(63, 27, 5, '2024-06-27 10:22:19', '2024-06-27 10:22:19'),
(64, 28, 32, '2024-07-03 16:44:58', '2024-07-03 16:44:58'),
(65, 29, 36, '2024-07-09 14:13:51', '2024-07-09 14:13:51'),
(66, 30, 5, '2024-07-28 11:47:40', '2024-07-28 11:47:40'),
(67, 31, 2, '2024-08-01 11:38:24', '2024-08-01 11:38:24'),
(68, 32, 5, '2024-08-01 17:43:30', '2024-08-01 17:43:30'),
(69, 33, 2, '2024-08-05 15:38:25', '2024-08-05 15:38:25'),
(70, 34, 20, '2024-08-21 22:39:02', '2024-08-21 22:39:02'),
(71, 35, 20, '2024-08-31 16:50:43', '2024-08-31 16:50:43'),
(72, 35, 21, '2024-08-31 16:50:43', '2024-08-31 16:50:43'),
(73, 36, 20, '2024-08-31 16:54:37', '2024-08-31 16:54:37'),
(74, 36, 21, '2024-08-31 16:54:37', '2024-08-31 16:54:37'),
(75, 37, 35, '2024-08-31 22:34:46', '2024-08-31 22:34:46');

-- --------------------------------------------------------

--
-- Table structure for table `job_proposals`
--

CREATE TABLE `job_proposals` (
  `id` bigint UNSIGNED NOT NULL,
  `job_id` bigint NOT NULL,
  `freelancer_id` bigint NOT NULL,
  `client_id` bigint NOT NULL,
  `amount` double NOT NULL,
  `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revision` int NOT NULL DEFAULT '0',
  `cover_letter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=pending, 1=accept, 2=reject',
  `is_hired` tinyint NOT NULL DEFAULT '0' COMMENT '0=no, 1=yes',
  `is_short_listed` tinyint NOT NULL DEFAULT '0' COMMENT '0=no, 1=yes',
  `is_interview_take` tinyint NOT NULL DEFAULT '0' COMMENT '0=no, 1=yes',
  `is_view` tinyint NOT NULL DEFAULT '0' COMMENT '0=no, 1=yes',
  `is_rejected` tinyint NOT NULL DEFAULT '0' COMMENT '0=no, 1=yes',
  `load_from` int NOT NULL DEFAULT '0',
  `is_synced` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_proposals`
--

INSERT INTO `job_proposals` (`id`, `job_id`, `freelancer_id`, `client_id`, `amount`, `duration`, `revision`, `cover_letter`, `attachment`, `status`, `is_hired`, `is_short_listed`, `is_interview_take`, `is_view`, `is_rejected`, `load_from`, `is_synced`, `created_at`, `updated_at`) VALUES
(1, 11, 7, 1, 500, 'Less than a month', 3, 'We are looking for skilled and experienced LARAVEL and JS developer.\r\n\r\nWe have ecommerce system build in Laravel and we want to further extend it.\r\n\r\n* We will be adding new features (enhance search, add filters, improve listings)\r\n\r\n* We are already hosting multiple stores in our system with ability to run their own products and categories\r\n\r\n* We want to make it for wholesalers with large amount of products\r\n\r\n* Connecting Paypal API', '1699351779-654a0ce3075f8.pdf', 0, 1, 1, 1, 1, 0, 0, 0, '2023-11-07 04:09:39', '2024-03-25 14:37:18'),
(2, 10, 7, 1, 300, 'Less than 2 month', 4, '- Experience in building and adding new features to existing software\r\n\r\n- Strong problem-solving skills and attention to detail\r\n\r\n- Ability to collaborate with a team and communicate effectively', '1699356664-654a1ff8dcdb9.pdf', 0, 0, 1, 1, 1, 0, 0, 0, '2023-11-07 05:31:04', '2024-03-25 14:42:37'),
(3, 13, 7, 1, 100, 'Less than 2 month', 3, 'I am looking for someone with extreme experience in eBay research and listings to assist with listing optimization and management.- I am open to any', '1699362821-654a3805d08da.pdf', 0, 1, 1, 1, 1, 0, 0, 0, '2023-11-07 07:13:41', '2024-04-26 06:56:58'),
(4, 4, 7, 1, 3, '3 Days', 2, 'vijnkbjbnnklookkkmbnnjn.  joining i ono only hb ob i j i knub ibnk ki.  i. j ni I I I I I bbnnnnbb. ñ nnnnnnbbbnnnnnnn chhoodaayen guddi hii giggles cufflinks giggleskk ji', '1702953046-658100561afa1.png', 0, 0, 0, 1, 1, 0, 0, 0, '2023-12-18 20:30:46', '2023-12-24 17:26:59'),
(5, 1, 7, 1, 2, '3 Days', 1, 'ghcgbbbvbbhhhh bhhhhjui hhjjiii hhjiio jjjjjj ghcgbbbvbbhhhh bhhhhjui hhjjiii hhjiio jjjjjj jjkkkk ghcgbbbvbbhhhh bhhhhjui hhjjiii hhjiio jjjjjj jjkkkk', '', 0, 0, 0, 0, 1, 0, 0, 0, '2023-12-18 22:15:49', '2024-06-10 17:18:01'),
(6, 2, 7, 1, 2, '1 Days', 96, 'vvghjkkkkxixixixixixickkckckckckckckioo I kkocii iko i ii I kiiijjhhjoskkdoodbbbbbbbkiiijjhhjoskkdoodbbbbbbbbbkiiijjhhjoskkdoodbbbbbbbbbbkiiijjhhjoskkdoodbbbbbbbbbbbbbkdkhhhhhbbbkdkhhhhhbbbbkdkhhhhhbbbbbbkdkhhhhh', '', 0, 0, 0, 0, 1, 0, 0, 0, '2023-12-29 12:50:47', '2024-01-23 01:12:53'),
(7, 12, 7, 1, 20, '1 Days', 50, 'ok hospital acompanha Hugol Goiânia Goiás...................................okbhfhcfhbcxhbvffghjiidsxvjijcdsebjirthcf', '', 0, 0, 0, 1, 1, 0, 0, 0, '2024-01-01 06:43:02', '2024-03-16 21:31:03'),
(8, 7, 7, 1, 100, '1 Days', 50, 'dhvhvvhhjjjjkk jjjjkio njjio jiooooooo jjiiooo ijjjjjjji jjjjjjjjiiii jjjjjjjiii jjjuu jjjjjjjjiii ijiiiiiiiuiiiiiiijjiììjjjhhjhiujhjgj', '', 0, 0, 0, 1, 1, 0, 0, 0, '2024-01-07 04:11:02', '2024-01-26 00:50:46'),
(9, 15, 7, 1, 57, '3 Days', 5, 'ghhhbzbzbzbsbsbbdbdbbbvvkjiiiiiu all all dj FG gzhshdhdhhdhdhfhdhdhjdjfjfudufufudjfjjfjfjdjjfjfjfjfjjfjfgzhshdhdhhdhdhfhdhdhjdjfjfudufufudjfjjfjgzhshdhdhhdhdhfhdhdhjdjfjfudufufudjfjjfjfjdjjfjfjfjfjjfjffjdjjfjfjfjfjjfjf', '', 0, 1, 0, 1, 1, 0, 0, 0, '2024-01-11 07:39:18', '2024-06-14 10:38:24'),
(10, 5, 7, 1, 200, 'less than a month', 50, 'hihhjjhjhhhgyugucuvov8vjuhhuijjkvivivijguhhhjjjhjhjjjjkkkjhhhhuujujikkkkiikikkjujjhhgccccccggghhhuuuu777uhvbbbbbbju9lnbvcchgghhhhhhhhhhhhhhhhhhhhhhhvv', '', 0, 1, 0, 0, 1, 0, 0, 0, '2024-01-23 05:33:43', '2024-06-10 17:19:13'),
(11, 6, 7, 1, 25, '1 Days', 6, 'hdndjs nsjsjjsjeje dndndjjsjd dndndjjsjd dndjdjjs dndjdjdjsjjdd dndndjjsjd dndjdjdjejdjd dndjdjjs dndjdjdijdj ndndjjjsjjdjdjjd ndjdkdkskndndjjdd', '', 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-26 14:11:34', '2024-01-26 14:11:34'),
(12, 14, 7, 1, 100, '2 Days', 1, 'hiihkvdhbxbbcbncvbccvnnnkkkjczasfunvxzvnkhdzcnnxXbjgdxbnvxzvnnvxzvngdzxXchhhbthjxxbnmhxxvnjute nidvnbgjccuvibuvyxycuvuctxycuchxgxjvkbkbjctxtsrstcuvivucfzrzuvj hfzrsvivhxrxyvj gzesycjcbxseuknvxx', '1706352134-65b4de060a770.jpg', 0, 1, 0, 1, 1, 0, 0, 0, '2024-01-27 04:42:14', '2024-04-19 05:51:46'),
(13, 8, 7, 2, 100, 'less than a week', 8, 'human hsksbsjsssjsksjsjsnsksnenjeenenenenenebbeenenebjebeneekjeenendnendnnendnednhjdnenejejjje njjhje jejejejkke jdjejendjendnnd', '', 0, 0, 0, 0, 0, 0, 0, 0, '2024-02-13 09:31:46', '2024-02-13 09:31:46'),
(14, 16, 7, 1, 10, '2 Days', 0, 'ggj. hhjgf hgvhhhbbbnnnnnnnvbhvnvbvvvhvvvv mcg Bangladesh bbb bbb mmHg NBC nccc bbb bbbvvvhhhhhhggghhhhhhjjkjjjhhhhjjjhjjhhjjjjhggbnnbnnnnnnnbbbhjjgjohhjjbb', '', 0, 1, 1, 1, 1, 0, 0, 0, '2024-04-25 15:47:30', '2024-06-25 11:00:55'),
(15, 19, 7, 1, 50, '1 Days', 50, '\"Let\'s explore uncharted territories together. Adventure awaits. Will you join me?\"\"Let\'s explore uncharted territories together. Adventure awaits. Will you join me?\"', '', 0, 1, 0, 1, 1, 0, 0, 0, '2024-04-26 09:18:22', '2024-08-13 21:14:58'),
(16, 20, 7, 1, 900, '1 Days', 0, 'The geatbox comes with upgraded version of caliver which ensures no slipping occurs. We will also offer free delivery to Mwembe tayari bus stage using chania bus within w daus of making a deposit.', '1714358031-662f070fcb7a1.jpg', 0, 1, 1, 1, 1, 0, 0, 0, '2024-04-29 06:33:51', '2024-08-13 21:16:23'),
(17, 22, 8, 525, 3500, 'less than a week', 11, 't ghost was you are now get out of breath away from egeria jcohc t ghost was you are now get out of breath away from egeria jcohc t ghost was you are now get out of breath away from egeria jcohc', '1716708173-6652e34d644c4.jpg', 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-26 11:22:53', '2024-05-26 11:22:53'),
(18, 28, 7, 1, 30, '1 Days', 10, 'Dear Sir, this is a test proposal. ajajskdkfjf dja ajd aid wiagx. fishagd xTttttttttt I hope you gonna reply to me', '', 0, 1, 1, 0, 1, 0, 0, 0, '2024-07-03 16:52:53', '2024-07-06 00:01:20'),
(19, 29, 7, 1, 60, 'less than a week', 100, 'I am going to jordan next Friday call me 04055443245\nhrhhfuuhnhfvjj hghuj hfuij fdyj sigh gfhjgg gdgjbg gregjj gdyujh gdhknv tyftubcdhjbffuj hgdgjk fstujj', '', 0, 1, 1, 1, 1, 0, 0, 0, '2024-07-09 14:16:58', '2024-07-23 14:59:39'),
(20, 17, 7, 1, 9, '1 Days', 2, 'okay okay okay okay okay okay okay okay okay okay okay okay okay okay okay okay okay okay okay okay okay okay okay okay okay okay okay okay okay okay okay okay okay', '', 0, 0, 0, 0, 0, 0, 0, 0, '2024-07-11 23:37:21', '2024-07-11 23:37:21'),
(21, 30, 7, 1, 90, 'less than a week', 90, 'https://play.google.com/store/apps/details?id=com.xgenious.xilancer_client https://play.google.com/store/apps/details?id=com.xgenious.xilancer_clienthttps://play.google.com/store/apps/details?id=com.xgenious.xilancer_client', '', 0, 1, 0, 1, 1, 0, 0, 0, '2024-07-28 11:50:34', '2024-08-16 21:58:05'),
(22, 9, 7, 1, 10, '2 Days', 15, 'hi\nhsbdjd\nndnx\ndhdjdahhd\ndhdkdkfjfgj shdjdjd dhsbdjs sjsjshs djsjdjd dhdjdjd djdjdjd djdjdjd djdjdjd djdjd djdjdjd jsbahs sksnevsd dndnsns sndjdnd sbsjsjwi shateis sjsiisgwb shdjd shesh desh shajs\n\nthank you', '1722749169-66af10f1270c4.jpg', 0, 0, 0, 0, 0, 0, 0, 0, '2024-08-04 09:26:09', '2024-08-04 09:26:09'),
(23, 22, 7, 525, 4000, 'less than 2 month', 5, 'gffggtggghhhh\nhhbbhhhj\nnnnhhbhhhhhhhhhhh gffggtggghhhh\nhhbbhhhj\nnnnhhbhhhhhhhhhhhgffggtggghhhh\nhhbbhhhj\nnnnhhbhhhhhhhhhhhgffggtggghhhh\nhhbbhhhj\nnnnhhbhhhhhhhhhhhgffggtggghhhh\nhhbbhhhj\nnnnhhbhhhhhhhhhhh', '', 0, 0, 0, 0, 0, 0, 0, 0, '2024-08-04 13:27:21', '2024-08-04 13:27:21'),
(24, 35, 7, 1, 20, 'Less than a week', 12, 'hi i am ready to accept your task', '', 0, 1, 0, 0, 1, 0, 0, 0, '2024-08-31 16:57:37', '2024-08-31 17:00:47'),
(25, 37, 7, 1, 25, '3 Days', 2, 'test test test testtetststststsgshfkkdkskskkrkfkfkkskskfnfkfkkddmfnglglgkdbsbdfkflskkskfkfkdkdnsnsndnfkfkkfkxxkdkndnfnfkflglgldkddnnd', '', 0, 0, 0, 0, 0, 0, 0, 0, '2024-09-02 22:18:21', '2024-09-02 22:18:21');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `slug`, `direction`, `status`, `default`, `created_at`, `updated_at`) VALUES
(1, 'English (UK)', 'en_GB', 'ltr', 'publish', 1, '2023-05-07 04:56:35', '2024-03-10 16:30:35');

-- --------------------------------------------------------

--
-- Table structure for table `live_chats`
--

CREATE TABLE `live_chats` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint DEFAULT NULL,
  `freelancer_id` bigint DEFAULT NULL,
  `admin_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_chat_messages`
--

CREATE TABLE `live_chat_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `live_chat_id` bigint UNSIGNED NOT NULL,
  `from_user` int NOT NULL COMMENT '1 = client, 2 = freelancer, 3 = admin',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_seen` tinyint NOT NULL DEFAULT '0' COMMENT '0=unseen, 1=seen',
  `load_from` int NOT NULL DEFAULT '0',
  `is_synced` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_activities`
--

CREATE TABLE `log_activities` (
  `id` bigint UNSIGNED NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_uploads`
--

CREATE TABLE `media_uploads` (
  `id` bigint UNSIGNED NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `size` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dimensions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `user_id` bigint DEFAULT NULL,
  `load_from` int NOT NULL DEFAULT '0',
  `is_synced` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_uploads`
--

INSERT INTO `media_uploads` (`id`, `title`, `path`, `alt`, `size`, `dimensions`, `type`, `user_id`, `load_from`, `is_synced`, `created_at`, `updated_at`) VALUES
(1, 'argentina_640.png', 'argentina-6401670821936.png', NULL, '138.92 KB', '640 x 480 pixels', 'admin', 1, 0, 0, '2022-12-11 23:12:16', '2022-12-11 23:12:16'),
(2, 'image (1).png', 'image-11670822077.png', NULL, '106.68 KB', '555 x 537 pixels', 'admin', 1, 0, 0, '2022-12-11 23:14:37', '2022-12-11 23:14:37'),
(3, 'image (1).png', 'image-11670822746.png', NULL, '106.68 KB', '555 x 537 pixels', 'admin', 1, 0, 0, '2022-12-11 23:25:46', '2022-12-11 23:25:46'),
(4, 'image (1).png', 'image-11670822997.png', NULL, '106.68 KB', '555 x 537 pixels', 'admin', 1, 0, 0, '2022-12-11 23:29:57', '2022-12-11 23:29:57'),
(5, 'image (1).png', 'image-11670824513.png', NULL, '106.68 KB', '555 x 537 pixels', 'admin', 1, 0, 0, '2022-12-11 23:55:13', '2022-12-11 23:55:13'),
(6, 'image.png', 'image1671357828.png', NULL, '6.03 KB', '287 x 178 pixels', 'admin', 1, 0, 0, '2022-12-18 04:03:48', '2022-12-18 04:03:48'),
(7, 'argentina_640.png', 'argentina-6401671518921.png', NULL, '138.92 KB', '640 x 480 pixels', 'admin', 1, 0, 0, '2022-12-20 00:48:41', '2022-12-20 00:48:41'),
(8, 'IMG_7485.png', 'img-74851671620331.png', NULL, '5.2 MB', '1170 x 2532 pixels', 'admin', 1, 0, 0, '2022-12-21 04:58:52', '2022-12-21 04:58:52'),
(9, 'image.png', 'image1671621252.png', NULL, '6.03 KB', '287 x 178 pixels', 'admin', 1, 0, 0, '2022-12-21 05:14:12', '2022-12-21 05:14:12'),
(10, 'argentina_640.png', 'argentina-6401671628954.png', NULL, '138.92 KB', '640 x 480 pixels', 'admin', 1, 0, 0, '2022-12-21 07:22:35', '2022-12-21 07:22:35'),
(11, 'author.jpg', 'author1675076010.jpg', NULL, '3.55 KB', '80 x 80 pixels', 'admin', NULL, 0, 0, '2023-01-30 04:53:30', '2023-01-30 04:53:30'),
(12, '404.png', '4041676181010.png', NULL, '10.45 KB', '656 x 500 pixels', 'admin', 1, 0, 0, '2023-02-11 23:50:10', '2023-02-11 23:50:10'),
(13, 'account_s6.svg', 'account_s61676182380.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-02-12 00:13:00', '2023-02-12 00:13:00'),
(14, 'account_s2.svg', 'account_s21676182415.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-02-12 00:13:35', '2023-02-12 00:13:35'),
(15, 'account_s5.svg', 'account_s51676182840.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-02-12 00:20:40', '2023-02-12 00:20:40'),
(16, 'account_s3.svg', 'account_s31676182896.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-02-12 00:21:36', '2023-02-12 00:21:36'),
(17, 'account_s1.svg', 'account_s11676182965.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-02-12 00:22:45', '2023-02-12 00:22:45'),
(18, 'account_s2.svg', 'account_s21676183067.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-02-12 00:24:27', '2023-02-12 00:24:27'),
(19, 'account_s3.svg', 'account_s31676183272.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-02-12 00:27:52', '2023-02-12 00:27:52'),
(20, 'account_s4.svg', 'account_s41676183896.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-02-12 00:38:16', '2023-02-12 00:38:16'),
(21, 'account_s5.svg', 'account_s51676183967.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-02-12 00:39:27', '2023-02-12 00:39:27'),
(22, 'account_s6.svg', 'account_s61676184022.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-02-12 00:40:22', '2023-02-12 00:40:22'),
(23, 'account_s7.svg', 'account_s71676184081.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-02-12 00:41:21', '2023-02-12 00:41:21'),
(24, 'account_s8.svg', 'account_s81676184135.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-02-12 00:42:15', '2023-02-12 00:42:15'),
(25, 'account_s9.svg', 'account_s91676184207.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-02-12 00:43:27', '2023-02-12 00:43:27'),
(26, 'login_page.png', 'login_page1680158041.png', NULL, '169.27 KB', '838 x 645 pixels', 'admin', 1, 0, 0, '2023-03-30 00:34:01', '2023-03-30 00:34:01'),
(27, 'appStore-shapes.svg', 'appStore-shapes1680158077.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-03-30 00:34:37', '2023-03-30 00:34:37'),
(28, 'fr_1.png', 'fr_11680161260.png', NULL, '163.44 KB', '905 x 645 pixels', 'admin', 1, 0, 0, '2023-03-30 01:27:40', '2023-03-30 01:27:40'),
(29, 'fr_2.png', 'fr_21680162933.png', NULL, '140.79 KB', '905 x 699 pixels', 'admin', 1, 0, 0, '2023-03-30 01:55:33', '2023-03-30 01:55:33'),
(30, 'favicon.png', 'favicon1680407178.png', NULL, '855 ', '40 x 40 pixels', 'admin', 1, 0, 0, '2023-04-01 21:46:18', '2023-04-01 21:46:18'),
(31, 'logo.png', 'logo1680407228.png', NULL, '2.37 KB', '201 x 40 pixels', 'admin', 1, 0, 0, '2023-04-01 21:47:08', '2023-04-01 21:47:08'),
(32, 'white-logo.png', 'white-logo1680497717.png', NULL, '2.82 KB', '280 x 56 pixels', 'admin', 1, 0, 0, '2023-04-02 22:55:18', '2023-04-02 22:55:18'),
(33, 'dashboard_logo.png', 'dashboard_logo1680498170.png', NULL, '1.09 KB', '200 x 40 pixels', 'admin', 1, 0, 0, '2023-04-02 23:02:50', '2023-04-02 23:02:50'),
(34, 'Group 1171274876.png', 'Group 11712748761680683992.png', NULL, '1.2 KB', '60 x 40 pixels', 'admin', 1, 0, 0, '2023-04-05 02:39:52', '2023-04-05 02:39:52'),
(35, 'Group 1171274878.png', 'Group 11712748781680684016.png', NULL, '984 ', '60 x 40 pixels', 'admin', 1, 0, 0, '2023-04-05 02:40:16', '2023-04-05 02:40:16'),
(36, 'Group 1171274879.png', 'Group 11712748791680684063.png', NULL, '1.09 KB', '60 x 40 pixels', 'admin', 1, 0, 0, '2023-04-05 02:41:03', '2023-04-05 02:41:03'),
(37, 'Group 1171274880.png', 'Group 11712748801680684063.png', NULL, '1.15 KB', '60 x 40 pixels', 'admin', 1, 0, 0, '2023-04-05 02:41:03', '2023-04-05 02:41:03'),
(38, 'Group 1171274881.png', 'Group 11712748811680684064.png', NULL, '810 ', '60 x 40 pixels', 'admin', 1, 0, 0, '2023-04-05 02:41:04', '2023-04-05 02:41:04'),
(39, 'Group 1171274882.png', 'Group 11712748821680684064.png', NULL, '1 KB', '59 x 40 pixels', 'admin', 1, 0, 0, '2023-04-05 02:41:04', '2023-04-05 02:41:04'),
(40, 'Group 1171274883.png', 'Group 11712748831680684064.png', NULL, '1.28 KB', '60 x 40 pixels', 'admin', 1, 0, 0, '2023-04-05 02:41:04', '2023-04-05 02:41:04'),
(41, 'Group 1171274887.png', 'Group 11712748871680684064.png', NULL, '1.32 KB', '60 x 40 pixels', 'admin', 1, 0, 0, '2023-04-05 02:41:04', '2023-04-05 02:41:04'),
(42, 'Group 1171274889.png', 'Group 11712748891680684065.png', NULL, '1.52 KB', '60 x 40 pixels', 'admin', 1, 0, 0, '2023-04-05 02:41:05', '2023-04-05 02:41:05'),
(43, 'Group 1171274891.png', 'Group 11712748911680684065.png', NULL, '1.38 KB', '59 x 40 pixels', 'admin', 1, 0, 0, '2023-04-05 02:41:05', '2023-04-05 02:41:05'),
(44, 'Group 1171274892.png', 'Group 11712748921680684065.png', NULL, '2.74 KB', '60 x 40 pixels', 'admin', 1, 0, 0, '2023-04-05 02:41:05', '2023-04-05 02:41:05'),
(45, 'Group 1171274896.png', 'Group 11712748961680684065.png', NULL, '1.41 KB', '60 x 40 pixels', 'admin', 1, 0, 0, '2023-04-05 02:41:05', '2023-04-05 02:41:05'),
(46, 'Group 1171274884.png', 'Group 11712748841680684099.png', NULL, '907 ', '60 x 40 pixels', 'admin', 1, 0, 0, '2023-04-05 02:41:39', '2023-04-05 02:41:39'),
(47, 'Group 1171274885.png', 'Group 11712748851680684099.png', NULL, '1.66 KB', '60 x 40 pixels', 'admin', 1, 0, 0, '2023-04-05 02:41:39', '2023-04-05 02:41:39'),
(48, 'Group 1171274886.png', 'Group 11712748861680684099.png', NULL, '1.63 KB', '60 x 40 pixels', 'admin', 1, 0, 0, '2023-04-05 02:41:40', '2023-04-05 02:41:40'),
(49, 'Group 1171274897.png', 'Group 11712748971680684099.png', NULL, '1.84 KB', '59 x 40 pixels', 'admin', 1, 0, 0, '2023-04-05 02:41:40', '2023-04-05 02:41:40'),
(50, 'Group 1171274898.png', 'Group 11712748981680684100.png', NULL, '1.36 KB', '59 x 40 pixels', 'admin', 1, 0, 0, '2023-04-05 02:41:40', '2023-04-05 02:41:40'),
(51, 'Group 1171274877.png', 'Group 11712748771680684126.png', NULL, '1.06 KB', '60 x 40 pixels', 'admin', 1, 0, 0, '2023-04-05 02:42:06', '2023-04-05 02:42:06'),
(52, 'toyyibpay.png', 'toyyibpay1681269588.png', NULL, '1.78 KB', '115 x 40 pixels', 'admin', 1, 0, 0, '2023-04-11 21:19:48', '2023-04-11 21:19:48'),
(53, 'toybppay.png', 'toybppay1681276253.png', NULL, '1014 ', '60 x 40 pixels', 'admin', 1, 0, 0, '2023-04-11 23:10:54', '2023-04-11 23:10:54'),
(54, 'pagali.png', 'pagali1681276333.png', NULL, '993 ', '60 x 40 pixels', 'admin', 1, 0, 0, '2023-04-11 23:12:13', '2023-04-11 23:12:13'),
(55, 'authorize.png', 'authorize1681276383.png', NULL, '2.01 KB', '60 x 40 pixels', 'admin', 1, 0, 0, '2023-04-11 23:13:03', '2023-04-11 23:13:03'),
(56, 'sitesway.png', 'sitesway1681276405.png', NULL, '1.41 KB', '60 x 40 pixels', 'admin', 1, 0, 0, '2023-04-11 23:13:25', '2023-04-11 23:13:25'),
(57, 'pricing1.png', 'pricing11686718012.png', NULL, '3.17 KB', '46 x 46 pixels', 'admin', 1, 0, 0, '2023-06-13 22:46:52', '2023-06-13 22:46:52'),
(58, 'freelancer-fortn.png', 'freelancer-fortn1697719200.png', NULL, '245.65 KB', '500 x 300 pixels', 'admin', 1, 0, 0, '2023-10-19 06:40:01', '2023-10-19 06:40:01'),
(59, 'brand2.png', 'brand21698472943.png', NULL, '2.28 KB', '153 x 32 pixels', 'admin', 1, 0, 0, '2023-10-28 00:02:23', '2023-10-28 00:02:23'),
(60, 'brand1.png', 'brand11698472943.png', NULL, '2.75 KB', '98 x 32 pixels', 'admin', 1, 0, 0, '2023-10-28 00:02:23', '2023-10-28 00:02:23'),
(61, 'brand4.png', 'brand41698472943.png', NULL, '3.05 KB', '193 x 32 pixels', 'admin', 1, 0, 0, '2023-10-28 00:02:23', '2023-10-28 00:02:23'),
(62, 'brand3.png', 'brand31698472943.png', NULL, '1.96 KB', '129 x 32 pixels', 'admin', 1, 0, 0, '2023-10-28 00:02:23', '2023-10-28 00:02:23'),
(63, 'brand6.png', 'brand61698472944.png', NULL, '1.81 KB', '150 x 32 pixels', 'admin', 1, 0, 0, '2023-10-28 00:02:24', '2023-10-28 00:02:24'),
(64, 'brand5.png', 'brand51698472944.png', NULL, '697 ', '105 x 32 pixels', 'admin', 1, 0, 0, '2023-10-28 00:02:24', '2023-10-28 00:02:24'),
(65, 'brand7.png', 'brand71698472944.png', NULL, '2.16 KB', '110 x 32 pixels', 'admin', 1, 0, 0, '2023-10-28 00:02:24', '2023-10-28 00:02:24'),
(66, 'work2.svg', 'work21698488777.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-10-28 04:26:17', '2023-10-28 04:26:17'),
(67, 'work.svg', 'work1698488777.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-10-28 04:26:17', '2023-10-28 04:26:17'),
(68, 'work3.svg', 'work31698488777.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-10-28 04:26:17', '2023-10-28 04:26:17'),
(69, 'work4.svg', 'work41698488777.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-10-28 04:26:17', '2023-10-28 04:26:17'),
(70, 'newsletter-shape.png', 'newsletter-shape1698572628.png', NULL, '8.8 KB', '1210 x 334 pixels', 'admin', 1, 0, 0, '2023-10-29 03:43:48', '2023-10-29 03:43:48'),
(71, 'question-arrow.png', 'question-arrow1698577866.png', NULL, '7.94 KB', '158 x 154 pixels', 'admin', 1, 0, 0, '2023-10-29 05:11:06', '2023-10-29 05:11:06'),
(72, 'question-arrow-circle.png', 'question-arrow-circle1698578844.png', NULL, '9.44 KB', '180 x 180 pixels', 'admin', 1, 0, 0, '2023-10-29 05:27:24', '2023-10-29 05:27:24'),
(73, 'trust_apple.png', 'trust_apple1698673348.png', NULL, '551 ', '40 x 40 pixels', 'admin', 1, 0, 0, '2023-10-30 07:42:28', '2023-10-30 07:42:28'),
(74, 'trust_facebook.png', 'trust_facebook1698673348.png', NULL, '515 ', '40 x 40 pixels', 'admin', 1, 0, 0, '2023-10-30 07:42:28', '2023-10-30 07:42:28'),
(75, 'trust_google.png', 'trust_google1698673349.png', NULL, '744 ', '38 x 40 pixels', 'admin', 1, 0, 0, '2023-10-30 07:42:29', '2023-10-30 07:42:29'),
(76, 'trust_linkedIn.png', 'trust_linkedIn1698673349.png', NULL, '516 ', '40 x 40 pixels', 'admin', 1, 0, 0, '2023-10-30 07:42:29', '2023-10-30 07:42:29'),
(77, 'trust_spotify.png', 'trust_spotify1698673349.png', NULL, '636 ', '40 x 40 pixels', 'admin', 1, 0, 0, '2023-10-30 07:42:29', '2023-10-30 07:42:29'),
(78, 'logo.png', 'logo1698752007.png', NULL, '2.37 KB', '201 x 40 pixels', 'admin', 1, 0, 0, '2023-10-31 05:33:27', '2023-10-31 05:33:27'),
(79, 'white-logo.png', 'white-logo1698752859.png', NULL, '2.82 KB', '280 x 56 pixels', 'admin', 1, 0, 0, '2023-10-31 05:47:39', '2023-10-31 05:47:39'),
(80, '404.png', '4041700399918.png', NULL, '23.67 KB', '653 x 288 pixels', 'admin', 1, 0, 0, '2023-11-19 07:18:38', '2023-11-19 07:18:38'),
(82, '2nd.png', '2nd1700401499.png', NULL, '1.32 MB', '1296 x 700 pixels', 'admin', 1, 0, 0, '2023-11-19 07:44:59', '2023-11-19 07:44:59'),
(83, 'M1.png', 'M11700401542.png', NULL, '35.09 KB', '152 x 202 pixels', 'admin', 1, 0, 0, '2023-11-19 07:45:43', '2023-11-19 07:45:43'),
(84, 'M2.png', 'M21700401545.png', NULL, '38.87 KB', '152 x 202 pixels', 'admin', 1, 0, 0, '2023-11-19 07:45:45', '2023-11-19 07:45:45'),
(85, '3rd.png', '3rd1700401545.png', NULL, '448.37 KB', '526 x 500 pixels', 'admin', 1, 0, 0, '2023-11-19 07:45:46', '2023-11-19 07:45:46'),
(86, 'M3.png', 'M31700401547.png', NULL, '37.87 KB', '152 x 202 pixels', 'admin', 1, 0, 0, '2023-11-19 07:45:47', '2023-11-19 07:45:47'),
(87, 'Check.svg', 'Check1700401601.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-11-19 07:46:41', '2023-11-19 07:46:41'),
(88, 'Smile.svg', 'Smile1700401601.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-11-19 07:46:41', '2023-11-19 07:46:41'),
(89, 'Trustpilot.svg', 'Trustpilot1700401602.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-11-19 07:46:42', '2023-11-19 07:46:42'),
(90, 'Logo 1.png', 'Logo 11700402559.png', NULL, '985 ', '40 x 40 pixels', 'admin', 1, 0, 0, '2023-11-19 08:02:39', '2023-11-19 08:02:39'),
(91, 'Logo 2.png', 'Logo 21700402559.png', NULL, '1.02 KB', '40 x 40 pixels', 'admin', 1, 0, 0, '2023-11-19 08:02:39', '2023-11-19 08:02:39'),
(92, 'Logo 3.png', 'Logo 31700402560.png', NULL, '1.44 KB', '40 x 40 pixels', 'admin', 1, 0, 0, '2023-11-19 08:02:40', '2023-11-19 08:02:40'),
(93, 'Logo 5.png', 'Logo 51700402560.png', NULL, '1.13 KB', '40 x 40 pixels', 'admin', 1, 0, 0, '2023-11-19 08:02:41', '2023-11-19 08:02:41'),
(94, 'Logo4.png', 'Logo41700402561.png', NULL, '1.04 KB', '40 x 40 pixels', 'admin', 1, 0, 0, '2023-11-19 08:02:41', '2023-11-19 08:02:41'),
(95, 'Logo 1.png', 'Logo 11700402715.png', NULL, '2.93 KB', '191 x 40 pixels', 'admin', 1, 0, 0, '2023-11-19 08:05:15', '2023-11-19 08:05:15'),
(96, 'Logo 2.png', 'Logo 21700402715.png', NULL, '2.74 KB', '169 x 40 pixels', 'admin', 1, 0, 0, '2023-11-19 08:05:15', '2023-11-19 08:05:15'),
(97, 'Logo 3.png', 'Logo 31700402716.png', NULL, '3.51 KB', '167 x 40 pixels', 'admin', 1, 0, 0, '2023-11-19 08:05:16', '2023-11-19 08:05:16'),
(98, 'Logo 4.png', 'Logo 41700402716.png', NULL, '2.9 KB', '170 x 40 pixels', 'admin', 1, 0, 0, '2023-11-19 08:05:16', '2023-11-19 08:05:16'),
(99, 'Logo 5.png', 'Logo 51700402717.png', NULL, '4.32 KB', '169 x 42 pixels', 'admin', 1, 0, 0, '2023-11-19 08:05:17', '2023-11-19 08:05:17'),
(100, 'Logo 6.png', 'Logo 61700402717.png', NULL, '2.95 KB', '186 x 40 pixels', 'admin', 1, 0, 0, '2023-11-19 08:05:17', '2023-11-19 08:05:17'),
(101, 'team5.jpg', 'team51701081246.jpg', NULL, '64.01 KB', '306 x 306 pixels', 'admin', 1, 0, 0, '2023-11-27 04:34:06', '2023-11-27 04:34:06'),
(102, 'team3.jpg', 'team31701081247.jpg', NULL, '63.07 KB', '306 x 306 pixels', 'admin', 1, 0, 0, '2023-11-27 04:34:07', '2023-11-27 04:34:07'),
(103, 'team1.jpg', 'team11701081247.jpg', NULL, '58.52 KB', '306 x 306 pixels', 'admin', 1, 0, 0, '2023-11-27 04:34:07', '2023-11-27 04:34:07'),
(104, 'team4.jpg', 'team41701081248.jpg', NULL, '52.02 KB', '306 x 306 pixels', 'admin', 1, 0, 0, '2023-11-27 04:34:08', '2023-11-27 04:34:08'),
(105, 'team2.jpg', 'team21701081248.jpg', NULL, '62.66 KB', '306 x 306 pixels', 'admin', 1, 0, 0, '2023-11-27 04:34:09', '2023-11-27 04:34:09'),
(106, '2.png', '21701082884.png', NULL, '15.11 KB', '193 x 192 pixels', 'admin', 1, 0, 0, '2023-11-27 05:01:24', '2023-11-27 05:01:24'),
(107, '1.png', '11701082885.png', NULL, '9.66 KB', '193 x 196 pixels', 'admin', 1, 0, 0, '2023-11-27 05:01:25', '2023-11-27 05:01:25'),
(108, '3.png', '31701082885.png', NULL, '14.72 KB', '193 x 192 pixels', 'admin', 1, 0, 0, '2023-11-27 05:01:26', '2023-11-27 05:01:26'),
(109, '4.png', '41701082886.png', NULL, '14.55 KB', '193 x 192 pixels', 'admin', 1, 0, 0, '2023-11-27 05:01:27', '2023-11-27 05:01:27'),
(110, '5.png', '51701082887.png', NULL, '15.06 KB', '193 x 192 pixels', 'admin', 1, 0, 0, '2023-11-27 05:01:28', '2023-11-27 05:01:28'),
(111, '5.png', '51701082978.png', NULL, '2.59 KB', '47 x 47 pixels', 'admin', 1, 0, 0, '2023-11-27 05:02:58', '2023-11-27 05:02:58'),
(112, '1.png', '11701083072.png', NULL, '2.11 KB', '47 x 48 pixels', 'admin', 1, 0, 0, '2023-11-27 05:04:32', '2023-11-27 05:04:32'),
(113, '2.png', '21701083072.png', NULL, '2.68 KB', '47 x 47 pixels', 'admin', 1, 0, 0, '2023-11-27 05:04:32', '2023-11-27 05:04:32'),
(114, '4.png', '41701083073.png', NULL, '2.68 KB', '47 x 47 pixels', 'admin', 1, 0, 0, '2023-11-27 05:04:33', '2023-11-27 05:04:33'),
(115, '3.png', '31701083073.png', NULL, '2.69 KB', '47 x 47 pixels', 'admin', 1, 0, 0, '2023-11-27 05:04:33', '2023-11-27 05:04:33'),
(116, 'Top.png', 'Top1701157305.png', NULL, '127.37 KB', '636 x 465 pixels', 'admin', 1, 0, 0, '2023-11-28 01:41:45', '2023-11-28 01:41:45'),
(118, 'Skills.svg', 'Skills1701170646.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-11-28 05:24:06', '2023-11-28 05:24:06'),
(119, '1699183717-65477c650cf4f.png', '1699183717-65477c650cf4f1702542814.png', NULL, '155.37 KB', '1770 x 960 pixels', 'admin', 1, 0, 0, '2023-12-14 02:33:35', '2023-12-14 02:33:35'),
(120, '1699183003-6547799bcdeb9.png', '1699183003-6547799bcdeb91702542814.png', NULL, '82.92 KB', '1770 x 960 pixels', 'admin', 1, 0, 0, '2023-12-14 02:33:35', '2023-12-14 02:33:35'),
(121, '1699184794-6547809aeeaca.png', '1699184794-6547809aeeaca1702542816.png', NULL, '305.16 KB', '1770 x 960 pixels', 'admin', 1, 0, 0, '2023-12-14 02:33:36', '2023-12-14 02:33:36'),
(122, '1699185138-654781f2c2efe.png', '1699185138-654781f2c2efe1702542816.png', NULL, '276.58 KB', '1770 x 960 pixels', 'admin', 1, 0, 0, '2023-12-14 02:33:37', '2023-12-14 02:33:37'),
(123, 'img-shape11703590525.svg', 'img-shape117035905251703684257.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-12-27 07:37:37', '2023-12-27 07:37:37'),
(124, 'img-shape21703590525.svg', 'img-shape217035905251703684257.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-12-27 07:37:37', '2023-12-27 07:37:37'),
(125, 'iyzipay1701066485.svg', 'iyzipay17010664851703684447.svg', NULL, '', '', 'admin', 1, 0, 0, '2023-12-27 07:40:47', '2023-12-27 07:40:47'),
(126, '1.png', '11704372060.png', NULL, '4.57 KB', '80 x 80 pixels', 'admin', 1, 0, 0, '2024-01-04 06:41:00', '2024-01-04 06:41:00'),
(127, '2.png', '21704372060.png', NULL, '3.93 KB', '80 x 80 pixels', 'admin', 1, 0, 0, '2024-01-04 06:41:00', '2024-01-04 06:41:00'),
(128, '3.png', '31704372062.png', NULL, '4.3 KB', '80 x 80 pixels', 'admin', 1, 0, 0, '2024-01-04 06:41:02', '2024-01-04 06:41:02'),
(129, '4.png', '41704372062.png', NULL, '4.59 KB', '80 x 80 pixels', 'admin', 1, 0, 0, '2024-01-04 06:41:02', '2024-01-04 06:41:02'),
(130, '5.png', '51704372063.png', NULL, '4.18 KB', '80 x 80 pixels', 'admin', 1, 0, 0, '2024-01-04 06:41:03', '2024-01-04 06:41:03'),
(131, '03_banner_shapes.png', '03_banner_shapes1717412039.png', NULL, '3.31 KB', '1415 x 522 pixels', 'admin', 1, 0, 0, '2024-06-03 14:54:00', '2024-06-03 14:54:00'),
(132, '03_banner_fav.png', '03_banner_fav1717412200.png', NULL, '510 ', '20 x 20 pixels', 'admin', 1, 0, 0, '2024-06-03 14:56:40', '2024-06-03 14:56:40'),
(133, '03_banner_light.png', '03_banner_light1717412374.png', NULL, '915 ', '24 x 24 pixels', 'admin', 1, 0, 0, '2024-06-03 14:59:34', '2024-06-03 14:59:34'),
(134, '03_banner_tallent.png', '03_banner_tallent1717412391.png', NULL, '1.2 KB', '24 x 24 pixels', 'admin', 1, 0, 0, '2024-06-03 14:59:51', '2024-06-03 14:59:51'),
(135, 'banner-shapes.png', 'banner-shapes1717412649.png', NULL, '6.59 KB', '987 x 685 pixels', 'admin', 1, 0, 0, '2024-06-03 15:04:09', '2024-06-03 15:04:09'),
(136, '02_banner_shapes.png', '02_banner_shapes1717413063.png', NULL, '2.42 KB', '1816 x 815 pixels', 'admin', 1, 0, 0, '2024-06-03 15:11:03', '2024-06-03 15:11:03'),
(137, '03_banner_line1715593300.svg', '03_banner_line17155933001717413342.svg', NULL, '', '', 'admin', 1, 0, 0, '2024-06-03 15:15:42', '2024-06-03 15:15:42'),
(138, 'choose_thumb_shape.svg', 'choose_thumb_shape1717413870.svg', NULL, '', '', 'admin', 1, 0, 0, '2024-06-03 15:24:30', '2024-06-03 15:24:30'),
(139, 'choose_thumb.png', 'choose_thumb1717413871.png', NULL, '14.23 KB', '404 x 225 pixels', 'admin', 1, 0, 0, '2024-06-03 15:24:31', '2024-06-03 15:24:31'),
(140, 'choose_shapes.png', 'choose_shapes1717413916.png', NULL, '6.44 KB', '492 x 196 pixels', 'admin', 1, 0, 0, '2024-06-03 15:25:16', '2024-06-03 15:25:16'),
(141, 'appStore2.jpg', 'appStore21717415066.jpg', NULL, '7.98 KB', '136 x 40 pixels', 'admin', 1, 0, 0, '2024-06-03 15:44:26', '2024-06-03 15:44:26'),
(142, 'appStore1.jpg', 'appStore11717415066.jpg', NULL, '8.09 KB', '122 x 40 pixels', 'admin', 1, 0, 0, '2024-06-03 15:44:26', '2024-06-03 15:44:26'),
(143, 'Client.png', 'Client1717417807.png', NULL, '49.31 KB', '240 x 330 pixels', 'admin', 1, 0, 0, '2024-06-03 16:30:07', '2024-06-03 16:30:07'),
(144, 'Freelancer.png', 'Freelancer1717417807.png', NULL, '33.08 KB', '240 x 330 pixels', 'admin', 1, 0, 0, '2024-06-03 16:30:07', '2024-06-03 16:30:07'),
(145, 'choose_shapes.png', 'choose_shapes1717424980.png', NULL, '6.44 KB', '492 x 196 pixels', 'admin', 1, 0, 0, '2024-06-03 18:29:40', '2024-06-03 18:29:40'),
(146, 'logo-new1689864609.png', 'logo-new16898646091722251084.png', NULL, '15.7 KB', '648 x 211 pixels', 'admin', 1, 0, 0, '2024-07-29 15:04:44', '2024-07-29 15:04:44'),
(147, 'logoedcaf7451719733680.png', 'logoedcaf74517197336801722251157.png', NULL, '36.65 KB', '764 x 193 pixels', 'admin', 1, 0, 0, '2024-07-29 15:05:57', '2024-07-29 15:05:57');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `title`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Primary Menu', '[{\"ptype\":\"custom\",\"id\":2,\"antarget\":\"\",\"icon\":\"\",\"pname\":\"Home\",\"purl\":\"@url\",\"children\":[{\"ptype\":\"pages\",\"pid\":7,\"id\":28},{\"ptype\":\"pages\",\"pid\":10,\"id\":29}]},{\"ptype\":\"custom\",\"id\":3,\"antarget\":\"\",\"icon\":\"\",\"pname\":\"Jobs\",\"purl\":\"@url/jobs/all\"},{\"ptype\":\"custom\",\"id\":4,\"antarget\":\"\",\"icon\":\"\",\"pname\":\"Talents\",\"purl\":\"@url/talents/all\"},{\"ptype\":\"custom\",\"id\":5,\"antarget\":\"\",\"icon\":\"\",\"pname\":\"Subscriptions\",\"purl\":\"@url/subscriptions/all\"},{\"ptype\":\"custom\",\"id\":6,\"antarget\":\"\",\"icon\":\"\",\"pname\":\"Pages\",\"purl\":\"#\",\"children\":[{\"ptype\":\"custom\",\"id\":7,\"antarget\":\"\",\"icon\":\"\",\"pname\":\"Projects\",\"purl\":\"@url/projects/all\"},{},{},{},{\"ptype\":\"custom\",\"id\":10,\"antarget\":\"\",\"icon\":\"\",\"pname\":\"Blog\",\"purl\":\"@url/blogs/all\"},{},{},{\"ptype\":\"pages\",\"id\":12,\"antarget\":\"\",\"icon\":\"\",\"menulabel\":\"\",\"pid\":6},{},{},{},{},{},{\"ptype\":\"pages\",\"id\":17,\"antarget\":\"\",\"icon\":\"\",\"menulabel\":\"\",\"pid\":9},{},{\"ptype\":\"pages\",\"id\":18,\"antarget\":\"\",\"icon\":\"\",\"menulabel\":\"\",\"pid\":8},{},{},{},{},{}]},{\"ptype\":\"pages\",\"id\":23,\"antarget\":\"\",\"icon\":\"\",\"menulabel\":\"\",\"pid\":2}]', 'default', '2022-12-27 04:43:16', '2024-06-03 14:28:58'),
(2, 'Footer Menu', NULL, '', '2022-12-27 04:44:55', '2023-11-14 05:24:22'),
(4, 'Social Menu', NULL, NULL, '2022-12-27 05:31:28', '2022-12-27 05:31:28'),
(5, 'Test Menu', '[{\"ptype\":\"custom\",\"id\":2,\"antarget\":\"\",\"icon\":\"\",\"pname\":\"Home\",\"purl\":\"@url\"},{\"ptype\":\"pages\",\"pid\":2,\"id\":2}]', NULL, '2022-12-28 01:50:31', '2022-12-29 06:32:52');

-- --------------------------------------------------------

--
-- Table structure for table `meta_data`
--

CREATE TABLE `meta_data` (
  `id` bigint UNSIGNED NOT NULL,
  `meta_taggable_id` bigint UNSIGNED NOT NULL,
  `meta_taggable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `facebook_meta_tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `facebook_meta_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_meta_tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `twitter_meta_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_data`
--

INSERT INTO `meta_data` (`id`, `meta_taggable_id`, `meta_taggable_type`, `meta_title`, `meta_tags`, `meta_description`, `facebook_meta_tags`, `facebook_meta_description`, `facebook_meta_image`, `twitter_meta_tags`, `twitter_meta_description`, `twitter_meta_image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Modules\\Pages\\Entities\\Page', 'asdasd asd', 'asdasdasd,as dasd as', 'asd asda', 'asd asd', 'asd asdas', NULL, 'asda sdas', 'as dasd a asdad', NULL, '2022-12-21 03:07:00', '2023-10-31 00:11:53'),
(2, 2, 'Modules\\Pages\\Entities\\Page', 'dfgsdfsdf', 'sdfsd sdf,fsdfsdf s,sd fsd sdf', 'sdf sdfsd fsdf', 'sdf sdfsd', 'sdfsdfsd', '8', 'sdf sdfsd f', 'sdf sdfsdf', '5', '2022-12-21 05:30:29', '2023-11-28 05:25:04'),
(3, 1, 'Modules\\Pages\\Entities\\Page', 'asdasd asd', 'asdasdasd,as dasd as', 'asd asda', 'asd asd', 'asd asdas', NULL, 'asda sdas', 'as dasd a asdad', NULL, '2022-12-21 07:09:52', '2023-10-31 00:11:53'),
(4, 2, 'Modules\\Pages\\Entities\\Page', 'dfgsdfsdf', 'sdfsd sdf,fsdfsdf s,sd fsd sdf', 'sdf sdfsd fsdf', 'sdf sdfsd', 'sdfsdfsd', '8', 'sdf sdfsd f', 'sdf sdfsdf', '5', '2022-12-21 07:22:54', '2023-11-28 05:25:04'),
(8, 6, 'Modules\\Pages\\Entities\\Page', 'as dasda', 'asd asd', 'asd asd asdas', 'asd asd as', 'asd asd asd', NULL, '', '', NULL, '2022-12-28 01:51:07', '2023-11-28 00:05:12'),
(9, 7, 'Modules\\Pages\\Entities\\Page', 'Home page one', 'Home page one asdas,asdasd,asd', 'home page one', '', '', NULL, '', '', NULL, '2023-10-26 05:33:00', '2024-01-17 06:22:19'),
(10, 8, 'Modules\\Pages\\Entities\\Page', 'about us', 'about,us', 'about us \"&gt;', '', '', NULL, '', '', NULL, '2023-11-02 06:43:42', '2023-11-19 07:42:47'),
(12, 9, 'Modules\\Pages\\Entities\\Page', '', '', '', '', '', NULL, '', '', NULL, '2024-03-10 16:36:03', '2024-03-10 16:36:03'),
(13, 10, 'Modules\\Pages\\Entities\\Page', 'Home Page Two', 'Home Page Two', '', '', '', NULL, '', '', NULL, '2024-06-03 14:26:33', '2024-06-03 14:35:19');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_12_06_070148_create_admins_table', 1),
(6, '2022_12_07_111046_create_static_options_table', 2),
(7, '2022_12_07_111908_create_media_uploads_table', 3),
(9, '2022_12_21_081351_create_meta_data_table', 4),
(10, '2022_12_21_075819_create_pages_table', 5),
(11, '2022_12_27_102354_create_menus_table', 6),
(12, '2022_12_29_073650_create_form_builders_table', 7),
(13, '2023_01_14_111350_create_widgets_table', 8),
(15, '2014_10_12_000000_create_users_table', 9),
(16, '2023_01_25_061947_create_countries_table', 10),
(17, '2023_01_25_062042_create_states_table', 10),
(18, '2023_01_25_062051_create_cities_table', 10),
(20, '2023_01_31_111953_create_user_introductions_table', 11),
(21, '2023_02_01_105814_create_user_experiences_table', 12),
(22, '2023_02_06_070500_create_user_education_table', 13),
(26, '2023_02_06_104340_create_categories_table', 15),
(27, '2023_02_06_104409_create_sub_categories_table', 15),
(31, '2023_02_08_080702_add_slug_and_image_to_categories_table', 16),
(32, '2023_02_08_080738_add_slug_and_image_to_sub_categories_table', 16),
(33, '2023_02_09_031836_create_skills_table', 17),
(34, '2023_02_12_120227_create_user_works_table', 18),
(35, '2023_02_13_070232_create_user_skills_table', 19),
(36, '2023_02_13_110318_add_hourly_rate_to_users_table', 20),
(38, '2023_02_15_084950_create_identity_verifications_table', 21),
(41, '2023_02_20_062146_add_status_and_is_read_to_identity_verifications_table', 22),
(43, '2023_02_22_102326_add_deleted_at_to_users', 23),
(47, '2023_02_26_072137_create_create_projects_table', 25),
(48, '2023_02_27_060732_create_create_project_attributes_table', 26),
(49, '2023_03_05_045336_add_slug_and_status_to_create_projects', 27),
(51, '2023_03_13_091210_create_portfolios_table', 28),
(52, '2023_03_19_061043_add_timezone_to_states', 29),
(53, '2023_03_19_091240_add_check_online_status_to_users', 30),
(55, '2023_03_19_101455_add_check_work_availability_to_users', 31),
(56, '2023_03_22_065938_add_google_2fa_secret_to_users', 32),
(57, '2023_03_22_085506_add_google_2fa_enable_disable_disable_to_users', 33),
(58, '2023_03_28_090737_create_project_histories_table', 34),
(61, '2023_03_29_034510_add_project_approve_request_to_create_projects', 35),
(62, '2023_04_02_045528_create_admin_notifications_table', 36),
(63, '2023_04_03_083057_create_create_project_sub_categories_table', 37),
(64, '2023_04_04_063804_add_category_id_to_create_projects', 38),
(65, '2023_04_06_022811_create_wallets_table', 39),
(66, '2023_04_06_022826_create_wallet_histories_table', 39),
(76, '2023_04_29_070422_create_subscription_types_table', 43),
(77, '2023_04_29_071804_create_subscription_features_table', 43),
(78, '2023_04_29_072511_create_subscriptions_table', 43),
(79, '2023_05_02_123118_create_page_builders_table', 44),
(80, '2023_05_07_070709_create_languages_table', 45),
(81, '2023_05_15_052137_add_short_description_to_categories', 46),
(82, '2023_05_15_060433_add_short_description_to_sub_categories', 47),
(83, '2023_05_17_072955_add_level_to_users', 48),
(85, '2023_05_30_105849_add_last_apply_date_and_last_seen_to_jobs_table', 49),
(86, '2023_06_01_063633_create_job_histories_table', 50),
(88, '2023_06_07_044153_change_is_read_column_name', 51),
(89, '2023_06_08_034931_rename_subscription_connet_to_limit', 52),
(91, '2023_06_13_044928_add_validatity_to_subscription_types', 53),
(96, '2023_06_17_054259_create_user_subscriptions_table', 54),
(107, '2023_07_10_043726_create_user_earnings_table', 55),
(108, '2023_07_10_075003_create_individual_commission_settings_table', 55),
(145, '2023_07_09_042039_create_orders_table', 56),
(147, '2023_07_26_115750_create_order_decline_histories_table', 56),
(148, '2023_07_26_120317_create_order_decline_wallet_histories_table', 56),
(169, '2023_07_30_063825_create_user_notifications_table', 57),
(170, '2023_07_30_070915_create_order_submit_histories_table', 57),
(171, '2023_08_01_103629_create_order_request_revisions_table', 57),
(174, '2023_08_08_054420_add_revision_left_to_orders_table', 58),
(181, '2023_08_10_043412_create_ratings_table', 59),
(182, '2023_08_10_045939_create_rating_details_table', 59),
(183, '2023_08_21_101229_add_status_before_hold_to_orders_table', 60),
(184, '2023_08_21_101822_add_is_suspend_to_users_table', 60),
(185, '2023_08_27_055736_create_departments_table', 61),
(186, '2023_08_27_060148_create_tickets_table', 61),
(187, '2023_08_27_060349_create_chat_messages_table', 61),
(192, '2023_05_23_165755_create_live_chats_table', 62),
(193, '2023_05_23_165849_create_live_chat_messages_table', 62),
(195, '2023_09_11_094021_create_job_posts_table', 63),
(197, '2023_09_11_111935_create_job_post_sub_categories_table', 64),
(198, '2023_04_17_052446_create_job_skills_table', 65),
(199, '2023_09_11_115123_create_job_post_skills_table', 66),
(204, '2023_09_12_112426_create_job_proposals_table', 67),
(211, '2023_08_02_074726_create_freelancer_notifications_table', 69),
(212, '2023_08_03_115328_create_client_notifications_table', 69),
(213, '2023_10_01_051409_add_revision_to_job_proposals', 70),
(214, '2023_09_24_072604_create_offers_table', 71),
(215, '2023_09_24_072659_create_offer_milestones_table', 71),
(216, '2023_07_13_093714_create_order_milestones_table', 72),
(217, '2023_10_04_125750_add_current_status_to_job_posts', 73),
(218, '2023_10_15_073144_add_remaining_balance_and_withdraw_amount_to_wallets', 74),
(220, '2023_10_15_130310_create_withdraw_gateways_table', 75),
(222, '2023_10_16_122611_create_withdraw_requests_table', 76),
(223, '2023_10_19_092727_create_permission_tables', 77),
(224, '2023_10_19_095329_add_menu_name_to_permissions', 77),
(225, '2020_02_04_010636_create_newsletters_table', 78),
(230, '2023_10_29_115154_create_question_answers_table', 79),
(232, '2023_10_30_082828_create_feedback_table', 80),
(233, '2023_11_09_052611_create_bookmarks_table', 81),
(234, '2023_11_13_090531_create_reports_table', 82),
(235, '2023_12_04_093048_create_xg_ftp_infos_table', 83),
(236, '2023_12_11_062442_create_blog_posts_table', 83),
(237, '2023_12_23_081053_create_freelancer_levels_table', 84),
(238, '2023_12_23_081216_create_freelancer_level_rules_table', 84),
(239, '2024_01_14_091704_add_reject_reason_to_project_histories_table', 85),
(240, '2024_01_31_071706_add_offer_package_available_or_not_to_projects_table', 86),
(241, '2024_02_14_060336_add_is_pro_and_pro_expire_date_to_projects_table', 87),
(242, '2024_02_15_120132_add_is_valid_payment_to_orders_table', 87),
(243, '2024_02_18_072401_add_note_to_reports_table', 87),
(244, '2024_02_18_150813_create_news_letter_for_emails_table', 87),
(245, '2024_03_05_123836_add_email_verify_token_to_admins', 88),
(246, '2024_03_06_065635_add_firebase_device_token_to_users', 88),
(247, '2024_04_21_131737_create_jobs_table', 89),
(248, '2024_01_29_053338_create_project_promote_settings_table', 90),
(249, '2024_02_08_063522_create_promotion_project_lists_table', 90),
(250, '2024_02_14_075240_add_is_valid_payment_promotion_project_lists__table', 90),
(251, '2024_05_01_053357_add_apple_id_to_users_table', 90),
(252, '2024_05_05_100714_add_is_pro_to_users_table', 90),
(253, '2024_05_16_095256_create_words_table', 91),
(254, '2024_05_19_051405_add_freeze_withdraw_and_freeze_project_freeze_job_freeze_order_freeze_chat_to_users', 91),
(255, '2024_05_20_093916_create_log_activities_table', 91),
(256, '2024_06_11_053715_add_meta_title_and_meta_description_to_categories', 92),
(257, '2024_06_11_054044_add_meta_title_and_meta_description_to_sub_categories', 92),
(258, '2024_06_25_052118_add_meta_title_and_meta_description_and_meta_tags_to_projects', 93),
(259, '2024_06_25_053121_add_meta_title_and_meta_description_and_meta_tags_to_job_posts', 93),
(260, '2024_07_03_082447_add_load_from_and_is_synced_to_media_uploads', 93),
(261, '2024_07_06_050745_add_load_from_and_is_synced_to_projects', 93),
(262, '2024_07_07_103341_add_load_from_and_is_synced_to_job_posts', 93),
(263, '2024_07_07_135455_add_load_from_and_is_synced_to_job_proposals', 93),
(264, '2024_07_08_091056_add_load_from_and_is_synced_to_portfolios', 93),
(265, '2024_07_08_113034_add_load_from_and_is_synced_to_users', 93),
(266, '2024_07_09_061732_add_load_from_and_is_synced_to_chat_messages', 93),
(267, '2024_07_11_103143_add_load_from_and_is_synced_to_identity_verifications', 93),
(268, '2024_04_26_034953_create_payment_meta_data_table', 94),
(269, '2024_08_01_035813_add_hourly_rate_and_estimated_hours_to_job_posts', 94),
(270, '2024_08_13_054216_add_email_send_to_wallet_histories', 94),
(271, '2024_08_13_063128_add_email_send_to_orders', 94),
(272, '2024_08_13_063226_add_email_send_to_user_subscriptions', 94),
(273, '2024_08_13_063805_add_email_send_to_promotion_project_lists', 94),
(274, '2024_08_18_080543_create_order_work_histories_table', 94),
(275, '2024_08_27_100524_add_selected_category_to_categories', 94),
(276, '2024_08_28_122807_create_order_screenshots_table', 94),
(277, '2024_08_29_115158_add_load_from_and_is_synced_to_live_chat_messages', 94);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `email`, `token`, `verified`, `created_at`, `updated_at`) VALUES
(1, 'nazmuld@gmail.com', NULL, NULL, '2023-10-29 04:54:35', '2023-10-29 04:54:35'),
(2, 'nazmulerd@gmail.com', NULL, NULL, '2023-10-29 04:56:24', '2023-10-29 04:56:24'),
(3, 'asd@asas.com', NULL, NULL, '2023-10-31 07:49:55', '2023-10-31 07:49:55'),
(4, 'adasda@gmail.com', NULL, NULL, '2023-10-31 07:51:38', '2023-10-31 07:51:38'),
(5, 'design@xgenious.com', NULL, NULL, '2023-11-28 04:58:05', '2023-11-28 04:58:05'),
(6, 'mdzahid.pro@gmail.com', NULL, NULL, '2023-11-30 00:01:04', '2023-11-30 00:01:04'),
(7, 'printip@protonmail.com', '7pCddfEH3khl0TlqcuJBXu8efNHSFHGC', NULL, '2023-12-06 22:35:52', '2024-02-20 10:46:25'),
(8, 'kevinkenfackjoel@gmail.com', '5yGKrjugXp2cl9TXuC0QRDsIy1kKghOH', NULL, '2023-12-21 02:14:36', '2024-03-11 17:39:16'),
(9, 'gabrielchungu382@gmail.com', 'wFzqG28Hr9uOib7SEQ0ARCgkxaN3lDsQ', NULL, '2024-05-08 01:59:47', '2024-05-15 13:07:46'),
(10, 'agent@gmail.com', 'xNptLkgpNmrVafCkzkAhvbA5K19OBM38', NULL, '2024-05-15 13:31:03', '2024-05-18 04:15:41');

-- --------------------------------------------------------

--
-- Table structure for table `news_letter_for_emails`
--

CREATE TABLE `news_letter_for_emails` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint UNSIGNED NOT NULL,
  `freelancer_id` bigint NOT NULL,
  `client_id` bigint NOT NULL,
  `price` double NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deadline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=pending, 1=active, 2=reject',
  `revision` int NOT NULL DEFAULT '0',
  `revision_left` int NOT NULL DEFAULT '0',
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `freelancer_id`, `client_id`, `price`, `description`, `deadline`, `status`, `revision`, `revision_left`, `attachment`, `created_at`, `updated_at`) VALUES
(1, 7, 1, 600, '<p>Hey,&nbsp;<br></p><p>I will pay $200 to you for this Milestone. I am happy with the previous milestones. Please keep up the good work. More to come - Thanks</p>', 'Less than a month', 1, 5, 5, NULL, '2023-11-07 06:20:53', '2023-11-07 06:22:30'),
(2, 7, 1, 500, '<p>Hey,&nbsp;<br></p><p>I will pay $200 to you for this Milestone. I am happy with the previous milestones. Please keep up the good work. More to come - Thanks</p>', NULL, 1, 0, 0, NULL, '2023-11-07 07:22:05', '2023-11-07 07:28:08'),
(3, 7, 1, 200, '<p>Hey,&nbsp;<br></p><p>I will pay $200 to you for this Milestone. I am happy with the previous milestones. Please keep up the good work. More to come - Thanks</p>', '3 Days', 0, 12, 12, NULL, '2023-11-26 07:36:56', '2023-11-26 07:36:56'),
(4, 7, 1, 200, '<p>Hey,&nbsp;<br></p><p>I will pay $200 to you for this Milestone. I am happy with the previous milestones. Please keep up the good work. More to come - Thanks</p>', 'Less than a week', 0, 3, 3, NULL, '2023-11-26 07:40:58', '2023-11-26 07:40:58'),
(5, 7, 1, 100, '<p>Hey,&nbsp;<br></p><p>I will pay $200 to you for this Milestone. I am happy with the previous milestones. Please keep up the good work. More to come - Thanks</p>', 'Less than a month', 0, 4, 4, NULL, '2023-11-27 07:58:04', '2023-11-27 07:58:04'),
(6, 7, 2, 10, NULL, NULL, 0, 0, 0, NULL, '2023-12-04 00:32:49', '2023-12-04 00:32:49'),
(7, 7, 1, 60, '<p>test</p>', '3 Days', 1, 6, 6, NULL, '2023-12-05 01:36:54', '2023-12-12 12:35:26'),
(8, 7, 1, 10, '<p>opkop</p>', 'Less than a week', 1, 1, 1, NULL, '2023-12-05 09:23:14', '2023-12-13 03:44:44'),
(9, 7, 1, 10, 'Hello world!', '3 Days', 1, 10, 10, NULL, '2023-12-05 09:24:20', '2023-12-09 21:30:47'),
(10, 7, 2, 334234, '<p>fdfs</p>', '1 Days', 0, 12, 12, NULL, '2023-12-11 02:53:09', '2023-12-11 02:53:09'),
(11, 7, 1, 1000, '<p>asdna gsdhjg</p>', '3 Days', 0, 100, 100, NULL, '2023-12-12 09:51:08', '2023-12-12 09:51:08'),
(12, 7, 2, 40, NULL, NULL, 0, 0, 0, NULL, '2023-12-12 18:46:15', '2023-12-12 18:46:15'),
(13, 7, 1, 10, '<font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">сделаю тебе Алешу</font></font>', 'Less than a month', 1, 1, 1, NULL, '2023-12-16 08:07:45', '2023-12-16 08:08:36'),
(14, 7, 1, 250, '<p>asdasd<br></p>', '3 Days', 1, 12, 12, NULL, '2023-12-16 16:11:51', '2024-01-22 21:10:56'),
(15, 7, 1, 10, '<p>iio oiu oui</p>', '2 Days', 1, 10, 10, NULL, '2023-12-18 08:59:20', '2023-12-31 05:34:11'),
(16, 7, 1, 12, '<p>DSGDSFGHSDHG</p>', '2 Days', 0, 3, 3, NULL, '2023-12-19 13:43:08', '2023-12-19 13:43:08'),
(17, 7, 1, 500, '<p>dscds</p>', '3 Days', 1, 2, 2, NULL, '2023-12-20 09:02:56', '2023-12-23 01:19:47'),
(18, 7, 1, 5000, '<p>Test</p>', '3 Days', 1, 20, 20, NULL, '2023-12-25 16:44:52', '2023-12-28 03:43:16'),
(19, 7, 1, 6, '<p>vvvbhhh</p>', '1 Days', 0, 7, 7, NULL, '2023-12-31 09:09:34', '2023-12-31 09:09:34'),
(20, 7, 2, 1, '<p>werwerwerwerwerwerw</p>', '3 Days', 0, 5, 5, NULL, '2024-01-02 05:28:29', '2024-01-02 05:28:29'),
(21, 7, 1, 90, '<p><br<p>gdfgdfg</p>', '3 Days', 1, 1, 1, NULL, '2024-01-06 12:12:36', '2024-01-22 11:12:36'),
(22, 7, 1, 125, '<p>This is the latest offer for all remote work. <br></p>', 'Less than a week', 1, 1, 1, NULL, '2024-01-08 14:22:58', '2024-01-16 09:52:46'),
(23, 7, 2, 400, NULL, NULL, 0, 0, 0, NULL, '2024-01-15 05:02:54', '2024-01-15 05:02:54'),
(24, 7, 1, 100, NULL, NULL, 1, 0, 0, NULL, '2024-01-17 10:59:10', '2024-01-19 02:19:16'),
(25, 7, 1, 100, '<p>Test</p>', '3 Days', 0, 200, 200, NULL, '2024-01-19 16:43:24', '2024-01-19 16:43:24'),
(26, 7, 1, 2500, '<p>TEST</p>', '3 Days', 0, 2, 2, NULL, '2024-01-20 10:30:56', '2024-01-20 10:30:56'),
(27, 7, 1, 250, '<p>TEST</p>', '3 Days', 1, 1, 1, NULL, '2024-01-20 10:35:20', '2024-01-20 10:37:18'),
(28, 7, 2, 42, NULL, NULL, 0, 0, 0, NULL, '2024-01-23 04:21:45', '2024-01-23 04:21:45'),
(29, 7, 1, 230, '<p>fg</p>', 'Less than a week', 0, 5, 5, NULL, '2024-01-23 23:22:58', '2024-01-23 23:22:58'),
(30, 7, 2, 5555, '<p>5h</p>', '2 Days', 0, 3, 3, NULL, '2024-01-23 23:24:34', '2024-01-23 23:24:34'),
(31, 7, 1, 500, '<p>666<br></p>', 'Less than a week', 0, 65, 65, NULL, '2024-02-07 10:38:48', '2024-02-07 10:38:48'),
(32, 7, 1, 100, '<p>fhgh fgf gdf&nbsp;</p>', '1 Days', 0, 2, 2, NULL, '2024-02-12 05:42:25', '2024-02-12 05:42:25'),
(33, 7, 2, 500, '<p>1111111111111111111111</p>', '3 Days', 0, 1, 1, NULL, '2024-02-13 14:56:07', '2024-02-13 14:56:07'),
(34, 7, 2, 500, '<p>1111111111111111111111</p>', '3 Days', 0, 1, 1, NULL, '2024-02-13 14:56:09', '2024-02-13 14:56:09'),
(35, 7, 1, 1234, '<p>rgrgrgr<br></p>', 'Less than a week', 0, 4, 4, NULL, '2024-02-16 06:25:32', '2024-02-16 06:25:32'),
(36, 7, 1, 3333, '<p>dfvdvf<br></p>', '3 Days', 1, 1, 1, NULL, '2024-02-16 06:26:14', '2024-03-01 22:37:17'),
(37, 7, 1, 100, NULL, NULL, 1, 0, 0, NULL, '2024-02-19 22:28:54', '2024-03-04 16:41:52'),
(38, 7, 1, 232, '<p>asdoi joadqw pqowk poksdfop sf sdf sdf sdf</p>', 'Less than a week', 0, 7, 7, NULL, '2024-02-19 22:34:24', '2024-02-19 22:34:24'),
(39, 7, 1, 125, NULL, NULL, 1, 0, 0, NULL, '2024-02-19 22:34:57', '2024-02-19 22:40:34'),
(40, 7, 1, 34, '<p>iasjk dpoad asd asd asd asd asdas dasd&nbsp;</p>', 'Less than a month', 1, 3, 3, NULL, '2024-02-19 22:35:31', '2024-02-21 21:28:06'),
(41, 7, 1, 120, '<p>asdfasdfasdfasdfsdafffffffffffffffffffffffffffffffffff</p>', '2 Days', 1, 7, 7, NULL, '2024-02-19 23:36:17', '2024-02-19 23:38:31'),
(42, 7, 1, 200, '<p>bonjour</p>', '3 Days', 1, 2, 2, NULL, '2024-02-20 13:10:04', '2024-03-01 07:02:07'),
(43, 7, 1, 100, NULL, NULL, 1, 0, 0, NULL, '2024-02-21 20:10:05', '2024-02-21 21:24:21'),
(44, 7, 1, 9, '<p>ds</p>', '2 Days', 1, 1, 1, NULL, '2024-02-21 20:10:53', '2024-02-23 12:36:46'),
(45, 7, 2, 100, 'kjhhh@ghhhjk.huu', '1 Days', 0, 6, 6, NULL, '2024-02-22 03:49:34', '2024-02-22 03:49:34'),
(46, 7, 1, 555, '<p>dsdfsdfsd</p>', '3 Days', 1, 1, 1, NULL, '2024-02-24 13:01:50', '2024-03-01 01:41:37'),
(47, 7, 1, 555, '<p>dsdfsdfsd</p>', '3 Days', 1, 1, 1, NULL, '2024-02-24 13:01:51', '2024-02-29 00:28:23'),
(48, 7, 2, 100, '<p>dsffsdf</p>', '1 Days', 0, 10, 10, NULL, '2024-02-28 06:21:11', '2024-02-28 06:21:11'),
(49, 7, 2, 222, '<p>sdfsdf</p>', '3 Days', 0, 1, 1, NULL, '2024-02-28 06:22:30', '2024-02-28 06:22:30'),
(50, 7, 1, 7, '<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Dssssssssssssssssssssssssssssss</font></font></p>', '3 Days', 1, 3, 3, NULL, '2024-03-01 06:45:40', '2024-03-01 07:01:34'),
(51, 7, 2, 100, '<p>gg</p>', 'Less than a week', 0, 5, 5, NULL, '2024-03-02 10:27:55', '2024-03-02 10:27:55'),
(52, 7, 1, 100, '<p>pay</p>', '1 Days', 0, 1, 1, NULL, '2024-03-03 01:01:51', '2024-03-03 01:01:51'),
(53, 7, 1, 2300, '<p>sting</p>', '2 Days', 1, 2, 2, NULL, '2024-03-03 01:03:04', '2024-03-07 04:12:34'),
(54, 7, 1, 300, '<p>asdas</p>', '3 Days', 1, 4, 4, NULL, '2024-03-03 22:55:56', '2024-03-04 23:18:28'),
(55, 7, 1, 8541, '<p>efdsc</p>', '1 Days', 0, 1, 1, NULL, '2024-03-05 00:35:41', '2024-03-05 00:35:41'),
(56, 7, 1, 122, '<p>wqdafavsbvfdsvsdvsdfv</p>', 'Less than a week', 1, 1, 1, NULL, '2024-03-05 00:36:07', '2024-03-07 02:10:06'),
(57, 7, 1, 50, '<p>Test</p>', '2 Days', 0, 1, 1, NULL, '2024-03-09 14:18:53', '2024-03-09 14:18:53'),
(58, 7, 1, 200, '<p>fddsfdfsdfsdf</p>', 'Less than a week', 1, 2, 2, NULL, '2024-03-09 14:19:27', '2024-03-14 02:23:50'),
(59, 7, 1, 1222, '<p>adss</p>', '1 Days', 0, 5, 5, NULL, '2024-03-16 13:45:06', '2024-03-16 13:45:06'),
(60, 7, 2, 500, '<p>ada da <br></p>', '3 Days', 0, 4, 4, NULL, '2024-03-17 22:27:34', '2024-03-17 22:27:34'),
(61, 7, 1, 5000, '<p>dd<br></p>', 'More than 3 month', 1, 2, 2, NULL, '2024-03-17 22:39:05', '2024-03-27 00:29:35'),
(62, 7, 2, 33, '<p>333<br></p>', '2 Days', 0, 2, 2, NULL, '2024-03-17 22:39:51', '2024-03-17 22:39:51'),
(63, 7, 1, 100, '<p>kjbgv h<br></p>', '3 Days', 1, 10, 10, NULL, '2024-03-30 11:57:26', '2024-04-25 12:17:48'),
(64, 7, 1, 125, '<p>xvxv&nbsp;&nbsp; vxvx<br></p>', 'Less than a week', 1, 3, 3, NULL, '2024-03-30 20:33:55', '2024-04-19 06:20:04'),
(65, 7, 1, 80, '<p>nlkkkkkjk</p>', 'Less than a month', 1, 4, 4, NULL, '2024-04-17 21:03:40', '2024-04-25 16:58:20'),
(66, 7, 2, 200, '<p>Fch</p>', '1 Days', 0, 88, 88, NULL, '2024-04-18 23:18:04', '2024-04-18 23:18:04'),
(67, 7, 1, 30, '<p>Hey there</p>', 'Less than a week', 1, 3, 3, NULL, '2024-04-28 17:35:30', '2024-07-09 05:10:01'),
(68, 7, 1, 23, '<p>hijoknhg</p>', '1 Days', 0, 2, 2, NULL, '2024-04-30 19:19:16', '2024-04-30 19:19:16'),
(69, 7, 1, 12, '<p>ddws</p>', '1 Days', 0, 1, 1, NULL, '2024-04-30 19:20:33', '2024-04-30 19:20:33'),
(70, 7, 1, 100, NULL, NULL, 1, 0, 0, NULL, '2024-05-02 00:53:49', '2024-05-24 13:42:28'),
(71, 7, 1, 55, NULL, NULL, 0, 0, 0, NULL, '2024-05-05 00:27:22', '2024-05-05 00:27:22'),
(72, 7, 1, 55, NULL, NULL, 0, 0, 0, NULL, '2024-05-05 00:27:23', '2024-05-05 00:27:23'),
(73, 7, 1, 55, NULL, NULL, 1, 0, 0, NULL, '2024-05-05 00:27:24', '2024-05-11 02:24:01'),
(74, 7, 1, 10, '<p>good services</p>', '1 Days', 0, 1, 1, NULL, '2024-05-12 19:06:50', '2024-05-12 19:06:50'),
(75, 7, 1, 10, '<p>hjghjghjgh</p>', '2 Days', 1, 10, 10, NULL, '2024-05-12 19:07:55', '2024-05-14 22:10:12'),
(76, 7, 1, 30, 'teste', '1 Days', 1, 2, 2, NULL, '2024-05-14 09:22:22', '2024-05-14 10:55:27'),
(77, 7, 450, 300, 'врововоааррвововововрвивовов', 'less than a week', 0, 12, 12, NULL, '2024-05-18 17:29:10', '2024-05-18 17:29:10'),
(78, 7, 407, 50, 'teste', '1 Days', 0, 2, 2, NULL, '2024-05-24 13:37:39', '2024-05-24 13:37:39'),
(79, 8, 407, 112, 'fshf sldf jkasljfk lds fsf ;lksj faojfokajsdfl kslfjks fjksj fljksdl fjkwkdf s l;js', 'less than a month', 0, 12, 12, NULL, '2024-05-25 08:31:36', '2024-05-25 08:31:36'),
(80, 7, 1, 1, '<p>232</p>', '1 Days', 1, 1, 1, NULL, '2024-05-25 16:18:23', '2024-05-27 03:35:44'),
(81, 8, 525, 1365, 'xigxih 9uv9j 9jojoj 9j 9 9hoh9', 'less than a week', 0, 12, 12, NULL, '2024-05-26 10:58:24', '2024-05-26 10:58:24'),
(82, 7, 1, 33, '<p>asdasd</p>', '2 Days', 0, 33, 33, NULL, '2024-05-27 14:07:31', '2024-05-27 14:07:31'),
(83, 7, 1, 33, '<p>asdasd</p>', '2 Days', 0, 33, 33, NULL, '2024-05-27 14:07:32', '2024-05-27 14:07:32'),
(84, 7, 1, 256, '<p>test</p>', '1 Days', 1, 5, 5, NULL, '2024-05-28 14:28:20', '2024-05-30 23:25:51'),
(85, 7, 2, 2500, 'fffcccf fgtyyhe dhdhdhr dydhdhdbd d d ddgdhdhdhdvdv', '1 Days', 0, 5555, 5555, NULL, '2024-06-02 17:05:39', '2024-06-02 17:05:39'),
(86, 7, 1, 223, '<p>GGG</p><p>GG and I are going&nbsp;</p><p>You can go to the doctor and&nbsp;</p>', '1 Days', 1, 9, 9, NULL, '2024-06-04 09:16:34', '2024-06-27 13:25:46'),
(87, 7, 1, 23, NULL, NULL, 1, 0, 0, NULL, '2024-06-05 08:29:05', '2024-06-19 21:05:49'),
(88, 7, 1, 24, NULL, NULL, 1, 0, 0, NULL, '2024-06-05 08:29:17', '2024-06-05 09:29:10'),
(89, 7, 2, 70, 'Thdgo tu Gino Dev Jo faccio jolly bu RM', '1 Days', 0, 1, 1, NULL, '2024-06-09 03:39:33', '2024-06-09 03:39:33'),
(91, 7, 1, 100, 'Hello&nbsp;', 'less than a week', 1, 80, 80, NULL, '2024-06-13 14:07:20', '2024-06-16 09:42:17'),
(92, 7, 1, 200, '<p>dsad</p>', '3 Days', 1, 1, 1, NULL, '2024-06-27 16:28:17', '2024-07-09 05:11:20'),
(93, 7, 1, 55, '<p>nnnnnnnnnnnnnnnnnn</p>', '1 Days', 1, 1, 1, NULL, '2024-07-08 16:17:25', '2024-07-08 16:18:13'),
(94, 7, 1, 100, NULL, NULL, 1, 0, 0, NULL, '2024-07-10 19:46:46', '2024-07-10 22:15:15'),
(95, 7, 1, 3, '<p>cf</p>', '1 Days', 1, 2, 2, NULL, '2024-07-12 17:00:25', '2024-07-12 17:04:41'),
(96, 7, 486, 1550, 'نظام يشمل ويشمل ويشمل', '2 Days', 0, 100, 100, NULL, '2024-07-13 04:43:28', '2024-07-13 04:43:28'),
(97, 7, 1, 25000, '<p>djflkdfj;lkjadgf;</p>', 'Less than a month', 1, 1, 1, NULL, '2024-07-15 14:12:13', '2024-07-15 17:18:00'),
(98, 7, 1, 22, '<p>&nbsp;mlm lml ml m lm lm l ml ml&nbsp;</p>', '1 Days', 0, 2, 2, NULL, '2024-07-23 17:58:36', '2024-07-23 17:58:36'),
(99, 7, 2, 100, '<p>We can get a little closer in We can get a little closer in We can get a little closer in We can get a little closer in We can get a little closer in We can get a little closer in We can get a little closer in We can get a little closer in We can get a little closer in We can get a little closer in We can get a little closer in We can get a little closer in We can get a little closer in We can get a little closer in&nbsp;</p>', '2 Days', 0, 1, 1, NULL, '2024-07-23 17:59:31', '2024-07-23 17:59:31'),
(100, 7, 2, 1000, 'Thus willingness to be able and not to be involved with the company that is&nbsp;', '1 Days', 0, 2, 2, NULL, '2024-07-23 18:05:22', '2024-07-23 18:05:22'),
(101, 7, 1, 1000, '<p>To change the URL of your Flutter app to use localhost, you\'ll need to update the URL in your API calls or network requests within your Flutter code.&nbsp;</p>', '3 Days', 0, 1, 1, NULL, '2024-07-23 18:07:23', '2024-07-23 18:07:23'),
(102, 7, 486, 1000, '<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">ن</font></font></p>', '2 Days', 0, 4, 4, NULL, '2024-07-23 20:53:08', '2024-07-23 20:53:08'),
(103, 7, 1, 50000, 'I will do the job that i described in the above&nbsp;', '3 Days', 0, 1, 1, NULL, '2024-07-24 07:45:32', '2024-07-24 07:45:32'),
(104, 7, 1, 40, '<p>fff</p>', '1 Days', 1, 1, 1, NULL, '2024-07-25 00:57:49', '2024-07-25 00:58:19'),
(105, 7, 1, 50, 'Good&nbsp;', '1 Days', 1, 2, 2, NULL, '2024-07-25 21:13:27', '2024-07-31 13:20:04'),
(106, 7, 1, 100, '<p>tnenw nenw&nbsp;</p>', '3 Days', 1, 1, 1, NULL, '2024-08-03 23:26:30', '2024-08-04 15:17:42'),
(107, 7, 1, 10, NULL, NULL, 1, 0, 0, NULL, '2024-08-04 13:24:12', '2024-08-04 15:12:21'),
(108, 7, 1, 50, '<p>mn</p>', '2 Days', 1, 2, 2, NULL, '2024-08-07 22:57:07', '2024-08-09 11:08:56'),
(109, 7, 637, 5800, 'Fffhjjjjjjjhdss', '1 Days', 0, 88855, 88855, NULL, '2024-08-09 10:40:43', '2024-08-09 10:40:43'),
(110, 7, 1, 30, '<p>,nbm</p>', '1 Days', 1, 2, 2, NULL, '2024-08-10 15:16:22', '2024-08-18 15:20:18');

-- --------------------------------------------------------

--
-- Table structure for table `offer_milestones`
--

CREATE TABLE `offer_milestones` (
  `id` bigint UNSIGNED NOT NULL,
  `offer_id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `deadline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=pending, 1=active, 2=complete, 3=cancel',
  `revision` int NOT NULL DEFAULT '0',
  `revision_left` int NOT NULL DEFAULT '0',
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offer_milestones`
--

INSERT INTO `offer_milestones` (`id`, `offer_id`, `title`, `description`, `price`, `deadline`, `status`, `revision`, `revision_left`, `attachment`, `created_at`, `updated_at`) VALUES
(1, 2, 'First step task', 'You will get the amount after complete each milestone.', 100, 'Less than a month', 0, 2, 2, NULL, '2023-11-07 07:22:05', '2023-11-07 07:22:05'),
(2, 2, 'Second step task', 'You will get the amount after complete each milestone.', 100, 'Less than a month', 0, 2, 2, NULL, '2023-11-07 07:22:05', '2023-11-07 07:22:05'),
(3, 2, 'Third step task', 'You will get the amount after complete each milestone.', 300, 'Less than 3 month', 0, 10, 10, NULL, '2023-11-07 07:22:05', '2023-11-07 07:22:05'),
(4, 6, 'fdf', 'de', 5, '2 Days', 0, 1, 1, NULL, '2023-12-04 00:32:49', '2023-12-04 00:32:49'),
(5, 6, 'dsf', 'de', 5, '3 Days', 0, 2, 2, NULL, '2023-12-04 00:32:49', '2023-12-04 00:32:49'),
(6, 24, '.?.', 'jhkjh', 100, 'Less than a week', 0, 5, 5, NULL, '2024-01-17 10:59:10', '2024-01-17 10:59:10'),
(7, 37, 'test', 'asdfasdfasd', 100, '3 Days', 0, 7, 7, NULL, '2024-02-19 22:28:54', '2024-02-19 22:28:54'),
(8, 39, 'Web Design', 'lorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsum', 125, '3 Days', 0, 7, 7, NULL, '2024-02-19 22:34:57', '2024-02-19 22:34:57'),
(9, 43, 'strt', 'rtet', 100, 'More than 3 month', 0, 1, 1, NULL, '2024-02-21 20:10:05', '2024-02-21 20:10:05'),
(10, 70, 'Nostrum itaque nihil', 'Vitae omnis quia id', 100, '1 Days', 0, 1, 1, NULL, '2024-05-02 00:53:50', '2024-05-02 00:53:50'),
(11, 71, 'jjj', 'jj', 55, '2 Days', 0, 2, 2, NULL, '2024-05-05 00:27:22', '2024-05-05 00:27:22'),
(12, 72, 'jjj', 'jj', 55, '2 Days', 0, 2, 2, NULL, '2024-05-05 00:27:23', '2024-05-05 00:27:23'),
(13, 73, 'jjj', 'jj', 55, '2 Days', 0, 2, 2, NULL, '2024-05-05 00:27:24', '2024-05-05 00:27:24'),
(14, 88, 'gsdgd', 'From the doctor and I just got home from work and I just got home from work&nbsp;', 12, '1 Days', 0, 4, 4, NULL, '2024-06-05 08:29:17', '2024-06-05 08:29:17'),
(15, 88, 'fhggu', 'The same thing I was thinking about you and&nbsp;', 12, '1 Days', 0, 6, 6, NULL, '2024-06-05 08:29:17', '2024-06-05 08:29:17'),
(17, 94, 'trial', '<p>Description&nbsp;</p><p><br></p>', 50, '1 Days', 0, 2, 2, NULL, '2024-07-10 19:46:46', '2024-07-10 19:46:46'),
(18, 94, 'sexond', '<p>Sexond&nbsp;</p><p><br></p><p><br></p>', 50, '2 Days', 0, 1, 1, NULL, '2024-07-10 19:46:46', '2024-07-10 19:46:46'),
(19, 107, 'ms1xxxxxx', 'Testing', 5, '3 Days', 0, 5, 5, NULL, '2024-08-04 13:24:12', '2024-08-04 13:24:12'),
(20, 107, 'ms2xxxx', 'Testing 2', 5, '1 Days', 0, 5, 5, NULL, '2024-08-04 13:24:12', '2024-08-04 13:24:12');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL COMMENT 'client id',
  `freelancer_id` bigint NOT NULL,
  `identity` bigint NOT NULL COMMENT 'project_id or job_id',
  `is_project_job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'project or job',
  `is_basic_standard_premium_custom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'project type',
  `is_fixed_hourly` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'fixed or hourly',
  `is_custom` tinyint NOT NULL DEFAULT '0' COMMENT '1=custom',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=pending, 1=active, 2=delivered, 3=complete, 4=cancel, 5=decline by frl, 6=suspend by ad, 7=hold by ad',
  `email_send` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_before_hold` tinyint NOT NULL DEFAULT '0' COMMENT '0=not hold , 1=hold',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revision_left` int NOT NULL DEFAULT '0',
  `delivery_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` double NOT NULL,
  `commission_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission_charge` double NOT NULL,
  `commission_amount` double NOT NULL DEFAULT '0',
  `transaction_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_charge` double NOT NULL DEFAULT '0',
  `transaction_amount` double NOT NULL DEFAULT '0',
  `payable_amount` double NOT NULL DEFAULT '0',
  `refund_amount` double NOT NULL DEFAULT '0',
  `refund_status` tinyint NOT NULL DEFAULT '0' COMMENT '0=pending, 1=paid',
  `total_hour` double DEFAULT NULL,
  `payment_gateway` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_valid_payment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manual_payment_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `freelancer_id`, `identity`, `is_project_job`, `is_basic_standard_premium_custom`, `is_fixed_hourly`, `is_custom`, `status`, `email_send`, `status_before_hold`, `revision`, `revision_left`, `delivery_time`, `description`, `price`, `commission_type`, `commission_charge`, `commission_amount`, `transaction_type`, `transaction_charge`, `transaction_amount`, `payable_amount`, `refund_amount`, `refund_status`, `total_hour`, `payment_gateway`, `payment_status`, `is_valid_payment`, `transaction_id`, `manual_payment_image`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 68, 'project', 'Premium', NULL, 0, 0, NULL, 0, '3', 3, '1 Days', 'I\'m a Web page designer based in India. I have been a freelance for over 10 years .\n\n Believing that there is beauty in simplicity, I pride myself on using as few elements as possible, engaging viewers as directly as possible with', 71.4, 'percentage', 21, 7, 'percentage', 2, 1.4, 63, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-11-06 23:59:07', '2023-11-06 23:59:07'),
(2, 1, 7, 68, 'project', 'Premium', NULL, 0, 3, NULL, 0, '3', 2, '1 Days', 'I\'m a Web page designer based in India. I have been a freelance for over 10 years .\n\n Believing that there is beauty in simplicity, I pride myself on using as few elements as possible, engaging viewers as directly as possible with', 70, 'percentage', 21, 7, 'percentage', 2, 1.4, 63, 0, 0, NULL, 'mollie', 'complete', NULL, 'tr_FL3ZpRQWne', NULL, '2023-09-06 23:59:19', '2023-11-07 00:54:27'),
(3, 1, 7, 69, 'project', 'Premium', NULL, 0, 0, NULL, 0, '10', 10, 'Less than a month', NULL, 459, 'percentage', 21, 45, 'percentage', 2, 9, 405, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2023-11-07 01:12:26', '2023-11-07 01:12:26'),
(4, 1, 7, 69, 'project', 'Basic', NULL, 0, 3, NULL, 0, '2', 2, '3 Days', 'Hi \ncomplete this order as soon as possible. If you need any info fell free to contact.', 300, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3O9jWCEmGOuJLTMs1SXQL1TI', NULL, '2023-10-07 01:16:10', '2023-11-07 01:37:36'),
(5, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', 'Hi \r\ncomplete this order as soon as possible. If you need any info fell free to contact.', 300, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3O9jkFEmGOuJLTMs1yeMZUFY', NULL, '2023-11-07 01:30:42', '2023-11-07 01:31:27'),
(6, 1, 7, 69, 'project', 'Premium', NULL, 0, 0, NULL, 0, '10', 10, 'Less than a month', 'asd asdasd asd', 459, 'percentage', 21, 45, 'percentage', 2, 9, 405, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2023-11-07 01:32:36', '2023-11-07 01:32:36'),
(8, 1, 7, 70, 'project', 'Premium', NULL, 0, 3, NULL, 0, '1000', 1000, 'Less than 2 month', 'Follow the description.', 1000, 'percentage', 21, 100, 'percentage', 2, 20, 900, 0, 0, NULL, 'mollie', 'complete', NULL, 'tr_yXi45f7ki5', NULL, '2023-11-07 02:15:36', '2023-11-07 03:37:19'),
(9, 1, 7, 11, 'job', 'job', NULL, 0, 3, NULL, 0, '3', 3, 'Less than a month', NULL, 500, 'percentage', 21, 50, 'percentage', 2, 0, 450, 0, 0, NULL, 'manual_payment', 'complete', NULL, NULL, 'manual_attachment_1699353689.png', '2023-11-07 04:41:29', '2023-11-07 04:45:05'),
(10, 1, 7, 1, 'offer', 'offer', NULL, 0, 3, NULL, 0, '5', 5, 'Less than a month', NULL, 600, 'percentage', 21, 60, 'percentage', 2, 12, 540, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3O9oIeEmGOuJLTMs1EoHp87x', NULL, '2023-11-07 06:22:30', '2023-11-07 06:43:33'),
(11, 1, 7, 2, 'offer', 'offer', NULL, 0, 1, NULL, 0, '0', 0, NULL, NULL, 500, 'percentage', 21, 50, 'percentage', 2, 10, 450, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3O9pK9EmGOuJLTMs1YJicOEH', NULL, '2023-11-07 07:28:08', '2023-11-07 07:32:11'),
(12, 2, 7, 68, 'project', 'Standard', NULL, 0, 3, NULL, 0, '2', 2, '1 Days', 'Pay an amount you fixed when a portion of the whole project is completed', 60, 'percentage', 21, 6, 'percentage', 2, 0, 54, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2023-11-07 23:17:28', '2023-11-07 23:20:07'),
(13, 2, 8, 95, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a month', 'Pay an amount you fixed when a portion of the whole project is completed', 100, 'percentage', 21, 21, 'percentage', 2, 0, 79, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2023-11-07 23:26:21', '2023-11-07 23:26:21'),
(14, 2, 8, 94, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 50, 'percentage', 21, 10.5, 'percentage', 2, 0, 39.5, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2023-11-07 23:27:35', '2023-11-07 23:27:35'),
(15, 2, 7, 92, 'project', 'Basic', NULL, 0, 3, NULL, 0, '2', 2, '3 Days', NULL, 150, 'percentage', 21, 15, 'percentage', 2, 0, 135, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2023-11-07 23:28:14', '2023-11-07 23:29:49'),
(16, 1, 8, 94, 'project', 'Basic', NULL, 0, 3, NULL, 0, '1', 1, '1 Days', NULL, 50, 'percentage', 21, 10.5, 'percentage', 2, 1, 39.5, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3OBzX3EmGOuJLTMs1zZU0TKQ', NULL, '2023-11-13 06:46:23', '2023-11-27 06:22:28'),
(17, 1, 7, 70, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 561, 'percentage', 21, 55, 'percentage', 2, 11, 495, 0, 0, NULL, 'mollie', 'pending', NULL, NULL, NULL, '2023-11-14 02:18:44', '2023-11-14 02:18:44'),
(18, 1, 7, 70, 'project', 'Standard', NULL, 0, 0, NULL, 0, '5', 5, 'Less than a month', NULL, 612, 'percentage', 21, 60, 'percentage', 2, 12, 540, 0, 0, NULL, 'mollie', 'pending', NULL, NULL, NULL, '2023-11-14 02:19:07', '2023-11-14 02:19:07'),
(19, 1, 7, 70, 'project', 'Premium', NULL, 0, 0, NULL, 0, '1000', 1000, 'Less than 2 month', NULL, 1020, 'percentage', 21, 100, 'percentage', 2, 20, 900, 0, 0, NULL, 'mollie', 'pending', NULL, NULL, NULL, '2023-11-14 02:19:34', '2023-11-14 02:19:34'),
(20, 1, 7, 110, 'project', 'Premium', NULL, 0, 4, NULL, 0, '1', 1, '1 Days', NULL, 60, 'percentage', 21, 6, 'percentage', 2, 0, 54, 0, 0, NULL, 'manual_payment', 'complete', NULL, NULL, 'manual_attachment_1700052644.png', '2023-11-15 06:50:44', '2023-11-15 06:54:48'),
(21, 1, 7, 110, 'project', 'Premium', NULL, 0, 4, NULL, 0, '1', 1, '1 Days', NULL, 60, 'percentage', 21, 6, 'percentage', 2, 0, 54, 0, 0, NULL, 'manual_payment', 'complete', NULL, NULL, 'manual_attachment_1700053778.png', '2023-11-15 07:09:38', '2023-11-15 07:10:27'),
(22, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', 'dhshsjhs hshs jshsjb', 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2023-11-19 01:26:38', '2023-11-19 01:26:38'),
(23, 1, 7, 105, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', 'dklfasdflkasdfas a ad dasf', 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'mollie', 'pending', NULL, NULL, NULL, '2023-11-23 09:04:46', '2023-11-23 09:04:46'),
(24, 1, 7, 105, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', 'dklfasdflkasdfas a ad dasf', 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2023-11-23 09:05:03', '2023-11-23 09:05:03'),
(25, 1, 7, 108, 'project', 'Basic', NULL, 0, 3, NULL, 0, '1', 1, '1 Days', 'Hi, I have read your project details and I like it. I\'m placing this order as we discuss. Thanks', 100, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'mollie', 'complete', NULL, 'tr_3Jk86mKVVq', NULL, '2023-11-25 07:03:30', '2023-11-25 07:12:08'),
(28, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-04 01:33:57', '2023-12-04 01:33:57'),
(29, 1, 7, 107, 'project', 'Basic', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a month', 'as asd asd asd asdasaioju aiosdasd asd', 100, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'mollie', 'complete', NULL, 'tr_e7Zs7wnycW', NULL, '2023-12-04 02:41:04', '2023-12-04 02:41:57'),
(30, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2023-12-04 04:05:00', '2023-12-04 04:05:00'),
(31, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'paystack', 'pending', NULL, NULL, NULL, '2023-12-04 04:07:08', '2023-12-04 04:07:08'),
(32, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 300, 'percentage', 21, 30, 'percentage', 2, 0, 270, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1701684505.png', '2023-12-04 04:08:25', '2023-12-04 04:08:25'),
(33, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-04 07:42:31', '2023-12-04 07:42:31'),
(34, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-04 10:08:11', '2023-12-04 10:08:11'),
(35, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', 'sadsaas', 50, 'percentage', 21, 5, 'percentage', 2, 0, 45, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2023-12-04 10:14:51', '2023-12-04 10:14:51'),
(36, 1, 7, 107, 'project', 'Basic', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a month', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2023-12-04 13:35:09', '2023-12-04 13:35:09'),
(37, 1, 7, 70, 'project', 'Premium', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 1020, 'percentage', 21, 100, 'percentage', 2, 20, 900, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-04 14:14:44', '2023-12-04 14:14:44'),
(38, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2023-12-05 01:19:44', '2023-12-05 01:19:44'),
(39, 1, 7, 104, 'project', 'Premium', NULL, 0, 0, NULL, 0, '10', 10, '1 Days', NULL, 90, 'percentage', 21, 9, 'percentage', 2, 0, 81, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2023-12-05 02:47:45', '2023-12-05 02:47:45'),
(40, 1, 7, 108, 'project', 'Premium', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a week', NULL, 0, 'percentage', 21, 0, 'percentage', 2, 0, 0, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-05 15:15:38', '2023-12-05 15:15:38'),
(41, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 50, 'percentage', 21, 5, 'percentage', 2, 0, 45, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2023-12-05 21:51:17', '2023-12-05 21:51:17'),
(42, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'mollie', 'pending', NULL, NULL, NULL, '2023-12-06 05:43:43', '2023-12-06 05:43:43'),
(43, 1, 7, 69, 'project', 'Standard', NULL, 0, 0, NULL, 0, '5', 5, '3 Days', NULL, 408, 'percentage', 21, 40, 'percentage', 2, 8, 360, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2023-12-06 06:45:16', '2023-12-06 06:45:16'),
(44, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'toyyibpay', 'pending', NULL, NULL, NULL, '2023-12-07 23:23:16', '2023-12-07 23:23:16'),
(45, 1, 7, 105, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-08 13:36:01', '2023-12-08 13:36:01'),
(46, 1, 7, 9, 'offer', 'offer', NULL, 0, 0, NULL, 0, '10', 10, '3 Days', NULL, 10.2, 'percentage', 21, 1, 'percentage', 2, 0.2, 9, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-09 21:30:47', '2023-12-09 21:30:47'),
(47, 1, 7, 102, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-11 09:24:59', '2023-12-11 09:24:59'),
(48, 1, 7, 69, 'project', 'Premium', NULL, 0, 0, NULL, 0, '10', 10, '3 Days', NULL, 459, 'percentage', 21, 45, 'percentage', 2, 9, 405, 0, 0, NULL, 'flutterwave', 'pending', NULL, NULL, NULL, '2023-12-12 03:40:02', '2023-12-12 03:40:02'),
(49, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'flutterwave', 'pending', NULL, NULL, NULL, '2023-12-12 03:40:21', '2023-12-12 03:40:21'),
(50, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2023-12-12 03:40:48', '2023-12-12 03:40:48'),
(51, 1, 7, 7, 'offer', 'offer', NULL, 0, 0, NULL, 0, '6', 6, '3 Days', NULL, 61.2, 'percentage', 21, 6, 'percentage', 2, 1.2, 54, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-12 12:35:26', '2023-12-12 12:35:26'),
(52, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-12 18:19:52', '2023-12-12 18:19:52'),
(53, 1, 7, 8, 'offer', 'offer', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 10, 'percentage', 21, 1, 'percentage', 2, 0, 9, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2023-12-13 03:44:44', '2023-12-13 03:44:44'),
(54, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3OMzXLEmGOuJLTMs076apmlF', NULL, '2023-12-13 15:00:10', '2023-12-13 15:00:42'),
(55, 1, 8, 95, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a month', NULL, 102, 'percentage', 21, 21, 'percentage', 2, 2, 79, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2023-12-14 17:54:21', '2023-12-14 17:54:21'),
(56, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2023-12-16 05:29:00', '2023-12-16 05:29:00'),
(57, 1, 7, 99, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 204, 'percentage', 21, 20, 'percentage', 2, 4, 180, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2023-12-16 05:29:48', '2023-12-16 05:29:48'),
(58, 1, 7, 99, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 204, 'percentage', 21, 20, 'percentage', 2, 4, 180, 0, 0, NULL, 'instamojo', 'pending', NULL, NULL, NULL, '2023-12-16 05:29:58', '2023-12-16 05:29:58'),
(59, 1, 7, 99, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 204, 'percentage', 21, 20, 'percentage', 2, 4, 180, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2023-12-16 05:30:26', '2023-12-16 05:30:26'),
(60, 1, 7, 68, 'project', 'Premium', NULL, 0, 0, NULL, 0, '3', 3, '1 Days', NULL, 71.4, 'percentage', 21, 7, 'percentage', 2, 1.4, 63, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2023-12-16 05:31:29', '2023-12-16 05:31:29'),
(61, 1, 7, 107, 'project', 'Basic', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a month', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'instamojo', 'pending', NULL, NULL, NULL, '2023-12-16 05:32:29', '2023-12-16 05:32:29'),
(62, 1, 7, 107, 'project', 'Basic', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a month', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2023-12-16 05:32:37', '2023-12-16 05:32:37'),
(63, 1, 7, 107, 'project', 'Basic', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a month', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2023-12-16 05:32:47', '2023-12-16 05:32:47'),
(64, 1, 7, 13, 'offer', 'offer', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a month', NULL, 10, 'percentage', 21, 1, 'percentage', 2, 0, 9, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2023-12-16 08:08:36', '2023-12-16 08:08:36'),
(65, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 50, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3OO4DnEmGOuJLTMs1stFdpu8', NULL, '2023-12-16 14:12:23', '2023-12-16 14:13:08'),
(66, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 50, 'percentage', 21, 5, 'percentage', 2, 0, 45, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1702809546.png', '2023-12-17 04:39:07', '2023-12-17 04:39:07'),
(67, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 300, 'percentage', 21, 30, 'percentage', 2, 0, 270, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1702815661.jpg', '2023-12-17 06:21:01', '2023-12-17 06:21:01'),
(68, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'sitesway', 'pending', NULL, NULL, NULL, '2023-12-17 14:46:38', '2023-12-17 14:46:38'),
(69, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 50, 'percentage', 21, 5, 'percentage', 2, 0, 45, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1702846025.jpg', '2023-12-17 14:47:05', '2023-12-17 14:47:05'),
(70, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-17 19:56:28', '2023-12-17 19:56:28'),
(71, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2023-12-17 19:56:49', '2023-12-17 19:56:49'),
(72, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2023-12-17 19:57:39', '2023-12-17 19:57:39'),
(73, 1, 7, 99, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 204, 'percentage', 21, 20, 'percentage', 2, 4, 180, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-18 12:47:55', '2023-12-18 12:47:55'),
(74, 1, 7, 107, 'project', 'Basic', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a month', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3OOr1rEmGOuJLTMs1tX9mTjV', NULL, '2023-12-18 18:19:22', '2023-12-18 18:19:44'),
(75, 1, 7, 99, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 204, 'percentage', 21, 20, 'percentage', 2, 4, 180, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2023-12-18 20:26:15', '2023-12-18 20:26:15'),
(76, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'instamojo', 'pending', NULL, NULL, NULL, '2023-12-19 10:49:25', '2023-12-19 10:49:25'),
(77, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2023-12-19 10:52:01', '2023-12-19 10:52:01'),
(78, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2023-12-19 10:52:41', '2023-12-19 10:52:41'),
(79, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2023-12-19 10:52:55', '2023-12-19 10:52:55'),
(80, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'cinetpay', 'pending', NULL, NULL, NULL, '2023-12-19 10:53:10', '2023-12-19 10:53:10'),
(81, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-19 13:06:41', '2023-12-19 13:06:41'),
(82, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 50, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'authorize_dot_net', 'complete', NULL, '80011257966', NULL, '2023-12-19 13:07:09', '2023-12-19 13:07:23'),
(83, 1, 7, 68, 'project', 'Premium', NULL, 0, 0, NULL, 0, '3', 3, '1 Days', NULL, 71.4, 'percentage', 21, 7, 'percentage', 2, 1.4, 63, 0, 0, NULL, 'cinetpay', 'pending', NULL, NULL, NULL, '2023-12-20 10:25:09', '2023-12-20 10:25:09'),
(84, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-20 17:39:55', '2023-12-20 17:39:55'),
(85, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2023-12-20 17:40:06', '2023-12-20 17:40:06'),
(86, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2023-12-22 11:06:49', '2023-12-22 11:06:49'),
(87, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'instamojo', 'pending', NULL, NULL, NULL, '2023-12-22 11:06:59', '2023-12-22 11:06:59'),
(88, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2023-12-23 01:15:50', '2023-12-23 01:15:50'),
(89, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 300, 'percentage', 21, 30, 'percentage', 2, 0, 270, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1703315861.png', '2023-12-23 01:17:41', '2023-12-23 01:17:41'),
(90, 1, 7, 17, 'offer', 'offer', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 510, 'percentage', 21, 50, 'percentage', 2, 10, 450, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-23 01:19:47', '2023-12-23 01:19:47'),
(91, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2023-12-24 08:55:23', '2023-12-24 08:55:23'),
(92, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 300, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3OQt6wEmGOuJLTMs110qYUHw', NULL, '2023-12-24 08:57:01', '2023-12-24 08:58:15'),
(93, 1, 7, 99, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 204, 'percentage', 21, 20, 'percentage', 2, 4, 180, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2023-12-24 09:54:12', '2023-12-24 09:54:12'),
(94, 1, 7, 99, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 200, 'percentage', 21, 20, 'percentage', 2, 4, 180, 0, 0, NULL, 'razorpay', 'complete', NULL, 'pay_NGEtvOGWixn8Lq', NULL, '2023-12-24 09:54:34', '2023-12-24 09:55:28'),
(95, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'instamojo', 'pending', NULL, NULL, NULL, '2023-12-24 09:57:24', '2023-12-24 09:57:24'),
(96, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2023-12-25 12:30:15', '2023-12-25 12:30:15'),
(97, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-25 12:57:05', '2023-12-25 12:57:05'),
(98, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2023-12-25 13:00:24', '2023-12-25 13:00:24'),
(99, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 300, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'razorpay', 'complete', NULL, 'pay_NGgb5cuZgpK3wH', NULL, '2023-12-25 13:00:39', '2023-12-25 13:01:03'),
(100, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2023-12-25 13:01:48', '2023-12-25 13:01:48'),
(101, 1, 7, 108, 'project', 'Premium', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a week', NULL, 0, 'percentage', 21, 0, 'percentage', 2, 0, 0, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2023-12-25 22:00:12', '2023-12-25 22:00:12'),
(102, 1, 8, 96, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 204, 'percentage', 21, 42, 'percentage', 2, 4, 158, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-25 22:25:34', '2023-12-25 22:25:34'),
(103, 1, 8, 96, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 204, 'percentage', 21, 42, 'percentage', 2, 4, 158, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2023-12-25 22:25:54', '2023-12-25 22:25:54'),
(104, 1, 8, 96, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 204, 'percentage', 21, 42, 'percentage', 2, 4, 158, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2023-12-25 22:26:17', '2023-12-25 22:26:17'),
(105, 1, 7, 107, 'project', 'Basic', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a month', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-26 06:27:05', '2023-12-26 06:27:05'),
(106, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3ORapuEmGOuJLTMs0mi4TZuU', NULL, '2023-12-26 07:38:18', '2023-12-26 07:39:51'),
(107, 1, 7, 104, 'project', 'Basic', NULL, 0, 0, NULL, 0, '5', 5, '1 Days', 'fghfgh', 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-26 11:33:24', '2023-12-26 11:33:24'),
(108, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2023-12-26 22:56:14', '2023-12-26 22:56:14'),
(109, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-27 09:30:51', '2023-12-27 09:30:51'),
(110, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2023-12-27 11:08:47', '2023-12-27 11:08:47'),
(111, 1, 7, 18, 'offer', 'offer', NULL, 0, 0, NULL, 0, '20', 20, '3 Days', NULL, 5100, 'percentage', 21, 500, 'percentage', 2, 100, 4500, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2023-12-28 03:43:16', '2023-12-28 03:43:16'),
(112, 1, 7, 15, 'offer', 'offer', NULL, 0, 0, NULL, 0, '10', 10, '2 Days', NULL, 10.2, 'percentage', 21, 1, 'percentage', 2, 0.2, 9, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2023-12-31 05:34:11', '2023-12-31 05:34:11'),
(113, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'iyzipay', 'pending', NULL, NULL, NULL, '2024-01-01 16:57:16', '2024-01-01 16:57:16'),
(114, 1, 7, 99, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 204, 'percentage', 21, 20, 'percentage', 2, 4, 180, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-04 01:30:27', '2024-01-04 01:30:27'),
(115, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-04 02:53:42', '2024-01-04 02:53:42'),
(116, 1, 7, 69, 'project', 'Standard', NULL, 0, 0, NULL, 0, '5', 5, '3 Days', NULL, 408, 'percentage', 21, 40, 'percentage', 2, 8, 360, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-04 12:20:46', '2024-01-04 12:20:46'),
(117, 1, 7, 13, 'job', 'job', NULL, 0, 0, NULL, 0, '3', 3, 'Less than 2 month', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-05 08:39:49', '2024-01-05 08:39:49'),
(118, 1, 7, 13, 'job', 'job', NULL, 0, 0, NULL, 0, '3', 3, 'Less than 2 month', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-01-05 08:44:11', '2024-01-05 08:44:11'),
(119, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-05 09:28:09', '2024-01-05 09:28:09'),
(120, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-01-05 09:28:29', '2024-01-05 09:28:29'),
(121, 1, 7, 107, 'project', 'Basic', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a month', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-01-05 10:55:56', '2024-01-05 10:55:56'),
(122, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-01-06 14:46:07', '2024-01-06 14:46:07'),
(123, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-01-06 14:54:36', '2024-01-06 14:54:36'),
(124, 1, 7, 108, 'project', 'Standard', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-06 14:56:13', '2024-01-06 14:56:13'),
(125, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'billplz', 'pending', NULL, NULL, NULL, '2024-01-08 21:51:16', '2024-01-08 21:51:16'),
(126, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2024-01-08 21:51:30', '2024-01-08 21:51:30'),
(127, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-01-08 21:51:36', '2024-01-08 21:51:36'),
(128, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-01-08 21:51:44', '2024-01-08 21:51:44'),
(129, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-09 01:29:54', '2024-01-09 01:29:54'),
(130, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-09 02:22:34', '2024-01-09 02:22:34'),
(131, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', 'dtshlsikuyt oetu8 ouopjopdsfg', 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-09 03:46:34', '2024-01-09 03:46:34'),
(132, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-09 06:00:03', '2024-01-09 06:00:03'),
(133, 1, 7, 92, 'project', 'Basic', NULL, 0, 1, NULL, 0, '2', 2, 'Less than a week', NULL, 150, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3OWecEEmGOuJLTMs0054AGcb', NULL, '2024-01-09 06:41:08', '2024-01-17 07:55:03'),
(134, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'iyzipay', 'pending', NULL, NULL, NULL, '2024-01-10 05:05:11', '2024-01-10 05:05:11'),
(135, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 150, 'percentage', 21, 15, 'percentage', 2, 0, 135, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1704884725.jpg', '2024-01-10 05:05:25', '2024-01-10 05:05:25'),
(136, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-10 07:40:13', '2024-01-10 07:40:13'),
(137, 1, 7, 70, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 561, 'percentage', 21, 55, 'percentage', 2, 11, 495, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-10 13:32:14', '2024-01-10 13:32:14'),
(138, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'iyzipay', 'pending', NULL, NULL, NULL, '2024-01-11 08:30:51', '2024-01-11 08:30:51'),
(139, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'iyzipay', 'pending', NULL, NULL, NULL, '2024-01-11 10:24:59', '2024-01-11 10:24:59'),
(140, 121, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-11 18:16:33', '2024-01-11 18:16:33'),
(141, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2024-01-12 01:39:06', '2024-01-12 01:39:06'),
(142, 123, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-01-12 05:06:06', '2024-01-12 05:06:06'),
(143, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 306, 'percentage', 21, 63, 'percentage', 2, 6, 237, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-12 12:54:31', '2024-01-12 12:54:31'),
(144, 1, 7, 69, 'project', 'Basic', NULL, 0, 1, NULL, 0, '2', 2, '3 Days', NULL, 300, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3OYBsbEmGOuJLTMs0UYWPNii', NULL, '2024-01-13 12:24:22', '2024-01-17 07:55:39'),
(145, 1, 7, 105, 'project', 'Basic', NULL, 0, 5, NULL, 0, '1', 1, '1 Days', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3OYZI2EmGOuJLTMs0CVjz2h0', NULL, '2024-01-14 13:24:13', '2024-01-17 07:54:53'),
(146, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-01-15 06:33:14', '2024-01-15 06:33:14'),
(147, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-15 14:42:05', '2024-01-15 14:42:05'),
(148, 1, 7, 15, 'job', 'job', NULL, 0, 0, NULL, 0, '5', 5, '3 Days', NULL, 58.14, 'percentage', 21, 5.7, 'percentage', 2, 1.14, 51.3, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-15 15:39:06', '2024-01-15 15:39:06'),
(149, 1, 7, 15, 'job', 'job', NULL, 0, 0, NULL, 0, '5', 5, '3 Days', NULL, 58.14, 'percentage', 21, 5.7, 'percentage', 2, 1.14, 51.3, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-15 15:39:07', '2024-01-15 15:39:07'),
(150, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-16 09:41:22', '2024-01-16 09:41:22'),
(151, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 150, 'percentage', 21, 15, 'percentage', 2, 0, 135, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1705419703.png', '2024-01-16 09:41:43', '2024-01-16 09:41:43'),
(152, 1, 7, 22, 'offer', 'offer', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 127.5, 'percentage', 21, 12.5, 'percentage', 2, 2.5, 112.5, 0, 0, NULL, 'authorize_dot_net', 'pending', NULL, NULL, NULL, '2024-01-16 09:52:46', '2024-01-16 09:52:46'),
(153, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 50, 'percentage', 21, 5, 'percentage', 2, 0, 45, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-01-17 08:30:53', '2024-01-17 08:30:53'),
(154, 1, 7, 15, 'job', 'job', NULL, 0, 0, NULL, 0, '5', 5, '3 Days', NULL, 58.14, 'percentage', 21, 5.7, 'percentage', 2, 1.14, 51.3, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-01-18 22:41:35', '2024-01-18 22:41:35'),
(155, 1, 7, 15, 'job', 'job', NULL, 0, 0, NULL, 0, '5', 5, '3 Days', NULL, 57, 'percentage', 21, 5.7, 'percentage', 2, 1.14, 51.3, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3OaD5FEmGOuJLTMs1ZRZRxfC', NULL, '2024-01-19 02:05:47', '2024-01-19 02:06:13'),
(156, 1, 7, 12, 'job', 'job', NULL, 0, 0, NULL, 0, '50', 50, '1 Days', NULL, 20, 'percentage', 21, 2, 'percentage', 2, 0.4, 18, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3OaDGQEmGOuJLTMs1IaInotI', NULL, '2024-01-19 02:17:21', '2024-01-19 02:17:49'),
(157, 1, 7, 24, 'offer', 'offer', NULL, 0, 0, NULL, 0, '0', 0, NULL, NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-19 02:18:43', '2024-01-19 02:18:43'),
(158, 1, 7, 24, 'offer', 'offer', NULL, 0, 0, NULL, 0, '0', 0, NULL, NULL, 100, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3OaDIIEmGOuJLTMs0vzAr0P9', NULL, '2024-01-19 02:19:16', '2024-01-19 02:20:14'),
(159, 1, 7, 104, 'project', 'Basic', NULL, 0, 0, NULL, 0, '5', 5, '1 Days', NULL, 50, 'percentage', 21, 5, 'percentage', 2, 0, 45, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-01-19 18:53:46', '2024-01-19 18:53:46'),
(160, 1, 7, 27, 'offer', 'offer', NULL, 0, 0, NULL, 0, '1', 1, '3 Days', NULL, 250, 'percentage', 21, 25, 'percentage', 2, 5, 225, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3OahXoEmGOuJLTMs0OLUVBp8', NULL, '2024-01-20 10:37:18', '2024-01-20 10:38:13'),
(161, 1, 7, 15, 'job', 'job', NULL, 0, 0, NULL, 0, '5', 5, '3 Days', NULL, 58.14, 'percentage', 21, 5.7, 'percentage', 2, 1.14, 51.3, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-21 03:40:20', '2024-01-21 03:40:20'),
(162, 1, 7, 15, 'job', 'job', NULL, 0, 0, NULL, 0, '5', 5, '3 Days', NULL, 58.14, 'percentage', 21, 5.7, 'percentage', 2, 1.14, 51.3, 0, 0, NULL, 'mollie', 'pending', NULL, NULL, NULL, '2024-01-21 03:40:40', '2024-01-21 03:40:40'),
(163, 1, 7, 15, 'job', 'job', NULL, 0, 0, NULL, 0, '5', 5, '3 Days', NULL, 57, 'percentage', 21, 5.7, 'percentage', 2, 1.14, 51.3, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3OaxWMEmGOuJLTMs0uxaqImJ', NULL, '2024-01-21 03:40:52', '2024-01-21 03:41:20'),
(164, 1, 7, 15, 'job', 'job', NULL, 0, 0, NULL, 0, '5', 5, '3 Days', NULL, 58.14, 'percentage', 21, 5.7, 'percentage', 2, 1.14, 51.3, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-21 04:24:18', '2024-01-21 04:24:18'),
(165, 1, 7, 15, 'job', 'job', NULL, 0, 0, NULL, 0, '5', 5, '3 Days', NULL, 58.14, 'percentage', 21, 5.7, 'percentage', 2, 1.14, 51.3, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-01-21 06:16:41', '2024-01-21 06:16:41'),
(166, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'marcadopago', 'pending', NULL, NULL, NULL, '2024-01-21 23:07:07', '2024-01-21 23:07:07'),
(167, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-21 23:09:24', '2024-01-21 23:09:24'),
(168, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-21 23:09:35', '2024-01-21 23:09:35'),
(169, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 50, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3ObJ4rEmGOuJLTMs1CinT6A0', NULL, '2024-01-22 02:41:56', '2024-01-22 02:42:27'),
(170, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-22 05:42:02', '2024-01-22 05:42:02'),
(171, 1, 7, 21, 'offer', 'offer', NULL, 0, 0, NULL, 0, '1', 1, '3 Days', NULL, 91.8, 'percentage', 21, 9, 'percentage', 2, 1.8, 81, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-01-22 11:12:36', '2024-01-22 11:12:36'),
(172, 1, 7, 14, 'offer', 'offer', NULL, 0, 0, NULL, 0, '12', 12, '3 Days', NULL, 255, 'percentage', 21, 25, 'percentage', 2, 5, 225, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-01-22 21:10:56', '2024-01-22 21:10:56'),
(173, 1, 7, 12, 'job', 'job', NULL, 0, 0, NULL, 0, '50', 50, '1 Days', NULL, 20, 'percentage', 21, 2, 'percentage', 2, 0.4, 18, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3ObaYBEmGOuJLTMs0fqv55Ir', NULL, '2024-01-22 21:21:21', '2024-01-22 21:21:44'),
(174, 1, 8, 96, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 204, 'percentage', 21, 42, 'percentage', 2, 4, 158, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-01-22 22:36:46', '2024-01-22 22:36:46'),
(175, 1, 8, 96, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 200, 'percentage', 21, 42, 'percentage', 2, 4, 158, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3ObbjAEmGOuJLTMs1YnTiSDL', NULL, '2024-01-22 22:36:47', '2024-01-22 22:37:07'),
(176, 1, 7, 15, 'job', 'job', NULL, 0, 0, NULL, 0, '5', 5, '3 Days', NULL, 57, 'percentage', 21, 5.7, 'percentage', 2, 1.14, 51.3, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3ObbpWEmGOuJLTMs1Uv4nOAV', NULL, '2024-01-22 22:43:20', '2024-01-22 22:43:48'),
(177, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-23 02:06:08', '2024-01-23 02:06:08'),
(178, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'mollie', 'pending', NULL, NULL, NULL, '2024-01-23 04:08:15', '2024-01-23 04:08:15'),
(179, 1, 7, 108, 'project', 'Premium', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a week', NULL, 0, 'percentage', 21, 0, 'percentage', 2, 0, 0, 0, 0, NULL, 'iyzipay', 'pending', NULL, NULL, NULL, '2024-01-24 12:08:18', '2024-01-24 12:08:18'),
(180, 1, 7, 108, 'project', 'Standard', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 150, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3OcjyEEmGOuJLTMs1naCnHxg', NULL, '2024-01-26 01:37:00', '2024-01-26 01:38:10'),
(181, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', 'fhhskj doifgo odfig odg', 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-26 23:16:12', '2024-01-26 23:16:12'),
(182, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-27 03:53:55', '2024-01-27 03:53:55'),
(183, 1, 7, 104, 'project', 'Standard', NULL, 0, 0, NULL, 0, '10', 10, '1 Days', NULL, 70.38, 'percentage', 21, 6.9, 'percentage', 2, 1.38, 62.1, 0, 0, NULL, 'paystack', 'pending', NULL, NULL, NULL, '2024-01-27 06:21:45', '2024-01-27 06:21:45'),
(184, 158, 8, 97, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 204, 'percentage', 21, 42, 'percentage', 2, 4, 158, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2024-01-27 07:45:39', '2024-01-27 07:45:39'),
(185, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', 'iuiyuy', 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-01-28 03:02:08', '2024-01-28 03:02:08'),
(186, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2024-01-28 17:53:32', '2024-01-28 17:53:32'),
(187, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2024-01-28 17:53:55', '2024-01-28 17:53:55'),
(188, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2024-01-28 17:55:00', '2024-01-28 17:55:00'),
(189, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-29 15:02:06', '2024-01-29 15:02:06'),
(190, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3Oe1yFEmGOuJLTMs1EtWxXi9', NULL, '2024-01-29 15:02:21', '2024-01-29 15:02:57'),
(191, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-01-30 11:50:48', '2024-01-30 11:50:48'),
(192, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'midtrans', 'pending', NULL, NULL, NULL, '2024-02-02 19:28:04', '2024-02-02 19:28:04'),
(193, 1, 7, 105, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1707017705.jpg', '2024-02-03 21:35:05', '2024-02-03 21:35:05'),
(194, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-02-04 08:35:53', '2024-02-04 08:35:53'),
(195, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1707057370.png', '2024-02-04 08:36:10', '2024-02-04 08:36:10'),
(196, 1, 7, 108, 'project', 'Premium', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a week', NULL, 0, 'percentage', 21, 0, 'percentage', 2, 0, 0, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-04 09:22:42', '2024-02-04 09:22:42'),
(197, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-04 09:23:07', '2024-02-04 09:23:07'),
(198, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-04 11:24:44', '2024-02-04 11:24:44'),
(199, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1707068417.png', '2024-02-04 11:40:17', '2024-02-04 11:40:17'),
(200, 1, 7, 102, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1707068648.png', '2024-02-04 11:44:08', '2024-02-04 11:44:08'),
(201, 1, 7, 105, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-02-05 03:36:48', '2024-02-05 03:36:48'),
(202, 1, 7, 92, 'project', 'Premium', NULL, 0, 0, NULL, 0, '10', 10, 'Less than a week', NULL, 408, 'percentage', 21, 40, 'percentage', 2, 8, 360, 0, 0, NULL, 'mollie', 'pending', NULL, NULL, NULL, '2024-02-05 13:14:36', '2024-02-05 13:14:36'),
(203, 1, 7, 99, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 200, 'percentage', 21, 20, 'percentage', 2, 4, 180, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3OhXhNEmGOuJLTMs0CIsW9zE', NULL, '2024-02-08 07:31:25', '2024-02-08 07:31:56'),
(204, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-08 12:17:43', '2024-02-08 12:17:43'),
(205, 1, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 300, 'percentage', 21, 30, 'percentage', 2, 0, 270, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1707416361.png', '2024-02-08 12:19:21', '2024-02-08 12:19:21');
INSERT INTO `orders` (`id`, `user_id`, `freelancer_id`, `identity`, `is_project_job`, `is_basic_standard_premium_custom`, `is_fixed_hourly`, `is_custom`, `status`, `email_send`, `status_before_hold`, `revision`, `revision_left`, `delivery_time`, `description`, `price`, `commission_type`, `commission_charge`, `commission_amount`, `transaction_type`, `transaction_charge`, `transaction_amount`, `payable_amount`, `refund_amount`, `refund_status`, `total_hour`, `payment_gateway`, `payment_status`, `is_valid_payment`, `transaction_id`, `manual_payment_image`, `created_at`, `updated_at`) VALUES
(206, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'zitopay', 'pending', NULL, NULL, NULL, '2024-02-09 06:46:39', '2024-02-09 06:46:39'),
(207, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-09 16:31:55', '2024-02-09 16:31:55'),
(208, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 50, 'percentage', 21, 5, 'percentage', 2, 0, 45, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1707517945.jpg', '2024-02-09 16:32:25', '2024-02-09 16:32:25'),
(209, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-10 01:13:47', '2024-02-10 01:13:47'),
(210, 21, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-02-10 04:00:41', '2024-02-10 04:00:41'),
(211, 153, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'payfast', 'pending', NULL, NULL, NULL, '2024-02-10 18:12:34', '2024-02-10 18:12:34'),
(212, 1, 7, 108, 'project', 'Standard', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'cinetpay', 'pending', NULL, NULL, NULL, '2024-02-10 23:12:14', '2024-02-10 23:12:14'),
(213, 1, 7, 108, 'project', 'Premium', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a week', NULL, 0, 'percentage', 21, 0, 'percentage', 2, 0, 0, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-02-11 02:06:12', '2024-02-11 02:06:12'),
(214, 21, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-11 04:28:11', '2024-02-11 04:28:11'),
(215, 1, 7, 92, 'project', 'Premium', NULL, 0, 0, NULL, 0, '10', 10, 'Less than a week', NULL, 408, 'percentage', 21, 40, 'percentage', 2, 8, 360, 0, 0, NULL, 'flutterwave', 'pending', NULL, NULL, NULL, '2024-02-13 00:57:05', '2024-02-13 00:57:05'),
(216, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-13 01:10:37', '2024-02-13 01:10:37'),
(217, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'iyzipay', 'pending', NULL, NULL, NULL, '2024-02-15 03:37:18', '2024-02-15 03:37:18'),
(218, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-15 03:38:17', '2024-02-15 03:38:17'),
(219, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2024-02-15 03:38:26', '2024-02-15 03:38:26'),
(220, 1, 7, 69, 'project', 'Premium', NULL, 0, 0, NULL, 0, '10', 10, '3 Days', NULL, 459, 'percentage', 21, 45, 'percentage', 2, 9, 405, 0, 0, NULL, 'mollie', 'pending', NULL, NULL, NULL, '2024-02-16 12:31:28', '2024-02-16 12:31:28'),
(221, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'billplz', 'pending', NULL, NULL, NULL, '2024-02-16 18:02:59', '2024-02-16 18:02:59'),
(222, 1, 7, 104, 'project', 'Basic', NULL, 0, 0, NULL, 0, '5', 5, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-16 20:01:52', '2024-02-16 20:01:52'),
(223, 1, 7, 105, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-17 07:23:16', '2024-02-17 07:23:16'),
(224, 224, 8, 97, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 204, 'percentage', 21, 42, 'percentage', 2, 4, 158, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-02-17 10:22:26', '2024-02-17 10:22:26'),
(225, 1, 7, 36, 'offer', 'offer', NULL, 0, 0, NULL, 0, '1', 1, '3 Days', NULL, 3399.66, 'percentage', 21, 333.3, 'percentage', 2, 66.66, 2999.7, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-17 11:33:39', '2024-02-17 11:33:39'),
(226, 1, 7, 107, 'project', 'Basic', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a month', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paytabs', 'pending', NULL, NULL, NULL, '2024-02-17 11:34:53', '2024-02-17 11:34:53'),
(227, 1, 7, 92, 'project', 'Premium', NULL, 0, 0, NULL, 0, '10', 10, 'Less than a week', NULL, 408, 'percentage', 21, 40, 'percentage', 2, 8, 360, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-17 15:25:47', '2024-02-17 15:25:47'),
(228, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-17 15:26:17', '2024-02-17 15:26:17'),
(229, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-18 02:59:40', '2024-02-18 02:59:40'),
(230, 1, 7, 15, 'job', 'job', NULL, 0, 0, NULL, 0, '5', 5, '3 Days', NULL, 58.14, 'percentage', 21, 5.7, 'percentage', 2, 1.14, 51.3, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-18 10:32:25', '2024-02-18 10:32:25'),
(231, 1, 7, 15, 'job', 'job', NULL, 0, 0, NULL, 0, '5', 5, '3 Days', NULL, 58.14, 'percentage', 21, 5.7, 'percentage', 2, 1.14, 51.3, 0, 0, NULL, 'paystack', 'pending', NULL, NULL, NULL, '2024-02-18 10:32:41', '2024-02-18 10:32:41'),
(232, 1, 7, 37, 'offer', 'offer', NULL, 0, 0, NULL, 0, '0', 0, NULL, NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-02-19 22:30:27', '2024-02-19 22:30:27'),
(233, 1, 7, 39, 'offer', 'offer', NULL, 0, 0, NULL, 0, '0', 0, NULL, NULL, 127.5, 'percentage', 21, 12.5, 'percentage', 2, 2.5, 112.5, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-02-19 22:40:34', '2024-02-19 22:40:34'),
(234, 1, 7, 41, 'offer', 'offer', NULL, 0, 0, NULL, 0, '7', 7, '2 Days', NULL, 122.4, 'percentage', 21, 12, 'percentage', 2, 2.4, 108, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-02-19 23:36:40', '2024-02-19 23:36:40'),
(235, 1, 7, 41, 'offer', 'offer', NULL, 0, 0, NULL, 0, '7', 7, '2 Days', NULL, 122.4, 'percentage', 21, 12, 'percentage', 2, 2.4, 108, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-02-19 23:37:29', '2024-02-19 23:37:29'),
(236, 1, 7, 41, 'offer', 'offer', NULL, 0, 0, NULL, 0, '7', 7, '2 Days', NULL, 120, 'percentage', 21, 12, 'percentage', 2, 2.4, 108, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3Olm2HEmGOuJLTMs1fasK6sD', NULL, '2024-02-19 23:38:31', '2024-02-19 23:38:45'),
(237, 1, 7, 15, 'job', 'job', NULL, 0, 0, NULL, 0, '5', 5, '3 Days', NULL, 58.14, 'percentage', 21, 5.7, 'percentage', 2, 1.14, 51.3, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-20 07:40:21', '2024-02-20 07:40:21'),
(238, 241, 7, 69, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-02-20 13:36:39', '2024-02-20 13:36:39'),
(239, 241, 7, 92, 'project', 'Standard', NULL, 0, 0, NULL, 0, '5', 5, 'Less than a week', NULL, 255, 'percentage', 21, 25, 'percentage', 2, 5, 225, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-20 14:09:00', '2024-02-20 14:09:00'),
(240, 241, 7, 92, 'project', 'Standard', NULL, 0, 0, NULL, 0, '5', 5, 'Less than a week', NULL, 255, 'percentage', 21, 25, 'percentage', 2, 5, 225, 0, 0, NULL, 'mollie', 'pending', NULL, NULL, NULL, '2024-02-20 14:09:13', '2024-02-20 14:09:13'),
(241, 241, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2024-02-20 14:09:38', '2024-02-20 14:09:38'),
(242, 241, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-02-20 14:10:41', '2024-02-20 14:10:41'),
(243, 241, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'squareup', 'pending', NULL, NULL, NULL, '2024-02-20 14:10:56', '2024-02-20 14:10:56'),
(244, 1, 7, 105, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-21 02:43:07', '2024-02-21 02:43:07'),
(245, 1, 7, 105, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'razorpay', 'complete', NULL, 'pay_NdW3pbetdboHjb', NULL, '2024-02-21 05:38:41', '2024-02-21 05:39:44'),
(246, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 50, 'percentage', 21, 5, 'percentage', 2, 0, 45, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1708540844.jpg', '2024-02-21 12:40:44', '2024-02-21 12:40:44'),
(247, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paytabs', 'pending', NULL, NULL, NULL, '2024-02-21 15:09:18', '2024-02-21 15:09:18'),
(248, 1, 7, 43, 'offer', 'offer', NULL, 0, 0, NULL, 0, '0', 0, NULL, NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-21 21:22:13', '2024-02-21 21:22:13'),
(249, 1, 7, 43, 'offer', 'offer', NULL, 0, 0, NULL, 0, '0', 0, NULL, NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'mollie', 'pending', NULL, NULL, NULL, '2024-02-21 21:23:19', '2024-02-21 21:23:19'),
(250, 1, 7, 43, 'offer', 'offer', NULL, 0, 0, NULL, 0, '0', 0, NULL, NULL, 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1708572261.png', '2024-02-21 21:24:21', '2024-02-21 21:24:21'),
(251, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-21 21:27:43', '2024-02-21 21:27:43'),
(252, 1, 7, 40, 'offer', 'offer', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a month', NULL, 34.68, 'percentage', 21, 3.4, 'percentage', 2, 0.68, 30.6, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-21 21:28:06', '2024-02-21 21:28:06'),
(253, 1, 7, 44, 'offer', 'offer', NULL, 0, 0, NULL, 0, '1', 1, '2 Days', NULL, 9.18, 'percentage', 21, 0.9, 'percentage', 2, 0.18, 8.1, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-21 23:19:55', '2024-02-21 23:19:55'),
(254, 1, 7, 15, 'job', 'job', NULL, 0, 0, NULL, 0, '5', 5, '3 Days', NULL, 58.14, 'percentage', 21, 5.7, 'percentage', 2, 1.14, 51.3, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-22 13:13:55', '2024-02-22 13:13:55'),
(255, 1, 7, 15, 'job', 'job', NULL, 0, 0, NULL, 0, '5', 5, '3 Days', NULL, 57, 'percentage', 21, 5.7, 'percentage', 2, 1.14, 51.3, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3OmhicEmGOuJLTMs13DeW3Kz', NULL, '2024-02-22 13:14:04', '2024-02-22 13:14:58'),
(256, 1, 7, 14, 'job', 'job', NULL, 0, 0, NULL, 0, '1', 1, '2 Days', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1708650424.png', '2024-02-22 19:07:04', '2024-02-22 19:07:04'),
(257, 1, 7, 13, 'job', 'job', NULL, 0, 0, NULL, 0, '3', 3, 'Less than 2 month', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1708651097.png', '2024-02-22 19:18:17', '2024-02-22 19:18:17'),
(258, 1, 7, 44, 'offer', 'offer', NULL, 0, 0, NULL, 0, '1', 1, '2 Days', NULL, 9.18, 'percentage', 21, 0.9, 'percentage', 2, 0.18, 8.1, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-23 07:37:27', '2024-02-23 07:37:27'),
(259, 1, 7, 44, 'offer', 'offer', NULL, 0, 0, NULL, 0, '1', 1, '2 Days', NULL, 9.18, 'percentage', 21, 0.9, 'percentage', 2, 0.18, 8.1, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-23 12:36:46', '2024-02-23 12:36:46'),
(260, 1, 7, 105, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-02-23 22:57:00', '2024-02-23 22:57:00'),
(261, 1, 7, 107, 'project', 'Premium', NULL, 0, 0, NULL, 0, '9', 9, 'Less than a month', NULL, 300, 'percentage', 21, 30, 'percentage', 2, 0, 270, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1708795832.png', '2024-02-24 11:30:32', '2024-02-24 11:30:32'),
(262, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2024-02-24 11:45:03', '2024-02-24 11:45:03'),
(263, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-02-24 12:06:42', '2024-02-24 12:06:42'),
(264, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-24 13:08:03', '2024-02-24 13:08:03'),
(265, 262, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-24 18:06:08', '2024-02-24 18:06:08'),
(266, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'flutterwave', 'pending', NULL, NULL, NULL, '2024-02-27 16:33:10', '2024-02-27 16:33:10'),
(267, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-27 16:33:27', '2024-02-27 16:33:27'),
(268, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paystack', 'pending', NULL, NULL, NULL, '2024-02-27 16:33:45', '2024-02-27 16:33:45'),
(269, 1, 7, 47, 'offer', 'offer', NULL, 0, 0, NULL, 0, '1', 1, '3 Days', NULL, 566.1, 'percentage', 21, 55.5, 'percentage', 2, 11.1, 499.5, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-02-28 00:23:16', '2024-02-28 00:23:16'),
(270, 1, 7, 47, 'offer', 'offer', NULL, 0, 0, NULL, 0, '1', 1, '3 Days', NULL, 566.1, 'percentage', 21, 55.5, 'percentage', 2, 11.1, 499.5, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-02-29 00:28:23', '2024-02-29 00:28:23'),
(271, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 306, 'percentage', 21, 63, 'percentage', 2, 6, 237, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-02-29 07:51:18', '2024-02-29 07:51:18'),
(272, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 306, 'percentage', 21, 63, 'percentage', 2, 6, 237, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2024-02-29 07:52:15', '2024-02-29 07:52:15'),
(273, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 306, 'percentage', 21, 63, 'percentage', 2, 6, 237, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-02-29 07:52:28', '2024-02-29 07:52:28'),
(274, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 306, 'percentage', 21, 63, 'percentage', 2, 6, 237, 0, 0, NULL, 'flutterwave', 'pending', NULL, NULL, NULL, '2024-02-29 07:52:41', '2024-02-29 07:52:41'),
(275, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 306, 'percentage', 21, 63, 'percentage', 2, 6, 237, 0, 0, NULL, 'paystack', 'pending', NULL, NULL, NULL, '2024-02-29 07:52:52', '2024-02-29 07:52:52'),
(276, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 306, 'percentage', 21, 63, 'percentage', 2, 6, 237, 0, 0, NULL, 'marcadopago', 'pending', NULL, NULL, NULL, '2024-02-29 07:53:11', '2024-02-29 07:53:11'),
(277, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 306, 'percentage', 21, 63, 'percentage', 2, 6, 237, 0, 0, NULL, 'instamojo', 'pending', NULL, NULL, NULL, '2024-02-29 07:53:23', '2024-02-29 07:53:23'),
(278, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 306, 'percentage', 21, 63, 'percentage', 2, 6, 237, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2024-02-29 07:53:34', '2024-02-29 07:53:34'),
(279, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 306, 'percentage', 21, 63, 'percentage', 2, 6, 237, 0, 0, NULL, 'payfast', 'pending', NULL, NULL, NULL, '2024-02-29 07:53:51', '2024-02-29 07:53:51'),
(280, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 306, 'percentage', 21, 63, 'percentage', 2, 6, 237, 0, 0, NULL, 'midtrans', 'pending', NULL, NULL, NULL, '2024-02-29 07:54:01', '2024-02-29 07:54:01'),
(281, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 306, 'percentage', 21, 63, 'percentage', 2, 6, 237, 0, 0, NULL, 'midtrans', 'pending', NULL, NULL, NULL, '2024-02-29 07:55:08', '2024-02-29 07:55:08'),
(282, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'midtrans', 'pending', NULL, NULL, NULL, '2024-02-29 07:55:48', '2024-02-29 07:55:48'),
(283, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'squareup', 'pending', NULL, NULL, NULL, '2024-02-29 07:58:24', '2024-02-29 07:58:24'),
(284, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'cinetpay', 'pending', NULL, NULL, NULL, '2024-02-29 07:58:42', '2024-02-29 07:58:42'),
(285, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paytabs', 'pending', NULL, NULL, NULL, '2024-02-29 07:59:16', '2024-02-29 07:59:16'),
(286, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'billplz', 'pending', NULL, NULL, NULL, '2024-02-29 07:59:25', '2024-02-29 07:59:25'),
(287, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'zitopay', 'pending', NULL, NULL, NULL, '2024-02-29 07:59:39', '2024-02-29 07:59:39'),
(288, 270, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-29 09:43:41', '2024-02-29 09:43:41'),
(289, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-02-29 12:04:51', '2024-02-29 12:04:51'),
(290, 1, 7, 46, 'offer', 'offer', NULL, 0, 0, NULL, 0, '1', 1, '3 Days', NULL, 566.1, 'percentage', 21, 55.5, 'percentage', 2, 11.1, 499.5, 0, 0, NULL, 'cinetpay', 'pending', NULL, NULL, NULL, '2024-03-01 01:41:37', '2024-03-01 01:41:37'),
(291, 1, 7, 50, 'offer', 'offer', NULL, 0, 0, NULL, 0, '3', 3, '3 Days', NULL, 7.14, 'percentage', 21, 0.7, 'percentage', 2, 0.14, 6.3, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-03-01 07:01:34', '2024-03-01 07:01:34'),
(292, 1, 7, 42, 'offer', 'offer', NULL, 0, 0, NULL, 0, '2', 2, '3 Days', NULL, 204, 'percentage', 21, 20, 'percentage', 2, 4, 180, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2024-03-01 07:02:07', '2024-03-01 07:02:07'),
(293, 1, 7, 36, 'offer', 'offer', NULL, 0, 0, NULL, 0, '1', 1, '3 Days', NULL, 3333, 'percentage', 21, 333.3, 'percentage', 2, 66.66, 2999.7, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3OpaxPEmGOuJLTMs1CWTFeZX', NULL, '2024-03-01 22:37:17', '2024-03-01 22:37:49'),
(294, 1, 7, 104, 'project', 'Basic', NULL, 0, 0, NULL, 0, '5', 5, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'squareup', 'pending', NULL, NULL, NULL, '2024-03-01 22:50:46', '2024-03-01 22:50:46'),
(295, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-03-03 23:20:55', '2024-03-03 23:20:55'),
(296, 1, 7, 54, 'offer', 'offer', NULL, 0, 0, NULL, 0, '4', 4, '3 Days', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-03-04 03:47:41', '2024-03-04 03:47:41'),
(297, 294, 7, 69, 'project', 'Premium', NULL, 0, 0, NULL, 0, '10', 10, '3 Days', NULL, 459, 'percentage', 21, 45, 'percentage', 2, 9, 405, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-03-04 16:39:14', '2024-03-04 16:39:14'),
(298, 1, 7, 37, 'offer', 'offer', NULL, 0, 0, NULL, 0, '0', 0, NULL, NULL, 100, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3Oqaq7EmGOuJLTMs0sHAoNzE', NULL, '2024-03-04 16:41:52', '2024-03-04 16:43:02'),
(299, 1, 7, 54, 'offer', 'offer', NULL, 0, 0, NULL, 0, '4', 4, '3 Days', NULL, 300, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3Oqh1uEmGOuJLTMs1LEuWHfJ', NULL, '2024-03-04 23:18:28', '2024-03-04 23:18:56'),
(300, 1, 7, 15, 'job', 'job', NULL, 0, 0, NULL, 0, '5', 5, '3 Days', NULL, 58.14, 'percentage', 21, 5.7, 'percentage', 2, 1.14, 51.3, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-03-06 17:59:14', '2024-03-06 17:59:14'),
(301, 1, 7, 56, 'offer', 'offer', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 124.44, 'percentage', 21, 12.2, 'percentage', 2, 2.44, 109.8, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-03-06 20:24:39', '2024-03-06 20:24:39'),
(302, 1, 7, 56, 'offer', 'offer', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 124.44, 'percentage', 21, 12.2, 'percentage', 2, 2.44, 109.8, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-03-07 02:10:06', '2024-03-07 02:10:06'),
(303, 1, 7, 53, 'offer', 'offer', NULL, 0, 0, NULL, 0, '2', 2, '2 Days', NULL, 2346, 'percentage', 21, 230, 'percentage', 2, 46, 2070, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-03-07 04:12:34', '2024-03-07 04:12:34'),
(304, 1, 7, 70, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 561, 'percentage', 21, 55, 'percentage', 2, 11, 495, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-03-07 07:25:09', '2024-03-07 07:25:09'),
(305, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-03-07 18:04:34', '2024-03-07 18:04:34'),
(306, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-03-07 18:04:45', '2024-03-07 18:04:45'),
(307, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2024-03-08 17:10:53', '2024-03-08 17:10:53'),
(308, 310, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-03-09 23:19:24', '2024-03-09 23:19:24'),
(309, 310, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 150, 'percentage', 21, 15, 'percentage', 2, 0, 135, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1710011986.png', '2024-03-09 23:19:46', '2024-03-09 23:19:46'),
(310, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', 'sdf sdf sdf sd', 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paystack', 'pending', NULL, NULL, NULL, '2024-03-10 15:38:43', '2024-03-10 15:38:43'),
(311, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', 'zczx zxc zxc', 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paystack', 'pending', NULL, NULL, NULL, '2024-03-10 15:40:18', '2024-03-10 15:40:18'),
(312, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', 'ad asd asd asd a', 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paystack', 'pending', NULL, NULL, NULL, '2024-03-10 15:41:41', '2024-03-10 15:41:41'),
(313, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', 'as ad asd asd', 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paystack', 'pending', NULL, NULL, NULL, '2024-03-10 15:43:54', '2024-03-10 15:43:54'),
(314, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paystack', 'pending', NULL, NULL, NULL, '2024-03-10 15:53:27', '2024-03-10 15:53:27'),
(315, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paystack', 'pending', NULL, NULL, NULL, '2024-03-10 15:53:51', '2024-03-10 15:53:51'),
(316, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paystack', 'pending', NULL, NULL, NULL, '2024-03-10 15:59:37', '2024-03-10 15:59:37'),
(317, 1, 7, 108, 'project', 'Basic', NULL, 0, 1, NULL, 0, '1', 1, 'Less than a week', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paystack', 'complete', NULL, 'zg8wXJYYYWvuK4hdN3tUf9o8N', NULL, '2024-03-10 16:00:55', '2024-05-18 17:13:05'),
(318, 1, 7, 108, 'project', 'Basic', NULL, 0, 4, NULL, 0, '1', 1, 'Less than a week', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paystack', 'complete', NULL, '3vFuKXerJ0ZpVNLlxHN4txam6', NULL, '2024-03-10 16:01:01', '2024-05-20 11:59:53'),
(319, 1, 7, 107, 'project', 'Basic', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a month', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paystack', 'complete', NULL, 'wnvDR8H63BiMuJe5d5yxcY2IC', NULL, '2024-03-10 17:08:33', '2024-03-10 17:08:44'),
(320, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-03-11 06:41:53', '2024-03-11 06:41:53'),
(321, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paytabs', 'pending', NULL, NULL, NULL, '2024-03-11 06:42:12', '2024-03-11 06:42:12'),
(322, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'mollie', 'pending', NULL, NULL, NULL, '2024-03-11 06:42:28', '2024-03-11 06:42:28'),
(323, 1, 7, 58, 'offer', 'offer', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 204, 'percentage', 21, 20, 'percentage', 2, 4, 180, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-03-14 02:23:40', '2024-03-14 02:23:40'),
(324, 1, 7, 58, 'offer', 'offer', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 204, 'percentage', 21, 20, 'percentage', 2, 4, 180, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2024-03-14 02:23:50', '2024-03-14 02:23:50'),
(325, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', 'hi', 300, 'percentage', 21, 63, 'percentage', 2, 0, 237, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1710407704.png', '2024-03-14 13:15:04', '2024-03-14 13:15:04'),
(326, 1, 7, 68, 'project', 'Premium', NULL, 0, 0, NULL, 0, '3', 3, '1 Days', NULL, 71.4, 'percentage', 21, 7, 'percentage', 2, 1.4, 63, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-03-15 19:36:32', '2024-03-15 19:36:32'),
(327, 324, 7, 70, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 561, 'percentage', 21, 55, 'percentage', 2, 11, 495, 0, 0, NULL, 'paystack', 'pending', NULL, NULL, NULL, '2024-03-16 09:44:56', '2024-03-16 09:44:56'),
(328, 1, 8, 98, 'project', 'Premium', NULL, 0, 0, NULL, 0, '3', 3, '1 Days', NULL, 510, 'percentage', 21, 105, 'percentage', 2, 10, 395, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2024-03-18 00:12:10', '2024-03-18 00:12:10'),
(329, 1, 7, 107, 'project', 'Basic', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a month', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-03-18 10:48:21', '2024-03-18 10:48:21'),
(330, 1, 7, 107, 'project', 'Basic', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a month', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-03-18 10:48:42', '2024-03-18 10:48:42'),
(331, 1, 7, 104, 'project', 'Basic', NULL, 0, 0, NULL, 0, '5', 5, '1 Days', NULL, 50, 'percentage', 21, 5, 'percentage', 2, 0, 45, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1710762286.jpg', '2024-03-18 15:44:46', '2024-03-18 15:44:46'),
(332, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paytabs', 'pending', NULL, NULL, NULL, '2024-03-19 09:55:37', '2024-03-19 09:55:37'),
(333, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paytabs', 'pending', NULL, NULL, NULL, '2024-03-19 09:59:54', '2024-03-19 09:59:54'),
(334, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-03-20 18:56:48', '2024-03-20 18:56:48'),
(335, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-03-21 03:05:08', '2024-03-21 03:05:08'),
(336, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-03-21 12:04:29', '2024-03-21 12:04:29'),
(337, 1, 7, 105, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-03-23 11:05:05', '2024-03-23 11:05:05'),
(338, 1, 7, 61, 'offer', 'offer', NULL, 0, 0, NULL, 0, '2', 2, 'More than 3 month', NULL, 5100, 'percentage', 21, 500, 'percentage', 2, 100, 4500, 0, 0, NULL, 'midtrans', 'pending', NULL, NULL, NULL, '2024-03-23 12:58:59', '2024-03-23 12:58:59'),
(339, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 150, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'razorpay', 'complete', NULL, 'pay_NqCpJxFhRJL8yf', NULL, '2024-03-24 17:15:50', '2024-03-24 17:17:43'),
(340, 1, 7, 15, 'job', 'job', NULL, 0, 0, NULL, 0, '5', 5, '3 Days', NULL, 57, 'percentage', 21, 5.7, 'percentage', 2, 0, 51.3, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1711362457.jpg', '2024-03-25 14:27:37', '2024-03-25 14:27:37'),
(341, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 150, 'percentage', 21, 15, 'percentage', 2, 0, 135, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1711362879.jpg', '2024-03-25 14:34:39', '2024-03-25 14:34:39'),
(342, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 150, 'percentage', 21, 15, 'percentage', 2, 0, 135, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1711362880.jpg', '2024-03-25 14:34:40', '2024-03-25 14:34:40'),
(343, 1, 7, 10, 'job', 'job', NULL, 0, 0, NULL, 0, '4', 4, 'Less than 2 month', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2024-03-25 14:38:35', '2024-03-25 14:38:35'),
(344, 1, 7, 10, 'job', 'job', NULL, 0, 0, NULL, 0, '4', 4, 'Less than 2 month', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-03-25 14:38:47', '2024-03-25 14:38:47'),
(345, 1, 7, 10, 'job', 'job', NULL, 0, 0, NULL, 0, '4', 4, 'Less than 2 month', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2024-03-25 14:40:23', '2024-03-25 14:40:23'),
(346, 1, 7, 10, 'job', 'job', NULL, 0, 0, NULL, 0, '4', 4, 'Less than 2 month', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-03-25 14:42:12', '2024-03-25 14:42:12'),
(347, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paytabs', 'pending', NULL, NULL, NULL, '2024-03-25 17:38:07', '2024-03-25 17:38:07'),
(348, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1711373930.jpg', '2024-03-25 17:38:50', '2024-03-25 17:38:50'),
(349, 1, 7, 108, 'project', 'Basic', NULL, 0, 3, NULL, 0, '1', 1, 'Less than a week', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3OyDmUEmGOuJLTMs0rMKrKxr', NULL, '2024-03-25 17:41:40', '2024-06-06 12:09:32'),
(350, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-03-26 14:21:28', '2024-03-26 14:21:28'),
(351, 1, 7, 61, 'offer', 'offer', NULL, 0, 0, NULL, 0, '2', 2, 'More than 3 month', NULL, 5000, 'percentage', 21, 500, 'percentage', 2, 0, 4500, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1711484975.png', '2024-03-27 00:29:35', '2024-03-27 00:29:35'),
(352, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-03-27 06:32:19', '2024-03-27 06:32:19'),
(353, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-03-30 01:34:38', '2024-03-30 01:34:38'),
(354, 1, 7, 92, 'project', 'Basic', NULL, 0, 5, NULL, 0, '2', 2, 'Less than a week', NULL, 150, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'razorpay', 'complete', NULL, 'pay_NsUINQ6of4b1Sb', NULL, '2024-03-30 11:40:25', '2024-05-23 16:51:05'),
(355, 1, 7, 92, 'project', 'Premium', NULL, 0, 0, NULL, 0, '10', 10, 'Less than a week', NULL, 408, 'percentage', 21, 40, 'percentage', 2, 8, 360, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-03-30 13:09:40', '2024-03-30 13:09:40'),
(356, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'payfast', 'pending', NULL, NULL, NULL, '2024-04-01 00:16:48', '2024-04-01 00:16:48'),
(357, 1, 7, 99, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', 'ihbbbj\'k', 204, 'percentage', 21, 20, 'percentage', 2, 4, 180, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-04-03 01:05:58', '2024-04-03 01:05:58'),
(358, 1, 7, 70, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 561, 'percentage', 21, 55, 'percentage', 2, 11, 495, 0, 0, NULL, 'paystack', 'pending', NULL, NULL, NULL, '2024-04-05 14:36:05', '2024-04-05 14:36:05'),
(359, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-04-11 03:50:42', '2024-04-11 03:50:42'),
(360, 400, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 50, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'razorpay', 'complete', NULL, 'pay_NzQjqHGFLDJTwq', NULL, '2024-04-17 00:44:27', '2024-04-17 00:45:17'),
(361, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-04-17 23:59:05', '2024-04-17 23:59:05'),
(362, 1, 7, 70, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 561, 'percentage', 21, 55, 'percentage', 2, 11, 495, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2024-04-18 22:59:14', '2024-04-18 22:59:14'),
(363, 1, 7, 64, 'offer', 'offer', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a week', NULL, 127.5, 'percentage', 21, 12.5, 'percentage', 2, 2.5, 112.5, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-04-19 06:19:48', '2024-04-19 06:19:48'),
(364, 1, 7, 64, 'offer', 'offer', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a week', NULL, 127.5, 'percentage', 21, 12.5, 'percentage', 2, 2.5, 112.5, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-04-19 06:20:04', '2024-04-19 06:20:04'),
(365, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', 'sdfsdfsd', 50, 'percentage', 21, 5, 'percentage', 2, 0, 45, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1713589140.png', '2024-04-20 08:59:00', '2024-04-20 08:59:00'),
(366, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2024-04-20 09:17:46', '2024-04-20 09:17:46'),
(367, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2024-04-20 16:16:43', '2024-04-20 16:16:43'),
(368, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-04-20 20:36:50', '2024-04-20 20:36:50'),
(369, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'flutterwave', 'pending', NULL, NULL, NULL, '2024-04-21 03:53:16', '2024-04-21 03:53:16'),
(370, 1, 7, 104, 'project', 'Basic', NULL, 0, 0, NULL, 0, '5', 5, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-04-22 04:55:14', '2024-04-22 04:55:14'),
(371, 1, 7, 107, 'project', 'Basic', NULL, 0, 4, NULL, 0, '3', 3, 'Less than a month', 'the last of us', 100, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'payfast', 'complete', NULL, NULL, NULL, '2024-04-22 11:09:20', '2024-05-17 14:34:11'),
(372, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 306, 'percentage', 21, 63, 'percentage', 2, 6, 237, 0, 0, NULL, 'payfast', 'pending', NULL, NULL, NULL, '2024-04-22 11:48:54', '2024-04-22 11:48:54'),
(373, 1, 7, 108, 'project', 'Standard', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'marcadopago', 'pending', NULL, NULL, NULL, '2024-04-25 07:28:18', '2024-04-25 07:28:18'),
(374, 1, 7, 102, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', 'Good morning', 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-04-25 07:30:08', '2024-04-25 07:30:08'),
(375, 1, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 50, 'percentage', 21, 5, 'percentage', 2, 0, 45, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1714019948.jpg', '2024-04-25 08:39:08', '2024-04-25 08:39:08'),
(376, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', 'Demo', 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-04-25 10:32:21', '2024-04-25 10:32:21'),
(377, 1, 7, 63, 'offer', 'offer', NULL, 0, 0, NULL, 0, '10', 10, '3 Days', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'flutterwave', 'pending', NULL, NULL, NULL, '2024-04-25 12:17:48', '2024-04-25 12:17:48'),
(378, 1, 7, 65, 'offer', 'offer', NULL, 0, 0, NULL, 0, '4', 4, 'Less than a month', NULL, 81.6, 'percentage', 21, 8, 'percentage', 2, 1.6, 72, 0, 0, NULL, 'marcadopago', 'pending', NULL, NULL, NULL, '2024-04-25 15:43:52', '2024-04-25 15:43:52'),
(379, 1, 7, 65, 'offer', 'offer', NULL, 0, 0, NULL, 0, '4', 4, 'Less than a month', NULL, 81.6, 'percentage', 21, 8, 'percentage', 2, 1.6, 72, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-04-25 16:58:20', '2024-04-25 16:58:20'),
(380, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-04-25 22:00:33', '2024-04-25 22:00:33'),
(381, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-04-25 22:03:32', '2024-04-25 22:03:32'),
(382, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-04-25 22:03:50', '2024-04-25 22:03:50'),
(383, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2024-04-25 22:04:11', '2024-04-25 22:04:11'),
(384, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1714068280.jpg', '2024-04-25 22:04:40', '2024-04-25 22:04:40'),
(385, 1, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-04-26 00:51:41', '2024-04-26 00:51:41'),
(386, 1, 7, 107, 'project', 'Basic', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a month', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-04-26 10:57:12', '2024-04-26 10:57:12'),
(387, 1, 7, 105, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'marcadopago', 'pending', NULL, NULL, NULL, '2024-04-26 22:26:09', '2024-04-26 22:26:09'),
(388, 1, 7, 107, 'project', 'Basic', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a month', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'mollie', 'pending', NULL, NULL, NULL, '2024-04-28 00:25:36', '2024-04-28 00:25:36'),
(389, 429, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'sitesway', 'pending', NULL, NULL, NULL, '2024-04-28 21:43:37', '2024-04-28 21:43:37'),
(390, 1, 7, 20, 'job', 'job', NULL, 0, 0, NULL, 0, '0', 0, '1 Days', 'drposit for equipmemt', 900, 'percentage', 21, 90, 'percentage', 2, 0, 810, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1714358657.png', '2024-04-29 06:44:17', '2024-04-29 06:44:17'),
(391, 1, 7, 102, 'project', 'Premium', NULL, 0, 0, NULL, 0, '3', 3, '1 Days', 'hello I need this work in 5 hours', 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-05-01 09:47:35', '2024-05-01 09:47:35'),
(392, 1, 7, 107, 'project', 'Basic', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a month', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1714545014.jpg', '2024-05-01 10:30:14', '2024-05-01 10:30:14'),
(393, 1, 7, 102, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-05-01 19:27:07', '2024-05-01 19:27:07'),
(394, 1, 7, 102, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-05-01 19:34:14', '2024-05-01 19:34:14'),
(395, 1, 7, 102, 'project', 'Basic', NULL, 0, 4, NULL, 0, '1', 1, '1 Days', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3PBfCYEmGOuJLTMs0gN7nhFV', NULL, '2024-05-01 19:36:08', '2024-05-17 14:33:57'),
(396, 1, 7, 107, 'project', 'Standard', NULL, 0, 0, NULL, 0, '7', 7, 'Less than a month', NULL, 204, 'percentage', 21, 20, 'percentage', 2, 4, 180, 0, 0, NULL, 'paystack', 'pending', NULL, NULL, NULL, '2024-05-01 20:19:28', '2024-05-01 20:19:28'),
(397, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'flutterwave', 'pending', NULL, NULL, NULL, '2024-05-01 20:20:42', '2024-05-01 20:20:42'),
(398, 1, 7, 19, 'job', 'job', NULL, 0, 4, NULL, 0, '50', 50, '1 Days', NULL, 50, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3PBqtKEmGOuJLTMs188Pw1wT', NULL, '2024-05-02 08:05:05', '2024-05-17 09:12:35'),
(399, 1, 7, 70, 'offer', 'offer', NULL, 0, 0, NULL, 0, '0', 0, NULL, NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-05-02 08:07:48', '2024-05-02 08:07:48'),
(400, 1, 7, 70, 'offer', 'offer', NULL, 0, 0, NULL, 0, '0', 0, NULL, NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-05-02 12:00:53', '2024-05-02 12:00:53'),
(401, 1, 7, 107, 'project', 'Premium', NULL, 0, 0, NULL, 0, '9', 9, 'Less than a month', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'flutterwave', 'pending', NULL, NULL, NULL, '2024-05-03 00:19:34', '2024-05-03 00:19:34'),
(402, 449, 7, 105, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-05-03 01:31:19', '2024-05-03 01:31:19'),
(403, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2024-05-05 12:25:27', '2024-05-05 12:25:27'),
(404, 1, 7, 105, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2024-05-05 13:06:21', '2024-05-05 13:06:21'),
(405, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-05-05 17:28:02', '2024-05-05 17:28:02'),
(406, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'flutterwave', 'pending', NULL, NULL, NULL, '2024-05-05 17:50:21', '2024-05-05 17:50:21'),
(407, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-05-05 17:50:35', '2024-05-05 17:50:35'),
(408, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1714917308.jpg', '2024-05-05 17:55:08', '2024-05-05 17:55:08'),
(409, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 306, 'percentage', 21, 63, 'percentage', 2, 6, 237, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2024-05-05 18:11:19', '2024-05-05 18:11:19');
INSERT INTO `orders` (`id`, `user_id`, `freelancer_id`, `identity`, `is_project_job`, `is_basic_standard_premium_custom`, `is_fixed_hourly`, `is_custom`, `status`, `email_send`, `status_before_hold`, `revision`, `revision_left`, `delivery_time`, `description`, `price`, `commission_type`, `commission_charge`, `commission_amount`, `transaction_type`, `transaction_charge`, `transaction_amount`, `payable_amount`, `refund_amount`, `refund_status`, `total_hour`, `payment_gateway`, `payment_status`, `is_valid_payment`, `transaction_id`, `manual_payment_image`, `created_at`, `updated_at`) VALUES
(410, 153, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'payfast', 'pending', NULL, NULL, NULL, '2024-05-06 04:14:14', '2024-05-06 04:14:14'),
(411, 1, 8, 97, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 200, 'percentage', 21, 42, 'percentage', 2, 0, 158, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1715196950.png', '2024-05-08 23:35:50', '2024-05-08 23:35:50'),
(412, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'cashfree', 'pending', NULL, NULL, NULL, '2024-05-09 06:11:51', '2024-05-09 06:11:51'),
(413, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-05-10 08:49:23', '2024-05-10 08:49:23'),
(414, 486, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40, 'percentage', 21, 4, 'percentage', 2, 0, 36, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1715349161.png', '2024-05-10 17:52:41', '2024-05-10 17:52:41'),
(415, 1, 7, 73, 'offer', 'offer', NULL, 0, 0, NULL, 0, '0', 0, NULL, NULL, 56.1, 'percentage', 21, 5.5, 'percentage', 2, 1.1, 49.5, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2024-05-11 02:24:01', '2024-05-11 02:24:01'),
(416, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-05-12 11:25:27', '2024-05-12 11:25:27'),
(417, 1, 7, 110, 'project', 'Premium', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 61.2, 'percentage', 21, 6, 'percentage', 2, 1.2, 54, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-05-12 18:45:59', '2024-05-12 18:45:59'),
(418, 1, 7, 75, 'offer', 'offer', NULL, 0, 0, NULL, 0, '10', 10, '2 Days', NULL, 10.2, 'percentage', 21, 1, 'percentage', 2, 0.2, 9, 0, 0, NULL, 'sitesway', 'pending', NULL, NULL, NULL, '2024-05-12 19:08:31', '2024-05-12 19:08:31'),
(419, 290, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-05-13 11:10:19', '2024-05-13 11:10:19'),
(420, 290, 7, 68, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-05-13 11:11:03', '2024-05-13 11:11:03'),
(421, 1, 7, 76, 'offer', 'offer', NULL, 0, 0, NULL, 0, '2', 2, '1 Days', NULL, 30.6, 'percentage', 21, 3, 'percentage', 2, 0.6, 27, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-05-14 10:55:27', '2024-05-14 10:55:27'),
(422, 1, 7, 114, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-05-14 13:13:14', '2024-05-14 13:13:14'),
(423, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2024-05-14 17:47:31', '2024-05-14 17:47:31'),
(424, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-05-14 17:47:41', '2024-05-14 17:47:41'),
(425, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-05-14 17:47:58', '2024-05-14 17:47:58'),
(426, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'squareup', 'pending', NULL, NULL, NULL, '2024-05-14 17:49:22', '2024-05-14 17:49:22'),
(427, 1, 8, 94, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', 'Teste de descrição da compra', 50, 'percentage', 21, 10.5, 'percentage', 2, 0, 39.5, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1715701413.jpg', '2024-05-14 19:43:33', '2024-05-14 19:43:33'),
(428, 1, 7, 75, 'offer', 'offer', NULL, 0, 0, NULL, 0, '10', 10, '2 Days', NULL, 10.2, 'percentage', 21, 1, 'percentage', 2, 0.2, 9, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-05-14 22:10:12', '2024-05-14 22:10:12'),
(429, 1, 7, 70, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 550, 'percentage', 21, 55, 'percentage', 2, 0, 495, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1715754878.png', '2024-05-15 10:34:38', '2024-05-15 10:34:38'),
(430, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-05-15 13:14:42', '2024-05-15 13:14:42'),
(431, 1, 7, 110, 'project', 'Premium', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 61.2, 'percentage', 21, 6, 'percentage', 2, 1.2, 54, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-05-19 09:35:53', '2024-05-19 09:35:53'),
(432, 1, 7, 110, 'project', 'Basic', NULL, 0, 3, NULL, 0, '1', 1, '1 Days', NULL, 40, 'percentage', 21, 4, 'percentage', 2, 0, 36, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-05-19 09:36:10', '2024-06-04 18:46:45'),
(433, 1, 8, 97, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 200, 'percentage', 21, 42, 'percentage', 2, 0, 158, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-05-23 03:17:28', '2024-05-23 03:17:28'),
(434, 1, 7, 70, 'offer', 'offer', NULL, 0, 0, NULL, 0, '0', 0, NULL, NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-05-24 13:42:28', '2024-05-24 13:42:28'),
(435, 1, 7, 107, 'project', 'Basic', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a month', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-05-24 21:54:16', '2024-05-24 21:54:16'),
(436, 1, 8, 94, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 50, 'percentage', 21, 10.5, 'percentage', 2, 0, 39.5, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-05-24 23:10:22', '2024-05-24 23:10:22'),
(437, 525, 8, 94, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', 'fasdf dsaf asdf', 50, 'percentage', 21, 10.5, 'percentage', 2, 1, 39.5, 0, 0, NULL, 'payfast', 'complete', NULL, NULL, NULL, '2024-05-26 11:24:49', '2024-05-26 11:25:06'),
(438, 519, 7, 108, 'project', 'Basic', NULL, 0, 5, NULL, 0, '1', 1, 'Less than a week', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'complete', NULL, '9AL249835K0157744', NULL, '2024-05-26 20:55:22', '2024-05-28 22:35:22'),
(439, 1, 7, 80, 'offer', 'offer', NULL, 0, 1, NULL, 0, '1', 1, '1 Days', NULL, 1, 'percentage', 21, 0.1, 'percentage', 2, 0, 0.9, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-05-27 03:35:44', '2024-06-01 16:23:11'),
(440, 1, 7, 84, 'offer', 'offer', NULL, 0, 0, NULL, 0, '5', 5, '1 Days', NULL, 261.12, 'percentage', 21, 25.6, 'percentage', 2, 5.12, 230.4, 0, 0, NULL, 'marcadopago', 'pending', NULL, NULL, NULL, '2024-05-29 04:15:58', '2024-05-29 04:15:58'),
(441, 1, 7, 84, 'offer', 'offer', NULL, 0, 0, NULL, 0, '5', 5, '1 Days', NULL, 261.12, 'percentage', 21, 25.6, 'percentage', 2, 5.12, 230.4, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-05-30 23:25:51', '2024-05-30 23:25:51'),
(442, 1, 8, 98, 'project', 'Standard', NULL, 0, 0, NULL, 0, '2', 2, '1 Days', NULL, 408, 'percentage', 21, 84, 'percentage', 2, 8, 316, 0, 0, NULL, 'sitesway', 'pending', NULL, NULL, NULL, '2024-06-01 00:23:01', '2024-06-01 00:23:01'),
(443, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 306, 'percentage', 21, 63, 'percentage', 2, 6, 237, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-06-01 00:23:16', '2024-06-01 00:23:16'),
(444, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', '0', 306, 'percentage', 21, 63, 'percentage', 2, 6, 237, 0, 0, NULL, 'authorize_dot_net', 'pending', NULL, NULL, NULL, '2024-06-01 00:26:26', '2024-06-01 00:26:26'),
(445, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', '0', 300, 'percentage', 21, 63, 'percentage', 2, 0, 237, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1717187209.png', '2024-06-01 00:26:49', '2024-06-01 00:26:49'),
(446, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'midtrans', 'pending', NULL, NULL, NULL, '2024-06-02 16:34:41', '2024-06-02 16:34:41'),
(447, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'cinetpay', 'pending', NULL, NULL, NULL, '2024-06-02 16:49:42', '2024-06-02 16:49:42'),
(448, 1, 7, 99, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 204, 'percentage', 21, 20, 'percentage', 2, 4, 180, 0, 0, NULL, 'midtrans', 'pending', NULL, NULL, NULL, '2024-06-02 16:50:07', '2024-06-02 16:50:07'),
(449, 547, 8, 96, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 204, 'percentage', 21, 42, 'percentage', 2, 4, 158, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-06-04 04:42:47', '2024-06-04 04:42:47'),
(450, 1, 7, 110, 'project', 'Standard', NULL, 0, 1, NULL, 0, '1', 1, '1 Days', 'hsh', 50, 'percentage', 21, 5, 'percentage', 2, 0, 45, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-06-04 08:29:41', '2024-06-04 11:16:07'),
(451, 1, 7, 105, 'project', 'Basic', NULL, 0, 1, NULL, 0, '1', 1, '1 Days', 'hsgusueu', 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-06-04 08:31:56', '2024-06-04 11:15:21'),
(452, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', 'bxbbxx', 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-06-04 09:20:02', '2024-06-04 09:20:02'),
(453, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', 'hdjdbdbf', 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-06-04 09:20:44', '2024-06-04 09:20:44'),
(454, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-06-04 09:30:07', '2024-06-04 09:30:07'),
(455, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', 'oh no I just \nGGG and the \ngood \nI\'m going through it 😭😭😭😭', 40, 'percentage', 21, 4, 'percentage', 2, 0, 36, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1717485050.jpg', '2024-06-04 11:10:50', '2024-06-04 11:10:50'),
(456, 1, 7, 108, 'project', 'Basic', NULL, 0, 1, NULL, 0, '1', 1, 'Less than a week', 'oh no I just \nGGG and the \ngood \nI\'m going through it 😭😭😭😭 hi', 100, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'payfast', 'complete', NULL, NULL, NULL, '2024-06-04 11:21:59', '2024-06-04 11:22:53'),
(457, 1, 7, 108, 'project', 'Basic', NULL, 0, 1, NULL, 0, '1', 1, 'Less than a week', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-06-05 08:09:09', '2024-06-09 03:36:30'),
(458, 1, 7, 88, 'offer', 'offer', NULL, 0, 3, NULL, 0, '0', 0, NULL, NULL, 24, 'percentage', 21, 2.4, 'percentage', 2, 0, 21.6, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-06-05 09:29:10', '2024-06-18 08:27:43'),
(459, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40, 'percentage', 21, 4, 'percentage', 2, 0, 36, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-06-05 21:09:58', '2024-06-05 21:09:58'),
(460, 1, 7, 107, 'project', 'Basic', NULL, 0, 1, NULL, 0, '3', 3, 'Less than a month', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-06-06 12:05:42', '2024-06-06 12:23:20'),
(461, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'squareup', 'pending', NULL, NULL, NULL, '2024-06-06 18:15:44', '2024-06-06 18:15:44'),
(462, 1, 7, 84, 'project', 'Basic', NULL, 0, 1, NULL, 0, '1', 1, '1 Days', NULL, 300, 'percentage', 21, 30, 'percentage', 2, 0, 270, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-06-07 00:12:43', '2024-06-08 16:21:09'),
(463, 1, 7, 107, 'project', 'Premium', NULL, 0, 0, NULL, 0, '9', 9, 'Less than a month', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-06-08 08:25:56', '2024-06-08 08:25:56'),
(464, 1, 7, 107, 'project', 'Premium', NULL, 0, 0, NULL, 0, '9', 9, 'Less than a month', NULL, 306, 'percentage', 21, 30, 'percentage', 2, 6, 270, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-06-08 08:26:21', '2024-06-08 08:26:21'),
(465, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-06-09 12:23:36', '2024-06-09 12:23:36'),
(466, 1, 7, 5, 'job', 'job', NULL, 0, 1, NULL, 0, '50', 50, 'less than a month', NULL, 200, 'percentage', 21, 20, 'percentage', 2, 0, 180, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-06-10 17:19:12', '2024-06-12 20:44:30'),
(467, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'zitopay', 'pending', NULL, NULL, NULL, '2024-06-13 14:17:48', '2024-06-13 14:17:48'),
(468, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'cinetpay', 'pending', NULL, NULL, NULL, '2024-06-13 14:23:10', '2024-06-13 14:23:10'),
(469, 576, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-06-14 14:04:09', '2024-06-14 14:04:09'),
(470, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', 'yt', 40, 'percentage', 21, 4, 'percentage', 2, 0, 36, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-06-14 20:10:42', '2024-06-14 20:10:42'),
(471, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40, 'percentage', 21, 4, 'percentage', 2, 0, 36, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1718425935.jpg', '2024-06-15 08:32:15', '2024-06-15 08:32:15'),
(472, 1, 7, 91, 'offer', 'offer', NULL, 0, 3, NULL, 0, '80', 80, 'less than a week', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-06-16 09:42:17', '2024-07-22 21:15:46'),
(473, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 306, 'percentage', 21, 63, 'percentage', 2, 6, 237, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-06-16 19:24:03', '2024-06-16 19:24:03'),
(474, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'flutterwave', 'pending', NULL, NULL, NULL, '2024-06-17 18:55:30', '2024-06-17 18:55:30'),
(475, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-06-18 02:32:10', '2024-06-18 02:32:10'),
(476, 1, 7, 99, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 204, 'percentage', 21, 20, 'percentage', 2, 4, 180, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2024-06-18 02:32:47', '2024-06-18 02:32:47'),
(477, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-06-18 20:05:46', '2024-06-18 20:05:46'),
(478, 1, 7, 87, 'offer', 'offer', NULL, 0, 0, NULL, 0, '0', 0, NULL, 'j', 23.46, 'percentage', 21, 2.3, 'percentage', 2, 0.46, 20.7, 0, 0, NULL, 'toyyibpay', 'pending', NULL, NULL, NULL, '2024-06-19 21:05:49', '2024-06-19 21:05:49'),
(479, 1, 7, 110, 'project', 'Basic', NULL, 0, 4, NULL, 0, '1', 1, '1 Days', NULL, 40, 'percentage', 21, 4, 'percentage', 2, 0, 36, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-06-21 19:03:10', '2024-06-27 13:34:42'),
(480, 1, 7, 110, 'project', 'Premium', NULL, 0, 1, NULL, 0, '1', 1, '1 Days', 'hzhhs', 60, 'percentage', 21, 6, 'percentage', 2, 0, 54, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-06-22 16:26:56', '2024-06-22 22:22:30'),
(481, 597, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-06-24 10:50:07', '2024-06-24 10:50:07'),
(482, 597, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-06-24 10:50:52', '2024-06-24 10:50:52'),
(483, 600, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-06-25 06:55:26', '2024-06-25 06:55:26'),
(484, 1, 7, 16, 'job', 'job', NULL, 0, 2, NULL, 0, '0', 0, '2 Days', NULL, 10, 'percentage', 21, 1, 'percentage', 2, 0, 9, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-06-25 11:00:54', '2024-07-17 00:45:32'),
(485, 1, 7, 19, 'job', 'job', NULL, 0, 5, NULL, 0, '50', 50, '1 Days', NULL, 50, 'percentage', 21, 5, 'percentage', 2, 0, 45, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-06-26 12:04:04', '2024-06-27 13:33:47'),
(486, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'cinetpay', 'pending', NULL, NULL, NULL, '2024-06-26 14:39:11', '2024-06-26 14:39:11'),
(487, 1, 7, 86, 'offer', 'offer', NULL, 0, 0, NULL, 0, '9', 9, '1 Days', NULL, 227.46, 'percentage', 21, 22.3, 'percentage', 2, 4.46, 200.7, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-06-27 13:25:46', '2024-06-27 13:25:46'),
(488, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1719667182.jpg', '2024-06-29 17:19:42', '2024-06-29 17:19:42'),
(489, 1, 7, 110, 'project', 'Premium', NULL, 0, 4, NULL, 0, '1', 1, '1 Days', 'this is the basic description this is the basic description this is the basic description this is the basic description this is the basic description this is the basic description this is the basic description this is the basic description this is the basic description this is the basic description this is the basic description this is the basic description', 60, 'percentage', 21, 6, 'percentage', 2, 0, 54, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-06-30 00:29:22', '2024-07-02 21:24:49'),
(490, 1, 8, 98, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 306, 'percentage', 21, 63, 'percentage', 2, 6, 237, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-06-30 16:25:22', '2024-06-30 16:25:22'),
(491, 1, 7, 28, 'job', 'job', NULL, 0, 0, NULL, 0, '10', 10, '1 Days', NULL, 30, 'percentage', 21, 3, 'percentage', 2, 0, 27, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-07-03 17:11:18', '2024-07-03 17:11:18'),
(492, 1, 7, 28, 'job', 'job', NULL, 0, 4, NULL, 0, '10', 10, '1 Days', NULL, 30, 'percentage', 21, 3, 'percentage', 2, 0, 27, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-07-03 17:29:11', '2024-07-04 08:38:19'),
(493, 597, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-07-04 16:29:36', '2024-07-04 16:29:36'),
(494, 1, 7, 93, 'offer', 'offer', NULL, 0, 4, NULL, 0, '1', 1, '1 Days', NULL, 55, 'percentage', 21, 5.5, 'percentage', 2, 1.1, 49.5, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3PaGWIEmGOuJLTMs1PoxYx1S', NULL, '2024-07-08 16:18:13', '2024-07-17 00:44:34'),
(495, 1, 7, 67, 'offer', 'offer', NULL, 0, 1, NULL, 0, '3', 3, 'Less than a week', NULL, 30, 'percentage', 21, 3, 'percentage', 2, 0, 27, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-07-09 05:10:01', '2024-07-09 14:18:06'),
(496, 1, 7, 92, 'offer', 'offer', NULL, 0, 0, NULL, 0, '1', 1, '3 Days', NULL, 204, 'percentage', 21, 20, 'percentage', 2, 4, 180, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-07-09 05:11:20', '2024-07-09 05:11:20'),
(497, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'marcadopago', 'pending', NULL, NULL, NULL, '2024-07-10 18:06:53', '2024-07-10 18:06:53'),
(498, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-07-10 18:07:33', '2024-07-10 18:07:33'),
(499, 1, 7, 94, 'offer', 'offer', NULL, 0, 4, NULL, 0, '0', 0, NULL, NULL, 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-07-10 22:15:15', '2024-07-11 23:35:24'),
(500, 1, 7, 95, 'offer', 'offer', NULL, 0, 0, NULL, 0, '2', 2, '1 Days', NULL, 3.06, 'percentage', 21, 0.3, 'percentage', 2, 0.06, 2.7, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-07-12 17:04:30', '2024-07-12 17:04:30'),
(501, 1, 7, 95, 'offer', 'offer', NULL, 0, 0, NULL, 0, '2', 2, '1 Days', NULL, 3.06, 'percentage', 21, 0.3, 'percentage', 2, 0.06, 2.7, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-07-12 17:04:31', '2024-07-12 17:04:31'),
(502, 1, 7, 95, 'offer', 'offer', NULL, 0, 4, NULL, 0, '2', 2, '1 Days', NULL, 3, 'percentage', 21, 0.3, 'percentage', 2, 0.06, 2.7, 0, 0, NULL, 'razorpay', 'complete', NULL, 'pay_OXjNENQsgu3hME', NULL, '2024-07-12 17:04:41', '2024-07-13 18:18:21'),
(503, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', 'iuh', 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-07-13 18:21:54', '2024-07-13 18:21:54'),
(504, 1, 7, 73, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '3 Days', NULL, 510, 'percentage', 21, 50, 'percentage', 2, 10, 450, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-07-13 21:47:47', '2024-07-13 21:47:47'),
(505, 1, 7, 73, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '3 Days', NULL, 510, 'percentage', 21, 50, 'percentage', 2, 10, 450, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-07-13 21:50:50', '2024-07-13 21:50:50'),
(506, 1, 7, 73, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '3 Days', NULL, 510, 'percentage', 21, 50, 'percentage', 2, 10, 450, 0, 0, NULL, 'authorize_dot_net', 'pending', NULL, NULL, NULL, '2024-07-13 21:52:08', '2024-07-13 21:52:08'),
(507, 1, 7, 73, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '3 Days', NULL, 510, 'percentage', 21, 50, 'percentage', 2, 10, 450, 0, 0, NULL, 'instamojo', 'pending', NULL, NULL, NULL, '2024-07-13 22:03:16', '2024-07-13 22:03:16'),
(508, 1, 7, 73, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '3 Days', NULL, 510, 'percentage', 21, 50, 'percentage', 2, 10, 450, 0, 0, NULL, 'instamojo', 'pending', NULL, NULL, NULL, '2024-07-13 22:04:32', '2024-07-13 22:04:32'),
(509, 1, 7, 73, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '3 Days', NULL, 510, 'percentage', 21, 50, 'percentage', 2, 10, 450, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-07-13 22:06:24', '2024-07-13 22:06:24'),
(510, 1, 7, 73, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '3 Days', NULL, 510, 'percentage', 21, 50, 'percentage', 2, 10, 450, 0, 0, NULL, 'paytabs', 'pending', NULL, NULL, NULL, '2024-07-13 22:10:37', '2024-07-13 22:10:37'),
(511, 1, 7, 73, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '3 Days', NULL, 510, 'percentage', 21, 50, 'percentage', 2, 10, 450, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2024-07-13 22:14:15', '2024-07-13 22:14:15'),
(512, 1, 7, 73, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '3 Days', NULL, 510, 'percentage', 21, 50, 'percentage', 2, 10, 450, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2024-07-13 22:14:39', '2024-07-13 22:14:39'),
(513, 1, 7, 73, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '3 Days', NULL, 500, 'percentage', 21, 50, 'percentage', 2, 10, 450, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3PcAV1EmGOuJLTMs0VyHMAlH', NULL, '2024-07-13 22:16:46', '2024-07-13 22:19:36'),
(514, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-07-14 06:47:42', '2024-07-14 06:47:42'),
(515, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'sitesway', 'pending', NULL, NULL, NULL, '2024-07-14 06:48:18', '2024-07-14 06:48:18'),
(516, 641, 7, 92, 'project', 'Basic', NULL, 0, 0, NULL, 0, '2', 2, 'Less than a week', NULL, 153, 'percentage', 21, 15, 'percentage', 2, 3, 135, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-07-14 07:04:24', '2024-07-14 07:04:24'),
(517, 1, 7, 97, 'offer', 'offer', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a month', NULL, 25500, 'percentage', 21, 2500, 'percentage', 2, 500, 22500, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-07-15 17:18:00', '2024-07-15 17:18:00'),
(518, 1, 7, 105, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2024-07-15 19:17:12', '2024-07-15 19:17:12'),
(519, 1, 7, 70, 'project', 'Premium', NULL, 0, 5, NULL, 0, '1', 1, 'Less than a week', NULL, 1000, 'percentage', 21, 100, 'percentage', 2, 20, 900, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3PdYS9EmGOuJLTMs1YsHpL2p', NULL, '2024-07-17 18:03:29', '2024-07-17 22:04:35'),
(520, 649, 8, 94, 'project', 'Premium', NULL, 0, 0, NULL, 0, '3', 3, '1 Days', NULL, 153, 'percentage', 21, 31.5, 'percentage', 2, 3, 118.5, 0, 0, NULL, 'instamojo', 'pending', NULL, NULL, NULL, '2024-07-17 23:17:53', '2024-07-17 23:17:53'),
(521, 649, 8, 94, 'project', 'Premium', NULL, 0, 0, NULL, 0, '3', 3, '1 Days', NULL, 150, 'percentage', 21, 31.5, 'percentage', 2, 3, 118.5, 0, 0, NULL, 'stripe', 'complete', NULL, 'pi_3PddNsEmGOuJLTMs1Mj0pTAe', NULL, '2024-07-17 23:19:27', '2024-07-17 23:20:41'),
(522, 1, 7, 105, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'instamojo', 'pending', NULL, NULL, NULL, '2024-07-22 21:13:18', '2024-07-22 21:13:18'),
(523, 1, 7, 29, 'job', 'job', NULL, 0, 1, NULL, 0, '100', 100, 'less than a week', NULL, 60, 'percentage', 21, 6, 'percentage', 2, 0, 54, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-07-23 14:59:38', '2024-07-23 18:08:31'),
(524, 1, 7, 110, 'project', 'Basic', NULL, 0, 1, NULL, 0, '1', 1, '1 Days', NULL, 40, 'percentage', 21, 4, 'percentage', 2, 0, 36, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-07-24 10:17:14', '2024-07-24 11:43:02'),
(525, 1, 7, 104, 'offer', 'offer', NULL, 0, 4, NULL, 0, '1', 1, '1 Days', NULL, 40, 'percentage', 21, 4, 'percentage', 2, 0, 36, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-07-25 00:58:19', '2024-07-25 21:13:52'),
(526, 1, 7, 108, 'project', 'Premium', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a week', NULL, 0, 'percentage', 21, 0, 'percentage', 2, 0, 0, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-07-27 17:30:46', '2024-07-27 17:30:46'),
(527, 1, 7, 108, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, 'Less than a week', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-07-27 17:32:39', '2024-07-27 17:32:39'),
(528, 1, 7, 108, 'project', 'Basic', NULL, 0, 1, NULL, 0, '1', 1, 'Less than a week', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-07-27 17:33:17', '2024-07-28 11:05:03'),
(529, 1, 7, 30, 'job', 'job', NULL, 0, 4, NULL, 0, '90', 90, 'less than a week', NULL, 90, 'percentage', 21, 9, 'percentage', 2, 0, 81, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-07-28 11:52:53', '2024-08-04 13:24:55'),
(530, 1, 7, 105, 'offer', 'offer', NULL, 0, 1, NULL, 0, '2', 2, '1 Days', NULL, 50, 'percentage', 21, 5, 'percentage', 2, 0, 45, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-07-31 13:20:04', '2024-08-03 18:57:21'),
(531, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'midtrans', 'pending', NULL, NULL, NULL, '2024-08-01 02:09:13', '2024-08-01 02:09:13'),
(532, 1, 7, 107, 'offer', 'offer', NULL, 0, 4, NULL, 0, '0', 0, NULL, NULL, 10, 'percentage', 21, 1, 'percentage', 2, 0, 9, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-08-04 15:12:21', '2024-08-07 19:13:30'),
(533, 1, 7, 106, 'offer', 'offer', NULL, 0, 3, NULL, 0, '1', 1, '3 Days', NULL, 100, 'percentage', 21, 10, 'percentage', 2, 0, 90, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-08-04 15:17:41', '2024-08-07 10:19:22'),
(534, 1, 7, 107, 'project', 'Basic', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a month', 'tesyjskw', 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'toyyibpay', 'pending', NULL, NULL, NULL, '2024-08-05 15:48:48', '2024-08-05 15:48:48'),
(535, 1, 7, 110, 'project', 'Standard', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'midtrans', 'pending', NULL, NULL, NULL, '2024-08-06 02:24:13', '2024-08-06 02:24:13'),
(536, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-08-06 17:28:53', '2024-08-06 17:28:53'),
(537, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-08-06 17:33:25', '2024-08-06 17:33:25'),
(538, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'sitesway', 'pending', NULL, NULL, NULL, '2024-08-06 20:29:24', '2024-08-06 20:29:24'),
(539, 1, 7, 105, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'paytm', 'pending', NULL, NULL, NULL, '2024-08-07 10:18:03', '2024-08-07 10:18:03'),
(540, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-08-07 10:18:38', '2024-08-07 10:18:38'),
(541, 1, 7, 107, 'project', 'Basic', NULL, 0, 0, NULL, 0, '3', 3, 'Less than a month', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-08-08 11:08:33', '2024-08-08 11:08:33'),
(542, 1, 7, 108, 'offer', 'offer', NULL, 0, 0, NULL, 0, '2', 2, '2 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'paypal', 'pending', NULL, NULL, NULL, '2024-08-09 11:08:48', '2024-08-09 11:08:48'),
(543, 1, 7, 108, 'offer', 'offer', NULL, 0, 0, NULL, 0, '2', 2, '2 Days', NULL, 50, 'percentage', 21, 5, 'percentage', 2, 0, 45, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-08-09 11:08:56', '2024-08-09 11:08:56'),
(544, 1, 7, 105, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 102, 'percentage', 21, 10, 'percentage', 2, 2, 90, 0, 0, NULL, 'razorpay', 'pending', NULL, NULL, NULL, '2024-08-09 12:13:47', '2024-08-09 12:13:47'),
(545, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40, 'percentage', 21, 4, 'percentage', 2, 0, 36, 0, 0, NULL, 'manual_payment', 'pending', NULL, NULL, 'manual_attachment_1723851342.jpg', '2024-08-17 03:35:42', '2024-08-17 03:35:42'),
(546, 1, 7, 110, 'project', 'Basic', NULL, 0, 3, NULL, 0, '1', 0, '1 Days', 'rjejd', 40, 'percentage', 21, 4, 'percentage', 2, 0, 36, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-08-17 19:48:53', '2024-08-17 19:59:14'),
(547, 1, 7, 110, 'offer', 'offer', NULL, 0, 3, NULL, 0, '2', 2, '1 Days', NULL, 30, 'percentage', 21, 3, 'percentage', 2, 0, 27, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-08-18 15:20:17', '2024-08-21 05:09:21'),
(548, 1, 7, 104, 'project', 'Premium', NULL, 0, 1, NULL, 0, '10', 10, '1 Days', 'Just testing out', 90, 'percentage', 21, 9, 'percentage', 2, 0, 81, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-08-21 22:34:25', '2024-08-21 22:43:08'),
(549, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'flutterwave', 'pending', NULL, NULL, NULL, '2024-08-21 22:45:52', '2024-08-21 22:45:52'),
(550, 1, 7, 110, 'project', 'Basic', NULL, 0, 3, NULL, 0, '1', 1, '1 Days', NULL, 40, 'percentage', 21, 4, 'percentage', 2, 0, 36, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-08-21 22:47:55', '2024-08-27 23:42:05'),
(551, 1, 7, 73, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '3 Days', NULL, 510, 'percentage', 21, 50, 'percentage', 2, 10, 450, 0, 0, NULL, 'flutterwave', 'pending', NULL, NULL, NULL, '2024-08-23 09:07:35', '2024-08-23 09:07:35'),
(552, 1, 7, 110, 'project', 'Standard', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 51, 'percentage', 21, 5, 'percentage', 2, 1, 45, 0, 0, NULL, 'stripe', 'pending', NULL, NULL, NULL, '2024-08-23 09:07:54', '2024-08-23 09:07:54'),
(553, 712, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40.8, 'percentage', 21, 4, 'percentage', 2, 0.8, 36, 0, 0, NULL, 'paytabs', 'pending', NULL, NULL, NULL, '2024-08-23 15:16:13', '2024-08-23 15:16:13'),
(554, 1, 7, 35, 'job', 'job', 'hourly', 0, 1, NULL, 0, '12', 12, 'Less than a week', NULL, 1000, 'percentage', 21, 100, 'percentage', 2, 0, 900, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-08-31 17:00:47', '2024-08-31 17:01:51'),
(555, 1, 7, 110, 'project', 'Basic', NULL, 0, 0, NULL, 0, '1', 1, '1 Days', NULL, 40, 'percentage', 21, 4, 'percentage', 2, 0, 36, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-09-02 18:33:24', '2024-09-02 18:33:24'),
(556, 1, 7, 110, 'project', 'Premium', NULL, 0, 1, NULL, 0, '1', 1, '1 Days', NULL, 60, 'percentage', 21, 6, 'percentage', 2, 0, 54, 0, 0, NULL, 'wallet', 'complete', NULL, NULL, NULL, '2024-09-02 18:47:40', '2024-09-02 19:38:16');

-- --------------------------------------------------------

--
-- Table structure for table `order_decline_histories`
--

CREATE TABLE `order_decline_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint NOT NULL,
  `freelancer_id` bigint NOT NULL,
  `client_id` bigint NOT NULL,
  `order_price` double NOT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cancel_or_decline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_decline_histories`
--

INSERT INTO `order_decline_histories` (`id`, `order_id`, `freelancer_id`, `client_id`, `order_price`, `payment_status`, `cancel_or_decline`, `cancel_by`, `created_at`, `updated_at`) VALUES
(1, 20, 7, 1, 60, 'complete', 'cancel', 'freelancer', '2023-11-15 06:54:48', '2023-11-15 06:54:48'),
(2, 21, 7, 1, 60, 'complete', 'cancel', 'freelancer', '2023-11-15 07:10:27', '2023-11-15 07:10:27'),
(3, 145, 7, 1, 100, 'complete', 'decline', 'freelancer', '2024-01-17 07:54:53', '2024-01-17 07:54:53'),
(4, 398, 7, 1, 50, 'complete', 'cancel', 'freelancer', '2024-05-17 09:12:35', '2024-05-17 09:12:35'),
(5, 395, 7, 1, 100, 'complete', 'cancel', 'freelancer', '2024-05-17 14:33:57', '2024-05-17 14:33:57'),
(6, 371, 7, 1, 100, 'complete', 'cancel', 'freelancer', '2024-05-17 14:34:11', '2024-05-17 14:34:11'),
(7, 318, 7, 1, 100, 'complete', 'cancel', 'freelancer', '2024-05-20 11:59:53', '2024-05-20 11:59:53'),
(8, 354, 7, 1, 150, 'complete', 'decline', 'freelancer', '2024-05-23 16:51:05', '2024-05-23 16:51:05'),
(9, 438, 7, 519, 100, 'complete', 'decline', 'freelancer', '2024-05-28 22:35:22', '2024-05-28 22:35:22'),
(10, 485, 7, 1, 50, 'complete', 'decline', 'freelancer', '2024-06-27 13:33:47', '2024-06-27 13:33:47'),
(11, 479, 7, 1, 40, 'complete', 'cancel', 'freelancer', '2024-06-27 13:34:42', '2024-06-27 13:34:42'),
(12, 489, 7, 1, 60, 'complete', 'cancel', 'freelancer', '2024-07-02 21:24:49', '2024-07-02 21:24:49'),
(13, 492, 7, 1, 30, 'complete', 'cancel', 'freelancer', '2024-07-04 08:38:19', '2024-07-04 08:38:19'),
(14, 499, 7, 1, 100, 'complete', 'cancel', 'freelancer', '2024-07-11 23:35:24', '2024-07-11 23:35:24'),
(15, 502, 7, 1, 3, 'complete', 'cancel', 'freelancer', '2024-07-13 18:18:21', '2024-07-13 18:18:21'),
(16, 494, 7, 1, 55, 'complete', 'cancel', 'freelancer', '2024-07-17 00:44:34', '2024-07-17 00:44:34'),
(17, 519, 7, 1, 1000, 'complete', 'decline', 'freelancer', '2024-07-17 22:04:35', '2024-07-17 22:04:35'),
(18, 525, 7, 1, 40, 'complete', 'cancel', 'freelancer', '2024-07-25 21:13:52', '2024-07-25 21:13:52'),
(19, 529, 7, 1, 90, 'complete', 'cancel', 'freelancer', '2024-08-04 13:24:55', '2024-08-04 13:24:55'),
(20, 532, 7, 1, 10, 'complete', 'cancel', 'freelancer', '2024-08-07 19:13:30', '2024-08-07 19:13:30');

-- --------------------------------------------------------

--
-- Table structure for table `order_decline_wallet_histories`
--

CREATE TABLE `order_decline_wallet_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint NOT NULL,
  `freelancer_id` bigint NOT NULL,
  `client_id` bigint NOT NULL,
  `order_price` double NOT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cancel_or_decline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_decline_wallet_histories`
--

INSERT INTO `order_decline_wallet_histories` (`id`, `order_id`, `freelancer_id`, `client_id`, `order_price`, `payment_status`, `cancel_or_decline`, `cancel_by`, `created_at`, `updated_at`) VALUES
(1, 20, 7, 1, 60, 'complete', 'cancel', 'freelancer', '2023-11-15 06:54:48', '2023-11-15 06:54:48'),
(2, 21, 7, 1, 60, 'complete', 'cancel', 'freelancer', '2023-11-15 07:10:27', '2023-11-15 07:10:27'),
(3, 145, 7, 1, 100, 'complete', 'decline', 'freelancer', '2024-01-17 07:54:53', '2024-01-17 07:54:53'),
(4, 398, 7, 1, 50, 'complete', 'cancel', 'freelancer', '2024-05-17 09:12:35', '2024-05-17 09:12:35'),
(5, 395, 7, 1, 100, 'complete', 'cancel', 'freelancer', '2024-05-17 14:33:57', '2024-05-17 14:33:57'),
(6, 371, 7, 1, 100, 'complete', 'cancel', 'freelancer', '2024-05-17 14:34:11', '2024-05-17 14:34:11'),
(7, 318, 7, 1, 100, 'complete', 'cancel', 'freelancer', '2024-05-20 11:59:53', '2024-05-20 11:59:53'),
(8, 354, 7, 1, 150, 'complete', 'decline', 'freelancer', '2024-05-23 16:51:05', '2024-05-23 16:51:05'),
(9, 438, 7, 519, 100, 'complete', 'decline', 'freelancer', '2024-05-28 22:35:22', '2024-05-28 22:35:22'),
(10, 485, 7, 1, 50, 'complete', 'decline', 'freelancer', '2024-06-27 13:33:47', '2024-06-27 13:33:47'),
(11, 479, 7, 1, 40, 'complete', 'cancel', 'freelancer', '2024-06-27 13:34:42', '2024-06-27 13:34:42'),
(12, 489, 7, 1, 60, 'complete', 'cancel', 'freelancer', '2024-07-02 21:24:49', '2024-07-02 21:24:49'),
(13, 492, 7, 1, 30, 'complete', 'cancel', 'freelancer', '2024-07-04 08:38:19', '2024-07-04 08:38:19'),
(14, 499, 7, 1, 100, 'complete', 'cancel', 'freelancer', '2024-07-11 23:35:24', '2024-07-11 23:35:24'),
(15, 502, 7, 1, 3, 'complete', 'cancel', 'freelancer', '2024-07-13 18:18:21', '2024-07-13 18:18:21'),
(16, 494, 7, 1, 55, 'complete', 'cancel', 'freelancer', '2024-07-17 00:44:34', '2024-07-17 00:44:34'),
(17, 519, 7, 1, 1000, 'complete', 'decline', 'freelancer', '2024-07-17 22:04:35', '2024-07-17 22:04:35'),
(18, 525, 7, 1, 40, 'complete', 'cancel', 'freelancer', '2024-07-25 21:13:52', '2024-07-25 21:13:52'),
(19, 529, 7, 1, 90, 'complete', 'cancel', 'freelancer', '2024-08-04 13:24:55', '2024-08-04 13:24:55'),
(20, 532, 7, 1, 10, 'complete', 'cancel', 'freelancer', '2024-08-07 19:13:30', '2024-08-07 19:13:30');

-- --------------------------------------------------------

--
-- Table structure for table `order_milestones`
--

CREATE TABLE `order_milestones` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `deadline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=pending, 1=active, 2=complete, 3=cancel',
  `revision` int NOT NULL DEFAULT '0',
  `revision_left` int NOT NULL DEFAULT '0',
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_milestones`
--

INSERT INTO `order_milestones` (`id`, `order_id`, `title`, `description`, `price`, `deadline`, `status`, `revision`, `revision_left`, `attachment`, `created_at`, `updated_at`) VALUES
(4, 8, 'First Milestone', 'First complete the first milestone. then start second one.', 180, 'Less than a month', 2, 3, 3, NULL, '2023-11-07 02:15:36', '2023-11-07 03:19:42'),
(5, 8, 'Second Milestone', 'Next complete the second milestone. then start second one.', 270, 'Less than 2 month', 2, 3, 3, NULL, '2023-11-07 02:15:36', '2023-11-07 03:26:46'),
(6, 8, 'Final Milestone', 'Last complete the first milestone. then start second one.', 450, 'More than 3 month', 2, 3, 3, NULL, '2023-11-07 02:15:36', '2023-11-07 03:37:19'),
(7, 11, 'First step task', 'You will get the amount after complete each milestone.', 90, 'Less than a month', 2, 2, 2, NULL, '2023-11-07 07:28:08', '2023-11-07 07:34:30'),
(8, 11, 'Second step task', 'You will get the amount after complete each milestone.', 90, 'Less than a month', 1, 2, 1, NULL, '2023-11-07 07:28:08', '2023-11-14 23:58:27'),
(9, 11, 'Third step task', 'You will get the amount after complete each milestone.', 270, 'Less than 3 month', 0, 10, 10, NULL, '2023-11-07 07:28:08', '2023-11-07 07:28:08'),
(10, 33, 'sadasdas', 'dddasdas', 90, '2 Days', 0, 1, 1, NULL, '2023-12-04 07:42:31', '2023-12-04 07:42:31'),
(11, 34, 'adasdadas', 'sadasdasda', 90, '3 Days', 0, 1, 1, NULL, '2023-12-04 10:08:11', '2023-12-04 10:08:11'),
(12, 35, 'sadasd', 'sdadsd', 45, 'Less than a week', 0, 1, 1, NULL, '2023-12-04 10:14:51', '2023-12-04 10:14:51'),
(13, 131, 'design rwfqf', 'dtshlsikuyt oetu8 ouopjopdsfg', 135, '2 Days', 0, 3, 3, NULL, '2024-01-09 03:46:34', '2024-01-09 03:46:34'),
(14, 132, 'design rwfqf', 'Build All in One Freelancing Platform with Xilancer\r\nThe Best Freelancing Platform Script in The Market. Build Your Own Fiverr Clone or', 135, '2 Days', 0, 3, 3, NULL, '2024-01-09 06:00:03', '2024-01-09 06:00:03'),
(15, 157, '.?.', 'jhkjh', 90, 'Less than a week', 0, 5, 5, NULL, '2024-01-19 02:18:43', '2024-01-19 02:18:43'),
(16, 158, '.?.', 'jhkjh', 90, 'Less than a week', 0, 5, 5, NULL, '2024-01-19 02:19:16', '2024-01-19 02:19:16'),
(17, 232, 'test', 'asdfasdfasd', 90, '3 Days', 0, 7, 7, NULL, '2024-02-19 22:30:27', '2024-02-19 22:30:27'),
(18, 233, 'Web Design', 'lorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsum', 112.5, '3 Days', 0, 7, 7, NULL, '2024-02-19 22:40:34', '2024-02-19 22:40:34'),
(19, 248, 'strt', 'rtet', 90, 'More than 3 month', 0, 1, 1, NULL, '2024-02-21 21:22:13', '2024-02-21 21:22:13'),
(20, 249, 'strt', 'rtet', 90, 'More than 3 month', 0, 1, 1, NULL, '2024-02-21 21:23:19', '2024-02-21 21:23:19'),
(21, 250, 'strt', 'rtet', 90, 'More than 3 month', 0, 1, 1, NULL, '2024-02-21 21:24:21', '2024-02-21 21:24:21'),
(22, 298, 'test', 'asdfasdfasd', 90, '3 Days', 0, 7, 7, NULL, '2024-03-04 16:41:52', '2024-03-04 16:41:52'),
(23, 341, '1', '45', 36, '3 Days', 0, 54, 54, NULL, '2024-03-25 14:34:39', '2024-03-25 14:34:39'),
(24, 341, '2', '45', 99, 'Less than a week', 0, 54, 54, NULL, '2024-03-25 14:34:39', '2024-03-25 14:34:39'),
(25, 342, '1', '45', 36, '3 Days', 0, 54, 54, NULL, '2024-03-25 14:34:40', '2024-03-25 14:34:40'),
(26, 342, '2', '45', 99, 'Less than a week', 0, 54, 54, NULL, '2024-03-25 14:34:40', '2024-03-25 14:34:40'),
(27, 371, 'mstone-1', 'the last of ', 45, '1 Days', 1, 4, 4, NULL, '2024-04-22 11:09:20', '2024-05-16 20:13:45'),
(28, 371, 'mstone-2', 'the last of us ', 45, 'less than a week', 0, 5, 5, NULL, '2024-04-22 11:09:20', '2024-04-22 11:09:20'),
(29, 399, 'Nostrum itaque nihil', 'Vitae omnis quia id', 90, '1 Days', 0, 1, 1, NULL, '2024-05-02 08:07:48', '2024-05-02 08:07:48'),
(30, 400, 'Nostrum itaque nihil', 'Vitae omnis quia id', 90, '1 Days', 0, 1, 1, NULL, '2024-05-02 12:00:53', '2024-05-02 12:00:53'),
(31, 415, 'jjj', 'jj', 49.5, '2 Days', 0, 2, 2, NULL, '2024-05-11 02:24:01', '2024-05-11 02:24:01'),
(32, 434, 'Nostrum itaque nihil', 'Vitae omnis quia id', 90, '1 Days', 0, 1, 1, NULL, '2024-05-24 13:42:28', '2024-05-24 13:42:28'),
(33, 455, 'stone 1', 'oh no I just \nGGG and the \ngood \nI\'m going through it 😭😭😭😭', 18, '1 Days', 0, 4, 4, NULL, '2024-06-04 11:10:50', '2024-06-04 11:10:50'),
(34, 455, 'stone 2', 'oh no I just \nGGG and the \ngood \nI\'m going through it 😭😭😭😭', 18, '1 Days', 0, 2, 2, NULL, '2024-06-04 11:10:50', '2024-06-04 11:10:50'),
(35, 456, 'stone 1', 'oh no I just \nGGG and the \ngood \nI\'m going through it 😭😭😭😭', 45, '1 Days', 1, 5, 4, NULL, '2024-06-04 11:21:59', '2024-06-04 11:43:35'),
(36, 456, 'stone 2', 'oh no I just \nGGG and the \ngood \nI\'m going through it 😭😭😭😭', 45, '1 Days', 0, 4, 4, NULL, '2024-06-04 11:21:59', '2024-06-04 11:21:59'),
(37, 458, 'gsdgd', 'From the doctor and I just got home from work and I just got home from work&nbsp;', 10.8, '1 Days', 1, 4, 4, NULL, '2024-06-05 09:29:10', '2024-06-18 08:26:10'),
(38, 458, 'fhggu', 'The same thing I was thinking about you and&nbsp;', 10.8, '1 Days', 0, 6, 6, NULL, '2024-06-05 09:29:10', '2024-06-05 09:29:10'),
(39, 470, 'ffgggg', 'vvggh fg', 36, '1 Days', 0, 0, 0, NULL, '2024-06-14 20:10:42', '2024-06-14 20:10:42'),
(40, 481, 'Milestone title', 'This is milestone testing', 90, 'Less than a week', 0, 5, 5, NULL, '2024-06-24 10:50:07', '2024-06-24 10:50:07'),
(41, 481, 'Milestone title', 'This is milestone testing', 45, 'Less than a week', 0, 5, 5, NULL, '2024-06-24 10:50:07', '2024-06-24 10:50:07'),
(42, 482, 'Milestone title', 'This is milestone testing', 90, 'Less than a week', 0, 5, 5, NULL, '2024-06-24 10:50:52', '2024-06-24 10:50:52'),
(43, 482, 'Milestone title', 'This is milestone testing', 45, 'Less than a week', 0, 5, 5, NULL, '2024-06-24 10:50:52', '2024-06-24 10:50:52'),
(44, 493, 'Delectus ratione od', 'Commodi molestiae es', 90, 'Less than a month', 0, 4, 4, NULL, '2024-07-04 16:29:36', '2024-07-04 16:29:36'),
(45, 499, 'trial', '<p>Description&nbsp;</p><p><br></p>', 45, '1 Days', 1, 2, 2, NULL, '2024-07-10 22:15:15', '2024-07-10 22:51:02'),
(46, 499, 'sexond', '<p>Sexond&nbsp;</p><p><br></p><p><br></p>', 45, '2 Days', 0, 1, 1, NULL, '2024-07-10 22:15:15', '2024-07-10 22:15:15'),
(47, 527, 'njohunnk', 'jijikmp', 90, 'less than 2 month', 0, 25, 25, NULL, '2024-07-27 17:32:39', '2024-07-27 17:32:39'),
(48, 532, 'ms1xxxxxx', 'Testing', 4.5, '3 Days', 4, 5, 5, NULL, '2024-08-04 15:12:21', '2024-08-04 15:14:17'),
(49, 532, 'ms2xxxx', 'Testing 2', 4.5, '1 Days', 0, 5, 5, NULL, '2024-08-04 15:12:21', '2024-08-04 15:12:21'),
(50, 534, 'siap 1 lagu', '1 lagu', 90, '1 Days', 0, 10, 10, NULL, '2024-08-05 15:48:48', '2024-08-05 15:48:48');

-- --------------------------------------------------------

--
-- Table structure for table `order_request_revisions`
--

CREATE TABLE `order_request_revisions` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint NOT NULL,
  `order_submit_history_id` bigint DEFAULT NULL,
  `milestone_id` int DEFAULT NULL,
  `description` blob,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_request_revisions`
--

INSERT INTO `order_request_revisions` (`id`, `order_id`, `order_submit_history_id`, `milestone_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, 0x3c703e48656c6c6f20646561723c2f703e3c703e49206e6565642066757274686572206d6f64696669636174696f6e2e20706c6561736520636865636b2e2e2e3c2f703e3c703e312e2064657369676e3c2f703e3c703e322e636f6e74656e74206f7074696d697a652e3c2f703e3c703e332e2066657720726573706f6e736976652069737375653c62723e3c2f703e, '2023-11-07 00:42:48', '2023-11-07 00:42:48'),
(2, 11, 12, 8, 0x3c703e3c696d67207372633d22646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414877414141423843415941414143724874532b414141414358424957584d41414173544141414c457745416d7077594141414141584e535230494172733463365141414141526e51553142414143786a7776385951554141412b4a5355524256486742375a304c644658566d63662f6539396e65426b4d4953716b45384c4c35435a455753675057346571773679706971364f4d4651673557467571437a624f73364d7331716e4538643575615a72484f756a38704a58456a4749566d615974566f6b6f464b717441554a7551454b43464a414541676849613937377a6d373337347849634877534d342b35353537633335723358584f665a397a2f7566626a2b2f622b39754167344f4467344f4467344f4467344f4467344f4467344f44673345596b7044676b742f31432b75756f564733503075496144624168394f4a706775475644726c2f6d44437a33536d302f4f77414271344550573050534d594f2b4553374a44624866335545386b3774625359525a426b4a4958674d3137666c6534566e747535344866704f70764342484945452b6e306c6865396754454e5170796a6e552f6f4a746a424f483754503870334c5330656578594a546b494b4c6f526738315a585a3275742f44367930722b686b356841466a6f5170734c71365a3933637362584331333862326c783775644951424a4b3843644b4477343631787965785156376843372b4a504e4676694a682b7639744c75356148575a733237714674353545677041516773395a73576373307a78503664446e3079473759532f714f6468627a4b6539754f61372b5657774f6259572f4e465871374b5a782f5538424236422f5347725a36557576336832545748674747794b4c515766742f4a49616a54532f424d427352693962586a466a7a41446538587453666d5856664e48314d466d3245727734424c68615859664b4e513137642f703656416b4d674a664349462f476e4d71392f5753456861465462434e34492b756f4f4a626436326b433355336b676d47447752337a7939664f505a543241414f477a42335263314370726c324a4a3359456a6f6e706b56337a46305743734947784e58435a315345764c377a2b4a484f38424f577046362f6471674c4b64794d2f32684e5563352f496f374537534a544333777763377458554d507334575158757a4e306f68743858415258504a5a58697a67516c777464755072414d4c3031756f6e752b674c305152686a56583545376c396556484163466d4f3534444e654351337765764178376561694c38504545592b6254566b315033414b466d4a706f363245366d79764635586f36324a4c424273526a5744646a4f58564e384a434c4c507777745837307253772f69363158753643777957592b4933584658356f35594c785a3241426c6c6834525557465377754c2f334845376762424a6b6330337773564663494643374245384930584173395154484d4f6241436a7530342b654b644832327678677a7879737a6332375038424c4d443038357939636c2b2b694f6a6236493873726176616b574b366f4d50464e4e725859774b337639354f75397a795859304d54614f74627231504b71494474373852444952674971594b2f6a693179433934734a74325238464335456d3545495748584e6a7446743154354c6569386c654532304c7857513336315538756d7a4f7048695a6836706c63384c486e5962485962704c4a7a357268592b47596e665a4762496e386e6f642b4b345731645079572b596863316a546f50324169706c6e34724e6632546e42784c7676626c7069484c4b71394a4977736b4d3141576e785965474e57627a49366432504b326757426a324543706f6768523432364f58385a466f6e645a745574706f6b746b52627659363078612b3974715847646344324b6c2b5334505a69414b594930695836503043575a434a4f525638544c496c61493049483779324c6535434c2b6a6a6e4c396e30504a714263384a495377656b654c59624a74496b64706e72577571486a51756a51497132306f31474a30747139364e544830756b7a516a6461326f676e533071324b682b2f702f77484477305054524d366d344a6573476a714d4b514e38467a333534305734667450316d505437712b4f4e713563396779614c707746643374776239472f785736753050747634636a7674364b703767786335422b2b656378346a4839774554787049324a4e7733446a42527a61766746486432354361304e62494377744b78383566376b4136534e76517938596454447a706e746f2b79736f52503049554d476652692b4c312b78305032354a396345716d734c64337a426e6a78314133616d6a63486d38614353424b35632f6739726a68377038707548734a6e782b5942652b3958644c3043703832504a694d52704f482b33362b35397377636e71447a44753452386964396f3839425171554a346d4b3638734b666d6d73694653536755765842363655395046564351524f7a66384c436232674c53624d4f5272742b4c43366339772f7553523248734e357a3748396a58506f61577850696232674348446b547038444a6f766e4548745a7945536a4b6f41697042557666737a5a49795a5142616631354f2f4a6a6537667666426a48545a46766f31464b46556346324959444b4e5a64416959527a6275774d545a2f774142644d7565595a446c5258343952762f4664732f73652b337365323442344c496e33374a4f3372323847357366576b52776b3058592f582b4833652f313250424354647a7330496f4646785a6f3031327861676b2f32736b47534d6e334e644662456e676e706e49474a6e66385477394b776354487770326163514e47586b37737535386f4f4e3533596b4436413355426e7977384f5639615643454d7345622b5942766b584d6946556e47364d6e33642f75364c4e37627963792f4b3959746c4632327a67784d7a2b7a596a3761326f4a6663724c6d31623049523672706c51724e464e4577312f564f486450733664313271445431656639755766506464756d70636a56654f63545958696c42536879395973583967574e4d6d572b48362b50326e74626a59717162526572717539646f66596a327a43656b584948386356454c5839593635612f623058317459304169444b424538724775334359746d696d7a6364524b6e366e7064504a714f6d384b77596170344655665962786174377647302f52414755564f6b433977426877374d385036524d327363464b4247634d616351596d646b494d74564d4f34336974333365556f455a774b4d4e4d444a596c4532394170746345567169496d51414747425a2b33386f69664359794651786663696b4f313547624e6b624e7259524444676f656a44514568717932484c71694f7a544d4758364d6e4e426f474d5379344544774c446c2b424d785069355272506830454d4338343548776d486275474b423256516279384c426a4863443666364f387561735362574d6633766c794953626f3774443767786f3976506a482b7743486e337a6f7274652f74316e307871354f5470474862626662463947576f316a6d37593132486338534b4570616b35386a4e544d574b6f63553962316245364e4c5a302f7a762b51595068782b4372667439484976763644627a6d5a317a396c495958626f46426a41737530316c61614f4b505442774f46547a3354733056426263726a4c48424d496a7852687377434137646f6e70674a546c72423841674b6877765470664d4d706a6871497a6473687261677443327433436935714d727673386f67705979634443475a75636a4d32384b55675a315032314f395252464959526876527a42752b483838554d3475767639613336753576323334536668783032626a514a364d4737793557517932364d7856425470686738696b576c704f492b64473137477a7264666a5857554f364f2b4c63734d78345656644d767172427934714f765739767248546e6b6731756675544c6a354973346372554856356e4c5566643432676e58504c3963695053735832525075362f69632b6c6e6e6f676b474d65353434616756566b79732f4a4a6e3377355a4f6744433233386742673735617663334c584d4d695873764e762f3836593652713956623372784d634c555465356751583841674b6e7a706c6d5968736850656c494559662f394332542b4f505439397543706d2f524b68334c454b6156326e5952444467744f704a6b787965444d596645733243642f57505a5a7a7a78724f744b56653034514a387a5346646749475565423430592b67442b50792b6a6f73584b4a70626434377a5a534a75637a7774545a385642364e3730456670716e754c42586a6c7761542b676530655a6f31457849484d4f593943494d59466a7a72564d356873765045636b6f725a502b48373144506f5732777777305a6d6245476e6935635a755346716b2f5252782b435151774c586c4a436b58374739714f506f55636a3143706668373376726574344c6176677a324e657549675a2f697a475169725755564e795a425154333062465749396e796955434a3049373857465a31347a58305a596d6e44762b68396773556a6c44564e4a2f63455a737a706d494a51637a6f546758656730556f4552774162457657544e6731353438484874636a6254686f7a467438553878494f316d744171504b6446696f544d6c6253556c677573755673584e7936646a53397a554f68383649672b6a4a7630567874343150645a536c2f6e636f6d61464a376a3443417051636e512b4871364f367037545172414d6d4d7a6a667a487163706431727a6c653234526c6c566466696d54734e7837436e5139317a61386a75324965663739596664325a69444248624c6b75616954565268612b6176377464624f58686d526573656b776d5977622f464246552f6a616e517376435a74797737576e5a357470335852626256732f4d36416b534b5677756a4465524239464e745261685a6e4c71346c534b454b5a3444705032554c4e4e744e79684e6f5a6d6454487848797374613063323645495a556635526c4832616272544455396e5454526b4f6b374e504c466c3536647976634946635251667162594366596949384a6a6a5a4f6b454764464b4b455370344f454933307848614e6a666d7769455365797779654d3371596f38484c6d682b706451694e4c62632f3369774d585a533675703863616551532f5958484d654133303939314c4a2b6469396d5a356231396839772f64723437376530544c504742486f386c3562566d575065663374547567365737562b356b796c4867376c377246357239574d6a6e4378437772475546387638695269396d62796d713536724458757379706866706a37665a6c724330635a4875585347655648766d7052376b48795350772f4c45543659634c776f6b58344b564b6c5867787031624b2b626859703171324f774e6976564973744d65586f79524f324448464146757a4e384a5077506958783650626975356c75704c433138793130585266507777524d456277386d507365625435426e4a42695339476c554a4565726c6b69525a62666232332f506a787857504f49665451326d4c73444a6d426179344d4a397178673468334545536d304c4f706c6d632b2b7a4c73537937397932575239756669413372486d5562775874596f6c38486d756844465478674b62566947564675662b676936626b67695043746f74562f61627052753038794f4d746c5a33752b42785a744f6f6851476c4f6449375932344c524551587734774a474d6d4c5471334f667a444c7569576d436c3561584c434c7773546c634c684f7849717952586c4b52725a634364503747414c526636534e34536b7979513631656571357076584b59645554544265387247315239482b46773958682b6b2f586671394165622f374b333844433344352b464c70463462446c6167527a62345859514757434c376d757a6e6e7148442f577a674e754f37514f524e506c48312f7443566a43537a79453149444c706933555168394652793649434265576c755556776d4c73457a77474a70346972713531584349775153714830344e5041554c73565477387366486e6165362f484861765167486e626e596432624f5a4a594f384c6257776f6e536f734348484b7743665232476c39632b6c6d743561576535344a49553066514559724e562b69626b6a4e727463666437476e4567626f376a57612f737a5853352b5234364173505a42524f4d7a31774364363870446878444849694c685576574c63372f6f3242734a766f576a58544646385a4c62456e63424a6649754c6b512b44483643674c2f58505a5959417669534677466c3369392f663462516a637448476758714f37634d4471592b774c69544e7746587a562f524575597569634d7a44617863395751324c38644e66714c57576147505874774c506267305663505a484e33744a4a3872332b474a494a7535434d65643876456c5176476e34454e734e55732f6c6c4c516850644442757457755851624f6a696e6f2b4154336f7a6d504d4832495334462b6d64575663632b46686e43444967376b57664175724239472f625357794a725153586c426346337455465a6947787563675a6e3139616c4c384e4e734e32676b764b6977507261624d514351695654693079464c79324b4f6474324242624369347043775a654639422f69415243696931302f636d79594635634a6d4a6344375956584649657a482b52656a492f4a75647a5171514d6f68763079624a462b612f42787168504b4b6159716f327662692f5964535a4b6f6b2b466a573951366c6e4d4c772f6d4c59664e53597a6b616b4b774f63757176792f415a59593864566c39464b467a4d652b4e782f4a5749774649714778366a79344e7a654d514c7767777061752f3952596d6b304341663773736d504e2f5342427358596466546e6b777341714d7a325151646867427535647365326f696953314a4b4d456c705557356d356c664b3642795069347434625a754631377a637a47314e4a6876796778504d306e6f424b6c7a6c6f572b51654856706252374b3677684a467a6969664b46655675526f435363685864476a6f384c523341486446336d786a517a6866632b6e574e52663946385a794b4c4c556d61464d677a4b6b4a6554793262784c6a34446a325649326c75684245597a676d682f344b69585573386e7635375a526758535542533572796557724c5650587a5954562b48727430447a75386d34616a49763372693331675753635a324353452b59497876485858693175306c4a537a70566e70497a69546e33544433353375474d6f3859467457396165542b544f47637049577268516c324f677a767366584649792f4177634842776348427763484277634842776346632f67513956564275424a7a59515141414141424a52553545726b4a6767673d3d22207374796c653d2277696474683a2031323470783b2220646174612d66696c656e616d653d226c6f636174696f6e5f6d61726b65722e706e67223e3c62723e3c2f703e, '2023-11-14 23:58:27', '2023-11-14 23:58:27'),
(3, 456, 17, 35, 0x3c703e4b7868786f6c68266e6273703b3c2f703e3c703e4b6f676769766e703c623e7669693c2f623e3c2f703e3c703e3c623e426b6b626b7669623c2f623e3c2f703e3c703e3c623e4a676b676b766f6269766f623c2f623e3c2f703e3c703e3c666f6e7420636f6c6f723d2223333937623231223e3c7370616e207374796c653d226261636b67726f756e642d636f6c6f723a20726762283235352c20302c2030293b223e3c693e436967686f68636c6a633c2f693e3c2f7370616e3e3c2f666f6e743e3c2f703e3c703e3c666f6e7420636f6c6f723d2223333937623231223e3c7370616e207374796c653d226261636b67726f756e642d636f6c6f723a20726762283235352c20302c2030293b223e3c693e4f666f75786f79786f68636f75666f68633c2f693e3c2f7370616e3e3c2f666f6e743e3c2f703e, '2024-06-04 11:43:35', '2024-06-04 11:43:35'),
(4, 546, 23, NULL, 0x4b7a6b7a, '2024-08-17 19:58:23', '2024-08-17 19:58:23');

-- --------------------------------------------------------

--
-- Table structure for table `order_screenshots`
--

CREATE TABLE `order_screenshots` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_submit_histories`
--

CREATE TABLE `order_submit_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint NOT NULL,
  `order_milestone_id` bigint DEFAULT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=pending, 1=approve, 2=request revision,',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_submit_histories`
--

INSERT INTO `order_submit_histories` (`id`, `order_id`, `order_milestone_id`, `attachment`, `status`, `description`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, 'order_attachment_1699339183.png', 2, 'Please check. I have done everything for you. Let me know if you have any issues. Thanks.', '2023-11-07 00:39:43', '2023-11-07 00:42:48'),
(2, 2, NULL, 'order_attachment_1699340047.pdf', 1, 'Ok. Check please', '2023-11-07 00:54:07', '2023-11-07 00:54:27'),
(3, 4, NULL, 'order_attachment_1699342551.pdf', 1, 'Hi Check your order please. hope you like it.', '2023-11-07 01:35:51', '2023-11-07 01:37:36'),
(4, 8, 4, 'order_attachment_1699348756.pdf', 1, 'First milestone complete. Check and update me.', '2023-11-07 03:19:16', '2023-11-07 03:19:42'),
(5, 8, 5, 'order_attachment_1699349176.pdf', 1, 'Second milestone complete. Check and update me.', '2023-11-07 03:26:16', '2023-11-07 03:26:46'),
(6, 8, 6, 'order_attachment_1699349793.pdf', 1, 'Last milestone complete.', '2023-11-07 03:36:33', '2023-11-07 03:37:19'),
(7, 9, NULL, 'order_attachment_1699353822.pdf', 1, 'Hi Just finish your order. Check please', '2023-11-07 04:43:42', '2023-11-07 04:45:05'),
(8, 10, NULL, 'order_attachment_1699360880.pdf', 1, 'hi here your task man.', '2023-11-07 06:41:20', '2023-11-07 06:43:33'),
(9, 11, 7, 'order_attachment_1699363968.pdf', 1, 'hi ..', '2023-11-07 07:32:48', '2023-11-07 07:34:30'),
(10, 12, NULL, 'order_attachment_1699420780.pdf', 1, 'Hi done your order. please check', '2023-11-07 23:19:40', '2023-11-07 23:20:07'),
(11, 15, NULL, 'order_attachment_1699421334.pdf', 1, 'Order amount will automatically add your account once the client approved the oreder.', '2023-11-07 23:28:54', '2023-11-07 23:29:49'),
(12, 11, 8, 'order_attachment_1699872062.png', 2, 'Hello Check please', '2023-11-13 04:41:02', '2023-11-14 23:58:27'),
(13, 25, NULL, 'order_attachment_1700917905.png', 1, 'Hi I have done all your queries. if you have any issuses please check amd let me know. Thanks', '2023-11-25 07:11:45', '2023-11-25 07:12:08'),
(14, 16, NULL, 'order_attachment_1701087657.png', 1, 'Hello I have done all your requirements, please check and let me know about issues,', '2023-11-27 06:20:57', '2023-11-27 06:22:28'),
(15, 349, NULL, 'order_attachment_1716468898.jpg', 1, 'fff', '2024-05-23 16:54:58', '2024-06-06 12:09:32'),
(16, 432, NULL, 'order_attachment_1716787871.jpg', 1, 'tttt', '2024-05-27 09:31:11', '2024-06-04 18:46:45'),
(17, 456, 35, 'order_attachment_1717486091.png', 2, '<p>Two years old and full support the documentation&nbsp;</p><p>Only after they open the app&nbsp;</p><p>Is blue weapons better then a bit smirk&nbsp;</p>', '2024-06-04 11:28:11', '2024-06-04 11:43:35'),
(18, 458, NULL, 'order_attachment_1718684840.jpg', 1, 'Hi there', '2024-06-18 08:27:20', '2024-06-18 08:27:43'),
(19, 472, NULL, 'order_attachment_1718994701.jpg', 1, 'Hhnkiuy', '2024-06-21 22:31:41', '2024-07-22 21:15:46'),
(20, 484, NULL, 'order_attachment_1721162732.png', 0, '<b>tyyyjjhhh</b>', '2024-07-17 00:45:32', '2024-07-17 00:45:32'),
(21, 532, 48, 'order_attachment_1722770057.png', 0, '<p>Ttttttttttt</p><p>Hhjkhhj</p><p>Jjjjj</p>', '2024-08-04 15:14:17', '2024-08-04 15:14:17'),
(22, 533, NULL, 'order_attachment_1722770356.pdf', 1, '<p>Eeee</p><p>Jjjjjjjkk</p>', '2024-08-04 15:19:16', '2024-08-07 10:19:22'),
(23, 546, NULL, 'order_attachment_1723910204.jpg', 2, '1kwosks2sks', '2024-08-17 19:56:44', '2024-08-17 19:58:23'),
(24, 546, NULL, 'order_attachment_1723910337.jpg', 1, 'Nsnsjsszk', '2024-08-17 19:58:57', '2024-08-17 19:59:14'),
(25, 547, NULL, 'order_attachment_1724144347.pdf', 1, 'Nnjbnjjjhbjiuhjjjjjnjj', '2024-08-20 12:59:07', '2024-08-21 05:09:21'),
(26, 550, NULL, 'order_attachment_1724703888.jpg', 1, 'hgttuu', '2024-08-27 00:24:48', '2024-08-27 23:42:05');

-- --------------------------------------------------------

--
-- Table structure for table `order_work_histories`
--

CREATE TABLE `order_work_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` int NOT NULL,
  `client_id` int NOT NULL,
  `freelancer_id` int NOT NULL,
  `job_id` int DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `only_start_date` date DEFAULT NULL,
  `only_end_date` date DEFAULT NULL,
  `hours_worked` time NOT NULL,
  `seconds` int DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_work_histories`
--

INSERT INTO `order_work_histories` (`id`, `order_id`, `client_id`, `freelancer_id`, `job_id`, `start_date`, `end_date`, `only_start_date`, `only_end_date`, `hours_worked`, `seconds`, `notes`, `created_at`, `updated_at`) VALUES
(1, 554, 1, 7, 35, '2024-08-31 17:01:59', '2024-08-31 17:02:23', NULL, NULL, '00:00:24', 24, NULL, '2024-08-31 17:02:13', '2024-08-31 17:02:13');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `page_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `page_builder_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `breadcrumb_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `navbar_variant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_variant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT NULL COMMENT '1-active, 0-inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `page_content`, `page_builder_status`, `layout`, `page_class`, `breadcrumb_status`, `navbar_variant`, `footer_variant`, `visibility`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Contact', 'contact-us', '<p><span style=\"color: rgb(153, 153, 153); font-family: Manrope, sans-serif; font-size: 15px; display: inline !important;\">You’re not obliged to pay any fee before you earn and we just charge less than 2% on your total earnings if you have membership then it’s less than 1%</span><span style=\"color: rgb(153, 153, 153); font-family: Manrope, sans-serif; font-size: 15px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">You’re not obliged to pay any fee before you earn and we just charge less than 2% on your total earnings if you have membership then it’s less than 1%</span><span style=\"color: rgb(153, 153, 153); font-family: Manrope, sans-serif; font-size: 15px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">You’re not obliged to pay any fee before you earn and we just charge less than 2% on your total earnings if you have membership then it’s less than 1%</span><span style=\"color: rgb(153, 153, 153); font-family: Manrope, sans-serif; font-size: 15px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">You’re not obliged to pay any fee before you earn and we just charge less than 2% on your total earnings if you have membership then it’s less than 1%</span><span style=\"color: rgb(153, 153, 153); font-family: Manrope, sans-serif; font-size: 15px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">You’re not obliged to pay any fee before you earn and we just charge less than 2% on your total earnings if you have membership then it’s less than 1%</span><span style=\"color: rgb(153, 153, 153); font-family: Manrope, sans-serif; font-size: 15px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">You’re not obliged to pay any fee before you earn and we just charge less than 2% on your total earnings if you have membership then it’s less than 1%</span></p><p><span style=\"color: rgb(153, 153, 153); font-family: Manrope, sans-serif; font-size: 15px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><br></span></p><p><span style=\"color: rgb(153, 153, 153); font-family: Manrope, sans-serif; font-size: 15px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><span style=\"display: inline !important;\">You’re not obliged to pay any fee before you earn and we just charge less than 2% on your total earnings if you have membership then it’s less than 1%</span></span></p><p><span style=\"color: rgb(153, 153, 153); font-family: Manrope, sans-serif; font-size: 15px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><span style=\"display: inline !important;\"><span style=\"display: inline !important;\">You’re not obliged to pay any fee before you earn and we just charge less than 2% on your total earnings if you have membership then it’s less than 1%</span></span></span></p><p><span style=\"color: rgb(153, 153, 153); font-family: Manrope, sans-serif; font-size: 15px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><span style=\"display: inline !important;\"><span style=\"display: inline !important;\"><br></span></span></span></p><p><span style=\"color: rgb(153, 153, 153); font-family: Manrope, sans-serif; font-size: 15px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><span style=\"display: inline !important;\"><span style=\"display: inline !important;\"><span style=\"display: inline !important;\">You’re not obliged to pay any fee before you earn and we just charge less than 2% on your total earnings if you have membership then it’s less than 1%</span></span></span></span></p><p><span style=\"color: rgb(153, 153, 153); font-family: Manrope, sans-serif; font-size: 15px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><span style=\"display: inline !important;\"><span style=\"display: inline !important;\"><span style=\"display: inline !important;\"><br></span></span></span></span></p><p><span style=\"color: rgb(153, 153, 153); font-family: Manrope, sans-serif; font-size: 15px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><span style=\"display: inline !important;\"><span style=\"display: inline !important;\"><span style=\"display: inline !important;\"><span style=\"display: inline !important;\">You’re not obliged to pay any fee before you earn and we just charge less than 2% on your total earnings if you have membership then it’s less than 1%</span><br></span><br></span><br></span><br></span><br></p>', 'on', 'normal_layout', 'nav-absolute', 'on', '02', '01', 'all', 1, '2022-12-21 07:22:54', '2023-11-28 05:25:04');
INSERT INTO `pages` (`id`, `title`, `slug`, `page_content`, `page_builder_status`, `layout`, `page_class`, `breadcrumb_status`, `navbar_variant`, `footer_variant`, `visibility`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Privacy Policy', 'privacy-policy', '<p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); line-height: 2;\" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\"><span style=\"font-size: 36px;\"><b>Privacy Policy</b></span></p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\"><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">Welcome to Xilancer, a freelancing platform dedicated to connecting clients with independent professionals globally. We understand the importance of privacy and are committed to protecting the personal information of our users. This Privacy Policy outlines our practices regarding the collection, use, and disclosure of your information when you use our website and services.</span><br></p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\">Please read this policy carefully to understand how we handle your personal information.</p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">1. Information We Collect</span></p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\">We may collect the following types of information:</p><ul style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; list-style-position: initial; list-style-image: initial; margin: 1.25em 0px; padding: 0px; display: flex; flex-direction: column; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-size:=\"\" 16px;=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\"><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold); margin-top: 1.25em; margin-bottom: 1.25em;\">Personal Identification Information:</span> Name, email address, phone number, postal address, and other contact details.</li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold); margin-top: 1.25em; margin-bottom: 1.25em;\">Professional Information:</span> Resume, work history, educational background, skills, and any other information related to professional qualifications.</li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold); margin-top: 1.25em; margin-bottom: 1.25em;\">Financial Information:</span> Payment details, including credit card numbers, bank information, and billing address, which are processed by our secure payment processing partners.</li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold); margin-top: 1.25em; margin-bottom: 1.25em;\">Technical Information:</span> IP addresses, browser types, operating system details, device information, and usage data such as website navigation patterns.</li></ul><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">2. How We Use Your Information</span></p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\">The information we collect may be used for the following purposes:</p><ul style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; list-style-position: initial; list-style-image: initial; margin: 1.25em 0px; padding: 0px; display: flex; flex-direction: column; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-size:=\"\" 16px;=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\"><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;\">To facilitate the creation of your account and your access to our services.</li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;\">To match clients with suitable freelancers and vice versa.</li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;\">To process payments and manage transactions.</li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;\">To communicate with you about your account or transactions and to send you updates about our services.</li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;\">To improve our website functionality and user experience.</li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;\">To comply with legal obligations and enforce our terms and conditions.</li></ul><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">3. Sharing Your Information</span></p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\">We may share your information with:</p><ul style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; list-style-position: initial; list-style-image: initial; margin: 1.25em 0px; padding: 0px; display: flex; flex-direction: column; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-size:=\"\" 16px;=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\"><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;\">Other users of the site when necessary to facilitate service offerings and collaborations.</li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;\">Service providers who perform services on our behalf, such as payment processing, data analysis, and email delivery services.</li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;\">Law enforcement or other government agencies if required by law or in good faith belief that such action is necessary to comply with legal processes.</li></ul><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\">We do not sell, rent, or lease our user lists to third parties for their marketing purposes without your explicit consent.</p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">4. Data Security</span></p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\">We implement reasonable security measures to protect against unauthorized access, alteration, disclosure, or destruction of your personal information. However, no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee its absolute security.</p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">5. Your Rights</span></p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\">You have the right to:</p><ul style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; list-style-position: initial; list-style-image: initial; margin: 1.25em 0px; padding: 0px; display: flex; flex-direction: column; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-size:=\"\" 16px;=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\"><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;\">Access, update, or delete the personal information we have on you.</li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;\">Object to the processing of your personal information.</li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;\">Request that we restrict the processing of your personal information.</li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;\">Withdraw consent at any time where we relied on your consent to process your personal information.</li></ul><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">6. International Transfers</span></p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\">Your information may be transferred to, and maintained on, computers located outside of your state, province, country, or other governmental jurisdiction where the data protection laws may differ from those of your jurisdiction.</p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">7. Changes to This Privacy Policy</span></p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\">We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. We encourage you to review this Privacy Policy periodically for any changes.</p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">8. Contact Us</span></p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\">If you have any questions about this Privacy Policy, please contact us:</p><ul style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; list-style-position: initial; list-style-image: initial; margin: 1.25em 0px; padding: 0px; display: flex; flex-direction: column; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-size:=\"\" 16px;=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\"><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;\">By email: [Insert Email Address]</li><li style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; padding-left: 0.375em; display: block; min-height: 28px;\">By visiting this page on our website: [Insert Privacy Policy Page URL]</li></ul><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Consent</span></p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\">By using our website and services, you consent to the collection, use, and sharing of your personal information as outlined in this Privacy Policy.</p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-top: 1.25em; margin-right: 0px; margin-left: 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" segoe=\"\" ui\",=\"\" roboto,=\"\" ubuntu,=\"\" cantarell,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" white-space-collapse:=\"\" preserve;=\"\" background-color:=\"\" rgb(247,=\"\" 247,=\"\" 248);\"=\"\">This Privacy Policy is intended to be a general template and may need to be tailored to comply with the laws of your jurisdiction or to suit the specific operations of your website or application. It is advisable to consult with a legal expert when drafting your actual privacy policy.</p>', NULL, 'normal_layout', 'none', 'on', NULL, '01', 'all', 1, '2022-12-28 01:51:06', '2023-11-28 00:05:11');
INSERT INTO `pages` (`id`, `title`, `slug`, `page_content`, `page_builder_status`, `layout`, `page_class`, `breadcrumb_status`, `navbar_variant`, `footer_variant`, `visibility`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Home Page One', 'home-page-one', '<p>asdaui sasd aosidj laksdj aklsdj alkfjsdoijqoi aslkd aslkdj asoidj asoidj asd jmoriopi posdf aspod kaspod jaspodij asdiopja siopdjasoid jaspodi jaspdas fdpasoqwe k rokasodk aspodk asdasd asd</p>', 'on', 'home_page_layout', 'none', NULL, '01', '01', 'all', 1, '2023-10-26 05:33:00', '2024-01-17 06:22:19');
INSERT INTO `pages` (`id`, `title`, `slug`, `page_content`, `page_builder_status`, `layout`, `page_class`, `breadcrumb_status`, `navbar_variant`, `footer_variant`, `visibility`, `status`, `created_at`, `updated_at`) VALUES
(8, 'About Us', 'about-us', '<p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">About Us</span></p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\">Welcome to [Your Freelancing Website Name], where talent meets opportunity.</p><h3 style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 1.25em; font-weight: 600; margin-top: 1rem; margin-bottom: 0.5rem; line-height: 1.6; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: inherit;\">Our Story</span></h3><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\">In the bustling digital age, where connectivity is as simple as a click, we found that the true potential of freelance talent was still untapped. Established in [Year], our platform was born from a simple yet powerful vision: to create a seamless bridge between gifted freelancers and visionary businesses.</p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\">We recognized the hurdles of the gig economy – the uncertainty, the competition, the often-impersonal interactions – and set out to craft a solution that would empower both freelancers and clients alike.</p><h3 style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 1.25em; font-weight: 600; margin-top: 1rem; margin-bottom: 0.5rem; line-height: 1.6; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: inherit;\">Our Mission</span></h3><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\">At [Your Freelancing Website Name], we\'re not just building a marketplace; we\'re cultivating a community. Our mission is to facilitate a professional environment where freelancers can thrive, businesses can innovate, and collaboration can flourish.</p><h3 style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 1.25em; font-weight: 600; margin-top: 1rem; margin-bottom: 0.5rem; line-height: 1.6; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: inherit;\">Our Values</span></h3><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Integrity</span>: We believe in honest and transparent communication, ensuring that every interaction on our platform is conducted with the utmost respect and professionalism.</p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Innovation</span>: Staying ahead of the curve is in our DNA. We constantly seek out new ways to enhance your experience, simplify processes, and enable success.</p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Excellence</span>: Our commitment to quality is unwavering. We meticulously curate our pool of talent and the projects that come through our platform, guaranteeing a standard of excellence that is second to none.</p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: 600; color: var(--tw-prose-bold);\">Community</span>: We understand the power of connection. That\'s why we foster a supportive network of professionals who share advice, offer mentorship, and help each other grow.</p><h3 style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 1.25em; font-weight: 600; margin-top: 1rem; margin-bottom: 0.5rem; line-height: 1.6; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: inherit;\">Our Community</span></h3><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\">Our freelancers are the heartbeat of our platform. They are writers, designers, developers, marketers, consultants, and more – each bringing a unique set of skills and a passion for their craft.</p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\">Our clients range from startups to Fortune 500 companies, all seeking the perfect match for their project needs. Together, they span the globe, creating a diverse and dynamic tapestry of cultures and ideas.</p><h3 style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 1.25em; font-weight: 600; margin-top: 1rem; margin-bottom: 0.5rem; line-height: 1.6; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: inherit;\">Our Promise</span></h3><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\">To Freelancers: We promise to provide you with a platform where you can showcase your skills, set your rates, and connect with clients who value what you do.</p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\">To Clients: We promise a curated selection of top-tier freelancers who are not only talented but also reliable and ready to help bring your projects to life.</p><h3 style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 1.25em; font-weight: 600; margin-top: 1rem; margin-bottom: 0.5rem; line-height: 1.6; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><span style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: inherit;\">Join Us</span></h3><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\">Whether you\'re a freelancer looking to take your career to new heights or a business in search of the right talent to complete your next project, [Your Freelancing Website Name] is your partner in success. Explore our site, join our community, and let\'s make something incredible together.</p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\">Because here, we believe that when great minds collaborate, the possibilities are endless.</p><hr style=\"border-top-width: 1px; border-style: solid; border-color: var(--tw-prose-hr); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: rgb(55, 65, 81); height: 0px; margin-top: 3em; margin-bottom: 3em; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; font-size: 16px; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\"><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-right: 0px; margin-left: 0px; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \"Segoe UI\", Roboto, Ubuntu, Cantarell, \"Noto Sans\", sans-serif, \"Helvetica Neue\", Arial, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\", \"Noto Color Emoji\"; white-space-collapse: preserve; background-color: rgb(247, 247, 248);\">This sample is meant to be inspirational and should be customized to align with the specific brand voice, value proposition, and unique selling points of your freelancing website.</p>', 'on', 'normal_layout', 'none', 'on', NULL, '01', 'all', 1, '2023-11-02 06:43:42', '2023-11-19 07:42:47');
INSERT INTO `pages` (`id`, `title`, `slug`, `page_content`, `page_builder_status`, `layout`, `page_class`, `breadcrumb_status`, `navbar_variant`, `footer_variant`, `visibility`, `status`, `created_at`, `updated_at`) VALUES
(9, 'Terms Conditions', 'terms-conditions', '<p><span style=\"font-size: 36px;\">Terms Conditions</span><br><br><br>Welcome to Xilancer, a freelancing platform dedicated to connecting clients with independent professionals globally. We understand the importance of privacy and are committed to protecting the personal information of our users. This Privacy Policy outlines our practices regarding the collection, use, and disclosure of your information when you use our website and services.<br><br>Please read this policy carefully to understand how we handle your persona﻿l information.<br><br>1. Information We Collect<br><br>We may collect the following types of information:<br><br>&nbsp;&nbsp;&nbsp; Personal Identification Information: Name, email address, phone number, postal address, and other contact details.<br>&nbsp;&nbsp;&nbsp; Professional Information: Resume, work history, educational background, skills, and any other information related to professional qualifications.<br>&nbsp;&nbsp;&nbsp; Financial Information: Payment details, including credit card numbers, bank information, and billing address, which are processed by our secure payment processing partners.<br>&nbsp;&nbsp;&nbsp; Technical Information: IP addresses, browser types, operating system details, device information, and usage data such as website navigation patterns.<br><br>2. How We Use Your Information<br><br>The information we collect may be used for the following purposes:<br><br>&nbsp;&nbsp;&nbsp; To facilitate the creation of your account and your access to our services.<br>&nbsp;&nbsp;&nbsp; To match clients with suitable freelancers and vice versa.<br>&nbsp;&nbsp;&nbsp; To process payments and manage transactions.<br>&nbsp;&nbsp;&nbsp; To communicate with you about your account or transactions and to send you updates about our services.<br>&nbsp;&nbsp;&nbsp; To improve our website functionality and user experience.<br>&nbsp;&nbsp;&nbsp; To comply with legal obligations and enforce our terms and conditions.<br><br>3. Sharing Your Information<br><br>We may share your information with:<br><br>&nbsp;&nbsp;&nbsp; Other users of the site when necessary to facilitate service offerings and collaborations.<br>&nbsp;&nbsp;&nbsp; Service providers who perform services on our behalf, such as payment processing, data analysis, and email delivery services.<br>Law enforcement or other government agencies if required by law or in good faith belief that such action is necessary to comply with legal processes.<br><br>We do not sell, rent, or lease our user lists to third parties for their marketing purposes without your explicit consent.<br><br>4. Data Security<br><br>We implement reasonable security measures to protect against unauthorized access, alteration, disclosure, or destruction of your personal information. However, no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee its absolute security.<br><br>5. Your Rights<br><br>You have the right to:<br><br>&nbsp;&nbsp;&nbsp; Access, update, or delete the personal information we have on you.<br>&nbsp;&nbsp;&nbsp; Object to the processing of your personal information.<br>&nbsp;&nbsp;&nbsp; Request that we restrict the processing of your personal information.<br>&nbsp;&nbsp;&nbsp; Withdraw consent at any time where we relied on your consent to process your personal information.<br><br>6. International Transfers<br><br>Your information may be transferred to, and maintained on, computers located outside of your state, province, country, or other governmental jurisdiction where the data protection laws may differ from those of your jurisdiction.<br><br>7. Changes to This Privacy Policy<br><br>We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. We encourage you to review this Privacy Policy periodically for any changes.<br><br>8. Contact Us<br><br>If you have any questions about this Privacy Policy, please contact us:<br><br>&nbsp;&nbsp;&nbsp; By email: [Insert Email Address]<br>&nbsp;&nbsp;&nbsp; By visiting this page on our website: [Insert Privacy Policy Page URL]<br><br>Consent<br><br>By using our website and services, you consent to the collection, use, and sharing of your personal information as outlined in this Privacy Policy.<br><br>This Privacy Policy is intended to be a general template and may need to be tailored to comply with the laws of your jurisdiction or to suit the specific operations of your website or application. It is advisable to consult with a legal expert when drafting your actual privacy policy.<br></p>', NULL, 'normal_layout', NULL, NULL, NULL, '01', 'all', 1, '2024-03-10 16:36:03', '2024-03-10 16:36:03'),
(10, 'Home Page Two', 'home-page-two', '<p>Home Page Two</p>', 'on', 'normal_layout', 'none', NULL, NULL, '01', 'all', 1, '2024-06-03 14:26:33', '2024-06-03 14:35:19');

-- --------------------------------------------------------

--
-- Table structure for table `page_builders`
--

CREATE TABLE `page_builders` (
  `id` bigint UNSIGNED NOT NULL,
  `addon_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_namespace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_order` bigint UNSIGNED DEFAULT NULL,
  `addon_page_id` bigint UNSIGNED DEFAULT NULL,
  `addon_page_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_builders`
--

INSERT INTO `page_builders` (`id`, `addon_name`, `addon_type`, `addon_namespace`, `addon_location`, `addon_order`, `addon_page_id`, `addon_page_type`, `addon_settings`, `created_at`, `updated_at`) VALUES
(3, 'HeaderStyleOne', 'update', 'plugins\\PageBuilder\\Addons\\Header\\HeaderStyleOne', 'dynamic_page', 1, 7, 'dynamic_page', 'a:23:{s:2:\"id\";s:1:\"3\";s:10:\"addon_name\";s:14:\"HeaderStyleOne\";s:15:\"addon_namespace\";s:64:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcSGVhZGVyXEhlYWRlclN0eWxlT25l\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"1\";s:13:\"addon_page_id\";s:1:\"7\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";s:47:\"Work from anywhere, Get the freedom you deserve\";s:8:\"subtitle\";s:131:\"Get hired by great clients and businesses around the world and work independently as you want. Pay just 1-2% fees on your earnings.\";s:21:\"find_work_button_text\";s:8:\"Find Job\";s:21:\"find_work_button_link\";s:38:\"https://xilancer.xgenious.com/jobs/all\";s:24:\"find_project_button_text\";s:12:\"Find Project\";s:24:\"find_project_button_link\";s:42:\"https://xilancer.xgenious.com/projects/all\";s:27:\"top_freelancer_of_the_month\";N;s:12:\"slider_image\";N;s:15:\"shape_image_one\";s:3:\"123\";s:15:\"shape_image_two\";s:3:\"124\";s:16:\"background_image\";N;s:11:\"padding_top\";s:2:\"64\";s:14:\"padding_bottom\";s:2:\"59\";s:10:\"section_bg\";N;s:10:\"trusted_by\";a:1:{s:5:\"logo_\";a:5:{i:0;s:2:\"94\";i:1;s:2:\"92\";i:2;s:2:\"91\";i:3;s:2:\"90\";i:4;s:2:\"93\";}}}', '2023-10-26 00:25:40', '2024-08-17 08:52:09'),
(4, 'WhyOurMarketplace', 'update', 'plugins\\PageBuilder\\Addons\\WhyOurMarketplace\\WhyOurMarketplace', 'dynamic_page', 2, 7, 'dynamic_page', 'a:13:{s:2:\"id\";s:1:\"4\";s:10:\"addon_name\";s:17:\"WhyOurMarketplace\";s:15:\"addon_namespace\";s:84:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcV2h5T3VyTWFya2V0cGxhY2VcV2h5T3VyTWFya2V0cGxhY2U=\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"2\";s:13:\"addon_page_id\";s:1:\"7\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";s:25:\"Why work in our platform?\";s:11:\"padding_top\";s:3:\"100\";s:14:\"padding_bottom\";s:2:\"50\";s:10:\"section_bg\";N;s:21:\"why_choose_our_market\";a:2:{s:6:\"image_\";a:4:{i:0;s:2:\"67\";i:1;s:2:\"66\";i:2;s:2:\"68\";i:3;s:2:\"69\";}s:6:\"title_\";a:4:{i:0;s:25:\"19K+ Jobs Posted Everyday\";i:1;s:29:\"8K+ Globally Verified Clients\";i:2;s:31:\"We Take Little to No Commission\";i:3;s:28:\"Get Certificates of Earnings\";}}}', '2023-10-26 00:59:44', '2024-02-19 07:36:04'),
(5, 'PopularJobOne', 'update', 'plugins\\PageBuilder\\Addons\\Job\\PopularJobOne', 'dynamic_page', 4, 7, 'dynamic_page', 'a:13:{s:2:\"id\";s:1:\"5\";s:10:\"addon_name\";s:13:\"PopularJobOne\";s:15:\"addon_namespace\";s:60:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcSm9iXFBvcHVsYXJKb2JPbmU=\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"3\";s:13:\"addon_page_id\";s:1:\"7\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";s:11:\"Recent Jobs\";s:5:\"items\";s:2:\"10\";s:11:\"padding_top\";s:2:\"61\";s:14:\"padding_bottom\";s:2:\"60\";s:10:\"section_bg\";N;}', '2023-10-26 01:09:17', '2023-11-28 04:46:07'),
(6, 'TestimonialOne', 'update', 'plugins\\PageBuilder\\Addons\\Testimonial\\TestimonialOne', 'dynamic_page', 5, 7, 'dynamic_page', 'a:14:{s:2:\"id\";s:1:\"6\";s:10:\"addon_name\";s:14:\"TestimonialOne\";s:15:\"addon_namespace\";s:72:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcVGVzdGltb25pYWxcVGVzdGltb25pYWxPbmU=\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"5\";s:13:\"addon_page_id\";s:1:\"7\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";s:38:\"What Freelancers are Thinking About Us\";s:18:\"slider_button_text\";N;s:5:\"items\";s:1:\"5\";s:11:\"padding_top\";s:3:\"100\";s:14:\"padding_bottom\";s:3:\"100\";s:10:\"section_bg\";N;}', '2023-10-26 01:22:31', '2024-02-19 07:44:23'),
(7, 'FaqOne', 'update', 'plugins\\PageBuilder\\Addons\\Faq\\FaqOne', 'dynamic_page', 7, 7, 'dynamic_page', 'a:15:{s:2:\"id\";s:1:\"7\";s:10:\"addon_name\";s:6:\"FaqOne\";s:15:\"addon_namespace\";s:52:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcRmFxXEZhcU9uZQ==\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"7\";s:13:\"addon_page_id\";s:1:\"7\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:13:\"section_title\";s:25:\"Frequently Asked Question\";s:9:\"sub_title\";s:82:\"Didn’t find the right answer? here you can ask your own questions to our support\";s:5:\"image\";s:2:\"72\";s:11:\"padding_top\";s:3:\"100\";s:14:\"padding_bottom\";s:2:\"50\";s:10:\"section_bg\";N;s:3:\"faq\";a:2:{s:6:\"title_\";a:5:{i:0;s:37:\"How much commission do I need to pay?\";i:1;s:33:\"How membership subscription work?\";i:2;s:53:\"What are the benefits of joining Freelancer platform?\";i:3;s:43:\"Do I need to pay extra fees for withdrawal?\";i:4;s:26:\"What’s the closure time?\";}s:12:\"description_\";a:5:{i:0;s:154:\"You’re not obliged to pay any fee before you earn and we just charge less than 2% on your total earnings if you have membership then it’s less than 1%\";i:1;s:154:\"You’re not obliged to pay any fee before you earn and we just charge less than 2% on your total earnings if you have membership then it’s less than 1%\";i:2;s:154:\"You’re not obliged to pay any fee before you earn and we just charge less than 2% on your total earnings if you have membership then it’s less than 1%\";i:3;s:154:\"You’re not obliged to pay any fee before you earn and we just charge less than 2% on your total earnings if you have membership then it’s less than 1%\";i:4;s:154:\"You’re not obliged to pay any fee before you earn and we just charge less than 2% on your total earnings if you have membership then it’s less than 1%\";}}}', '2023-10-26 01:28:32', '2024-02-19 07:51:18'),
(8, 'PricePlanOne', 'update', 'plugins\\PageBuilder\\Addons\\PricePlan\\PricePlanOne', 'dynamic_page', 8, 7, 'dynamic_page', 'a:12:{s:2:\"id\";s:1:\"8\";s:10:\"addon_name\";s:12:\"PricePlanOne\";s:15:\"addon_namespace\";s:68:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcUHJpY2VQbGFuXFByaWNlUGxhbk9uZQ==\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"8\";s:13:\"addon_page_id\";s:1:\"7\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";s:10:\"Price Plan\";s:10:\"section_bg\";N;s:11:\"padding_top\";s:2:\"50\";s:14:\"padding_bottom\";s:2:\"50\";}', '2023-10-26 01:34:03', '2024-02-19 07:57:12'),
(9, 'NewsLetterOne', 'update', 'plugins\\PageBuilder\\Addons\\NewsLetter\\NewsLetterOne', 'dynamic_page', 10, 7, 'dynamic_page', 'a:14:{s:2:\"id\";s:1:\"9\";s:10:\"addon_name\";s:13:\"NewsLetterOne\";s:15:\"addon_namespace\";s:68:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcTmV3c0xldHRlclxOZXdzTGV0dGVyT25l\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"7\";s:13:\"addon_page_id\";s:1:\"7\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";s:67:\"Join the club of hundreds of other Freelancers working with freedom\";s:9:\"sub_title\";s:102:\"Get discounts and newsletters on our hotels in your email. We promise to not spam. Unsubscribe anytime\";s:5:\"image\";s:2:\"70\";s:11:\"padding_top\";s:3:\"100\";s:14:\"padding_bottom\";s:3:\"100\";s:10:\"section_bg\";N;}', '2023-10-27 17:31:28', '2024-01-17 06:31:50'),
(10, 'BrandOne', 'update', 'plugins\\PageBuilder\\Addons\\Brand\\BrandOne', 'dynamic_page', 11, 7, 'dynamic_page', 'a:12:{s:2:\"id\";s:2:\"10\";s:10:\"addon_name\";s:8:\"BrandOne\";s:15:\"addon_namespace\";s:56:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcQnJhbmRcQnJhbmRPbmU=\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"8\";s:13:\"addon_page_id\";s:1:\"7\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:11:\"padding_top\";s:2:\"50\";s:14:\"padding_bottom\";s:2:\"50\";s:10:\"section_bg\";N;s:10:\"brand_logo\";a:1:{s:6:\"brand_\";a:7:{i:0;s:3:\"100\";i:1;s:2:\"99\";i:2;s:2:\"98\";i:3;s:2:\"96\";i:4;s:2:\"95\";i:5;s:2:\"97\";i:6;s:2:\"98\";}}}', '2023-10-27 17:35:54', '2024-01-17 06:31:50'),
(12, 'ContactMessage', 'update', 'plugins\\PageBuilder\\Addons\\Contact\\ContactMessage', 'dynamic_page', 1, 2, 'dynamic_page', 'a:16:{s:2:\"id\";s:2:\"12\";s:10:\"addon_name\";s:14:\"ContactMessage\";s:15:\"addon_namespace\";s:68:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcQ29udGFjdFxDb250YWN0TWVzc2FnZQ==\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"1\";s:13:\"addon_page_id\";s:1:\"2\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:7:\"heading\";s:10:\"Contact Us\";s:16:\"contact_form_des\";s:90:\"Feel free to contact with us if you have any query or face any issues to use this website.\";s:5:\"title\";s:12:\"Contact Info\";s:16:\"contact_info_des\";s:83:\"Also you can use quick contact details. Our team will response as soon as possible.\";s:12:\"contact_info\";a:3:{s:5:\"icon_\";a:5:{i:0;s:21:\"fas fa-map-marker-alt\";i:1;s:12:\"fas fa-phone\";i:2;s:12:\"fas fa-phone\";i:3;s:15:\"fas fa-envelope\";i:4;s:12:\"fas fa-clock\";}s:6:\"title_\";a:5:{i:0;s:7:\"Address\";i:1;s:12:\"Phone Number\";i:2;s:15:\"Phone Number(2)\";i:3;s:13:\"Email Address\";i:4;s:14:\"Business Hours\";}s:12:\"description_\";a:5:{i:0;s:34:\"8502 Preston Wood, Oregon Michigan\";i:1;s:12:\"(629)5550129\";i:2;s:12:\"(088)5532129\";i:3;s:24:\"bill.senders@example.com\";i:4;s:26:\"(GMT +6) 10:00am - 07:00pm\";}}s:11:\"padding_top\";s:3:\"191\";s:14:\"padding_bottom\";s:3:\"190\";s:14:\"custom_form_id\";s:1:\"1\";}', '2023-10-30 19:18:39', '2023-11-28 06:10:30'),
(13, 'AboutUs', 'update', 'plugins\\PageBuilder\\Addons\\About\\AboutUs', 'dynamic_page', 1, 8, 'dynamic_page', 'a:15:{s:2:\"id\";s:2:\"13\";s:10:\"addon_name\";s:7:\"AboutUs\";s:15:\"addon_namespace\";s:56:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcQWJvdXRcQWJvdXRVcw==\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"1\";s:13:\"addon_page_id\";s:1:\"8\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:13:\"section_title\";s:8:\"About Us\";s:11:\"description\";s:880:\"<p style=\"text-align: left; line-height: 1.6;\"><span style=\"font-weight: normal;\">Welcome to Xilancer, where dynamic connections between talented freelancers and visionary clients. Our platform is a vibrant marketplace designed to elevate the way freelancers and clients collaborate, innovate, and succeed.</span></p><p style=\"text-align: left; line-height: 1.6;\"><span style=\"font-weight: normal;\"><span style=\"text-align: var(--bs-body-text-align); display: inline !important;\"><br></span></span></p><p style=\"text-align: left; line-height: 1.6;\"><span style=\"font-weight: normal; text-align: var(--bs-body-text-align); color: var(--light-color); display: inline !important;\">At Xilancer, we envision a world where every project, big or small, finds its perfect match. We\'re here to break down barriers, empower creativity, and redefine the future of work.</span><br></p><p></p>\";s:11:\"creditility\";a:2:{s:6:\"title_\";a:3:{i:0;s:3:\"39K\";i:1;s:3:\"60K\";i:2;s:3:\"50K\";}s:12:\"description_\";a:3:{i:0;s:23:\"Clients working with us\";i:1;s:27:\"Freelancers working with us\";i:2;s:16:\"Orders processed\";}}s:5:\"image\";s:3:\"116\";s:11:\"padding_top\";s:3:\"100\";s:14:\"padding_bottom\";s:3:\"100\";s:10:\"section_bg\";s:16:\"rgb(201, 38, 38)\";}', '2023-11-18 00:30:12', '2024-02-19 08:40:41'),
(14, 'WhatWeDo', 'update', 'plugins\\PageBuilder\\Addons\\About\\WhatWeDo', 'dynamic_page', 2, 8, 'dynamic_page', 'a:15:{s:2:\"id\";s:2:\"14\";s:10:\"addon_name\";s:8:\"WhatWeDo\";s:15:\"addon_namespace\";s:56:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcQWJvdXRcV2hhdFdlRG8=\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"2\";s:13:\"addon_page_id\";s:1:\"8\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:13:\"section_title\";s:11:\"What we do?\";s:8:\"subtitle\";s:162:\"Xilancer is your seamless gateway to connect clients with exceptional freelancers. We curate a diverse talent pool, streamline collaboration with efficient tools.\";s:5:\"image\";s:2:\"82\";s:9:\"video_url\";s:43:\"https://www.youtube.com/watch?v=NJqnhqWt2Jc\";s:11:\"padding_top\";s:3:\"100\";s:14:\"padding_bottom\";s:2:\"50\";s:10:\"section_bg\";s:18:\"rgb(255, 255, 255)\";}', '2023-11-18 00:32:13', '2024-02-19 08:42:53'),
(17, 'Team', 'update', 'plugins\\PageBuilder\\Addons\\About\\Team', 'dynamic_page', 4, 8, 'dynamic_page', 'a:14:{s:2:\"id\";s:2:\"17\";s:10:\"addon_name\";s:4:\"Team\";s:15:\"addon_namespace\";s:52:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcQWJvdXRcVGVhbQ==\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"4\";s:13:\"addon_page_id\";s:1:\"8\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:13:\"section_title\";s:26:\"Meet our  hardworking team\";s:8:\"subtitle\";N;s:11:\"padding_top\";s:3:\"100\";s:14:\"padding_bottom\";s:3:\"100\";s:10:\"section_bg\";N;s:4:\"team\";a:3:{s:6:\"image_\";a:5:{i:0;s:3:\"105\";i:1;s:3:\"104\";i:2;s:3:\"103\";i:3;s:3:\"102\";i:4;s:3:\"101\";}s:5:\"name_\";a:5:{i:0;s:13:\"Md Siam Ahmed\";i:1;s:15:\"Mohammad Shahin\";i:2;s:12:\"Nazmul Hoque\";i:3;s:16:\"Md Riyad Hossain\";i:4;s:14:\"Md Zahid Hasan\";}s:12:\"designation_\";a:5:{i:0;s:17:\"Webflow Developer\";i:1;s:12:\"Web Designer\";i:2;s:9:\"Developer\";i:3;s:14:\"Html Developer\";i:4;s:9:\"Developer\";}}}', '2023-11-18 01:11:45', '2024-02-19 08:45:27'),
(18, 'PopularProjectOne', 'update', 'plugins\\PageBuilder\\Addons\\Project\\PopularProjectOne', 'dynamic_page', 3, 7, 'dynamic_page', 'a:13:{s:2:\"id\";s:2:\"18\";s:10:\"addon_name\";s:17:\"PopularProjectOne\";s:15:\"addon_namespace\";s:72:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcUHJvamVjdFxQb3B1bGFyUHJvamVjdE9uZQ==\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"3\";s:13:\"addon_page_id\";s:1:\"7\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";s:12:\"Top Projects\";s:5:\"items\";s:1:\"5\";s:11:\"padding_top\";s:2:\"50\";s:14:\"padding_bottom\";s:2:\"50\";s:10:\"section_bg\";N;}', '2023-11-25 05:15:02', '2024-02-19 07:39:07'),
(19, 'Credit', 'update', 'plugins\\PageBuilder\\Addons\\About\\Credit', 'dynamic_page', 3, 8, 'dynamic_page', 'a:12:{s:2:\"id\";s:2:\"19\";s:10:\"addon_name\";s:6:\"Credit\";s:15:\"addon_namespace\";s:52:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcQWJvdXRcQ3JlZGl0\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"3\";s:13:\"addon_page_id\";s:1:\"8\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:6:\"credit\";a:2:{s:6:\"title_\";a:3:{i:0;s:3:\"49K\";i:1;s:4:\"$50M\";i:2;s:3:\"09X\";}s:12:\"description_\";a:3:{i:0;s:45:\"Jobs we have handled in our Xilancer platform\";i:1;s:47:\"Earned by Freelancers in our platform till date\";i:2;s:47:\"Awards received in IT for excellence in service\";}}s:11:\"padding_top\";s:2:\"50\";s:14:\"padding_bottom\";s:3:\"100\";s:10:\"section_bg\";N;}', '2023-11-27 04:32:01', '2024-02-19 08:44:17'),
(20, 'CategoryProjectOne', 'update', 'plugins\\PageBuilder\\Addons\\Category\\CategoryProjectOne', 'dynamic_page', 6, 7, 'dynamic_page', 'a:14:{s:2:\"id\";s:2:\"20\";s:10:\"addon_name\";s:18:\"CategoryProjectOne\";s:15:\"addon_namespace\";s:72:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcQ2F0ZWdvcnlcQ2F0ZWdvcnlQcm9qZWN0T25l\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"6\";s:13:\"addon_page_id\";s:1:\"7\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";N;s:5:\"items\";s:2:\"10\";s:18:\"slider_button_text\";N;s:11:\"padding_top\";s:2:\"50\";s:14:\"padding_bottom\";s:2:\"50\";s:10:\"section_bg\";N;}', '2024-01-17 06:31:37', '2024-02-19 07:48:08'),
(21, 'CategoryJobOne', 'update', 'plugins\\PageBuilder\\Addons\\Category\\CategoryJobOne', 'dynamic_page', 9, 7, 'dynamic_page', 'a:14:{s:2:\"id\";s:2:\"21\";s:10:\"addon_name\";s:14:\"CategoryJobOne\";s:15:\"addon_namespace\";s:68:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcQ2F0ZWdvcnlcQ2F0ZWdvcnlKb2JPbmU=\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"9\";s:13:\"addon_page_id\";s:1:\"7\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";N;s:5:\"items\";s:2:\"10\";s:18:\"slider_button_text\";N;s:11:\"padding_top\";s:2:\"50\";s:14:\"padding_bottom\";s:2:\"50\";s:10:\"section_bg\";N;}', '2024-01-17 06:31:55', '2024-02-19 07:59:11'),
(22, 'HeaderStyleTwo', 'update', 'plugins\\PageBuilder\\Addons\\Header\\HeaderStyleTwo', 'dynamic_page', 1, 10, 'dynamic_page', 'a:28:{s:2:\"id\";s:2:\"22\";s:10:\"addon_name\";s:14:\"HeaderStyleTwo\";s:15:\"addon_namespace\";s:64:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcSGVhZGVyXEhlYWRlclN0eWxlVHdv\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"1\";s:13:\"addon_page_id\";s:2:\"10\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";s:40:\"Connecting dot between talents & leaders\";s:8:\"subtitle\";s:166:\"We make it’s easier for talents and businesses to connect and we make it absolutely less charges. Hire Talents or Get Hired from our platform and work independently\";s:21:\"find_work_button_text\";s:9:\"Find Work\";s:21:\"find_work_button_link\";s:38:\"https://xilancer.xgenious.com/jobs/all\";s:24:\"find_project_button_text\";s:12:\"Find Project\";s:24:\"find_project_button_link\";s:42:\"https://xilancer.xgenious.com/projects/all\";s:27:\"top_freelancer_of_the_month\";N;s:15:\"shape_image_one\";s:3:\"137\";s:15:\"shape_image_two\";s:3:\"132\";s:11:\"light_image\";s:3:\"133\";s:16:\"freelancer_image\";N;s:13:\"freelancer_id\";s:1:\"7\";s:12:\"talent_image\";s:3:\"134\";s:12:\"client_image\";N;s:9:\"client_id\";s:1:\"1\";s:16:\"background_image\";s:3:\"131\";s:11:\"padding_top\";s:3:\"154\";s:14:\"padding_bottom\";s:3:\"145\";s:10:\"section_bg\";N;s:10:\"trusted_by\";a:1:{s:5:\"logo_\";a:1:{i:0;N;}}}', '2024-06-03 14:31:10', '2024-08-17 08:51:59'),
(23, 'WhyChooseUs', 'update', 'plugins\\PageBuilder\\Addons\\WhyChooseUs\\WhyChooseUs', 'dynamic_page', 2, 10, 'dynamic_page', 'a:18:{s:2:\"id\";s:2:\"23\";s:10:\"addon_name\";s:11:\"WhyChooseUs\";s:15:\"addon_namespace\";s:68:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcV2h5Q2hvb3NlVXNcV2h5Q2hvb3NlVXM=\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"2\";s:13:\"addon_page_id\";s:2:\"10\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";s:42:\"We value each relationship on our platform\";s:8:\"subtitle\";s:14:\"Why choose us?\";s:16:\"mini_description\";s:186:\"Our Freelancers aren\'t Bots; they\'re human beings with a sense of humour within the bounds of their job. We believe in forming long-term relationships with both our Talent & our Clients.\";s:15:\"shape_image_one\";s:3:\"138\";s:15:\"shape_image_two\";s:3:\"140\";s:15:\"thumbnail_image\";s:3:\"139\";s:11:\"padding_top\";s:3:\"102\";s:14:\"padding_bottom\";s:2:\"75\";s:10:\"section_bg\";N;s:13:\"why_choose_us\";a:1:{s:6:\"title_\";a:4:{i:0;s:9:\"Less fees\";i:1;s:12:\"Live support\";i:2;s:18:\"No fees for client\";i:3;s:14:\"Verified users\";}}}', '2024-06-03 14:31:14', '2024-06-03 16:29:33'),
(24, 'WhyOurMarketplace', 'update', 'plugins\\PageBuilder\\Addons\\WhyOurMarketplace\\WhyOurMarketplace', 'dynamic_page', 4, 10, 'dynamic_page', 'a:13:{s:2:\"id\";s:2:\"24\";s:10:\"addon_name\";s:17:\"WhyOurMarketplace\";s:15:\"addon_namespace\";s:84:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcV2h5T3VyTWFya2V0cGxhY2VcV2h5T3VyTWFya2V0cGxhY2U=\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"3\";s:13:\"addon_page_id\";s:2:\"10\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";s:25:\"Why work in our platform?\";s:11:\"padding_top\";s:2:\"87\";s:14:\"padding_bottom\";s:2:\"80\";s:10:\"section_bg\";N;s:21:\"why_choose_our_market\";a:2:{s:6:\"image_\";a:4:{i:0;s:2:\"69\";i:1;s:2:\"68\";i:2;s:2:\"67\";i:3;s:2:\"66\";}s:6:\"title_\";a:4:{i:0;s:25:\"19K+ Jobs Posted Everyday\";i:1;s:29:\"8K+ Globally Verified Clients\";i:2;s:31:\"We Take Little to No Commission\";i:3;s:28:\"Get Certificates of Earnings\";}}}', '2024-06-03 14:31:24', '2024-06-04 16:48:07'),
(26, 'ExploreCategoryJob', 'update', 'plugins\\PageBuilder\\Addons\\Job\\ExploreCategoryJob', 'dynamic_page', 6, 10, 'dynamic_page', 'a:14:{s:2:\"id\";s:2:\"26\";s:10:\"addon_name\";s:18:\"ExploreCategoryJob\";s:15:\"addon_namespace\";s:68:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcSm9iXEV4cGxvcmVDYXRlZ29yeUpvYg==\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"5\";s:13:\"addon_page_id\";s:2:\"10\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";s:12:\"Explore Jobs\";s:8:\"category\";s:1:\"1\";s:5:\"items\";s:1:\"5\";s:11:\"padding_top\";s:3:\"107\";s:14:\"padding_bottom\";s:3:\"110\";s:10:\"section_bg\";N;}', '2024-06-03 14:32:12', '2024-06-04 16:48:07'),
(27, 'ExploreCategoryProject', 'update', 'plugins\\PageBuilder\\Addons\\Project\\ExploreCategoryProject', 'dynamic_page', 5, 10, 'dynamic_page', 'a:14:{s:2:\"id\";s:2:\"27\";s:10:\"addon_name\";s:22:\"ExploreCategoryProject\";s:15:\"addon_namespace\";s:76:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcUHJvamVjdFxFeHBsb3JlQ2F0ZWdvcnlQcm9qZWN0\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"4\";s:13:\"addon_page_id\";s:2:\"10\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";s:16:\"Explore Projects\";s:8:\"category\";s:1:\"2\";s:5:\"items\";s:1:\"5\";s:11:\"padding_top\";s:2:\"87\";s:14:\"padding_bottom\";s:2:\"84\";s:10:\"section_bg\";N;}', '2024-06-03 14:32:15', '2024-06-04 16:48:07'),
(28, 'ExploreCategoryProject', 'update', 'plugins\\PageBuilder\\Addons\\Project\\ExploreCategoryProject', 'dynamic_page', 7, 10, 'dynamic_page', 'a:14:{s:2:\"id\";s:2:\"28\";s:10:\"addon_name\";s:22:\"ExploreCategoryProject\";s:15:\"addon_namespace\";s:76:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcUHJvamVjdFxFeHBsb3JlQ2F0ZWdvcnlQcm9qZWN0\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"6\";s:13:\"addon_page_id\";s:2:\"10\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";s:16:\"Explore Projects\";s:8:\"category\";s:1:\"1\";s:5:\"items\";s:1:\"5\";s:11:\"padding_top\";s:2:\"40\";s:14:\"padding_bottom\";s:2:\"47\";s:10:\"section_bg\";N;}', '2024-06-03 15:39:23', '2024-06-04 16:48:07'),
(29, 'LatestProject', 'update', 'plugins\\PageBuilder\\Addons\\Project\\LatestProject', 'dynamic_page', 9, 10, 'dynamic_page', 'a:13:{s:2:\"id\";s:2:\"29\";s:10:\"addon_name\";s:13:\"LatestProject\";s:15:\"addon_namespace\";s:64:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcUHJvamVjdFxMYXRlc3RQcm9qZWN0\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"8\";s:13:\"addon_page_id\";s:2:\"10\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";s:15:\"Latest Projects\";s:5:\"items\";s:1:\"5\";s:11:\"padding_top\";s:2:\"55\";s:14:\"padding_bottom\";s:2:\"52\";s:10:\"section_bg\";N;}', '2024-06-03 15:40:02', '2024-06-04 16:48:07'),
(42, 'MobiApplica', 'update', 'plugins\\PageBuilder\\Addons\\Mobilica\\Mobilica', 'dynamic_page', 10, 10, 'dynamic_page', 'a:25:{s:2:\"id\";s:2:\"42\";s:10:\"addon_name\";s:11:\"MobiApplica\";s:15:\"addon_namespace\";s:60:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcTW9iaWxpY2FcTW9iaWxpY2E=\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"8\";s:13:\"addon_page_id\";s:2:\"10\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:20:\"free_app_store_title\";s:31:\"Download Freelancers Mobile App\";s:20:\"free_app_store_image\";s:3:\"142\";s:19:\"free_app_store_link\";s:1:\"#\";s:25:\"free_app_play_store_image\";s:3:\"141\";s:24:\"free_app_play_store_link\";s:67:\"https://play.google.com/store/apps/details?id=com.xgenious.xilancer\";s:20:\"free_app_store_shape\";s:3:\"145\";s:20:\"free_app_store_phone\";s:3:\"144\";s:22:\"client_app_store_title\";s:27:\"Download Clients Mobile App\";s:22:\"client_app_store_image\";s:3:\"142\";s:21:\"client_app_store_link\";s:1:\"#\";s:27:\"client_app_play_store_image\";s:3:\"141\";s:26:\"client_app_play_store_link\";s:74:\"https://play.google.com/store/apps/details?id=com.xgenious.xilancer_client\";s:22:\"client_app_store_shape\";s:3:\"145\";s:22:\"client_app_store_phone\";s:3:\"143\";s:11:\"padding_top\";s:3:\"111\";s:14:\"padding_bottom\";s:2:\"95\";s:10:\"section_bg\";N;}', '2024-06-03 17:33:38', '2024-06-04 16:48:07'),
(44, 'ExploreCategoryProject', 'update', 'plugins\\PageBuilder\\Addons\\Project\\ExploreCategoryProject', 'dynamic_page', 8, 10, 'dynamic_page', 'a:14:{s:2:\"id\";s:2:\"44\";s:10:\"addon_name\";s:22:\"ExploreCategoryProject\";s:15:\"addon_namespace\";s:76:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcUHJvamVjdFxFeHBsb3JlQ2F0ZWdvcnlQcm9qZWN0\";s:10:\"addon_type\";s:6:\"update\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"7\";s:13:\"addon_page_id\";s:2:\"10\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";s:16:\"Explore Projects\";s:8:\"category\";s:1:\"4\";s:5:\"items\";s:1:\"5\";s:11:\"padding_top\";s:3:\"110\";s:14:\"padding_bottom\";s:3:\"102\";s:10:\"section_bg\";N;}', '2024-06-04 10:45:14', '2024-06-04 16:48:07'),
(45, 'CategoryProjectOne', 'new', 'plugins\\PageBuilder\\Addons\\Category\\CategoryProjectOne', 'dynamic_page', 3, 10, 'dynamic_page', 'a:13:{s:10:\"addon_name\";s:18:\"CategoryProjectOne\";s:15:\"addon_namespace\";s:72:\"cGx1Z2luc1xQYWdlQnVpbGRlclxBZGRvbnNcQ2F0ZWdvcnlcQ2F0ZWdvcnlQcm9qZWN0T25l\";s:10:\"addon_type\";s:3:\"new\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:1:\"3\";s:13:\"addon_page_id\";s:2:\"10\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";N;s:5:\"items\";s:2:\"10\";s:18:\"slider_button_text\";N;s:11:\"padding_top\";s:2:\"97\";s:14:\"padding_bottom\";s:2:\"88\";s:10:\"section_bg\";N;}', '2024-06-04 16:48:34', '2024-06-04 16:48:34'),
(46, 'ProjectPromotion', 'new', 'Modules\\SecurityManage\\Http\\PageBuilder\\Promotion\\ProjectPromotion', 'dynamic_page', 11, 10, 'dynamic_page', 'a:12:{s:10:\"addon_name\";s:16:\"ProjectPromotion\";s:15:\"addon_namespace\";s:88:\"TW9kdWxlc1xTZWN1cml0eU1hbmFnZVxIdHRwXFBhZ2VCdWlsZGVyXFByb21vdGlvblxQcm9qZWN0UHJvbW90aW9u\";s:10:\"addon_type\";s:3:\"new\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:2:\"11\";s:13:\"addon_page_id\";s:2:\"10\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";s:17:\"Promoted Projects\";s:5:\"items\";s:1:\"6\";s:11:\"padding_top\";s:2:\"45\";s:14:\"padding_bottom\";s:2:\"42\";s:10:\"section_bg\";N;}', '2024-07-29 15:15:25', '2024-07-29 15:15:25'),
(47, 'ProjectPromotion', 'new', 'Modules\\PromoteFreelancer\\Http\\PageBuilder\\Promotion\\ProjectPromotion', 'dynamic_page', 11, 10, 'dynamic_page', 'a:12:{s:10:\"addon_name\";s:16:\"ProjectPromotion\";s:15:\"addon_namespace\";s:92:\"TW9kdWxlc1xQcm9tb3RlRnJlZWxhbmNlclxIdHRwXFBhZ2VCdWlsZGVyXFByb21vdGlvblxQcm9qZWN0UHJvbW90aW9u\";s:10:\"addon_type\";s:3:\"new\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:2:\"11\";s:13:\"addon_page_id\";s:2:\"10\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";s:19:\"Promotional Project\";s:5:\"items\";s:1:\"5\";s:11:\"padding_top\";s:2:\"43\";s:14:\"padding_bottom\";s:2:\"51\";s:10:\"section_bg\";N;}', '2024-08-31 16:17:44', '2024-08-31 16:17:44'),
(48, 'ProfilePromotion', 'new', 'Modules\\PromoteFreelancer\\Http\\PageBuilder\\Promotion\\ProfilePromotion', 'dynamic_page', 12, 10, 'dynamic_page', 'a:12:{s:10:\"addon_name\";s:16:\"ProfilePromotion\";s:15:\"addon_namespace\";s:92:\"TW9kdWxlc1xQcm9tb3RlRnJlZWxhbmNlclxIdHRwXFBhZ2VCdWlsZGVyXFByb21vdGlvblxQcm9maWxlUHJvbW90aW9u\";s:10:\"addon_type\";s:3:\"new\";s:14:\"addon_location\";s:12:\"dynamic_page\";s:11:\"addon_order\";s:2:\"12\";s:13:\"addon_page_id\";s:2:\"10\";s:15:\"addon_page_type\";s:12:\"dynamic_page\";s:5:\"title\";s:19:\"Promotional Profile\";s:5:\"items\";s:1:\"5\";s:11:\"padding_top\";s:2:\"51\";s:14:\"padding_bottom\";s:2:\"52\";s:10:\"section_bg\";N;}', '2024-08-31 16:18:09', '2024-08-31 16:18:09');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `menu_name`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Category', 'category-list', 'admin', '2023-10-22 01:16:30', '2023-10-22 01:16:30'),
(2, 'Category', 'category-add', 'admin', '2023-10-22 01:16:30', '2023-10-22 01:16:30'),
(3, 'Category', 'category-edit', 'admin', '2023-10-22 01:16:31', '2023-10-22 01:16:31'),
(4, 'Category', 'category-delete', 'admin', '2023-10-22 01:16:31', '2023-10-22 01:16:31'),
(5, 'Category', 'category-status-change', 'admin', '2023-10-22 01:16:31', '2023-10-22 01:16:31'),
(6, 'Category', 'category-bulk-delete', 'admin', '2023-10-22 01:16:31', '2023-10-22 01:16:31'),
(7, 'Subcategory', 'subcategory-list', 'admin', '2023-10-22 01:18:53', '2023-10-22 01:18:53'),
(8, 'Subcategory', 'subcategory-add', 'admin', '2023-10-22 01:18:53', '2023-10-22 01:18:53'),
(9, 'Subcategory', 'subcategory-edit', 'admin', '2023-10-22 01:18:53', '2023-10-22 01:18:53'),
(10, 'Subcategory', 'subcategory-delete', 'admin', '2023-10-22 01:18:53', '2023-10-22 01:18:53'),
(11, 'Subcategory', 'subcategory-status-change', 'admin', '2023-10-22 01:18:53', '2023-10-22 01:18:53'),
(12, 'Subcategory', 'subcategory-bulk-delete', 'admin', '2023-10-22 01:18:53', '2023-10-22 01:18:53'),
(13, 'Skill', 'skill-list', 'admin', '2023-10-22 01:20:00', '2023-10-22 01:20:00'),
(14, 'Skill', 'skill-add', 'admin', '2023-10-22 01:20:00', '2023-10-22 01:20:00'),
(15, 'Skill', 'skill-edit', 'admin', '2023-10-22 01:20:00', '2023-10-22 01:20:00'),
(16, 'Skill', 'skill-delete', 'admin', '2023-10-22 01:20:00', '2023-10-22 01:20:00'),
(17, 'Skill', 'skill-status-change', 'admin', '2023-10-22 01:20:00', '2023-10-22 01:20:00'),
(18, 'Skill', 'skill-bulk-delete', 'admin', '2023-10-22 01:20:00', '2023-10-22 01:20:00'),
(19, 'Country', 'country-list', 'admin', '2023-10-22 01:25:54', '2023-10-22 01:25:54'),
(20, 'Country', 'country-add', 'admin', '2023-10-22 01:25:54', '2023-10-22 01:25:54'),
(21, 'Country', 'country-edit', 'admin', '2023-10-22 01:25:54', '2023-10-22 01:25:54'),
(22, 'Country', 'country-delete', 'admin', '2023-10-22 01:25:54', '2023-10-22 01:25:54'),
(23, 'Country', 'country-status-change', 'admin', '2023-10-22 01:25:54', '2023-10-22 01:25:54'),
(24, 'Country', 'country-bulk-delete', 'admin', '2023-10-22 01:25:54', '2023-10-22 01:25:54'),
(25, 'Country', 'country-csv-file-import', 'admin', '2023-10-22 01:25:54', '2023-10-22 01:25:54'),
(26, 'State', 'state-list', 'admin', '2023-10-22 01:26:48', '2023-10-22 01:26:48'),
(27, 'State', 'state-add', 'admin', '2023-10-22 01:26:48', '2023-10-22 01:26:48'),
(28, 'State', 'state-edit', 'admin', '2023-10-22 01:26:48', '2023-10-22 01:26:48'),
(29, 'State', 'state-delete', 'admin', '2023-10-22 01:26:48', '2023-10-22 01:26:48'),
(30, 'State', 'state-status-change', 'admin', '2023-10-22 01:26:48', '2023-10-22 01:26:48'),
(31, 'State', 'state-bulk-delete', 'admin', '2023-10-22 01:26:48', '2023-10-22 01:26:48'),
(32, 'State', 'state-csv-file-import', 'admin', '2023-10-22 01:26:48', '2023-10-22 01:26:48'),
(33, 'City', 'city-list', 'admin', '2023-10-22 01:27:12', '2023-10-22 01:27:12'),
(34, 'City', 'city-add', 'admin', '2023-10-22 01:27:12', '2023-10-22 01:27:12'),
(35, 'City', 'city-edit', 'admin', '2023-10-22 01:27:12', '2023-10-22 01:27:12'),
(36, 'City', 'city-delete', 'admin', '2023-10-22 01:27:12', '2023-10-22 01:27:12'),
(37, 'City', 'city-status-change', 'admin', '2023-10-22 01:27:13', '2023-10-22 01:27:13'),
(38, 'City', 'city-bulk-delete', 'admin', '2023-10-22 01:27:13', '2023-10-22 01:27:13'),
(39, 'City', 'city-csv-file-import', 'admin', '2023-10-22 01:27:13', '2023-10-22 01:27:13'),
(40, 'Project', 'project-list', 'admin', '2023-10-22 01:33:18', '2023-10-22 01:33:18'),
(41, 'Project', 'project-delete', 'admin', '2023-10-22 01:33:18', '2023-10-22 01:33:18'),
(42, 'Project', 'project-details', 'admin', '2023-10-22 01:33:18', '2023-10-22 01:33:18'),
(43, 'Project', 'project-reject', 'admin', '2023-10-22 01:33:19', '2023-10-22 01:33:19'),
(44, 'Project', 'project-status-change', 'admin', '2023-10-22 01:33:19', '2023-10-22 01:33:19'),
(45, 'Project', 'project-history-list', 'admin', '2023-10-22 01:35:30', '2023-10-22 01:35:30'),
(46, 'Job', 'job-list', 'admin', '2023-10-22 01:51:58', '2023-10-22 01:51:58'),
(47, 'Job', 'job-details', 'admin', '2023-10-22 01:51:58', '2023-10-22 01:51:58'),
(48, 'Job', 'job-delete', 'admin', '2023-10-22 01:51:58', '2023-10-22 01:51:58'),
(49, 'Job', 'job-status-change', 'admin', '2023-10-22 01:51:58', '2023-10-22 01:51:58'),
(50, 'Job', 'job-auto-approval', 'admin', '2023-10-22 01:51:59', '2023-10-22 01:51:59'),
(51, 'Job', 'job-history-list', 'admin', '2023-10-22 01:51:59', '2023-10-22 01:51:59'),
(52, 'Wallet', 'deposit-list', 'admin', '2023-10-22 01:58:28', '2023-10-22 01:58:28'),
(53, 'Wallet', 'deposit-settings-view', 'admin', '2023-10-22 01:58:28', '2023-10-22 01:58:28'),
(54, 'Wallet', 'deposit-settings-update', 'admin', '2023-10-22 01:58:28', '2023-10-22 01:58:28'),
(55, 'Wallet', 'deposit-history-details', 'admin', '2023-10-22 01:58:28', '2023-10-22 01:58:28'),
(56, 'Wallet', 'complete-manual-deposit-status', 'admin', '2023-10-22 01:58:28', '2023-10-22 01:58:28'),
(57, 'Withdraw', 'withdraw-list', 'admin', '2023-10-22 02:03:25', '2023-10-22 02:03:25'),
(58, 'Withdraw', 'withdraw-settings-view', 'admin', '2023-10-22 02:03:25', '2023-10-22 02:03:25'),
(59, 'Withdraw', 'withdraw-settings-update', 'admin', '2023-10-22 02:03:25', '2023-10-22 02:03:25'),
(60, 'Withdraw', 'withdraw-status-change', 'admin', '2023-10-22 02:03:25', '2023-10-22 02:03:25'),
(61, 'Withdraw', 'withdraw-payment-gateway-list', 'admin', '2023-10-22 02:03:25', '2023-10-22 02:03:25'),
(62, 'Withdraw', 'withdraw-payment-gateway-add', 'admin', '2023-10-22 02:03:25', '2023-10-22 02:03:25'),
(63, 'Withdraw', 'withdraw-payment-gateway-edit', 'admin', '2023-10-22 02:03:25', '2023-10-22 02:03:25'),
(64, 'Withdraw', 'withdraw-payment-gateway-delete', 'admin', '2023-10-22 02:03:25', '2023-10-22 02:03:25'),
(65, 'Withdraw', 'withdraw-payment-status-change', 'admin', '2023-10-22 02:03:25', '2023-10-22 02:03:25'),
(66, 'Subscription', 'subscription-type-list', 'admin', '2023-10-22 03:18:59', '2023-10-22 03:18:59'),
(67, 'Subscription', 'subscription-type-add', 'admin', '2023-10-22 03:18:59', '2023-10-22 03:18:59'),
(68, 'Subscription', 'subscription-type-edit', 'admin', '2023-10-22 03:18:59', '2023-10-22 03:18:59'),
(69, 'Subscription', 'subscription-type-delete', 'admin', '2023-10-22 03:18:59', '2023-10-22 03:18:59'),
(70, 'Subscription', 'subscription-type-bulk-delete', 'admin', '2023-10-22 03:18:59', '2023-10-22 03:18:59'),
(71, 'Subscription', 'subscription-list', 'admin', '2023-10-22 03:18:59', '2023-10-22 03:18:59'),
(72, 'Subscription', 'subscription-add', 'admin', '2023-10-22 03:18:59', '2023-10-22 03:18:59'),
(73, 'Subscription', 'subscription-edit', 'admin', '2023-10-22 03:18:59', '2023-10-22 03:18:59'),
(74, 'Subscription', 'subscription-delete', 'admin', '2023-10-22 03:18:59', '2023-10-22 03:18:59'),
(75, 'Subscription', 'subscription-bulk-delete', 'admin', '2023-10-22 03:18:59', '2023-10-22 03:18:59'),
(76, 'Subscription', 'subscription-status-change', 'admin', '2023-10-22 03:18:59', '2023-10-22 03:18:59'),
(77, 'Subscription', 'subscription-connect-settings-view', 'admin', '2023-10-22 03:18:59', '2023-10-22 03:18:59'),
(78, 'Subscription', 'subscription-connect-settings-update', 'admin', '2023-10-22 03:18:59', '2023-10-22 03:18:59'),
(79, 'User Subscription', 'user-subscription-list', 'admin', '2023-10-22 03:23:39', '2023-10-22 03:23:39'),
(80, 'User Subscription', 'user-subscription-status-change', 'admin', '2023-10-22 03:23:39', '2023-10-22 03:23:39'),
(81, 'User Subscription', 'user-active-subscription', 'admin', '2023-10-22 03:23:39', '2023-10-22 03:23:39'),
(82, 'User Subscription', 'user-inactive-subscription', 'admin', '2023-10-22 03:23:40', '2023-10-22 03:23:40'),
(83, 'User Subscription', 'user-manual-subscription', 'admin', '2023-10-22 03:23:40', '2023-10-22 03:23:40'),
(84, 'Transaction Fee', 'transaction-fee-settings-view', 'admin', '2023-10-22 03:28:15', '2023-10-22 03:28:15'),
(85, 'Transaction Fee', 'transaction-fee-settings-update', 'admin', '2023-10-22 03:28:15', '2023-10-22 03:28:15'),
(86, 'Withdraw Fee', 'withdraw-fee-settings-view', 'admin', '2023-10-22 03:28:38', '2023-10-22 03:28:38'),
(87, 'Withdraw Fee', 'withdraw-fee-settings-update', 'admin', '2023-10-22 03:28:38', '2023-10-22 03:28:38'),
(88, 'Admin Commission', 'admin-commission-settings-view', 'admin', '2023-10-22 03:30:49', '2023-10-22 03:30:49'),
(89, 'Admin Commission', 'admin-commission-settings-update', 'admin', '2023-10-22 03:30:49', '2023-10-22 03:30:49'),
(90, 'Order', 'order-list', 'admin', '2023-10-22 03:38:10', '2023-10-22 03:38:10'),
(91, 'Order', 'order-details', 'admin', '2023-10-22 03:38:10', '2023-10-22 03:38:10'),
(92, 'Order', 'order-hold', 'admin', '2023-10-22 03:38:10', '2023-10-22 03:38:10'),
(93, 'Order', 'order-active', 'admin', '2023-10-22 03:38:10', '2023-10-22 03:38:10'),
(94, 'Order', 'order-queue', 'admin', '2023-10-22 03:38:10', '2023-10-22 03:38:10'),
(95, 'Order', 'order-deliver', 'admin', '2023-10-22 03:38:10', '2023-10-22 03:38:10'),
(96, 'Order', 'order-complete', 'admin', '2023-10-22 03:38:10', '2023-10-22 03:38:10'),
(97, 'Order', 'order-cancel', 'admin', '2023-10-22 03:38:10', '2023-10-22 03:38:10'),
(98, 'Order', 'order-decline', 'admin', '2023-10-22 03:38:10', '2023-10-22 03:38:10'),
(99, 'Order', 'order-manual-payment-status-update', 'admin', '2023-10-22 03:38:10', '2023-10-22 03:38:10'),
(100, 'Department', 'department-list', 'admin', '2023-10-22 03:59:01', '2023-10-22 03:59:01'),
(101, 'Department', 'department-add', 'admin', '2023-10-22 03:59:01', '2023-10-22 03:59:01'),
(102, 'Department', 'department-edit', 'admin', '2023-10-22 03:59:01', '2023-10-22 03:59:01'),
(103, 'Department', 'department-delete', 'admin', '2023-10-22 03:59:01', '2023-10-22 03:59:01'),
(104, 'Department', 'department-bulk-delete', 'admin', '2023-10-22 03:59:01', '2023-10-22 03:59:01'),
(105, 'Department', 'department-status-update', 'admin', '2023-10-22 03:59:01', '2023-10-22 03:59:01'),
(106, 'Support Ticket', 'support-ticket-list', 'admin', '2023-10-22 04:19:55', '2023-10-22 04:19:55'),
(107, 'Support Ticket', 'support-ticket-details', 'admin', '2023-10-22 04:19:55', '2023-10-22 04:19:55'),
(108, 'Support Ticket', 'support-ticket-delete', 'admin', '2023-10-22 04:19:55', '2023-10-22 04:19:55'),
(109, 'Support Ticket', 'support-ticket-bulk-action', 'admin', '2023-10-22 04:19:55', '2023-10-22 04:19:55'),
(110, 'Support Ticket', 'support-ticket-status-change', 'admin', '2023-10-22 04:19:55', '2023-10-22 04:19:55'),
(111, 'Support Ticket', 'support-ticket-reply', 'admin', '2023-10-22 04:19:55', '2023-10-22 04:19:55'),
(112, 'Support Ticket', 'support-ticket-close', 'admin', '2023-10-22 04:19:56', '2023-10-22 04:19:56'),
(113, 'Notification', 'notification-list', 'admin', '2023-10-22 04:21:17', '2023-10-22 04:21:17'),
(114, 'Notification', 'notification-details', 'admin', '2023-10-22 04:21:17', '2023-10-22 04:21:17'),
(115, 'User Manage', 'user-list', 'admin', '2023-10-22 04:47:01', '2023-10-22 04:47:01'),
(116, 'User Manage', 'user-details', 'admin', '2023-10-22 04:47:01', '2023-10-22 04:47:01'),
(117, 'User Manage', 'user-details-update', 'admin', '2023-10-22 04:47:01', '2023-10-22 04:47:01'),
(118, 'User Manage', 'user-identity-details', 'admin', '2023-10-22 04:47:01', '2023-10-22 04:47:01'),
(119, 'User Manage', 'user-identity-decline', 'admin', '2023-10-22 04:47:01', '2023-10-22 04:47:01'),
(120, 'User Manage', 'user-identity-status-update', 'admin', '2023-10-22 04:47:01', '2023-10-22 04:47:01'),
(121, 'User Manage', 'user-password-change', 'admin', '2023-10-22 04:47:01', '2023-10-22 04:47:01'),
(122, 'User Manage', 'user-delete', 'admin', '2023-10-22 04:47:01', '2023-10-22 04:47:01'),
(123, 'User Manage', 'user-account-status-change', 'admin', '2023-10-22 04:47:01', '2023-10-22 04:47:01'),
(124, 'User Manage', 'user-individual-commission-settings', 'admin', '2023-10-22 04:47:01', '2023-10-22 04:47:01'),
(125, 'User Manage', 'user-account-suspend-page', 'admin', '2023-10-22 04:47:01', '2023-10-22 04:47:01'),
(126, 'User Manage', 'user-account-suspend', 'admin', '2023-10-22 04:47:01', '2023-10-22 04:47:01'),
(127, 'User Manage', 'user-trash-list', 'admin', '2023-10-22 04:49:01', '2023-10-22 04:49:01'),
(128, 'User Manage', 'user-restore-from-trash-list', 'admin', '2023-10-22 04:49:01', '2023-10-22 04:49:01'),
(129, 'Page Text Settings', 'login-page-settings-view', 'admin', '2023-10-22 05:12:33', '2023-10-22 05:12:33'),
(130, 'Page Text Settings', 'login-page-settings-update', 'admin', '2023-10-22 05:12:33', '2023-10-22 05:12:33'),
(131, 'Page Text Settings', 'register-page-settings-view', 'admin', '2023-10-22 05:12:33', '2023-10-22 05:12:33'),
(132, 'Page Text Settings', 'register-page-settings-update', 'admin', '2023-10-22 05:12:33', '2023-10-22 05:12:33'),
(133, 'Page Text Settings', 'account-page-settings-view', 'admin', '2023-10-22 05:12:33', '2023-10-22 05:12:33'),
(134, 'Page Text Settings', 'account-page-settings-update', 'admin', '2023-10-22 05:12:33', '2023-10-22 05:12:33'),
(135, 'Page Text Settings', 'introduction-page-settings-view', 'admin', '2023-10-22 05:12:33', '2023-10-22 05:12:33'),
(136, 'Page Text Settings', 'introduction-page-settings-update', 'admin', '2023-10-22 05:12:34', '2023-10-22 05:12:34'),
(137, 'Page Text Settings', 'experience-page-settings-view', 'admin', '2023-10-22 05:12:34', '2023-10-22 05:12:34'),
(138, 'Page Text Settings', 'experience-page-settings-update', 'admin', '2023-10-22 05:12:34', '2023-10-22 05:12:34'),
(139, 'Page Text Settings', 'education-page-settings-view', 'admin', '2023-10-22 05:12:34', '2023-10-22 05:12:34'),
(140, 'Page Text Settings', 'education-page-settings-update', 'admin', '2023-10-22 05:12:34', '2023-10-22 05:12:34'),
(141, 'Page Text Settings', 'work-page-settings-view', 'admin', '2023-10-22 05:12:34', '2023-10-22 05:12:34'),
(142, 'Page Text Settings', 'work-page-settings-update', 'admin', '2023-10-22 05:12:34', '2023-10-22 05:12:34'),
(143, 'Page Text Settings', 'skill-page-settings-view', 'admin', '2023-10-22 05:12:34', '2023-10-22 05:12:34'),
(144, 'Page Text Settings', 'skill-page-settings-update', 'admin', '2023-10-22 05:12:34', '2023-10-22 05:12:34'),
(145, 'Page Text Settings', 'photo-page-settings-view', 'admin', '2023-10-22 05:12:34', '2023-10-22 05:12:34'),
(146, 'Page Text Settings', 'photo-page-settings-update', 'admin', '2023-10-22 05:12:34', '2023-10-22 05:12:34'),
(147, 'General Settings', 'reading', 'admin', '2023-10-22 05:58:58', '2023-10-22 05:58:58'),
(148, 'General Settings', 'navbar-global-variant', 'admin', '2023-10-22 05:58:58', '2023-10-22 05:58:58'),
(149, 'General Settings', 'footer-global-variant', 'admin', '2023-10-22 05:58:58', '2023-10-22 05:58:58'),
(150, 'General Settings', 'site-identity', 'admin', '2023-10-22 05:58:58', '2023-10-22 05:58:58'),
(151, 'General Settings', 'basic-settings', 'admin', '2023-10-22 05:58:58', '2023-10-22 05:58:58'),
(152, 'General Settings', 'color-settings', 'admin', '2023-10-22 05:58:58', '2023-10-22 05:58:58'),
(153, 'General Settings', 'typography-settings', 'admin', '2023-10-22 05:58:58', '2023-10-22 05:58:58'),
(154, 'General Settings', 'seo-settings', 'admin', '2023-10-22 05:58:58', '2023-10-22 05:58:58'),
(155, 'General Settings', 'third-party-script-settings', 'admin', '2023-10-22 05:58:58', '2023-10-22 05:58:58'),
(156, 'General Settings', 'social-login-settings', 'admin', '2023-10-22 05:58:58', '2023-10-22 05:58:58'),
(157, 'General Settings', 'email-template-settings', 'admin', '2023-10-22 05:58:58', '2023-10-22 05:58:58'),
(158, 'General Settings', 'smtp-settings', 'admin', '2023-10-22 05:58:58', '2023-10-22 05:58:58'),
(159, 'General Settings', 'custom-css-settings', 'admin', '2023-10-22 05:58:59', '2023-10-22 05:58:59'),
(160, 'General Settings', 'custom-js-settings', 'admin', '2023-10-22 05:58:59', '2023-10-22 05:58:59'),
(161, 'General Settings', 'gdpr-settings', 'admin', '2023-10-22 05:58:59', '2023-10-22 05:58:59'),
(162, 'General Settings', 'licence-settings', 'admin', '2023-10-22 05:58:59', '2023-10-22 05:58:59'),
(163, 'General Settings', 'cache-settings', 'admin', '2023-10-22 05:58:59', '2023-10-22 05:58:59'),
(164, 'General Settings', 'database-upgrade', 'admin', '2023-10-22 05:58:59', '2023-10-22 05:58:59'),
(165, 'Payment Gateway Settings', 'payment-info-settings', 'admin', '2023-10-22 06:03:42', '2023-10-22 06:03:42'),
(166, 'Payment Gateway Settings', 'payment-gateway-settings', 'admin', '2023-10-22 06:03:42', '2023-10-22 06:03:42'),
(167, 'Menu Builder', 'menu-list', 'admin', '2023-10-22 06:20:10', '2023-10-22 06:20:10'),
(168, 'Menu Builder', 'menu-add', 'admin', '2023-10-22 06:20:10', '2023-10-22 06:20:10'),
(169, 'Menu Builder', 'menu-edit', 'admin', '2023-10-22 06:20:10', '2023-10-22 06:20:10'),
(170, 'Menu Builder', 'menu-delete', 'admin', '2023-10-22 06:20:10', '2023-10-22 06:20:10'),
(171, 'Form Builder', 'form-list', 'admin', '2023-10-22 06:27:24', '2023-10-22 06:27:24'),
(172, 'Form Builder', 'form-add', 'admin', '2023-10-22 06:27:24', '2023-10-22 06:27:24'),
(173, 'Form Builder', 'form-edit', 'admin', '2023-10-22 06:27:24', '2023-10-22 06:27:24'),
(174, 'Form Builder', 'form-delete', 'admin', '2023-10-22 06:27:24', '2023-10-22 06:27:24'),
(175, 'Form Builder', 'form-bulk-delete', 'admin', '2023-10-22 06:27:24', '2023-10-22 06:27:24'),
(176, 'Widget Builder', 'widget-list', 'admin', '2023-10-22 06:35:42', '2023-10-22 06:35:42'),
(177, 'Widget Builder', 'widget-add', 'admin', '2023-10-22 06:35:42', '2023-10-22 06:35:42'),
(178, 'Widget Builder', 'widget-update', 'admin', '2023-10-22 06:35:42', '2023-10-22 06:35:42'),
(179, 'Widget Builder', 'widget-delete', 'admin', '2023-10-22 06:35:42', '2023-10-22 06:35:42'),
(180, 'Email Template', 'email-template-list', 'admin', '2023-10-22 06:39:35', '2023-10-22 06:39:35'),
(181, 'Email Template', 'email-template-details', 'admin', '2023-10-22 06:39:35', '2023-10-22 06:39:35'),
(182, 'Email Template', 'email-template-update', 'admin', '2023-10-22 06:39:35', '2023-10-22 06:39:35'),
(183, 'Email Template', 'email-template-delete', 'admin', '2023-10-22 06:39:36', '2023-10-22 06:39:36'),
(184, 'Pages', 'page-list', 'admin', '2023-10-22 06:47:37', '2023-10-22 06:47:37'),
(185, 'Pages', 'page-create-new', 'admin', '2023-10-22 06:47:37', '2023-10-22 06:47:37'),
(186, 'Pages', 'page-edit', 'admin', '2023-10-22 06:47:37', '2023-10-22 06:47:37'),
(187, 'Pages', 'page-update', 'admin', '2023-10-22 06:47:37', '2023-10-22 06:47:37'),
(188, 'Pages', 'page-delete', 'admin', '2023-10-22 06:47:37', '2023-10-22 06:47:37'),
(189, 'Pages', 'page-delete-bulk-action', 'admin', '2023-10-22 06:47:38', '2023-10-22 06:47:38'),
(190, 'Pages', 'manage-404-page', 'admin', '2023-10-22 06:47:38', '2023-10-22 06:47:38'),
(191, 'Pages', 'update-404-page', 'admin', '2023-10-22 06:47:38', '2023-10-22 06:47:38'),
(192, 'Pages', 'manage-maintenance-page', 'admin', '2023-10-22 06:47:38', '2023-10-22 06:47:38'),
(193, 'Pages', 'update-maintenance-page', 'admin', '2023-10-22 06:47:38', '2023-10-22 06:47:38'),
(194, 'Language', 'language-list', 'admin', '2023-10-22 06:54:01', '2023-10-22 06:54:01'),
(195, 'Language', 'language-add', 'admin', '2023-10-22 06:54:01', '2023-10-22 06:54:01'),
(196, 'Language', 'language-edit', 'admin', '2023-10-22 06:54:01', '2023-10-22 06:54:01'),
(197, 'Language', 'language-word-edit', 'admin', '2023-10-22 06:54:01', '2023-10-22 06:54:01'),
(198, 'User Subscription', 'user-subscription-manual-payment-status-change', 'admin', '2023-10-25 04:31:06', '2023-10-25 04:31:06'),
(199, 'Support Ticket', 'support-ticket-add', 'admin', '2023-10-25 05:53:02', '2023-10-25 05:53:02'),
(200, 'Language', 'language-word-list', 'admin', '2023-10-25 22:44:08', '2023-10-25 22:44:08'),
(201, 'Language', 'language-word-add', 'admin', '2023-10-25 22:48:59', '2023-10-25 22:48:59'),
(202, 'User Manage', 'user-identity-verify-request-list', 'admin', '2023-10-25 23:04:19', '2023-10-25 23:04:19'),
(203, 'Blog Manage', 'blog-list', 'admin', '2024-01-04 06:37:10', '2024-01-04 06:37:10'),
(204, 'Blog Manage', 'blog-add', 'admin', '2024-01-04 06:37:10', '2024-01-04 06:37:10'),
(205, 'Blog Manage', 'blog-edit', 'admin', '2024-01-04 06:37:10', '2024-01-04 06:37:10'),
(206, 'Blog Manage', 'blog-delete', 'admin', '2024-01-04 06:37:11', '2024-01-04 06:37:11'),
(207, 'License Manage', 'generate-license-key', 'admin', '2024-01-04 06:37:11', '2024-01-04 06:37:11'),
(208, 'License Manage', 'update-license', 'admin', '2024-01-04 06:37:11', '2024-01-04 06:37:11');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolios`
--

CREATE TABLE `portfolios` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `load_from` int NOT NULL DEFAULT '0',
  `is_synced` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `portfolios`
--

INSERT INTO `portfolios` (`id`, `user_id`, `username`, `image`, `title`, `description`, `published_date`, `load_from`, `is_synced`, `created_at`, `updated_at`) VALUES
(2, 7, 'freelancer', '1699336547-6549d163cbd51.png', 'Build Laravel Website From Scratch', 'Zaika is an E-commerce app I designed for my client who owns a fashion brand in Britain - I did secondary reseach to understand people’s need and', NULL, 0, 0, '2023-03-13 04:52:50', '2023-11-06 23:55:47'),
(3, 7, 'freelancer', '1678780315-6410279b00cb4.png', 'Build Ecommerce Website From Scratch', 'Build Laravel Website From ScratchBuild Laravel Website From ScratchBuild Laravel Website From ScratchBuild Laravel Website From ScratchBuild', NULL, 0, 0, '2023-03-13 05:19:45', '2023-03-14 01:51:55'),
(4, 7, 'freelancer', '1678780293-641027851d676.png', 'Build PHP Website From Scratch', 'Build Ecommerce Website From ScratchBuild Ecommerce Website From ScratchBuild Ecommerce Website From ScratchBuild Ecommerce Website From Scratch', NULL, 0, 0, '2023-03-13 05:22:03', '2023-03-14 01:51:33'),
(5, 7, 'freelancer', '1678798094-64106d0e7e758.png', 'Build App Website From Scratch34', 'Build Ecommerce Website From Scratch   sdsdf sdfsd fsdf', NULL, 0, 0, '2023-03-13 05:24:23', '2023-03-15 04:56:27'),
(11, 8, 'tfreelancer2', '1678969543-64130ac75052e.png', 'as dasdasd asdas d', 'as dasd asdas asd asda sasd asda  asd asd asdas asdasd asd', NULL, 0, 0, '2023-03-16 06:25:43', '2023-03-16 06:25:43'),
(12, 8, 'riad', '1700914953-6561e7095c9f8.png', 'Multi Vendor Ecommerce Marketplace', 'Multi vendor market place is designed for multi purpose use.', NULL, 0, 0, '2023-11-05 06:03:51', '2023-11-25 06:22:33'),
(13, 8, 'riad', '1700914932-6561e6f4f1ca2.png', 'Service Marketplace', 'On demand service marketplace for freelancers and users.', NULL, 0, 0, '2023-11-05 06:07:34', '2023-11-25 06:22:12');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `basic_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `standard_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `premium_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `standard_revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `premium_revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_delivery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `standard_delivery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `premium_delivery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_regular_charge` double NOT NULL,
  `basic_discount_charge` double DEFAULT NULL,
  `standard_regular_charge` double DEFAULT NULL,
  `standard_discount_charge` double DEFAULT NULL,
  `premium_regular_charge` double DEFAULT NULL,
  `premium_discount_charge` double DEFAULT NULL,
  `project_on_off` tinyint NOT NULL DEFAULT '1' COMMENT '0=off, 1=on',
  `project_approve_request` tinyint NOT NULL DEFAULT '0' COMMENT '0=request for approve, 1=approve,2=2 will change to 0 when the user resubmit after rejected.',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'o=pending, 1=approve',
  `is_pro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_expire_date` timestamp NULL DEFAULT NULL,
  `offer_packages_available_or_not` int DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `load_from` int NOT NULL DEFAULT '0',
  `is_synced` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `user_id`, `category_id`, `title`, `slug`, `description`, `image`, `basic_title`, `standard_title`, `premium_title`, `basic_revision`, `standard_revision`, `premium_revision`, `basic_delivery`, `standard_delivery`, `premium_delivery`, `basic_regular_charge`, `basic_discount_charge`, `standard_regular_charge`, `standard_discount_charge`, `premium_regular_charge`, `premium_discount_charge`, `project_on_off`, `project_approve_request`, `status`, `is_pro`, `pro_expire_date`, `offer_packages_available_or_not`, `meta_title`, `meta_description`, `meta_tags`, `load_from`, `is_synced`, `created_at`, `updated_at`) VALUES
(68, 7, 1, 'I will create a responsive web design in HTML with 100% accuracy', 'i-will-create-responsive-ui-ux-web-page-design-and-html', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>Looking for an expert Front-End dev?</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.6;\"><font face=\"sans-serif\"><span style=\"font-size: 14px;\">Elevate your online presence with a meticulously crafted, responsive UI/UX web page designed to enhance user experience and engagement. With expertise in HTML/CSS, we bring your vision to life, ensuring a seamless and visually appealing website.</span></font></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5><br></h5><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>👉 What You Get</b></span></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Customized and responsive UI/UX web page design.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">HTML/CSS coding for a seamless browsing experience.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5></h5><h5></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>💡 Perfect for:</b></span></h5><ul><li style=\"line-height: 2;\"><font color=\"#424242\"><b>Business Websites</b> - For information technology, Textile, Agriculture industry</font></li><li style=\"line-height: 2;\"><font color=\"#424242\"><b>Portfolios</b> - For individuals looking to make their presence online</font></li><li style=\"line-height: 2;\"><font color=\"#424242\"><b>Landing Pages </b>- To generate sells/conversions for short or long events</font></li><li style=\"line-height: 2;\"><font color=\"#424242\"><b>Blogs</b> - To attract more visitor in web by spreading awareness in your target customers base&nbsp;</font></li></ul><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>🖥️ Package Includes:</b></span></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">$100 For 1 Page</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">$300 For 5 Page</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><font color=\"#000000\"><span style=\"font-size: 14px;\">💬 Chat with me for special requirements or to discuss your project, and let\'s bring your website vision to reality!</span></font></p><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1699175008-65475a6063c3e.png', 'Basic', 'Standard', 'Premium', '1', '2', '3', '1 Days', '1 Days', '1 Days', 50, NULL, 60, NULL, 70, NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, 0, 0, '2023-03-06 01:27:46', '2023-11-25 00:58:26'),
(69, 7, 2, 'I will develop you a beautiful website with JavaScript, React, Laravel', 'i-will-develop-your-website-with-javascript-react-laravel', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>Experienced in dynamic websites:</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">Elevate your online presence with a professionally developed website. We specialize in crafting robust and engaging websites using a powerful tech stack: JavaScript, React, and Laravel.</span></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><p></p><p style=\"\"></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>🌐 What We Offer:</b></span></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Custom website development with a focus on user experience and functionality</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\"><br></b></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">🛠️ Tech Stack:\r\n</b><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">\r\n</b></p><ul><li style=\"line-height: 2;\"><font color=\"#424242\"><b>JavaScript</b> - The foundational language for client-side scripting, enabling dynamic web experiences.</font></li><li style=\"line-height: 2;\"><font color=\"#424242\"><b>React</b> - A declarative JavaScript library for building user interfaces component-based development</font></li><li style=\"line-height: 2;\"><font color=\"#424242\"><b>Laravel</b> - A PHP framework known for its elegant syntax and powerful features.</font></li></ul><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>🖥️ Packages:</b></span></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>$100</b> - Only static website development using JavaScript (Perfect for portfolios)</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>$300</b> - Dynamic and interactive website using React (Perfect for websites that needs medium features)</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>$500</b> - Comprehensive website with React for the frontend and Laravel for the backend.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">&nbsp; 👉What\'s Not Included:</b><br></h5><p></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"color: rgb(0, 0, 0); font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><br></span></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"color: rgb(0, 0, 0); font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">💬 Chat with us for special requirements, and let\'s bring your vision to the digital realm!</span><br></p><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1700664296-655e13e800dbc.png', 'Basic', 'Standard', 'Premium', '2', '5', '10', '3 Days', '3 Days', '3 Days', 300, NULL, 400, NULL, 450, NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, 0, 0, '2023-03-06 02:16:52', '2023-11-27 06:55:37'),
(70, 7, 2, 'I will develop a books shop website using PHP, Laravel or WordPress', 'i-will-develop-php-laravel-website', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>Expert bookshop website development.</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">Whether you\'re an independent bookstore, an author, or a book enthusiast, we specialize in creating dynamic and user-friendly bookshop websites. Harness the power of PHP, Laravel, or WordPress to bring your literary vision to life.</span><br></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5><span style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><br></b></span></span></h5><h5 style=\"line-height: 2;\"><b style=\"color: var(--heading-color); font-family: var(--heading-font); font-size: 16px; text-align: var(--bs-body-text-align);\"><span style=\"font-size: 18px;\">💼 Current rates are for a limited time.</span></b></h5><p></p><p style=\"\"></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">🌐 What You Get:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Professionally developed bookshop website tailored to your specifications. Easy-to-manage backend for updating book listings</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5></h5><h5></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>📖 Features:</b></span></h5><ul><li style=\"line-height: 2;\"><font color=\"#424242\">User-friendly book browsing and search functionality. My team of developers are well educated on UX</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Secure payment gateways for seamless transactions. Payment gateways are well integrated&nbsp;for</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Responsive design for optimal viewing on all devices. Test extensive responsive experience</font></li></ul><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">📘 Premium Services:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>24x7 Support </b>- No matter when you need it I manage a team of developers to support you 24x7</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>On-time delivery</b> - Worried about things gets out of time? then no worries our on time delivery</font></li></ul><p><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><font color=\"#000000\"><span style=\"font-size: 14px;\">💬 Chat with us for special requirements, and let\'s bring your bookshop vision to the digital world!</span></font></p><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1699173508-65475484d03f6.png', 'Basic', 'Standard', 'Premium', '2', '5', '1', 'Less than a week', 'Less than a week', 'Less than a week', 550, NULL, 600, NULL, 1000, NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, 0, 0, '2023-03-12 02:02:42', '2023-11-25 23:17:52'),
(73, 7, 4, 'I will develop a Flutter Mobile App for eCommerce with extensive support', 'i-will-do-mobile-app-development', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>✨ Available for custom orders</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">Offering comprehensive Flutter mobile app development services for your eCommerce business with extended support.</span><br></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5><span style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><br></b></span></span></h5><h5 style=\"line-height: 2;\"><b style=\"color: var(--heading-color); font-family: var(--heading-font); font-size: 16px; text-align: var(--bs-body-text-align);\"><span style=\"font-size: 18px;\">👉Perfect gig for you</span></b><br></h5><p></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px; line-height: 1.4;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"font-size: 14px;\">Elevate your online store with a cutting-edge Flutter mobile app. We specialize in crafting seamless and feature-rich eCommerce applications that provide an immersive shopping experience for your customers.</span></p><p></p><p style=\"\"></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>🛒 Key Features:</b></span></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">User-friendly product browsing and purchasing - This let\'s your customers have a better experience&nbsp;</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Secure payment gateways for hassle-free transactions - We use a secured method to complete the payment</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Real-time order tracking and notifications.&nbsp;</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Customizable to match your brand identity.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">My specialty:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Apply Updated Methods - We work on updated technologies so we&nbsp;</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Maintain Quality Work - Iterative reviews and revisions for content that evolves with your feedback.</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">On-Time Delivery - Timely delivery is main priority</font></li></ul><p></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"color: rgb(0, 0, 0); font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><br></span></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><font color=\"#000000\"><span style=\"font-size: 14px;\">Message me before placing order to discuss your specific business goals I would be glad to answer.</span></font></p><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1699173151-6547531f6ebf9.png', 'Basic', 'Standard', 'Premium', '1', '3', '5', '3 Days', '3 Days', '3 Days', 500, NULL, 600, NULL, 800, NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, 0, 0, '2023-04-02 00:14:30', '2023-11-25 00:33:05'),
(84, 7, 4, 'I will develop an eCommerce Flutter Mobile app for Android and iOS', 'i-will-develop-a-flutter-mobile-app-for-android-and-ios', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>A✨ Open for Custom Orders</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">Propel your eCommerce venture to new heights with a tailored Flutter mobile app, available for both Android and iOS platforms.📱 Leveraging advanced Flutter development, I specialize in creating feature-rich, cross-platform mobile apps that seamlessly translate your eCommerce vision into a captivating digital experience.</span></h5><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><br></span></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><h5 style=\"line-height: 2;\"><b style=\"color: var(--heading-color); font-family: var(--heading-font); font-size: 16px; text-align: var(--bs-body-text-align);\"><span style=\"font-size: 18px;\">🚀 Flutter App Mastery:</span></b></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Expertly crafted Flutter mobile app for a dynamic and engaging user interface.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Effortless cross-platform functionality, ensuring a consistent experience on Android and iOS devices.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5></h5><h5></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>🛒 eCommerce Integration:</b></span></h5><ul><li style=\"line-height: 2;\"><font color=\"#424242\">Seamless integration of your eCommerce business, enabling customers to explore, shop, and checkout effortlessly.\r\n</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Intuitive navigation and user-friendly interfaces to boost conversions.</font></li></ul><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>Final Delivery Includes:</b></span></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">A polished and professionally developed Flutter mobile app tailored for your eCommerce success.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Support and guidance for a successful app launch.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">💬Have Any Questions?</b></h5><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1699172883-6547521391fbd.png', 'Basic', 'Standard', 'Premium', '1', '2', '3', '1 Days', '1 Days', '1 Days', 300, NULL, 400, NULL, 500, NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, 0, 0, '2023-04-03 03:23:16', '2023-11-25 00:57:35'),
(92, 7, 2, 'I will build you a Laravel/WordPress recruitment website and publish for you', 'i-will-fix-or-develop-laravel-website-and-vuejs', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>✨ Available for Custom Orders</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">With over 10 years of experience in the design industry, we specialize in crafting responsive WordPress websites and dynamic eCommerce platforms. Our expertise spans various sectors, including AI, Web 3.0, ICOs, IDOs, Crypto, NFT, IT, Blockchain, E-commerce, Airports, Retail, Universities, Automobile, and more.</span><br></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5><span style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><br></b></span></span></h5><h5 style=\"line-height: 2;\"><b style=\"color: var(--heading-color); font-family: var(--heading-font); font-size: 16px; text-align: var(--bs-body-text-align);\"><span style=\"font-size: 18px;\">🌟 Completed 500+ projects\r\n</span></b><br></h5><div><b style=\"color: var(--heading-color); font-family: var(--heading-font); font-size: 16px; text-align: var(--bs-body-text-align);\"><span style=\"font-size: 18px;\"><br></span></b></div><p></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px; line-height: 1.4;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">With my expertise, I\'ll define effective marketing goals for your business. I\'ll craft an innovative plan and strategy, utilizing advanced advertising methods for success.</span><br></p><p></p><p style=\"\"></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">🌐 Top Clients:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>Multiple Governments</b> - We built many WordPress websites for governments around the world  \r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>Intelio</b> - My one of the finest client is Intel we built an internal website for their recruitment process</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>Goolio</b> - Goolio is the world largest hosting provider and I built their website</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>Giantsoft</b> - Giant soft build SaaS software for their clients and I helped them with WordPress&nbsp;</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>Shahincedes</b> - A car brand which needed a website for their B2B agents and I built them.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5></h5><h5></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>What\'s Included in This Gig:</b></span></h5><ul><li style=\"line-height: 2;\"><font color=\"#424242\">Crafted for responsiveness on all devices (After completing project we do extensive tests)\r\n</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Build a eCommerce platform tailored to your business needs (Every business is unique, So are we)\r\n</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Customization options available for a unique web presence</font></li></ul><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">What\'s Not Included:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Content Creation (Image and text)\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Additional features beyond website design (You have to pay extra for e.g., custom functionalities, plugins)</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5><span style=\"font-size: 18px;\"><b>💬 Please message me before ordering</b></span></h5><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1699168234-65473feae005f.png', 'Basic', 'Standard', 'Premium', '2', '5', '10', 'Less than a week', 'Less than a week', 'Less than a week', 150, NULL, 250, NULL, 400, NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, 0, 0, '2023-05-15 07:25:04', '2023-11-28 06:47:39');
INSERT INTO `projects` (`id`, `user_id`, `category_id`, `title`, `slug`, `description`, `image`, `basic_title`, `standard_title`, `premium_title`, `basic_revision`, `standard_revision`, `premium_revision`, `basic_delivery`, `standard_delivery`, `premium_delivery`, `basic_regular_charge`, `basic_discount_charge`, `standard_regular_charge`, `standard_discount_charge`, `premium_regular_charge`, `premium_discount_charge`, `project_on_off`, `project_approve_request`, `status`, `is_pro`, `pro_expire_date`, `offer_packages_available_or_not`, `meta_title`, `meta_description`, `meta_tags`, `load_from`, `is_synced`, `created_at`, `updated_at`) VALUES
(93, 8, 1, 'I will convert psd to html, pdf to html, sketch to html responsive', 'i-will-convert-psd-to-html--pdf-to-html--sketch-to-html-responsive', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>Your Design, Your Vision, Our Expertise</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">🎨 Seeking to bring your designs to life on the web? Unlock the potential of your PSD, PDF, or Sketch files with our responsive HTML conversion services.</span></h5><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><br></span></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>💼 Exclusive promotional rates</b></span></h5><p></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px; line-height: 1.4;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">With a keen eye for detail and expertise in coding, I specialize in converting your design files into high-quality, pixel-perfect, and responsive HTML.</span><br></p><p></p><p style=\"\"></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">🌐 Responsive HTML Conversion:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Precision coding to ensure your design seamlessly adapts to various devices and screen sizes.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Cross-browser compatibility for a consistent user experience.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5></h5><h5></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>🔍 File Format Expertise:</b></span></h5><ul><li style=\"line-height: 2;\"><font color=\"#424242\">Expert handling of PSD, PDF, and Sketch files, preserving the design integrity during the conversion process.\r\n</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Attention to detail in implementing design elements, ensuring accuracy.</font></li></ul><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">Final Delivery Includes:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Clean and optimized HTML files ready for seamless integration into your web project.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Guidance on implementation and support for any post-conversion adjustments.</font></li></ul><p></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"color: rgb(0, 0, 0); font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><br></span></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"color: rgb(0, 0, 0); font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">Send a message to me before ordering 💬</span><br></p><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1699185334-654782b6ed9e9.png', 'Basic', 'Standard', 'Premium', 'unlimited', 'unlimited', '1', '1 Days', '1 Days', '1 Days', 50, NULL, 250, NULL, 400, NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, 0, 0, '2023-05-15 23:58:55', '2023-11-25 02:17:44'),
(94, 8, 11, 'I provide marketing and legal consultancy to the businesses in European Union', 'i-will-do-digital-marketing-training-for-business-owners', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>Open for Consultation</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">🌍 Are you a business in the European Union seeking expert guidance in marketing and consultancy? Look no further. With a focus on the EU market, I specialize in providing strategic marketing and consultancy services designed to propel your business towards sustained success.</span><br></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5><br></h5><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">📊 Strategic Marketing Insights:\r\n</b><br></h5><div><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">\r\n</b></div><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\">In-depth market analysis tailored to the EU business landscape.\r\n</li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\">Customized marketing strategies to maximize your brand\'s impact.</li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Daily Ads Reporting &amp; Technical Support</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5></h5><h5></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>🤝 Business Consultancy:</b></span></h5><ul><li style=\"line-height: 2;\"><font color=\"#424242\">Comprehensive business consultations to address challenges and seize opportunities.\r\n</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Strategic planning to enhance your business operations and growth.</font></li></ul><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">Additional Services:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Tailored marketing campaigns designed for the EU market.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Ongoing consultancy to adapt strategies to evolving market dynamics.</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Legal consultancy</font></li></ul><p style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><br></font></p><p style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><br></font></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">Have Any Questions? Chat with me.</b></h5><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1699185138-654781f2c2efe.png', 'Basic', 'Standard', 'Premium', '1', '2', '3', '1 Days', '1 Days', '1 Days', 50, NULL, 100, NULL, 150, NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, 0, 0, '2023-05-16 00:54:37', '2024-01-27 06:54:22'),
(95, 8, 11, 'I will create a  successful strategic marketing plan for your business', 'i-will-create-a-strategic-marketing-plan-for-your-business', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>Let\'s shape your success story</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">🚀 Is your business ready to soar to new heights? Unlock its full potential with a meticulously crafted and successful strategic marketing plan. 📈 With a wealth of experience in strategic marketing, I specialize in developing plans that not only align with your business goals but propel you ahead of the competition.</span><br></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5><span style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><br></b></span></span></h5><h5 style=\"line-height: 2;\"><b style=\"color: var(--heading-color); font-family: var(--heading-font); font-size: 16px; text-align: var(--bs-body-text-align);\"><span style=\"font-size: 18px;\">What\'s Included in This Service:</span></b><br></h5><p></p><ul><li style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px; line-height: 1.8;\"><font color=\"#424242\"><span style=\"font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">In-depth research to understand your industry landscape, competitors, and target audience.\r\n</span><br></font></li><li style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px; line-height: 1.4;\"><span style=\"font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><font color=\"#424242\">Identification of market trends and opportunities.</font></span></li></ul><p></p><p style=\"\"></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">🎯 Strategic Goal Setting:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Collaborative goal-setting sessions to define clear and achievable marketing objectives.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Alignment of marketing goals with overall business objectives.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5></h5><h5></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>Additional Services:</b></span></h5><ul><li style=\"line-height: 2;\"><font color=\"#424242\">Customized marketing strategies based on your industry, business size, and target market.\r\n</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Detailed implementation timelines and budget considerations.</font></li></ul><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">Final Delivery Includes:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">A detailed and actionable strategic marketing plan tailored to your business needs.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Guidance on plan implementation and monitoring for optimal results.</font></li></ul><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1699184794-6547809aeeaca.png', 'Basic', 'Standard', 'Premium', '1', '2', '3', 'Less than a month', 'Less than a month', 'Less than a month', 100, NULL, 200, NULL, 300, NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, 0, 0, '2023-05-16 01:03:12', '2023-11-25 02:08:58'),
(96, 8, 1, 'Need a expert graphic designer with an extensive real estate experience?', 'i-will-do-expert-3d-modeling-and-rendering-for-home-and-office-exterior', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>For Real Estate Visionaries</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">🏡 Are you in search of a graphic designer who not only understands design intricacies but also possesses a deep understanding of the real estate industry? Look no further. 🎨 Comprehensive understanding of the real estate landscape, Let me bring the unique blend of creativity and industry expertise to elevate your brand.</span><br></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5><br></h5><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">What\'s Included in This Service:</b></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Custom graphics designed to enhance your real estate brand\'s visual appeal.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Infographics, brochures, banners, and more, finely tuned to resonate with your target audience.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5></h5><h5></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>🏢 Real Estate Industry Insight:</b></span></h5><ul><li style=\"line-height: 2;\"><font color=\"#424242\">In-depth knowledge of real estate design trends and standards.\r\n</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Visual elements crafted to convey the unique selling points of your properties.</font></li></ul><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">Additional Services:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Custom design packages to suit your specific real estate marketing needs.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Quick turnaround to meet tight deadlines and campaign launches.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">Have Any Questions?</b></h5><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"color: rgb(0, 0, 0); font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">📧Let\'s chat :)</span><br></p><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1700898615-6561a737223c6.png', 'Basic', 'Standard', 'Premium', '1', '2', '1', '1 Days', '1 Days', '1 Days', 200, NULL, 250, NULL, 300, NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, 0, 0, '2023-05-16 01:29:02', '2023-11-25 02:06:03'),
(97, 8, 4, 'I will build you an customized eCommerce Flutter mobile app with the Zaika script', 'i-will-write-seo-content-for-your-blog', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>✨Accepting Custom Orders</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">Supercharge your eCommerce journey with a uniquely crafted Flutter mobile app, meticulously designed and seamlessly intertwined with the powerful Zaika script.📱 Bringing together the finesse of Flutter development and the robust Zaika script, I specialize in delivering cross-platform mobile apps that not only echo your brand but redefine your eCommerce experience.</span><br></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5><span style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><br></b></span></span></h5><h5 style=\"line-height: 2;\"><b style=\"color: var(--heading-color); font-family: var(--heading-font); font-size: 16px; text-align: var(--bs-body-text-align);\"><span style=\"font-size: 18px;\">💼 Avail the exclusive promotional rates</span></b></h5><p></p><p style=\"\"></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>🚀 Distinctive Flutter App:</b></span></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Precision-designed Flutter mobile app tailored for Android and iOS, reflecting your brand\'s uniqueness.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Integration of Zaika script for an enriched and feature-packed eCommerce voyage.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5></h5><h5></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>🛒 Zaika Script Harmony:</b></span></h5><ul><li style=\"line-height: 2;\"><font color=\"#424242\">Effortless assimilation of Zaika script features, ensuring a comprehensive and scalable eCommerce solution.\r\n</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Personalization options to ensure the app aligns seamlessly with your brand persona.</font></li></ul><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">Additional Services:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Unique features tailored to meet your specific business requirements.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Integration with secure payment gateways for a seamless and trustworthy transaction experience.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">What\'s Not Included:</b><br></h5><p></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"font-size: 14px;\"><br></span></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"font-size: 14px;\">Backend development (available through custom offers).\r\n</span></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"font-size: 14px;\">Ongoing maintenance services to keep your app at its prime.</span></p><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1700897731-6561a3c35902e.png', 'Basic', 'Standard', 'Premium', '1', '2', '3', 'Less than a week', 'Less than a week', 'Less than a week', 200, NULL, 400, NULL, 500, NULL, 1, 1, 1, 'yes', '2024-10-06 15:47:06', 1, NULL, NULL, NULL, 0, 0, '2023-05-16 02:18:29', '2024-05-09 15:47:32'),
(98, 8, 4, 'I will develop you an service based Flutter mobile app for Android and iOS', 'i-will-develop-php-laravel-codeigniter-node-website-design-rest-api', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>✨ Ready for custom orders</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">Transform your service-oriented business into a digital success story with a bespoke Flutter mobile app, compatible with both Android and iOS platforms. 📱 With expertise in Flutter development, I specialize in creating dynamic, cross-platform mobile apps tailored to showcase and enhance your service offerings.</span><br></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5><span style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><br></b></span></span></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>💼 Avail the current promotional rates.</b></span></h5><p></p><p style=\"\"></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">🚀 Flutter Excellence:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Expertly designed Flutter mobile app for a seamless and engaging user experience.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Cross-platform compatibility ensuring your app reaches both Android and iOS users.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5></h5><h5></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>🛠️ Service-Centric Integration:</b></span></h5><ul><li style=\"line-height: 2;\"><font color=\"#424242\">Seamless integration of your service offerings, allowing users to effortlessly access and utilize your services.\r\n</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Intuitive interfaces designed for optimal user engagement.</font></li></ul><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">Additional Services:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Customization options to reflect your brand identity and unique service features.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Incorporation of appointment scheduling, bookings, or other service-specific functionalities.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5><span style=\"font-size: 18px;\"><b>Have Any Questions?\r\n</b></span></h5><div><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">Let\'s chat 💬</span></div><div><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">\r\n</span></div><div><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">\r\n</span></div><div><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">\r\n</span></div><div><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">\r\n</span></div><div><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">\r\n</span></div><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1700896932-6561a0a47d056.png', 'Basic', 'Standard', 'Premium', '1', '2', '3', '1 Days', '1 Days', '1 Days', 300, NULL, 400, NULL, 500, NULL, 1, 1, 1, 'yes', '2024-10-06 15:46:14', 1, NULL, NULL, NULL, 0, 0, '2023-05-16 03:42:56', '2024-05-09 15:46:36');
INSERT INTO `projects` (`id`, `user_id`, `category_id`, `title`, `slug`, `description`, `image`, `basic_title`, `standard_title`, `premium_title`, `basic_revision`, `standard_revision`, `premium_revision`, `basic_delivery`, `standard_delivery`, `premium_delivery`, `basic_regular_charge`, `basic_discount_charge`, `standard_regular_charge`, `standard_discount_charge`, `premium_regular_charge`, `premium_discount_charge`, `project_on_off`, `project_approve_request`, `status`, `is_pro`, `pro_expire_date`, `offer_packages_available_or_not`, `meta_title`, `meta_description`, `meta_tags`, `load_from`, `is_synced`, `created_at`, `updated_at`) VALUES
(99, 7, 4, 'I will develop you online food business flutter Android, iOS  mobile app', 'i-will-do-mobile-app-development-ios-app-development', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>💼 Current rates are promotional</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">A Elevate your online food business with a custom-designed Flutter mobile app for both Android and iOS platforms. With expertise in mobile app development, I specialize in creating seamless and user-friendly applications that bring the convenience of your food business to customers\' fingertips.</span></h5><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><br></span></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><h5 style=\"line-height: 2;\"><b style=\"color: var(--heading-color); font-family: var(--heading-font); font-size: 16px; text-align: var(--bs-body-text-align);\"><span style=\"font-size: 18px;\">📲 Flutter App Development:</span></b></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Customized mobile app development using Flutter for a consistent and engaging user experience.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Cross-platform compatibility for Android and iOS devices</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5></h5><h5></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>🍔 Online Food Business Integration:</b></span></h5><ul><li style=\"line-height: 2;\"><font color=\"#424242\">Seamless integration of your food business, enabling customers to browse, order, and enjoy your offerings effortlessly.\r\n</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Intuitive navigation and user-friendly interfaces.</font></li></ul><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">Additional Services:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Customization options to reflect your brand identity and unique offerings.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Integration with payment gateways for secure and convenient transactions.</font></li></ul><p></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"color: rgb(0, 0, 0); font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><br></span></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"color: rgb(0, 0, 0); font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">💬 Chat with us to discuss your online food business\'s unique requirements, and let\'s bring your culinary offerings closer to your customers through a user-friendly mobile app.</span><br></p><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1700895106-656199820ac61.png', 'Basic', 'Standard', 'Premium', '1', '1', '1', '1 Days', '1 Days', '1 Days', 200, NULL, 300, NULL, 700, NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, 0, 0, '2023-05-16 03:51:24', '2023-11-25 00:51:46'),
(100, 7, 13, 'Unlock profound sales growth with my expertise in copywriting mastery', 'i-will-write-compelling-website-content-copywriting', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>💼 Current rates are promotional</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">Elevate your brand and drive unprecedented sales with the prowess of a professional content writer at your service. 🚀 With a passion for crafting compelling copies, I specialize in creating content that not only tells your brand story but propels your sales to new heights.</span><br></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5><span style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><br></b></span></span></h5><h5 style=\"line-height: 2;\"><b style=\"color: var(--heading-color); font-family: var(--heading-font); font-size: 16px; text-align: var(--bs-body-text-align);\"><span style=\"font-size: 18px;\">📝 Strategic Copywriting:</span></b></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Tailored copies designed to resonate with your target audience and propel them to action.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Persuasive messaging that transforms visitors into customers.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5></h5><h5></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>📊 Sales-Boosting Content:</b></span></h5><ul><li style=\"line-height: 2;\"><font color=\"#424242\">Engaging product descriptions, captivating landing pages, and magnetic calls-to-action.\r\n</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">SEO-optimized content for enhanced discoverability.</font></li></ul><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">Additional Services:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Customized content strategies to align with your brand voice and marketing goals.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Iterative reviews and revisions for content that evolves with your feedback.</font></li></ul><p></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"color: rgb(0, 0, 0); font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><br></span></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"color: rgb(0, 0, 0); font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">Message me before placing order to discuss your specific business goals I would be glad to answer.</span><br></p><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1699191208-654799a800029.png', 'Basic', 'Standard', 'Premium', '2', '5', '1', '1 Days', '1 Days', '1 Days', 100, NULL, 200, NULL, 300, NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, 0, 0, '2023-05-16 04:13:39', '2023-11-25 03:49:13'),
(101, 7, 13, 'I will create Pitch decks for your Startups round based investment funding pitch', 'i-will-write-powerful-and-engaging-website-content', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>✨ Available for Custom Orders</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">Secure the investment your startup deserves with a professionally crafted pitch deck tailored to captivate investors. 🚀 With a proven track record, I specialize in creating compelling pitch decks that effectively communicate your startup\'s value proposition, growth potential, and financial outlook.</span><br></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5><br></h5><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"line-height: 2;\"><b style=\"color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align); font-size: 18px;\">📊 Strategic Deck Design:</b><br></h5><div><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">\r\n</b></div><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><span style=\"color: rgb(66, 66, 66); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">Custom pitch deck designs that highlight key elements and tell your startup story effectively.</span><br></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Visual elements crafted for maximum impact and engagement.</font></li></ul><p style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><br></font></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5></h5><h5></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>💡 Content Development:</b></span></h5><ul><li style=\"line-height: 2;\"><font color=\"#424242\">Comprehensive content creation to articulate your business model, market opportunity.</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Concise and persuasive messaging to resonate with potential investors.</font></li></ul><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">Additional Services:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Customization options to align with your specific industry and target audience.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Iterative reviews and revisions for a pitch deck that evolves with your feedback.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">📧 Please message me before ordering</b></h5><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1699190458-654796bad8a5d.png', 'Basic', 'Standard', 'Premium', '1', '2', '3', '1 Days', '1 Days', '1 Days', 100, NULL, 200, NULL, 300, NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, 0, 0, '2023-05-16 04:56:08', '2024-01-27 07:01:35'),
(102, 7, 13, 'Your SEO Advantage: I will be your dedicated SEO website content writer', 'i-will-be-your-seo-website-content-writer', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>✨ Available for Custom Orders</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">With a passion for precision and SEO expertise, I specialize in crafting website content that not only captivates your audience but also boosts your search engine rankings.</span><br></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5><br></h5><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">What\'s Included in This Gig:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Tailored website content infused with strategic SEO elements for your business needs</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Keyword-rich and engaging copy for enhanced discoverability for better search engine optimizable&nbsp;</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5></h5><h5></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>Content Strategy 🔍</b></span></h5><ul><li style=\"line-height: 2;\"><font color=\"#424242\">Comprehensive keyword research and integration for targeted content.\r\n</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Structured content plans to align with your SEO goals.</font></li></ul><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">Additional Services:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Customized content packages for various website sections.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Regular content updates for sustained SEO benefits.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"color: rgb(0, 0, 0); font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">💬 Chat with me for personalized SEO content solutions and let\'s boost your website\'s visibility and engagement.</span><br></p><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1699189450-654792ca066b0.png', 'Basic', 'Standard', 'Premium', '1', '2', '3', '1 Days', '1 Days', '1 Days', 100, NULL, 120, NULL, 150, NULL, 1, 1, 1, 'yes', '2024-10-06 15:35:31', 1, NULL, NULL, NULL, 0, 0, '2023-05-16 04:57:22', '2024-05-09 15:36:04'),
(103, 7, 13, 'I will create quality, SEO driven web content for your eCommerce business', 'asd-haysdb-aksjda-dasdas-', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>🌟 Crafting compelling and SEO-driven web content</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">With a keen understanding of both quality content creation and SEO strategies, I\'ll elevate your eCommerce brand with engaging and search-optimized web content.</span></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><p></p><p style=\"\"></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">📜What\'s Included in This Gig:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Engaging and persuasive web content crafted to resonate with your target audience.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Unique product descriptions, brand stories, and landing page content.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5></h5><h5></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>🔍 SEO Optimization:</b></span></h5><ul><li style=\"line-height: 2;\"><font color=\"#424242\">Implementing SEO best practices to enhance your website\'s visibility on search engines for your business</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Keyword research and integration for strategic content placement on Google, Bing and other search engines</font></li></ul><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>Additional Services:</b></span></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Customized content packages based on your specific&nbsp;eCommerce business needs.\r\n</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Ongoing content updates and optimization.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">🤔Have Any Questions? Contact me</b></h5><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1699188456-65478ee8de9b8.png', 'Basic', 'Standard', 'Premium', 'unlimited', 'unlimited', '1', '1 Days', '1 Days', '1 Days', 100, NULL, 120, NULL, 150, NULL, 1, 1, 1, 'yes', '2024-10-06 15:35:01', 1, NULL, NULL, NULL, 0, 0, '2023-05-16 04:58:35', '2024-05-09 15:35:20'),
(104, 7, 1, 'I will design an attractive Youtube thumb for your new video', 'i-will-design-attractive-youtube-thumbnails', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>Need ✨shining YouTube thumbnail?</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.6;\"><font face=\"sans-serif\"><span style=\"font-size: 14px;\">Elevate your content with eye-catching YouTube thumbnails designed to enhance visibility and engagement. With a keen eye for visual appeal, we specialize in creating thumbnails that entice viewers and reflect the essence of your content.</span></font></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative; line-height: 1.6;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word; line-height: 1.8;\"><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5><br></h5><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>🎬 Perfect for:</b></span></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc; line-height: 1.8;\"><font color=\"#424242\"><b>Vlogs</b> - Elevate your vlogs with captivating thumbnails that tell your story at a glance for your loving fans</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc; line-height: 1.8;\"><font color=\"#424242\"><b>Tutorials</b> - Guide viewers seamlessly with visually enticing thumbnails for your tutorials and earn trusts</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc; line-height: 1.8;\"><font color=\"#424242\"><b>Gaming </b>- Gaming is on of the top niche. Level up your gaming content with attention-grabbing thumbnail</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">What\'s not included</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Content creation (I charge extra for content creation. You will have to pay $5 extra for an image editing)&nbsp;</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Revisions beyond the agreed-upon scope (12 revision are free but more than 12 will be needed $2/5 for each)</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">Have any questions?</b><br></h5><p></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"color: rgb(0, 0, 0); font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">💬 Contact with me before ordering I will reply any of your questions you may have. Thanks</span><br></p><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1699187854-65478c8e08747.png', 'Basic', 'Standard', 'Premium', '5', '10', '10', '1 Days', '1 Days', '1 Days', 50, NULL, 69, NULL, 90, NULL, 1, 1, 1, 'yes', '2024-10-06 15:34:30', 1, NULL, NULL, NULL, 0, 0, '2023-05-16 05:01:21', '2024-05-09 15:34:49'),
(105, 7, 1, 'I will design a  website or landing page design for your SaaS', 'i-will-do-figma-website-design-or-landing-page-ui-ux-design', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>About this gig</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">Are you considering how to create a successful Facebook Ads Campaign that can increase the number of leads or sales for your business, resulting in the achievement of your business goals?</span><br></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5><span style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><br></b></span></span></h5><h5 style=\"line-height: 2;\"><b style=\"color: var(--heading-color); font-family: var(--heading-font); font-size: 16px; text-align: var(--bs-body-text-align);\"><span style=\"font-size: 18px;\">✨Available for custom order</span></b><br></h5><p></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px; line-height: 1.6;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"font-size: 14px;\">With a decade of expertise, I excel in creating captivating Figma website designs and landing page UI/UX. My portfolio boasts successful partnerships spanning AI, Web 3.0, ICOs, IDOs, Crypto, Blockchain, E-commerce, Retail, Automobiles, and beyond</span></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px; line-height: 1.4;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"font-size: 14px;\"><br></span></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>🌐&nbsp; Top Clients:</b></span></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>Governments </b>- I work with governments around the world to improve products for citizens</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>Intelio&nbsp;</b>- Collaborated with intelio to enhance the experience of their products</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>Goolio&nbsp;</b>- Worked on Goolio Drive to maximize the potential and&nbsp;revenue</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>Giantsoft </b>- Collaborating with Giantsoft for better experience of their users in AI</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5></h5><h5></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>What\'s included in this Gig:</b></span></h5><ul><li style=\"line-height: 2;\"><span style=\"color: rgb(66, 66, 66); text-align: var(--bs-body-text-align); display: inline !important;\"><b>Homepage</b></span><span style=\"color: rgb(66, 66, 66); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"> - Up to 5 sections with well researched and explained case study for stakeholders</span></li><li style=\"line-height: 2;\"><span style=\"color: rgb(66, 66, 66); text-align: var(--bs-body-text-align); display: inline !important;\"><b>Homepage</b></span><span style=\"color: rgb(66, 66, 66); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"> + 1 Inner page designed with researched and analyzed data for enhanced user experience</span></li></ul><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">🌐 My specialty</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>Apply Updated UX Methods</b> - I will work on most updated UX methods like double diamond</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>Maintain Quality Work</b> - Quality is must for any user experience I maintain the highest quality possible</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>On-Time Delivery</b> - Worried about timing? No worries my delivery rate is high I\'ll deliver on time</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5 style=\"line-height: 1;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">Please 📩 message me before ordering</b></h5><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1699187515-65478b3b0682d.png', 'Basic', 'Standard', 'Premium', '1', '1', '1', '1 Days', '1 Days', '1 Days', 100, NULL, 120, NULL, 170, NULL, 1, 1, 1, 'yes', '2024-10-06 15:33:56', 1, NULL, NULL, NULL, 0, 0, '2023-05-16 05:05:24', '2024-05-09 15:34:15');
INSERT INTO `projects` (`id`, `user_id`, `category_id`, `title`, `slug`, `description`, `image`, `basic_title`, `standard_title`, `premium_title`, `basic_revision`, `standard_revision`, `premium_revision`, `basic_delivery`, `standard_delivery`, `premium_delivery`, `basic_regular_charge`, `basic_discount_charge`, `standard_regular_charge`, `standard_discount_charge`, `premium_regular_charge`, `premium_discount_charge`, `project_on_off`, `project_approve_request`, `status`, `is_pro`, `pro_expire_date`, `offer_packages_available_or_not`, `meta_title`, `meta_description`, `meta_tags`, `load_from`, `is_synced`, `created_at`, `updated_at`) VALUES
(107, 7, 11, 'I will be your Facebook campaign manager to run Shopify Facebook ads', 'as-dasdasuhyd-bsdjkaskjasdasdasda-s', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"text-align: var(--bs-body-text-align); display: inline !important; font-size: 18px;\"><b>🎯 Facebook Campaign Management:\r\n</b></span></h6><h6 style=\"line-height: 1.6;\"><span style=\"color: rgb(98, 100, 106); font-family: sans-serif; font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">As your dedicated Facebook Campaign Manager, I will bring expertise in running strategic and effective Shopify Facebook ad campaigns. 📈 With a proven track record, I\'ve successfully managed and optimized Facebook campaigns for Shopify businesses, ensuring increased visibility, engagement, and conversions.</span><br></h6></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5><br></h5><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">🛒 Shopify Facebook Ads:\r\n</b><br></h5><div><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">\r\n</b></div><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Tailored ad creatives to showcase your Shopify products effectively (I will show my case study)</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Continuous monitoring and optimization for improved ROI (Monitoring provides better option)&nbsp;</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5></h5><h5></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>Additional Services:</b></span></h5><ul><li style=\"line-height: 2;\"><font color=\"#424242\">Customization options available for specific business goals (Customize order for specific business goal)</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Ad performance analytics and reporting.</font></li></ul><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>Final Delivery Includes:</b></span></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Detailed insights into campaign performance to drive better results for your ad campaign&nbsp;</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Recommendations for future improvements. I will provide recommendation to run better ads in the future</font></li></ul><p></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"color: rgb(0, 0, 0); font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><br></span></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><font color=\"#000000\"><span style=\"font-size: 14px;\">💬 Chat with us and let\'s boost your Shopify presence through strategic Facebook campaigns.</span></font></p><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1699186857-654788a9a99f5.png', 'Basic', 'Standard', 'Premium', '3', '7', '9', 'Less than a month', 'Less than a month', 'Less than a month', 100, NULL, 200, NULL, 300, NULL, 1, 1, 1, 'yes', '2024-10-06 15:31:28', 1, NULL, NULL, NULL, 0, 0, '2023-05-16 05:08:19', '2024-05-09 15:31:49'),
(108, 7, 2, 'I will build responsive WordPress website design and ecommerce website', 'i-will-build-responsive-wordpress-website-design-and-ecommerce-website', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>✨ Available for Custom Orders</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">With over 10 years of experience in the design industry, we specialize in crafting responsive WordPress websites and dynamic eCommerce platforms. Our expertise spans various sectors, including AI, Web 3.0, ICOs, IDOs, Crypto, NFT, IT, Blockchain, E-commerce, Airports, Retail, Universities, Automobile, and more.</span><br></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5><span style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><br></b></span></span></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>🌟 Completed 500+ projects</b></span></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b><br></b></span></h5><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">🌐 Top Clients:\r\n</b><br></h5><div><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">\r\n</b></div><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><span style=\"color: rgb(66, 66, 66); text-align: var(--bs-body-text-align); display: inline !important;\"><b>Multiple Governments</b></span><span style=\"color: rgb(66, 66, 66); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"> - We built many WordPress websites for governments around the world&nbsp;&nbsp;</span><br></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>Intelio</b> - My one of the finest client is Intel we built an internal website for their recruitment process</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>Goolio</b> - Goolio is the world largest hosting provider and I built their website</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>Giantsoft</b> - Giant soft build SaaS software for their clients and I helped them with WordPress&nbsp;</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\"><b>Shahincedes</b> - A car brand which needed a website for their B2B agents and I built them.</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5></h5><h5></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>What\'s Included in This Gig:</b></span></h5><ul><li style=\"line-height: 2;\"><font color=\"#424242\">Crafted for responsiveness on all devices (After completing project we do extensive tests)</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Build a dynamic eCommerce platform tailored to your business needs (Every business is unique, So we\'re)</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Customization options available for a unique web presence</font></li></ul><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">What\'s Not Included:</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Content Creation (Image and text)</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Additional features beyond website design (You have to pay extra for e.g., custom functionalities, plugins)</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">💬 Please message me before ordering</b></h5><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\r\n</blockquote></div></div>', '1699164445-6547311def884.png', 'Basic', 'Standard', 'Premium', '1', '2', '3', 'Less than a week', 'Less than a week', 'Less than a week', 100, NULL, 150, NULL, 200, 0, 1, 1, 1, 'yes', '2024-10-06 15:30:58', 1, NULL, NULL, NULL, 0, 0, '2023-10-02 06:58:03', '2024-05-09 15:31:16'),
(110, 7, 4, 'Qixer service provider buyer mobile appp', 'qixer-service-provider-buyer-mobile-appp', '<header style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><h6 style=\"color: rgb(98, 100, 106);\"></h6><h6 style=\"color: rgb(98, 100, 106);\"></h6><h2 class=\"section-title\" style=\"color: rgb(64, 65, 69); border: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 25px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" font-size:=\"\" 20px;=\"\" line-height:=\"\" 28px;\"=\"\"></h2><h6 style=\"line-height: 2;\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"><b>About this project</b></span></h6><h3 style=\"color: rgb(98, 100, 106);\"></h3><h5 style=\"color: rgb(98, 100, 106); line-height: 1.2;\"><span style=\"font-size: 14px; font-family: sans-serif; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">Are you considering how to create a successful Facebook Ads Campaign that can increase the number of leads or sales for your business, resulting in the achievement of your business goals?</span><br></h5></header><div class=\"description-wrapper\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px 0px 20px; position: relative;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><div class=\"description-content\" data-impression-collected=\"true\" style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px; overflow-wrap: break-word; max-height: none; overflow: hidden; word-break: break-word;\"><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5><span style=\"border: 0px; margin: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><br></b></span></span></h5><h5 style=\"line-height: 2;\"><b style=\"color: var(--heading-color); font-family: var(--heading-font); font-size: 16px; text-align: var(--bs-body-text-align);\"><span style=\"font-size: 18px;\">This gig is perfect for you</span></b><br></h5><p></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px; line-height: 1.4;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">With my expertise, I\'ll define effective marketing goals for your business. I\'ll craft an innovative plan and strategy, utilizing advanced advertising methods for success.</span><br></p><p></p><p style=\"\"></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">My services</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Setup &amp; Manage Creative Facebook and Instagram Ads Campaign</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Target Audience Research &amp; Competitor Analysis</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Sales Funnel Create</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Eye-Catching Ad Copy Writing</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Tracking fb pixel and Event Set up</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Create Custom &amp; Lookalike Audience</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Facebook Conversion API</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">iOS 14.5+ Update, Domain Verify</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Daily Ads Reporting &amp; Technical Support</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5></h5><h5></h5><h5 style=\"line-height: 2;\"><span style=\"font-size: 18px;\"><b>Campaign I can setup</b></span></h5><ul><li style=\"line-height: 2;\"><font color=\"#424242\">Facebook Ad Campaign</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Instagram Ad Campaign</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">LinkedIn&nbsp;Ad Campaign</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">Twitter Ad Campaign&nbsp;</font></li><li style=\"line-height: 2;\"><font color=\"#424242\">YouTube&nbsp;Ad Campaign</font></li></ul><h5 style=\"line-height: 2;\"><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">My specialty</b><br></h5><ul style=\"border: 0px; margin-right: 5px; margin-bottom: 0px; margin-left: 5px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: none none;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Apply Update Methods</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">Maintain Quality Work</font></li><li style=\"border: 0px; margin: 0px 0px 0px 24px; outline-style: initial; outline-width: 0px; padding: 0px; list-style: outside none disc;\"><font color=\"#424242\">On-Time Delivery</font></li></ul><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><br></p><p style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"></p><h5 style=\"\"></h5><h5><b style=\"font-size: 18px; color: var(--heading-color); font-family: var(--heading-font); text-align: var(--bs-body-text-align);\">Please message me before ordering</b><br></h5><p></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"color: rgb(0, 0, 0); font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\"><br></span></p><p style=\"color: rgb(98, 100, 106); border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;\"=\"\"><span style=\"color: rgb(0, 0, 0); font-size: 14px; font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); display: inline !important;\">Tag: Facebook Ads Campaign Instagram Ads Shopify Facebook Ads Social Media Ads.</span><br></p><blockquote style=\"border: 0px; margin-right: 0px; margin-left: 0px; outline-style: initial; outline-width: 0px; padding: 0px;\">\n</blockquote></div></div>', '1700027551-65545c9f71231.png', 'Basic', 'Standard', 'Premium', '1', '1', '1', '1 Days', '1 Days', '1 Days', 50, 40, 60, 50, 70, 60, 1, 1, 1, 'yes', '2024-10-06 15:30:25', 1, NULL, NULL, NULL, 0, 0, '2023-11-14 23:52:31', '2024-05-09 15:36:10'),
(114, 7, 1, 'Ще получите минимум 20 символа', 'you-can-gen-20a', '<p>asdasdasdadssasdasdasdasdasdadssasdasdasdasdasdadssasdasdasdasdasdadssasdasdasdasdasdadssasdasdasdasdasdadssasdasdasdasdasdadssasdasdasdasdasdadssasdaasdsd<br></p>', '1706367303-65b51947c480b.png', 'Basic', 'Standard', 'Premium', '1', '1', '3', '1 Days', '1 Days', '1 Days', 50, 40, 60, 50, 70, 60, 1, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 0, 0, '2024-01-27 08:55:03', '2024-01-27 09:00:34'),
(120, 7, 1, 'came to mind and morty season and morty', 'slugyou-can-gen-20a', 'umuku\nujuju\n\n\nyhuntb6\nyjyhyhybtj\nyjujunu\n\n\n\n\ntg6gyhvtbyjtbmttn', '1717307008-665c06802f55e.jpg', 'Basic', NULL, NULL, '4', '4', '4', '1 Days', '1 Days', '1 Days', 10, 9, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, '2024-06-02 09:43:28', '2024-06-02 09:43:28'),
(124, 7, 1, 'criação de de app mobile', 'slugslugslugyou-can-gen-20a', 'Bem-vindo ao Xilacner, sua solução abrangente para construir um mercado freelancer dinâmico e eficiente. Criado com a poderosa estrutura Laravel, o Xilacner foi projetado para atender tanto freelancers quanto clientes', '1718885279-66741b9fbb62f.jpg', 'Basic', 'Standard', 'premium', '4', '4', '4', '1 Days', '1 Days', '1 Days', 10, 9, 10, 9, 10, 9, 1, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 0, 0, '2024-06-20 16:07:59', '2024-06-20 16:07:59'),
(140, 7, 1, 'gggghjjjjjhhhhgxxxxxxxd£dfff', 'slugslugslugslugslugyou-can-gen-20a', 'hhjjjjjfkdndndndndndnndndndndndndndndnd\\\"dndndnndndndndndndndndnndndndndndndndnfnnfnfnfnfbfbbfbbdbdjdjdjdjejejrjfktkktktktktkktktntkktktktfbfhhhhhhujj', '1721334007-669978f704b0a.png', 'Basic', NULL, NULL, '4', '4', '4', '1 Days', '1 Days', '1 Days', 10, 9, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, '2024-07-19 00:20:07', '2024-07-19 00:20:07'),
(143, 7, 1, 'i will create a great AI potrait of you', 'slugslugslugslugslugslugyou-can-gen-20a', '<p>Looking for Art creation, i will do that for you at amazing speeds anywhere in the world</p><p>Just contact me and wi will be your giest all the time</p>', '1721792438-66a077b690cd8.jpg', 'Basic', NULL, NULL, '4', '4', '4', '1 Days', '1 Days', '1 Days', 10, 9, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, '2024-07-24 07:40:38', '2024-07-24 07:40:38'),
(144, 7, 2, 'https://bostake.co.in', 'slugslugslugslugslugslugslugyou-can-gen-20a', '<div><br></div><div>Mobile app development will be finished using flutter, This means I will do both android app &amp; ios app development and admin panel will be finished using laravel&nbsp;</div><div><br></div><div><br></div><div><br></div><div>I will be responsible for creating everything for your online shop:</div><div><br></div><div>ui/ux designing</div><div>App Development and testing</div><div>App publish to the stores. (ios publish &amp; android publish</div>', '1722009477-66a3c7855990d.png', 'Basic', NULL, NULL, '4', '4', '4', '1 Days', '1 Days', '1 Days', 10, 9, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, '2024-07-26 19:57:57', '2024-07-29 06:52:34'),
(148, 7, 1, 'والله مش عارف والله، لاه', 'slugslugslugslugslugslugslugslugyou-can-gen-20a', 'ةة وو.، باعهت.&nbsp; &nbsp;وانت من اهل الخير يا قلبي انتي والله العظيم اني احبك في الله ثم عليك يا قلبي انتي والله العظيم&nbsp;', '1724310669-66c6e48d35a57.jpg', 'Basic', NULL, NULL, '4', '4', '4', '2 Days', '1 Days', '1 Days', 10, 9, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, '2024-08-22 11:11:09', '2024-08-22 11:11:09');

-- --------------------------------------------------------

--
-- Table structure for table `project_attributes`
--

CREATE TABLE `project_attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `create_project_id` bigint NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_numeric_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_check_numeric` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `standard_check_numeric` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `premium_check_numeric` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_attributes`
--

INSERT INTO `project_attributes` (`id`, `user_id`, `create_project_id`, `type`, `check_numeric_title`, `basic_check_numeric`, `standard_check_numeric`, `premium_check_numeric`, `created_at`, `updated_at`) VALUES
(440, 9, 1, 'numeric', 'sdfsd sdf sd', '5', '5', '5', '2023-05-16 04:53:42', '2023-05-16 04:53:42'),
(441, 9, 1, 'numeric', 'ZZz', '0', '0', '0', '2023-05-16 04:54:36', '2023-05-16 04:54:36'),
(822, 7, 110, 'checkbox', 'Extended support', 'on', 'on', 'on', '2023-11-14 23:52:31', '2023-11-14 23:52:31'),
(1443, 7, 103, 'numeric', 'No of Pages', '1', '2', '3', NULL, '2023-11-24 23:49:09'),
(1444, 7, 103, 'numeric', 'Words', '500', '1000', '2000', NULL, '2023-11-24 23:49:09'),
(1445, 7, 103, 'checkbox', 'SEO friendly', 'on', 'on', 'on', NULL, '2023-11-24 23:49:09'),
(1462, 7, 102, 'numeric', 'Words', '500', '1500', '3000', NULL, '2023-11-25 00:05:32'),
(1463, 7, 102, 'checkbox', 'SEO keywords', 'on', 'on', 'on', NULL, '2023-11-25 00:05:32'),
(1464, 7, 102, 'checkbox', 'SEO Keyword Research', 'on', 'on', 'on', NULL, '2023-11-25 00:05:32'),
(1465, 7, 102, 'checkbox', 'Competitor research', 'on', 'on', 'on', NULL, '2023-11-25 00:05:32'),
(1514, 7, 73, 'checkbox', 'Functional app', 'on', 'on', 'on', NULL, '2023-11-25 00:33:05'),
(1515, 7, 73, 'checkbox', '1 operating system', 'on', 'on', 'on', NULL, '2023-11-25 00:33:05'),
(1516, 7, 73, 'checkbox', 'App submission', 'on', 'on', 'on', NULL, '2023-11-25 00:33:05'),
(1517, 7, 73, 'checkbox', 'App icon', 'on', 'on', 'on', NULL, '2023-11-25 00:33:05'),
(1518, 7, 73, 'checkbox', 'Splash screen', 'on', 'on', 'on', NULL, '2023-11-25 00:33:05'),
(1519, 7, 73, 'checkbox', 'Ad network integration', 'off', 'off', 'on', NULL, '2023-11-25 00:33:05'),
(1520, 7, 73, 'checkbox', 'Source code', 'off', 'on', 'on', NULL, '2023-11-25 00:33:05'),
(1521, 7, 73, 'numeric', 'sdfsdf', '5', '5', '5', NULL, '2023-11-25 00:33:05'),
(1550, 7, 99, 'numeric', 'No of Pages', '5', '10', '15', NULL, '2023-11-25 00:51:46'),
(1551, 7, 99, 'checkbox', 'Source', 'on', 'on', 'on', NULL, '2023-11-25 00:51:46'),
(1552, 7, 99, 'checkbox', 'Functional Android app', 'on', 'on', 'on', NULL, '2023-11-25 00:51:46'),
(1553, 7, 99, 'checkbox', 'Functional IOS App', 'on', 'on', 'on', NULL, '2023-11-25 00:51:46'),
(1554, 7, 99, 'checkbox', 'App submission', 'off', 'on', 'on', NULL, '2023-11-25 00:51:46'),
(1555, 7, 99, 'checkbox', 'Ad network integration', 'off', 'off', 'on', NULL, '2023-11-25 00:51:46'),
(1570, 7, 84, 'checkbox', 'Functional app', 'on', 'on', 'on', NULL, '2023-11-25 00:57:35'),
(1571, 7, 84, 'checkbox', '2 operating systems', 'on', 'on', 'on', NULL, '2023-11-25 00:57:35'),
(1572, 7, 84, 'checkbox', 'App submission', 'off', 'off', 'on', NULL, '2023-11-25 00:57:35'),
(1573, 7, 84, 'checkbox', 'App icon', 'on', 'on', 'on', NULL, '2023-11-25 00:57:35'),
(1574, 7, 84, 'checkbox', 'Splash screen', 'off', 'off', 'on', NULL, '2023-11-25 00:57:35'),
(1575, 7, 84, 'checkbox', 'Ad network integration', 'off', 'on', 'on', NULL, '2023-11-25 00:57:35'),
(1576, 7, 84, 'checkbox', 'Source code', 'on', 'on', 'on', NULL, '2023-11-25 00:57:35'),
(1577, 7, 68, 'checkbox', 'Main File includedd', 'on', 'on', 'on', NULL, '2023-11-25 00:58:26'),
(1578, 7, 68, 'numeric', 'No of Pagess', '5', '6', '8', NULL, '2023-11-25 00:58:26'),
(1579, 7, 68, 'checkbox', 'Resources', 'on', 'on', 'on', NULL, '2023-11-25 00:58:26'),
(1580, 7, 68, 'checkbox', 'Source code', 'on', 'on', 'on', NULL, '2023-11-25 00:58:26'),
(1581, 7, 68, 'checkbox', 'Seo friendly', 'on', 'on', 'on', NULL, '2023-11-25 00:58:26'),
(1582, 7, 68, 'checkbox', 'Speed optimize', 'off', 'on', 'on', NULL, '2023-11-25 00:58:26'),
(1583, 7, 68, 'checkbox', 'Content upload', 'off', 'off', 'on', NULL, '2023-11-25 00:58:26'),
(1632, 8, 97, 'numeric', 'No of words', '500', '1000', '1500', NULL, '2023-11-25 01:43:11'),
(1633, 8, 97, 'checkbox', 'Topic research', 'on', 'on', 'on', NULL, '2023-11-25 01:43:11'),
(1634, 8, 97, 'checkbox', 'SEO keywords', 'on', 'on', 'on', NULL, '2023-11-25 01:43:11'),
(1635, 8, 97, 'checkbox', 'SEO Keyword', 'on', 'on', 'on', NULL, '2023-11-25 01:43:11'),
(1636, 8, 97, 'checkbox', 'Research References & citations', 'on', 'on', 'on', NULL, '2023-11-25 01:43:11'),
(1667, 8, 96, 'checkbox', '3D modeling', 'on', 'on', 'on', NULL, '2023-11-25 02:06:03'),
(1668, 8, 96, 'checkbox', 'Include environment', 'on', 'on', 'on', NULL, '2023-11-25 02:06:03'),
(1669, 8, 96, 'checkbox', 'Include furniture and people', 'on', 'on', 'on', NULL, '2023-11-25 02:06:03'),
(1670, 8, 96, 'checkbox', 'Texturing & lighting', 'on', 'on', 'on', NULL, '2023-11-25 02:06:03'),
(1671, 8, 96, 'numeric', 'Rendering', '1', '2', '3', NULL, '2023-11-25 02:06:03'),
(1672, 8, 96, 'checkbox', 'Architectural walkthrough', 'off', 'off', 'on', NULL, '2023-11-25 02:06:03'),
(1673, 8, 95, 'checkbox', 'Competitor analyze', 'on', 'on', 'on', NULL, '2023-11-25 02:08:58'),
(1674, 8, 95, 'checkbox', 'Action plan', 'on', 'on', 'on', NULL, '2023-11-25 02:08:58'),
(1675, 8, 95, 'checkbox', 'Goals and KPIS', 'off', 'on', 'on', NULL, '2023-11-25 02:08:58'),
(1676, 8, 95, 'checkbox', 'Convert HTML CSS', 'on', 'on', 'on', NULL, '2023-11-25 02:08:58'),
(1677, 8, 95, 'checkbox', 'Source code', 'on', 'on', 'on', NULL, '2023-11-25 02:08:58'),
(1693, 8, 93, 'numeric', 'Pages', '5', '10', '15', NULL, '2023-11-25 02:17:44'),
(1694, 8, 93, 'checkbox', 'Responsive design', 'on', 'on', 'on', NULL, '2023-11-25 02:17:44'),
(1695, 8, 93, 'checkbox', 'Slider/scroller', 'on', 'on', 'on', NULL, '2023-11-25 02:17:44'),
(1696, 8, 93, 'checkbox', 'Server upload', 'off', 'on', 'on', NULL, '2023-11-25 02:17:44'),
(1697, 8, 93, 'checkbox', 'Browser compatibility', 'on', 'on', 'on', NULL, '2023-11-25 02:17:44'),
(1701, 7, 104, 'checkbox', 'High quality thumbnail', 'on', 'on', 'on', NULL, '2023-11-25 03:48:34'),
(1702, 7, 104, 'checkbox', 'Color ratio', 'off', 'off', 'off', NULL, '2023-11-25 03:48:34'),
(1703, 7, 104, 'checkbox', 'Eye catching', 'on', 'on', 'on', NULL, '2023-11-25 03:48:34'),
(1704, 7, 100, 'numeric', 'No of Pages', '1', '2', '3', NULL, '2023-11-25 03:49:13'),
(1705, 7, 100, 'numeric', 'Words', '500', '700', '1000', NULL, '2023-11-25 03:49:13'),
(1706, 7, 100, 'checkbox', 'SEO keywords', 'on', 'on', 'on', NULL, '2023-11-25 03:49:13'),
(1707, 7, 100, 'checkbox', 'Competitor research', 'on', 'on', 'on', NULL, '2023-11-25 03:49:13'),
(1736, 7, 70, 'checkbox', 'Source code', 'on', 'on', 'on', NULL, '2023-11-25 23:17:52'),
(1737, 7, 70, 'checkbox', 'Resources', 'on', 'on', 'on', NULL, '2023-11-25 23:17:52'),
(1738, 7, 70, 'checkbox', 'Responsive design', 'on', 'on', 'on', NULL, '2023-11-25 23:17:52'),
(1739, 7, 70, 'checkbox', 'Content upload', 'off', 'on', 'on', NULL, '2023-11-25 23:17:52'),
(1740, 7, 70, 'checkbox', 'Payment processing', 'off', 'off', 'off', NULL, '2023-11-25 23:17:52'),
(1741, 7, 70, 'checkbox', 'Speed optimization', 'on', 'on', 'on', NULL, '2023-11-25 23:17:52'),
(1742, 7, 70, 'checkbox', 'Hosting setup', 'off', 'off', 'on', NULL, '2023-11-25 23:17:52'),
(1748, 7, 69, 'checkbox', 'Main File includedd', 'on', 'on', 'on', NULL, '2023-11-27 06:55:37'),
(1749, 7, 69, 'checkbox', 'No of Pagess', '3', '10', '15', NULL, '2023-11-27 06:55:37'),
(1750, 7, 69, 'checkbox', 'Functional website', 'on', 'on', 'on', NULL, '2023-11-27 06:55:37'),
(1751, 7, 69, 'checkbox', 'Content upload', 'on', 'on', 'on', NULL, '2023-11-27 06:55:37'),
(1752, 7, 69, 'checkbox', 'SMS gateway support', 'off', 'on', 'on', NULL, '2023-11-27 06:55:37'),
(1753, 7, 69, 'checkbox', 'Hosting setup', 'off', 'off', 'on', NULL, '2023-11-27 06:55:37'),
(1757, 7, 105, 'numeric', 'No of Pages', '1', '2', '3', NULL, '2023-11-27 07:26:54'),
(1758, 7, 105, 'checkbox', 'Responsive Design', 'on', 'on', 'on', NULL, '2023-11-27 07:26:54'),
(1759, 7, 105, 'checkbox', 'Source Code', 'on', 'on', 'on', NULL, '2023-11-27 07:26:54'),
(1770, 7, 108, 'checkbox', 'Functional website', 'on', 'on', 'on', NULL, '2023-11-28 06:46:11'),
(1771, 7, 108, 'numeric', 'Pages', '5', '7', '10', NULL, '2023-11-28 06:46:11'),
(1772, 7, 108, 'checkbox', 'Responsive design', 'on', 'on', 'on', NULL, '2023-11-28 06:46:11'),
(1773, 7, 108, 'checkbox', 'Content upload', 'off', 'on', 'on', NULL, '2023-11-28 06:46:11'),
(1774, 7, 108, 'numeric', 'Plugin', '3', '5', '10', NULL, '2023-11-28 06:46:11'),
(1775, 7, 108, 'checkbox', 'E-commerce functionality', 'on', 'on', 'on', NULL, '2023-11-28 06:46:11'),
(1776, 7, 108, 'checkbox', 'Payment processing', 'on', 'on', 'on', NULL, '2023-11-28 06:46:11'),
(1777, 7, 108, 'checkbox', 'Opt-in form', 'off', 'off', 'on', NULL, '2023-11-28 06:46:11'),
(1785, 7, 92, 'checkbox', 'Functional website', 'on', 'on', 'on', NULL, '2023-11-28 06:47:39'),
(1786, 7, 92, 'numeric', 'Pages', '3', '5', '10', NULL, '2023-11-28 06:47:39'),
(1787, 7, 92, 'numeric', 'Revisions', '2', '5', '10', NULL, '2023-11-28 06:47:39'),
(1788, 7, 92, 'checkbox', 'Content upload', 'off', 'on', 'on', NULL, '2023-11-28 06:47:39'),
(1789, 7, 92, 'checkbox', 'Speed optimization', 'on', 'on', 'on', NULL, '2023-11-28 06:47:39'),
(1790, 7, 92, 'checkbox', 'Hosting setup', 'off', 'off', 'on', NULL, '2023-11-28 06:47:39'),
(1791, 7, 92, 'checkbox', 'Social media icons', 'off', 'on', 'on', NULL, '2023-11-28 06:47:39'),
(1794, 7, 107, 'checkbox', 'Action plan', 'off', 'off', 'off', NULL, '2023-12-04 00:24:00'),
(1795, 7, 107, 'checkbox', 'Campaign audit', 'on', 'on', 'on', NULL, '2023-12-04 00:24:00'),
(1796, 7, 107, 'checkbox', 'Target audience research', 'on', 'on', 'on', NULL, '2023-12-04 00:24:00'),
(1797, 7, 107, 'checkbox', 'Ad content creation', 'off', 'on', 'on', NULL, '2023-12-04 00:24:00'),
(1798, 7, 107, 'checkbox', 'Campaign setup', 'off', 'off', 'off', NULL, '2023-12-04 00:24:00'),
(1799, 8, 94, 'numeric', 'Lesson', '1', '2', '3', NULL, '2024-01-27 06:54:22'),
(1800, 8, 94, 'numeric', 'Minutes', '30', '60', '120', NULL, '2024-01-27 06:54:22'),
(1801, 8, 94, 'checkbox', 'Live support', 'on', 'on', 'on', NULL, '2024-01-27 06:54:22'),
(1802, 8, 94, 'checkbox', 'Backup class', 'off', 'on', 'on', NULL, '2024-01-27 06:54:22'),
(1803, 8, 94, 'checkbox', 'Browser compatibility', 'on', 'on', 'on', NULL, '2024-01-27 06:54:22'),
(1804, 8, 98, 'numeric', 'Pages', '3', '5', '9', NULL, '2024-01-27 06:56:53'),
(1805, 8, 98, 'checkbox', 'Functional website', 'on', 'on', 'on', NULL, '2024-01-27 06:56:53'),
(1806, 8, 98, 'checkbox', 'Source Code', 'on', 'on', 'on', NULL, '2024-01-27 06:56:53'),
(1807, 8, 98, 'checkbox', 'Server Upload', 'off', 'on', 'on', NULL, '2024-01-27 06:56:53'),
(1808, 8, 98, 'checkbox', 'Speed optimize', 'on', 'on', 'on', NULL, '2024-01-27 06:56:53'),
(1809, 8, 98, 'checkbox', 'Server Setup', 'off', 'off', 'on', NULL, '2024-01-27 06:56:53'),
(1810, 7, 101, 'numeric', 'Words', '500', '1000', '1500', NULL, '2024-01-27 07:01:35'),
(1811, 7, 101, 'checkbox', 'SEO keywords', 'on', 'on', 'on', NULL, '2024-01-27 07:01:35'),
(1812, 7, 101, 'checkbox', 'SEO Keyword Research', 'on', 'on', 'on', NULL, '2024-01-27 07:01:35'),
(1813, 7, 101, 'checkbox', 'Competitor research', 'on', 'on', 'on', NULL, '2024-01-27 07:01:35'),
(1814, 7, 114, 'checkbox', 'asd', 'on', 'on', 'on', '2024-01-27 08:55:03', '2024-01-27 08:55:03'),
(1815, 7, 120, 'checkbox', 'Title 0', 'on', 'on', 'on', '2024-06-02 09:43:28', '2024-06-02 09:43:28'),
(1821, 7, 124, 'checkbox', 'Title 0', 'on', 'on', 'on', '2024-06-20 16:07:59', '2024-06-20 16:07:59'),
(1830, 7, 140, 'checkbox', 'Title 0', 'on', 'on', 'on', '2024-07-19 00:20:07', '2024-07-19 00:20:07'),
(1831, 7, 143, 'numeric', '5 pictures', '0', '0', '0', '2024-07-24 07:40:38', '2024-07-24 07:40:38'),
(1832, 7, 144, 'checkbox', 'Title 0', 'on', 'on', 'on', '2024-07-26 19:57:57', '2024-07-26 19:57:57'),
(1834, 7, 148, 'numeric', 'تتنوو', '0', '0', '0', '2024-08-22 11:11:09', '2024-08-22 11:11:09');

-- --------------------------------------------------------

--
-- Table structure for table `project_histories`
--

CREATE TABLE `project_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `project_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `reject_count` bigint DEFAULT NULL,
  `edit_count` bigint DEFAULT NULL,
  `reject_reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_histories`
--

INSERT INTO `project_histories` (`id`, `project_id`, `user_id`, `reject_count`, `edit_count`, `reject_reason`, `created_at`, `updated_at`) VALUES
(1, 68, 7, 1, 0, NULL, '2023-03-28 03:36:25', '2023-11-25 00:58:26'),
(3, 84, 7, 2, 1, NULL, '2023-04-04 01:31:11', '2023-11-25 00:57:35'),
(4, 69, 7, 2, 1, NULL, '2023-04-15 00:03:21', '2023-11-27 06:55:37'),
(6, 73, 7, 2, 1, NULL, '2023-05-14 00:53:56', '2023-11-25 00:33:05'),
(7, 70, 7, 2, 1, NULL, '2023-05-14 03:56:36', '2023-11-25 23:17:52'),
(8, 92, 7, 2, 1, NULL, '2023-05-15 22:42:28', '2023-11-28 06:47:39'),
(9, 93, 8, 2, 1, NULL, '2023-05-16 00:01:17', '2023-11-25 02:17:44'),
(10, 94, 8, 2, 1, NULL, '2023-05-16 00:56:48', '2024-01-27 06:54:22'),
(11, 97, 8, 2, 1, NULL, '2023-05-16 02:28:36', '2023-11-25 01:43:11'),
(12, 99, 9, 2, 1, NULL, '2023-05-16 04:00:55', '2023-11-25 00:51:46'),
(13, 100, 9, 2, 1, NULL, '2023-05-16 04:21:48', '2023-11-25 03:49:13'),
(14, 101, 9, 2, 1, NULL, '2023-05-16 05:44:19', '2024-01-27 07:01:35'),
(15, 102, 9, 2, 1, NULL, '2023-05-16 05:58:35', '2023-11-25 00:05:32'),
(16, 103, 9, 2, 1, NULL, '2023-05-16 06:29:54', '2023-11-24 23:49:09'),
(17, 104, 9, 2, 1, NULL, '2023-05-16 06:39:17', '2023-11-25 03:48:34'),
(18, 107, 10, 2, 1, NULL, '2023-05-16 07:00:23', '2023-12-04 00:24:00'),
(19, 105, 10, 2, 1, NULL, '2023-05-16 07:02:32', '2023-11-27 07:26:54'),
(20, 98, 8, 2, 1, NULL, '2023-08-19 03:43:03', '2024-01-27 06:56:53'),
(21, 96, 8, 2, 1, NULL, '2023-08-19 03:43:40', '2023-11-25 02:06:03'),
(22, 95, 8, 2, 1, NULL, '2023-08-19 03:43:53', '2023-11-25 02:08:58'),
(23, 108, 7, 2, 1, NULL, '2023-11-05 00:07:26', '2023-11-28 06:46:11');

-- --------------------------------------------------------

--
-- Table structure for table `project_promote_settings`
--

CREATE TABLE `project_promote_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget` double NOT NULL,
  `duration` int NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_promote_settings`
--

INSERT INTO `project_promote_settings` (`id`, `title`, `image`, `budget`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(1, '10 Days', NULL, 10, 10, 1, '2024-05-09 15:15:21', '2024-05-09 15:15:21'),
(2, '30 Days', NULL, 30, 30, 1, '2024-05-09 15:17:29', '2024-05-09 15:18:26'),
(3, '150 Days', NULL, 300, 150, 1, '2024-05-09 15:18:44', '2024-05-09 15:18:44');

-- --------------------------------------------------------

--
-- Table structure for table `project_sub_categories`
--

CREATE TABLE `project_sub_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `project_id` bigint NOT NULL,
  `sub_category_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_sub_categories`
--

INSERT INTO `project_sub_categories` (`id`, `project_id`, `sub_category_id`, `created_at`, `updated_at`) VALUES
(11, 84, 5, '2023-04-04 01:32:37', '2023-04-04 01:32:37'),
(12, 84, 6, '2023-04-04 01:32:37', '2023-04-04 01:32:37'),
(23, 73, 6, '2023-05-14 03:47:27', '2023-05-14 03:47:27'),
(24, 70, 22, '2023-05-14 03:56:36', '2023-05-14 03:56:36'),
(34, 92, 20, '2023-05-15 07:25:04', '2023-05-15 07:25:04'),
(35, 92, 22, '2023-05-15 22:48:28', '2023-05-15 22:48:28'),
(36, 93, 24, '2023-05-15 23:58:55', '2023-05-15 23:58:55'),
(40, 96, 2, '2023-05-16 01:29:02', '2023-05-16 01:29:02'),
(63, 108, 3, '2023-11-05 00:18:30', '2023-11-05 00:18:30'),
(64, 108, 21, '2023-11-05 00:18:30', '2023-11-05 00:18:30'),
(65, 108, 22, '2023-11-05 00:18:30', '2023-11-05 00:18:30'),
(66, 92, 21, '2023-11-05 01:14:27', '2023-11-05 01:14:27'),
(67, 84, 7, '2023-11-05 02:26:29', '2023-11-05 02:26:29'),
(68, 84, 8, '2023-11-05 02:26:29', '2023-11-05 02:26:29'),
(69, 73, 5, '2023-11-05 02:32:31', '2023-11-05 02:32:31'),
(70, 73, 7, '2023-11-05 02:32:31', '2023-11-05 02:32:31'),
(71, 73, 8, '2023-11-05 02:32:31', '2023-11-05 02:32:31'),
(72, 70, 20, '2023-11-05 02:38:28', '2023-11-05 02:38:28'),
(73, 70, 21, '2023-11-05 02:38:28', '2023-11-05 02:38:28'),
(75, 69, 20, '2023-11-05 02:46:17', '2023-11-05 02:46:17'),
(76, 69, 21, '2023-11-05 02:46:17', '2023-11-05 02:46:17'),
(77, 69, 22, '2023-11-05 02:46:17', '2023-11-05 02:46:17'),
(79, 68, 1, '2023-11-05 03:03:28', '2023-11-05 03:03:28'),
(80, 68, 2, '2023-11-05 03:03:28', '2023-11-05 03:03:28'),
(81, 68, 24, '2023-11-05 03:10:07', '2023-11-05 03:10:07'),
(85, 96, 1, '2023-11-05 05:28:37', '2023-11-05 05:28:37'),
(86, 95, 30, '2023-11-05 05:46:34', '2023-11-05 05:46:34'),
(87, 95, 29, '2023-11-05 05:46:54', '2023-11-05 05:46:54'),
(88, 94, 29, '2023-11-05 05:52:18', '2023-11-05 05:52:18'),
(89, 94, 30, '2023-11-05 05:52:18', '2023-11-05 05:52:18'),
(90, 93, 1, '2023-11-05 05:55:34', '2023-11-05 05:55:34'),
(91, 107, 29, '2023-11-05 06:20:57', '2023-11-05 06:20:57'),
(92, 107, 30, '2023-11-05 06:20:57', '2023-11-05 06:20:57'),
(93, 107, 34, '2023-11-05 06:27:13', '2023-11-05 06:27:13'),
(94, 105, 1, '2023-11-05 06:32:26', '2023-11-05 06:32:26'),
(95, 105, 24, '2023-11-05 06:32:26', '2023-11-05 06:32:26'),
(96, 104, 1, '2023-11-05 06:37:34', '2023-11-05 06:37:34'),
(97, 104, 2, '2023-11-05 06:37:34', '2023-11-05 06:37:34'),
(98, 103, 26, '2023-11-05 06:47:36', '2023-11-05 06:47:36'),
(99, 103, 31, '2023-11-05 06:47:36', '2023-11-05 06:47:36'),
(100, 103, 32, '2023-11-05 06:47:36', '2023-11-05 06:47:36'),
(101, 102, 26, '2023-11-05 07:04:10', '2023-11-05 07:04:10'),
(102, 102, 31, '2023-11-05 07:04:10', '2023-11-05 07:04:10'),
(103, 101, 31, '2023-11-05 07:20:58', '2023-11-05 07:20:58'),
(104, 101, 32, '2023-11-05 07:20:58', '2023-11-05 07:20:58'),
(105, 100, 26, '2023-11-05 07:33:28', '2023-11-05 07:33:28'),
(106, 100, 31, '2023-11-05 07:33:28', '2023-11-05 07:33:28'),
(107, 100, 32, '2023-11-05 07:33:28', '2023-11-05 07:33:28'),
(108, 99, 5, '2023-11-05 07:42:58', '2023-11-05 07:42:58'),
(109, 99, 6, '2023-11-05 07:42:58', '2023-11-05 07:42:58'),
(110, 99, 7, '2023-11-05 07:42:58', '2023-11-05 07:42:58'),
(111, 109, 5, '2023-11-14 23:49:51', '2023-11-14 23:49:51'),
(112, 110, 5, '2023-11-14 23:52:31', '2023-11-14 23:52:31'),
(113, 70, 3, '2023-11-22 23:28:47', '2023-11-22 23:28:47'),
(114, 98, 5, '2023-11-25 01:27:04', '2023-11-25 01:27:04'),
(115, 98, 6, '2023-11-25 01:27:04', '2023-11-25 01:27:04'),
(116, 98, 7, '2023-11-25 01:27:04', '2023-11-25 01:27:04'),
(117, 98, 8, '2023-11-25 01:27:04', '2023-11-25 01:27:04'),
(118, 97, 5, '2023-11-25 01:37:39', '2023-11-25 01:37:39'),
(119, 97, 6, '2023-11-25 01:37:39', '2023-11-25 01:37:39'),
(120, 97, 7, '2023-11-25 01:37:39', '2023-11-25 01:37:39'),
(121, 97, 8, '2023-11-25 01:37:39', '2023-11-25 01:37:39'),
(122, 96, 24, '2023-11-25 01:58:51', '2023-11-25 01:58:51'),
(123, 95, 34, '2023-11-25 02:08:58', '2023-11-25 02:08:58'),
(124, 111, 3, '2023-11-26 07:01:31', '2023-11-26 07:01:31'),
(125, 112, 21, '2023-11-26 08:52:25', '2023-11-26 08:52:25'),
(126, 113, 20, '2023-11-28 08:25:53', '2023-11-28 08:25:53'),
(127, 114, 2, '2024-01-27 08:55:03', '2024-01-27 08:55:03'),
(134, 120, 1, '2024-06-02 09:43:28', '2024-06-02 09:43:28'),
(135, 120, 2, '2024-06-02 09:43:28', '2024-06-02 09:43:28'),
(136, 121, 2, '2024-06-02 09:51:19', '2024-06-02 10:04:08'),
(138, 121, 2, '2024-06-02 10:04:08', '2024-06-02 10:04:08'),
(139, 122, 2, '2024-06-04 09:05:57', '2024-06-04 09:05:57'),
(140, 123, 2, '2024-06-18 19:15:28', '2024-06-18 19:15:28'),
(141, 124, 1, '2024-06-20 16:07:59', '2024-06-20 16:07:59'),
(142, 125, 5, '2024-06-27 13:35:16', '2024-06-27 13:35:16'),
(143, 126, 2, '2024-07-11 01:04:43', '2024-07-11 01:04:43'),
(144, 126, 24, '2024-07-11 01:04:43', '2024-07-11 01:04:43'),
(145, 126, 24, '2024-07-11 01:04:43', '2024-07-11 01:04:43'),
(146, 127, 1, '2024-07-11 02:25:13', '2024-07-11 02:25:13'),
(147, 127, 2, '2024-07-11 02:25:13', '2024-07-11 02:25:13'),
(148, 127, 1, '2024-07-11 02:25:13', '2024-07-11 02:25:13'),
(151, 128, 3, '2024-07-13 08:02:00', '2024-07-13 08:02:00'),
(152, 128, 21, '2024-07-13 08:02:00', '2024-07-13 08:02:00'),
(161, 137, 36, '2024-07-13 09:12:01', '2024-07-13 09:12:01'),
(162, 138, 1, '2024-07-13 09:13:46', '2024-07-13 09:13:46'),
(163, 139, 1, '2024-07-13 09:27:04', '2024-07-13 09:27:04'),
(164, 139, 2, '2024-07-13 09:27:04', '2024-07-13 09:27:04'),
(165, 139, 24, '2024-07-13 09:27:04', '2024-07-13 09:27:04'),
(166, 140, 1, '2024-07-19 00:20:07', '2024-07-19 00:20:07'),
(170, 143, 2, '2024-07-24 07:40:38', '2024-07-24 07:40:38'),
(171, 143, 24, '2024-07-24 07:40:38', '2024-07-24 07:40:38'),
(172, 144, 20, '2024-07-26 19:57:57', '2024-07-26 19:57:57'),
(173, 145, 30, '2024-07-31 06:01:58', '2024-07-31 06:01:58'),
(182, 148, 1, '2024-08-22 11:11:09', '2024-08-22 11:11:09');

-- --------------------------------------------------------

--
-- Table structure for table `promotion_project_lists`
--

CREATE TABLE `promotion_project_lists` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `identity` bigint DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'project,profile,proposal',
  `package_id` int NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `transaction_fee` double DEFAULT NULL,
  `duration` bigint NOT NULL DEFAULT '0',
  `expire_date` timestamp NULL DEFAULT NULL,
  `payment_gateway` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_valid_payment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `email_send` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manual_payment_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `impression` int NOT NULL DEFAULT '0',
  `click` int NOT NULL DEFAULT '0',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotion_project_lists`
--

INSERT INTO `promotion_project_lists` (`id`, `user_id`, `identity`, `type`, `package_id`, `price`, `transaction_fee`, `duration`, `expire_date`, `payment_gateway`, `payment_status`, `is_valid_payment`, `status`, `email_send`, `transaction_id`, `manual_payment_image`, `impression`, `click`, `country`, `created_at`, `updated_at`) VALUES
(1, 7, 7, 'profile', 3, 300, 0, 150, '2024-10-06 15:24:12', 'mollie', 'complete', 'yes', 1, NULL, 'tr_p6JdNUDWvy', NULL, 144, 36, NULL, '2024-05-09 15:24:12', '2024-09-02 23:38:39'),
(2, 7, 110, 'project', 3, 300, 0, 150, '2024-10-06 15:30:25', 'mollie', 'complete', 'yes', 1, NULL, 'tr_BS5qGWHAZi', NULL, 111, 16, NULL, '2024-05-09 15:30:25', '2024-08-27 23:50:23'),
(3, 7, 108, 'project', 3, 300, 0, 150, '2024-10-06 15:30:58', 'mollie', 'complete', 'yes', 1, NULL, 'tr_cQSVxPo3bH', NULL, 147, 21, NULL, '2024-05-09 15:30:58', '2024-09-02 03:52:27'),
(4, 7, 107, 'project', 3, 300, 0, 150, '2024-10-06 15:31:28', 'mollie', 'complete', 'yes', 1, NULL, 'tr_PaL3oTCbs9', NULL, 117, 14, NULL, '2024-05-09 15:31:28', '2024-08-30 04:38:36'),
(5, 7, 105, 'project', 3, 300, 0, 150, '2024-10-06 15:33:56', 'mollie', 'complete', 'yes', 1, NULL, 'tr_9mTCSnRtoE', NULL, 154, 14, NULL, '2024-05-09 15:33:56', '2024-08-31 00:42:27'),
(6, 7, 104, 'project', 3, 300, 0, 150, '2024-10-06 15:34:30', 'mollie', 'complete', 'yes', 1, NULL, 'tr_5AeCPy7Ke4', NULL, 160, 14, NULL, '2024-05-09 15:34:30', '2024-08-31 00:42:30'),
(7, 7, 103, 'project', 3, 300, 0, 150, '2024-10-06 15:35:01', 'mollie', 'complete', 'yes', 1, NULL, 'tr_FKB3mytgKC', NULL, 119, 9, NULL, '2024-05-09 15:35:01', '2024-08-30 08:37:56'),
(8, 7, 102, 'project', 3, 300, 0, 150, '2024-10-06 15:35:31', 'mollie', 'complete', 'yes', 1, NULL, 'tr_9x7eUd5mVC', NULL, 118, 5, NULL, '2024-05-09 15:35:31', '2024-08-27 23:50:23'),
(9, 8, 8, 'profile', 3, 300, 0, 150, '2024-10-06 15:42:54', 'mollie', 'pending', NULL, 0, NULL, NULL, NULL, 141, 17, NULL, '2024-05-09 15:42:54', '2024-09-02 23:38:39'),
(10, 8, 8, 'profile', 3, 300, 0, 150, '2024-10-06 15:44:08', 'mollie', 'complete', 'yes', 1, NULL, 'tr_bMEMvLHr7H', NULL, 0, 0, NULL, '2024-05-09 15:44:08', '2024-05-09 15:44:30'),
(11, 8, 98, 'project', 3, 300, 0, 150, '2024-10-06 15:46:14', 'mollie', 'complete', 'yes', 1, NULL, 'tr_6iwjumoHFB', NULL, 111, 8, NULL, '2024-05-09 15:46:14', '2024-08-27 23:50:23'),
(12, 8, 97, 'project', 3, 300, 0, 150, '2024-10-06 15:47:06', 'mollie', 'complete', 'yes', 1, NULL, 'tr_2UJRuT6Fvo', NULL, 111, 6, NULL, '2024-05-09 15:47:06', '2024-08-27 23:50:23'),
(13, 9, 9, 'profile', 3, 300, 0, 150, '2024-10-06 15:54:43', 'mollie', 'complete', 'yes', 1, NULL, 'tr_w9sjcSaSqp', NULL, 142, 7, NULL, '2024-05-09 15:54:43', '2024-09-02 23:38:39');

-- --------------------------------------------------------

--
-- Table structure for table `question_answers`
--

CREATE TABLE `question_answers` (
  `id` bigint UNSIGNED NOT NULL,
  `question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question_answers`
--

INSERT INTO `question_answers` (`id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 'sdf sdf sdf sdf sdf sdfs', NULL, '2023-11-06 03:11:41', '2023-11-06 03:11:41'),
(2, 'fhygh..jhhihhjkhh uhgiugji ihhhjjjjjjj', NULL, '2023-11-19 00:53:58', '2023-11-19 00:53:58'),
(3, 'dfdsfs sdf sdf sd fs df s d f s df s f sdfs', NULL, '2023-12-05 18:13:41', '2023-12-05 18:13:41'),
(4, 'Je n\'arrive pas à définir mon projet sur votre site.', NULL, '2023-12-17 18:36:48', '2023-12-17 18:36:48'),
(5, 'kljhljljkhlkhlkg jkghlkbhkl jlhklhklçjl ljhlkjl', NULL, '2023-12-24 04:43:42', '2023-12-24 04:43:42'),
(6, 'Questo è una domanda per il test?', NULL, '2023-12-28 04:21:00', '2023-12-28 04:21:00'),
(7, 'Where does it come from?', NULL, '2023-12-29 00:46:50', '2023-12-29 00:46:50'),
(8, 'questo e ub test per le domande', NULL, '2024-01-17 10:50:41', '2024-01-17 10:50:41'),
(9, 'ииисмамавмавимывмывмывывм ывм ывм ывм ывм', NULL, '2024-02-15 12:43:24', '2024-02-15 12:43:24'),
(10, 'Hello,this is the test message', NULL, '2024-02-19 09:33:29', '2024-02-19 09:33:29'),
(11, 'How does this work and how many does it cost?', NULL, '2024-02-24 05:51:59', '2024-02-24 05:51:59'),
(12, 'rrtrtrtrt trtrtrtr rtrrtr', NULL, '2024-02-24 09:16:03', '2024-02-24 09:16:03'),
(13, 'ddsdsdsds ddfdfdfdf dfdfdfdfdfdfd', NULL, '2024-02-27 20:46:28', '2024-02-27 20:46:28'),
(14, 'Where Does BuyWebsiteTraffic.net Get Its Affordable Traffic?', NULL, '2024-02-29 12:53:58', '2024-02-29 12:53:58'),
(15, '12212321 dvsdfvvdf dassfdfadsv', NULL, '2024-03-05 21:10:59', '2024-03-05 21:10:59'),
(16, 'jkljljh jhjhlj hjhj hlhkl hjhjh jhh', NULL, '2024-03-21 16:13:14', '2024-03-21 16:13:14'),
(17, 'QuestionSubmit Question', NULL, '2024-04-04 10:02:36', '2024-04-04 10:02:36'),
(18, '111111111111111111111111111111111111111111111111111111111111111111111111', NULL, '2024-04-14 12:39:13', '2024-04-14 12:39:13'),
(19, 'TestTestTestTestTestTestTestTestTestTest', NULL, '2024-04-17 20:36:18', '2024-04-17 20:36:18'),
(20, 'Jiinnnnhñhhhhhybububububububububububububini I I I i', NULL, '2024-04-18 22:51:21', '2024-04-18 22:51:21'),
(21, 'Whats PM as per the WTO? And how areyou?', NULL, '2024-04-30 19:55:03', '2024-04-30 19:55:03'),
(22, 'deneme deneme nasıl olacak admin panal pass ?', NULL, '2024-05-14 13:30:58', '2024-05-14 13:30:58'),
(23, 'gdsvsvccccccccccccccccccccccccccccccccccccc', NULL, '2024-05-15 12:46:08', '2024-05-15 12:46:08'),
(24, 'demo freelancer 45 ccccccc', NULL, '2024-05-23 21:09:02', '2024-05-23 21:09:02'),
(25, 'Papaya parapapa paja budy', NULL, '2024-08-22 15:41:53', '2024-08-22 15:41:53'),
(26, '1233421123412341234  412341234', NULL, '2024-08-24 16:29:47', '2024-08-24 16:29:47');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint NOT NULL,
  `sender_id` bigint NOT NULL,
  `sender_type` tinyint NOT NULL COMMENT '1=client, 2=freelancer',
  `rating` double NOT NULL,
  `review_feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `order_id`, `sender_id`, `sender_type`, `rating`, `review_feedback`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 4.8, 'I have completed my first order effectively. Just awesome seller and no doubt of work quality.', '2023-11-07 00:55:03', '2023-11-07 00:55:03'),
(2, 4, 1, 1, 5, 'Professional seller and responsible.', '2023-11-07 01:38:57', '2023-11-07 01:38:57'),
(3, 9, 1, 1, 4.8, 'As expected and great support.', '2023-11-07 04:45:58', '2023-11-07 04:45:58'),
(4, 10, 1, 1, 5, 'Outstanding communication and exceptional customer service. Thus far, my team and I are highly satisfied with the progress of our platform', '2023-11-07 06:43:43', '2023-11-07 06:43:43'),
(5, 12, 2, 1, 5, 'I was completely impressed with their professionalism and customer service', '2023-11-07 23:21:14', '2023-11-07 23:21:14'),
(6, 12, 7, 2, 4.8, 'Nice client and helpful.', '2023-11-07 23:23:54', '2023-11-07 23:23:54'),
(7, 15, 2, 1, 4.8, 'Just awesome service', '2023-11-07 23:30:10', '2023-11-07 23:30:10'),
(8, 9, 7, 2, 3.5, 'Outstanding communication and exceptional customer service. Thus far, my team and I are highly satisfied with the progress of our platform', '2023-11-21 00:49:57', '2023-11-21 00:49:57'),
(9, 25, 1, 1, 4.7, 'It was a real pleasure working with Riad. I was new to this kind of job, and he took the time to share his knowledge with me so I was better prepared to navigate the process', '2023-11-25 07:12:47', '2023-11-25 07:12:47'),
(10, 16, 1, 1, 4.8, 'I was completely impressed with their professionalism and customer service', '2023-11-27 06:23:11', '2023-11-27 06:23:11');

-- --------------------------------------------------------

--
-- Table structure for table `rating_details`
--

CREATE TABLE `rating_details` (
  `id` bigint UNSIGNED NOT NULL,
  `rating_id` bigint NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'skill,availability,communication,deadline,quality,co-operation',
  `rating` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rating_details`
--

INSERT INTO `rating_details` (`id`, `rating_id`, `type`, `rating`, `created_at`, `updated_at`) VALUES
(1, 1, 'skill', 5, '2023-11-07 00:55:03', '2023-11-07 00:55:03'),
(2, 1, 'availability', 5, '2023-11-07 00:55:03', '2023-11-07 00:55:03'),
(3, 1, 'communication', 4, '2023-11-07 00:55:03', '2023-11-07 00:55:03'),
(4, 1, 'work-quality', 5, '2023-11-07 00:55:03', '2023-11-07 00:55:03'),
(5, 1, 'deadline', 5, '2023-11-07 00:55:03', '2023-11-07 00:55:03'),
(6, 1, 'co-operation', 5, '2023-11-07 00:55:03', '2023-11-07 00:55:03'),
(7, 2, 'skill', 5, '2023-11-07 01:38:57', '2023-11-07 01:38:57'),
(8, 2, 'availability', 5, '2023-11-07 01:38:57', '2023-11-07 01:38:57'),
(9, 2, 'communication', 5, '2023-11-07 01:38:58', '2023-11-07 01:38:58'),
(10, 2, 'work-quality', 5, '2023-11-07 01:38:58', '2023-11-07 01:38:58'),
(11, 2, 'deadline', 5, '2023-11-07 01:38:58', '2023-11-07 01:38:58'),
(12, 2, 'co-operation', 5, '2023-11-07 01:38:58', '2023-11-07 01:38:58'),
(13, 3, 'skill', 5, '2023-11-07 04:45:58', '2023-11-07 04:45:58'),
(14, 3, 'availability', 4, '2023-11-07 04:45:58', '2023-11-07 04:45:58'),
(15, 3, 'communication', 5, '2023-11-07 04:45:58', '2023-11-07 04:45:58'),
(16, 3, 'work-quality', 5, '2023-11-07 04:45:58', '2023-11-07 04:45:58'),
(17, 3, 'deadline', 5, '2023-11-07 04:45:58', '2023-11-07 04:45:58'),
(18, 3, 'co-operation', 5, '2023-11-07 04:45:58', '2023-11-07 04:45:58'),
(19, 4, 'skill', 5, '2023-11-07 06:43:43', '2023-11-07 06:43:43'),
(20, 4, 'availability', 5, '2023-11-07 06:43:44', '2023-11-07 06:43:44'),
(21, 4, 'communication', 5, '2023-11-07 06:43:44', '2023-11-07 06:43:44'),
(22, 4, 'work-quality', 5, '2023-11-07 06:43:44', '2023-11-07 06:43:44'),
(23, 4, 'deadline', 5, '2023-11-07 06:43:44', '2023-11-07 06:43:44'),
(24, 4, 'co-operation', 5, '2023-11-07 06:43:44', '2023-11-07 06:43:44'),
(25, 5, 'skill', 5, '2023-11-07 23:21:14', '2023-11-07 23:21:14'),
(26, 5, 'availability', 5, '2023-11-07 23:21:14', '2023-11-07 23:21:14'),
(27, 5, 'communication', 5, '2023-11-07 23:21:15', '2023-11-07 23:21:15'),
(28, 5, 'work-quality', 5, '2023-11-07 23:21:15', '2023-11-07 23:21:15'),
(29, 5, 'deadline', 5, '2023-11-07 23:21:15', '2023-11-07 23:21:15'),
(30, 5, 'co-operation', 5, '2023-11-07 23:21:15', '2023-11-07 23:21:15'),
(31, 6, 'skill', 5, '2023-11-07 23:23:54', '2023-11-07 23:23:54'),
(32, 6, 'availability', 5, '2023-11-07 23:23:54', '2023-11-07 23:23:54'),
(33, 6, 'communication', 5, '2023-11-07 23:23:54', '2023-11-07 23:23:54'),
(34, 6, 'work-quality', 5, '2023-11-07 23:23:54', '2023-11-07 23:23:54'),
(35, 6, 'deadline', 5, '2023-11-07 23:23:54', '2023-11-07 23:23:54'),
(36, 6, 'co-operation', 4, '2023-11-07 23:23:54', '2023-11-07 23:23:54'),
(37, 7, 'skill', 5, '2023-11-07 23:30:10', '2023-11-07 23:30:10'),
(38, 7, 'availability', 5, '2023-11-07 23:30:10', '2023-11-07 23:30:10'),
(39, 7, 'communication', 4, '2023-11-07 23:30:10', '2023-11-07 23:30:10'),
(40, 7, 'work-quality', 5, '2023-11-07 23:30:10', '2023-11-07 23:30:10'),
(41, 7, 'deadline', 5, '2023-11-07 23:30:10', '2023-11-07 23:30:10'),
(42, 7, 'co-operation', 5, '2023-11-07 23:30:10', '2023-11-07 23:30:10'),
(43, 8, 'skill', 2, '2023-11-21 00:49:57', '2023-11-21 00:49:57'),
(44, 8, 'communication', 5, '2023-11-21 00:49:57', '2023-11-21 00:49:57'),
(45, 9, 'skill', 5, '2023-11-25 07:12:47', '2023-11-25 07:12:47'),
(46, 9, 'availability', 5, '2023-11-25 07:12:47', '2023-11-25 07:12:47'),
(47, 9, 'communication', 5, '2023-11-25 07:12:47', '2023-11-25 07:12:47'),
(48, 9, 'work-quality', 5, '2023-11-25 07:12:47', '2023-11-25 07:12:47'),
(49, 9, 'deadline', 4, '2023-11-25 07:12:47', '2023-11-25 07:12:47'),
(50, 9, 'co-operation', 4, '2023-11-25 07:12:47', '2023-11-25 07:12:47'),
(51, 10, 'skill', 5, '2023-11-27 06:23:11', '2023-11-27 06:23:11'),
(52, 10, 'availability', 5, '2023-11-27 06:23:11', '2023-11-27 06:23:11'),
(53, 10, 'communication', 5, '2023-11-27 06:23:11', '2023-11-27 06:23:11'),
(54, 10, 'work-quality', 5, '2023-11-27 06:23:11', '2023-11-27 06:23:11'),
(55, 10, 'deadline', 5, '2023-11-27 06:23:11', '2023-11-27 06:23:11'),
(56, 10, 'co-operation', 4, '2023-11-27 06:23:11', '2023-11-27 06:23:11');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `client_id` bigint NOT NULL,
  `freelancer_id` bigint NOT NULL,
  `reporter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'freelancer, client',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin', '2023-10-19 07:28:11', '2023-10-19 07:28:11'),
(2, 'Admin', 'admin', '2023-10-19 07:31:16', '2023-10-19 07:31:16'),
(6, 'Editor', 'admin', '2023-10-23 01:03:36', '2023-10-23 01:03:36');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(5, 2),
(7, 2),
(8, 2),
(9, 2),
(11, 2),
(13, 2),
(14, 2),
(15, 2),
(17, 2),
(19, 2),
(20, 2),
(21, 2),
(23, 2),
(26, 2),
(27, 2),
(28, 2),
(30, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(42, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(61, 2),
(62, 2),
(63, 2),
(65, 2),
(66, 2),
(67, 2),
(68, 2),
(70, 2),
(71, 2),
(72, 2),
(73, 2),
(76, 2),
(77, 2),
(78, 2),
(79, 2),
(80, 2),
(81, 2),
(82, 2),
(83, 2),
(84, 2),
(85, 2),
(90, 2),
(91, 2),
(92, 2),
(93, 2),
(94, 2),
(95, 2),
(96, 2),
(99, 2),
(100, 2),
(101, 2),
(102, 2),
(105, 2),
(106, 2),
(107, 2),
(110, 2),
(111, 2),
(112, 2),
(113, 2),
(115, 2),
(116, 2),
(117, 2),
(118, 2),
(119, 2),
(120, 2),
(121, 2),
(123, 2),
(124, 2),
(125, 2),
(127, 2),
(128, 2),
(129, 2),
(130, 2),
(131, 2),
(132, 2),
(133, 2),
(134, 2),
(135, 2),
(136, 2),
(137, 2),
(138, 2),
(139, 2),
(140, 2),
(141, 2),
(142, 2),
(143, 2),
(144, 2),
(145, 2),
(146, 2),
(147, 2),
(148, 2),
(149, 2),
(150, 2),
(151, 2),
(152, 2),
(153, 2),
(154, 2),
(155, 2),
(156, 2),
(157, 2),
(158, 2),
(159, 2),
(160, 2),
(161, 2),
(162, 2),
(163, 2),
(164, 2),
(165, 2),
(166, 2),
(167, 2),
(168, 2),
(169, 2),
(171, 2),
(172, 2),
(173, 2),
(176, 2),
(177, 2),
(178, 2),
(180, 2),
(181, 2),
(182, 2),
(184, 2),
(185, 2),
(186, 2),
(187, 2),
(191, 2),
(194, 2),
(195, 2),
(196, 2),
(197, 2),
(200, 2),
(201, 2),
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(5, 6),
(6, 6),
(88, 6),
(89, 6);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` bigint UNSIGNED NOT NULL,
  `skill` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_category_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0=inactive 1=active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `skill`, `category_id`, `sub_category_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Android', '4', NULL, 1, '2023-02-08 22:31:43', '2023-09-18 00:43:23'),
(2, 'Firebase on Android', '4', '6', 1, '2023-02-08 22:41:05', '2023-02-08 22:41:05'),
(3, 'Android foundations', '4', '6', 1, '2023-02-08 22:42:43', '2023-02-08 22:42:43'),
(4, 'Php', '2', '20', 1, '2023-02-08 22:49:30', '2023-02-08 22:49:30'),
(6, 'Javascript', '2', NULL, 1, '2023-02-08 23:00:58', '2023-02-08 23:00:58'),
(7, 'HTML', '2', NULL, 1, '2023-02-08 23:03:02', '2023-11-05 22:58:25'),
(10, 'Jquery', '2', NULL, 1, '2023-02-08 23:03:48', '2023-02-08 23:03:48'),
(20, 'CSS', '2', NULL, 1, '2023-11-05 22:56:47', '2023-11-05 22:56:47'),
(21, 'Bootstrap', '2', NULL, 1, '2023-11-05 22:57:04', '2023-11-05 22:57:04'),
(22, 'Vue JS', '2', NULL, 1, '2023-11-05 22:57:24', '2023-11-05 22:57:24'),
(23, 'Laravel', '2', NULL, 1, '2023-11-05 22:57:38', '2023-11-05 22:57:38'),
(24, 'React', '2', NULL, 1, '2023-11-05 22:57:51', '2023-11-05 22:57:51'),
(25, 'NodeJS', '2', NULL, 1, '2023-11-05 22:58:13', '2023-11-05 22:58:13'),
(26, 'Ajax', '2', NULL, 1, '2023-11-05 23:13:28', '2023-11-05 23:25:00'),
(27, 'Rest API', '2', NULL, 1, '2023-11-05 23:13:41', '2023-11-05 23:13:41'),
(28, 'Logo Design', '1', '2', 1, '2023-11-05 23:32:46', '2023-11-05 23:33:05'),
(29, 'Graphic Design', '1', '2', 1, '2023-11-05 23:33:35', '2023-11-05 23:33:35'),
(30, 'Photoshop', '1', '2', 1, '2023-11-05 23:34:30', '2023-11-05 23:34:30'),
(31, 'Illustrator', '1', NULL, 1, '2023-11-05 23:34:43', '2023-11-05 23:34:43'),
(32, '3D Design', '1', NULL, 1, '2023-11-05 23:34:58', '2023-11-05 23:34:58'),
(33, 'UI/UX Design', '1', NULL, 1, '2023-11-05 23:42:26', '2023-11-05 23:42:26'),
(34, 'eCommerce', '2', NULL, 1, '2023-11-05 23:42:50', '2023-11-05 23:42:50'),
(35, 'Mobile App Development', '4', NULL, 1, '2023-11-06 00:01:56', '2023-11-06 00:01:56'),
(36, 'Software Architecture', '2', NULL, 1, '2023-11-06 00:02:14', '2023-11-06 00:02:14'),
(37, 'Article Writing', '13', '26', 1, '2023-11-06 00:18:01', '2023-11-06 00:18:01'),
(38, 'Technical Writing', '13', NULL, 1, '2023-11-06 00:18:20', '2023-11-06 00:18:20'),
(39, 'Data Entry', '13', NULL, 1, '2023-11-06 00:18:36', '2023-11-06 00:18:36'),
(40, 'Copy Writing', '13', NULL, 1, '2023-11-06 00:19:29', '2023-11-06 00:19:29'),
(41, 'Content Writing', '13', NULL, 1, '2023-11-06 00:25:10', '2023-11-06 00:25:10'),
(42, 'Blog', '13', NULL, 1, '2023-11-06 00:25:26', '2023-11-06 00:25:26'),
(43, 'Accounting', '11', NULL, 1, '2023-11-06 00:31:19', '2023-11-06 00:31:19'),
(44, 'Sales', '11', NULL, 1, '2023-11-06 00:31:35', '2023-11-06 00:31:35'),
(45, 'Digital Marketing', '11', NULL, 1, '2023-11-06 00:31:57', '2023-11-06 00:31:57'),
(46, 'Research', '9', NULL, 1, '2023-11-06 00:40:36', '2023-11-06 00:40:36'),
(47, 'Market Research', '9', NULL, 1, '2023-11-06 00:40:59', '2023-11-06 00:40:59'),
(48, 'Internet marketing', '9', NULL, 1, '2023-11-06 00:41:18', '2023-11-06 00:41:18'),
(49, 'Customer Service', '3', NULL, 1, '2023-11-06 00:56:09', '2023-11-06 00:56:09'),
(50, 'English Translator', '3', NULL, 1, '2023-11-06 00:56:53', '2023-11-06 00:56:53'),
(51, 'Spanish Translator', '3', NULL, 1, '2023-11-06 00:57:12', '2023-11-06 00:57:12'),
(52, 'English Teaching', '5', NULL, 1, '2023-11-06 01:16:19', '2023-11-06 01:16:19'),
(53, 'English Grammer', '5', NULL, 1, '2023-11-06 01:16:43', '2023-11-06 01:16:43'),
(54, 'English Tutoring', '5', NULL, 1, '2023-11-06 01:17:00', '2023-11-06 01:17:00'),
(55, 'Education', '5', NULL, 1, '2023-11-06 01:20:07', '2023-11-06 01:20:07'),
(56, 'SEO', '11', NULL, 1, '2023-11-06 02:01:16', '2023-11-06 02:01:16'),
(57, 'Serach Engine marketing', '11', NULL, 1, '2023-11-06 02:02:18', '2023-11-06 02:02:18');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint UNSIGNED NOT NULL,
  `country_id` int DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0=inactive 1=active',
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `state`, `status`, `timezone`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dhaka', 1, 'Asia/Dhaka', '2023-01-28 00:55:31', '2023-03-28 23:39:28'),
(2, 1, 'Chittagong', 1, NULL, '2023-01-28 00:55:56', '2023-01-28 03:04:44'),
(3, 1, 'Sylhet', 1, NULL, '2023-01-28 00:56:11', '2023-01-28 03:22:41'),
(16, 2, 'Buenos Aires', 1, 'America/Argentina/Buenos_Aires', '2023-01-28 04:32:19', '2023-11-25 07:16:35'),
(17, 1, '   Rajshahi', 1, NULL, '2023-01-28 04:32:19', '2023-01-28 04:32:19'),
(18, 1, '   Khulna', 1, NULL, '2023-01-28 04:32:19', '2023-01-28 04:32:19'),
(19, 14, 'New Delli', 1, NULL, '2023-02-08 04:33:28', '2023-02-08 04:58:52'),
(20, 11, 'Lahore', 1, NULL, '2023-02-08 04:40:48', '2023-02-08 04:56:01'),
(21, 6, 'zxczc', 1, NULL, '2023-02-08 05:09:35', '2023-02-08 05:09:35'),
(22, 9, 'zxczxczx', 1, NULL, '2023-02-08 05:09:44', '2023-02-08 05:09:44'),
(23, 13, 'zxczxcz', 1, NULL, '2023-02-08 05:09:52', '2023-02-08 05:09:52');

-- --------------------------------------------------------

--
-- Table structure for table `static_options`
--

CREATE TABLE `static_options` (
  `id` bigint UNSIGNED NOT NULL,
  `option_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `static_options`
--

INSERT INTO `static_options` (`id`, `option_name`, `option_value`, `created_at`, `updated_at`) VALUES
(1, 'site_title', 'Xilancer', '2022-12-10 01:37:26', '2023-11-13 07:45:07'),
(2, 'site_footer_copyright', '{copy}  {year}  All right reserved by  <a href=\"https://xilancer.xgenious.com/\">xgenious</a>', '2022-12-10 01:37:26', '2023-11-13 07:45:07'),
(3, 'disable_user_email_verify', 'on', '2022-12-10 01:37:26', '2023-11-13 07:45:07'),
(4, 'site_maintenance_mode', NULL, '2022-12-10 01:37:26', '2023-11-13 07:45:07'),
(5, 'admin_loader_animation', NULL, '2022-12-10 01:37:26', '2023-11-13 07:45:07'),
(6, 'site_loader_animation', 'on', '2022-12-10 01:37:26', '2023-11-13 07:45:07'),
(7, 'site_force_ssl_redirection', NULL, '2022-12-10 01:37:26', '2023-11-13 07:45:07'),
(8, 'site_google_captcha_enable', 'on', '2022-12-10 01:37:26', '2023-11-13 07:45:07'),
(9, 'site_logo', '31', '2022-12-11 23:42:42', '2023-04-02 23:03:25'),
(10, 'site_favicon', '30', '2022-12-11 23:42:42', '2023-04-02 23:03:25'),
(11, 'site_main_color_one', '#9c3030', '2022-12-12 00:51:22', '2022-12-12 00:51:48'),
(12, 'site_main_color_two', '#000000', '2022-12-12 00:51:22', '2022-12-12 00:51:48'),
(13, 'site_main_color_three', '#4b1111', '2022-12-12 00:51:22', '2022-12-12 00:51:48'),
(14, 'heading_color', '#1D2635', '2022-12-12 00:51:22', '2023-11-23 00:10:41'),
(15, 'light_color', '#a04eb7', '2022-12-12 00:51:22', '2022-12-12 00:51:48'),
(16, 'extra_light_color', '#000000', '2022-12-12 00:51:22', '2022-12-12 00:51:48'),
(17, 'body_font_family', 'Manrope', '2022-12-12 05:19:22', '2023-11-15 04:41:13'),
(18, 'heading_font_family', 'Plus Jakarta Sans', '2022-12-12 05:19:22', '2023-11-15 04:41:13'),
(19, 'extra_body_font', NULL, '2022-12-12 05:19:22', '2023-11-15 04:41:13'),
(20, 'heading_font', 'on', '2022-12-12 05:19:22', '2023-11-15 04:41:13'),
(21, 'body_font_variant', 'a:6:{i:0;s:5:\"0,300\";i:1;s:5:\"0,400\";i:2;s:5:\"0,500\";i:3;s:5:\"0,600\";i:4;s:5:\"0,700\";i:5;s:5:\"0,800\";}', '2022-12-12 05:19:22', '2023-11-15 04:41:13'),
(22, 'heading_font_variant', 'a:6:{i:0;s:5:\"0,300\";i:1;s:5:\"0,400\";i:2;s:5:\"0,500\";i:3;s:5:\"0,600\";i:4;s:5:\"0,700\";i:5;s:5:\"0,800\";}', '2022-12-12 05:19:22', '2023-11-15 04:41:13'),
(23, 'site_meta_tags', 'fds sdsdf sdf sdf ,sdf sdf sdf sdf sdfsd ,sdf sdf sdf sd', '2022-12-13 00:03:23', '2022-12-13 00:03:23'),
(24, 'site_meta_description', 'Xilancr market place', '2022-12-13 00:03:23', '2022-12-13 00:03:23'),
(25, 'og_meta_title', 'Xilancr market place', '2022-12-13 00:03:23', '2022-12-13 00:03:23'),
(26, 'og_meta_description', 'Xilancr market place', '2022-12-13 00:03:23', '2022-12-13 00:03:23'),
(27, 'og_meta_site_name', 'Xilancr market place', '2022-12-13 00:03:23', '2022-12-13 00:03:23'),
(28, 'og_meta_url', 'Xilancr market place', '2022-12-13 00:03:24', '2022-12-13 00:03:24'),
(29, 'og_meta_image', '2', '2022-12-13 00:03:24', '2022-12-13 00:03:24'),
(30, 'site_third_party_tracking_code', NULL, '2022-12-13 01:46:32', '2022-12-13 04:41:00'),
(31, 'site_google_analytics', NULL, '2022-12-13 01:46:32', '2022-12-13 04:41:00'),
(32, 'site_google_captcha_v3_site_key', '6LcJtlYpAAAAAAZAJk7pjWKhz09FRSWLCYyKVpAd', '2022-12-13 01:46:32', '2024-01-27 06:49:27'),
(33, 'site_google_captcha_v3_secret_key', '6LcJtlYpAAAAAENuELMZG9N3UqUak0bV0IvioEHA', '2022-12-13 01:46:32', '2024-01-27 06:49:27'),
(34, 'tawk_api_key', NULL, '2022-12-13 01:46:32', '2022-12-13 04:41:00'),
(35, 'facebook_client_id', '713291307367672', '2022-12-13 04:59:55', '2024-03-10 14:52:54'),
(36, 'facebook_client_secret', '5ec25da1868a7b58b838850570b90c08', '2022-12-13 04:59:55', '2024-03-10 14:52:54'),
(37, 'google_client_id', '483808191107-sjonvl0tg80j1mk63i8tsjdub7ql9v4a.apps.googleusercontent.com', '2022-12-13 04:59:55', '2024-03-10 14:52:54'),
(38, 'google_client_secret', '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', '2022-12-13 04:59:55', '2024-03-10 14:52:54'),
(39, 'site_global_email', 'nazmul@gmail.com', '2022-12-13 07:46:18', '2022-12-14 00:50:18'),
(40, 'site_global_email_template', '<p>sdf sdf sdf sdf sdfs dsdf sdf&nbsp;</p>', '2022-12-13 07:46:18', '2022-12-14 00:50:18'),
(41, 'site_smtp_mail_mailer', 'smtp', '2022-12-14 00:53:07', '2022-12-14 05:19:48'),
(42, 'site_smtp_mail_host', 'smtp.mailtrap.io', '2022-12-14 00:53:07', '2022-12-14 05:19:48'),
(43, 'site_smtp_mail_port', '587', '2022-12-14 00:53:07', '2022-12-14 05:19:48'),
(44, 'site_smtp_mail_username', '8fa73add6aad18', '2022-12-14 00:53:07', '2022-12-14 05:19:48'),
(45, 'site_smtp_mail_password', 'c96cbf3b046393', '2022-12-14 00:53:07', '2022-12-14 05:19:48'),
(46, 'site_smtp_mail_encryption', 'tls', '2022-12-14 00:53:07', '2022-12-14 05:19:48'),
(47, 'site_gdpr_cookie_title', 'Cookies & Privacy', '2022-12-15 03:19:57', '2022-12-15 03:24:34'),
(48, 'site_gdpr_cookie_message', 'Is education residence conveying so so. Suppose shyness say ten behaved morning had. Any unsatiable assistance compliment occasional too reasonably advantages.', '2022-12-15 03:19:57', '2022-12-15 03:24:34'),
(49, 'site_gdpr_cookie_more_info_label', 'More information', '2022-12-15 03:19:57', '2022-12-15 03:24:34'),
(50, 'site_gdpr_cookie_more_info_link', '{url}/privacy-policy', '2022-12-15 03:19:57', '2022-12-15 03:24:34'),
(51, 'site_gdpr_cookie_accept_button_label', 'Accept', '2022-12-15 03:19:57', '2022-12-15 03:24:34'),
(52, 'site_gdpr_cookie_decline_button_label', 'Decline', '2022-12-15 03:19:57', '2022-12-15 03:24:34'),
(53, 'site_gdpr_cookie_manage_button_label', 'Manage', '2022-12-15 03:19:57', '2022-12-15 03:24:34'),
(54, 'site_gdpr_cookie_manage_title', NULL, '2022-12-15 03:19:57', '2022-12-15 03:24:34'),
(55, 'site_gdpr_cookie_manage_item_title', 'a:2:{i:0;s:4:\"test\";i:1;s:8:\"yr dfdfg\";}', '2022-12-15 03:19:57', '2022-12-15 03:24:34'),
(56, 'site_gdpr_cookie_manage_item_description', 'a:2:{i:0;s:14:\"sadas dsa asda\";i:1;s:61:\"fg dfg dfgdf dfgdfg dfg dfg dfg dfg dfg dfg dfg dfgdfgdfg d d\";}', '2022-12-15 03:19:57', '2022-12-15 03:24:34'),
(57, 'site_gdpr_cookie_delay', '5000', '2022-12-15 03:19:57', '2022-12-15 03:24:34'),
(58, 'site_gdpr_cookie_enabled', 'on', '2022-12-15 03:19:57', '2022-12-15 03:24:34'),
(59, 'site_gdpr_cookie_expire', '30', '2022-12-15 03:19:57', '2022-12-15 03:24:34'),
(60, 'global_navbar_variant', '01', '2022-12-15 07:08:00', '2023-05-10 01:01:49'),
(61, 'global_footer_variant', '01', '2022-12-17 23:45:33', '2022-12-17 23:45:41'),
(62, 'paypal_preview_logo', '34', '2022-12-20 01:33:51', '2024-07-29 15:06:09'),
(63, 'paypal_mode', NULL, '2022-12-20 01:33:51', '2023-04-09 22:54:08'),
(64, 'paypal_sandbox_client_id', 'AUP7AuZMwJbkee-2OmsSZrU-ID1XUJYE-YB-2JOrxeKV-q9ZJZYmsr-UoKuJn4kwyCv5ak26lrZyb-gb', '2022-12-20 01:33:51', '2024-07-29 15:06:09'),
(65, 'paypal_sandbox_client_secret', 'EEIxCuVnbgING9EyzcF2q-gpacLneVbngQtJ1mbx-42Lbq-6Uf6PEjgzF7HEayNsI4IFmB9_CZkECc3y', '2022-12-20 01:33:51', '2024-07-29 15:06:09'),
(66, 'paypal_sandbox_app_id', '641651651958', '2022-12-20 01:33:51', '2024-07-29 15:06:09'),
(67, 'paypal_live_app_id', 'Test', '2022-12-20 01:33:51', '2024-07-29 15:06:09'),
(68, 'paypal_payment_action', NULL, '2022-12-20 01:33:51', '2024-07-29 15:06:09'),
(69, 'paypal_currency', NULL, '2022-12-20 01:33:51', '2024-07-29 15:06:09'),
(70, 'paypal_notify_url', NULL, '2022-12-20 01:33:51', '2024-07-29 15:06:09'),
(71, 'paypal_locale', NULL, '2022-12-20 01:33:51', '2024-07-29 15:06:09'),
(72, 'paypal_validate_ssl', NULL, '2022-12-20 01:33:52', '2024-07-29 15:06:09'),
(73, 'paypal_live_client_id', 'Test', '2022-12-20 01:33:52', '2024-07-29 15:06:09'),
(74, 'paypal_live_client_secret', 'Test', '2022-12-20 01:33:52', '2024-07-29 15:06:09'),
(75, 'paypal_gateway', 'on', '2022-12-20 01:33:52', '2024-07-29 15:06:09'),
(76, 'paypal_test_mode', 'on', '2022-12-20 01:33:52', '2024-07-29 15:06:09'),
(77, 'razorpay_preview_logo', '36', '2022-12-20 01:56:54', '2024-07-29 15:06:09'),
(78, 'razorpay_key', NULL, '2022-12-20 01:56:54', '2024-07-29 15:06:09'),
(79, 'razorpay_secret', NULL, '2022-12-20 01:56:54', '2024-07-29 15:06:09'),
(80, 'razorpay_api_key', 'rzp_test_SXk7LZqsBPpAkj', '2022-12-20 01:56:54', '2024-07-29 15:06:09'),
(81, 'razorpay_api_secret', 'Nenvq0aYArtYBDOGgmMH7JNv', '2022-12-20 01:56:54', '2024-07-29 15:06:09'),
(82, 'razorpay_gateway', 'on', '2022-12-20 01:56:54', '2024-07-29 15:06:09'),
(83, 'stripe_preview_logo', '37', '2022-12-20 01:56:54', '2024-07-29 15:06:09'),
(84, 'stripe_publishable_key', NULL, '2022-12-20 01:56:54', '2024-07-29 15:06:09'),
(85, 'stripe_secret_key', 'sk_test_51GwS1SEmGOuJLTMs2vhSliTwAGkOt4fKJMBrxzTXeCJoLrRu8HFf4I0C5QuyE3l3bQHBJm3c0qFmeVjd0V9nFb6Z00VrWDJ9Uw', '2022-12-20 01:56:54', '2024-07-29 15:06:09'),
(86, 'stripe_public_key', 'pk_test_51GwS1SEmGOuJLTMsIeYKFtfAT3o3Fc6IOC7wyFmmxA2FIFQ3ZigJ2z1s4ZOweKQKlhaQr1blTH9y6HR2PMjtq1Rx00vqE8LO0x', '2022-12-20 01:56:54', '2024-07-29 15:06:09'),
(87, 'stripe_gateway', 'on', '2022-12-20 01:56:55', '2024-07-29 15:06:09'),
(88, 'paytm_gateway', 'on', '2022-12-20 01:56:55', '2024-07-29 15:06:09'),
(89, 'paytm_preview_logo', '35', '2022-12-20 01:56:55', '2024-07-29 15:06:09'),
(90, 'paytm_merchant_key', 'dv0XtmsPYpewNag', '2022-12-20 01:56:55', '2024-07-29 15:06:09'),
(91, 'paytm_merchant_mid', 'Digita57697814558795', '2022-12-20 01:56:55', '2024-07-29 15:06:09'),
(92, 'paytm_merchant_website', 'WEBSTAGING', '2022-12-20 01:56:55', '2024-07-29 15:06:09'),
(93, 'paytm_test_mode', 'on', '2022-12-20 01:56:55', '2024-07-29 15:06:09'),
(94, 'paystack_merchant_email', 'xgeniousteam@gmail.com', '2022-12-20 01:56:55', '2024-07-29 15:06:09'),
(95, 'paystack_preview_logo', '51', '2022-12-20 01:56:55', '2024-07-29 15:06:09'),
(96, 'paystack_public_key', 'pk_test_7c6f87613b4dc1514acc3875998ba4f3a12bfda7', '2022-12-20 01:56:55', '2024-07-29 15:06:09'),
(97, 'paystack_secret_key', 'sk_test_0ec08da7d5d342774eaa3779ff37004a1fbda6c4', '2022-12-20 01:56:55', '2024-07-29 15:06:09'),
(98, 'paystack_gateway', 'on', '2022-12-20 01:56:55', '2024-07-29 15:06:09'),
(99, 'mollie_preview_logo', '38', '2022-12-20 01:56:55', '2024-07-29 15:06:09'),
(100, 'mollie_public_key', 'test_fVk76gNbAp6ryrtRjfAVvzjxSHxC2v', '2022-12-20 01:56:55', '2024-07-29 15:06:09'),
(101, 'mollie_gateway', 'on', '2022-12-20 01:56:55', '2024-07-29 15:06:09'),
(102, 'marcado_pagp_client_id', NULL, '2022-12-20 01:56:55', '2023-04-09 22:54:10'),
(103, 'marcado_pago_client_secret', NULL, '2022-12-20 01:56:55', '2023-04-09 22:54:10'),
(104, 'marcado_pago_test_mode', NULL, '2022-12-20 01:56:55', '2023-04-09 22:54:10'),
(105, 'cash_on_delivery_gateway', NULL, '2022-12-20 01:56:55', '2024-07-29 15:06:09'),
(106, 'cash_on_delivery_preview_logo', NULL, '2022-12-20 01:56:55', '2024-07-29 15:06:09'),
(107, 'flutterwave_preview_logo', '39', '2022-12-20 01:56:55', '2024-07-29 15:06:09'),
(108, 'flutterwave_gateway', 'on', '2022-12-20 01:56:55', '2024-07-29 15:06:09'),
(109, 'flw_public_key', '86cce2ec43c63e09a517290a8347fcab', '2022-12-20 01:56:56', '2024-07-29 15:06:09'),
(110, 'flw_secret_key', 'd37a42d8917db84f1b2f47c125252d0a', '2022-12-20 01:56:56', '2024-07-29 15:06:09'),
(111, 'flw_secret_hash', NULL, '2022-12-20 01:56:56', '2024-07-29 15:06:09'),
(112, 'midtrans_preview_logo', '46', '2022-12-20 01:56:56', '2024-07-29 15:06:09'),
(113, 'midtrans_merchant_id', NULL, '2022-12-20 01:56:56', '2024-07-29 15:06:09'),
(114, 'midtrans_server_key', 'SB-Mid-server-9z5jztsHyYxEdSs7DgkNg2on', '2022-12-20 01:56:56', '2024-07-29 15:06:09'),
(115, 'midtrans_client_key', 'SB-Mid-client-iDuy-jKdZHkLjL_I', '2022-12-20 01:56:56', '2024-07-29 15:06:09'),
(116, 'midtrans_environment', NULL, '2022-12-20 01:56:56', '2024-07-29 15:06:09'),
(117, 'midtrans_gateway', 'on', '2022-12-20 01:56:56', '2024-07-29 15:06:09'),
(118, 'midtrans_test_mode', 'on', '2022-12-20 01:56:56', '2024-07-29 15:06:09'),
(119, 'payfast_preview_logo', '40', '2022-12-20 01:56:56', '2024-07-29 15:06:09'),
(120, 'payfast_merchant_id', '10024000', '2022-12-20 01:56:56', '2024-07-29 15:06:09'),
(121, 'payfast_merchant_key', '77jcu5v4ufdod', '2022-12-20 01:56:56', '2024-07-29 15:06:09'),
(122, 'payfast_passphrase', 'testpayfastsohan', '2022-12-20 01:56:56', '2024-07-29 15:06:09'),
(123, 'payfast_merchant_env', NULL, '2022-12-20 01:56:56', '2024-07-29 15:06:09'),
(124, 'payfast_itn_url', NULL, '2022-12-20 01:56:56', '2024-07-29 15:06:09'),
(125, 'payfast_gateway', 'on', '2022-12-20 01:56:56', '2024-07-29 15:06:10'),
(126, 'cashfree_preview_logo', '41', '2022-12-20 01:56:56', '2024-07-29 15:06:10'),
(127, 'cashfree_test_mode', 'on', '2022-12-20 01:56:56', '2024-07-29 15:06:10'),
(128, 'cashfree_app_id', '94527832f47d6e74fa6ca5e3c72549', '2022-12-20 01:56:56', '2024-07-29 15:06:10'),
(129, 'cashfree_secret_key', 'ec6a3222018c676e95436b2e26e89c1ec6be2830', '2022-12-20 01:56:56', '2024-07-29 15:06:10'),
(130, 'cashfree_gateway', 'on', '2022-12-20 01:56:56', '2024-07-29 15:06:10'),
(131, 'instamojo_preview_logo', '47', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(132, 'instamojo_client_id', 'test_nhpJ3RvWObd3uryoIYF0gjKby5NB5xu6S9Z', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(133, 'instamojo_client_secret', 'test_iZusG4P35maQVPTfqutbCc6UEbba3iesbCbrYM7zOtDaJUdbPz76QOnBcDgblC53YBEgsymqn2sx3NVEPbl3b5coA3uLqV1ikxKquOeXSWr8Ruy7eaKUMX1yBbm', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(134, 'instamojo_username', NULL, '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(135, 'instamojo_password', NULL, '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(136, 'instamojo_test_mode', 'on', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(137, 'instamojo_gateway', 'on', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(138, 'marcadopago_preview_logo', '48', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(139, 'marcado_pago_client_id', 'TEST-0a3cc78a-57bf-4556-9dbe-2afa06347769', '2022-12-20 01:56:57', '2023-04-10 21:43:47'),
(140, 'marcadopago_gateway', 'on', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(141, 'marcadopago_test_mode', 'on', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(142, 'zitopay_username', 'dvrobin4', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(143, 'zitopay_preview_logo', '42', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(144, 'zitopay_gateway', 'on', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(145, 'zitopay_test_mode', 'on', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(146, 'billplz_collection_name', 'kjj5ya006', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(147, 'billplz_xsignature', 'S-HDXHxRJB-J7rNtoktZkKJg', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(148, 'billplz_key', 'b2ead199-e6f3-4420-ae5c-c94f1b1e8ed6', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(149, 'billplz_preview_logo', '50', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(150, 'billplz_gateway', 'on', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(151, 'billplz_test_mode', 'on', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(152, 'paytabs_region', 'GLOBAL', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(153, 'paytabs_profile_id', '96698', '2022-12-20 01:56:57', '2024-07-29 15:06:10'),
(154, 'paytabs_server_key', 'SKJNDNRHM2-JDKTZDDH2N-H9HLMJNJ2L', '2022-12-20 01:56:58', '2024-07-29 15:06:10'),
(155, 'paytabs_preview_logo', '49', '2022-12-20 01:56:58', '2024-07-29 15:06:10'),
(156, 'paytabs_gateway', 'on', '2022-12-20 01:56:58', '2024-07-29 15:06:10'),
(157, 'paytabs_test_mode', 'on', '2022-12-20 01:56:58', '2024-07-29 15:06:10'),
(158, 'cinetpay_site_id', '445160', '2022-12-20 01:56:58', '2024-07-29 15:06:10'),
(159, 'cinetpay_app_key', '12912847765bc0db748fdd44.40081707', '2022-12-20 01:56:58', '2024-07-29 15:06:10'),
(160, 'cinetpay_preview_logo', '45', '2022-12-20 01:56:58', '2024-07-29 15:06:10'),
(161, 'cinetpay_gateway', 'on', '2022-12-20 01:56:58', '2024-07-29 15:06:10'),
(162, 'cinetpay_test_mode', 'on', '2022-12-20 01:56:58', '2024-07-29 15:06:10'),
(163, 'squareup_application_id', NULL, '2022-12-20 01:56:58', '2024-07-29 15:06:10'),
(164, 'squareup_location_id', 'LE9C12TNM5HAS', '2022-12-20 01:56:58', '2024-07-29 15:06:10'),
(165, 'squareup_access_token', 'EAAAEOuLQObrVwJvCvoio3H13b8Ssqz1ighmTBKZvIENW9qxirHGHkqsGcPBC1uN', '2022-12-20 01:56:58', '2024-07-29 15:06:10'),
(166, 'squareup_preview_logo', '43', '2022-12-20 01:56:58', '2024-07-29 15:06:10'),
(167, 'squareup_gateway', 'on', '2022-12-20 01:56:58', '2024-07-29 15:06:10'),
(168, 'squareup_test_mode', 'on', '2022-12-20 01:56:58', '2024-07-29 15:06:10'),
(169, 'paytm_channel', 'WEB', '2022-12-20 02:01:36', '2024-07-29 15:06:09'),
(170, 'paytm_industry_type', 'Retail', '2022-12-20 02:01:36', '2024-07-29 15:06:09'),
(171, 'error_404_page_title', 'Page Not Found', '2022-12-26 04:23:23', '2023-11-19 07:18:47'),
(172, 'error_404_page_subtitle', 'Page Unavailable!!', '2022-12-26 04:23:23', '2023-11-19 07:18:47'),
(173, 'error_404_page_paragraph', NULL, '2022-12-26 04:23:23', '2023-11-19 07:18:47'),
(174, 'error_404_page_button_text', 'Back To Home', '2022-12-26 04:23:23', '2023-11-19 07:18:47'),
(175, 'error_image', '80', '2022-12-26 04:23:23', '2023-11-19 07:18:47'),
(176, 'maintain_page_title', 'Sorry  we are down for schedule maintenance right now !!', '2022-12-26 05:51:02', '2022-12-26 05:51:02'),
(177, 'maintain_page_description', 'Sorry  we are down for schedule maintenance right now !!', '2022-12-26 05:51:02', '2022-12-26 05:51:02'),
(178, 'maintenance_duration', '2022-12-31', '2022-12-26 05:51:02', '2022-12-26 05:51:02'),
(179, 'maintain_page_logo', '10', '2022-12-26 05:51:02', '2022-12-26 05:51:02'),
(180, 'professional_title', 'Tell us what professional title describes you?', '2023-02-14 04:40:23', '2023-04-02 22:32:36'),
(181, 'intro_title', 'Provide an intro about yourself', '2023-02-14 04:40:23', '2023-04-02 22:32:36'),
(182, 'experience_title', 'Tell us about your professional experiences(Experience)', '2023-02-14 05:31:43', '2023-04-02 22:03:58'),
(183, 'inner_title', 'Experience', '2023-02-14 05:31:43', '2023-02-14 05:32:10'),
(184, 'modal_title', 'Add Work Experience', '2023-02-14 05:31:43', '2023-02-14 05:32:10'),
(185, 'edit_modal_title', 'Edit Work Experience', '2023-02-14 05:31:43', '2023-02-14 05:32:10'),
(186, 'experience_inner_title', 'Work experience', '2023-02-14 05:36:13', '2023-04-02 22:03:58'),
(187, 'experience_modal_title', 'Add work experience', '2023-02-14 05:36:13', '2023-04-02 22:03:58'),
(188, 'experience_edit_modal_title', 'Edit work experience', '2023-02-14 05:36:13', '2023-04-02 22:03:59'),
(189, 'education_title', 'What’s your Educational Background?(Education)', '2023-02-14 05:44:09', '2023-04-02 22:04:04'),
(190, 'education_inner_title', 'Education', '2023-02-14 05:44:09', '2023-04-02 22:04:04'),
(191, 'education_modal_title', 'Educational background', '2023-02-14 05:44:09', '2023-04-02 22:04:04'),
(192, 'education_edit_modal_title', 'Edit educational background', '2023-02-14 05:44:09', '2023-04-02 22:04:04'),
(193, 'work_title', 'What kinds of services will you provide to clients?(Work)', '2023-02-14 05:57:43', '2023-04-02 22:04:09'),
(194, 'work_inner_title', 'Choose, what would you do?', '2023-02-14 05:57:43', '2023-04-02 22:04:09'),
(195, 'work_modal_title', 'Choose a service', '2023-02-14 05:57:43', '2023-04-02 22:04:09'),
(196, 'skill_title', 'Great! Now add some skills you have', '2023-02-14 06:30:53', '2023-04-02 22:04:14'),
(197, 'hourly_rate', NULL, '2023-02-14 06:40:13', '2023-02-14 06:40:13'),
(198, 'profile_photo', NULL, '2023-02-14 06:40:13', '2023-02-14 06:40:13'),
(199, 'hourly_rate_title', 'What is your hourly rate?', '2023-02-14 06:41:09', '2023-04-02 22:04:19'),
(200, 'profile_photo_title', 'Upload profile photo', '2023-02-14 06:41:09', '2023-04-02 22:04:19'),
(201, 'account_page_title', 'Setup Your Account', '2023-02-14 22:59:23', '2023-04-02 22:04:24'),
(202, 'account_page_skip_title', 'Skip', '2023-02-14 22:59:23', '2023-04-02 22:04:24'),
(203, 'account_page_back_button_title', 'Back', '2023-02-14 22:59:23', '2023-04-02 22:04:24'),
(204, 'introduction_menu_title', 'Introduction', '2023-02-14 23:08:28', '2023-04-02 22:32:36'),
(205, 'introduction_menu_sub_title', 'How do you professionally introduce yourself?', '2023-02-14 23:08:28', '2023-04-02 22:32:36'),
(206, 'experience_menu_title', 'Experience', '2023-02-14 23:36:28', '2023-04-02 22:03:58'),
(207, 'experience_menu_sub_title', 'Let clients know about your professional experiences.', '2023-02-14 23:36:29', '2023-04-02 22:03:58'),
(208, 'education_menu_title', 'Education', '2023-02-14 23:36:50', '2023-04-02 22:04:04'),
(209, 'education_menu_sub_title', 'How do you professionally introduce yourself?', '2023-02-14 23:36:50', '2023-04-02 22:04:04'),
(210, 'work_menu_title', 'Work', '2023-02-14 23:37:33', '2023-04-02 22:04:09'),
(211, 'work_menu_sub_title', 'Add the services and necessary skills you offer.', '2023-02-14 23:37:33', '2023-04-02 22:04:09'),
(212, 'skill_menu_title', 'Skills', '2023-02-14 23:37:56', '2023-04-02 22:04:14'),
(213, 'skill_menu_sub_title', 'Add the services and necessary skills you offer.', '2023-02-14 23:37:56', '2023-04-02 22:04:14'),
(214, 'hourly_rate_menu_title', 'Hourly Rate & Photo', '2023-02-14 23:38:36', '2023-04-02 22:04:19'),
(215, 'hourly_rate_menu_sub_title', 'Just add your Hourly Rate and Profile Photo to finish.', '2023-02-14 23:38:36', '2023-04-02 22:04:19'),
(216, 'user_identity_verify_subject', 'User identity verify request email', '2023-02-16 02:31:58', '2023-02-16 02:32:15'),
(217, 'user_identity_verify_message', '<p>Hello,</p><p></p>You have a new request for user identity verification<p></p>', '2023-02-16 02:31:58', '2023-02-16 02:32:15'),
(218, 'user_info_update_subject', 'User Info Update Email', '2023-02-18 04:51:23', '2023-02-18 05:10:03'),
(219, 'user_info_update_message', '<p>Hello @name,\r\n</p><p>Your information successfully updated</p><p>Username: @username</p><p> Email: @email</p><p>\r\n</p>', '2023-02-18 04:51:23', '2023-02-18 05:10:03'),
(220, 'user_identity_verify_confirm_subject', 'User Identity Verify Confirm', '2023-02-20 01:38:44', '2023-02-20 01:38:44'),
(221, 'user_identity_verify_confirm_message', '<p>Hello @name,\r\n</p><p>Your identity verification successfully done. Now you are a verified user.\r\n</p><p>Username: @username\r\n</p><p>Email: @email</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', '2023-02-20 01:38:45', '2023-02-20 01:38:45'),
(222, 'user_identity_re_verify_subject', 'User Identity Reverification', '2023-02-20 02:10:13', '2023-02-20 02:10:13'),
(223, 'user_identity_re_verify_message', '<p>Hello @name,\r\n</p><p>Your identity need to reverification for the following reasons.</p><ul><li>Face issue</li><li>ID issue</li></ul><p>Username: @username\r\n</p><p>Email: @email</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', '2023-02-20 02:10:13', '2023-02-20 02:10:13'),
(224, 'user_identity_decline_subject', 'User Identity Decline', '2023-02-20 03:17:50', '2023-02-20 03:36:03'),
(225, 'user_identity_decline_message', '<p>Hello @name,\r\n</p><p>Your identity verification request decline for the bellow reasons</p><ul><li>&nbsp;image not si,ilar</li><li>number not match</li><li>email not match</li></ul><p>Username: @username\r\n</p><p>Email: @email</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', '2023-02-20 03:17:50', '2023-02-20 03:36:03'),
(226, 'user_password_change_subject', 'User Password Change Email', '2023-02-21 22:53:34', '2023-02-21 22:56:21'),
(227, 'user_password_change_message', '<p>Hello @name,\r\n</p><p>Your password has been changed.\r\n</p><p>New password : @password</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', '2023-02-21 22:53:34', '2023-02-21 22:56:21'),
(228, 'user_status_active_subject', 'User Status Activate Email', '2023-02-22 03:18:43', '2023-02-22 03:18:43'),
(229, 'user_status_active_message', '<p>Hello @name,\r\n</p><p>Your account status has been changed from inactive to active.</p><p>\r\n</p>', '2023-02-22 03:18:43', '2023-02-22 03:18:43'),
(230, 'user_status_inactive_subject', 'User Status Inactivate Email', '2023-02-22 03:22:20', '2023-02-22 03:22:20'),
(231, 'user_status_inactive_message', '<p>Hello @name,\r\n</p><p>Your account status has been changed from active to inactive due to multiple violations of our community guidelines.</p><ul><li>test text</li><li>test text</li><li>test text</li><li>test text</li></ul><p>\r\n</p>', '2023-02-22 03:22:20', '2023-02-22 03:22:20'),
(232, 'user_register_subject', 'New User Register Email', '2023-02-23 06:36:57', '2024-01-30 04:23:56'),
(233, 'user_register_message', '<p>Hello Admin,\r\n</p><p>New user just registered. Bello is the user details.</p><p><br></p><p>\r\n</p><p>Name : @name\r\n</p><p>Email: @email\r\n</p><p>Username: @username\r\n</p><p>User Type: @userType</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', '2023-02-23 06:36:57', '2024-01-30 04:23:56'),
(234, 'site_global_currency', 'USD', '2023-03-06 06:48:47', '2024-01-27 22:41:57'),
(235, 'enable_disable_decimal_point', NULL, '2023-03-06 07:51:22', '2023-04-12 00:04:54'),
(236, 'site_currency_symbol_position', 'left', '2023-03-06 07:51:22', '2023-04-12 00:04:54'),
(237, 'site_default_payment_gateway', 'paypal', '2023-03-06 07:51:22', '2023-04-12 00:04:54'),
(238, 'site_usd_to_idr_exchange_rate', '100', '2023-03-06 07:51:22', '2024-01-27 22:41:57'),
(239, 'site_usd_to_inr_exchange_rate', '100', '2023-03-06 07:51:22', '2024-01-27 22:41:57'),
(240, 'site_usd_to_ngn_exchange_rate', '100', '2023-03-06 07:51:22', '2024-01-27 22:41:57'),
(241, 'site_usd_to_zar_exchange_rate', '100', '2023-03-06 07:51:22', '2024-01-27 22:41:57'),
(242, 'site_usd_to_brl_exchange_rate', '100', '2023-03-06 07:51:22', '2024-01-27 22:41:57'),
(243, 'site_usd_to_myr_exchange_rate', '100', '2023-03-06 07:51:22', '2024-01-27 22:41:57'),
(244, '_2fa_disable_subject', 'Disable 2FA Email', '2023-03-25 00:36:36', '2023-03-25 00:36:36'),
(245, '_2fa_disable_message', '<p>Hello @name,<br><br>2 factor authentication successfully disable from your account.<br></p>', '2023-03-25 00:36:36', '2023-03-25 00:36:36'),
(246, 'user_email_verified_subject', 'User Email Verify', '2023-03-25 01:12:29', '2023-03-25 02:22:42'),
(247, 'user_email_verified_message', '<p>Hello @name,<br><br>Your email address successfully verified.<br></p>', '2023-03-25 01:12:29', '2023-03-25 02:22:42'),
(248, 'project_create_email_subject', 'Project Create Email', '2023-03-25 03:12:40', '2023-03-25 03:12:40'),
(249, 'project_create_email_message', '<p>Hello,<br><br>A new project is just created. Project ID: @project_id<br></p>', '2023-03-25 03:12:40', '2023-03-25 03:12:40'),
(250, 'project_approve_email_subject', 'Project Activate Email', '2023-03-25 03:41:43', '2023-03-28 02:12:13'),
(251, 'project_approve_email_message', '<p>Hello @name,<br><br>Your project successfully activate. Project ID: @project_id<br></p>', '2023-03-25 03:41:43', '2023-03-28 02:12:13'),
(252, 'project_decline_email_subject', 'Project Reject Email', '2023-03-25 03:50:42', '2023-03-28 02:27:42'),
(253, 'project_decline_email_message', '<p>Hello @name,<br><br>Your project has been rejected. Project ID: @project_id<br></p>', '2023-03-25 03:50:42', '2023-03-28 02:27:42'),
(254, 'project_edit_email_subject', 'Project Edit Email', '2023-03-26 21:55:46', '2023-03-26 21:55:46'),
(255, 'project_edit_email_message', '<p>Hello,\r\n</p><p>A project is just edited. Project ID: @project_id</p><p>\r\n</p>', '2023-03-26 21:55:46', '2023-03-26 21:55:46'),
(256, 'project_inactivate_email_subject', 'Project Inactivate Email', '2023-03-28 01:12:45', '2023-03-28 02:00:19'),
(257, 'project_inactivate_email_message', '<p>Hello @name,\r\n</p><p>Your project inactivate for the bellow reasons..... Project ID: @project_id</p><p>\r\n</p>', '2023-03-28 01:12:45', '2023-03-28 02:00:19'),
(258, 'login_page_title', 'Please login to continue', '2023-03-29 23:49:12', '2023-11-09 06:39:50'),
(259, 'login_page_button_title', 'Sign In Now', '2023-03-29 23:49:12', '2023-11-09 06:39:50'),
(260, 'login_page_sidebar_title', 'Xilancer Marketplace', '2023-03-29 23:49:12', '2023-11-09 06:39:50'),
(261, 'login_page_sidebar_description', 'Welcome, to xilancer marketplace. Here you can build a awesome career. Be a freelancer or you can post your job.', '2023-03-29 23:49:12', '2023-11-09 06:39:50'),
(262, 'login_page_social_login_enable_disable', 'on', '2023-03-29 23:49:12', '2023-11-09 06:39:50'),
(263, 'login_page_sidebar_image', '26', '2023-03-30 00:26:39', '2023-11-09 06:39:50'),
(264, 'register_page_title', 'Sign Up', '2023-03-30 01:27:49', '2023-11-25 05:53:06'),
(265, 'register_page_button_title', 'Sign Up Now', '2023-03-30 01:27:49', '2023-11-25 05:53:06'),
(266, 'register_page_sidebar_title', 'Register and start discover', '2023-03-30 01:27:49', '2023-11-25 05:53:06'),
(267, 'register_page_sidebar_description', 'Once register you will see the magic of xilancer marketplace.', '2023-03-30 01:27:49', '2023-11-25 05:53:06'),
(268, 'register_page_social_login_enable_disable', 'on', '2023-03-30 01:27:49', '2023-11-25 05:53:06'),
(269, 'register_page_sidebar_image', '26', '2023-03-30 01:27:49', '2023-11-25 05:53:06'),
(270, 'site_white_logo', '33', '2023-04-02 22:55:28', '2023-04-02 23:03:25'),
(271, 'manual_payment_preview_logo', '44', '2023-04-05 03:06:03', '2024-07-29 15:06:11'),
(272, 'site_manual_payment_name', 'Bank  Transfer', '2023-04-05 03:06:03', '2023-04-12 21:34:36'),
(273, 'manual_payment_test_mode', NULL, '2023-04-05 03:06:03', '2024-07-29 15:06:11'),
(274, 'user_deposit_to_wallet_subject', 'User Deposit Email', '2023-04-06 01:30:36', '2023-04-06 01:42:47'),
(275, 'user_deposit_to_wallet_message', '<p>Hello @name,<br><br>Your deposit to wallet successfully completed. Deposit ID: @deposit_id<br></p>', '2023-04-06 01:30:36', '2023-04-06 01:42:47'),
(276, 'user_deposit_to_wallet_subject_admin', 'User Deposit Email', '2023-04-06 01:31:53', '2023-04-06 01:42:41'),
(277, 'user_deposit_to_wallet_message_admin', '<p>Hello,<br></p><p>A user deposit to his wallet. Deposit ID: @deposit_id<br></p>', '2023-04-06 01:31:53', '2023-04-06 01:42:41'),
(278, 'deposit_amount_limitation_for_user', '500', '2023-04-08 23:01:49', '2024-07-29 12:58:24'),
(279, 'razorpay_test_mode', 'on', '2023-04-09 23:51:10', '2024-07-29 15:06:09'),
(280, 'stripe_test_mode', 'on', '2023-04-09 23:51:10', '2024-07-29 15:06:09'),
(281, 'paystack_test_mode', 'on', '2023-04-09 23:51:11', '2024-07-29 15:06:09'),
(282, 'mollie_test_mode', NULL, '2023-04-09 23:51:11', '2024-07-29 15:06:09'),
(283, 'flutterwave_test_mode', 'on', '2023-04-09 23:51:11', '2024-07-29 15:06:09'),
(284, 'payfast_test_mode', 'on', '2023-04-09 23:51:12', '2024-07-29 15:06:10'),
(285, 'marcadopago_client_id', 'TEST-0a3cc78a-57bf-4556-9dbe-2afa06347769', '2023-04-10 21:46:19', '2024-07-29 15:06:10'),
(286, 'marcadopago_client_secret', 'TEST-4644184554273630-070813-7d817e2ca1576e75884001d0755f8a7a-786499991', '2023-04-10 21:46:19', '2024-07-29 15:06:10'),
(287, 'toyyibpay_secrect_key', 'wnbtrqle-9t9l-m02j-e2bz-iaj2tkp52sfo', '2023-04-11 03:10:15', '2024-07-29 15:06:10'),
(288, 'toyyibpay_category_code', '0m0j9yc4', '2023-04-11 03:10:15', '2024-07-29 15:06:10'),
(289, 'toyyibpay_preview_logo', '53', '2023-04-11 03:10:15', '2024-07-29 15:06:10'),
(290, 'toyyibpay_gateway', 'on', '2023-04-11 03:10:15', '2024-07-29 15:06:10'),
(291, 'toyyibpay_test_mode', 'on', '2023-04-11 03:10:15', '2024-07-29 15:06:10'),
(292, 'pagali_page_id', NULL, '2023-04-11 03:53:41', '2024-07-29 15:06:10'),
(293, 'pagali_entity_id', NULL, '2023-04-11 03:53:41', '2024-07-29 15:06:10'),
(294, 'pagali_preview_logo', '54', '2023-04-11 03:53:41', '2024-07-29 15:06:10'),
(295, 'pagali_gateway', 'on', '2023-04-11 03:53:41', '2024-07-29 15:06:10'),
(296, 'pagali_test_mode', 'on', '2023-04-11 03:53:41', '2024-07-29 15:06:10'),
(297, 'authorize_dot_net_login_id', '2e8yjNL89kV2', '2023-04-11 22:24:12', '2024-07-29 15:06:10'),
(298, 'authorize_dot_net_transaction_id', '65968Gb3DU2ntX2v', '2023-04-11 22:24:12', '2024-07-29 15:06:10'),
(299, 'authorize_dot_net_preview_logo', '55', '2023-04-11 22:24:12', '2024-07-29 15:06:10'),
(300, 'authorize_dot_net_gateway', 'on', '2023-04-11 22:24:12', '2024-07-29 15:06:10'),
(301, 'authorize_dot_net_test_mode', 'on', '2023-04-11 22:24:12', '2024-07-29 15:06:10'),
(302, 'sitesway_brand_id', NULL, '2023-04-11 23:13:38', '2024-07-29 15:06:10'),
(303, 'sitesway_api_key', NULL, '2023-04-11 23:13:38', '2024-07-29 15:06:10'),
(304, 'sitesway_preview_logo', '56', '2023-04-11 23:13:38', '2024-07-29 15:06:10'),
(305, 'sitesway_gateway', 'on', '2023-04-11 23:13:38', '2024-07-29 15:06:10'),
(306, 'sitesway_test_mode', 'on', '2023-04-11 23:13:38', '2024-07-29 15:06:10'),
(307, 'manual_payment_gateway', 'on', '2023-04-12 22:12:04', '2024-07-29 15:06:11'),
(308, 'job_create_email_subject', 'Job Create Email', '2023-04-17 01:14:00', '2023-04-17 03:20:55'),
(309, 'job_create_email_message', '<p>Hello,</p><p><br></p><p>\r\n</p><p>A new job is just created. Job ID: @job_id</p><p>\r\n</p>', '2023-04-17 01:14:00', '2023-04-17 03:20:55'),
(310, 'job_edit_email_subject', 'Job Edit Email', '2023-04-17 01:42:31', '2023-04-17 01:42:53'),
(311, 'job_edit_email_message', '<p>Hello,</p><p>\r\n</p><p>A project is just edited. Job ID: @job_id</p><p>\r\n</p>', '2023-04-17 01:42:31', '2023-04-17 01:42:53'),
(312, 'job_approve_email_subject', 'Job Activate Email', '2023-04-17 02:02:00', '2023-04-17 02:13:30'),
(313, 'job_approve_email_message', '<p>Hello @name,</p><p><br></p><p>\r\n</p><p>Your job successfully activate. Job ID: @job_id</p><p>\r\n</p>', '2023-04-17 02:02:00', '2023-04-17 02:13:30'),
(314, 'job_inactivate_email_subject', 'Job Inactivate Email', '2023-04-17 02:09:25', '2023-04-17 02:09:30'),
(315, 'job_inactivate_email_message', '<p>Hello @name,\r\n</p><p>Your job inactivate for the bellow reasons..... Job ID: @job_id</p><p>\r\n</p>', '2023-04-17 02:09:25', '2023-04-17 02:09:30'),
(316, 'job_decline_email_subject', 'Job Decline Email', '2023-04-17 02:13:15', '2023-04-17 02:13:15'),
(317, 'job_decline_email_message', '<p>Hello @name,\r\n</p><p>Your job has been rejected. Job ID: @job_id</p><p>\r\n</p>', '2023-04-17 02:13:15', '2023-04-17 02:13:15'),
(318, 'site_tag_line', 'Freelance Services Marketplace', '2023-05-09 01:09:04', '2023-11-13 07:45:07'),
(319, 'home_page', '10', '2023-05-10 00:53:34', '2024-06-04 16:39:43'),
(320, 'user_subscription_purchase_subject', 'User Subscription Purchase Email', '2023-06-22 05:44:20', '2023-06-22 05:44:20'),
(321, 'user_subscription_purchase_message', '<p>Your subscription purchase successfully completed. Subscription ID: @subscription_id</p>', '2023-06-22 05:44:20', '2023-06-22 05:44:20'),
(322, 'user_subscription_purchase_admin_email_subject', 'User Subscription Purchase Email', '2023-06-22 05:46:20', '2023-06-22 05:46:20'),
(323, 'user_subscription_purchase_admin_email_message', '<p>A user just purchase a subscription. Subscription ID: @subscription_id</p>', '2023-06-22 05:46:20', '2023-06-22 05:46:20'),
(324, 'limit_settings', '2', '2023-06-24 01:29:25', '2023-07-06 04:01:20'),
(325, 'manual_subscription_complete_subject', 'Subscription Manual Payment Complete', '2023-06-26 01:16:35', '2023-07-04 03:55:16'),
(326, 'manual_subscription_complete_message', '<p>Hello @name,\r\n</p><p>Your manual subscription payment status successfully changed from pending to complete. Subscription ID: @subscription_id</p><p>\r\n</p>', '2023-06-26 01:16:35', '2023-07-04 03:55:16'),
(327, 'manual_subscription_pending_subject', 'Subscription Manual Payment Pending Email', '2023-06-26 01:17:48', '2023-06-26 01:17:48'),
(328, 'manual_subscription_pending_message', '<p>Hello @name,\r\n</p><p>Your manual subscription payment status changed from complete to pending. Subscription ID: @subscription_id</p><p>\r\n</p>', '2023-06-26 01:17:48', '2023-06-26 01:17:48'),
(329, 'manual_subscription_complete_subject_to_admin', 'Subscription Manual Payment Complete', '2023-07-04 03:59:45', '2023-07-04 03:59:52'),
(330, 'manual_subscription_complete_message_to_admin', '<p>Hello admin,\r\n</p><p>A manual subscription payment status successfully changed from pending to complete. Subscription ID: @subscription_id</p><p>\r\n</p><p>\r\n</p>', '2023-07-04 03:59:46', '2023-07-04 03:59:52'),
(331, 'subscription_active_subject', 'Subscription Active', '2023-07-04 05:28:01', '2023-07-04 05:28:42'),
(332, 'subscription_active_message', '<p>Hello @name,\r\n</p><p>Your subscription status changed from inactive to active. Subscription ID: @subscription_id</p><p>\r\n</p>', '2023-07-04 05:28:01', '2023-07-04 05:28:42'),
(333, 'subscription_inactive_subject', 'Subscription Inactive', '2023-07-04 05:29:31', '2023-07-04 05:29:31'),
(334, 'subscription_inactive_message', '<p>Hello @name,\r\n</p><p>Your subscription status changed from active to inactive. Subscription ID: @subscription_id</p><p>\r\n</p>', '2023-07-04 05:29:31', '2023-07-04 05:29:31'),
(353, 'admin_commission_type', 'percentage', '2023-07-11 01:37:44', '2023-07-11 01:37:44'),
(354, 'admin_commission_charge', '21', '2023-07-11 01:37:44', '2023-07-11 01:37:44'),
(359, 'transaction_fee_type', 'percentage', '2023-07-12 01:19:22', '2023-07-27 00:29:56'),
(360, 'transaction_fee_charge', '2', '2023-07-12 01:19:22', '2023-07-27 00:29:57'),
(361, 'order_hold_subject', 'Hold Order', '2023-08-22 00:39:06', '2023-08-22 06:48:43'),
(362, 'order_hold_message', '<p>Hello @name,</p><p><br></p><p>Your order has been hold .... contact with support team</p><p><br></p><p>Order Id: #@order_id</p>', '2023-08-22 00:39:06', '2023-08-22 06:48:43'),
(363, 'order_unhold_subject', 'Unhold Order', '2023-08-22 00:40:04', '2023-08-22 01:24:20'),
(364, 'order_unhold_message', '<p>Hello @name;\r\n</p><p>Your order has been Unhold ....</p><p><br></p><p>Order Id: #@order_id</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', '2023-08-22 00:40:04', '2023-08-22 01:24:21'),
(365, 'account_active_subject', 'Account Active', '2023-08-22 03:55:06', '2023-08-22 06:48:19'),
(366, 'account_active_message', '<p>Hello @name,</p><p><br></p><p>Your account has been active......</p>', '2023-08-22 03:55:06', '2023-08-22 06:48:19'),
(367, 'account_suspend_subject', 'Account Suspend', '2023-08-22 03:55:23', '2023-08-22 06:48:24'),
(368, 'account_suspend_message', '<p>Hello @name,</p><p><br></p><p>Your account has been suspended......</p>', '2023-08-22 03:55:23', '2023-08-22 06:48:24'),
(369, 'account_unsuspend_subject', 'Account Active', '2023-08-24 04:10:00', '2023-08-24 04:10:00'),
(370, 'account_unsuspend_message', '<p>Hello @name,\r\n</p><p>Your account has been unsuspend form suspend......</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', '2023-08-24 04:10:00', '2023-08-24 04:10:00'),
(371, 'order_manual_payment_complete_subject', 'Order Manual Payment Complete', '2023-08-24 07:30:11', '2023-08-24 07:30:11'),
(372, 'order_manual_payment_complete_message', '<p>Hello @name,</p><p><br></p><p>\r\n</p><p>Your order payment has been updated from pending to complete.</p><p><br></p><p>\r\n</p><p>Order Id: #@order_id</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', '2023-08-24 07:30:11', '2023-08-24 07:30:11'),
(373, 'support_ticket_subject', 'Support Ticket', '2023-08-27 06:59:20', '2023-08-27 07:08:12'),
(374, 'support_ticket_message', '<p>Hello @name,</p><p><br></p><p>You have a new ticket</p><p><br></p><p>Ticket ID: #@ticket_id</p>', '2023-08-27 06:59:20', '2023-08-27 07:08:12'),
(375, 'support_ticket_message_email_subject', 'Support Ticket Message Email', '2023-08-29 04:57:15', '2023-08-29 04:57:15'),
(376, 'support_ticket_message_email_message', '<p>Hello @name,</p><p><br></p><p>You have a new message for the bellow ticket</p><p><br></p><p>Ticket ID : #@ticket_id</p>', '2023-08-29 04:57:15', '2023-08-29 04:57:15'),
(377, 'job_auto_approval', 'yes', '2023-09-20 05:50:29', '2023-10-04 04:11:52'),
(378, 'withdraw_amount_limitation_for_user', '50', '2023-10-15 05:09:35', '2023-10-15 05:09:35'),
(379, 'minimum_withdraw_amount', '50', '2023-10-15 05:28:40', '2023-10-17 03:47:28'),
(380, 'maximum_withdraw_amount', '500', '2023-10-15 05:28:40', '2023-10-17 03:47:28'),
(381, 'withdraw_fee', '5', '2023-10-16 23:47:35', '2023-10-16 23:47:35'),
(382, 'register_subscription', '10', '2023-11-06 04:35:25', '2023-11-06 04:35:25'),
(383, 'main_color_one', '#6176f6', '2023-11-15 04:32:16', '2023-11-23 00:10:41'),
(384, 'main_color_two', NULL, '2023-11-15 04:32:16', '2023-11-23 00:10:41'),
(385, 'secondary_color', '#ffa500', '2023-11-15 04:32:16', '2023-11-23 00:10:41'),
(386, 'paragraph_color', '#475467', '2023-11-15 04:32:16', '2023-11-23 00:10:41'),
(387, 'body_color', '#667085', '2023-11-15 04:32:16', '2023-11-23 00:10:41'),
(388, 'site_script_version', '2.9.0', '2023-12-18 14:01:27', '2023-12-18 14:01:30'),
(389, 'iyzipay_secret_key', 'sandbox-QsgXTUpizlCZzHaypMJwkL8YTMGsYMBM', '2023-12-27 07:40:33', '2024-07-29 15:06:10'),
(390, 'iyzipay_api_key', 'sandbox-QsgXTUpizlCZzHaypMJwkL8YTMGsYMBM', '2023-12-27 07:40:33', '2024-07-29 15:06:10'),
(391, 'iyzipay_preview_logo', '125', '2023-12-27 07:40:33', '2024-07-29 15:06:11'),
(392, 'iyzipay_gateway', 'on', '2023-12-27 07:40:33', '2024-07-29 15:06:11'),
(393, 'iyzipay_test_mode', 'on', '2023-12-27 07:40:33', '2024-07-29 15:06:11'),
(394, 'site_manual_payment_description', NULL, '2023-12-27 07:40:33', '2024-07-29 15:06:11'),
(395, 'job_enable_disable', 'enable', '2024-01-17 06:35:58', '2024-01-17 07:34:50'),
(396, 'project_enable_disable', 'enable', '2024-01-17 07:07:23', '2024-01-17 07:35:07'),
(397, 'captcha_status', 'on', '2024-01-27 06:46:42', '2024-01-27 06:46:42'),
(398, 'site_bgn_to_usd_exchange_rate', NULL, '2024-01-27 09:02:54', '2024-01-27 09:03:21'),
(399, 'site_bgn_to_idr_exchange_rate', NULL, '2024-01-27 09:02:54', '2024-01-27 09:03:21'),
(400, 'site_bgn_to_inr_exchange_rate', NULL, '2024-01-27 09:02:54', '2024-01-27 09:03:21'),
(401, 'site_bgn_to_ngn_exchange_rate', NULL, '2024-01-27 09:02:54', '2024-01-27 09:03:21'),
(402, 'site_bgn_to_zar_exchange_rate', NULL, '2024-01-27 09:02:54', '2024-01-27 09:03:21'),
(403, 'site_bgn_to_brl_exchange_rate', NULL, '2024-01-27 09:02:54', '2024-01-27 09:03:21'),
(404, 'site_bgn_to_myr_exchange_rate', NULL, '2024-01-27 09:02:54', '2024-01-27 09:03:21'),
(405, 'site_usd_to_usd_exchange_rate', '100', '2024-01-27 22:41:10', '2024-01-27 22:41:57'),
(406, 'user_register_welcome_subject', 'User Register Welcome Email', '2024-01-30 03:58:20', '2024-01-30 03:58:20'),
(407, 'user_register_welcome_message', '<p>Hello @name,\r\n</p><p>Your registration successfully completed. Below is your account details.</p><p><br></p><p>\r\n</p><p>Name : @name\r\n</p><p>Email: @email\r\n</p><p>Username: @username\r\n</p><p>Password : @password\r\n</p><p>User Type: @userType</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', '2024-01-30 03:58:20', '2024-01-30 03:58:20'),
(408, 'manual_payment_gateway_name', NULL, '2024-03-10 15:58:06', '2024-07-29 15:06:11'),
(409, 'profile_page_badge_settings', 'enable', '2024-06-04 08:33:21', '2024-06-04 08:44:11'),
(410, 'recaptcha_site_key', '6LdsrfEpAAAAAO6kajZpCjiq-ppcVJFHoCUhAHXx', '2024-06-12 11:08:11', '2024-06-12 11:08:11'),
(411, 'recaptcha_secret_key', '6LdsrfEpAAAAAEpQ58fvbmvzN1DuUnfDXnBZJcSr', '2024-06-12 11:08:11', '2024-06-12 11:08:11'),
(412, 'subscription_enable_disable', 'enable', '2024-06-12 11:15:39', '2024-06-12 11:16:19'),
(413, 'kineticpay_gateway', 'on', '2024-07-29 15:05:12', '2024-07-29 15:06:11'),
(414, 'kineticpay_test_mode', 'on', '2024-07-29 15:05:12', '2024-07-29 15:06:11'),
(415, 'kineticpay_merchant_key', 'ede1c5e9f81c9d12bf418629f56a7870', '2024-07-29 15:05:12', '2024-07-29 15:06:11'),
(416, 'kineticpay_preview_logo', '146', '2024-07-29 15:05:12', '2024-07-29 15:06:11'),
(417, 'awdpay_gateway', 'on', '2024-07-29 15:05:12', '2024-07-29 15:06:11'),
(418, 'awdpay_test_mode', 'on', '2024-07-29 15:05:12', '2024-07-29 15:06:11'),
(419, 'awdpay_private_key', NULL, '2024-07-29 15:05:12', '2024-07-29 15:06:11'),
(420, 'awdpay_preview_logo', '147', '2024-07-29 15:05:12', '2024-07-29 15:06:11'),
(421, 'awdpay_logo_url', 'https://www.awdpay.com/api/public/image-1649803735945-214296083.png', '2024-07-29 15:05:12', '2024-07-29 15:06:11');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `subscription_type_id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `limit` bigint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-active, 0-inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `subscription_type_id`, `title`, `logo`, `price`, `limit`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Standard', '113', 20, 100, 0, '2023-05-01 22:45:15', '2023-11-28 06:12:12'),
(2, 2, 'Standard', '112', 110, 60, 1, '2023-05-02 00:21:17', '2023-11-28 06:12:04'),
(3, 1, 'Starter', '111', 30, 5, 1, '2023-05-02 00:23:11', '2023-11-27 05:07:44'),
(4, 2, 'Starter', '57', 100, 50, 0, '2023-05-02 03:29:33', '2023-11-08 04:59:30'),
(5, 2, 'Professional', '114', 150, 100, 1, '2023-06-13 23:06:27', '2023-11-27 05:06:09'),
(6, 1, 'Professional', '115', 50, 10, 1, '2023-06-13 23:10:38', '2023-11-27 05:06:57'),
(7, 1, 'Professional Plus', '113', 60, 23, 0, '2023-06-13 23:11:55', '2023-11-28 06:24:17'),
(8, 3, 'Nano Offer', '57', 10, 5, 0, '2023-06-13 23:13:30', '2023-11-08 06:09:17'),
(9, 3, 'Micro Offer', '114', 20, 10, 1, '2023-06-13 23:17:56', '2023-11-28 06:24:44'),
(10, 5, 'Free', '112', 12, 20, 1, '2023-08-19 06:57:07', '2023-11-27 05:04:47');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_features`
--

CREATE TABLE `subscription_features` (
  `id` bigint UNSIGNED NOT NULL,
  `subscription_id` bigint NOT NULL,
  `feature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_features`
--

INSERT INTO `subscription_features` (`id`, `subscription_id`, `feature`, `status`, `created_at`, `updated_at`) VALUES
(293, 4, 'Yearly useable', 'on', '2023-11-08 04:59:30', '2023-11-08 04:59:30'),
(294, 4, 'Support', 'on', '2023-11-08 04:59:30', '2023-11-08 04:59:30'),
(295, 4, 'Very professional', 'on', '2023-11-08 04:59:30', '2023-11-08 04:59:30'),
(296, 4, 'Easy Access', 'on', '2023-11-08 04:59:30', '2023-11-08 04:59:30'),
(297, 4, 'New policy remove', 'on', '2023-11-08 04:59:30', '2023-11-08 04:59:30'),
(298, 4, 'Lifetime', 'off', '2023-11-08 04:59:30', '2023-11-08 04:59:30'),
(299, 4, 'Less use', 'off', '2023-11-08 04:59:30', '2023-11-08 04:59:30'),
(356, 8, 'Connect 5', 'on', '2023-11-08 06:09:17', '2023-11-08 06:09:17'),
(357, 8, 'Weekly', 'on', '2023-11-08 06:09:17', '2023-11-08 06:09:17'),
(358, 8, 'Less feature', 'on', '2023-11-08 06:09:17', '2023-11-08 06:09:17'),
(359, 8, 'New feature', 'on', '2023-11-08 06:09:17', '2023-11-08 06:09:17'),
(360, 8, 'Support system', 'on', '2023-11-08 06:09:17', '2023-11-08 06:09:17'),
(361, 8, 'No drawback', 'on', '2023-11-08 06:09:17', '2023-11-08 06:09:17'),
(362, 8, 'Professional', 'on', '2023-11-08 06:09:17', '2023-11-08 06:09:17'),
(384, 10, 'Free for first time', 'on', '2023-11-27 05:04:47', '2023-11-27 05:04:47'),
(385, 10, 'Get while register', 'on', '2023-11-27 05:04:47', '2023-11-27 05:04:47'),
(386, 10, 'Must register as a freelancer', 'on', '2023-11-27 05:04:47', '2023-11-27 05:04:47'),
(387, 10, 'One time get', 'on', '2023-11-27 05:04:47', '2023-11-27 05:04:47'),
(388, 10, 'Use for job proposal', 'on', '2023-11-27 05:04:47', '2023-11-27 05:04:47'),
(389, 10, 'Get only once', 'on', '2023-11-27 05:04:47', '2023-11-27 05:04:47'),
(390, 10, 'Totally Free', 'on', '2023-11-27 05:04:47', '2023-11-27 05:04:47'),
(391, 7, 'Connect 23', 'on', '2023-11-27 05:05:37', '2023-11-27 05:05:37'),
(392, 7, 'Professional', 'on', '2023-11-27 05:05:37', '2023-11-27 05:05:37'),
(393, 7, 'Monthly support', 'on', '2023-11-27 05:05:37', '2023-11-27 05:05:37'),
(394, 7, 'Features', 'on', '2023-11-27 05:05:37', '2023-11-27 05:05:37'),
(395, 7, 'New way', 'on', '2023-11-27 05:05:37', '2023-11-27 05:05:37'),
(396, 7, 'Long term', 'on', '2023-11-27 05:05:37', '2023-11-27 05:05:37'),
(397, 7, 'Usefull', 'on', '2023-11-27 05:05:37', '2023-11-27 05:05:37'),
(398, 5, 'Connect 100', 'on', '2023-11-27 05:06:09', '2023-11-27 05:06:09'),
(399, 5, 'Yearly system', 'on', '2023-11-27 05:06:09', '2023-11-27 05:06:09'),
(400, 5, 'Less use', 'on', '2023-11-27 05:06:09', '2023-11-27 05:06:09'),
(401, 5, 'Professional', 'on', '2023-11-27 05:06:09', '2023-11-27 05:06:09'),
(402, 5, 'One time get', 'on', '2023-11-27 05:06:09', '2023-11-27 05:06:09'),
(403, 5, 'Monthly support', 'on', '2023-11-27 05:06:09', '2023-11-27 05:06:09'),
(404, 5, 'New policy', 'on', '2023-11-27 05:06:09', '2023-11-27 05:06:09'),
(405, 6, 'Connect 10', 'on', '2023-11-27 05:06:57', '2023-11-27 05:06:57'),
(406, 6, 'Monthly support', 'on', '2023-11-27 05:06:57', '2023-11-27 05:06:57'),
(407, 6, 'Professional', 'on', '2023-11-27 05:06:57', '2023-11-27 05:06:57'),
(408, 6, 'List type', 'on', '2023-11-27 05:06:57', '2023-11-27 05:06:57'),
(409, 6, 'New feature', 'on', '2023-11-27 05:06:57', '2023-11-27 05:06:57'),
(410, 6, 'Long term', 'on', '2023-11-27 05:06:57', '2023-11-27 05:06:57'),
(411, 6, 'Healthy usecase', 'on', '2023-11-27 05:06:57', '2023-11-27 05:06:57'),
(412, 3, 'Monthly support', 'on', '2023-11-27 05:07:44', '2023-11-27 05:07:44'),
(413, 3, 'Lifetime', 'on', '2023-11-27 05:07:44', '2023-11-27 05:07:44'),
(414, 3, 'Professional', 'on', '2023-11-27 05:07:44', '2023-11-27 05:07:44'),
(415, 3, 'Long term', 'off', '2023-11-27 05:07:44', '2023-11-27 05:07:44'),
(416, 3, 'New feature', 'off', '2023-11-27 05:07:44', '2023-11-27 05:07:44'),
(417, 3, 'Unlimited validity', 'off', '2023-11-27 05:07:44', '2023-11-27 05:07:44'),
(418, 3, 'All Time', 'off', '2023-11-27 05:07:44', '2023-11-27 05:07:44'),
(419, 1, 'Month wise', 'on', '2023-11-27 05:08:18', '2023-11-27 05:08:18'),
(420, 1, 'Get more connect', 'on', '2023-11-27 05:08:18', '2023-11-27 05:08:18'),
(421, 1, 'Multiple use', 'on', '2023-11-27 05:08:18', '2023-11-27 05:08:18'),
(422, 1, 'Multi connect', 'on', '2023-11-27 05:08:18', '2023-11-27 05:08:18'),
(423, 1, 'Professional use', 'on', '2023-11-27 05:08:18', '2023-11-27 05:08:18'),
(424, 1, 'Month wise', 'off', '2023-11-27 05:08:18', '2023-11-27 05:08:18'),
(425, 1, 'Lifetime support', 'off', '2023-11-27 05:08:18', '2023-11-27 05:08:18'),
(426, 2, 'Yearly system', 'on', '2023-11-27 05:08:43', '2023-11-27 05:08:43'),
(427, 2, 'Professional', 'on', '2023-11-27 05:08:43', '2023-11-27 05:08:43'),
(428, 2, 'Usefull', 'on', '2023-11-27 05:08:43', '2023-11-27 05:08:43'),
(429, 2, 'Less price', 'on', '2023-11-27 05:08:43', '2023-11-27 05:08:43'),
(430, 2, 'Low cost', 'on', '2023-11-27 05:08:43', '2023-11-27 05:08:43'),
(431, 2, 'Reasonable', 'off', '2023-11-27 05:08:43', '2023-11-27 05:08:43'),
(432, 2, 'Lifetime', 'off', '2023-11-27 05:08:43', '2023-11-27 05:08:43'),
(440, 9, 'Connect 10', 'on', '2023-11-28 06:24:44', '2023-11-28 06:24:44'),
(441, 9, 'Weekly 2', 'on', '2023-11-28 06:24:44', '2023-11-28 06:24:44'),
(442, 9, 'Limit 10', 'on', '2023-11-28 06:24:44', '2023-11-28 06:24:44'),
(443, 9, 'Professional', 'on', '2023-11-28 06:24:44', '2023-11-28 06:24:44'),
(444, 9, 'Supported', 'on', '2023-11-28 06:24:44', '2023-11-28 06:24:44'),
(445, 9, 'Less use', 'on', '2023-11-28 06:24:44', '2023-11-28 06:24:44'),
(446, 9, 'Welcome feature', 'off', '2023-11-28 06:24:44', '2023-11-28 06:24:44');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_types`
--

CREATE TABLE `subscription_types` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `validity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_types`
--

INSERT INTO `subscription_types` (`id`, `type`, `validity`, `created_at`, `updated_at`) VALUES
(1, 'Monthly', 30, '2023-04-30 06:39:12', '2023-06-13 00:11:48'),
(2, 'Yearly', 365, '2023-04-30 06:39:24', '2023-06-13 00:11:36'),
(3, 'Weekly', 7, '2023-06-13 00:13:12', '2023-06-13 00:13:12'),
(5, 'Free', 30, '2023-08-19 06:56:31', '2023-11-06 05:04:26');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `sub_category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `category_id` bigint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0=inactive 1=active',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `sub_category`, `short_description`, `slug`, `meta_title`, `meta_description`, `category_id`, `status`, `image`, `created_at`, `updated_at`) VALUES
(1, 'UI/UX Design', 'This category descrips financial ui-ux design', 'uiux-design', 'This category descrips financial ui-ux design', 'This category descrips financial ui-ux design', 1, 1, NULL, '2023-02-07 06:00:14', '2024-06-12 11:14:22'),
(2, 'Graphic Design', 'This category descrips financial graphic design', 'graphic-design', NULL, NULL, 1, 1, NULL, '2023-02-07 06:00:23', '2023-05-15 00:25:33'),
(3, 'Wordpress', 'This category related to wordpres development', 'wordpress', NULL, NULL, 2, 1, '69', '2023-02-07 22:28:02', '2023-11-05 00:17:38'),
(5, 'Flutter Development', 'This category descrips financial flutter development', 'flutter-development', NULL, NULL, 4, 1, NULL, '2023-02-07 22:28:28', '2023-05-15 00:23:43'),
(6, 'Android Development', 'This category descrips financial android development', 'android-development', NULL, NULL, 4, 1, NULL, '2023-02-07 22:28:43', '2023-05-15 00:22:58'),
(7, 'ios Development', 'This category descrips financial operations ios development', 'ios-development', NULL, NULL, 4, 1, NULL, '2023-02-07 22:28:55', '2023-05-15 00:21:20'),
(8, 'Kotlin Development', 'This category descrips financial kotlin development', 'kotlin-development', NULL, NULL, 4, 1, NULL, '2023-02-07 22:29:07', '2023-05-15 00:20:39'),
(20, 'Php Developer', 'This category descrips php developer', 'php-developer', NULL, NULL, 2, 1, '7', '2023-02-08 22:49:10', '2023-05-15 00:15:19'),
(21, 'Frontend Developer', 'This category descrips frontend developer', 'frontend-developer', NULL, NULL, 2, 1, NULL, '2023-02-08 23:02:13', '2023-05-15 00:15:05'),
(22, 'Backend Developer', 'This category descrips backend developer', 'backend-developer', NULL, NULL, 2, 1, NULL, '2023-02-08 23:02:39', '2023-05-15 00:14:47'),
(24, 'Website Design', 'This category describes html templates design.', 'website-design', NULL, NULL, 1, 1, '69', '2023-05-15 23:54:28', '2023-11-05 03:09:25'),
(26, 'Content Writing', 'This category descrips wordpress templates design', 'content-writing', NULL, NULL, 13, 1, NULL, '2023-05-17 06:51:34', '2023-05-05 06:51:34'),
(29, 'Search Engine Optimization (SEO)', 'Seo', 'search-engine-optimization--seo-', NULL, NULL, 11, 1, '77', '2023-11-05 05:21:43', '2023-11-05 05:21:43'),
(30, 'Branding', 'branding', 'branding', NULL, NULL, 11, 1, '77', '2023-11-05 05:41:56', '2023-11-05 05:41:56'),
(31, 'Website Content', 'Website Content', 'website-content', NULL, NULL, 13, 1, '77', '2023-11-05 06:23:45', '2023-11-05 06:23:45'),
(32, 'Article and Blog Post', 'Article and Blog Post', 'article-and-blog-post', NULL, NULL, 13, 1, '69', '2023-11-05 06:24:27', '2023-11-05 06:24:27'),
(33, 'Script Writing', 'Script Writing', 'script-writing', NULL, NULL, 13, 1, '67', '2023-11-05 06:25:42', '2023-11-05 06:25:42'),
(34, 'Social Media Marketing', 'Social Media Marketing', 'social-media-marketing', NULL, NULL, 11, 1, '66', '2023-11-05 06:26:26', '2023-11-05 06:26:26'),
(35, 'Market Research', 'Market Research', 'market-research', NULL, NULL, 9, 1, NULL, '2023-11-06 00:45:03', '2023-11-06 00:45:03'),
(36, 'Virtual Assistance', 'Virtual Assistance', 'virtual-assistance', NULL, NULL, 3, 1, NULL, '2023-11-06 00:51:44', '2023-11-06 00:51:44'),
(37, 'IELTS', 'ielts', 'ielts', NULL, NULL, 5, 1, NULL, '2023-11-06 01:20:41', '2023-11-06 01:20:41');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `department_id` bigint NOT NULL,
  `admin_id` bigint DEFAULT NULL,
  `client_id` bigint DEFAULT NULL,
  `freelancer_id` bigint DEFAULT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `priority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `via` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'admin, client, freelancer',
  `operating_system` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hourly_rate` double NOT NULL DEFAULT '0',
  `experience_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'junior',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint DEFAULT NULL,
  `state_id` bigint DEFAULT NULL,
  `city_id` bigint DEFAULT NULL,
  `user_type` tinyint NOT NULL DEFAULT '0' COMMENT '1:client, 2:freelancer',
  `check_online_status` timestamp NULL DEFAULT NULL,
  `check_work_availability` tinyint NOT NULL DEFAULT '1',
  `user_active_inactive_status` tinyint NOT NULL DEFAULT '1' COMMENT '0:inactive, 1:active',
  `user_verified_status` tinyint NOT NULL DEFAULT '0' COMMENT '0:not verified, 1:verified',
  `is_suspend` tinyint NOT NULL DEFAULT '0' COMMENT '0=no , 1=yes',
  `terms_condition` int NOT NULL DEFAULT '1',
  `about` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_email_verified` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0: not verified, 1:verified',
  `google_2fa_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_2fa_enable_disable_disable` tinyint NOT NULL DEFAULT '0' COMMENT '0=disable 1=enable',
  `google_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apple_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_pro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_expire_date` timestamp NULL DEFAULT NULL,
  `email_verify_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `firebase_device_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `freeze_withdraw` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `freeze_project` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `freeze_job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `freeze_chat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `freeze_order_create` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `load_from` int NOT NULL DEFAULT '0',
  `is_synced` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `hourly_rate`, `experience_level`, `email`, `phone`, `username`, `password`, `image`, `country_id`, `state_id`, `city_id`, `user_type`, `check_online_status`, `check_work_availability`, `user_active_inactive_status`, `user_verified_status`, `is_suspend`, `terms_condition`, `about`, `is_email_verified`, `google_2fa_secret`, `google_2fa_enable_disable_disable`, `google_id`, `facebook_id`, `github_id`, `apple_id`, `is_pro`, `pro_expire_date`, `email_verify_token`, `firebase_device_token`, `freeze_withdraw`, `freeze_project`, `freeze_job`, `freeze_chat`, `freeze_order_create`, `email_verified_at`, `remember_token`, `load_from`, `is_synced`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Andrew', 'Fateh', 0, 'junior', 'tclient@gmail.com', '6546463544645', 'client', '$2y$10$dVn7Zka2IxHQeXYRCe/GweDPW7wqxjwT2qycATvIcLh3fg20i5z0W', '1680500462-642a66ee548e7.jpg', 1, 1, 1, 1, '2024-09-03 04:19:24', 1, 1, 1, 0, 1, NULL, '1', 'HATKCPGN5WGPJEFU', 0, NULL, NULL, NULL, NULL, NULL, NULL, '876626', 'fAQc-spzRCWHmomBpIeoFc:APA91bHg3GWjxtRVB2MbbXclQkTIyTlyKoMnGNtn-HDy3Cs12y5RtSbxwknPiVKeQS3i9k1d4T9fLGnjWBzttx_oDz_qfh-WtC_L-cMvyJChzAwn3mA-Z9S6fHXJAuOJolFiQ94ik-iD', NULL, NULL, 'unfreeze', 'unfreeze', 'unfreeze', NULL, NULL, 0, 0, '2023-01-23 06:03:28', '2024-09-03 04:19:24', NULL),
(2, 'Istiak', 'Ahmed', 0, 'junior', 'istiak@gmail.com', '0172873763', 'istiak', '$2y$10$dVn7Zka2IxHQeXYRCe/GweDPW7wqxjwT2qycATvIcLh3fg20i5z0W', NULL, 1, 1, 1, 1, '2024-06-04 09:41:23', 1, 1, 0, 0, 1, NULL, '1', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '374933', NULL, NULL, NULL, NULL, 'unfreeze', NULL, NULL, NULL, 0, 0, '2023-01-23 23:35:32', '2024-06-04 09:41:37', NULL),
(3, 'Patrick', 'Donaldson', 0, 'junior', 'loji@mailinator.com', '+1 (569) 294-6165', 'tydax', '$2y$10$H.C3BMHTi1VQExe8kOwo2.qUmtr33JCNK2v/nKOTa9OIspafWawOq', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 0, 0, 1, NULL, '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '242413', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2023-01-23 23:38:58', '2023-01-23 23:38:58', NULL),
(4, 'Lynn', 'Wiggins', 0, 'junior', 'xyrokuzifo@mailinator.com', '+1 (176) 464-7465', 'gexywy', '$2y$10$K6TDsOkHxpIdZ58rcJPvaeDfNKynXuO9OmbrQZtoGT/URy81/RSkS', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 0, 0, 1, NULL, '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '167949', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2023-01-23 23:41:36', '2023-10-21 04:46:21', '2023-10-21 04:46:21'),
(5, 'Anthony', 'Obrien', 0, 'junior', 'dapylywivi@mailinator.com', '+1 (201) 841-6695', 'bysine', '$2y$10$7.skChO4jVIfxl/OO7ncX.A6mcssBqpunOyHbVmTMPxzhojRv72lK', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 0, 0, 1, NULL, '1', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '743311', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2023-01-23 23:49:57', '2023-02-20 03:52:59', NULL),
(6, 'Chester', 'Bruce', 0, 'junior', 'rycuz@mailinator.com', '+1 (629) 458-5067', 'tfreelancer2', '$2y$10$Ie0lyMggV7YeWQcdh.iT/ugJPFjIvrz8DBJCpHK3s6a8eaA70/286', NULL, NULL, NULL, NULL, 2, NULL, 1, 1, 0, 0, 1, NULL, '1', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '533428', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2023-01-24 04:41:22', '2023-02-22 23:27:05', NULL),
(7, 'William', 'Montag', 30, 'senior', 'ali.abdulah.sd@gmail.com', '6546463544645', 'freelancer', '$2y$10$qIx2SM3faeDLL.Mv3.OrsuqZD5iP6oEvWe3OUizm5yQ5xGxQmtbq2', '1713787258-6626517ab5fb3.png', 11, 20, 1, 2, '2024-09-03 07:50:16', 1, 1, 1, 0, 1, NULL, '1', 'SOVLAM7IWRWHZX23', 0, NULL, NULL, NULL, NULL, 'yes', '2024-10-06 15:24:12', '531787', 'e3ZOsBbpRb2YFfbRrb8v3W:APA91bGE8OuEg3qyzYQr3HxJDLbDXc0p0a6QA9JQM0bgdb4PPpiG93bKFCNA2W47jfMmlRAN0lf6a8KP8jYNXRaFxHZqtD7CFQSqy424z-huEGOD7xKQGoFOcOpAilor4ZynP8_589lr', 'unfreeze', 'unfreeze', NULL, 'unfreeze', NULL, NULL, NULL, 0, 0, '2023-01-24 04:58:46', '2024-09-03 07:50:16', NULL),
(8, 'Ryan', 'Wayne', 20, 'junior', 'riad@gmail.com', '01711111111', 'riad', '$2y$10$sXCk0xU6shlnk8QuJWvmSeca/vDULwFCOgKQP68TyPIbObo7cIFWa', '1716788457-66541ce90456c.jpg', 2, 16, 2, 2, '2024-05-25 08:34:12', 1, 1, 1, 0, 1, NULL, '1', NULL, 0, NULL, NULL, NULL, NULL, 'yes', '2024-10-06 15:44:08', '525550', 'fJF8CvUVTIG5RNHgomtaOz:APA91bEHpv7jMahHx0vzMs7eZXC1Fje-1THGpgeGi57SJdQqeyEH0WXcVR1-8avx7E84GehadnH54HvqOKTJTgtOEkNPaqmyOGHl3hdWJjSikW7o0Q5v5yjG-_RdE-LM4wpOT51H3VUI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2023-09-29 22:40:49', '2024-06-04 11:18:04', NULL),
(9, 'Md', 'Shahin', 0, 'junior', 'shahin@gmail.com', '45634563454', 'shahin', '$2y$10$sXCk0xU6shlnk8QuJWvmSeca/vDULwFCOgKQP68TyPIbObo7cIFWa', '1684231325-6463549ded9b5.png', 1, 2, 4, 2, '2024-07-23 12:49:45', 1, 1, 0, 0, 1, NULL, '1', NULL, 0, NULL, NULL, NULL, NULL, 'yes', '2024-10-06 15:54:43', '965295', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2023-02-23 06:49:24', '2024-07-23 12:49:45', NULL),
(10, 'Sri Sri', 'Rupak', 0, 'junior', 'rupak@gmail.com', '2343445454', 'rupak', '$2y$10$HPClvqvTFaX5NuVhoQCPkuB1e0kh5GDGV9jrgp0iRA1r9FDMXEApa', NULL, 2, 2, 4, 2, '2024-02-03 00:16:38', 1, 1, 0, 0, 1, NULL, '1', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '617388', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2023-03-12 05:18:48', '2024-02-03 00:16:38', NULL),
(11, 'Md', 'Zahid', 0, 'junior', 'zahid@gmail.com', '456454654656', 'zahid', '$2y$10$HPClvqvTFaX5NuVhoQCPkuB1e0kh5GDGV9jrgp0iRA1r9FDMXEApa', NULL, 1, 1, 16, 2, '2023-10-15 01:45:35', 1, 1, 0, 0, 1, NULL, '1', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '705497', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2023-03-12 05:24:14', '2023-10-15 01:45:35', NULL),
(12, 'Md', 'Sojon', 0, 'junior', 'sojon@gmail.com', '01893908767', 'sojon', '$2y$10$OuhlvbjbDDDkbjDIAiNGJOWr.s54NdPrT0pqqzBDuXwNWTICpf6K6', NULL, NULL, NULL, NULL, 2, '2023-10-15 04:38:29', 1, 1, 0, 0, 1, NULL, '1', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '659157', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2023-10-15 01:49:48', '2023-10-15 04:38:29', NULL),
(14, 'Nazmul', 'Hoque', 0, 'junior', 'nazmul@gmail.com', '01713602728', 'nazmul', '$2y$10$vnWGr2W1yTpyPUroLCgLEOrgC9q3/6oqQnFyMyehywCDv3x4Zp.ZG', NULL, NULL, NULL, NULL, 2, '2023-12-23 04:42:28', 1, 1, 0, 0, 1, NULL, '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '211703', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2023-10-18 04:41:21', '2023-12-23 04:42:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_earnings`
--

CREATE TABLE `user_earnings` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `total_earning` double NOT NULL DEFAULT '0',
  `total_withdraw` double NOT NULL DEFAULT '0',
  `remaining_balance` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_earnings`
--

INSERT INTO `user_earnings` (`id`, `user_id`, `total_earning`, `total_withdraw`, `remaining_balance`, `created_at`, `updated_at`) VALUES
(1, 7, 3018.6, 0, 3018.6, '2023-11-07 00:54:27', '2024-08-27 23:42:05'),
(2, 8, 39.5, 0, 39.5, '2023-11-27 06:22:28', '2023-11-27 06:22:28');

-- --------------------------------------------------------

--
-- Table structure for table `user_education`
--

CREATE TABLE `user_education` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `institution` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `degree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_education`
--

INSERT INTO `user_education` (`id`, `user_id`, `institution`, `degree`, `subject`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 7, 'Dhaka International university', 'Bsc in CSE', 'Computer Science and Engineering', '2013-06-30 18:00:00', '2017-11-30 18:00:00', '2023-02-06 01:16:13', '2023-11-20 23:46:01'),
(10, 8, 'Dhaka International university', 'Computer Science and Engineering', 'Bsc in CSE', '2023-03-15 18:00:00', '2023-03-23 18:00:00', '2023-03-16 06:11:57', '2023-11-25 06:17:38');

-- --------------------------------------------------------

--
-- Table structure for table `user_experiences`
--

CREATE TABLE `user_experiences` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_experiences`
--

INSERT INTO `user_experiences` (`id`, `user_id`, `title`, `short_description`, `organization`, `address`, `country_id`, `state_id`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(2, 7, 'Frontend Developer', 'I was working for a php developer. I developed multiple products like crm, real estate etc.', 'Avery and Palmer Co', 'Dhaka Bangladesh', '1', '2', '2018-02-28 18:00:00', '2019-03-30 18:00:00', '2023-02-01 05:54:04', '2023-03-15 06:18:55'),
(3, 7, 'PHP Laravel Developer', 'In iHelpBD I was working as a PHP developer. I developed multiple products like CRM, Real estate etc.', 'iHelpBD', 'Dhanmondi 27', '1', '1', '2020-02-29 18:00:00', '2022-03-30 18:00:00', '2023-02-01 05:58:44', '2023-11-28 05:03:31'),
(16, 8, 'PHP Laravel Developer', 'Uttara Dhaka 1203', 'Softking', 'Uttara Dhaka 1203', '2', '16', '2023-03-20 18:00:00', '2023-03-29 18:00:00', '2023-03-16 06:12:18', '2023-11-25 06:16:47');

-- --------------------------------------------------------

--
-- Table structure for table `user_introductions`
--

CREATE TABLE `user_introductions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_introductions`
--

INSERT INTO `user_introductions` (`id`, `user_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(2, 7, 'Laravel Developer', 'I am a professional web developer work experience with 5 years. I will able to develop your any business  with laravel.', '2023-02-01 01:37:26', '2023-03-19 06:05:38'),
(3, 9, 'Professional Developer', 'Expert of Php, Laravel, vue js, React Js, Python, Sql.', '2023-02-23 07:15:46', '2023-05-16 04:03:18'),
(5, 8, 'Professional Html Developer', 'I have 5 years of experience designing psd to html, pdf to html, ui-ux to html templates.', '2023-05-16 00:50:04', '2023-05-16 00:50:04'),
(6, 10, 'Backend Developer', 'I\'m a professional backend  developer ready to create your scripts.', '2023-05-16 06:54:28', '2023-05-16 06:54:28');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `identity` bigint NOT NULL,
  `client_id` bigint NOT NULL,
  `freelancer_id` bigint NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_client_read` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `is_freelancer_read` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_skills`
--

CREATE TABLE `user_skills` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `skill` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_skills`
--

INSERT INTO `user_skills` (`id`, `user_id`, `skill`, `created_at`, `updated_at`) VALUES
(1, 7, 'Laravel, Php, Node Js, Firebase on Android, Android, Android foundations', '2023-02-13 01:11:06', '2023-09-18 00:49:15'),
(2, 8, 'Android , Firebase on Android , Android foundations , Mobile App Development', '2023-03-16 06:50:02', '2023-11-25 06:18:27');

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `subscription_id` bigint NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `limit` bigint NOT NULL DEFAULT '0',
  `expire_date` timestamp NULL DEFAULT NULL,
  `payment_gateway` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manual_payment_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_send` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_subscriptions`
--

INSERT INTO `user_subscriptions` (`id`, `user_id`, `subscription_id`, `price`, `limit`, `expire_date`, `payment_gateway`, `payment_status`, `status`, `transaction_id`, `manual_payment_image`, `email_send`, `created_at`, `updated_at`) VALUES
(1, 7, 2, 110, 12, '2024-11-06 04:07:06', 'stripe', 'complete', 1, 'pi_3O9mBcEmGOuJLTMs0vuJtPwk', NULL, NULL, '2023-11-07 04:07:06', '2024-09-02 22:18:21'),
(2, 19, 10, 12, 20, '2023-12-11 22:54:42', 'Trial', 'complete', 1, NULL, NULL, NULL, '2023-11-11 22:54:42', '2023-11-11 22:54:42'),
(3, 7, 7, 60, 23, '2023-12-19 01:29:14', 'cinetpay', NULL, 0, NULL, NULL, NULL, '2023-11-19 01:29:14', '2023-11-19 01:29:14'),
(4, 7, 7, 60, 23, '2023-12-19 01:29:44', 'cashfree', NULL, 0, NULL, NULL, NULL, '2023-11-19 01:29:44', '2023-11-19 01:29:44'),
(5, 7, 10, 12, 20, '2023-12-19 01:31:19', 'payfast', NULL, 0, NULL, NULL, NULL, '2023-11-19 01:31:19', '2023-11-19 01:31:19'),
(8, 7, 6, 50, 10, '2024-01-03 13:28:20', 'paystack', NULL, 0, NULL, NULL, NULL, '2023-12-04 13:28:20', '2023-12-04 13:28:20'),
(12, 7, 10, 12, 20, '2024-01-05 12:02:19', 'wallet', 'complete', 1, NULL, NULL, NULL, '2023-12-06 12:02:19', '2023-12-06 12:02:19'),
(17, 7, 10, 12, 20, '2024-01-07 14:08:51', 'wallet', 'complete', 1, NULL, NULL, NULL, '2023-12-08 14:08:51', '2023-12-08 14:08:51'),
(18, 7, 10, 12, 20, '2024-01-07 14:18:35', 'wallet', 'complete', 1, NULL, NULL, NULL, '2023-12-08 14:18:35', '2023-12-08 14:18:35');

-- --------------------------------------------------------

--
-- Table structure for table `user_works`
--

CREATE TABLE `user_works` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  `sub_category_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_works`
--

INSERT INTO `user_works` (`id`, `user_id`, `category_id`, `sub_category_id`, `created_at`, `updated_at`) VALUES
(1, 7, 18, 22, '2023-02-12 06:09:10', '2023-11-28 05:24:33'),
(2, 8, 4, 6, '2023-05-17 01:38:56', '2023-09-18 01:02:37');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `balance` double NOT NULL,
  `remaining_balance` double NOT NULL DEFAULT '0',
  `withdraw_amount` double NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `balance`, `remaining_balance`, `withdraw_amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 983, 1850, 0, 1, '2023-04-06 01:41:22', '2024-09-02 18:47:40'),
(2, 7, 1122.6, 2818.6, 752, 1, '2023-04-15 02:35:25', '2024-09-02 21:28:21'),
(3, 8, 39.5, 39.5, 0, 1, '2023-05-17 06:12:16', '2023-11-27 06:22:28'),
(4, 2, 140, 500, 0, 1, '2023-08-23 06:21:54', '2023-11-07 23:28:14');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_histories`
--

CREATE TABLE `wallet_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `payment_gateway` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manual_payment_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `email_send` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint UNSIGNED NOT NULL,
  `widget_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `widget_order` int DEFAULT NULL,
  `widget_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `widget_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `widget_area`, `widget_order`, `widget_location`, `widget_name`, `widget_content`, `created_at`, `updated_at`) VALUES
(13, NULL, 2, 'footer_one', 'AboutUsWidget', 'a:7:{s:2:\"id\";s:2:\"13\";s:11:\"widget_name\";s:13:\"AboutUsWidget\";s:11:\"widget_type\";s:6:\"update\";s:15:\"widget_location\";s:10:\"footer_one\";s:12:\"widget_order\";s:1:\"2\";s:5:\"title\";s:8:\"About Us\";s:9:\"menu_link\";a:2:{s:10:\"list_item_\";a:4:{i:0;s:5:\"About\";i:1;s:7:\"Contact\";i:2;s:14:\"Privacy Policy\";i:3;s:20:\"Terms and Conditions\";}s:4:\"url_\";a:4:{i:0;s:1:\"#\";i:1;s:1:\"#\";i:2;s:1:\"#\";i:3;s:1:\"#\";}}}', '2023-10-31 05:11:20', '2023-10-31 05:59:33'),
(14, NULL, 1, 'footer_one', 'SocialAreaWidget', 'a:8:{s:2:\"id\";s:2:\"14\";s:11:\"widget_name\";s:16:\"SocialAreaWidget\";s:11:\"widget_type\";s:6:\"update\";s:15:\"widget_location\";s:10:\"footer_one\";s:12:\"widget_order\";s:1:\"1\";s:5:\"image\";s:2:\"79\";s:11:\"description\";s:45:\"Hi You will find everything on this platform.\";s:11:\"social_icon\";a:2:{s:5:\"icon_\";a:4:{i:0;s:17:\"fab fa-facebook-f\";i:1;s:14:\"fab fa-youtube\";i:2;s:14:\"fab fa-twitter\";i:3;s:18:\"fab fa-linkedin-in\";}s:4:\"url_\";a:4:{i:0;s:1:\"#\";i:1;s:1:\"#\";i:2;s:1:\"#\";i:3;s:1:\"#\";}}}', '2023-10-31 05:34:22', '2023-10-31 05:47:49'),
(15, NULL, 3, 'footer_one', 'ServiceWidget', 'a:9:{s:2:\"id\";s:2:\"15\";s:11:\"widget_name\";s:13:\"ServiceWidget\";s:11:\"widget_type\";s:6:\"update\";s:15:\"widget_location\";s:10:\"footer_one\";s:12:\"widget_order\";s:1:\"3\";s:5:\"title\";s:8:\"Services\";s:8:\"order_by\";s:2:\"id\";s:5:\"order\";s:3:\"asc\";s:5:\"items\";s:1:\"5\";}', '2023-10-31 06:12:50', '2023-10-31 06:25:06'),
(16, NULL, 4, 'footer_one', 'ContactUsWidget', 'a:7:{s:2:\"id\";s:2:\"16\";s:11:\"widget_name\";s:15:\"ContactUsWidget\";s:11:\"widget_type\";s:6:\"update\";s:15:\"widget_location\";s:10:\"footer_one\";s:12:\"widget_order\";s:1:\"4\";s:5:\"title\";s:10:\"Contact Us\";s:12:\"contact_info\";a:2:{s:5:\"icon_\";a:3:{i:0;s:12:\"fas fa-phone\";i:1;s:15:\"far fa-envelope\";i:2;s:17:\"fas fa-map-marker\";}s:5:\"info_\";a:3:{i:0;s:13:\"+627-521-1504\";i:1;s:18:\"info@washeco.co.uk\";i:2;s:27:\"8702 Jayson, Well Suite 348\";}}}', '2023-10-31 06:37:46', '2023-10-31 06:38:30'),
(18, NULL, 1, 'footer_two', 'ContactUsTwoWidget', 'a:8:{s:2:\"id\";s:2:\"18\";s:11:\"widget_name\";s:18:\"ContactUsTwoWidget\";s:11:\"widget_type\";s:6:\"update\";s:15:\"widget_location\";s:10:\"footer_two\";s:12:\"widget_order\";s:1:\"1\";s:5:\"title\";s:10:\"Contact Us\";s:11:\"description\";s:70:\"Amet minim mollit non deserunt ullamco est sit ali dolor do amet sint.\";s:12:\"contact_info\";a:2:{s:5:\"icon_\";a:2:{i:0;s:12:\"fas fa-phone\";i:1;s:15:\"fas fa-envelope\";}s:5:\"info_\";a:2:{i:0;s:29:\"Have a question? 310-437-2766\";i:1;s:35:\"Have a question? unreal@example.com\";}}}', '2023-10-31 07:26:30', '2023-11-27 08:54:56'),
(19, NULL, 2, 'footer_two', 'AboutUsWidget', 'a:7:{s:2:\"id\";s:2:\"19\";s:11:\"widget_name\";s:13:\"AboutUsWidget\";s:11:\"widget_type\";s:6:\"update\";s:15:\"widget_location\";s:10:\"footer_two\";s:12:\"widget_order\";s:1:\"2\";s:5:\"title\";s:8:\"About Us\";s:9:\"menu_link\";a:2:{s:10:\"list_item_\";a:5:{i:0;s:5:\"About\";i:1;s:7:\"Contact\";i:2;s:14:\"Privacy Policy\";i:3;s:20:\"Terms and Conditions\";i:4;s:20:\"Terms and Conditions\";}s:4:\"url_\";a:5:{i:0;s:1:\"#\";i:1;s:1:\"#\";i:2;s:1:\"#\";i:3;s:1:\"#\";i:4;s:1:\"#\";}}}', '2023-10-31 07:33:39', '2023-10-31 07:34:50'),
(20, NULL, 3, 'footer_two', 'ServiceWidget', 'a:9:{s:2:\"id\";s:2:\"20\";s:11:\"widget_name\";s:13:\"ServiceWidget\";s:11:\"widget_type\";s:6:\"update\";s:15:\"widget_location\";s:10:\"footer_two\";s:12:\"widget_order\";s:1:\"3\";s:5:\"title\";s:8:\"Services\";s:8:\"order_by\";s:2:\"id\";s:5:\"order\";s:3:\"asc\";s:5:\"items\";s:1:\"5\";}', '2023-10-31 07:35:30', '2023-10-31 07:40:20'),
(21, NULL, 4, 'footer_two', 'NewsLetterWidget', 'a:7:{s:2:\"id\";s:2:\"21\";s:11:\"widget_name\";s:16:\"NewsLetterWidget\";s:11:\"widget_type\";s:6:\"update\";s:15:\"widget_location\";s:10:\"footer_two\";s:12:\"widget_order\";s:1:\"4\";s:5:\"title\";s:20:\"Subscribe Newsletter\";s:11:\"description\";s:81:\"Enter your email to receive regular updates, newsletters. We promise to not spam.\";}', '2023-10-31 07:41:26', '2023-10-31 07:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_gateways`
--

CREATE TABLE `withdraw_gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1=active, 2=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_gateways`
--

INSERT INTO `withdraw_gateways` (`id`, `name`, `field`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bank', 'a:3:{i:0;s:9:\"Bank Name\";i:1;s:10:\"Swift Code\";i:2;s:14:\"Account Number\";}', 1, '2023-10-16 02:31:37', '2023-10-16 04:24:26'),
(4, 'Paypal', 'a:4:{i:0;s:12:\"Account Name\";i:1;s:14:\"Account Number\";i:2;s:12:\"Account Type\";i:3;s:10:\"Account Id\";}', 1, '2023-10-16 04:17:18', '2023-10-16 04:20:51');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `gateway_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1=pending, 2=complete, 3=cancel',
  `gateway_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `words`
--

CREATE TABLE `words` (
  `id` bigint UNSIGNED NOT NULL,
  `word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `words`
--

INSERT INTO `words` (`id`, `word`, `status`, `created_at`, `updated_at`) VALUES
(1, '@gmail', 'active', '2024-06-03 17:36:14', '2024-06-03 17:36:14'),
(2, 'account number', 'active', '2024-06-03 17:36:39', '2024-06-03 17:36:39'),
(3, '@email', 'active', '2024-06-04 08:44:31', '2024-06-04 08:44:31');

-- --------------------------------------------------------

--
-- Table structure for table `xg_ftp_infos`
--

CREATE TABLE `xg_ftp_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `item_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_license_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_license_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_license_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `xg_payment_meta`
--

CREATE TABLE `xg_payment_meta` (
  `id` bigint UNSIGNED NOT NULL,
  `gateway` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `session_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `track` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` bigint UNSIGNED NOT NULL DEFAULT '0' COMMENT '0=pending,1=complete,2=cancel',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_notifications`
--
ALTER TABLE `client_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_builders`
--
ALTER TABLE `form_builders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `freelancer_levels`
--
ALTER TABLE `freelancer_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `freelancer_level_rules`
--
ALTER TABLE `freelancer_level_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `freelancer_notifications`
--
ALTER TABLE `freelancer_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `identity_verifications`
--
ALTER TABLE `identity_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `individual_commission_settings`
--
ALTER TABLE `individual_commission_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_histories`
--
ALTER TABLE `job_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_posts`
--
ALTER TABLE `job_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_posts_category_index` (`category`);

--
-- Indexes for table `job_post_skills`
--
ALTER TABLE `job_post_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_post_skills_job_post_id_skill_id_index` (`job_post_id`,`skill_id`);

--
-- Indexes for table `job_post_sub_categories`
--
ALTER TABLE `job_post_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_post_sub_categories_job_post_id_sub_category_id_index` (`job_post_id`,`sub_category_id`);

--
-- Indexes for table `job_proposals`
--
ALTER TABLE `job_proposals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_chats`
--
ALTER TABLE `live_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_chat_messages`
--
ALTER TABLE `live_chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `live_chat_messages_live_chat_id_foreign` (`live_chat_id`);

--
-- Indexes for table `log_activities`
--
ALTER TABLE `log_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_uploads`
--
ALTER TABLE `media_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meta_data`
--
ALTER TABLE `meta_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletters_email_unique` (`email`);

--
-- Indexes for table `news_letter_for_emails`
--
ALTER TABLE `news_letter_for_emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `news_letter_for_emails_email_unique` (`email`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer_milestones`
--
ALTER TABLE `offer_milestones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_decline_histories`
--
ALTER TABLE `order_decline_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_decline_wallet_histories`
--
ALTER TABLE `order_decline_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_milestones`
--
ALTER TABLE `order_milestones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_request_revisions`
--
ALTER TABLE `order_request_revisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_screenshots`
--
ALTER TABLE `order_screenshots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_submit_histories`
--
ALTER TABLE `order_submit_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_work_histories`
--
ALTER TABLE `order_work_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_builders`
--
ALTER TABLE `page_builders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_attributes`
--
ALTER TABLE `project_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_histories`
--
ALTER TABLE `project_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_promote_settings`
--
ALTER TABLE `project_promote_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_sub_categories`
--
ALTER TABLE `project_sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotion_project_lists`
--
ALTER TABLE `promotion_project_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_answers`
--
ALTER TABLE `question_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating_details`
--
ALTER TABLE `rating_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `static_options`
--
ALTER TABLE `static_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_features`
--
ALTER TABLE `subscription_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_types`
--
ALTER TABLE `subscription_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_earnings`
--
ALTER TABLE `user_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_education`
--
ALTER TABLE `user_education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_experiences`
--
ALTER TABLE `user_experiences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_introductions`
--
ALTER TABLE `user_introductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_skills`
--
ALTER TABLE `user_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_works`
--
ALTER TABLE `user_works`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_histories`
--
ALTER TABLE `wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_gateways`
--
ALTER TABLE `withdraw_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `words`
--
ALTER TABLE `words`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xg_ftp_infos`
--
ALTER TABLE `xg_ftp_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xg_payment_meta`
--
ALTER TABLE `xg_payment_meta`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `client_notifications`
--
ALTER TABLE `client_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `form_builders`
--
ALTER TABLE `form_builders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `freelancer_levels`
--
ALTER TABLE `freelancer_levels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `freelancer_level_rules`
--
ALTER TABLE `freelancer_level_rules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `freelancer_notifications`
--
ALTER TABLE `freelancer_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `identity_verifications`
--
ALTER TABLE `identity_verifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `individual_commission_settings`
--
ALTER TABLE `individual_commission_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_histories`
--
ALTER TABLE `job_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `job_posts`
--
ALTER TABLE `job_posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `job_post_skills`
--
ALTER TABLE `job_post_skills`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `job_post_sub_categories`
--
ALTER TABLE `job_post_sub_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `job_proposals`
--
ALTER TABLE `job_proposals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `live_chats`
--
ALTER TABLE `live_chats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_chat_messages`
--
ALTER TABLE `live_chat_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_activities`
--
ALTER TABLE `log_activities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_uploads`
--
ALTER TABLE `media_uploads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `meta_data`
--
ALTER TABLE `meta_data`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `news_letter_for_emails`
--
ALTER TABLE `news_letter_for_emails`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `offer_milestones`
--
ALTER TABLE `offer_milestones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=557;

--
-- AUTO_INCREMENT for table `order_decline_histories`
--
ALTER TABLE `order_decline_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `order_decline_wallet_histories`
--
ALTER TABLE `order_decline_wallet_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `order_milestones`
--
ALTER TABLE `order_milestones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `order_request_revisions`
--
ALTER TABLE `order_request_revisions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_screenshots`
--
ALTER TABLE `order_screenshots`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_submit_histories`
--
ALTER TABLE `order_submit_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `order_work_histories`
--
ALTER TABLE `order_work_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `page_builders`
--
ALTER TABLE `page_builders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `project_attributes`
--
ALTER TABLE `project_attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1835;

--
-- AUTO_INCREMENT for table `project_histories`
--
ALTER TABLE `project_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `project_promote_settings`
--
ALTER TABLE `project_promote_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project_sub_categories`
--
ALTER TABLE `project_sub_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `promotion_project_lists`
--
ALTER TABLE `promotion_project_lists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `question_answers`
--
ALTER TABLE `question_answers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rating_details`
--
ALTER TABLE `rating_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `static_options`
--
ALTER TABLE `static_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=422;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `subscription_features`
--
ALTER TABLE `subscription_features`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=447;

--
-- AUTO_INCREMENT for table `subscription_types`
--
ALTER TABLE `subscription_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=724;

--
-- AUTO_INCREMENT for table `user_earnings`
--
ALTER TABLE `user_earnings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_education`
--
ALTER TABLE `user_education`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_experiences`
--
ALTER TABLE `user_experiences`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_introductions`
--
ALTER TABLE `user_introductions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_skills`
--
ALTER TABLE `user_skills`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=496;

--
-- AUTO_INCREMENT for table `user_works`
--
ALTER TABLE `user_works`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=651;

--
-- AUTO_INCREMENT for table `wallet_histories`
--
ALTER TABLE `wallet_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `withdraw_gateways`
--
ALTER TABLE `withdraw_gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `words`
--
ALTER TABLE `words`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `xg_ftp_infos`
--
ALTER TABLE `xg_ftp_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xg_payment_meta`
--
ALTER TABLE `xg_payment_meta`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `live_chat_messages`
--
ALTER TABLE `live_chat_messages`
  ADD CONSTRAINT `live_chat_messages_live_chat_id_foreign` FOREIGN KEY (`live_chat_id`) REFERENCES `live_chats` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
