-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2023 at 08:06 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `id` int(5) NOT NULL,
  `admin_email` varchar(60) NOT NULL,
  `admin_name` text NOT NULL,
  `admin_pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`id`, `admin_email`, `admin_name`, `admin_pass`) VALUES
(1, 'admin@gmail.com', 'sagar', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(255) NOT NULL,
  `cat_name` text NOT NULL,
  `cat_des` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`, `cat_des`) VALUES
(1, 'Nature', 'Here you can get post about nature'),
(3, 'sports', 'sports'),
(4, 'slingshot', 'hunting');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(255) NOT NULL,
  `post_title` varchar(150) NOT NULL,
  `post_content` longtext NOT NULL,
  `post_img` varchar(255) NOT NULL,
  `post_ctg` int(255) NOT NULL,
  `post_author` varchar(60) NOT NULL,
  `post_date` datetime NOT NULL,
  `post_comment_count` int(255) NOT NULL,
  `post_summary` varchar(200) NOT NULL,
  `post_tag` varchar(255) NOT NULL,
  `post_status` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `post_title`, `post_content`, `post_img`, `post_ctg`, `post_author`, `post_date`, `post_comment_count`, `post_summary`, `post_tag`, `post_status`) VALUES
(1, 'first post', '111111111111111111111111', 'istockphoto-1322277517-612x612.jpg', 1, 'Admin', '2023-02-03 22:30:53', 3, 'this is a dpost summary', 'animal', 1),
(2, 'first post', 'rewrrrw', 'istockphoto-1322277517-612x612.jpg', 4, 'Admin', '2023-02-03 22:31:35', 3, 'rwrwer', 'wrrwr', 1),
(3, 'first post', 'rewrrrw', 'img_forest.jpg', 4, 'Admin', '2023-02-03 22:32:31', 3, 'rwrwer', 'wrrwr', 1),
(4, 'first post', 'ttttt', 'img_forest.jpg', 3, 'Admin', '2023-02-03 22:32:57', 3, 'tttt', '55rtrtr', 1),
(5, 'first post', 'fdssfsfsdfsfsfsdfsdfsdfsdffssf', 'img_forest.jpg', 4, 'Admin', '2023-02-03 22:35:37', 3, 'this is a dpost summary', 'animal', 1),
(6, 'last', 'last', 'istockphoto-1322277517-612x612.jpg', 1, 'Admin', '2023-02-03 23:09:29', 3, 'last', 'last', 1),
(7, 'rrrrrrrrrrr', 'rffddsf', 'istockphoto-1322277517-612x612.jpg', 3, 'Admin', '2023-02-03 23:34:13', 3, 'fdfdf', 'fdsdsf', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `post_with_ctg`
-- (See below for the actual view)
--
CREATE TABLE `post_with_ctg` (
`post_id` int(255)
,`post_title` varchar(150)
,`post_content` longtext
,`post_img` varchar(255)
,`post_author` varchar(60)
,`post_date` datetime
,`post_comment_count` int(255)
,`post_summary` varchar(200)
,`post_tag` varchar(255)
,`post_status` tinyint(3)
,`cat_id` int(255)
,`cat_name` text
);

-- --------------------------------------------------------

--
-- Structure for view `post_with_ctg`
--
DROP TABLE IF EXISTS `post_with_ctg`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `post_with_ctg`  AS SELECT `post`.`post_id` AS `post_id`, `post`.`post_title` AS `post_title`, `post`.`post_content` AS `post_content`, `post`.`post_img` AS `post_img`, `post`.`post_author` AS `post_author`, `post`.`post_date` AS `post_date`, `post`.`post_comment_count` AS `post_comment_count`, `post`.`post_summary` AS `post_summary`, `post`.`post_tag` AS `post_tag`, `post`.`post_status` AS `post_status`, `category`.`cat_id` AS `cat_id`, `category`.`cat_name` AS `cat_name` FROM (`post` join `category` on(`post`.`post_ctg` = `category`.`cat_id`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
