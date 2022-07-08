-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2022 at 05:53 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountdata`
--

CREATE TABLE `accountdata` (
  `acc_no` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `balance` double DEFAULT 0,
  `pin` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accountdata`
--

INSERT INTO `accountdata` (`acc_no`, `username`, `balance`, `pin`) VALUES
(1, 'Ankush@123', 2548, 2504),
(2, 'Shreya@123', 810, 2104);

-- --------------------------------------------------------

--
-- Table structure for table `customerdetails`
--

CREATE TABLE `customerdetails` (
  `acc_no` bigint(20) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dob` varchar(100) NOT NULL,
  `number` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zipcode` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customerdetails`
--

INSERT INTO `customerdetails` (`acc_no`, `fname`, `lname`, `email`, `dob`, `number`, `address`, `city`, `state`, `zipcode`) VALUES
(1, 'Ankush', 'Sable', 'sableankush25@gmail.com', '25-04-1997', '+919561659945', 'Kranti Colony, Saturna Road, Amaravati', 'Amaravati', 'Maharashtra', '444607'),
(2, 'Shreya', 'Mankar', 'mankarshreya21@gmail.com', '21-04-1992', '+919361649545', 'Kranti Colony, Saturna Road, Amaravati', 'Amaravati', 'Maharashtra', '444607');

-- --------------------------------------------------------

--
-- Table structure for table `customersecurity`
--

CREATE TABLE `customersecurity` (
  `acc_no` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `otp` varchar(100) NOT NULL DEFAULT 'delete',
  `profilephoto` varchar(200) DEFAULT 'noimage'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customersecurity`
--

INSERT INTO `customersecurity` (`acc_no`, `username`, `password`, `otp`, `profilephoto`) VALUES
(1, 'Ankush@123', 'Sablenitin25@', 'SBI-318389132', 'strawberry.jpeg'),
(2, 'Shreya@123', 'Mankarshreya21@', 'SBI-1782142021', 'noimage');

-- --------------------------------------------------------

--
-- Table structure for table `statement`
--

CREATE TABLE `statement` (
  `acc_no` bigint(20) DEFAULT NULL,
  `sender_acc_no` bigint(20) DEFAULT NULL,
  `receiver_acc_no` bigint(20) DEFAULT NULL,
  `sender_username` varchar(100) DEFAULT NULL,
  `receiver_username` varchar(100) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  `transaction` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `statement`
--

INSERT INTO `statement` (`acc_no`, `sender_acc_no`, `receiver_acc_no`, `sender_username`, `receiver_username`, `amount`, `date_time`, `transaction`) VALUES
(1, 1, NULL, 'Ankush@123', NULL, 21, '2022/06/25 00:13:43', 'credited'),
(1, 1, 2, 'Ankush@123', 'Shreya@123', 30, '2022/06/25 00:14:22', 'debited'),
(2, 1, 2, 'Ankush@123', 'Shreya@123', 30, '2022/06/25 00:14:22', 'credited'),
(1, 1, NULL, 'Ankush@123', NULL, 10, '2022/06/25 00:52:45', 'credited'),
(1, 1, 2, 'Ankush@123', 'Shreya@123', 300, '2022/06/25 00:53:05', 'debited'),
(2, 1, 2, 'Ankush@123', 'Shreya@123', 300, '2022/06/25 00:53:05', 'credited'),
(1, 1, NULL, 'Ankush@123', NULL, 200, '2022/06/25 00:53:16', 'credited'),
(1, 1, NULL, 'Ankush@123', NULL, 13, '2022/06/25 00:53:25', 'credited'),
(1, 1, 2, 'Ankush@123', 'Shreya@123', 56, '2022/06/25 00:53:51', 'debited'),
(2, 1, 2, 'Ankush@123', 'Shreya@123', 56, '2022/06/25 00:53:51', 'credited'),
(1, 1, NULL, 'Ankush@123', NULL, 1000, '2022/06/25 00:54:01', 'credited'),
(1, 1, NULL, 'Ankush@123', NULL, 12, '2022/06/25 00:54:21', 'credited'),
(1, 1, NULL, 'Ankush@123', NULL, 59, '2022/06/25 00:55:06', 'credited'),
(1, 1, NULL, 'Ankush@123', NULL, 1, '2022/06/25 01:00:06', 'credited'),
(1, 1, NULL, 'Ankush@123', NULL, 1, '2022/06/25 01:00:11', 'credited'),
(1, 1, NULL, 'Ankush@123', NULL, 1, '2022/06/25 01:00:29', 'credited'),
(1, 1, NULL, 'Ankush@123', NULL, 1, '2022/06/25 01:00:34', 'credited'),
(1, 1, NULL, 'Ankush@123', NULL, 1, '2022/06/25 01:00:43', 'credited'),
(1, 1, NULL, 'Ankush@123', NULL, 1, '2022/06/25 01:00:52', 'credited'),
(2, 2, 1, 'Shreya@123', 'Ankush@123', 34, '2022/06/25 01:04:09', 'debited'),
(1, 2, 1, 'Shreya@123', 'Ankush@123', 34, '2022/06/25 01:04:09', 'credited'),
(1, 1, NULL, 'Ankush@123', NULL, 100, '2022/06/25 12:59:56', 'credited'),
(1, 1, 2, 'Ankush@123', 'Shreya@123', 50, '2022/06/25 13:00:51', 'debited'),
(2, 1, 2, 'Ankush@123', 'Shreya@123', 50, '2022/06/25 13:00:51', 'credited'),
(1, 1, NULL, 'Ankush@123', NULL, 200, '2022/06/30 08:13:09', 'credited'),
(1, 1, 2, 'Ankush@123', 'Shreya@123', 20, '2022/06/30 08:22:10', 'debited'),
(2, 1, 2, 'Ankush@123', 'Shreya@123', 20, '2022/06/30 08:22:10', 'credited'),
(1, 1, NULL, 'Ankush@123', NULL, 30, '2022/07/01 19:39:33', 'credited');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountdata`
--
ALTER TABLE `accountdata`
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `customerdetails`
--
ALTER TABLE `customerdetails`
  ADD PRIMARY KEY (`acc_no`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `number` (`number`);

--
-- Indexes for table `customersecurity`
--
ALTER TABLE `customersecurity`
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `acc_nover` (`acc_no`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customersecurity`
--
ALTER TABLE `customersecurity`
  ADD CONSTRAINT `acc_nover` FOREIGN KEY (`acc_no`) REFERENCES `customerdetails` (`acc_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
