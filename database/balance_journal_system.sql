-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2023 at 09:09 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `balance_journal_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_list`
--

CREATE TABLE `account_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_list`
--

INSERT INTO `account_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(53, 'Cash', 'Cash', 1, 0, '2023-06-07 21:04:16', NULL),
(54, 'Accounts Payable', 'Accounts Payable', 1, 0, '2023-06-07 21:06:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_list`
--

CREATE TABLE `group_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = Debit, 2= Credit',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=Inactive, 1= Active',
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = No, 1 = Yes ',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `group_list`
--

INSERT INTO `group_list` (`id`, `name`, `description`, `type`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(8, 'Assets', 'The cash, inventory, and other resources you owned .', 1, 1, 0, '2023-06-07 21:17:39', NULL),
(9, 'Revenue', 'Cash coming into your business through sales and other types of payments', 2, 1, 0, '2023-06-07 21:21:11', NULL),
(10, 'Expenses', 'The amount you\'re spending on services and other items .', 1, 1, 0, '2023-06-07 21:22:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `journal_entries`
--

CREATE TABLE `journal_entries` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `journal_date` date NOT NULL,
  `description` text NOT NULL,
  `user_id` int(30) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journal_items`
--

CREATE TABLE `journal_items` (
  `journal_id` int(30) NOT NULL,
  `account_id` int(30) NOT NULL,
  `group_id` int(30) NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Bact Accounting System'),
(6, 'short_name', 'BACT'),
(11, 'logo', 'uploads/logo.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover.png'),
(15, 'content', 'Array'),
(16, 'email', 'bacttraining@gmail.com'),
(17, 'contact', '0998199626 / 016224417'),
(18, 'from_time', '11:00'),
(19, 'to_time', '21:30'),
(20, 'address', 'XYZ Street, There City, Here, 2306');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(6, 'kawthar', NULL, 'makarem', 'kmakarem', '83669c5ef01ab310ac018669d2534d72', NULL, NULL, 2, 1, '2023-06-03 18:49:19', NULL),
(7, 'Admin', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-7.png?v=1686125819', NULL, 1, 1, '2023-06-07 11:16:59', '2023-06-07 11:16:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_list`
--
ALTER TABLE `account_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_list`
--
ALTER TABLE `group_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_entries`
--
ALTER TABLE `journal_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `journal_items`
--
ALTER TABLE `journal_items`
  ADD KEY `journal_id` (`journal_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_list`
--
ALTER TABLE `account_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `group_list`
--
ALTER TABLE `group_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `journal_entries`
--
ALTER TABLE `journal_entries`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `journal_entries`
--
ALTER TABLE `journal_entries`
  ADD CONSTRAINT `journal_entries_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `journal_items`
--
ALTER TABLE `journal_items`
  ADD CONSTRAINT `journal_items_ibfk_1` FOREIGN KEY (`journal_id`) REFERENCES `journal_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `journal_items_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `account_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `journal_items_ibfk_3` FOREIGN KEY (`group_id`) REFERENCES `group_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
