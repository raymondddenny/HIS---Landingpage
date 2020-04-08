-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2020 at 11:59 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hisinformatics-master`
--

-- --------------------------------------------------------

--
-- Table structure for table `completed_requests`
--

CREATE TABLE `completed_requests` (
  `id` int(11) NOT NULL,
  `item_name` varchar(128) NOT NULL,
  `notes` varchar(128) NOT NULL,
  `completed_on` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(128) NOT NULL,
  `symptoms` varchar(128) NOT NULL,
  `blood_type` varchar(128) NOT NULL,
  `blood_pressure` varchar(128) NOT NULL,
  `height` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `blood_glucose` varchar(128) NOT NULL,
  `allergies` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `completed_requests`
--

INSERT INTO `completed_requests` (`id`, `item_name`, `notes`, `completed_on`, `user_id`, `user_email`, `symptoms`, `blood_type`, `blood_pressure`, `height`, `weight`, `blood_glucose`, `allergies`) VALUES
(35, 'Hayasaka', 'collected', '1586294169', 14, 'admin@gmail.com', 'abc', 'B', 'abc', 55, 55, 'abc', 'abc');

-- --------------------------------------------------------

--
-- Table structure for table `completed_requests_radiology`
--

CREATE TABLE `completed_requests_radiology` (
  `id` int(11) NOT NULL,
  `item_name` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `notes` varchar(128) NOT NULL,
  `completed_on` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `item_name` varchar(128) NOT NULL,
  `notes` varchar(128) NOT NULL,
  `last_modified` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `item_name`, `notes`, `last_modified`, `user_id`, `user_email`) VALUES
(68, 'Chika Fujiwara', 'wiener', '1586295100', 14, 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `request_radiology`
--

CREATE TABLE `request_radiology` (
  `id` int(11) NOT NULL,
  `item_name` varchar(128) NOT NULL,
  `notes` varchar(128) NOT NULL,
  `last_modified` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request_radiology`
--

INSERT INTO `request_radiology` (`id`, `item_name`, `notes`, `last_modified`, `user_id`, `user_email`) VALUES
(3, 'Ferinzhy Halik', 'test', '1586295651', 14, 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(14, 'Admin Account', 'admin@gmail.com', 'default.jpg', '$2y$10$SnnJ3sYll28FnL8uI89Wc.7V/dhdsxbphitiQEAKcpzALW4cLhuju', 1, 1, 1585726316),
(15, 'Farrell', 'farrell@gmail.com', 'default.jpg', '$2y$10$Bpce2I/WzmYSv8mBfBeLYedSK7RYGbv9WSWwAFkDaIK9nR7Y8Win.', 5, 1, 1585736593);

-- --------------------------------------------------------

--
-- Table structure for table `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 2, 3),
(5, 1, 4),
(6, 3, 3),
(7, 1, 3),
(12, 3, 2),
(13, 3, 11),
(14, 1, 11),
(15, 1, 5),
(16, 5, 5),
(17, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Patient'),
(4, 'Menu'),
(5, 'Lab'),
(11, 'Medication');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Super Admin'),
(2, 'Admin Inpatient'),
(3, 'Doctor'),
(4, 'Pharmacy'),
(5, 'Lab'),
(9, 'Role test ');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'My Profile', 'user', 'fas fa-fw fa-user-md', 1),
(4, 2, 'Edit Profile', 'user/editprofile', 'fas fa-fw fa-user-edit', 1),
(5, 4, 'Menu Management', 'menu', 'fas fa-fw fa-folder', 1),
(7, 3, 'View Patient List', 'patient', 'fas fa-fw fa-procedures', 1),
(8, 4, 'Submenu management', 'menu/submenu', 'fas fa-fw fa-folder-open', 1),
(13, 1, 'Role', 'admin/role', 'fas fa-user-tie', 1),
(14, 11, 'View completed request', 'medication/requestcompleted', 'fab fa-fw fa-youtube', 1),
(15, 11, 'Request new prescription', 'medication/requestprescription', 'fas fa-fw fa-clipboard-list', 1),
(16, 11, 'View request', 'medication/request', 'fas fa-fw fa-key', 1),
(17, 2, 'Change Password', 'user/changepassword', 'fas fa-fw fa-key', 1),
(18, 5, 'Lab Request', 'lab/request', 'fas fa-cloud-upload-alt', 1),
(19, 5, 'Lab Requests - Radiology', 'lab/request_radiology', 'fas fa-cloud-upload-alt', 1),
(20, 5, 'Completed Requests', 'lab/completed_list', 'far fa-address-book', 1),
(21, 5, 'Completed Requests - Radiology', 'lab/completed_radiology', 'far fa-address-book', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `completed_requests`
--
ALTER TABLE `completed_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `completed_requests_radiology`
--
ALTER TABLE `completed_requests_radiology`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_radiology`
--
ALTER TABLE `request_radiology`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `completed_requests`
--
ALTER TABLE `completed_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `completed_requests_radiology`
--
ALTER TABLE `completed_requests_radiology`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `request_radiology`
--
ALTER TABLE `request_radiology`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
