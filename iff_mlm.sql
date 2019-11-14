-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 14, 2019 at 12:18 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iff_mlm`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountant`
--

CREATE TABLE `accountant` (
  `id` int(11) NOT NULL,
  `userident` int(100) NOT NULL,
  `Names` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `NationalID` int(200) NOT NULL,
  `mobile` int(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `user_status` varchar(200) NOT NULL,
  `picture` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `userident` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `Names` varchar(100) NOT NULL,
  `picture` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `userident`, `password`, `Names`, `picture`) VALUES
(1, '7777', 'admin', 'Emma KALISA', 'images.png'),
(2, '1002', '123', 'Jeannette', 'images.png');

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `id` int(11) NOT NULL,
  `userident` int(11) DEFAULT NULL,
  `day_bal` int(11) DEFAULT '0',
  `current_bal` int(11) DEFAULT '0',
  `total_bal` int(11) DEFAULT '0',
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `income`
--

INSERT INTO `income` (`id`, `userident`, `day_bal`, `current_bal`, `total_bal`, `date`) VALUES
(1, 1001, 0, 0, 0, '2019-11-13'),
(10, 153306, 0, 0, 0, '2019-11-14'),
(11, 707399, 0, 0, 0, '2019-11-14'),
(12, 794165, 0, 0, 0, '2019-11-14'),
(13, 122976, 0, 0, 0, '2019-11-14'),
(14, 616054, 0, 0, 0, '2019-11-14'),
(15, 387108, 0, 0, 0, '2019-11-14'),
(16, 706689, 0, 0, 0, '2019-11-14'),
(17, 117521, 0, 0, 0, '2019-11-14');

-- --------------------------------------------------------

--
-- Table structure for table `income_received`
--

CREATE TABLE `income_received` (
  `id` int(11) NOT NULL,
  `userident` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pin_list`
--

CREATE TABLE `pin_list` (
  `id` int(11) NOT NULL,
  `userident` int(11) DEFAULT NULL,
  `pin` int(11) NOT NULL,
  `status` enum('open','close') NOT NULL DEFAULT 'open'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pin_list`
--

INSERT INTO `pin_list` (`id`, `userident`, `pin`, `status`) VALUES
(1, 1001, 153306, 'close'),
(2, 1001, 707399, 'close'),
(3, 1001, 794165, 'close'),
(4, 1001, 122976, 'close'),
(5, 1001, 616054, 'close'),
(6, 1001, 387108, 'close'),
(7, 1001, 706689, 'close'),
(8, 1001, 117521, 'close');

-- --------------------------------------------------------

--
-- Table structure for table `pin_request`
--

CREATE TABLE `pin_request` (
  `id` int(11) NOT NULL,
  `userident` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` enum('open','close') NOT NULL DEFAULT 'open'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pin_request`
--

INSERT INTO `pin_request` (`id`, `userident`, `amount`, `date`, `status`) VALUES
(1, 1001, 74000, '2019-11-13', 'close'),
(2, 1001, 74000, '2019-11-13', 'close'),
(3, 1001, 74000, '2019-11-13', 'close'),
(4, 1001, 74000, '2019-11-14', 'close');

-- --------------------------------------------------------

--
-- Table structure for table `tree`
--

CREATE TABLE `tree` (
  `id` int(11) NOT NULL,
  `userident` int(11) DEFAULT NULL,
  `Names` varchar(50) NOT NULL,
  `left` varchar(50) DEFAULT '',
  `right` varchar(50) DEFAULT '',
  `leftcount` int(11) DEFAULT '0',
  `rightcount` int(11) DEFAULT '0',
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tree`
--

INSERT INTO `tree` (`id`, `userident`, `Names`, `left`, `right`, `leftcount`, `rightcount`, `date`) VALUES
(1, 1001, 'Emma KALISA', '153306', '707399', 5, 3, '2019-11-13'),
(11, 153306, 'Evode', '616054', '387108', 3, 1, '2019-11-14'),
(12, 707399, 'Muhire', '794165', '122976', 1, 1, '2019-11-14'),
(13, 794165, 'Charles', '', '', 0, 0, '2019-11-14'),
(14, 122976, 'Kalimba', '', '', 0, 0, '2019-11-14'),
(15, 616054, 'Mutoni', '706689', '117521', 1, 1, '2019-11-14'),
(16, 387108, 'Jeannette', '', '', 0, 0, '2019-11-14'),
(17, 706689, 'Jean', '', '', 0, 0, '2019-11-14'),
(18, 117521, 'Mugisha', '', '', 0, 0, '2019-11-14');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `userident` int(11) NOT NULL,
  `Names` varchar(50) NOT NULL,
  `NationalID` bigint(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `address` text NOT NULL,
  `under_userpin` varchar(50) DEFAULT '',
  `side` enum('left','right') NOT NULL,
  `date` date NOT NULL,
  `user_status` varchar(100) NOT NULL,
  `picture` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `userident`, `Names`, `NationalID`, `password`, `mobile`, `address`, `under_userpin`, `side`, `date`, `user_status`, `picture`) VALUES
(1, 1001, 'Emma KALISA', 1991878878878, '123', '0785991820', 'Kigali/gasabo', '', '', '2019-11-13', 'Active', 'images.png'),
(11, 153306, 'Evode', 57483920384, '123', '45678908', 'Gasabo', '1001', 'left', '2019-11-14', 'Active', 'images.png'),
(12, 707399, 'Muhire', 98765678998, '123', '07857674747', 'Kicukiro', '1001', 'right', '2019-11-14', 'Active', 'images.png'),
(13, 794165, 'Charles', 57834298347, '123', '078858585', 'Nyarugenge', '707399', 'left', '2019-11-14', 'Active', 'images.png'),
(14, 122976, 'Kalimba', 7584978976789, '123', '078989898', 'Kigali', '707399', 'right', '2019-11-14', 'Active', 'images.png'),
(15, 616054, 'Mutoni', 123456765432, '123', '07856789876', 'Kigali', '153306', 'left', '2019-11-14', 'Active', 'images.png'),
(16, 387108, 'Jeannette', 3456787654567, '123', '0789889785', 'Gasabo', '153306', 'right', '2019-11-14', 'Active', 'images.png'),
(17, 706689, 'Jean', 8765467876, '123', '0786867678', 'Kigali', '616054', 'left', '2019-11-14', 'Active', 'images.png'),
(18, 117521, 'Mugisha', 345678654567, '345678976', '078678687', 'Kiagali', '616054', 'right', '2019-11-14', 'Active', 'images.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountant`
--
ALTER TABLE `accountant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_received`
--
ALTER TABLE `income_received`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pin_list`
--
ALTER TABLE `pin_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pin_request`
--
ALTER TABLE `pin_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tree`
--
ALTER TABLE `tree`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountant`
--
ALTER TABLE `accountant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `income_received`
--
ALTER TABLE `income_received`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pin_list`
--
ALTER TABLE `pin_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pin_request`
--
ALTER TABLE `pin_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tree`
--
ALTER TABLE `tree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
