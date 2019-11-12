-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2019 at 07:50 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

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
  `day_bal` int(11) DEFAULT 0,
  `current_bal` int(11) DEFAULT 0,
  `total_bal` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `income`
--

INSERT INTO `income` (`id`, `userident`, `day_bal`, `current_bal`, `total_bal`) VALUES
(1, 1001, 30000, 30000, 30000),
(20, 369351, 10000, 10000, 10000),
(21, 771584, 20000, 20000, 20000),
(22, 528095, 0, 0, 0),
(23, 711534, 0, 0, 0),
(24, 850842, 0, 0, 0),
(25, 126192, 0, 0, 0);

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
(19, 1001, 369351, 'close'),
(20, 1001, 771584, 'close'),
(21, 1001, 528095, 'close'),
(22, 1001, 711534, 'close'),
(23, 1001, 850842, 'close'),
(24, 1001, 126192, 'close');

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
(9, 1001, 74000, '2019-11-10', 'close'),
(10, 1001, 74000, '2019-11-11', 'close'),
(11, 1001, 74000, '2019-11-11', 'close');

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
  `leftcount` int(11) DEFAULT 0,
  `rightcount` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tree`
--

INSERT INTO `tree` (`id`, `userident`, `Names`, `left`, `right`, `leftcount`, `rightcount`) VALUES
(1, 1001, 'Jean De Dieu Kwizera', '369351', '771584', 0, 0),
(17, 369351, 'Emmanuel KALISA', '528095', '711534', 0, 0),
(18, 771584, 'Charles KALIMBA', '850842', '126192', 0, 0),
(19, 528095, 'kalisa', '', '', 0, 0),
(20, 711534, 'Evode MUHIRE', '', '', 0, 0),
(21, 850842, 'hghddfjh', '', '', 0, 0),
(22, 126192, 'kjhgf', '', '', 0, 0);

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
  `user_status` varchar(100) NOT NULL,
  `picture` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `userident`, `Names`, `NationalID`, `password`, `mobile`, `address`, `under_userpin`, `side`, `user_status`, `picture`) VALUES
(1, 1001, 'Jean De Dieu Kwizera', 2147483647677557, '123', '0785991819', 'Kigali', '', 'left', 'Active', 'images.png'),
(32, 369351, 'Emmanuel KALISA', 456765, '123', '6782837673', 'Gisenyi, kabari', '1001', 'left', 'Active', 'images.png'),
(33, 771584, 'Charles KALIMBA', 7656789, '123', '0785991820', 'Kacyiru', '1001', 'right', 'Active', 'images.png'),
(34, 528095, 'kalisa', 76578987, '123', '1324344', 'Kacyiru', '369351', 'left', 'Active', 'images.png'),
(35, 711534, 'Evode MUHIRE', 9876578, '123', '45678878', 'Gisenyi, kabari', '369351', 'right', 'Active', 'images.png'),
(36, 850842, 'hghddfjh', 987656789, '123', '8765789', 'Gisenyi, kabari', '771584', 'left', 'Active', 'images.png'),
(37, 126192, 'kjhgf', 89765, '123', '0998765', 'Kacyiru', '771584', 'right', 'Active', 'images.png');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `income_received`
--
ALTER TABLE `income_received`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pin_list`
--
ALTER TABLE `pin_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `pin_request`
--
ALTER TABLE `pin_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tree`
--
ALTER TABLE `tree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
