-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2018 at 07:33 PM
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
(7, 'Creative Designers', 'This is test', '1538498597.png', '0000-00-00 00:00:00', 1),
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
-- Table structure for table `rtf_certifications`
--

CREATE TABLE `rtf_certifications` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `certificate_name` varchar(250) NOT NULL,
  `organization` varchar(250) NOT NULL,
  `describe_certification` tinytext NOT NULL,
  `awarded_year` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rtf_certifications`
--

INSERT INTO `rtf_certifications` (`id`, `user_id`, `certificate_name`, `organization`, `describe_certification`, `awarded_year`, `is_active`, `created`) VALUES
(1, 1, 'MCITP', 'Tevta', 'Some', 2018, 1, '2018-10-05 11:08:14');

-- --------------------------------------------------------

--
-- Table structure for table `rtf_countries`
--

CREATE TABLE `rtf_countries` (
  `id` int(3) NOT NULL,
  `code` char(2) NOT NULL COMMENT 'Two-letter country code (ISO 3166-1 alpha-2)',
  `name` varchar(255) NOT NULL COMMENT 'English country name',
  `full_name` varchar(255) NOT NULL COMMENT 'Full English country name',
  `iso3` char(3) NOT NULL COMMENT 'Three-letter country code (ISO 3166-1 alpha-3)',
  `number` smallint(3) UNSIGNED ZEROFILL NOT NULL COMMENT 'Three-digit country number (ISO 3166-1 numeric)',
  `continent_code` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rtf_countries`
--

INSERT INTO `rtf_countries` (`id`, `code`, `name`, `full_name`, `iso3`, `number`, `continent_code`) VALUES
(1, 'AD', 'Andorra', 'Principality of Andorra', 'AND', 020, 'EU'),
(2, 'AE', 'United Arab Emirates', 'United Arab Emirates', 'ARE', 784, 'AS'),
(3, 'AF', 'Afghanistan', 'Islamic Republic of Afghanistan', 'AFG', 004, 'AS'),
(4, 'AG', 'Antigua and Barbuda', 'Antigua and Barbuda', 'ATG', 028, 'NA'),
(5, 'AI', 'Anguilla', 'Anguilla', 'AIA', 660, 'NA'),
(6, 'AL', 'Albania', 'Republic of Albania', 'ALB', 008, 'EU'),
(7, 'AM', 'Armenia', 'Republic of Armenia', 'ARM', 051, 'AS'),
(8, 'AO', 'Angola', 'Republic of Angola', 'AGO', 024, 'AF'),
(9, 'AQ', 'Antarctica', 'Antarctica (the territory South of 60 deg S)', 'ATA', 010, 'AN'),
(10, 'AR', 'Argentina', 'Argentine Republic', 'ARG', 032, 'SA'),
(11, 'AS', 'American Samoa', 'American Samoa', 'ASM', 016, 'OC'),
(12, 'AT', 'Austria', 'Republic of Austria', 'AUT', 040, 'EU'),
(13, 'AU', 'Australia', 'Commonwealth of Australia', 'AUS', 036, 'OC'),
(14, 'AW', 'Aruba', 'Aruba', 'ABW', 533, 'NA'),
(15, 'AX', 'Åland Islands', 'Åland Islands', 'ALA', 248, 'EU'),
(16, 'AZ', 'Azerbaijan', 'Republic of Azerbaijan', 'AZE', 031, 'AS'),
(17, 'BA', 'Bosnia and Herzegovina', 'Bosnia and Herzegovina', 'BIH', 070, 'EU'),
(18, 'BB', 'Barbados', 'Barbados', 'BRB', 052, 'NA'),
(19, 'BD', 'Bangladesh', 'People\'s Republic of Bangladesh', 'BGD', 050, 'AS'),
(20, 'BE', 'Belgium', 'Kingdom of Belgium', 'BEL', 056, 'EU'),
(21, 'BF', 'Burkina Faso', 'Burkina Faso', 'BFA', 854, 'AF'),
(22, 'BG', 'Bulgaria', 'Republic of Bulgaria', 'BGR', 100, 'EU'),
(23, 'BH', 'Bahrain', 'Kingdom of Bahrain', 'BHR', 048, 'AS'),
(24, 'BI', 'Burundi', 'Republic of Burundi', 'BDI', 108, 'AF'),
(25, 'BJ', 'Benin', 'Republic of Benin', 'BEN', 204, 'AF'),
(26, 'BL', 'Saint Barthélemy', 'Saint Barthélemy', 'BLM', 652, 'NA'),
(27, 'BM', 'Bermuda', 'Bermuda', 'BMU', 060, 'NA'),
(28, 'BN', 'Brunei Darussalam', 'Brunei Darussalam', 'BRN', 096, 'AS'),
(29, 'BO', 'Bolivia', 'Plurinational State of Bolivia', 'BOL', 068, 'SA'),
(30, 'BQ', 'Bonaire, Sint Eustatius and Saba', 'Bonaire, Sint Eustatius and Saba', 'BES', 535, 'NA'),
(31, 'BR', 'Brazil', 'Federative Republic of Brazil', 'BRA', 076, 'SA'),
(32, 'BS', 'Bahamas', 'Commonwealth of the Bahamas', 'BHS', 044, 'NA'),
(33, 'BT', 'Bhutan', 'Kingdom of Bhutan', 'BTN', 064, 'AS'),
(34, 'BV', 'Bouvet Island (Bouvetoya)', 'Bouvet Island (Bouvetoya)', 'BVT', 074, 'AN'),
(35, 'BW', 'Botswana', 'Republic of Botswana', 'BWA', 072, 'AF'),
(36, 'BY', 'Belarus', 'Republic of Belarus', 'BLR', 112, 'EU'),
(37, 'BZ', 'Belize', 'Belize', 'BLZ', 084, 'NA'),
(38, 'CA', 'Canada', 'Canada', 'CAN', 124, 'NA'),
(39, 'CC', 'Cocos (Keeling) Islands', 'Cocos (Keeling) Islands', 'CCK', 166, 'AS'),
(40, 'CD', 'Congo', 'Democratic Republic of the Congo', 'COD', 180, 'AF'),
(41, 'CF', 'Central African Republic', 'Central African Republic', 'CAF', 140, 'AF'),
(42, 'CG', 'Congo', 'Republic of the Congo', 'COG', 178, 'AF'),
(43, 'CH', 'Switzerland', 'Swiss Confederation', 'CHE', 756, 'EU'),
(44, 'CI', 'Cote d\'Ivoire', 'Republic of Cote d\'Ivoire', 'CIV', 384, 'AF'),
(45, 'CK', 'Cook Islands', 'Cook Islands', 'COK', 184, 'OC'),
(46, 'CL', 'Chile', 'Republic of Chile', 'CHL', 152, 'SA'),
(47, 'CM', 'Cameroon', 'Republic of Cameroon', 'CMR', 120, 'AF'),
(48, 'CN', 'China', 'People\'s Republic of China', 'CHN', 156, 'AS'),
(49, 'CO', 'Colombia', 'Republic of Colombia', 'COL', 170, 'SA'),
(50, 'CR', 'Costa Rica', 'Republic of Costa Rica', 'CRI', 188, 'NA'),
(51, 'CU', 'Cuba', 'Republic of Cuba', 'CUB', 192, 'NA'),
(52, 'CV', 'Cape Verde', 'Republic of Cape Verde', 'CPV', 132, 'AF'),
(53, 'CW', 'Curaçao', 'Curaçao', 'CUW', 531, 'NA'),
(54, 'CX', 'Christmas Island', 'Christmas Island', 'CXR', 162, 'AS'),
(55, 'CY', 'Cyprus', 'Republic of Cyprus', 'CYP', 196, 'AS'),
(56, 'CZ', 'Czech Republic', 'Czech Republic', 'CZE', 203, 'EU'),
(57, 'DE', 'Germany', 'Federal Republic of Germany', 'DEU', 276, 'EU'),
(58, 'DJ', 'Djibouti', 'Republic of Djibouti', 'DJI', 262, 'AF'),
(59, 'DK', 'Denmark', 'Kingdom of Denmark', 'DNK', 208, 'EU'),
(60, 'DM', 'Dominica', 'Commonwealth of Dominica', 'DMA', 212, 'NA'),
(61, 'DO', 'Dominican Republic', 'Dominican Republic', 'DOM', 214, 'NA'),
(62, 'DZ', 'Algeria', 'People\'s Democratic Republic of Algeria', 'DZA', 012, 'AF'),
(63, 'EC', 'Ecuador', 'Republic of Ecuador', 'ECU', 218, 'SA'),
(64, 'EE', 'Estonia', 'Republic of Estonia', 'EST', 233, 'EU'),
(65, 'EG', 'Egypt', 'Arab Republic of Egypt', 'EGY', 818, 'AF'),
(66, 'EH', 'Western Sahara', 'Western Sahara', 'ESH', 732, 'AF'),
(67, 'ER', 'Eritrea', 'State of Eritrea', 'ERI', 232, 'AF'),
(68, 'ES', 'Spain', 'Kingdom of Spain', 'ESP', 724, 'EU'),
(69, 'ET', 'Ethiopia', 'Federal Democratic Republic of Ethiopia', 'ETH', 231, 'AF'),
(70, 'FI', 'Finland', 'Republic of Finland', 'FIN', 246, 'EU'),
(71, 'FJ', 'Fiji', 'Republic of Fiji', 'FJI', 242, 'OC'),
(72, 'FK', 'Falkland Islands (Malvinas)', 'Falkland Islands (Malvinas)', 'FLK', 238, 'SA'),
(73, 'FM', 'Micronesia', 'Federated States of Micronesia', 'FSM', 583, 'OC'),
(74, 'FO', 'Faroe Islands', 'Faroe Islands', 'FRO', 234, 'EU'),
(75, 'FR', 'France', 'French Republic', 'FRA', 250, 'EU'),
(76, 'GA', 'Gabon', 'Gabonese Republic', 'GAB', 266, 'AF'),
(77, 'GB', 'United Kingdom of Great Britain & Northern Ireland', 'United Kingdom of Great Britain & Northern Ireland', 'GBR', 826, 'EU'),
(78, 'GD', 'Grenada', 'Grenada', 'GRD', 308, 'NA'),
(79, 'GE', 'Georgia', 'Georgia', 'GEO', 268, 'AS'),
(80, 'GF', 'French Guiana', 'French Guiana', 'GUF', 254, 'SA'),
(81, 'GG', 'Guernsey', 'Bailiwick of Guernsey', 'GGY', 831, 'EU'),
(82, 'GH', 'Ghana', 'Republic of Ghana', 'GHA', 288, 'AF'),
(83, 'GI', 'Gibraltar', 'Gibraltar', 'GIB', 292, 'EU'),
(84, 'GL', 'Greenland', 'Greenland', 'GRL', 304, 'NA'),
(85, 'GM', 'Gambia', 'Republic of the Gambia', 'GMB', 270, 'AF'),
(86, 'GN', 'Guinea', 'Republic of Guinea', 'GIN', 324, 'AF'),
(87, 'GP', 'Guadeloupe', 'Guadeloupe', 'GLP', 312, 'NA'),
(88, 'GQ', 'Equatorial Guinea', 'Republic of Equatorial Guinea', 'GNQ', 226, 'AF'),
(89, 'GR', 'Greece', 'Hellenic Republic Greece', 'GRC', 300, 'EU'),
(90, 'GS', 'South Georgia and the South Sandwich Islands', 'South Georgia and the South Sandwich Islands', 'SGS', 239, 'AN'),
(91, 'GT', 'Guatemala', 'Republic of Guatemala', 'GTM', 320, 'NA'),
(92, 'GU', 'Guam', 'Guam', 'GUM', 316, 'OC'),
(93, 'GW', 'Guinea-Bissau', 'Republic of Guinea-Bissau', 'GNB', 624, 'AF'),
(94, 'GY', 'Guyana', 'Co-operative Republic of Guyana', 'GUY', 328, 'SA'),
(95, 'HK', 'Hong Kong', 'Hong Kong Special Administrative Region of China', 'HKG', 344, 'AS'),
(96, 'HM', 'Heard Island and McDonald Islands', 'Heard Island and McDonald Islands', 'HMD', 334, 'AN'),
(97, 'HN', 'Honduras', 'Republic of Honduras', 'HND', 340, 'NA'),
(98, 'HR', 'Croatia', 'Republic of Croatia', 'HRV', 191, 'EU'),
(99, 'HT', 'Haiti', 'Republic of Haiti', 'HTI', 332, 'NA'),
(100, 'HU', 'Hungary', 'Hungary', 'HUN', 348, 'EU'),
(101, 'ID', 'Indonesia', 'Republic of Indonesia', 'IDN', 360, 'AS'),
(102, 'IE', 'Ireland', 'Ireland', 'IRL', 372, 'EU'),
(103, 'IL', 'Israel', 'State of Israel', 'ISR', 376, 'AS'),
(104, 'IM', 'Isle of Man', 'Isle of Man', 'IMN', 833, 'EU'),
(105, 'IN', 'India', 'Republic of India', 'IND', 356, 'AS'),
(106, 'IO', 'British Indian Ocean Territory (Chagos Archipelago)', 'British Indian Ocean Territory (Chagos Archipelago)', 'IOT', 086, 'AS'),
(107, 'IQ', 'Iraq', 'Republic of Iraq', 'IRQ', 368, 'AS'),
(108, 'IR', 'Iran', 'Islamic Republic of Iran', 'IRN', 364, 'AS'),
(109, 'IS', 'Iceland', 'Republic of Iceland', 'ISL', 352, 'EU'),
(110, 'IT', 'Italy', 'Italian Republic', 'ITA', 380, 'EU'),
(111, 'JE', 'Jersey', 'Bailiwick of Jersey', 'JEY', 832, 'EU'),
(112, 'JM', 'Jamaica', 'Jamaica', 'JAM', 388, 'NA'),
(113, 'JO', 'Jordan', 'Hashemite Kingdom of Jordan', 'JOR', 400, 'AS'),
(114, 'JP', 'Japan', 'Japan', 'JPN', 392, 'AS'),
(115, 'KE', 'Kenya', 'Republic of Kenya', 'KEN', 404, 'AF'),
(116, 'KG', 'Kyrgyz Republic', 'Kyrgyz Republic', 'KGZ', 417, 'AS'),
(117, 'KH', 'Cambodia', 'Kingdom of Cambodia', 'KHM', 116, 'AS'),
(118, 'KI', 'Kiribati', 'Republic of Kiribati', 'KIR', 296, 'OC'),
(119, 'KM', 'Comoros', 'Union of the Comoros', 'COM', 174, 'AF'),
(120, 'KN', 'Saint Kitts and Nevis', 'Federation of Saint Kitts and Nevis', 'KNA', 659, 'NA'),
(121, 'KP', 'Korea', 'Democratic People\'s Republic of Korea', 'PRK', 408, 'AS'),
(122, 'KR', 'Korea', 'Republic of Korea', 'KOR', 410, 'AS'),
(123, 'KW', 'Kuwait', 'State of Kuwait', 'KWT', 414, 'AS'),
(124, 'KY', 'Cayman Islands', 'Cayman Islands', 'CYM', 136, 'NA'),
(125, 'KZ', 'Kazakhstan', 'Republic of Kazakhstan', 'KAZ', 398, 'AS'),
(126, 'LA', 'Lao People\'s Democratic Republic', 'Lao People\'s Democratic Republic', 'LAO', 418, 'AS'),
(127, 'LB', 'Lebanon', 'Lebanese Republic', 'LBN', 422, 'AS'),
(128, 'LC', 'Saint Lucia', 'Saint Lucia', 'LCA', 662, 'NA'),
(129, 'LI', 'Liechtenstein', 'Principality of Liechtenstein', 'LIE', 438, 'EU'),
(130, 'LK', 'Sri Lanka', 'Democratic Socialist Republic of Sri Lanka', 'LKA', 144, 'AS'),
(131, 'LR', 'Liberia', 'Republic of Liberia', 'LBR', 430, 'AF'),
(132, 'LS', 'Lesotho', 'Kingdom of Lesotho', 'LSO', 426, 'AF'),
(133, 'LT', 'Lithuania', 'Republic of Lithuania', 'LTU', 440, 'EU'),
(134, 'LU', 'Luxembourg', 'Grand Duchy of Luxembourg', 'LUX', 442, 'EU'),
(135, 'LV', 'Latvia', 'Republic of Latvia', 'LVA', 428, 'EU'),
(136, 'LY', 'Libya', 'Libya', 'LBY', 434, 'AF'),
(137, 'MA', 'Morocco', 'Kingdom of Morocco', 'MAR', 504, 'AF'),
(138, 'MC', 'Monaco', 'Principality of Monaco', 'MCO', 492, 'EU'),
(139, 'MD', 'Moldova', 'Republic of Moldova', 'MDA', 498, 'EU'),
(140, 'ME', 'Montenegro', 'Montenegro', 'MNE', 499, 'EU'),
(141, 'MF', 'Saint Martin', 'Saint Martin (French part)', 'MAF', 663, 'NA'),
(142, 'MG', 'Madagascar', 'Republic of Madagascar', 'MDG', 450, 'AF'),
(143, 'MH', 'Marshall Islands', 'Republic of the Marshall Islands', 'MHL', 584, 'OC'),
(144, 'MK', 'Macedonia', 'Republic of Macedonia', 'MKD', 807, 'EU'),
(145, 'ML', 'Mali', 'Republic of Mali', 'MLI', 466, 'AF'),
(146, 'MM', 'Myanmar', 'Republic of the Union of Myanmar', 'MMR', 104, 'AS'),
(147, 'MN', 'Mongolia', 'Mongolia', 'MNG', 496, 'AS'),
(148, 'MO', 'Macao', 'Macao Special Administrative Region of China', 'MAC', 446, 'AS'),
(149, 'MP', 'Northern Mariana Islands', 'Commonwealth of the Northern Mariana Islands', 'MNP', 580, 'OC'),
(150, 'MQ', 'Martinique', 'Martinique', 'MTQ', 474, 'NA'),
(151, 'MR', 'Mauritania', 'Islamic Republic of Mauritania', 'MRT', 478, 'AF'),
(152, 'MS', 'Montserrat', 'Montserrat', 'MSR', 500, 'NA'),
(153, 'MT', 'Malta', 'Republic of Malta', 'MLT', 470, 'EU'),
(154, 'MU', 'Mauritius', 'Republic of Mauritius', 'MUS', 480, 'AF'),
(155, 'MV', 'Maldives', 'Republic of Maldives', 'MDV', 462, 'AS'),
(156, 'MW', 'Malawi', 'Republic of Malawi', 'MWI', 454, 'AF'),
(157, 'MX', 'Mexico', 'United Mexican States', 'MEX', 484, 'NA'),
(158, 'MY', 'Malaysia', 'Malaysia', 'MYS', 458, 'AS'),
(159, 'MZ', 'Mozambique', 'Republic of Mozambique', 'MOZ', 508, 'AF'),
(160, 'NA', 'Namibia', 'Republic of Namibia', 'NAM', 516, 'AF'),
(161, 'NC', 'New Caledonia', 'New Caledonia', 'NCL', 540, 'OC'),
(162, 'NE', 'Niger', 'Republic of Niger', 'NER', 562, 'AF'),
(163, 'NF', 'Norfolk Island', 'Norfolk Island', 'NFK', 574, 'OC'),
(164, 'NG', 'Nigeria', 'Federal Republic of Nigeria', 'NGA', 566, 'AF'),
(165, 'NI', 'Nicaragua', 'Republic of Nicaragua', 'NIC', 558, 'NA'),
(166, 'NL', 'Netherlands', 'Kingdom of the Netherlands', 'NLD', 528, 'EU'),
(167, 'NO', 'Norway', 'Kingdom of Norway', 'NOR', 578, 'EU'),
(168, 'NP', 'Nepal', 'Federal Democratic Republic of Nepal', 'NPL', 524, 'AS'),
(169, 'NR', 'Nauru', 'Republic of Nauru', 'NRU', 520, 'OC'),
(170, 'NU', 'Niue', 'Niue', 'NIU', 570, 'OC'),
(171, 'NZ', 'New Zealand', 'New Zealand', 'NZL', 554, 'OC'),
(172, 'OM', 'Oman', 'Sultanate of Oman', 'OMN', 512, 'AS'),
(173, 'PA', 'Panama', 'Republic of Panama', 'PAN', 591, 'NA'),
(174, 'PE', 'Peru', 'Republic of Peru', 'PER', 604, 'SA'),
(175, 'PF', 'French Polynesia', 'French Polynesia', 'PYF', 258, 'OC'),
(176, 'PG', 'Papua New Guinea', 'Independent State of Papua New Guinea', 'PNG', 598, 'OC'),
(177, 'PH', 'Philippines', 'Republic of the Philippines', 'PHL', 608, 'AS'),
(178, 'PK', 'Pakistan', 'Islamic Republic of Pakistan', 'PAK', 586, 'AS'),
(179, 'PL', 'Poland', 'Republic of Poland', 'POL', 616, 'EU'),
(180, 'PM', 'Saint Pierre and Miquelon', 'Saint Pierre and Miquelon', 'SPM', 666, 'NA'),
(181, 'PN', 'Pitcairn Islands', 'Pitcairn Islands', 'PCN', 612, 'OC'),
(182, 'PR', 'Puerto Rico', 'Commonwealth of Puerto Rico', 'PRI', 630, 'NA'),
(183, 'PS', 'Palestine', 'State of Palestine', 'PSE', 275, 'AS'),
(184, 'PT', 'Portugal', 'Portuguese Republic', 'PRT', 620, 'EU'),
(185, 'PW', 'Palau', 'Republic of Palau', 'PLW', 585, 'OC'),
(186, 'PY', 'Paraguay', 'Republic of Paraguay', 'PRY', 600, 'SA'),
(187, 'QA', 'Qatar', 'State of Qatar', 'QAT', 634, 'AS'),
(188, 'RE', 'Réunion', 'Réunion', 'REU', 638, 'AF'),
(189, 'RO', 'Romania', 'Romania', 'ROU', 642, 'EU'),
(190, 'RS', 'Serbia', 'Republic of Serbia', 'SRB', 688, 'EU'),
(191, 'RU', 'Russian Federation', 'Russian Federation', 'RUS', 643, 'EU'),
(192, 'RW', 'Rwanda', 'Republic of Rwanda', 'RWA', 646, 'AF'),
(193, 'SA', 'Saudi Arabia', 'Kingdom of Saudi Arabia', 'SAU', 682, 'AS'),
(194, 'SB', 'Solomon Islands', 'Solomon Islands', 'SLB', 090, 'OC'),
(195, 'SC', 'Seychelles', 'Republic of Seychelles', 'SYC', 690, 'AF'),
(196, 'SD', 'Sudan', 'Republic of Sudan', 'SDN', 729, 'AF'),
(197, 'SE', 'Sweden', 'Kingdom of Sweden', 'SWE', 752, 'EU'),
(198, 'SG', 'Singapore', 'Republic of Singapore', 'SGP', 702, 'AS'),
(199, 'SH', 'Saint Helena, Ascension and Tristan da Cunha', 'Saint Helena, Ascension and Tristan da Cunha', 'SHN', 654, 'AF'),
(200, 'SI', 'Slovenia', 'Republic of Slovenia', 'SVN', 705, 'EU'),
(201, 'SJ', 'Svalbard & Jan Mayen Islands', 'Svalbard & Jan Mayen Islands', 'SJM', 744, 'EU'),
(202, 'SK', 'Slovakia (Slovak Republic)', 'Slovakia (Slovak Republic)', 'SVK', 703, 'EU'),
(203, 'SL', 'Sierra Leone', 'Republic of Sierra Leone', 'SLE', 694, 'AF'),
(204, 'SM', 'San Marino', 'Republic of San Marino', 'SMR', 674, 'EU'),
(205, 'SN', 'Senegal', 'Republic of Senegal', 'SEN', 686, 'AF'),
(206, 'SO', 'Somalia', 'Federal Republic of Somalia', 'SOM', 706, 'AF'),
(207, 'SR', 'Suriname', 'Republic of Suriname', 'SUR', 740, 'SA'),
(208, 'SS', 'South Sudan', 'Republic of South Sudan', 'SSD', 728, 'AF'),
(209, 'ST', 'Sao Tome and Principe', 'Democratic Republic of Sao Tome and Principe', 'STP', 678, 'AF'),
(210, 'SV', 'El Salvador', 'Republic of El Salvador', 'SLV', 222, 'NA'),
(211, 'SX', 'Sint Maarten (Dutch part)', 'Sint Maarten (Dutch part)', 'SXM', 534, 'NA'),
(212, 'SY', 'Syrian Arab Republic', 'Syrian Arab Republic', 'SYR', 760, 'AS'),
(213, 'SZ', 'Swaziland', 'Kingdom of Swaziland', 'SWZ', 748, 'AF'),
(214, 'TC', 'Turks and Caicos Islands', 'Turks and Caicos Islands', 'TCA', 796, 'NA'),
(215, 'TD', 'Chad', 'Republic of Chad', 'TCD', 148, 'AF'),
(216, 'TF', 'French Southern Territories', 'French Southern Territories', 'ATF', 260, 'AN'),
(217, 'TG', 'Togo', 'Togolese Republic', 'TGO', 768, 'AF'),
(218, 'TH', 'Thailand', 'Kingdom of Thailand', 'THA', 764, 'AS'),
(219, 'TJ', 'Tajikistan', 'Republic of Tajikistan', 'TJK', 762, 'AS'),
(220, 'TK', 'Tokelau', 'Tokelau', 'TKL', 772, 'OC'),
(221, 'TL', 'Timor-Leste', 'Democratic Republic of Timor-Leste', 'TLS', 626, 'AS'),
(222, 'TM', 'Turkmenistan', 'Turkmenistan', 'TKM', 795, 'AS'),
(223, 'TN', 'Tunisia', 'Tunisian Republic', 'TUN', 788, 'AF'),
(224, 'TO', 'Tonga', 'Kingdom of Tonga', 'TON', 776, 'OC'),
(225, 'TR', 'Turkey', 'Republic of Turkey', 'TUR', 792, 'AS'),
(226, 'TT', 'Trinidad and Tobago', 'Republic of Trinidad and Tobago', 'TTO', 780, 'NA'),
(227, 'TV', 'Tuvalu', 'Tuvalu', 'TUV', 798, 'OC'),
(228, 'TW', 'Taiwan', 'Taiwan, Province of China', 'TWN', 158, 'AS'),
(229, 'TZ', 'Tanzania', 'United Republic of Tanzania', 'TZA', 834, 'AF'),
(230, 'UA', 'Ukraine', 'Ukraine', 'UKR', 804, 'EU'),
(231, 'UG', 'Uganda', 'Republic of Uganda', 'UGA', 800, 'AF'),
(232, 'UM', 'United States Minor Outlying Islands', 'United States Minor Outlying Islands', 'UMI', 581, 'OC'),
(233, 'US', 'United States of America', 'United States of America', 'USA', 840, 'NA'),
(234, 'UY', 'Uruguay', 'Eastern Republic of Uruguay', 'URY', 858, 'SA'),
(235, 'UZ', 'Uzbekistan', 'Republic of Uzbekistan', 'UZB', 860, 'AS'),
(236, 'VA', 'Holy See (Vatican City State)', 'Holy See (Vatican City State)', 'VAT', 336, 'EU'),
(237, 'VC', 'Saint Vincent and the Grenadines', 'Saint Vincent and the Grenadines', 'VCT', 670, 'NA'),
(238, 'VE', 'Venezuela', 'Bolivarian Republic of Venezuela', 'VEN', 862, 'SA'),
(239, 'VG', 'British Virgin Islands', 'British Virgin Islands', 'VGB', 092, 'NA'),
(240, 'VI', 'United States Virgin Islands', 'United States Virgin Islands', 'VIR', 850, 'NA'),
(241, 'VN', 'Vietnam', 'Socialist Republic of Vietnam', 'VNM', 704, 'AS'),
(242, 'VU', 'Vanuatu', 'Republic of Vanuatu', 'VUT', 548, 'OC'),
(243, 'WF', 'Wallis and Futuna', 'Wallis and Futuna', 'WLF', 876, 'OC'),
(244, 'WS', 'Samoa', 'Independent State of Samoa', 'WSM', 882, 'OC'),
(245, 'YE', 'Yemen', 'Yemen', 'YEM', 887, 'AS'),
(246, 'YT', 'Mayotte', 'Mayotte', 'MYT', 175, 'AF'),
(247, 'ZA', 'South Africa', 'Republic of South Africa', 'ZAF', 710, 'AF'),
(248, 'ZM', 'Zambia', 'Republic of Zambia', 'ZMB', 894, 'AF'),
(249, 'ZW', 'Zimbabwe', 'Republic of Zimbabwe', 'ZWE', 716, 'AF');

-- --------------------------------------------------------

--
-- Table structure for table `rtf_educations`
--

CREATE TABLE `rtf_educations` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `university_college` varchar(250) NOT NULL,
  `degree` varchar(200) NOT NULL,
  `from_year` bigint(20) NOT NULL,
  `to_year` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rtf_educations`
--

INSERT INTO `rtf_educations` (`id`, `user_id`, `country_id`, `university_college`, `degree`, `from_year`, `to_year`, `is_active`, `created`) VALUES
(1, 1, 1, 'GCUF', 'BSCS', 2018, 2018, 1, '2018-10-05 10:47:39');

-- --------------------------------------------------------

--
-- Table structure for table `rtf_experiences`
--

CREATE TABLE `rtf_experiences` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `title` tinytext NOT NULL,
  `company` varchar(200) NOT NULL,
  `start_month` bigint(20) NOT NULL,
  `start_year` bigint(20) NOT NULL,
  `end_month` bigint(20) DEFAULT NULL,
  `end_year` bigint(20) DEFAULT NULL,
  `summary` text NOT NULL,
  `currently_working_in` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rtf_experiences`
--

INSERT INTO `rtf_experiences` (`id`, `user_id`, `title`, `company`, `start_month`, `start_year`, `end_month`, `end_year`, `summary`, `currently_working_in`, `is_active`, `created`) VALUES
(1, 1, 'Developer', 'GCUF', 1, 2018, 12, 2018, 'Summary', 1, 1, '2018-10-06 01:09:02');

-- --------------------------------------------------------

--
-- Table structure for table `rtf_jobs`
--

CREATE TABLE `rtf_jobs` (
  `id` bigint(20) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rtf_jobs`
--

INSERT INTO `rtf_jobs` (`id`, `job_name`, `is_active`, `created`) VALUES
(1, 'Flyer Designing', 1, '2016-01-25 08:11:06'),
(2, 'Graphics Designing', 1, '2016-01-25 11:04:01'),
(3, 'Business Card Designing', 1, '2016-01-25 11:56:02'),
(4, 'Banner Designing', 1, '2016-01-25 11:25:04'),
(5, 'Brochure Designing', 1, '2016-01-25 11:49:06'),
(6, 'Advertising Campaign', 1, '2016-01-25 11:00:13'),
(7, 'Illusion Designing', 1, '2016-01-25 11:31:31'),
(8, 'Logo Designing', 1, '2016-01-25 11:59:32'),
(9, 'Video Editing', 1, '2016-01-25 02:13:50'),
(10, 'Magazine Designing', 1, '2016-01-26 05:38:56'),
(11, 'Flash Animation', 1, '2016-01-26 05:08:58'),
(12, 'Commercial', 1, '2016-01-26 06:35:11'),
(13, 'Web Designing', 1, '2016-01-26 06:22:14'),
(14, 'Print Designing', 1, '2016-01-26 06:21:16'),
(15, 'Making a Sign', 1, '2016-01-26 06:03:17'),
(16, 'Billboard Designing', 1, '2016-01-26 06:57:17'),
(17, 'Poster Designing', 1, '2016-01-26 06:36:18'),
(18, 'Illustrator Imagery', 1, '2016-01-26 06:57:18'),
(19, 'Photographic Illustrations', 1, '2016-01-26 06:51:19'),
(20, 'Photo Editing', 1, '2016-01-26 06:25:20'),
(21, 'Sketches', 1, '2016-01-26 06:59:30'),
(22, 'Icons', 1, '2016-01-26 04:00:59'),
(23, '3D Designing', 1, '2016-01-26 04:56:59'),
(24, 'Animation', 1, '2016-01-26 05:36:01'),
(25, 'Visual Effect', 1, '2016-01-26 05:20:07'),
(26, 'Design a Social Media Campaign', 1, '2016-01-26 05:05:09'),
(27, 'Wedding Album', 1, '2016-01-26 05:49:09'),
(28, 'Stationery', 1, '2016-01-26 05:33:10'),
(29, '3D Animation', 1, '2016-01-26 05:45:12'),
(30, '3D Character Animation', 1, '2016-01-26 05:44:13'),
(31, 'Games Animation', 1, '2016-01-26 05:53:14'),
(32, 'Label Designing', 1, '2016-01-26 05:03:18'),
(33, 'Audio Services', 1, '2016-01-26 05:36:20'),
(34, 'Shirt Designing', 1, '2016-01-26 05:15:21'),
(35, 'Vehicle Lettering', 1, '2016-01-26 05:58:21'),
(36, 'Infographics', 1, '2016-01-26 05:59:22'),
(37, 'Interior Designing', 1, '2016-01-26 05:03:24'),
(38, 'Fashion Designing', 1, '2016-01-26 05:49:24'),
(39, 'Tattoo Designing', 1, '2016-01-26 05:37:25'),
(40, 'Arts & Crafts', 1, '2016-01-26 05:57:26'),
(41, 'Develop Mobile Website', 1, '2016-01-26 05:02:28'),
(42, 'Android Application', 1, '2016-01-26 05:41:28'),
(43, 'IPad Application', 1, '2016-01-26 05:55:29'),
(44, 'Iphone Application', 1, '2016-01-26 05:29:31'),
(45, 'Black Berry Application', 1, '2016-01-26 05:46:33'),
(46, 'Window Application', 1, '2016-01-26 05:48:34'),
(47, 'Business Application', 1, '2016-01-26 05:40:35'),
(48, 'Game Development', 1, '2016-01-26 05:56:36'),
(49, 'Unity 3D', 1, '2016-01-26 05:52:38'),
(50, 'Native games development', 1, '2016-01-26 05:53:39'),
(51, 'Php development', 1, '2016-01-26 05:37:40'),
(52, '.Net development', 1, '2016-01-26 05:44:41'),
(53, 'Desktop applications development', 1, '2016-01-26 05:44:42'),
(54, 'Mac apps development', 1, '2016-01-26 05:17:44'),
(55, 'Front-End Development', 1, '2016-01-26 05:54:45'),
(56, 'Back-end Development', 1, '2016-01-26 05:31:47'),
(57, 'Full-stack Development', 1, '2016-01-26 05:42:49'),
(58, 'App Development', 1, '2016-01-26 05:11:51'),
(59, 'Applications software', 1, '2016-01-26 05:49:52'),
(60, 'Software’s Developing', 1, '2016-01-26 05:56:56'),
(61, 'Website Developing', 1, '2016-01-26 06:08:02'),
(62, 'System software', 1, '2016-01-26 06:53:04'),
(63, 'Database Software', 1, '2016-01-26 06:53:05'),
(64, 'Communications Software', 1, '2016-01-26 06:48:06'),
(65, 'Wordpress', 1, '2016-01-26 06:15:08'),
(66, 'Joomla', 1, '2016-01-26 06:09:09'),
(67, 'Chat System/ Email System', 1, '2016-01-26 06:59:09'),
(68, 'Drupal', 1, '2016-01-26 06:23:14'),
(69, 'Game Developer', 1, '2016-01-26 06:25:15'),
(70, 'QA Tester', 1, '2016-01-26 06:15:17'),
(71, 'Desktop App', 1, '2016-01-26 06:59:23'),
(72, 'UX Developer', 1, '2016-01-26 06:25:25'),
(73, 'Cause Marketing', 1, '2016-01-26 06:50:29'),
(74, 'Close Range Marketing', 1, '2016-01-26 06:27:30'),
(75, 'Viral Marketing', 1, '2016-01-26 06:14:31'),
(76, 'Email Marketing', 1, '2016-01-26 06:25:32'),
(77, 'Online Marketing', 1, '2016-01-26 06:30:33'),
(78, 'Offline Marketing', 1, '2016-01-26 06:35:34'),
(79, 'Article Marketing', 1, '2016-01-26 06:23:35'),
(80, 'Content Marketing', 1, '2016-01-26 06:09:36'),
(81, 'Search Marketing', 1, '2016-01-26 06:11:37'),
(82, 'Direct Marketing', 1, '2016-01-26 06:02:38'),
(83, 'Community Marketing', 1, '2016-01-26 06:11:39'),
(84, 'B2B Marketing', 1, '2016-01-26 06:00:40'),
(85, 'B2C Marketing', 1, '2016-01-26 06:21:41'),
(86, 'Social Media Marketing', 1, '2016-01-26 06:10:42'),
(87, 'Cross-Media Marketing', 1, '2016-01-26 06:57:42'),
(88, 'Promotional Marketing', 1, '2016-01-26 06:56:43'),
(89, 'Cloud Marketing', 1, '2016-01-26 06:44:46'),
(91, 'Mobile Marketing', 1, '2016-01-26 06:22:48'),
(92, 'Telemarketing', 1, '2016-01-26 06:41:49'),
(93, 'Article writers', 1, '2016-01-26 10:34:26'),
(94, 'Business writers', 1, '2016-01-26 10:53:27'),
(95, 'Columnists', 1, '2016-01-26 10:43:29'),
(96, 'Copywriters', 1, '2016-01-26 10:10:30'),
(97, 'Erotica writers', 1, '2016-01-26 10:50:30'),
(98, 'Game Writers', 1, '2016-01-26 10:53:31'),
(99, 'Ghostwriters', 1, '2016-01-26 10:47:32'),
(100, 'Grant writers', 1, '2016-01-26 10:27:33'),
(101, 'Book Writers', 1, '2016-01-26 10:14:34'),
(102, 'Novelists', 1, '2016-01-26 10:06:35'),
(103, 'Online Writers', 1, '2016-01-26 10:53:35'),
(104, 'Play Writers', 1, '2016-01-26 10:58:36'),
(105, 'Write a Report', 1, '2016-01-26 10:56:37'),
(106, 'Write a Press Release', 1, '2016-01-26 10:40:38'),
(107, 'Resume & Cover Letter', 1, '2016-01-26 10:28:39'),
(108, 'Screenwriters', 1, '2016-01-26 10:30:41'),
(109, 'Songwriters', 1, '2016-01-26 10:20:47'),
(111, 'Staff writers', 1, '2016-01-26 10:07:55'),
(112, 'Chemical Engineering', 1, '2016-01-26 11:53:04'),
(113, 'Mechanical Engineering', 1, '2016-01-26 11:29:06'),
(114, 'Electrical / Electronics Engineering', 1, '2016-01-26 11:33:08'),
(115, 'Biomedical Engineering', 1, '2016-01-26 11:51:09'),
(116, 'Civil Engineering', 1, '2016-01-26 11:13:11'),
(117, 'Agronomist', 1, '2016-01-26 11:17:12'),
(118, 'Botany', 1, '2016-01-26 11:24:13'),
(119, 'Microbiologist', 1, '2016-01-26 11:40:14'),
(120, 'Architecture', 1, '2016-01-26 11:20:16'),
(121, 'Data Entry Keyer', 1, '2016-01-26 11:15:17'),
(122, 'Word Processor', 1, '2016-01-26 11:53:18'),
(123, 'Plain Data Entry Job', 1, '2016-01-26 11:31:19'),
(124, 'Survey Forms', 1, '2016-01-26 11:32:20'),
(125, 'Captcha Entry Job', 1, '2016-01-26 11:31:21'),
(126, 'Form Filling', 1, '2016-01-26 11:36:22'),
(127, 'Re-formatting & Correction', 1, '2016-01-26 11:44:23'),
(128, 'Convert Audio to Text Format', 1, '2016-01-26 11:17:24'),
(129, 'Transcriptionist', 1, '2016-01-26 11:02:25'),
(130, 'Captioning', 1, '2016-01-26 11:14:26'),
(131, 'Data Entry Forms', 1, '2016-01-26 11:03:29'),
(132, 'Custom Forms', 1, '2016-01-26 11:21:30'),
(133, 'Financial Data Entry', 1, '2016-01-26 11:29:31'),
(134, 'Assistant Manager', 1, '2016-01-26 11:50:32'),
(135, 'Accountant', 1, '2016-01-26 11:58:36'),
(136, 'Finance consultant', 1, '2016-01-26 11:06:38'),
(137, 'Executive Accounts', 1, '2016-01-26 11:48:38'),
(138, 'Sales Tax Executive', 1, '2016-01-26 11:19:45'),
(139, 'Marketing Executive', 1, '2016-01-26 11:25:46');

-- --------------------------------------------------------

--
-- Table structure for table `rtf_job_skills`
--

CREATE TABLE `rtf_job_skills` (
  `id` bigint(20) NOT NULL,
  `skill_category_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `job_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rtf_job_skills`
--

INSERT INTO `rtf_job_skills` (`id`, `skill_category_id`, `skill_id`, `job_id`) VALUES
(5, 7, 763, 2),
(6, 7, 775, 2),
(7, 7, 37, 2),
(8, 7, 932, 2),
(9, 7, 760, 2),
(10, 7, 778, 2),
(11, 7, 931, 3),
(12, 7, 775, 3),
(13, 7, 37, 3),
(14, 7, 760, 3),
(15, 7, 775, 4),
(16, 7, 37, 4),
(17, 7, 932, 4),
(18, 7, 760, 4),
(19, 7, 775, 5),
(20, 7, 37, 5),
(21, 7, 932, 5),
(22, 7, 760, 5),
(23, 7, 763, 6),
(24, 7, 39, 6),
(25, 7, 764, 6),
(26, 7, 775, 6),
(27, 7, 754, 6),
(28, 7, 37, 6),
(29, 7, 932, 6),
(30, 7, 760, 6),
(31, 7, 778, 6),
(32, 7, 763, 7),
(33, 7, 775, 7),
(34, 7, 37, 7),
(35, 7, 325, 7),
(36, 7, 760, 7),
(37, 7, 37, 8),
(38, 7, 760, 8),
(39, 7, 306, 9),
(40, 7, 47, 9),
(41, 7, 304, 9),
(42, 7, 317, 9),
(43, 7, 336, 9),
(44, 7, 760, 10),
(45, 7, 37, 10),
(46, 7, 775, 10),
(47, 7, 764, 10),
(48, 7, 778, 10),
(49, 7, 754, 11),
(50, 7, 947, 11),
(51, 7, 306, 12),
(52, 7, 304, 12),
(53, 7, 42, 12),
(54, 7, 182, 12),
(55, 7, 763, 12),
(56, 7, 935, 13),
(57, 7, 760, 13),
(58, 7, 934, 13),
(59, 7, 937, 13),
(60, 7, 936, 13),
(61, 7, 41, 13),
(62, 7, 760, 14),
(63, 7, 37, 14),
(64, 7, 775, 14),
(65, 7, 764, 14),
(66, 7, 932, 14),
(67, 7, 760, 15),
(68, 7, 37, 15),
(69, 7, 775, 15),
(70, 7, 760, 16),
(71, 7, 37, 16),
(72, 7, 775, 16),
(73, 7, 778, 16),
(74, 7, 760, 17),
(75, 7, 37, 17),
(76, 7, 775, 17),
(77, 7, 37, 18),
(78, 7, 760, 19),
(79, 7, 37, 19),
(80, 7, 775, 19),
(81, 7, 760, 20),
(82, 7, 37, 20),
(83, 7, 775, 20),
(84, 7, 938, 21),
(85, 7, 760, 21),
(86, 7, 37, 21),
(87, 7, 939, 22),
(88, 7, 37, 22),
(89, 7, 775, 22),
(90, 7, 760, 22),
(91, 7, 755, 23),
(92, 7, 763, 23),
(93, 7, 37, 23),
(94, 7, 940, 23),
(95, 7, 42, 24),
(96, 7, 322, 24),
(97, 7, 763, 24),
(98, 7, 321, 24),
(99, 7, 314, 24),
(100, 7, 301, 24),
(101, 7, 182, 24),
(102, 7, 42, 25),
(103, 7, 763, 25),
(104, 7, 314, 25),
(105, 7, 301, 25),
(106, 7, 325, 25),
(107, 7, 53, 25),
(108, 7, 760, 26),
(109, 7, 37, 26),
(110, 7, 775, 26),
(111, 7, 763, 26),
(112, 7, 778, 26),
(113, 7, 932, 26),
(114, 7, 754, 26),
(115, 7, 764, 26),
(116, 7, 39, 26),
(117, 7, 933, 27),
(118, 7, 760, 27),
(119, 7, 760, 28),
(120, 7, 37, 28),
(121, 7, 775, 28),
(122, 7, 763, 29),
(123, 7, 325, 29),
(124, 7, 314, 29),
(125, 7, 53, 29),
(126, 7, 763, 30),
(127, 7, 325, 30),
(128, 7, 342, 30),
(129, 7, 314, 30),
(130, 7, 763, 31),
(131, 7, 325, 31),
(132, 7, 342, 31),
(133, 7, 53, 31),
(134, 7, 754, 31),
(135, 7, 760, 32),
(136, 7, 37, 32),
(137, 7, 775, 32),
(138, 7, 349, 33),
(139, 7, 338, 33),
(140, 7, 337, 33),
(141, 7, 789, 33),
(142, 7, 760, 34),
(143, 7, 37, 34),
(144, 7, 775, 34),
(145, 7, 760, 35),
(146, 7, 37, 35),
(147, 7, 775, 35),
(148, 7, 760, 36),
(149, 7, 37, 36),
(150, 7, 775, 36),
(151, 7, 331, 36),
(152, 7, 763, 36),
(153, 7, 325, 36),
(154, 7, 944, 37),
(155, 7, 37, 37),
(156, 7, 775, 37),
(157, 7, 763, 37),
(158, 7, 325, 37),
(159, 7, 942, 38),
(160, 7, 943, 38),
(161, 7, 941, 39),
(162, 7, 37, 39),
(163, 7, 944, 40),
(164, 7, 946, 40),
(165, 7, 37, 40),
(166, 7, 775, 40),
(167, 7, 760, 40),
(168, 7, 763, 40),
(169, 8, 790, 41),
(170, 8, 791, 41),
(171, 8, 64, 41),
(172, 8, 792, 41),
(173, 8, 793, 42),
(174, 8, 795, 42),
(175, 8, 799, 42),
(176, 8, 794, 43),
(177, 8, 795, 43),
(178, 8, 796, 43),
(179, 8, 64, 43),
(180, 8, 792, 43),
(181, 8, 804, 44),
(182, 8, 800, 44),
(183, 8, 852, 44),
(184, 8, 801, 44),
(185, 8, 797, 45),
(186, 8, 805, 45),
(187, 8, 806, 45),
(188, 8, 809, 46),
(189, 8, 810, 46),
(190, 8, 790, 47),
(191, 8, 804, 47),
(192, 8, 64, 47),
(193, 8, 792, 47),
(194, 8, 796, 47),
(195, 8, 58, 48),
(196, 8, 64, 48),
(197, 8, 804, 48),
(198, 8, 792, 48),
(199, 8, 793, 49),
(200, 8, 58, 50),
(201, 8, 64, 50),
(202, 8, 355, 50),
(203, 8, 806, 51),
(204, 8, 793, 52),
(205, 8, 795, 52),
(206, 8, 792, 52),
(207, 8, 810, 53),
(208, 8, 800, 53),
(209, 8, 351, 53),
(210, 8, 852, 53),
(211, 8, 802, 54),
(212, 8, 797, 54),
(213, 8, 804, 54),
(214, 8, 792, 54),
(215, 9, 425, 55),
(216, 9, 382, 55),
(217, 9, 435, 55),
(218, 9, 437, 55),
(219, 9, 841, 55),
(220, 9, 500, 56),
(221, 9, 508, 56),
(222, 9, 447, 56),
(223, 9, 840, 56),
(224, 9, 466, 56),
(225, 9, 488, 56),
(226, 9, 500, 57),
(227, 9, 85, 57),
(228, 9, 425, 57),
(229, 9, 435, 57),
(230, 9, 71, 57),
(231, 9, 842, 57),
(232, 9, 366, 57),
(233, 9, 557, 58),
(234, 9, 840, 59),
(235, 9, 488, 59),
(236, 9, 529, 59),
(237, 9, 591, 60),
(238, 9, 426, 60),
(239, 9, 382, 60),
(240, 9, 435, 60),
(241, 9, 73, 60),
(242, 9, 437, 60),
(243, 9, 475, 61),
(244, 9, 542, 61),
(245, 9, 77, 61),
(246, 9, 500, 62),
(247, 9, 466, 62),
(248, 9, 481, 62),
(249, 9, 521, 62),
(250, 9, 475, 63),
(251, 9, 488, 63),
(252, 9, 844, 63),
(253, 9, 71, 64),
(254, 9, 475, 64),
(255, 9, 488, 64),
(256, 9, 842, 64),
(257, 9, 500, 64),
(258, 9, 845, 65),
(259, 9, 846, 65),
(260, 9, 847, 65),
(261, 9, 425, 65),
(262, 9, 382, 65),
(263, 9, 848, 66),
(264, 9, 849, 66),
(265, 9, 850, 66),
(266, 9, 73, 67),
(267, 9, 481, 67),
(268, 9, 542, 67),
(269, 9, 71, 68),
(270, 9, 426, 68),
(271, 9, 382, 68),
(272, 9, 500, 68),
(273, 9, 435, 68),
(274, 9, 488, 69),
(275, 9, 509, 70),
(276, 9, 488, 71),
(277, 9, 500, 71),
(278, 9, 77, 71),
(279, 9, 500, 72),
(280, 9, 542, 72),
(281, 9, 481, 72),
(282, 11, 811, 73),
(283, 11, 812, 73),
(284, 11, 813, 74),
(285, 11, 814, 75),
(286, 11, 612, 75),
(287, 11, 815, 75),
(288, 11, 816, 76),
(289, 11, 816, 77),
(290, 11, 815, 77),
(291, 11, 819, 77),
(292, 11, 820, 77),
(293, 11, 821, 78),
(294, 11, 822, 78),
(295, 11, 823, 78),
(296, 11, 635, 79),
(297, 11, 119, 79),
(298, 11, 839, 79),
(299, 11, 815, 79),
(300, 11, 826, 80),
(301, 11, 815, 80),
(302, 11, 839, 80),
(303, 11, 828, 81),
(304, 11, 827, 81),
(305, 11, 815, 81),
(306, 11, 813, 82),
(307, 11, 829, 82),
(308, 11, 830, 82),
(309, 11, 831, 83),
(310, 11, 813, 83),
(311, 11, 832, 83),
(312, 11, 828, 84),
(313, 11, 827, 84),
(314, 11, 833, 84),
(315, 11, 822, 85),
(316, 11, 823, 85),
(317, 11, 829, 85),
(318, 11, 813, 86),
(319, 11, 834, 86),
(320, 11, 831, 87),
(321, 11, 835, 87),
(322, 11, 836, 88),
(323, 11, 823, 88),
(324, 11, 126, 88),
(325, 11, 837, 88),
(326, 11, 815, 89),
(327, 11, 816, 89),
(328, 11, 119, 89),
(329, 11, 839, 89),
(331, 11, 126, 91),
(332, 11, 837, 91),
(333, 11, 827, 91),
(334, 11, 813, 92),
(335, 11, 821, 92),
(336, 12, 652, 93),
(337, 12, 651, 93),
(338, 12, 148, 94),
(339, 12, 135, 94),
(340, 12, 853, 94),
(341, 12, 651, 95),
(342, 12, 855, 96),
(343, 12, 856, 97),
(344, 12, 651, 97),
(345, 12, 857, 98),
(346, 12, 858, 98),
(347, 12, 859, 98),
(348, 12, 651, 99),
(349, 12, 853, 100),
(350, 12, 135, 101),
(351, 12, 651, 102),
(352, 12, 652, 102),
(353, 12, 855, 103),
(354, 12, 856, 104),
(355, 12, 651, 104),
(356, 12, 148, 105),
(357, 12, 651, 106),
(358, 12, 858, 107),
(359, 12, 652, 107),
(360, 12, 856, 108),
(361, 12, 853, 108),
(362, 12, 135, 109),
(365, 12, 646, 111),
(366, 12, 149, 111),
(367, 15, 878, 112),
(368, 15, 879, 112),
(369, 15, 890, 112),
(370, 15, 881, 112),
(371, 15, 882, 112),
(372, 15, 883, 112),
(373, 15, 696, 112),
(374, 15, 885, 112),
(375, 15, 886, 113),
(376, 15, 887, 113),
(377, 15, 888, 113),
(378, 15, 889, 113),
(379, 15, 890, 114),
(380, 15, 891, 114),
(381, 15, 892, 114),
(382, 15, 893, 114),
(383, 15, 894, 114),
(384, 15, 895, 114),
(385, 15, 896, 114),
(386, 15, 897, 114),
(387, 15, 898, 114),
(388, 15, 730, 114),
(389, 15, 899, 115),
(390, 15, 900, 115),
(391, 15, 901, 115),
(392, 15, 902, 115),
(393, 15, 903, 115),
(394, 15, 904, 115),
(395, 15, 905, 116),
(396, 15, 906, 116),
(397, 15, 907, 116),
(398, 15, 908, 116),
(399, 15, 909, 116),
(400, 15, 910, 116),
(401, 15, 911, 116),
(402, 15, 912, 117),
(403, 15, 913, 117),
(404, 15, 914, 117),
(405, 15, 915, 117),
(406, 15, 916, 117),
(407, 15, 917, 117),
(408, 15, 918, 118),
(409, 15, 919, 118),
(410, 15, 920, 118),
(411, 15, 921, 118),
(412, 15, 922, 119),
(413, 15, 923, 119),
(414, 15, 924, 119),
(415, 15, 925, 119),
(416, 15, 926, 119),
(417, 15, 927, 119),
(418, 15, 204, 120),
(419, 15, 929, 120),
(420, 15, 211, 120),
(421, 15, 928, 120),
(422, 15, 930, 120),
(423, 15, 206, 120),
(424, 16, 233, 121),
(425, 16, 860, 121),
(426, 16, 862, 122),
(427, 16, 860, 123),
(428, 16, 863, 124),
(429, 16, 864, 124),
(430, 16, 865, 124),
(431, 16, 866, 125),
(432, 16, 234, 125),
(433, 16, 868, 125),
(434, 16, 231, 126),
(435, 16, 861, 126),
(436, 16, 860, 126),
(437, 16, 869, 126),
(438, 16, 868, 127),
(439, 16, 870, 127),
(440, 16, 871, 128),
(441, 16, 233, 128),
(442, 16, 860, 129),
(443, 16, 869, 129),
(444, 16, 868, 129),
(445, 16, 872, 129),
(446, 16, 873, 130),
(447, 16, 874, 130),
(448, 16, 875, 130),
(449, 16, 876, 130),
(450, 16, 860, 131),
(451, 16, 869, 131),
(452, 16, 232, 131),
(453, 16, 224, 131),
(454, 16, 231, 132),
(455, 16, 861, 132),
(456, 16, 860, 132),
(457, 16, 869, 132),
(458, 16, 224, 132),
(459, 16, 233, 133),
(460, 16, 222, 133),
(461, 16, 872, 133),
(462, 13, 153, 134),
(463, 13, 152, 134),
(464, 13, 154, 135),
(465, 13, 164, 135),
(466, 13, 165, 135),
(467, 13, 173, 136),
(468, 13, 172, 136),
(469, 13, 167, 136),
(470, 13, 162, 137),
(471, 13, 157, 137),
(472, 13, 156, 137),
(473, 13, 157, 138),
(474, 13, 156, 138),
(475, 13, 167, 139),
(480, 7, 775, 1),
(481, 7, 37, 1),
(482, 7, 932, 1),
(483, 7, 760, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rtf_membership_plans`
--

CREATE TABLE `rtf_membership_plans` (
  `id` bigint(20) NOT NULL,
  `type` enum('free_lancer','employer') NOT NULL DEFAULT 'free_lancer',
  `package_name` varchar(200) NOT NULL,
  `package_price` varchar(200) NOT NULL,
  `fixe_price_project_fee_heading` varchar(200) NOT NULL,
  `fixe_price_project_fee` char(255) NOT NULL,
  `fixe_price_project_fee_detail` tinytext NOT NULL,
  `hourly_project_fee_heading` varchar(200) NOT NULL,
  `hourly_project_fee` char(255) NOT NULL,
  `hourly_project_fee_detail` tinytext NOT NULL,
  `bids_per_month_heading` varchar(200) NOT NULL,
  `bids_per_month` bigint(20) NOT NULL,
  `bids_per_month_detail` char(255) NOT NULL,
  `total_skills_heading` varchar(200) NOT NULL,
  `total_skills` bigint(20) NOT NULL,
  `total_skills_detail` tinytext NOT NULL,
  `service_listings_heading` varchar(200) NOT NULL,
  `service_listings` bigint(20) NOT NULL,
  `service_listings_detail` tinytext NOT NULL,
  `expres_widhdralws_heading` varchar(200) NOT NULL,
  `expres_widhdralws` tinyint(1) NOT NULL,
  `expres_widhdralws_detail` tinytext NOT NULL,
  `unlock_rewards_heading` varchar(200) NOT NULL,
  `unlock_rewards` tinyint(1) NOT NULL,
  `unlock_rewards_detail` tinytext NOT NULL,
  `project_bookmarks_heading` varchar(200) NOT NULL,
  `project_bookmarks` tinyint(1) NOT NULL,
  `project_bookmarks_detail` tinytext NOT NULL,
  `perffered_freelancer_heading` varchar(200) NOT NULL,
  `perffered_freelancer` tinyint(1) NOT NULL,
  `perffered_freelancer_detail` tinytext NOT NULL,
  `employer_following_heading` varchar(200) NOT NULL,
  `employer_following` char(255) NOT NULL,
  `employer_following_detail` tinytext NOT NULL,
  `external_invoicing_heading` varchar(200) NOT NULL,
  `external_invoicing` char(255) NOT NULL,
  `external_invoicing_detail` tinytext NOT NULL,
  `employeer_fixe_price_project_fee_heading` varchar(200) NOT NULL,
  `employeer_fixe_price_project_fee` char(200) NOT NULL,
  `employeer_fixe_price_project_fee_detail` tinytext NOT NULL,
  `employeer_hourly_project_fee_heading` varchar(200) NOT NULL,
  `employeer_hourly_project_fee` varchar(200) NOT NULL,
  `employeer_hourly_project_fee_detail` tinytext NOT NULL,
  `free_project_extensions_heading` varchar(200) NOT NULL,
  `free_project_extensions` tinyint(1) NOT NULL,
  `free_project_extensions_detail` tinytext NOT NULL,
  `free_sealed_projects_heading` varchar(200) NOT NULL,
  `free_sealed_projects` tinyint(1) NOT NULL,
  `free_sealed_projects_detail` tinytext NOT NULL,
  `free_nda_project_heading` varchar(200) NOT NULL,
  `free_nda_project` tinyint(1) NOT NULL,
  `free_nda_project_detail` tinytext NOT NULL,
  `currency_id` varchar(50) NOT NULL DEFAULT 'USD',
  `is_active` tinyint(1) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rtf_membership_plans`
--

INSERT INTO `rtf_membership_plans` (`id`, `type`, `package_name`, `package_price`, `fixe_price_project_fee_heading`, `fixe_price_project_fee`, `fixe_price_project_fee_detail`, `hourly_project_fee_heading`, `hourly_project_fee`, `hourly_project_fee_detail`, `bids_per_month_heading`, `bids_per_month`, `bids_per_month_detail`, `total_skills_heading`, `total_skills`, `total_skills_detail`, `service_listings_heading`, `service_listings`, `service_listings_detail`, `expres_widhdralws_heading`, `expres_widhdralws`, `expres_widhdralws_detail`, `unlock_rewards_heading`, `unlock_rewards`, `unlock_rewards_detail`, `project_bookmarks_heading`, `project_bookmarks`, `project_bookmarks_detail`, `perffered_freelancer_heading`, `perffered_freelancer`, `perffered_freelancer_detail`, `employer_following_heading`, `employer_following`, `employer_following_detail`, `external_invoicing_heading`, `external_invoicing`, `external_invoicing_detail`, `employeer_fixe_price_project_fee_heading`, `employeer_fixe_price_project_fee`, `employeer_fixe_price_project_fee_detail`, `employeer_hourly_project_fee_heading`, `employeer_hourly_project_fee`, `employeer_hourly_project_fee_detail`, `free_project_extensions_heading`, `free_project_extensions`, `free_project_extensions_detail`, `free_sealed_projects_heading`, `free_sealed_projects`, `free_sealed_projects_detail`, `free_nda_project_heading`, `free_nda_project`, `free_nda_project_detail`, `currency_id`, `is_active`, `created`) VALUES
(1, 'free_lancer', 'Basic Plan', '0.00', 'Fixed Project Fee', '6', '6', 'Hourly Project Fee', '6', '6', 'Bids Per Month', 35, '35', 'Skills', 16, '', 'Service Listing', 3, '3', 'Express Withdrawls', 1, 'Express Withdrawls', 'Unlock Rewards', 0, '', 'Project Bookmarks', 0, '', 'Perffered Freelancer', 0, 'Perffered Freelancer', 'Employeer Following', '', '', 'External Invoicing', '', '', 'Fixed Project Fee', '2', '2', 'Hourly Project Fee', '2', '2', 'Free Project Extention', 0, '', 'Free sealed Projects', 0, '', 'Free NDA Projects', 0, '', 'USD', 1, '2015-10-26 00:00:00'),
(2, 'free_lancer', 'Pro Plan', '3.90', 'Fixed Project Fee', '5', '5', 'Hourly Project Fee', '5', '5', 'Bids Per Month', 80, 'External Heading', 'Skills', 20, 'External Heading', 'Service Listing', 5, 'External Heading', 'Express Withdrawls', 1, 'External Heading', 'Unlock Rewards', 1, 'External Heading', 'Project Bookmarks', 1, '', 'Perffered Freelancer', 1, 'External Heading', 'Employeer Following', '1.80', '', 'External Heading', '2', 'External Heading', 'Fixed Project Fee', '1.80', '1.80', 'Hourly Project Fee', '1.80', '1.80', 'Free Project Extention', 1, 'External Heading', 'Free sealed Projects', 0, 'External Heading', 'Free NDA Projects', 1, 'External Heading', 'USD', 1, '2015-10-26 00:00:00'),
(3, 'free_lancer', 'Buisness Plan', '29.90', 'Fixed Project Fee', '4', '4', 'Hourly Project Fee', '4', '4', 'Bids Per Month', 500, '2', 'Skills', 20, '20', 'Service Listing', 3, 'Service Heading ', 'Express Withdrawls', 1, 'Service Heading ', 'Unlock Rewards', 1, 'Service Heading ', 'Project Bookmarks', 1, '', 'Perffered Freelancer', 1, 'Service Heading ', 'Employeer Following', '3', '', 'External Heading', '2', 'Service Heading ', 'Fixed Project Fee', '1', '1', 'Hourly Project Fee', '1', 'Service Heading ', 'Free Project Extention', 1, 'Service Heading ', 'Free sealed Projects', 0, 'Service Heading ', 'Free NDA Projects', 1, 'Service Heading ', 'USD', 1, '2015-10-27 00:00:00'),
(4, 'free_lancer', 'Mega Plan', '99.90', 'Fixed Project Fee', '3', '3', 'Hourly Project Fee', '3', '3', 'Bids Per Month', 1600, 'Mega', 'Skills', 60, 'Plus', 'Service Listing', 3, 'Plus', 'Express Withdrawls', 1, 'Plus', 'Unlock Rewards', 1, 'Plus', 'Project Bookmarks', 1, '', 'Perffered Freelancer', 1, 'Plus', 'Employeer Following', '2', '', 'External Heading', '2', '', 'Fixed Project Fee', '0', '0', 'Hourly Project Fee', '0', '0', 'Free Project Extention', 1, '', 'Free sealed Projects', 0, 'Mega', 'Free NDA Projects', 1, 'Plus', 'USD', 1, '2015-10-27 00:00:00'),
(5, 'free_lancer', 'Basic Plan', '0.00', '', '', '', '', '', '', '', 80, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'AUD', 1, '2015-11-10 00:00:00'),
(6, 'free_lancer', 'Basic Plan', '0.00', '6%', '6%', '6%', '6%', '6%', '6%', '16', 16, '16', '', 0, '', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'CAD', 1, '2015-11-10 00:00:00'),
(7, 'free_lancer', 'Basic Plan', '$0.00', '', '6283.746283.74%', '', '1404.19%', '1404.19%', '1404.19', '16', 16, '16', '', 16, '', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'CLP', 1, '2015-11-10 00:00:00'),
(8, 'free_lancer', 'Basic Plan', '$0.00', '', '8.33', '8.33', '', '1.33', '1.33', '', 16, '16', '', 16, '', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'EUR', 1, '2015-11-10 00:00:00'),
(9, 'free_lancer', 'Basic Plan', '0.00', '', '5.92', '5.92', '', '1.32', '1.32', '', 16, '16', '', 16, '16', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'GBP', 1, '2015-11-10 00:00:00'),
(10, 'free_lancer', 'Basic Plan', '0', '', '69.37', '69.37', '', '15.50', '15.50', '', 16, '16', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'HKD', 1, '2015-11-10 00:00:00'),
(11, 'free_lancer', 'Basic Plan', '0.00', '', '121617.07', '121617.07', '', '27177.00', '27177.00', '', 16, '16', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'IDR', 1, '2015-11-10 00:00:00'),
(12, 'free_lancer', 'Basic Plan', '0.00', '', '593.88', '593.88', '', '132.71', '132.71', '', 16, '16', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'INR', 0, '2015-11-10 00:00:00'),
(13, 'free_lancer', 'Basic Plan', '0.00', '', '593.88', '593.88', '', '132.71', '132.71', '', 16, '16', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'INR', 1, '2015-11-10 00:00:00'),
(14, 'free_lancer', 'Basic Plan', '0.00', '', '593.88', '593.88', '', '132.71', '132.71', '', 16, '16', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'INR', 1, '2015-11-10 00:00:00'),
(15, 'free_lancer', 'Basic Plan', '0.00', '', '593.88', '593.88', '', '132.71', '132.71', '', 16, '16', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'INR', 1, '2015-11-10 00:00:00'),
(16, 'free_lancer', 'Basic Plan', '0.00', '', '593.88', '593.88', '', '132.71', '132.71', '', 16, '16', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'INR', 1, '2015-11-10 00:00:00'),
(17, 'free_lancer', 'Basic Plan', '0.00', '', '593.88', '593.88', '', '132.71', '132.71', '', 16, '16', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'INR', 1, '2015-11-10 00:00:00'),
(18, 'free_lancer', 'Basic Plan', '0.00', '', '593.88', '593.88', '', '132.71', '132.71', '', 16, '16', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'JMD', 1, '2015-11-10 00:00:00'),
(19, 'free_lancer', 'Basic Plan', '0.00', '', '1103.61', '1103.61', '', '246.62', '246.62', '', 16, '16', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'JPY', 1, '2015-11-10 00:00:00'),
(20, 'free_lancer', 'Basic Plan', '0.00', '', '1103.61', '1103.61', '', '246.62', '246.62', '', 16, '16', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'MXN', 0, '2015-11-10 00:00:00'),
(21, 'free_lancer', 'Basic Plan', '0.00', '', '39.15', '39.15', '', '8.75', '8.75', '', 16, '16', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'MYR', 1, '2015-11-10 00:00:00'),
(22, 'free_lancer', 'Basic Plan', '0.00', '', '13.71', '13.71', '', '3.06', '3.06', '1', 16, '16', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'NZD', 1, '2015-11-10 00:00:00'),
(23, 'employer', 'Basic Plan', '0.00', '', '422.93', '422.93', '', '94.51', '94.51', '', 16, '16', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'PHP', 1, '2015-11-10 00:00:00'),
(24, 'free_lancer', 'Basic Plan', '0.00', '', '35.40', '35.40', '', '7.91', '7.91', '', 16, '16', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'PLN', 1, '2015-11-10 00:00:00'),
(25, 'free_lancer', 'Basic Plan', '0.00', '', '77.78', '77.78', '', '17.38', '17.38', '', 16, '16', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'SEK', 1, '2015-11-10 00:00:00'),
(26, 'free_lancer', 'Basic Plan', '0.00', '', '77.78', '77.78', '', '17.38', '17.38', '', 16, '16', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'SGD', 1, '2015-11-10 00:00:00'),
(27, 'free_lancer', 'Basic Plan', '0.00', '', '127.67', '127.67', '', '28.53', '28.53', '', 16, '16', '', 3, '3', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'ZAR', 1, '2015-11-10 00:00:00'),
(28, 'free_lancer', 'Pro Plan', '5.53', '', '12.69', '12.69', '', '12.69', '12.69', '', 60, '60', '', 0, '', '', 5, '5', ' ?', 0, '', '', 0, '', '', 0, '', ' ', 0, '', '', '', '', '', '2', '2', '', '', '', '', '', '', '', 0, '', '', 0, ' ', ' ?', 1, ' ?', 'AUD', 1, '2015-11-10 00:00:00'),
(29, 'free_lancer', 'Pro Plan', '5.18', '', '11.89', '11.89', '', '11.89', '11.89', '', 60, '60', '', 0, '', '', 5, '5', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '2', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'CAD', 1, '2015-11-10 00:00:00'),
(30, 'free_lancer', 'Pro Plan', '0.66', '', '8.32', '8.32', '', '8.32', '8.32', '', 60, '60', '', 0, '', '', 5, '5', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '2', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'EUR', 1, '2015-11-10 00:00:00'),
(31, 'free_lancer', 'Pro Plan', '2.58', '', '5.93', '5.93', '', '5.93', '5.93', '', 60, '60', '', 0, '', '', 5, '5', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '2', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'GBP', 1, '2015-11-10 00:00:00'),
(32, 'employer', 'Pro Plan', '30.24', '', '69.39', '69.39', '', '69.39', '69.39', '', 60, '60', '', 0, '', '', 5, '5', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '2', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'HKD', 1, '2015-11-10 00:00:00'),
(33, 'free_lancer', 'Pro Plan', '53097.98', '', '121846.90', '121846.90', '', '121846.90', '121846.90', '', 60, '60', '', 0, '', '', 5, '5', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '2', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'IDR', 1, '2015-11-10 00:00:00'),
(34, 'free_lancer', 'Pro Plan', '259.07', '', '594.50', '594.50', '', '594.50', '594.50', '', 60, '60', '', 0, '', '', 5, '5', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '2', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'INR', 1, '2015-11-10 00:00:00'),
(35, 'free_lancer', 'Pro Plan', '466.08', '', '1069.53', '1069.53', '', '1069.53', '1069.53', '', 60, '60', '', 0, '', '', 5, '5', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '2', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'JMD', 1, '2015-11-10 00:00:00'),
(36, 'free_lancer', 'Pro Plan', '480.56', '', '1102.77', '1102.77', '', '1102.77', '1102.77', '', 60, '60', '', 0, '', '', 5, '5', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '2', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'JPY', 1, '2015-11-10 00:00:00'),
(37, 'free_lancer', 'Pro Plan', '480.56', '', '1102.77', '1102.77', '', '1102.77', '1102.77', '60', 60, '', '', 0, '', '', 5, '5', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '2', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'MXN', 1, '2015-11-10 00:00:00'),
(38, 'free_lancer', 'Pro Plan', '17.09', '', '39.22', '39.22', '', '39.22', '39.22', '', 60, '60', '', 0, '', '', 5, '5', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '2', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'MYR', 1, '2015-11-10 00:00:00'),
(39, 'free_lancer', 'Pro Plan', '5.97', '', '13.71', '13.71', '', '13.71', '13.71', '', 60, '60', '', 0, '', '', 5, '5', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '2', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'NZD', 1, '2015-11-10 00:00:00'),
(40, 'free_lancer', 'Pro Plan', '184.53', '', '423.46', '423.46', '', '423.46', '423.46', '', 60, '60', '', 0, '', '', 5, '5', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '2', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'PHP', 1, '2015-11-10 00:00:00'),
(41, 'free_lancer', 'Pro Plan', '15.44', '', '35.44', '35.44', '', '35.44', '35.44', '', 60, '60', '', 0, '', '', 5, '5', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '2', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'PLN', 1, '2015-11-10 00:00:00'),
(42, 'employer', 'Pro Plan', '33.95', '', '77.91', '77.91', '', '77.91', '77.91', '', 60, '60', '', 0, '', '', 5, '5', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '2', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'SEK', 1, '2015-11-10 00:00:00'),
(43, 'free_lancer', 'Pro Plan', '77.91', '', '12.73', '12.73', '', '12.73', '12.73', '', 60, '60', '', 0, '', '', 5, '5', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '2', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'SGD', 1, '2015-11-10 00:00:00'),
(44, 'free_lancer', 'Pro Plan', '55.83', '', '128.12', '128.12', '', '128.12', '128.12', '', 60, '60', '', 0, '', '', 5, '5', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '2', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'ZAR', 1, '2015-11-10 00:00:00'),
(45, 'free_lancer', 'Business Plan', '9.85', '', '9.85', '9.85', '', '1.42', '1.42', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '1', 0, '', '', 0, '', '', 0, '', 'AUD', 1, '2015-11-10 00:00:00'),
(46, 'free_lancer', 'Business Plan', '9.85', '', '9.85', '9.85', '', '9.85', '9.85', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'AUD', 1, '2015-11-10 00:00:00'),
(47, 'free_lancer', 'Business Plan', '9.23', '', '9.23', '9.23', '9.23', '9.23', '', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'CAD', 1, '2015-11-10 00:00:00'),
(48, 'free_lancer', 'Business Plan', '9.23', '', '9.23', '9.23', '', '9.23', '9.23', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'CLP', 1, '2015-11-10 00:00:00'),
(49, 'free_lancer', 'Business Plan', '6.47', '', '6.47', '6.47', '', '6.47', '6.47', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'EUR', 1, '2015-11-10 00:00:00'),
(50, 'free_lancer', 'Business Plan', '4.60', '', '4.60', '4.60', '', '4.60', '4.60', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'USD', 0, '2015-11-10 00:00:00'),
(51, 'free_lancer', 'Business Plan', '53.85', '', '53.85', '53.85', '', '53.85', '53.85', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'HKD', 1, '2015-11-10 00:00:00'),
(52, 'free_lancer', 'Business Plan', '94500.29', '', '94500.29', '94500.29', '', '94500.29', '94500.29', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'IDR', 1, '2015-11-10 00:00:00'),
(53, 'free_lancer', 'Business Plan', '461.51', '', '461.51', '461.51', '', '461.51', '461.51', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'INR', 1, '2015-11-10 00:00:00'),
(54, 'free_lancer', 'Business Plan', '829.93', '', '829.93', '829.93', '', '829.93', '829.93', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'JMD', 1, '2015-11-10 00:00:00'),
(55, 'employer', 'Business Plan', '830.17', '', '830.17', '830.17', '', '830.17', '830.17', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'JPY', 1, '2015-11-10 00:00:00'),
(56, 'employer', 'Business Plan', '855.56', '', '855.56', '855.56', '', '855.56', '855.56', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'JPY', 1, '2015-11-10 00:00:00'),
(57, 'free_lancer', 'Business Plan', '116.74', '', '116.74', '116.74', '', '116.74', '116.74', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'MXN', 1, '2015-11-10 00:00:00'),
(58, 'employer', 'Business Plan', '30.44', '', '30.44', '30.44', '', '30.44', '30.44', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'MYR', 1, '2015-11-10 00:00:00'),
(59, 'free_lancer', 'Business Plan', '10.63', '', '10.63', '10.63', '', '10.63', '10.63', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'NZD', 1, '2015-11-10 00:00:00'),
(60, 'free_lancer', 'Business Plan', '328.72', '', '328.72', '328.72', '', '328.72', '328.72', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'PHP', 1, '2015-11-10 00:00:00'),
(61, 'free_lancer', 'Business Plan', '27.53', '', '27.53', '27.53', '', '27.53', '27.53', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'PLN', 1, '2015-11-10 00:00:00'),
(62, 'free_lancer', 'Business Plan', '60.40', '', '60.40', '60.40', '', '60.40', '60.40', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'SEK', 1, '2015-11-10 00:00:00'),
(63, 'free_lancer', 'Business Plan', '9.88', '', '9.88', '9.88', '', '9.88', '9.88', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'SGD', 1, '2015-11-10 00:00:00'),
(64, 'free_lancer', 'Business Plan', '99.46', '', '99.46', '99.46', '', '99.46', '99.46', '', 400, '400', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'ZAR', 1, '2015-11-10 00:00:00'),
(65, 'employer', 'Mega Plan', '155.69', '', '5', '5', '', '5', '5', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '1', 0, '', '', 0, '', '', 0, '', 'AUD', 1, '2015-11-10 00:00:00'),
(66, 'free_lancer', 'Mega Plan', '14.70', '', '4.69', '4.69', '', '4.69', '4.69', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '1', '', 0, '', '', 0, '', 'CAD', 1, '2015-11-10 00:00:00'),
(67, 'free_lancer', 'Mega Plan', '77166.81', '2478.22', '2478.22', '', '', '2478.22', '2478.22', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '1', '', 0, '', '', 0, '', 'CLP', 1, '2015-11-10 00:00:00'),
(68, 'free_lancer', 'Mega Plan', '77166.81', '', '2478.22', '2478.22', '', '2478.22', '2478.22', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '1', 0, '', '', 0, '', '', 0, '', 'EUR', 1, '2015-11-10 00:00:00'),
(69, 'free_lancer', 'Mega Plan', '77166.81', '', '2478.22', '2478.22', '', '2478.22', '2478.22', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '1', '', 0, '', '', 0, '', 'EUR', 1, '2015-11-10 00:00:00'),
(70, 'employer', 'Mega Plan', '7776.65', '', '2478.22', '2478.22', '', '2478.22', '2478.22', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'EUR', 1, '2015-11-10 00:00:00'),
(71, 'employer', 'Mega Plan', '7776.65', '', '2478.22', '2478.22', '', '2478.22', '2478.22', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '1', 0, '', '', 0, '', '', 0, '', 'EUR', 1, '2015-11-10 00:00:00'),
(72, 'employer', 'Mega Plan', '72.71', '', '2.34', '2.34', '', '2.34', '2.34', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '1', '', 0, '', '', 0, '', 'GBP', 1, '2015-11-10 00:00:00'),
(73, 'free_lancer', 'Mega Plan', '851.45', '', '27.34', '27.34', '', '27.34', '27.34', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '1', 0, '', '', 0, '', '', 0, '', 'HKD', 1, '2015-11-10 00:00:00'),
(74, 'free_lancer', 'Mega Plan', '851.45', '', '27.34', '27.34', '', '27.34', '27.34', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'IDR', 1, '2015-11-10 00:00:00'),
(75, 'free_lancer', 'Mega Plan', '1498489.83', '', '48124.15', '48124.15', '', '48124.15', '48124.15', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '1', '', 0, '', '', 0, '', 'IDR', 1, '2015-11-10 00:00:00'),
(76, 'free_lancer', 'Mega Plan', '7281.02', '', '233.83', '233.83', '', '233.83', '233.83', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '1', '', 0, '', '', 0, '', 'INR', 1, '2015-11-10 00:00:00'),
(77, 'employer', 'Mega Plan', '13120.81', '', '421.38', '421.38', '', '421.38', '421.38', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '1', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '', 0, '', 'JMD', 1, '2015-11-10 00:00:00'),
(78, 'free_lancer', 'Mega Plan', '13531.95', '', '434.58', '434.58', '', '434.58', '434.58', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '1', '', 0, '', '', 0, '', 'JPY', 1, '2015-11-10 00:00:00'),
(79, 'free_lancer', 'Mega Plan', '1848.54', '', '59.37', '59.37', '', '59.37', '59.37', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '1', '', 0, '', '', 0, '', 'MXN', 1, '2015-11-10 00:00:00'),
(80, 'free_lancer', 'Mega Plan', '481.11', '', '15.45', '15.45', '', '15.45', '15.45', '', 1600, '1600', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '1', 0, '', '', 0, '', '', 0, '', 'MYR', 1, '2015-11-10 00:00:00'),
(81, 'free_lancer', 'Mega Plan', '167.92', '', '5.39', '5.39', '', '5.39', '5.39', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '1', 0, '', '', 0, '', '', 0, '', 'NZD', 1, '2015-11-10 00:00:00'),
(82, 'free_lancer', 'Mega Plan', '5191.52', '', '166.73', '166.73', '', '166.73', '166.73', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '1', 0, '', '', 0, '', '', 0, '', 'PHP', 1, '2015-11-10 00:00:00'),
(83, 'employer', 'Mega Plan', '434.96', '', '13.97', '13.97', '', '13.97', '13.97', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '1', 0, '', '', 0, '', '', 0, '', 'PLN', 1, '2015-11-10 00:00:00'),
(84, 'free_lancer', 'Mega Plan', '952.89', '', '30.60', '30.60', '', '30.60', '30.60', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '1', '', 0, '', '', 0, '', 'SEK', 1, '2015-11-10 00:00:00'),
(85, 'free_lancer', 'Mega Plan', '156.20', '', '5.02', '5.02', '', '5.02', '5.02', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '1', '', 0, '', '', 0, '', 'SGD', 1, '2015-11-10 00:00:00'),
(86, 'employer', 'Business Plan', '1577.68', '', '50.67', '50.67', '', '50.67', '50.67', '', 1600, '1600', '', 0, '', '', 3, '', '', 0, '', '1', 0, '', '', 0, '', '', 0, '', '', '', '', '', '2', '', '', '', '', '', '', '', '', 0, '1', '', 0, '', '', 0, '', 'ZAR', 1, '2015-11-10 00:00:00'),
(87, 'free_lancer', 'New Package', '45', 'new heading price fixed', '25', 'Some fixed price detail', 'New Heading', '45', 'Hourly Project Detail', 'Bids', 40, 'bids details', 'Skills Heading', 3, 'skill detailsa', 'Service Heading', 45, 'Listing Details', 'Express', 0, 'Express Details', 'NO', 0, 'Unlock Detaisl', 'Project Heeading', 0, 'No detailsa', 'Preffered Heading', 0, 'Preffered Details', 'EMployeer Headiin', 'No', '0', 'External Heading', 'Invoicing', 'No external details', 'Heading fixed price', '78', 'some fixed details', 'Hourly Project Heading', '45', 'SOme hourly details', 'No', 0, 'No exxtension details', 'Sealed Heading', 0, 'sealed details', 'NDA Heading', 0, 'NDA Details', 'USD', 1, '2018-10-07 14:32:11');

-- --------------------------------------------------------

--
-- Table structure for table `rtf_publications`
--

CREATE TABLE `rtf_publications` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `publication_title` varchar(200) NOT NULL,
  `publishir` varchar(200) NOT NULL,
  `summary` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rtf_publications`
--

INSERT INTO `rtf_publications` (`id`, `user_id`, `publication_title`, `publishir`, `summary`, `is_active`, `created`) VALUES
(1, 1, 'VR', 'Asad', 'Some summary', 1, '2018-10-05 11:18:34');

-- --------------------------------------------------------

--
-- Table structure for table `rtf_skills`
--

CREATE TABLE `rtf_skills` (
  `id` bigint(20) NOT NULL,
  `skill_name` varchar(200) NOT NULL,
  `skill_category_id` bigint(20) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rtf_skills`
--

INSERT INTO `rtf_skills` (`id`, `skill_name`, `skill_category_id`, `description`, `is_active`, `created`) VALUES
(31, '2D Animation', 7, 'test', 1, '2015-11-04 08:03:11'),
(34, '2D Design', 7, '', 1, '2015-11-04 08:03:11'),
(36, '3D Rendering', 7, 'test', 1, '2015-11-04 08:03:11'),
(37, 'Illustartor', 7, 'test', 1, '2015-11-04 08:03:11'),
(39, 'Adobe Creative Suite', 7, 'test', 1, '2015-11-04 08:03:11'),
(41, 'Adobe LiveCycle Designer ', 7, 'test', 1, '2015-11-04 08:03:11'),
(42, 'After Effects ', 7, 'test', 1, '2015-11-04 08:03:11'),
(43, 'Animation', 7, 'test', 1, '2015-11-04 08:03:11'),
(44, 'Apple Compressor ', 7, 'test', 1, '2015-11-04 08:03:11'),
(45, 'Apple Logic Pro ', 7, 'test', 1, '2015-11-04 08:03:11'),
(46, 'Arts & Crafts', 7, 'test', 1, '2015-11-04 08:03:11'),
(47, 'Avid', 7, 'test', 1, '2015-11-04 08:03:11'),
(49, 'Banner Design ', 7, 'test', 1, '2015-11-04 08:03:11'),
(51, 'Brochure Design', 7, 'Test is this', 1, '2015-11-04 08:03:11'),
(53, 'Cinema 4D', 7, 'This is the testing', 1, '2015-11-04 08:03:11'),
(54, 'Commercials', 7, 'This is the testing', 1, '2015-11-04 08:03:11'),
(56, 'Amazon Fire', 8, 'test', 1, '2015-11-04 08:11:18'),
(57, 'Amazon Kindle', 8, 'test', 1, '2015-11-04 08:11:18'),
(58, 'Android ', 8, 'test', 1, '2015-11-04 08:11:18'),
(59, 'Android Honeycomb', 8, 'test', 1, '2015-11-04 08:11:18'),
(60, 'Appcelerator Titanium ', 8, 'test', 1, '2015-11-04 08:11:18'),
(61, 'Apple Watch  ', 8, 'This is the testing.', 1, '2015-11-04 08:11:18'),
(62, 'Blackberry  ', 8, 'This is the testing', 1, '2015-11-04 08:11:18'),
(63, 'Geolocation', 8, 'This is the testing.', 1, '2015-11-04 08:11:18'),
(64, 'IOS', 8, 'This is the testing.', 1, '2015-11-04 08:11:18'),
(65, 'iPad', 8, 'This is the testing.', 1, '2015-11-04 08:11:18'),
(66, 'iPhone', 8, 'This is the testing.', 1, '2015-11-04 08:11:18'),
(67, 'J2ME ', 8, 'This is the testing.', 1, '2015-11-04 08:11:18'),
(68, 'Sony', 8, 'This is the testing.', 1, '2015-11-04 08:11:18'),
(69, 'Mobile Phone', 8, 'This is the testing.', 1, '2015-11-04 08:11:18'),
(70, 'Nokia', 8, 'This is the testing.', 1, '2015-11-04 08:11:18'),
(71, '.NET Programming', 9, 'test', 1, '2015-11-04 08:14:20'),
(72, 'Agile Development', 9, 'test', 1, '2015-11-04 08:14:20'),
(73, 'AJAX ', 9, 'test', 1, '2015-11-04 08:14:20'),
(74, 'AMQP', 9, 'test', 1, '2015-11-04 08:14:20'),
(75, 'Analytics ', 9, 'test', 1, '2015-11-04 08:14:20'),
(76, 'Android Wear SDK ', 9, 'This is for testing.', 1, '2015-11-04 08:14:20'),
(77, 'Angular.js ', 9, 'This is for the testing.', 1, '2015-11-04 08:14:20'),
(78, 'Apache ', 9, 'This is for testing.', 1, '2015-11-04 08:14:20'),
(79, 'Apache Solr ', 9, 'This is for testing.', 1, '2015-11-04 08:14:20'),
(80, 'API  ', 9, 'This is for the testing.', 1, '2015-11-04 08:14:20'),
(81, 'AppleScript', 9, 'This is for the testing.', 1, '2015-11-04 08:14:20'),
(82, 'Argus Monitoring Software ', 9, 'This is for testing.', 1, '2015-11-04 08:14:20'),
(83, 'Artificial Intelligence', 9, 'This is for testing.', 1, '2015-11-04 08:14:20'),
(84, 'ASP Programming', 9, 'This is for testing.', 1, '2015-11-04 08:14:20'),
(85, 'ASP.NET', 9, 'This is for the testing.', 1, '2015-11-04 08:14:20'),
(86, 'Assembly', 9, 'This is for the testing.', 1, '2015-11-04 08:14:20'),
(87, 'Asterisk PBX  ', 9, 'This is for the testing.', 1, '2015-11-04 08:14:20'),
(88, 'AutoHotkey ', 9, 'This is for the testing.', 1, '2015-11-04 08:14:20'),
(89, 'Axure', 9, 'Testing', 1, '2015-11-04 08:14:20'),
(90, 'Azure', 9, 'This is the testing.', 1, '2015-11-04 08:14:20'),
(91, '360-degree video', 10, '', 1, '2015-11-04 08:19:32'),
(97, 'ActionScript', 10, 'test', 1, '2015-11-04 08:19:32'),
(102, 'Advertisement Design', 10, '', 1, '2015-11-04 08:19:32'),
(104, 'Animation', 10, '', 1, '2015-11-04 08:19:32'),
(105, 'Apple Compressor', 10, '', 1, '2015-11-04 08:19:32'),
(106, 'Apple Logic Pro', 10, '', 1, '2015-11-04 08:19:32'),
(107, 'Apple Motion', 10, '', 1, '2015-11-04 08:19:32'),
(109, 'Audio Production', 10, '', 1, '2015-11-04 08:19:32'),
(110, 'Audio Services', 10, '', 1, '2015-11-04 08:19:32'),
(111, 'Autodesk Inventor ', 10, '', 1, '2015-11-04 08:19:32'),
(112, 'Autodesk Revit ', 10, '', 1, '2015-11-04 08:19:32'),
(113, 'Account-Based Marketing', 11, 'test', 1, '2015-11-04 08:22:41'),
(114, 'Advertising', 11, 'test', 1, '2015-11-04 08:22:41'),
(115, 'Article Marketing', 11, 'test', 1, '2015-11-04 08:22:41'),
(116, 'B2B Marketing', 11, 'test', 1, '2015-11-04 08:22:41'),
(117, 'B2C Marketing', 11, 'This is for the testing.', 1, '2015-11-04 08:22:41'),
(118, 'Bill of sale', 11, 'This is for the testing.', 1, '2015-11-04 08:22:41'),
(119, 'Branding', 11, 'This is for the testing', 1, '2015-11-04 08:22:41'),
(120, 'Cloud marketing', 11, 'This is for the testing.', 1, '2015-11-04 08:22:41'),
(121, 'Complex sales', 11, 'This is for the testing.', 1, '2015-11-04 08:22:41'),
(122, 'Conditional sale', 11, 'This is for the testing.', 1, '2015-11-04 08:22:41'),
(123, 'Content marketing', 11, 'This is for the testing.', 1, '2015-11-04 08:22:41'),
(124, 'Conversion Rate Optimization', 11, 'This is for the testig', 1, '2015-11-04 08:22:41'),
(125, 'CRM', 11, 'This is for the testing.', 1, '2015-11-04 08:22:41'),
(126, 'Cross-selling', 11, 'This is for the testing.', 1, '2015-11-04 08:22:41'),
(127, 'Digital marketing', 11, 'This is for the testing.', 1, '2015-11-04 08:22:41'),
(128, 'Microsoft Outlook', 11, 'test', 1, '2015-11-04 08:22:41'),
(129, 'Direct Mail Marketing', 11, 'This is for the testing.', 1, '2015-11-04 08:22:41'),
(130, 'Drip marketing', 11, 'This is for the testing.', 1, '2015-11-04 08:22:41'),
(131, 'ebay', 11, 'This is for the testing.', 1, '2015-11-04 08:22:41'),
(132, 'Email Marketing', 11, 'This is for the testing.', 1, '2015-11-04 08:22:41'),
(133, 'Facebook', 11, 'This is for the testing.', 1, '2015-11-04 08:22:41'),
(134, 'Flickr', 11, 'This is for the testing.', 1, '2015-11-04 08:22:41'),
(135, 'Academic Writing  & Research', 12, 'test', 1, '2015-11-04 08:25:27'),
(136, 'Article & Blog Writing ', 12, 'test', 1, '2015-11-04 08:25:27'),
(137, 'Article Rewriting ', 12, 'test', 1, '2015-11-04 08:25:27'),
(138, 'Book Writing', 12, 'test', 1, '2015-11-04 08:25:27'),
(139, 'Business Writing ', 12, 'test', 1, '2015-11-04 08:25:27'),
(140, 'Cartography', 12, 'test', 1, '2015-11-04 08:25:27'),
(141, 'Content Writing', 12, 'test', 1, '2015-11-04 08:25:27'),
(142, 'Copywriting', 12, 'test', 1, '2015-11-04 08:25:27'),
(143, 'Creative Writing', 12, 'test', 1, '2015-11-04 08:25:27'),
(144, 'eBooks', 12, 'test', 1, '2015-11-04 08:25:27'),
(145, 'Encyclopedia', 12, 'test', 1, '2015-11-04 08:25:27'),
(146, 'Fiction', 12, 'test', 1, '2015-11-04 08:25:27'),
(147, 'Financial Research', 12, 'test', 1, '2015-11-04 08:25:27'),
(148, 'Financial Skills', 12, '', 1, '2015-11-04 08:25:27'),
(149, 'Forum Posting', 12, 'test', 1, '2015-11-04 08:25:27'),
(150, 'Ghostwriting ', 12, 'test', 1, '2015-11-04 08:25:27'),
(151, 'Accounting & Consulting', 13, 'test', 1, '2015-11-04 08:31:36'),
(152, 'Audit  ', 13, 'test', 1, '2015-11-04 08:31:36'),
(153, 'Autotask  ', 13, 'test', 1, '2015-11-04 08:31:36'),
(154, 'Enterprise resource planning', 13, 'test', 1, '2015-11-04 08:31:36'),
(155, 'Event Planning  ', 13, 'test', 1, '2015-11-04 08:31:36'),
(156, 'Finance ', 13, 'test', 1, '2015-11-04 08:31:36'),
(157, 'Financial Analysis  ', 13, 'test', 1, '2015-11-04 08:31:36'),
(158, 'Financial Planning ', 13, 'test', 1, '2015-11-04 08:31:36'),
(159, 'Fundraising  ', 13, 'test', 1, '2015-11-04 08:31:36'),
(160, 'Human Resources ', 13, 'test', 1, '2015-11-04 08:31:36'),
(161, 'Infographics', 7, 'test', 1, '2015-11-04 08:31:36'),
(162, 'Inventory Management ', 13, 'test', 1, '2015-11-04 08:31:36'),
(163, 'Management Consulting ', 13, 'test', 1, '2015-11-04 08:31:36'),
(164, 'Payroll ', 13, 'test', 1, '2015-11-04 08:31:36'),
(165, 'Personal Development ', 13, 'test', 1, '2015-11-04 08:31:36'),
(166, 'Project Management ', 13, 'test', 1, '2015-11-04 08:31:36'),
(167, 'Property Management ', 13, 'test', 1, '2015-11-04 08:31:36'),
(168, 'Public Relations  ', 13, 'test', 1, '2015-11-04 08:31:36'),
(169, 'QuickBooks & Quicken ', 13, 'test', 1, '2015-11-04 08:31:36'),
(170, 'Recruitment  ', 13, 'test', 1, '2015-11-04 08:31:36'),
(171, 'Risk Management ', 13, 'test', 1, '2015-11-04 08:31:36'),
(172, 'SAS  ', 13, 'test', 1, '2015-11-04 08:31:36'),
(173, 'Tax  ', 13, 'test', 1, '2015-11-04 08:35:11'),
(174, 'Visa / Immigration Consultancy', 13, 'test', 1, '2015-11-04 08:35:11'),
(176, 'Product Management', 15, 'test', 1, '2015-11-04 08:35:11'),
(177, 'Project Scheduling', 15, 'test', 1, '2015-11-04 08:35:11'),
(178, 'Quantum', 15, 'test', 1, '2015-11-04 08:35:11'),
(179, 'Remote Sensing', 15, 'test', 1, '2015-11-04 08:35:11'),
(180, 'Renewable Energy Design', 15, 'test', 1, '2015-11-04 08:35:11'),
(181, 'Interior Design', 15, 'test', 1, '2015-11-04 08:35:11'),
(182, 'Motion', 7, 'This is the testing.', 1, '2015-11-04 08:35:11'),
(186, 'Scientific Research', 15, 'test', 1, '2015-11-04 08:35:11'),
(187, 'SCADA', 15, 'test', 1, '2015-11-04 08:35:11'),
(188, 'RTOS', 15, 'test', 1, '2015-11-04 08:35:11'),
(189, 'Robotics', 15, 'test', 1, '2015-11-04 08:35:11'),
(190, 'Internet Research', 11, 'test', 1, '2015-11-04 08:35:11'),
(191, 'Continuity sales model ', 11, 'This is the testing.', 1, '2015-11-04 08:35:11'),
(192, 'Sales Operations', 11, 'This is the testing.', 1, '2015-11-04 08:35:11'),
(197, 'Aeronautical Engineering ', 15, 'test', 1, '2015-11-04 08:40:34'),
(198, 'Aerospace Engineering  ', 15, 'test', 1, '2015-11-04 08:40:34'),
(199, 'Agronomy  ', 15, 'test', 1, '2015-11-04 08:40:34'),
(200, 'Algorithm  ', 15, 'test', 1, '2015-11-04 08:40:34'),
(201, 'Arduino  ', 15, 'test', 1, '2015-11-04 08:40:34'),
(202, 'Arts & Crafts ', 15, 'test', 1, '2015-11-04 08:40:34'),
(203, 'Astrophysics ', 15, 'test', 1, '2015-11-04 08:40:34'),
(204, 'AutoCAD', 15, 'test', 1, '2015-11-04 08:40:34'),
(205, 'Autodesk Inventor  ', 15, 'test', 1, '2015-11-04 08:40:34'),
(206, 'Autodesk Revit ', 15, 'test', 1, '2015-11-04 08:40:34'),
(207, 'Biology ', 15, 'test', 1, '2015-11-04 08:40:34'),
(208, 'Biotechnology ', 15, 'test', 1, '2015-11-04 08:40:34'),
(209, 'Broadcast Engineering ', 15, 'test', 1, '2015-11-04 08:40:34'),
(210, 'Building Architecture', 15, 'test', 1, '2015-11-04 08:40:34'),
(211, 'CAD', 15, 'test', 1, '2015-11-04 08:40:34'),
(212, 'CATIA ', 15, 'test', 1, '2015-11-04 08:40:34'),
(213, 'Chemical Engineering ', 15, 'test', 1, '2015-11-04 08:40:34'),
(214, 'Circuit Design ', 15, 'test', 1, '2015-11-04 08:40:34'),
(215, 'Civil Engineering ', 15, 'test', 1, '2015-11-04 08:40:34'),
(216, 'Clean Technology', 15, 'test', 1, '2015-11-04 08:40:34'),
(217, 'Climate Sciences', 15, 'test', 1, '2015-11-04 08:40:34'),
(218, 'Construction Monitoring', 15, 'test', 1, '2015-11-04 08:40:34'),
(219, 'Cryptography', 15, 'test', 1, '2015-11-04 08:40:34'),
(220, 'Application Filling', 16, 'test', 1, '2015-11-04 08:44:10'),
(221, 'Article Submission ', 16, 'test', 1, '2015-11-04 08:44:10'),
(222, 'Bookkeeping  ', 16, 'test', 1, '2015-11-04 08:44:10'),
(224, 'Call / Customer Support ', 16, '', 1, '2015-11-04 08:44:10'),
(227, 'Data Entry  ', 16, 'test', 1, '2015-11-04 08:44:10'),
(228, 'Data Processing ', 16, 'test', 1, '2015-11-04 08:44:10'),
(229, 'Desktop Support ', 16, 'test', 1, '2015-11-04 08:44:10'),
(231, 'Excel', 16, 'test', 1, '2015-11-04 08:44:10'),
(232, 'Helpdesk', 16, 'test', 1, '2015-11-04 08:44:10'),
(233, 'Microsoft Office', 16, 'test', 1, '2015-11-04 08:44:10'),
(234, 'Online Search  ', 16, 'test', 1, '2015-11-04 08:44:10'),
(235, 'Order Processing', 16, 'test', 1, '2015-11-04 08:44:10'),
(236, 'Procurement', 16, 'test', 1, '2015-11-04 08:44:10'),
(237, 'Research', 16, 'test', 1, '2015-11-04 08:44:10'),
(238, 'Technical Support', 16, 'test', 1, '2015-11-04 08:44:10'),
(239, 'Uploading / Downloading', 16, 'test', 1, '2015-11-04 08:44:10'),
(240, 'Virtual Assistant', 16, 'test', 1, '2015-11-04 08:44:10'),
(245, 'Air Conditioning', 17, '', 1, '2015-11-04 08:52:04'),
(246, 'Antenna Services', 17, '', 1, '2015-11-04 08:52:04'),
(247, 'Appliance Installation', 17, '', 1, '2015-11-04 08:52:04'),
(248, 'Appliance Repair', 17, '', 1, '2015-11-04 08:52:04'),
(249, 'Asbestos Removal', 17, '', 1, '2015-11-04 08:52:04'),
(250, 'Asphalt', 17, '', 1, '2015-11-04 08:52:04'),
(251, 'Attic Access Ladders', 17, '', 1, '2015-11-04 08:52:04'),
(252, 'Awnings', 17, '', 1, '2015-11-04 08:52:04'),
(253, 'Bamboo Flooring', 17, '', 1, '2015-11-04 08:52:04'),
(254, 'Bathroom', 17, '', 1, '2015-11-04 08:52:04'),
(255, 'Brackets ', 17, '', 1, '2015-11-04 08:52:04'),
(256, 'Bricklaying', 17, '', 1, '2015-11-04 08:52:04'),
(257, 'Building ', 17, '', 1, '2015-11-04 08:52:04'),
(258, 'Building Certifiers ', 17, '', 1, '2015-11-04 08:52:04'),
(259, 'Building Consultants', 17, '', 1, '2015-11-04 08:52:04'),
(260, 'Building Designer', 17, '', 1, '2015-11-04 08:52:04'),
(261, 'Building Surveyors', 17, '', 1, '2015-11-04 08:52:04'),
(262, 'Carpet Repair & Laying', 17, '', 1, '2015-11-04 08:52:04'),
(263, 'Carports', 17, '', 1, '2015-11-04 08:52:04'),
(264, 'Ceilings', 17, '', 1, '2015-11-04 08:52:04'),
(265, 'Cement Bonding Agents', 17, '', 1, '2015-11-04 08:52:04'),
(266, 'Clothesline', 17, '', 1, '2015-11-04 08:52:04'),
(267, 'Coating Materials', 17, '', 1, '2015-11-04 08:52:04'),
(268, 'Columns', 17, '', 1, '2015-11-04 08:52:04'),
(269, 'Commercial Cleaning', 17, '', 1, '2015-11-04 08:52:04'),
(270, 'Anything Goes', 18, '', 1, '2015-11-04 08:59:43'),
(271, 'Automotive', 18, '', 1, '2015-11-04 08:59:43'),
(272, 'Brain Storming', 18, '', 1, '2015-11-04 08:59:43'),
(273, 'Business Coaching', 18, '', 1, '2015-11-04 08:59:43'),
(274, 'Christmas', 18, '', 1, '2015-11-04 08:59:43'),
(275, 'Cooking & Recipes ', 18, '', 1, '2015-11-04 08:59:43'),
(276, 'Dating ', 18, '', 1, '2015-11-04 08:59:43'),
(277, 'Education & Tutoring', 18, '', 1, '2015-11-04 08:59:43'),
(278, 'Energy', 18, '', 1, '2015-11-04 08:59:43'),
(279, 'Financial Markets', 18, '', 1, '2015-11-04 08:59:43'),
(280, 'Freelance', 18, '', 1, '2015-11-04 08:59:43'),
(281, 'Genealogy', 18, '', 1, '2015-11-04 08:59:43'),
(282, 'Health ', 18, '', 1, '2015-11-04 08:59:43'),
(283, 'Insurance', 18, '', 1, '2015-11-04 08:59:43'),
(284, 'Life Coaching', 18, '', 1, '2015-11-04 08:59:43'),
(285, 'Nutrition', 18, '', 1, '2015-11-04 08:59:43'),
(286, 'Pattern Making', 18, '', 1, '2015-11-04 08:59:43'),
(287, 'Psychology ', 18, '', 1, '2015-11-04 08:59:43'),
(288, 'Real Estate', 18, '', 1, '2015-11-04 08:59:43'),
(289, 'Sports', 18, '', 1, '2015-11-04 08:59:43'),
(290, 'Test Automation', 18, '', 1, '2015-11-04 08:59:43'),
(291, 'Training ', 18, '', 1, '2015-11-04 08:59:43'),
(292, 'Troubleshooting', 18, '', 1, '2015-11-04 08:59:43'),
(293, 'Valuation & Appraisal', 18, '', 1, '2015-11-04 08:59:43'),
(294, 'Weddings', 18, '', 1, '2015-11-04 08:59:43'),
(295, 'SQ', 20, '', 1, '2015-11-13 02:09:49'),
(296, 'surgery', 19, '', 1, '2015-12-15 04:36:19'),
(297, 'Bone Specialist', 19, 'test', 1, '2015-12-15 04:38:16'),
(298, 'Antibiotic', 19, 'test', 1, '2015-12-15 04:39:17'),
(299, 'Skin', 19, 'test', 1, '2015-12-15 04:40:14'),
(301, 'Digital Combustion FS 5', 7, 'This is the testing', 1, '2016-01-04 01:17:38'),
(302, 'Digital Foto Art', 7, 'This is the testing', 1, '2016-01-04 01:18:00'),
(303, 'DVD Studio Pro', 7, 'This is the testing', 1, '2016-01-04 01:18:30'),
(304, 'Edius', 7, 'This is the testing', 1, '2016-01-04 01:18:52'),
(305, 'Fashion Design', 7, 'This is the testing', 1, '2016-01-04 01:19:16'),
(306, 'Final Cut Pro', 7, 'This is the testing', 1, '2016-01-04 01:19:35'),
(307, 'Final Cut Studio', 7, 'This is the testing', 1, '2016-01-04 01:19:59'),
(311, 'Furniture Design', 7, 'This is the testing', 1, '2016-01-04 01:23:39'),
(312, 'Graphic Design', 7, 'This is the testing', 1, '2016-01-04 01:24:06'),
(313, 'Hand Painting', 7, 'This is the testing', 1, '2016-01-04 01:24:32'),
(314, 'HitFilm', 7, 'This is the testing', 1, '2016-01-04 01:25:51'),
(317, 'iMovie', 7, 'This is the testing', 1, '2016-01-04 01:29:36'),
(320, 'Label Design', 7, 'This is the testing.', 1, '2016-01-04 01:46:35'),
(321, 'Lightworks', 7, 'This is the testing.', 1, '2016-01-04 01:47:52'),
(322, 'LiveType', 7, 'This is the testing.', 1, '2016-01-04 01:48:47'),
(323, 'Logo Design', 7, 'This is the testing.', 1, '2016-01-04 01:49:57'),
(324, 'Logo Design & Branding', 7, 'This is the testing.', 1, '2016-01-04 01:50:28'),
(325, 'Maya', 7, 'This is the testing.', 1, '2016-01-04 01:51:01'),
(326, 'Packaging', 7, 'This is the testing.', 1, '2016-01-04 01:51:47'),
(327, 'Photo Editing', 7, 'This is the testing.', 1, '2016-01-04 01:52:15'),
(328, 'Photography', 7, 'This is the testing.', 1, '2016-01-04 01:52:36'),
(330, 'Post-Production', 7, 'This is the testing.', 1, '2016-01-04 01:53:53'),
(331, 'PowerDirector', 7, 'This is the testing.', 1, '2016-01-04 01:54:29'),
(332, 'Pre-Production ', 7, 'This is the testing.', 1, '2016-01-04 01:54:57'),
(333, 'Presentations', 7, 'This is the testing.', 1, '2016-01-04 01:55:29'),
(335, 'Serious Magic Ultra 2', 7, 'This is the testing.', 1, '2016-01-04 01:56:52'),
(336, 'Sony Vegas', 7, 'This is the testing.', 1, '2016-01-04 01:57:19'),
(337, 'Sound Forge Pro', 7, 'This is the testing.', 1, '2016-01-04 01:57:42'),
(338, 'Soundtrack Pro', 7, 'This is the testing.', 1, '2016-01-04 01:59:13'),
(341, 'Templates Design', 7, 'This is the testing.', 1, '2016-01-04 01:59:59'),
(342, 'Toon Boom', 7, 'This is the testing.', 1, '2016-01-04 02:00:28'),
(344, 'Vehicle Lettering', 7, 'This is the testing.', 1, '2016-01-04 02:01:19'),
(345, 'Video Broadcasting', 7, 'This is the testing.', 1, '2016-01-04 02:01:41'),
(346, 'Video Editing', 7, '', 1, '2016-01-04 02:02:44'),
(347, 'Videography', 7, 'This is the testing.', 1, '2016-01-04 02:03:09'),
(348, 'Visual Effects', 7, 'This is the testing.', 1, '2016-01-04 02:03:34'),
(349, 'Voice Over', 7, 'This is the testing.', 1, '2016-01-04 02:03:57'),
(351, 'Palm', 8, 'This is the testing.', 1, '2016-01-04 03:18:52'),
(352, 'Samsung', 8, 'This is the testing.', 1, '2016-01-04 03:19:14'),
(353, 'WebOS ', 8, 'This is the testing.', 1, '2016-01-04 03:20:25'),
(354, 'Windows CE ', 8, 'This is the testing.', 1, '2016-01-04 03:20:46'),
(355, 'Windows Mobile ', 8, 'This is the testing.', 1, '2016-01-04 03:21:03'),
(356, 'Windows Phone', 8, 'This is the testing.', 1, '2016-01-04 03:21:22'),
(357, 'Metro', 8, 'This is the testing.', 1, '2016-01-04 03:21:48'),
(358, 'backbone.js ', 9, 'This is the testing.', 1, '2016-01-04 03:39:50'),
(359, 'Balsamiq ', 9, 'This is the testing.', 1, '2016-01-04 03:40:18'),
(360, 'Binary Analysis  ', 9, 'This is the testing.', 1, '2016-01-04 03:40:38'),
(361, 'Bitcoin  ', 9, 'This is the testing.', 1, '2016-01-04 03:40:56'),
(362, 'Biztalk  ', 9, 'This is the testing.', 1, '2016-01-04 03:41:18'),
(363, 'Boonex Dolphin   ', 9, 'This is the testing.', 1, '2016-01-04 03:41:35'),
(364, 'C Programming  ', 9, 'This is the testing.', 1, '2016-01-04 03:42:00'),
(365, 'C# Programming ', 9, 'This is the testing.', 1, '2016-01-04 03:42:22'),
(366, 'C++ Programming ', 9, 'This is the testing.', 1, '2016-01-04 03:42:40'),
(367, 'CakePHP', 9, 'This is the testing.', 1, '2016-01-04 03:43:03'),
(368, 'Call Control XML ', 9, 'This is the testing.', 1, '2016-01-04 03:43:31'),
(369, 'CasperJS  ', 9, 'This is the testing.', 1, '2016-01-04 03:43:50'),
(370, 'Cassandra ', 9, 'This is the testing.', 1, '2016-01-04 03:44:10'),
(371, 'Chordiant  ', 9, 'This is the testing.', 1, '2016-01-04 03:44:42'),
(372, 'Cisco  ', 9, 'This is the testing.', 1, '2016-01-04 03:45:12'),
(373, 'CLIPS ', 9, 'This is the testing.', 1, '2016-01-04 03:45:33'),
(374, 'Cloud Computing', 9, 'This is the testing.', 1, '2016-01-04 03:45:55'),
(375, 'CMS  ', 9, 'This is the testing.', 1, '2016-01-04 03:46:16'),
(376, 'COBOL ', 9, 'This is the testing.', 1, '2016-01-04 03:46:37'),
(377, 'Cocoa ', 9, 'This is the testing.', 1, '2016-01-04 03:47:00'),
(378, 'Codeigniter', 9, 'This is the testing.', 1, '2016-01-04 03:47:17'),
(379, 'Cold Fusion ', 9, 'This is the testing.', 1, '2016-01-04 03:47:42'),
(380, 'Computer Security  ', 9, 'This is the testing.', 1, '2016-01-04 03:48:04'),
(381, 'CS-Cart  ', 9, 'This is the testing.', 1, '2016-01-04 03:48:22'),
(382, 'CSS', 9, 'This is the testing.', 1, '2016-01-04 03:48:46'),
(383, 'CubeCart ', 9, 'This is the testing.', 1, '2016-01-04 03:49:02'),
(384, 'CUDA  ', 9, 'This is the testing.', 1, '2016-01-04 03:49:31'),
(385, 'D3.js ', 9, 'This is the testing.', 1, '2016-01-04 03:49:59'),
(386, 'Dart  ', 9, 'This is the testing', 1, '2016-01-04 03:50:31'),
(387, 'Database Administration', 9, 'This is the testing.', 1, '2016-01-04 03:51:35'),
(388, 'Database Development', 9, 'This is the testing.', 1, '2016-01-04 03:52:42'),
(389, 'Database Programming', 9, 'This is the testing.', 1, '2016-01-04 03:53:09'),
(390, 'DDS', 9, 'This is the testing.', 1, '2016-01-04 03:53:31'),
(391, 'Debian', 9, 'This is the testing.', 1, '2016-01-04 03:53:56'),
(392, 'Debugging', 9, 'This is the testing.', 1, '2016-01-04 03:54:16'),
(393, 'Dedicated Server', 9, 'This is the testing.', 1, '2016-01-04 03:54:42'),
(394, 'Delphi', 9, 'This is the testing.', 1, '2016-01-04 03:55:05'),
(395, 'Django', 9, 'This is the testing.', 1, '2016-01-04 03:55:25'),
(396, 'DNN', 9, 'This is the testing.', 1, '2016-01-04 03:55:57'),
(397, 'DNS', 9, 'This is the testing.', 1, '2016-01-04 03:56:33'),
(398, 'DOS', 9, 'This is the testing.', 1, '2016-01-04 03:57:04'),
(399, 'Drupal', 9, 'This is the testing.', 1, '2016-01-04 03:57:33'),
(400, 'eCommerce', 9, 'This is the testing.', 1, '2016-01-04 03:57:54'),
(401, 'eLearning ', 9, 'This is the testing.', 1, '2016-01-04 03:58:24'),
(402, 'Electronic Forms ', 9, 'This is the testing.', 1, '2016-01-04 03:58:42'),
(403, 'Embedded Software', 9, 'This is the testing.', 1, '2016-01-04 03:59:10'),
(404, 'Ember.js ', 9, 'This is the testing.', 1, '2016-01-04 03:59:32'),
(405, 'Erlang', 9, 'This is the testing.', 1, '2016-01-04 03:59:57'),
(406, 'Express JS', 9, 'This is the testing.', 1, '2016-01-04 04:00:31'),
(407, 'Face Recognition', 9, 'This is the testing.', 1, '2016-01-04 04:00:51'),
(408, 'FileMaker', 9, 'This is the testing.', 1, '2016-01-04 04:01:23'),
(409, 'Fortran ', 9, 'This is the testing.', 1, '2016-01-04 04:01:49'),
(410, 'Game Consoles', 9, 'This is the testing.', 1, '2016-01-04 04:02:09'),
(411, 'Game Design', 9, 'This is the testing.', 1, '2016-01-04 04:02:44'),
(412, 'Game Development', 9, 'This is the testing.', 1, '2016-01-04 04:03:12'),
(413, 'Git', 9, 'This is the testing.', 1, '2016-01-04 04:04:06'),
(414, 'Golang', 9, 'This is the testing.', 1, '2016-01-04 04:04:58'),
(415, 'Salesforce App Development', 9, 'This is the testing.', 1, '2016-01-04 04:05:18'),
(416, 'Google App Engine', 9, 'This is the testing.', 1, '2016-01-04 04:05:20'),
(417, 'Google App Engine', 9, 'This is the testing.', 1, '2016-01-04 04:05:21'),
(418, 'Google Cardboard', 9, 'This is the testing.', 1, '2016-01-04 04:05:46'),
(419, 'Google Maps API ', 9, 'This is the testing.', 1, '2016-01-04 04:07:34'),
(420, 'Google Web Toolkit', 9, 'This is the testing', 1, '2016-01-04 04:08:00'),
(421, 'GPGPU', 9, 'This is the testing.', 1, '2016-01-04 04:08:25'),
(422, 'Growth Hacking', 9, 'This is the testing.', 1, '2016-01-04 04:09:08'),
(423, 'Grunt', 9, 'This is the testing.', 1, '2016-01-04 04:09:36'),
(424, 'GUI', 9, 'This is the testing.', 1, '2016-01-04 04:10:14'),
(425, 'HTML', 9, 'This is the testing.', 1, '2016-01-04 04:10:42'),
(426, 'HTML5', 9, 'This is the testing.', 1, '2016-01-04 04:11:05'),
(427, 'iBeacon', 9, 'This is the testing.', 1, '2016-01-04 04:11:33'),
(428, 'Internet Security', 9, 'This is the testing.', 1, '2016-01-04 04:11:57'),
(429, 'Inventory Management System ', 9, 'This is the testing.', 1, '2016-01-04 04:12:30'),
(430, 'Ionic Framework  ', 9, 'This is the testing.', 1, '2016-01-04 04:14:06'),
(431, 'ITIL', 9, 'This is the testing.', 1, '2016-01-04 04:14:26'),
(432, 'Jabber', 9, 'This is the testing.', 1, '2016-01-04 04:15:10'),
(434, 'JavaFX', 9, 'This is the testing.', 1, '2016-01-04 04:15:56'),
(435, 'Javascript ', 9, 'This is the testing.', 1, '2016-01-04 04:16:10'),
(436, 'Joomla', 9, 'This is the testing.', 1, '2016-01-04 04:16:38'),
(437, 'JQuery', 9, 'This is the testing.', 1, '2016-01-04 04:17:01'),
(438, 'JSON', 9, 'This is the testing.', 1, '2016-01-04 04:17:22'),
(439, 'JSP Programming', 9, 'This is the testing.', 1, '2016-01-04 04:17:43'),
(440, 'Knockout.js', 9, 'This is the testing.', 1, '2016-01-04 04:18:11'),
(441, 'LabVIEW', 9, 'This is the testing.', 1, '2016-01-04 04:18:50'),
(442, 'Symbian', 8, 'This is the testing.', 1, '2016-01-04 04:19:13'),
(444, 'Leap Motion SDK ', 9, 'This is the testing.', 1, '2016-01-04 04:19:36'),
(445, 'Less', 9, 'This is the testing.', 1, '2016-01-04 04:19:59'),
(446, 'Rocket Engine', 9, 'This is the testing.', 1, '2016-01-04 04:20:17'),
(447, 'Ruby', 9, 'This is the testing.', 1, '2016-01-04 04:20:19'),
(448, 'Ruby on Rails', 9, 'This is the testing.', 1, '2016-01-04 04:20:19'),
(449, 'Link Building', 9, 'This is the testing.', 1, '2016-01-04 04:20:19'),
(450, 'SAP', 9, 'This is the testing.', 1, '2016-01-04 04:20:20'),
(451, 'Linux', 9, 'This is the testing.', 1, '2016-01-04 04:20:35'),
(452, 'Lisp', 9, 'This is the testing.', 1, '2016-01-04 04:20:58'),
(453, 'Lotus Notes ', 9, 'This is the testing.', 1, '2016-01-04 04:21:31'),
(454, 'Lua', 9, 'This is the testing.', 1, '2016-01-04 04:24:48'),
(455, 'Mac OS', 9, 'This is the testing.', 1, '2016-01-04 04:25:10'),
(456, 'Magento', 9, 'This is the testing.', 1, '2016-01-04 04:25:51'),
(457, 'Socket IO', 9, 'Magic Leap', 1, '2016-01-04 04:26:11'),
(458, 'Magic Leap ', 9, 'This is the testing.', 1, '2016-01-04 04:26:38'),
(459, 'MapReduce', 9, 'This is the testing.', 1, '2016-01-04 04:27:06'),
(460, 'MariaDB ', 9, 'This is the testing.', 1, '2016-01-04 04:27:34'),
(461, 'Metatrader', 9, 'This is the testing.', 1, '2016-01-04 04:28:02'),
(462, 'Microsoft Access ', 9, 'This is the testing.', 1, '2016-01-04 04:29:03'),
(463, 'Microsoft Exchange', 9, 'This is the testing.', 1, '2016-01-04 04:29:36'),
(464, 'Microsoft Expression', 9, 'This is the testing.', 1, '2016-01-04 04:29:57'),
(465, 'Microsoft Hololens', 9, 'This is the testing.', 1, '2016-01-04 04:30:35'),
(466, 'Microsoft SQL Server', 9, 'This is the testing.', 1, '2016-01-04 04:31:34'),
(468, 'Minitlab  ', 9, 'This is the testing.', 1, '2016-01-04 04:32:54'),
(469, 'Mobile App Testing', 9, 'This is the testing.', 1, '2016-01-04 04:34:24'),
(470, 'MODx', 9, 'This is the testing.', 1, '2016-01-04 04:34:57'),
(471, 'MonetDB ', 9, 'This is the testing.', 1, '2016-01-04 04:35:23'),
(472, 'Moodle', 9, 'This is the testing.', 1, '2016-01-04 04:35:45'),
(473, 'MQTT', 9, 'This is the testing.', 1, '2016-01-04 04:36:14'),
(474, 'MVC', 9, 'This is the testing.', 1, '2016-01-04 04:36:40'),
(475, 'MySQL Server', 9, 'This is testing.', 1, '2016-01-04 04:37:04'),
(476, 'Network Administration', 9, 'This is the testing.', 1, '2016-01-04 04:37:28'),
(477, 'Nginx', 9, 'This is the testing.', 1, '2016-01-04 04:38:09'),
(478, 'Ning ', 9, 'This is the testing.', 1, '2016-01-04 04:39:07'),
(479, 'node.js', 9, 'This is the testing.', 1, '2016-01-04 04:39:34'),
(480, 'NoSQL Couch & Mongo', 9, 'This is the testing.', 1, '2016-01-04 04:40:06'),
(481, 'Objective-C', 9, 'This is the testing.', 1, '2016-01-04 04:40:38'),
(482, 'OCR', 9, 'This is the testing.', 1, '2016-01-04 04:41:01'),
(483, 'Oculus Mobile SDK', 9, 'This is the testing.', 1, '2016-01-04 04:41:36'),
(484, 'OpenBravo', 9, 'This is the testing.', 1, '2016-01-04 04:41:58'),
(485, 'OpenCL', 9, 'This is the testing.', 1, '2016-01-04 04:42:19'),
(486, 'OpenGL', 9, 'This is the testing.', 1, '2016-01-04 04:42:40'),
(487, 'OpenVMS', 9, 'This is the testing.', 1, '2016-01-04 04:43:00'),
(488, 'Oracle', 9, 'This is the testing.', 1, '2016-01-04 04:43:19'),
(489, 'Papiamento', 9, 'This is the testing.', 1, '2016-01-04 04:43:41'),
(490, 'Parallax Scrolling ', 9, 'This is the testing.', 1, '2016-01-04 04:44:02'),
(491, 'Parallels Automation', 9, 'This is the testing.', 1, '2016-01-04 04:44:41'),
(492, 'Parallels Desktop', 9, 'This is the testing.', 1, '2016-01-04 04:45:18'),
(493, 'Pattern Matching', 9, 'This is the testing.', 1, '2016-01-04 04:45:47'),
(494, 'Paypal API ', 9, 'This is the testing.', 1, '2016-01-04 04:46:31'),
(495, 'Paytrace', 9, 'This is the testing.', 1, '2016-01-04 04:46:51'),
(496, 'PencilBlue CMS', 9, 'This is the testing.', 1, '2016-01-04 04:47:14'),
(498, 'Pentaho', 9, 'This is the testing.', 1, '2016-01-04 04:48:00'),
(499, 'Perl ', 9, 'This is the testing.', 1, '2016-01-04 04:48:28'),
(500, 'PHP', 9, 'This is the testing.', 1, '2016-01-04 04:48:54'),
(501, 'PICK Multivalue DB', 9, 'This is the testing.', 1, '2016-01-04 04:49:23'),
(502, 'Plesk', 9, 'This is the testing.', 1, '2016-01-04 04:49:42'),
(503, 'PostgreSQL', 9, 'This is the testing.', 1, '2016-01-04 04:50:02'),
(504, 'Prestashop', 9, 'This is the testing.', 1, '2016-01-04 04:50:26'),
(505, 'Prolog', 9, 'This is the testing.', 1, '2016-01-04 04:50:50'),
(506, 'Protoshare', 9, 'This is the testing.', 1, '2016-01-04 04:51:22'),
(507, 'Puppet', 9, 'This is the testing.', 1, '2016-01-04 04:52:23'),
(508, 'Python', 9, 'This is testing.', 1, '2016-01-04 04:53:01'),
(509, 'QA & Testing', 9, 'This is the testing.', 1, '2016-01-04 04:53:27'),
(510, 'QlikView', 9, 'This is the testing.', 1, '2016-01-04 04:54:08'),
(511, 'Qualtrics Survey Platform', 9, 'This is the testing.', 1, '2016-01-04 04:54:34'),
(512, 'QuickBase', 9, 'This is the testing.', 1, '2016-01-04 04:55:19'),
(513, 'R Programming Language', 9, 'This is the testing.', 1, '2016-01-04 04:55:44'),
(514, 'RDBMS', 9, 'This is the testing.', 1, '2016-01-04 04:56:53'),
(515, 'React.js', 9, 'This is the testing.', 1, '2016-01-04 04:57:15'),
(516, 'REALbasic', 9, 'This is testing.', 1, '2016-01-04 04:58:25'),
(517, 'Red Hat', 9, 'This is the testing.', 1, '2016-01-04 05:01:34'),
(518, 'Redis', 9, 'This is the testing.', 1, '2016-01-04 05:01:48'),
(519, 'Redshift', 9, 'This is the testing.', 1, '2016-01-04 05:02:17'),
(520, 'RESTful', 9, 'This is the testing.', 1, '2016-01-04 05:02:36'),
(521, 'SASS', 9, 'This is the testing.', 1, '2016-01-04 05:12:00'),
(522, 'Scala', 9, 'This is the testing.', 1, '2016-01-04 05:12:36'),
(523, 'Scheme', 9, 'This is the testing.', 1, '2016-01-04 05:13:00'),
(524, 'Scrum', 9, 'This is the testing.', 1, '2016-01-04 05:13:24'),
(526, 'SDK', 9, 'This is the testing.', 1, '2016-01-04 05:14:00'),
(527, 'SEO', 9, 'This is the testing.', 1, '2016-01-04 05:14:22'),
(528, 'Sharepoint', 9, 'This is the testing.', 1, '2016-01-04 05:14:45'),
(529, 'Shell Script', 9, 'This is the testing.', 1, '2016-01-04 05:15:06'),
(530, 'Shopping Carts', 9, 'This is the testing.', 1, '2016-01-04 05:15:25'),
(531, 'Siebel', 9, 'This is the testing.', 1, '2016-01-04 05:15:48'),
(532, 'Silverlight', 9, 'This is the testing.', 1, '2016-01-04 05:16:10'),
(533, 'Smarty PHP', 9, 'This is the testing.', 1, '2016-01-04 05:16:47'),
(534, 'Snapchat', 9, 'This is the testing.', 1, '2016-01-04 05:17:20'),
(535, 'Social Networking ', 9, 'This is the testing.', 1, '2016-01-04 05:17:48'),
(536, 'Software Architecture', 9, 'This is the testing.', 1, '2016-01-04 05:18:56'),
(537, 'Software Development', 9, 'This is the testing.', 1, '2016-01-04 05:19:12'),
(538, 'Solaris', 9, 'This is the testing.', 1, '2016-01-04 05:19:30'),
(539, 'Spark', 9, 'This is the testing.', 1, '2016-01-04 05:19:48'),
(540, 'Sphinx', 9, 'This is the testing.', 1, '2016-01-04 05:20:12'),
(541, 'SPSS Statistics', 9, 'This is the testing.', 1, '2016-01-04 05:20:34'),
(542, 'SQL', 9, 'This is the testing.', 1, '2016-01-04 05:20:54'),
(543, 'SQLite', 9, 'This is the testing.', 1, '2016-01-04 05:21:12'),
(544, 'Squarespace', 9, 'This is the testing.', 1, '2016-01-04 05:21:34'),
(545, 'Steam API', 9, 'This is the testing.', 1, '2016-01-04 05:21:53'),
(546, 'Stripe', 9, 'This is the testing.', 1, '2016-01-04 05:22:18'),
(547, 'SugarCRM', 9, 'This is the testing.', 1, '2016-01-04 05:22:36'),
(548, 'Swift', 9, 'This is the testing.', 1, '2016-01-04 05:23:06'),
(549, 'Symfony PHP', 9, 'This is the testing.', 1, '2016-01-04 05:23:48'),
(550, 'System Admin', 9, 'This is the testing.', 1, '2016-01-04 05:24:08'),
(551, 'Tableau', 9, 'This is the system for testing.', 1, '2016-01-04 05:24:39'),
(552, 'TaoBao API ', 9, 'This is the testing.', 1, '2016-01-04 05:25:02'),
(553, 'TestStand ', 9, 'This is the testing.', 1, '2016-01-04 05:25:24'),
(554, 'Tibco Spotfire', 9, 'This is the testing.', 1, '2016-01-04 05:25:59'),
(555, 'TYPO3', 9, 'This is the testing.', 1, '2016-01-04 05:26:19'),
(556, 'Ubuntu', 9, 'This is the testing.', 1, '2016-01-04 05:26:36'),
(557, 'UI / UX / IA', 9, 'This is the testing.', 1, '2016-01-04 05:27:05'),
(558, 'Umbraco', 9, 'This is the testing.', 1, '2016-01-04 05:27:24'),
(559, 'UML Design', 9, 'This is the testing.', 1, '2016-01-04 05:27:43'),
(560, 'Unity 3D', 9, 'This is the testing.', 1, '2016-01-04 05:28:07'),
(561, 'UNIX', 9, 'This is the testing.', 1, '2016-01-04 05:28:23'),
(562, 'Usability Testing ', 9, 'This is for the testing.', 1, '2016-01-04 05:28:53'),
(563, 'VB', 9, 'This is the testing.', 1, '2016-01-04 05:29:25'),
(564, 'vBulletin', 9, 'This is the testing.', 1, '2016-01-04 05:29:41'),
(565, 'VertexFX', 9, 'This is for the testing.', 1, '2016-01-04 05:30:07'),
(566, 'Virtuozzo', 9, 'This is for the testing.', 1, '2016-01-04 05:30:26'),
(567, 'Visual Basic', 9, 'This is for the testing.', 1, '2016-01-04 05:31:36'),
(568, 'Visual Foxpro', 9, 'This is for the testing.', 1, '2016-01-04 05:32:26'),
(569, 'VMware', 9, 'This is for the testing.', 1, '2016-01-04 05:32:44'),
(570, 'VoiceXML', 9, 'This is for the testing.', 1, '2016-01-04 05:33:03'),
(571, 'VoIP', 9, 'This is for the testing.', 1, '2016-01-04 05:33:28'),
(572, 'VPS', 9, 'This is for the testing.', 1, '2016-01-04 05:34:40'),
(573, 'Vuforia', 9, 'This is fro the testing.', 1, '2016-01-04 05:34:57'),
(577, 'WatchKit', 9, 'This is for the testing.', 1, '2016-01-04 05:35:36'),
(578, 'Web Hosting', 9, 'This is for the testing.', 1, '2016-01-04 05:35:58'),
(579, 'Web Scraping', 9, 'This is for the testing.', 1, '2016-01-04 05:36:21'),
(580, 'Web Security', 9, 'This is for the testing.', 1, '2016-01-04 05:36:38'),
(581, 'Gamification', 9, 'This is for the testing.', 1, '2016-01-04 05:36:55'),
(583, 'Web Services', 9, 'This is for the testing.', 1, '2016-01-04 05:36:57'),
(584, 'Website Developing', 9, 'This is for the testing.', 1, '2016-01-04 05:37:22'),
(585, 'WHMCS', 9, 'This is for the testing.', 1, '2016-01-04 05:37:39'),
(587, 'Window OS', 9, 'This is for the testing.', 1, '2016-01-04 05:37:59'),
(588, 'Windows API', 9, 'Windows API', 1, '2016-01-04 05:38:16'),
(589, 'Windows Server', 9, 'This is for the testing.', 1, '2016-01-04 05:38:37'),
(590, 'Wix', 9, 'This is for the testing.', 1, '2016-01-04 05:38:58'),
(591, 'Wordpress', 9, 'This is for the testing..', 1, '2016-01-04 05:39:20'),
(592, 'WPF', 9, 'This is for the testing.', 1, '2016-01-04 05:39:37'),
(593, 'Wufoo', 9, 'This is for the testing.', 1, '2016-01-04 05:39:55'),
(594, 'x86/x64 Assembler', 9, 'This is for the testing.', 1, '2016-01-04 05:40:22'),
(595, 'XML', 9, 'This is for the testing.', 1, '2016-01-04 05:40:38'),
(596, 'XMPP', 9, 'This is for the testing.', 1, '2016-01-04 05:41:06'),
(597, 'Xojo', 9, 'This is for the testing.', 1, '2016-01-04 05:41:24'),
(598, 'Xoops', 9, 'This is for the testing.', 1, '2016-01-04 05:41:46'),
(599, 'XQuery', 9, 'This is for the testing.', 1, '2016-01-04 05:42:06'),
(600, 'XSLT  ', 9, 'This is for the testing.', 1, '2016-01-04 05:42:33'),
(601, 'Yii', 9, 'This is for the testing.', 1, '2016-01-04 05:43:05'),
(602, 'Zen Cart', 9, 'This is for the testing.', 1, '2016-01-04 05:43:28'),
(603, 'Zend', 9, 'This is for the testing.', 1, '2016-01-04 05:43:48'),
(604, 'Zoho', 9, 'This is for the testing.', 1, '2016-01-04 05:44:05'),
(606, 'G+', 11, 'This is the fro the testing.', 1, '2016-01-04 06:00:49'),
(607, 'Global marketing Planning', 11, 'This is for the testing.', 1, '2016-01-04 06:01:11'),
(608, 'Google Adsense', 11, 'This is for the testing.', 1, '2016-01-04 06:01:39'),
(609, 'Google Adwords', 11, 'This is for the testing.', 1, '2016-01-04 06:02:01'),
(610, 'Inbound Marketing', 11, 'This is for the testing.', 1, '2016-01-04 06:02:26'),
(612, 'Internet Marketing', 11, 'This is for the testing.', 1, '2016-01-04 06:03:16'),
(614, 'LinkedIn', 11, 'This is for the testing.', 1, '2016-01-04 06:04:04'),
(615, 'Mailchimp', 11, 'This is for the testing.', 1, '2016-01-04 06:04:28'),
(617, 'MailWizz', 11, 'test', 1, '2016-01-04 06:04:57'),
(619, 'Marketing', 11, 'test', 1, '2016-01-04 06:05:29'),
(621, 'Mass customization', 11, 'test', 1, '2016-01-04 06:06:02'),
(622, 'Multi-Level Marketing', 11, 'test', 1, '2016-01-04 06:06:29'),
(623, 'Outbound Marketing', 11, 'test', 1, '2016-01-04 06:06:46'),
(624, 'Pinterest', 11, 'This is for the testing', 1, '2016-01-04 06:07:07'),
(625, 'Promotional Marketing', 11, 'test', 1, '2016-01-04 06:07:25'),
(626, 'Relationship Marketing', 11, 'test', 1, '2016-01-04 06:08:01'),
(628, 'Sales', 11, 'test', 1, '2016-01-04 06:08:17'),
(629, 'Sales management', 11, 'test', 1, '2016-01-04 06:08:33'),
(630, 'Instagram', 11, 'test', 1, '2016-01-04 06:09:05'),
(631, 'Sales outsourcing', 11, 'test', 1, '2016-01-04 06:09:22'),
(632, 'Scenario planning', 11, 'test', 1, '2016-01-04 06:09:36'),
(633, 'Search Engine Marketing', 11, 'test', 1, '2016-01-04 06:10:30'),
(634, 'SendBlaster', 11, 'test', 1, '2016-01-04 06:11:02'),
(635, 'Social Media Marketing', 11, 'test', 1, '2016-01-04 06:11:21'),
(637, 'Trade Show Marketing', 11, 'test', 1, '2016-01-04 06:12:19'),
(638, 'Tumblr', 11, 'test', 1, '2016-01-04 06:12:44'),
(639, 'Twitter', 11, 'test', 1, '2016-01-04 06:13:01'),
(640, 'Viral Marketing', 11, 'test', 1, '2016-01-04 06:13:15'),
(642, 'Grant Writing', 12, 'test', 1, '2016-01-04 06:35:43'),
(643, 'Newsletters ', 12, 'test', 1, '2016-01-04 06:36:22'),
(644, 'Online Writing ', 12, 'test', 1, '2016-01-04 06:37:05'),
(645, 'Poetry', 12, 'test', 1, '2016-01-04 06:37:25'),
(646, 'Press Releases', 12, 'test', 1, '2016-01-04 06:37:46'),
(647, 'Product Descriptions', 12, 'test', 1, '2016-01-04 06:38:05'),
(648, 'Proofreading', 12, 'test', 1, '2016-01-04 06:38:21'),
(649, 'Proposal', 12, 'test', 1, '2016-01-04 06:38:42'),
(650, 'Publishing', 12, 'test', 1, '2016-01-04 06:38:56'),
(651, 'General Knowledge', 12, '', 1, '2016-01-04 06:38:57'),
(652, 'Comprehension', 12, '', 1, '2016-01-04 06:38:58'),
(653, 'Report Writing', 12, 'test', 1, '2016-01-04 06:40:17'),
(654, 'Resumes & Cover Letters', 12, 'test', 1, '2016-01-04 06:40:33'),
(655, 'Reviews', 12, 'test', 1, '2016-01-04 06:40:59'),
(656, 'Screenwriting', 12, 'test', 1, '2016-01-04 06:41:12'),
(657, 'Short Stories', 12, 'test', 1, '2016-01-04 06:41:41'),
(658, 'Simple Writing', 12, 'test', 1, '2016-01-04 06:42:07'),
(659, 'Slogans', 12, 'test', 1, '2016-01-04 06:42:44'),
(660, 'Speech Writing ', 12, 'test', 1, '2016-01-04 06:42:59'),
(661, 'Technical Writing', 12, 'test', 1, '2016-01-04 06:43:40'),
(662, 'Translation', 12, 'test', 1, '2016-01-04 06:43:57'),
(663, 'Typing', 12, 'test', 1, '2016-01-04 06:44:14'),
(664, 'Web Content', 12, 'test', 1, '2016-01-04 06:44:49'),
(665, 'Wikipedia', 12, '', 1, '2016-01-04 06:45:08'),
(666, 'Word Processing', 12, 'test', 1, '2016-01-04 06:45:52'),
(668, 'CAM', 15, 'test', 1, '2016-01-04 11:05:03'),
(669, 'Data Mining', 15, 'test', 1, '2016-01-04 11:05:16'),
(670, 'Data Science', 15, 'test', 1, '2016-01-04 11:05:28'),
(671, 'Digital Design', 15, 'test', 1, '2016-01-04 11:05:43'),
(672, 'Digital Sculpting', 15, 'test', 1, '2016-01-04 11:05:57'),
(673, 'Drones', 15, 'test', 1, '2016-01-04 11:06:11'),
(674, 'Electrical Engineering', 15, 'test', 1, '2016-01-04 11:06:25'),
(675, 'Electronics  ', 15, 'test', 1, '2016-01-04 11:06:38'),
(676, 'Engineering', 15, 'test', 1, '2016-01-04 11:06:53'),
(677, 'Engineering Drawing ', 15, 'test', 1, '2016-01-04 11:07:08'),
(678, 'Finite Element Analysis  ', 15, 'test', 1, '2016-01-04 11:07:36'),
(679, 'FPGA  ', 15, 'test', 1, '2016-01-04 11:07:47'),
(680, 'Genetic Engineering', 15, 'test', 1, '2016-01-04 11:08:02'),
(681, 'Geology  ', 15, 'test', 1, '2016-01-04 11:08:13'),
(682, 'Geospatial', 15, 'test', 1, '2016-01-04 11:08:29'),
(683, 'Geotechnical Engineering', 15, 'test', 1, '2016-01-04 11:08:48'),
(684, 'GPS', 15, 'test', 1, '2016-01-04 11:09:04'),
(685, 'Home Architectural Design ', 15, 'test', 1, '2016-01-04 11:09:28'),
(686, 'Human Sciences  ', 15, 'test', 1, '2016-01-04 11:09:44'),
(687, 'Imaging   ', 15, 'test', 1, '2016-01-04 11:10:03'),
(688, 'Industrial Design', 15, 'test', 1, '2016-01-04 11:10:17'),
(689, 'Industrial Engineering ', 15, 'test', 1, '2016-01-04 11:10:30'),
(690, 'Instrumentation  ', 15, 'test', 1, '2016-01-04 11:10:52'),
(691, 'Linear Programming  ', 15, 'test', 1, '2016-01-04 11:11:05'),
(692, 'Machine Learning', 15, 'test', 1, '2016-01-04 11:11:18'),
(693, 'Manufacturing Design', 15, 'test', 1, '2016-01-04 11:11:34'),
(694, 'Materials Engineering', 15, 'test', 1, '2016-01-04 11:11:46'),
(695, 'Matlab', 15, 'test', 1, '2016-01-04 11:12:06'),
(696, 'Mathematics ', 15, 'test', 1, '2016-01-04 11:12:17'),
(697, 'Mechanical Engineering', 15, 'test', 1, '2016-01-04 11:12:32'),
(698, 'Mechatronics ', 15, 'test', 1, '2016-01-04 11:12:42'),
(699, 'Medical', 15, 'test', 1, '2016-01-04 11:12:54'),
(700, 'Microbiology ', 15, 'test', 1, '2016-01-04 11:13:12'),
(702, 'Microcontroller', 15, 'test', 1, '2016-01-04 11:13:53'),
(703, 'Microstation', 15, 'test', 1, '2016-01-04 11:14:04'),
(705, 'Mining Engineering', 15, 'test', 1, '2016-01-04 11:14:18'),
(706, 'Nanotechnology', 15, 'test', 1, '2016-01-04 11:14:35'),
(707, 'Natural Language', 15, 'test', 1, '2016-01-04 11:14:47'),
(708, 'PCB Layout  ', 15, 'test', 1, '2016-01-04 11:14:58'),
(709, 'Petroleum Engineering  ', 15, 'test', 1, '2016-01-04 11:15:09'),
(710, 'Physics', 15, 'test', 1, '2016-01-04 11:15:20'),
(711, 'PLC', 15, 'test', 1, '2016-01-04 11:15:33'),
(720, 'Scientific Research  ', 9, 'test', 1, '2016-01-04 11:17:45'),
(721, 'Statistical Analysis  ', 15, 'test', 1, '2016-01-04 11:19:17'),
(722, 'Statistics', 15, 'test', 1, '2016-01-04 11:20:15'),
(724, 'Surfboard Design', 15, 'test', 1, '2016-01-04 11:20:43'),
(725, 'Telecommunications', 15, 'test', 1, '2016-01-04 11:21:01'),
(726, 'Textile', 15, 'test', 1, '2016-01-04 11:21:14'),
(727, 'Vectorization', 15, 'test', 1, '2016-01-04 11:21:30'),
(728, 'Verilog', 15, 'test', 1, '2016-01-04 11:21:46'),
(729, 'VHDL', 15, 'test', 1, '2016-01-04 11:22:03'),
(730, 'Wireless', 15, 'test', 1, '2016-01-04 11:22:23'),
(731, 'Wolfram', 15, 'test', 1, '2016-01-04 11:22:37'),
(733, 'Business Analysis ', 14, 'test', 1, '2016-01-05 12:02:13'),
(734, 'Business Law by Country', 14, 'test', 1, '2016-01-05 12:02:26'),
(735, 'Business Plans  ', 14, 'test', 1, '2016-01-05 12:02:40'),
(736, 'Compliance ', 14, 'test', 1, '2016-01-05 12:02:55'),
(737, 'Contracts ', 14, 'test', 1, '2016-01-05 12:03:11'),
(739, 'Employment Law', 14, 'test', 1, '2016-01-05 12:03:59'),
(740, 'Entrepreneurship', 14, 'test', 1, '2016-01-05 12:04:14'),
(741, 'International Commercial Law', 14, 'test', 1, '2016-01-05 12:04:27'),
(742, 'Legal Writing', 14, 'test', 1, '2016-01-05 12:04:41'),
(743, 'Partnership Contract', 14, 'test', 1, '2016-01-05 12:04:55'),
(744, 'Property Law', 14, 'test', 1, '2016-01-05 12:05:12'),
(745, 'Tax Law', 14, 'test', 1, '2016-01-05 12:05:35'),
(746, 'Visa / Immigration Law', 14, 'test', 1, '2016-01-05 12:07:02'),
(749, 'J2EE', 9, 'This is the testing.', 1, '2016-01-07 05:22:59'),
(750, 'Laravel', 9, 'This is the testing.', 1, '2016-01-07 05:24:16'),
(751, 'MMORPG', 9, 'This is the testing.', 1, '2016-01-07 05:34:48'),
(754, 'Flash', 7, '', 1, '2016-01-07 03:08:40'),
(755, 'Sketches', 7, '', 1, '2016-01-09 01:53:25'),
(759, '3D Animation', 7, '', 1, '2016-01-09 01:54:25'),
(760, 'Photoshop', 7, '', 1, '2016-01-09 02:00:30'),
(763, '3ds Max', 7, '', 1, '2016-01-09 02:00:30'),
(764, 'Adobe Indesign', 7, '', 1, '2016-01-09 02:00:30'),
(775, 'CorelDraw', 7, '', 1, '2016-01-09 02:37:30'),
(778, 'QuarkXPress', 7, '', 1, '2016-01-09 02:37:30'),
(779, 'Illusion Designing', 7, '', 1, '2016-01-09 04:12:19'),
(780, 'Billboard Designing', 7, '', 1, '2016-01-09 04:24:42'),
(781, 'Photographic Illustrations', 7, '', 1, '2016-01-09 04:24:42'),
(782, '3D Designing', 7, '', 1, '2016-01-09 04:24:42'),
(783, 'Print Designing', 7, '', 1, '2016-01-09 04:24:42'),
(789, 'Adobe Audition', 7, '', 1, '2016-01-09 04:31:26'),
(790, 'Objective C', 8, '', 1, '2016-01-22 02:19:17'),
(791, 'Swift', 8, '', 1, '2016-01-22 02:19:18'),
(792, 'JSON Code', 8, '', 1, '2016-01-22 02:19:18'),
(793, 'JavaScript', 8, '', 1, '2016-01-22 02:19:18'),
(794, 'HTML', 8, '', 1, '2016-01-22 02:19:18'),
(795, 'HTML 5', 8, '', 1, '2016-01-22 02:19:18'),
(796, 'XML', 8, '', 1, '2016-01-22 02:19:18'),
(797, 'ASP', 8, '', 1, '2016-01-22 02:19:18'),
(798, 'JSP', 8, '', 1, '2016-01-22 02:19:18'),
(799, 'JQuery', 8, '', 1, '2016-01-22 02:19:18'),
(800, 'MySQL', 8, '', 1, '2016-01-22 02:19:18'),
(801, 'Database', 8, '', 1, '2016-01-22 02:19:18'),
(802, 'Oracle', 8, '', 1, '2016-01-22 02:19:18'),
(803, 'C++', 8, '', 1, '2016-01-22 02:19:18'),
(804, 'Java', 8, '', 1, '2016-01-22 02:19:18'),
(805, 'OOP', 8, '', 1, '2016-01-22 02:19:18'),
(806, 'Eclipse IDE', 8, '', 1, '2016-01-22 02:19:18'),
(807, 'C', 8, '', 1, '2016-01-22 02:19:18'),
(809, '.Net', 8, '', 1, '2016-01-22 02:19:18'),
(810, 'SDK', 8, '', 1, '2016-01-22 02:19:18'),
(811, 'MS Office', 11, '', 1, '2016-01-22 03:08:57'),
(812, 'SPSS', 11, '', 1, '2016-01-22 03:08:58'),
(813, 'Communication Skills', 11, '', 1, '2016-01-22 03:08:58'),
(814, 'WordPress', 11, '', 1, '2016-01-22 03:08:58'),
(815, 'SEO', 11, '', 1, '2016-01-22 03:08:58'),
(816, 'Link Building', 11, '', 1, '2016-01-22 03:08:58'),
(817, 'Paid Search', 11, '', 1, '2016-01-22 03:08:58'),
(818, 'PPC', 11, '', 1, '2016-01-22 03:08:58'),
(819, 'Magento', 11, '', 1, '2016-01-22 03:08:58'),
(820, 'SMM', 11, '', 1, '2016-01-22 03:08:58'),
(821, 'Sale Forecasting', 11, '', 1, '2016-01-22 03:08:58'),
(822, 'Selling Skills', 11, '', 1, '2016-01-22 03:08:58'),
(823, 'Direct Sale', 11, '', 1, '2016-01-22 03:08:58'),
(824, 'Sale Promotion', 11, '', 1, '2016-01-22 03:08:58'),
(826, 'Corporate Marketing', 11, '', 1, '2016-01-22 03:08:58'),
(827, 'Sell Product', 11, '', 1, '2016-01-22 03:08:58'),
(828, 'Generates Leads', 11, '', 1, '2016-01-22 03:08:58'),
(829, 'Team Player', 11, '', 1, '2016-01-22 03:08:58'),
(830, 'Stress Management Marketing', 11, '', 1, '2016-01-22 03:08:58'),
(831, 'Social Media Management', 11, '', 1, '2016-01-22 03:08:58'),
(832, 'SM Expert ', 11, '', 1, '2016-01-22 03:08:58'),
(833, 'Analytical Skills', 11, '', 1, '2016-01-22 03:08:58'),
(834, 'Channel Sales', 11, '', 1, '2016-01-22 03:08:58'),
(835, 'Post Mandatory Campaign', 11, '', 1, '2016-01-22 03:08:58'),
(836, 'Client Acquisition', 11, '', 1, '2016-01-22 03:08:58'),
(837, 'Cold Calling', 11, '', 1, '2016-01-22 03:08:58'),
(839, 'Posting', 11, '', 1, '2016-01-22 03:08:58'),
(840, 'Java Programming', 9, '', 1, '2016-01-24 04:16:18'),
(841, 'Prototype ', 9, '', 1, '2016-01-24 05:11:17'),
(842, 'Object-Oriented Programming', 9, '', 1, '2016-01-24 05:20:44'),
(843, 'SCSS', 9, '', 1, '2016-01-24 05:27:56'),
(844, 'ELT', 9, '', 1, '2016-01-24 05:30:04'),
(845, 'WPML', 9, '', 1, '2016-01-24 05:35:04'),
(846, 'PODs', 9, '', 1, '2016-01-24 05:35:04'),
(847, 'Redux', 9, '', 1, '2016-01-24 05:35:04'),
(848, 'Grasping Idea', 9, '', 1, '2016-01-24 05:35:04'),
(849, 'Fast Implementation', 9, '', 1, '2016-01-24 05:35:04'),
(850, 'CiviCRM', 9, '', 1, '2016-01-24 05:35:04'),
(851, 'Eclipse IDE', 8, '', 1, '2016-01-24 05:48:38'),
(852, 'Axure', 8, '', 1, '2016-01-24 06:07:29'),
(853, 'Non Academic Writing', 12, '', 1, '2016-01-24 06:42:09'),
(854, 'Writing Skills', 12, '', 1, '2016-01-24 06:42:56'),
(855, 'Professional Management', 12, '', 1, '2016-01-24 06:58:45'),
(856, 'Communication Skills', 12, '', 1, '2016-01-24 06:58:45'),
(857, 'User Guide', 12, '', 1, '2016-01-24 06:58:45'),
(858, 'Passion Writing', 12, '', 1, '2016-01-24 06:58:45'),
(859, 'SDLC Familiar', 12, '', 1, '2016-01-24 06:58:45'),
(860, 'Typing Speed', 16, '', 1, '2016-01-24 08:38:55'),
(861, 'PowerPoint', 16, '', 1, '2016-01-24 08:38:55'),
(862, 'Word Processing Skills', 16, '', 1, '2016-01-24 08:38:55'),
(863, 'Good English', 16, '', 1, '2016-01-24 08:38:55'),
(864, 'Online Retail Business', 16, '', 1, '2016-01-24 08:38:55'),
(865, ' Basic Computer Skills', 16, '', 1, '2016-01-24 08:38:55'),
(866, 'Daily Basis Production', 16, '', 1, '2016-01-24 08:38:55'),
(867, ' Internet Searching	', 16, '', 1, '2016-01-24 08:38:55'),
(868, 'Basic Photoshop', 16, '', 1, '2016-01-24 08:38:55'),
(869, 'Internet Expert', 16, '', 1, '2016-01-24 08:38:55'),
(870, 'Strong Vocabulary', 16, '', 1, '2016-01-24 08:38:55'),
(871, 'Audio Text Controller', 16, '', 1, '2016-01-24 08:38:55'),
(872, 'Statistics Skills', 16, '', 1, '2016-01-24 08:38:55'),
(873, 'Facebook', 16, '', 1, '2016-01-24 08:52:33'),
(874, 'LinkedIn', 16, '', 1, '2016-01-24 08:52:33'),
(875, 'Twitter', 16, '', 1, '2016-01-24 08:52:33'),
(876, 'English Writing Skills', 16, '', 1, '2016-01-24 08:52:33'),
(877, 'G+', 16, '', 1, '2016-01-24 08:52:33'),
(878, 'Energy', 15, '', 1, '2016-01-24 01:03:35'),
(879, 'Formula', 15, '', 1, '2016-01-24 01:03:35'),
(880, 'Technology Design', 15, '', 1, '2016-01-24 01:03:35'),
(881, 'Chemical Composition', 15, '', 1, '2016-01-24 01:03:35'),
(882, 'Knowledge of Screen', 15, '', 1, '2016-01-24 01:03:35'),
(883, 'Reaction Expert', 15, '', 1, '2016-01-24 01:03:35'),
(885, 'Atmospheric Dynamics', 15, '', 1, '2016-01-24 01:03:35'),
(886, 'Knowledge of Machine & Tools', 15, '', 1, '2016-01-24 01:03:35'),
(887, 'Design Components', 15, '', 1, '2016-01-24 01:03:35'),
(888, 'Power', 15, '', 1, '2016-01-24 01:03:35'),
(889, 'Maintaining Industrial Equipments', 15, '', 1, '2016-01-24 01:03:35'),
(890, 'Technology Design', 15, '', 1, '2016-01-24 01:03:35'),
(891, 'Circuit Board', 15, '', 1, '2016-01-24 01:03:35'),
(892, 'Signal Processing', 15, '', 1, '2016-01-24 01:03:35'),
(893, 'Power Generation', 15, '', 1, '2016-01-24 01:03:35'),
(894, 'Computer System Design', 15, '', 1, '2016-01-24 01:03:35'),
(895, 'Transformer', 15, '', 1, '2016-01-24 01:03:35'),
(896, 'Motor', 15, '', 1, '2016-01-24 01:03:35'),
(897, 'Transmission and Distribution', 15, '', 1, '2016-01-24 01:03:35'),
(898, 'Control System', 15, '', 1, '2016-01-24 01:03:35'),
(899, 'Physiology & Pathology', 15, '', 1, '2016-01-24 01:03:36'),
(900, 'Plant & Animal Organisms', 15, '', 1, '2016-01-24 01:03:36'),
(901, 'Tissues', 15, '', 1, '2016-01-24 01:03:36'),
(902, 'Cells', 15, '', 1, '2016-01-24 01:03:36'),
(903, 'Functions', 15, '', 1, '2016-01-24 01:03:36'),
(904, 'Evaluating Treatment Technique', 15, '', 1, '2016-01-24 01:03:36'),
(905, 'Structural Engineering', 15, '', 1, '2016-01-24 01:03:36'),
(906, 'Contractors', 15, '', 1, '2016-01-24 01:03:36'),
(907, 'Architects', 15, '', 1, '2016-01-24 01:03:36'),
(908, 'Urban Planners', 15, '', 1, '2016-01-24 01:03:36'),
(909, 'Transportation', 15, '', 1, '2016-01-24 01:03:36'),
(910, 'Build-outs', 15, '', 1, '2016-01-24 01:03:36'),
(911, 'Mathematical & Analytical Skills', 15, '', 1, '2016-01-24 01:03:36');
INSERT INTO `rtf_skills` (`id`, `skill_name`, `skill_category_id`, `description`, `is_active`, `created`) VALUES
(912, 'Physiology', 15, '', 1, '2016-01-24 01:03:36'),
(913, 'Production', 15, '', 1, '2016-01-24 01:03:36'),
(914, 'Yield', 15, '', 1, '2016-01-24 01:03:36'),
(915, 'Plants Breeding', 15, '', 1, '2016-01-24 01:03:36'),
(916, 'Soil', 15, '', 1, '2016-01-24 01:03:36'),
(917, 'Shrubs', 15, '', 1, '2016-01-24 01:03:36'),
(918, 'Trees', 15, '', 1, '2016-01-24 01:06:18'),
(919, 'Plants', 15, '', 1, '2016-01-24 01:06:18'),
(920, 'Knowledge Of Agriculture', 15, '', 1, '2016-01-24 01:06:18'),
(921, 'Phytoliths & Pollen', 15, '', 1, '2016-01-24 01:06:18'),
(922, 'Planner', 15, '', 1, '2016-01-24 01:06:18'),
(923, 'Microbe Cultures', 15, '', 1, '2016-01-24 01:06:18'),
(924, 'Microscopic Organisms', 15, '', 1, '2016-01-24 01:06:18'),
(925, 'Safety Procedure', 15, '', 1, '2016-01-24 01:06:18'),
(926, 'Research', 15, '', 1, '2016-01-24 01:06:18'),
(927, 'Analysis', 15, '', 1, '2016-01-24 01:06:18'),
(928, 'V-Ray', 15, '3D Studio Max', 1, '2016-01-24 01:29:34'),
(929, 'Imagination and Vision', 15, '3D Studio Max', 1, '2016-01-24 01:29:34'),
(930, 'Sketchup', 15, '3D Studio Max', 1, '2016-01-24 01:29:34'),
(931, 'BusinessCards MX', 7, '', 1, '2016-01-25 01:46:38'),
(932, 'PhotoImpact', 7, '', 1, '2016-01-25 01:54:18'),
(933, 'Dg Foto Art', 7, '', 1, '2016-01-25 03:14:41'),
(934, 'Dreamweaver', 7, '', 1, '2016-01-25 03:14:41'),
(935, 'Webydo', 7, '', 1, '2016-01-25 03:14:41'),
(936, 'Axure RP', 7, '', 1, '2016-01-25 03:14:41'),
(937, 'Adobe Fireworks', 7, '', 1, '2016-01-25 03:14:41'),
(938, 'Handmade Drawing', 7, '', 1, '2016-01-25 03:30:18'),
(939, 'Iconion', 7, '', 1, '2016-01-25 03:36:17'),
(940, 'Autodesk', 7, '', 1, '2016-01-25 03:41:05'),
(941, 'Tattoo Director', 7, '', 1, '2016-01-25 03:58:37'),
(942, 'Fashion CAD', 7, '', 1, '2016-01-25 04:42:07'),
(943, 'Optitex', 7, '', 1, '2016-01-25 04:42:07'),
(944, 'AutoCAD', 7, '', 1, '2016-01-25 04:42:07'),
(946, 'SketchList 3D', 7, '', 1, '2016-01-25 04:54:19'),
(947, 'Flash Scripting', 7, '', 1, '2016-01-25 04:55:40'),
(948, 'Android', 8, 'Mobile Development Skills', 1, '2018-10-04 13:43:38'),
(949, 'Kotline', 16, 'Mobile Development Skills', 1, '2018-10-04 13:43:38'),
(952, 'blog', 12, 'Some blogging teechniques', 1, '2018-10-04 14:03:52');

-- --------------------------------------------------------

--
-- Table structure for table `rtf_user_portfolios`
--

CREATE TABLE `rtf_user_portfolios` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `content_type` enum('image','article','code','video','audio','others') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'image',
  `title` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `item_description` text COLLATE utf8_unicode_ci NOT NULL,
  `text_preview` text COLLATE utf8_unicode_ci NOT NULL,
  `skill_ids` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cover_photo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rtf_user_portfolios`
--

INSERT INTO `rtf_user_portfolios` (`id`, `user_id`, `content_type`, `title`, `item_description`, `text_preview`, `skill_ids`, `cover_photo`, `created`, `is_active`) VALUES
(1, 1, 'image', 'Developer', 'asdasda', 'asdasda', '385,426', '1538931337.jpg', '2018-10-07 11:55:37', 1),
(2, 1, 'image', 'Developer', 'asdasda', 'asdasda', '385,426', '1538931402.jpg', '2018-10-07 11:56:42', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rtf_user_portfolio_files`
--

CREATE TABLE `rtf_user_portfolio_files` (
  `id` bigint(20) NOT NULL,
  `upload_file` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `portfolio_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rtf_user_portfolio_files`
--

INSERT INTO `rtf_user_portfolio_files` (`id`, `upload_file`, `portfolio_id`) VALUES
(1, '1538931402.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `rtf_user_profile`
--

CREATE TABLE `rtf_user_profile` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `display_name` varchar(200) DEFAULT NULL,
  `short_details` tinytext,
  `per_hour_rate` float DEFAULT NULL,
  `profile_summary` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rtf_user_profile`
--

INSERT INTO `rtf_user_profile` (`id`, `user_id`, `display_name`, `short_details`, `per_hour_rate`, `profile_summary`) VALUES
(1, 1, 'Waqas', 'Web Developer', 11, 'Some Description about'),
(2, 2, 'waqas123', '', 0, ''),
(3, 3, 'waqas1234', '', 0, ''),
(4, 4, 'Mehar', '', 0, ''),
(5, 5, 'waqas44', '', 0, ''),
(6, 6, 'zeeshanaf', '', 0, ''),
(7, 7, 'Zeshan Farooqi', '', 0, ''),
(8, 8, 'shane', '', 0, ''),
(9, 9, 'shane1', '', 0, ''),
(10, 10, 'asad', '', 0, ''),
(11, 11, 'witriber', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `rtf_user_skills`
--

CREATE TABLE `rtf_user_skills` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `skill_id` bigint(20) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rtf_user_skills`
--

INSERT INTO `rtf_user_skills` (`id`, `user_id`, `skill_id`, `created`) VALUES
(41, 1, 385, '2018-10-06 11:31:37'),
(42, 1, 31, '2018-10-06 11:31:37'),
(43, 1, 500, '2018-10-06 11:31:37'),
(44, 1, 426, '2018-10-06 11:31:37');

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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `first_name`, `last_name`, `address`, `city`, `state`, `postcode`, `country`, `country_flag`, `company`, `timezone`, `location`, `security_phone`, `security_phone_code`, `is_verified_phone`, `security_city`, `currency_id`, `connect_with_facebook`, `facebook_user_name`, `facebook_display_image_url`, `facebook_email`, `package_id`, `expiry_date`, `bids_per_month`, `remaining_bids`, `total_skills`, `language_id`, `account_type`, `list_me_in_freelance_directory`, `allow_freelancer_to_follow_me`, `preffered_freelancer_program_settings`, `tax_type`, `tax_rate`, `tax_id_or_company_no`, `is_active`, `image_name`, `profile_image_thumbnail`, `thumbnail_coordinates`, `login_status`, `last_login_on`, `freelancer_rating`, `employeer_rating`, `gender`, `connected_by`, `fb_user_id`, `update_email`, `is_package_auto_deposit`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'witriber', 'asadwitriber@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'work', 'No', 'No', 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$P9OFNIXqPHn5icoKLJ6CWu5cNfsNQg.Hhf1TEfAflSRB6Gt7XjyEu', 'DaJcfQZ2hoACWsrAQ242yEe1OoXcgCLXRMOO56bKIB6R2fwOQZlsBznRu5lb', '2018-10-05 09:01:35', '2018-10-05 09:01:35');

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
-- Indexes for table `rtf_certifications`
--
ALTER TABLE `rtf_certifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rtf_countries`
--
ALTER TABLE `rtf_countries`
  ADD PRIMARY KEY (`code`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `continent_code` (`continent_code`);

--
-- Indexes for table `rtf_educations`
--
ALTER TABLE `rtf_educations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rtf_experiences`
--
ALTER TABLE `rtf_experiences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rtf_jobs`
--
ALTER TABLE `rtf_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rtf_job_skills`
--
ALTER TABLE `rtf_job_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rtf_membership_plans`
--
ALTER TABLE `rtf_membership_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rtf_publications`
--
ALTER TABLE `rtf_publications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rtf_skills`
--
ALTER TABLE `rtf_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rtf_user_portfolios`
--
ALTER TABLE `rtf_user_portfolios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rtf_user_portfolio_files`
--
ALTER TABLE `rtf_user_portfolio_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rtf_user_profile`
--
ALTER TABLE `rtf_user_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rtf_user_skills`
--
ALTER TABLE `rtf_user_skills`
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
-- AUTO_INCREMENT for table `rtf_certifications`
--
ALTER TABLE `rtf_certifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rtf_countries`
--
ALTER TABLE `rtf_countries`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `rtf_educations`
--
ALTER TABLE `rtf_educations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rtf_experiences`
--
ALTER TABLE `rtf_experiences`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rtf_jobs`
--
ALTER TABLE `rtf_jobs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `rtf_job_skills`
--
ALTER TABLE `rtf_job_skills`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=484;

--
-- AUTO_INCREMENT for table `rtf_membership_plans`
--
ALTER TABLE `rtf_membership_plans`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `rtf_publications`
--
ALTER TABLE `rtf_publications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rtf_skills`
--
ALTER TABLE `rtf_skills`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=954;

--
-- AUTO_INCREMENT for table `rtf_user_portfolios`
--
ALTER TABLE `rtf_user_portfolios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rtf_user_portfolio_files`
--
ALTER TABLE `rtf_user_portfolio_files`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rtf_user_profile`
--
ALTER TABLE `rtf_user_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rtf_user_skills`
--
ALTER TABLE `rtf_user_skills`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
