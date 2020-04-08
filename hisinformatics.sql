-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2020 at 08:40 AM
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
-- Database: `hisinformatics`
--

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
(2, 'raymond', 'raymond@gmail.com', 'default.jpg', '$2y$10$WNrTKAOWSYy4BaB7t.km3.WClsO5FFMZ6TFaHqt8T8DDteeEBzyge', 2, 1, 1583908692),
(3, 'Hendra', 'hendra@gmail.com', 'default.jpg', '$2y$10$JccIBBXtCDuCpQEj24FTvOcWgtHe3wcGplVyzCKvGpzo6y4tuKSzi', 1, 1, 1583910893),
(4, 'testuser', 'test@gmail.com', 'default.jpg', '$2y$10$/jxlZ.cbcZC3sAgV1jgxVeLjGG6d/mET3PVmVMCJhaG9kbzYpRT9O', 1, 1, 1584411172),
(5, 'Denny Raymond', 'rayden@gmail.com', 'default.jpg', '$2y$10$wHrZvdbo.75oLNL5oefFAeZbMT3EY.71aSjpD3b6ux7b.JIq8BQFG', 1, 1, 1585471858),
(10, 'Test User 1', 'test1@gmail.com', 'default.jpg', '$2y$10$v3lpYaXBMhVrqpoUiVkymOrh5Ill3ZP0SkbbPm.RNJoFmvQWOO.pi', 2, 1, 1585709895),
(11, 'Test User 2', 'test2@gmail.com', 'default.jpg', '$2y$10$AxIFpralfdwhQDmqbe7ZNepzoaLHM.TMHg126fSOmdtaF7sghv8oe', 3, 1, 1585709923),
(12, 'Noach T', 'noach@gmail.com', '2986071.jpg', '$2y$10$ce.bZruCm2PBAD5utcIkuOm1j0oxX8nH3dQJ65kuyYwl6gFVDWN4e', 3, 1, 1585710770),
(13, 'Denny Raymond', 'denny@gmail.com', 'default.jpg', '$2y$10$bI7Tjz/rTZLKCgd8kHgfqe9HQrGs7S60L7/oQnHWgEMLadpHkYtBO', 1, 1, 1585722596);

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
(13, 3, 11);

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
(17, 2, 'Change Password', 'user/changepassword', 'fas fa-fw fa-key', 1);

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
