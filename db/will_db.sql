-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2025 at 01:05 PM
-- Server version: 8.0.35
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `will_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int NOT NULL,
  `testator_id` int DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `beneficiary` varchar(100) DEFAULT NULL,
  `share` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `testator_id`, `bank_name`, `account_number`, `remark`, `beneficiary`, `share`) VALUES
(9, 11, 'Sbi ', '38456387456783', 'Main ACcount', 'Dimpi Mehta', 60),
(10, 11, 'HDFC', '2642hey3537', 'Saving Account', 'Kalindi Mehta', 40);

-- --------------------------------------------------------

--
-- Table structure for table `beneficiaries`
--

CREATE TABLE `beneficiaries` (
  `id` int NOT NULL,
  `testator_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `relationship` varchar(50) DEFAULT NULL,
  `id_number` varchar(50) DEFAULT NULL,
  `residence` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `beneficiaries`
--

INSERT INTO `beneficiaries` (`id`, `testator_id`, `name`, `relationship`, `id_number`, `residence`, `age`) VALUES
(9, 11, 'Dimpi Mehta', 'Wife', '456373637363', 'b14 akota rajnagara', 45),
(10, 11, 'Kalindi Mehta ', 'Daughter', '897647657863', 'b14 akota rajnagara', 28),
(11, 11, 'Sahil Mehta', 'Son', '789463728264', 'b14 akota rajnagara', 16);

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `id` int NOT NULL,
  `testator_id` int DEFAULT NULL,
  `property_name` varchar(100) DEFAULT NULL,
  `registration_number` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `beneficiary` varchar(100) DEFAULT NULL,
  `share` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`id`, `testator_id`, `property_name`, `registration_number`, `remark`, `beneficiary`, `share`) VALUES
(1, 11, 'Shri Laxmi House ', 'REG-8437584387', 'Ancestral Property', 'Kalindi Mehta', 100);

-- --------------------------------------------------------

--
-- Table structure for table `insurance_policies`
--

CREATE TABLE `insurance_policies` (
  `id` int NOT NULL,
  `testator_id` int DEFAULT NULL,
  `policy_name` varchar(100) DEFAULT NULL,
  `policy_number` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `beneficiary` varchar(100) DEFAULT NULL,
  `share` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `insurance_policies`
--

INSERT INTO `insurance_policies` (`id`, `testator_id`, `policy_name`, `policy_number`, `remark`, `beneficiary`, `share`) VALUES
(1, 11, 'LIC Jeevan Anand ', 'LIC346374', 'Life insurance', 'Dimpi Mehta', 100);

-- --------------------------------------------------------

--
-- Table structure for table `jewellery`
--

CREATE TABLE `jewellery` (
  `id` int NOT NULL,
  `testator_id` int DEFAULT NULL,
  `jewellery_type` varchar(100) DEFAULT NULL,
  `invoice_number` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `beneficiary` varchar(100) DEFAULT NULL,
  `share` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jewellery`
--

INSERT INTO `jewellery` (`id`, `testator_id`, `jewellery_type`, `invoice_number`, `remark`, `beneficiary`, `share`) VALUES
(1, 11, 'Gold Necklace', 'INV 9837593875', 'Wedding Gift', 'Dimpi Mehta', 100);

-- --------------------------------------------------------

--
-- Table structure for table `lands`
--

CREATE TABLE `lands` (
  `id` int NOT NULL,
  `testator_id` int DEFAULT NULL,
  `land_name` varchar(100) DEFAULT NULL,
  `registration_number` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `beneficiary` varchar(100) DEFAULT NULL,
  `share` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lands`
--

INSERT INTO `lands` (`id`, `testator_id`, `land_name`, `registration_number`, `remark`, `beneficiary`, `share`) VALUES
(1, 11, 'Mehta Farm', 'LAND-98367983', 'Agricultural', 'Sahil Mehta', 100);

-- --------------------------------------------------------

--
-- Table structure for table `mutual_funds`
--

CREATE TABLE `mutual_funds` (
  `id` int NOT NULL,
  `testator_id` int DEFAULT NULL,
  `distributor` varchar(100) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `beneficiary` varchar(100) DEFAULT NULL,
  `share` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mutual_funds`
--

INSERT INTO `mutual_funds` (`id`, `testator_id`, `distributor`, `account_number`, `remark`, `beneficiary`, `share`) VALUES
(1, 11, 'Grow ', 'DF27348274', 'SIP - ELSS', 'Sahil Mehta', 100);

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` int NOT NULL,
  `testator_id` int DEFAULT NULL,
  `firm_name` varchar(100) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `beneficiary` varchar(100) DEFAULT NULL,
  `share` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `testator_id`, `firm_name`, `account_number`, `remark`, `beneficiary`, `share`) VALUES
(1, 11, 'Zerodha', 'CV8374389', 'Equity Holding', 'Kalindi Mehta', 100);

-- --------------------------------------------------------

--
-- Table structure for table `testator`
--

CREATE TABLE `testator` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `address` text,
  `will_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `testator`
--

INSERT INTO `testator` (`id`, `name`, `father_name`, `address`, `will_date`) VALUES
(11, 'Sachin Mehta', 'Arvind Mehta', 'b14 akota rajnagara', '2025-07-23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testator_id` (`testator_id`);

--
-- Indexes for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testator_id` (`testator_id`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testator_id` (`testator_id`);

--
-- Indexes for table `insurance_policies`
--
ALTER TABLE `insurance_policies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testator_id` (`testator_id`);

--
-- Indexes for table `jewellery`
--
ALTER TABLE `jewellery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testator_id` (`testator_id`);

--
-- Indexes for table `lands`
--
ALTER TABLE `lands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testator_id` (`testator_id`);

--
-- Indexes for table `mutual_funds`
--
ALTER TABLE `mutual_funds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testator_id` (`testator_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testator_id` (`testator_id`);

--
-- Indexes for table `testator`
--
ALTER TABLE `testator`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `insurance_policies`
--
ALTER TABLE `insurance_policies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jewellery`
--
ALTER TABLE `jewellery`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lands`
--
ALTER TABLE `lands`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mutual_funds`
--
ALTER TABLE `mutual_funds`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `testator`
--
ALTER TABLE `testator`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD CONSTRAINT `bank_accounts_ibfk_1` FOREIGN KEY (`testator_id`) REFERENCES `testator` (`id`);

--
-- Constraints for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  ADD CONSTRAINT `beneficiaries_ibfk_1` FOREIGN KEY (`testator_id`) REFERENCES `testator` (`id`);

--
-- Constraints for table `houses`
--
ALTER TABLE `houses`
  ADD CONSTRAINT `houses_ibfk_1` FOREIGN KEY (`testator_id`) REFERENCES `testator` (`id`);

--
-- Constraints for table `insurance_policies`
--
ALTER TABLE `insurance_policies`
  ADD CONSTRAINT `insurance_policies_ibfk_1` FOREIGN KEY (`testator_id`) REFERENCES `testator` (`id`);

--
-- Constraints for table `jewellery`
--
ALTER TABLE `jewellery`
  ADD CONSTRAINT `jewellery_ibfk_1` FOREIGN KEY (`testator_id`) REFERENCES `testator` (`id`);

--
-- Constraints for table `lands`
--
ALTER TABLE `lands`
  ADD CONSTRAINT `lands_ibfk_1` FOREIGN KEY (`testator_id`) REFERENCES `testator` (`id`);

--
-- Constraints for table `mutual_funds`
--
ALTER TABLE `mutual_funds`
  ADD CONSTRAINT `mutual_funds_ibfk_1` FOREIGN KEY (`testator_id`) REFERENCES `testator` (`id`);

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`testator_id`) REFERENCES `testator` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
