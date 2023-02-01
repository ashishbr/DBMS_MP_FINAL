-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2023 at 01:31 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user_info`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getBookings` (IN `usnid` VARCHAR(25))   SELECT * FROM event_booking WHERE usn = usnid and event_booking.id = id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(1) NOT NULL,
  `name` varchar(25) NOT NULL,
  `address` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `points` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `name`, `address`, `description`, `points`) VALUES
(1, 'Govt Agara School', 'Agara main rd, Agara, Banglore ', 'Teach students from 1st to 7th', 20),
(2, 'Blood Donation', '#23, Shivaginagar', 'Voluntre Blood Donation', 20),
(3, 'Swatch Bharath', 'Jayanagar, Bangalore.', 'Clean Roads', 20),
(4, 'Tourism', 'Electronic City, Bangalore.', 'Tourist guide', 20),
(5, 'Old age home service', 'Whitefield, Bangalore.', 'Help old people', 20);

--
-- Triggers `event`
--
DELIMITER $$
CREATE TRIGGER `tr_delete` AFTER DELETE ON `event` FOR EACH ROW INSERT into event_logs(event_id,name,address,description,points) 
VALUES(old.id, old.name, old.address, old.description, old.points)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `event_booking`
--

CREATE TABLE `event_booking` (
  `id` int(3) NOT NULL,
  `user_name` varchar(25) NOT NULL,
  `usn` varchar(10) NOT NULL,
  `user_phone` int(10) NOT NULL,
  `event_id` int(1) NOT NULL,
  `organization_id` int(1) NOT NULL,
  `date` date NOT NULL,
  `no_of_hours` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_booking`
--

INSERT INTO `event_booking` (`id`, `user_name`, `usn`, `user_phone`, `event_id`, `organization_id`, `date`, `no_of_hours`) VALUES
(82, 'xyz', '1JS11XY001', 987654322, 1, 2, '2022-03-15', 20),
(86, 'xyz', '1JS11XY001', 987654322, 2, 3, '2022-04-26', 20),
(89, 'BHARGAV B', '1JS20IS035', 2147483647, 1, 1, '2022-12-12', 20),
(90, 'AKASH G', '1JS20IS010', 2147483647, 2, 2, '2023-01-11', 10),
(94, 'RAKSHITHA R', '1JS20IS055', 2147483647, 2, 2, '2022-12-12', 10),
(95, 'SAVITHA S', '1JS20IS060', 2147483647, 3, 3, '2022-12-14', 10);

-- --------------------------------------------------------

--
-- Table structure for table `event_logs`
--

CREATE TABLE `event_logs` (
  `id` int(2) NOT NULL,
  `event_id` int(2) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(30) NOT NULL,
  `description` varchar(20) NOT NULL,
  `points` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_logs`
--

INSERT INTO `event_logs` (`id`, `event_id`, `name`, `address`, `description`, `points`) VALUES
(12, 1, 'HighSchool Teaching', 'Kengeri', 'Teach highschool stu', 20),
(15, 2, 'Blood donation', 'Uttarahalli', 'Donate blood for awa', 20);

--
-- Triggers `event_logs`
--
DELIMITER $$
CREATE TRIGGER `del_logs` AFTER DELETE ON `event_logs` FOR EACH ROW INSERT into event 
VALUES(old.event_id,old.name,old.address,old.description,old.points)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `id` int(1) NOT NULL,
  `name` varchar(25) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`id`, `name`, `description`) VALUES
(1, 'Rotary Club', 'Dedicated organiztion to help locals'),
(2, 'NGO-N', 'National Global Organization'),
(3, 'NGO-R', 'Retribution'),
(4, 'WHO', 'Food shortage manager');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(1) NOT NULL,
  `name` text NOT NULL,
  `usn` varchar(10) NOT NULL,
  `phone_number` int(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `usertype` varchar(10) NOT NULL,
  `dt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `usn`, `phone_number`, `password`, `usertype`, `dt`) VALUES
(1, 'admin', '1JS11AD001', 123, 'admin', 'admin', '0000-00-00'),
(4, 'xyz', '1JS11XY001', 987654322, 'xyz', 'user', '2022-01-12'),
(91, 'abc', '1JS11AB001', 1234567890, '1234', 'user', '2022-04-01'),
(92, 'AKASH G', '1JS20IS010', 2147483647, 'Password10', 'user', '2023-01-31'),
(93, 'BHARGAV B', '1JS20IS035', 2147483647, 'Password35', 'user', '2023-01-31'),
(94, 'HARISH H', '1JS20IS040', 2147483647, 'Password40', 'user', '2023-01-31'),
(95, 'RAKSHITHA R', '1JS20IS055', 2147483647, 'Password55', 'user', '2023-01-31'),
(96, 'SAVITHA S', '1JS20IS060', 2147483647, 'Password60', 'user', '2023-01-31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `address` (`address`);

--
-- Indexes for table `event_booking`
--
ALTER TABLE `event_booking`
  ADD PRIMARY KEY (`id`,`usn`),
  ADD UNIQUE KEY `event_id` (`event_id`,`organization_id`,`date`),
  ADD KEY `event_booking_ibfk_1` (`organization_id`),
  ADD KEY `usn` (`usn`);

--
-- Indexes for table `event_logs`
--
ALTER TABLE `event_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usn` (`usn`,`phone_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `event_booking`
--
ALTER TABLE `event_booking`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `event_logs`
--
ALTER TABLE `event_logs`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event_booking`
--
ALTER TABLE `event_booking`
  ADD CONSTRAINT `event_booking_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_booking_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_booking_ibfk_3` FOREIGN KEY (`usn`) REFERENCES `user` (`usn`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
