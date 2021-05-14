-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2021 at 08:17 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user`
--

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `userID` int(5) NOT NULL,
  `userCode` varchar(20) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `phone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`userID`, `userCode`, `userName`, `password`, `email`, `address`, `dob`, `phone`) VALUES
(3, '1200', 'Kumaf', '789', 'Ku@yahoo.com', '89,main,ratnapura', '1993-02-01', '081456231'),
(4, '1207', 'hubu', '789456', 'hubu@hotmail.com', '67,hubuland,vanilla', '1998-02-05', '011456789'),
(5, 'B125', 'Bout', '8523', 'by@gmil.com', 'gtrejkl', '2012-03-02', '8796541'),
(7, 'B125', 'Bout', '8523', 'by@gmil.com', 'gtre,jkl', '2012-03-02', '8796541'),
(10, 'b45', 'ahamed', '78956', 'yiut@gmil.com', 'colombo', '2012-03-02', '07776352'),
(11, 'hfdahfd', 'adhjafj', '8546', 'SHDAFHA', '		SDJAJDHAFV					', '2021-05-31', 'afkhs'),
(12, 'hfdahfd', 'adhjafj', '8546', 'SHDAFHA', '		SDJAJDHAFV					', '2021-05-31', 'afkhs'),
(13, 'aKSHBDA', 'jdhf', '852123', 'sdhbsfk', '				afashf			', '2012-03-21', '852123'),
(14, 'aKSHBDA', 'jdhf', '852123', 'sdhbsfk', '				afashf			', '2012-03-21', '852123'),
(24, '8562', 'George Bush', '856321', 'G@gmail.com', 'Washington Dc					', '2021-05-24', '874562'),
(25, 'hkl12', 'remo', '852123', 'sdhbsfk', 'kandy		', '2012-03-21', '852123');

-- --------------------------------------------------------

--
-- Table structure for table `developer`
--

CREATE TABLE `developer` (
  `developerID` int(10) NOT NULL,
  `developerCode` varchar(20) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `developer`
--

INSERT INTO `developer` (`developerID`, `developerCode`, `userName`, `password`, `email`, `address`, `dob`, `phone`) VALUES
(1, '562', 'fryer', '2563', 'hgft', 'fcfhvhbj', '2001-03-02', '8513250'),
(3, '5623', 'gfgf', '523', 'erdtfgh', 'sdfghjk', '0000-00-00', '852123'),
(4, 'IV1250', 'treck', '78956', 'yiut@gmil.com', 'gtreKandy', '2012-03-02', '07776352'),
(5, 'hfdahfd', 'adhjafj', '8546', 'SHDAFHA', '		SDJAJDHAFV					', '2021-05-31', 'afkhs'),
(6, 'hfdahfd', 'adhjafj', '8546', 'SHDAFHA', '		SDJAJDHAFV					', '2021-05-31', 'afkhs'),
(7, '8625', 'Kumar', '8562', 'dksda85', '	SHDBABDS						', '2013-03-05', '85212');

-- --------------------------------------------------------

--
-- Table structure for table `investor`
--

CREATE TABLE `investor` (
  `investorID` int(10) NOT NULL,
  `investorCode` varchar(20) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `phone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `investor`
--

INSERT INTO `investor` (`investorID`, `investorCode`, `userName`, `password`, `email`, `address`, `dob`, `phone`) VALUES
(1, 'hfdahfd', 'adhjafj', '8546', 'SHDAFHA', '		SDJAJDHAFV					', '2021-05-31', 'afkhs'),
(2, 'kjl256', 'Asram', '8546', 'Asram@gmail.com', 'Matale				', '1982-05-11', '0776989262'),
(3, 'kjl256', 'Asram', '8546', 'Asram@gmail.com', 'Matale				', '1982-05-11', '0776989262'),
(4, 'kjl256', 'Asram', '8546', 'Asram@gmail.com', 'Matale				', '1982-05-11', '0776989262'),
(5, 'kjl256', 'Asram', '8546', 'Asram@gmail.com', 'Matale				', '1982-05-11', '0776989262'),
(6, 'kjl256', 'George', '526', 'nmh', 'Matale				', '0001-01-03', '0776989262'),
(7, 'kjl256', 'George', '526', 'nmh', 'Matale				', '0001-01-03', '0776989262'),
(8, 'hj4523', 'Aziim', '5231', 'Az@gmail.com', '		ahsdhb					', '2021-06-11', '7885412');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `developer`
--
ALTER TABLE `developer`
  ADD PRIMARY KEY (`developerID`);

--
-- Indexes for table `investor`
--
ALTER TABLE `investor`
  ADD PRIMARY KEY (`investorID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buyer`
--
ALTER TABLE `buyer`
  MODIFY `userID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `developer`
--
ALTER TABLE `developer`
  MODIFY `developerID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `investor`
--
ALTER TABLE `investor`
  MODIFY `investorID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
