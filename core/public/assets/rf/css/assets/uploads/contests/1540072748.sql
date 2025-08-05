-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2018 at 07:24 PM
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
-- Database: `ci_freelancer`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bids`
--

CREATE TABLE `tbl_bids` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `amount_paid_to` float NOT NULL,
  `is_sponsor_bid_value` float DEFAULT NULL,
  `delivery_in_days` int(11) NOT NULL,
  `bid_rank` tinyint(1) NOT NULL DEFAULT '0',
  `is_sponsor_bid` tinyint(4) NOT NULL DEFAULT '0',
  `proposal_details` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  `is_awared` tinyint(1) NOT NULL DEFAULT '0',
  `hour_limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_bids`
--

INSERT INTO `tbl_bids` (`id`, `user_id`, `project_id`, `amount_paid_to`, `is_sponsor_bid_value`, `delivery_in_days`, `bid_rank`, `is_sponsor_bid`, `proposal_details`, `created`, `is_active`, `is_awared`, `hour_limit`) VALUES
(1, 2, 4, 10, NULL, 4, 0, 0, 'I have read the instructions', '2016-03-16 10:46:32', 1, 0, 0),
(2, 1, 3, 2, NULL, 0, 0, 0, 'gggg', '2016-03-16 12:29:34', 1, 0, 5),
(3, 6, 3, 200.988, NULL, 0, 0, 0, 'I will complete this project by this week. The milestone will be provided to you within 24 to 36 hrs. I will complete this project by this week. The milestone will be provided to you within 24 to 36 hrs. I will complete this project by this week. The milestone will be provided to you within 24 to 36 hrs. ', '2016-03-21 06:49:34', 1, 0, 12),
(4, 6, 4, 200, 5, 10, 1, 1, 'Our registered freelancer can decide the payment schedule during getting bids on projects. The freelancer will be able to define the payment milestone that how much payment to be received by the employer at the start of the project, e.g. 10% ,20%,30% ,40%,50% etc or after finalizing the entire project. For example if an employer wants to develop a complete website in $10000 from design to development phase then a freelancer can divide the project in three phases. 1: Design $250.00 2: HTML/CSS $250.00 3: Development $250.00 4: QA $250.00 etc.', '2016-03-21 07:09:47', 1, 0, 0),
(5, 6, 6, 600, NULL, 30, 0, 0, 'Provide Your Proposal Provide Your Proposal Provide Your Proposal Provide Your Proposal \nProvide Your Proposal Provide Your Proposal Provide Your Proposal Provide Your Proposal \nProvide Your Proposal Provide Your Proposal Provide Your Proposal Provide Your Proposal \n\n\n\nProvide Your Proposal Provide Your Proposal \nProvide Your Proposal Provide Your Proposal \nProvide Your Proposal Provide Your Proposal \nProvide Your Proposal Provide Your Proposal \nProvide Your Proposal Provide Your Proposal \nProvide Your Proposal Provide Your Proposal Provide Your Proposal Provide Your Proposal \nProvide Your Proposal Provide Your Proposal Provide Your Proposal Provide Your Proposal \nProvide Your Proposal Provide Your Proposal Provide Your Proposal Provide Your Proposal \n\n\n\nProvide Your Proposal Provide Your Proposal \nProvide Your Proposal Provide Your Proposal \nProvide Your Proposal Provide Your Proposal \nProvide Your Proposal Provide Your Proposal \nProvide Your Proposal Provide Your Proposal \nProvide Yo', '2016-03-22 05:07:26', 1, 1, 0),
(6, 9, 6, 250, NULL, 35, 0, 0, 'Our registered freelancer can decide the payment schedule during getting bids on projects. The freelancer will be able to define the payment milestone that how much payment to be received by the employer at the start of the project, e.g. 10% ,20%,30% ,40%,50% etc or after finalizing the entire project. For example if an employer wants to develop a complete website in $10000 from design to development phase then a freelancer can divide the project in three phases. 1: Design $250.00 2: HTML/CSS $250.00 3: Development $250.00 4: QA $250.00 etc.', '2016-03-22 06:09:05', 1, 0, 0),
(7, 1, 8, 100, NULL, 14, 0, 0, 'I have read the instructions', '2016-03-29 07:23:13', 1, 1, 0),
(8, 1, 9, 100, NULL, 12, 0, 0, 'I have read the instructions', '2016-03-29 07:29:42', 1, 1, 0),
(9, 2, 7, 100, NULL, 12, 0, 0, 'I have read the instructions', '2016-03-30 09:58:19', 1, 1, 0),
(10, 1, 10, 50000, NULL, 30, 0, 0, '', '2016-05-20 10:54:58', 0, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_bids`
--
ALTER TABLE `tbl_bids`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_bids`
--
ALTER TABLE `tbl_bids`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
