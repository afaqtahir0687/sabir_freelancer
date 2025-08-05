-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2018 at 02:54 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `freelancer`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rtf_categories`
--

CREATE TABLE `rtf_categories` (
  `id` bigint(20) NOT NULL,
  `category_name` varchar(200) CHARACTER SET latin1 NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL,
  `image_name` varchar(200) CHARACTER SET latin1 NOT NULL,
  `created` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rtf_categories`
--

INSERT INTO `rtf_categories` (`id`, `category_name`, `description`, `image_name`, `created`, `is_active`) VALUES
(7, 'Creative Designers', 'This is test', 'graphic_design.png', '0000-00-00 00:00:00', 1),
(8, 'Mobile Developers', 'Mobile Phone, Android, iPhone, iPad, Geolocation...', 'mobile-phone.png', '0000-00-00 00:00:00', 1),
(9, 'Web Developers / IT / Software / Networking', 'This is test', 'web-it-software.png', '0000-00-00 00:00:00', 1),
(10, 'IT & Programmers', 'This is test', 'IT_Programmers1.png', '0000-00-00 00:00:00', 0),
(11, 'Sales & Marketers', 'This is another test', 'sale-icon.png', '0000-00-00 00:00:00', 1),
(12, 'Writers', 'Articles, Content Writing, Copywriting, Ghostwriting, Translation...', 'writing.png', '0000-00-00 00:00:00', 1),
(13, 'Accountants & Consultants', 'This is test', 'accountant.png', '0000-00-00 00:00:00', 1),
(14, 'Business & Legal', 'Accounting, Finance, Project Management, Business Plans, Business Analysis...', 'Business_Legal.png', '0000-00-00 00:00:00', 1),
(15, 'Engineers / Science / Architectures', 'This is test', 'Engineers_Architectures1.png', '0000-00-00 00:00:00', 1),
(16, 'Data Entry', 'Data Entry, Excel, Data Processing, Web Search, Virtual Assistant...', 'data-entry-icon.png', '0000-00-00 00:00:00', 1),
(19, 'Medical', 'This is inactive', 'designing2.png', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_flag` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` text COLLATE utf8mb4_unicode_ci,
  `timezone` int(11) DEFAULT NULL,
  `location` text COLLATE utf8mb4_unicode_ci,
  `security_phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `security_phone_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified_phone` tinyint(4) DEFAULT NULL,
  `security_city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connect_with_facebook` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `facebook_user_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_display_image_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `bids_per_month` int(11) DEFAULT NULL,
  `remaining_bids` int(11) DEFAULT NULL,
  `total_skills` int(11) DEFAULT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `account_type` enum('work','hire') COLLATE utf8mb4_unicode_ci NOT NULL,
  `list_me_in_freelance_directory` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `allow_freelancer_to_follow_me` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `preffered_freelancer_program_settings` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `tax_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_rate` double DEFAULT NULL,
  `tax_id_or_company_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `image_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image_thumbnail` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail_coordinates` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_status` tinyint(4) DEFAULT NULL,
  `last_login_on` datetime DEFAULT NULL,
  `freelancer_rating` double(8,2) DEFAULT NULL,
  `employeer_rating` double(8,2) DEFAULT NULL,
  `gender` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connected_by` tinyint(4) DEFAULT NULL,
  `fb_user_id` bigint(20) DEFAULT NULL,
  `update_email` tinyint(4) DEFAULT NULL,
  `is_package_auto_deposit` tinyint(4) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `rtf_categories`
--
ALTER TABLE `rtf_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rtf_categories`
--
ALTER TABLE `rtf_categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
