-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2024 at 09:45 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `course`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `name`, `username`, `password`) VALUES
(6, 'testadmin', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(7, 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `active` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `name`, `active`) VALUES
(1, 'Web Development', 'Yes'),
(3, 'Game Development', 'Yes'),
(4, 'Data Science', 'Yes'),
(5, 'Game Development', 'Yes'),
(6, 'Programming Language', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

CREATE TABLE `tbl_contact` (
  `id` int(11) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `message` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_contact`
--

INSERT INTO `tbl_contact` (`id`, `fullname`, `email`, `phone`, `message`) VALUES
(17, 'Piyush Gwayamaru', 'shresthapiyush6@gmail.com', '9800000000', 'I need a php coursess freely.'),
(18, 'Piyush Gwayamaru', 'shresthapiyush6@gmail.com', '9800000000', 'I need a php coursess freely.');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_course`
--

CREATE TABLE `tbl_course` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `instructor` varchar(200) NOT NULL,
  `email` varchar(250) NOT NULL,
  `language` varchar(255) NOT NULL,
  `description` varchar(500) NOT NULL,
  `preview_video` varchar(250) NOT NULL,
  `active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_course`
--

INSERT INTO `tbl_course` (`id`, `category_id`, `image`, `title`, `instructor`, `email`, `language`, `description`, `preview_video`, `active`) VALUES
(27, 1, 'Course-Name-3267.png', 'MERN stack', 'piyush', 'shresthpiyusha@gmail.com', 'English', 'Mongo express react nodejs', 'video-65a8d9ec022020.96177490.mp4', 'Yes'),
(34, 3, 'Course-Name-9394.jpg', 'Unreal Engine', 'piyush', 'shresthpiyusha@gmail.com', 'English', 'Embark on a transformative journey into game development with our Unreal Engine Mastery course.', 'video-65a96d9587ba07.72098730.mp4', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_educator`
--

CREATE TABLE `tbl_educator` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `code` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_educator`
--

INSERT INTO `tbl_educator` (`id`, `name`, `email`, `password`, `code`) VALUES
(2, 'piyush', 'shresthpiyusha@gmail.com', '86f500cd7b7d38e5d4ae6cde3920f589', ''),
(5, 'Test', 'test@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '709fe72aa2f8d70abb459752f91abc80'),
(6, 'educator', 'educator@gmail.com', 'ae3a8f55b3ddd9466c9866bc2261e22e', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_enroll`
--

CREATE TABLE `tbl_enroll` (
  `id` int(11) NOT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `course` varchar(200) NOT NULL,
  `course_id` int(11) NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_enroll`
--

INSERT INTO `tbl_enroll` (`id`, `first_name`, `last_name`, `address`, `phone`, `gender`, `email`, `course`, `course_id`, `status`) VALUES
(15, 'Piyush', 'Shrestha', 'bkt', '9800000000', 'Male', 'piyush@gmail.com', '1', 1, 'Accepted'),
(16, 'Piyush', 'Shrestha', 'bkt', '9800000000', 'Male', 'shresthapiyush6@gmail.com', '2', 2, 'Accepted');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_instructor_enroll`
--

CREATE TABLE `tbl_instructor_enroll` (
  `id` int(11) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `course` varchar(200) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `cv` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lesson`
--

CREATE TABLE `tbl_lesson` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `lesson_name` varchar(200) NOT NULL,
  `video` varchar(255) NOT NULL,
  `active` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_lesson`
--

INSERT INTO `tbl_lesson` (`id`, `course_id`, `lesson_name`, `video`, `active`) VALUES
(18, 27, 'Day 1 of mern stack', 'video-65a8e3f8bf51e1.80368191.mp4', 'Yes'),
(19, 27, 'Day 2 of mern stack', 'video-65a8fd41752396.76983123.mp4', 'Yes'),
(20, 27, 'Day 3 of Mern', 'video-65a930a44694d2.68872295.mp4', 'Yes'),
(21, 27, 'Day 4 of mern', 'video-65a930febb83c4.51761625.mp4', 'Yes'),
(22, 27, 'Day 5 of mern', 'video-65a9313c32c2d0.55857677.mp4', 'Yes'),
(23, 27, 'Day 6 of mern', 'video-65a931ebe57a53.46131574.mp4', 'Yes'),
(25, 34, 'Unreal Engine 5.3 Beginner Tutorial', 'video-65a96fc60d14e5.94303492.mp4', 'Yes'),
(26, 34, 'Unreal Engine Full Architecture', 'video-65a9e46351d1d4.84271022.mp4', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `name`, `email`, `password`) VALUES
(14, 'John ', 'Doe', '72f4e9f3f57a5d7a8d80fa0abcee0bfc'),
(15, 'doe john', 'doejohn@gmai.com', '5f4dcc3b5aa765d61d8327deb882cf99'),
(16, 'kp oli', 'kpoli@gmail.com', '0e29eb89bbac6334777ef15e9e7e3d08'),
(17, 'piyush shrestha', 'shresthapiyush999@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4'),
(23, 'deepesh', 'deepesh@gmail.com', 'aa6d49d134cbee8e0e7b0b9c5e00e53c'),
(24, 'rashik', 'rashik@gmail.com', '208de955049ca712e6d9fd56aba3989f'),
(25, 'nabraj', 'nabraj@gmail.com', '95e2d32fd6452835b8b7a010757af6cb'),
(26, 'educator', 'educator@gmail.com', 'ae3a8f55b3ddd9466c9866bc2261e22e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_course`
--
ALTER TABLE `tbl_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `tbl_educator`
--
ALTER TABLE `tbl_educator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_enroll`
--
ALTER TABLE `tbl_enroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_instructor_enroll`
--
ALTER TABLE `tbl_instructor_enroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_lesson`
--
ALTER TABLE `tbl_lesson`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_course`
--
ALTER TABLE `tbl_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_educator`
--
ALTER TABLE `tbl_educator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_enroll`
--
ALTER TABLE `tbl_enroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_instructor_enroll`
--
ALTER TABLE `tbl_instructor_enroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_lesson`
--
ALTER TABLE `tbl_lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_course`
--
ALTER TABLE `tbl_course`
  ADD CONSTRAINT `tbl_course_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
