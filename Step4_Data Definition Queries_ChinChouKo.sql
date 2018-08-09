-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: classmysql.engr.oregonstate.edu:3306
-- Generation Time: Jul 15, 2018 at 06:59 AM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_kochi`
--

-- --------------------------------------------------------

--
-- Table structure for table `project_clients`
--

CREATE TABLE `project_clients` (
  `id` int(11) NOT NULL,
  `first name` varchar(20) NOT NULL,
  `last name` varchar(20) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `age` int(11) NOT NULL,
  `ManufacturersID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_clients`
--

INSERT INTO `project_clients` (`id`, `first name`, `last name`, `gender`, `age`, `ManufacturersID`) VALUES
(10, 'Johnny ', 'Ko', 'male', 30, 0),
(11, 'Joyce', 'Lin', 'female', 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_contain`
--

CREATE TABLE `project_contain` (
  `ShoppingCartsID` int(11) NOT NULL,
  `PoductsID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_contain`
--

INSERT INTO `project_contain` (`ShoppingCartsID`, `PoductsID`) VALUES
(3, 3),
(3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `project_manufacturers`
--

CREATE TABLE `project_manufacturers` (
  `id` int(11) NOT NULL,
  `manufacturer name` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_manufacturers`
--

INSERT INTO `project_manufacturers` (`id`, `manufacturer name`, `country`) VALUES
(0, 'NOT manufacurer', ''),
(1, 'Apple', 'USA'),
(2, 'Sony', 'Japan');

-- --------------------------------------------------------

--
-- Table structure for table `project_produce`
--

CREATE TABLE `project_produce` (
  `ManufacurersID` int(11) NOT NULL,
  `ProductsID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_produce`
--

INSERT INTO `project_produce` (`ManufacurersID`, `ProductsID`) VALUES
(1, 3),
(1, 5),
(2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `project_products`
--

CREATE TABLE `project_products` (
  `id` int(11) NOT NULL,
  `product name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_products`
--

INSERT INTO `project_products` (`id`, `product name`, `description`, `price`) VALUES
(3, 'iPod', 'mp3 player', 100),
(4, 'Walkman', 'mp3 player', 50),
(5, 'TV', '', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `project_shopping carts`
--

CREATE TABLE `project_shopping carts` (
  `id` int(11) NOT NULL,
  `added date` date NOT NULL,
  `qty` int(11) NOT NULL,
  `discount` tinyint(1) NOT NULL,
  `amount` smallint(6) NOT NULL,
  `ClientsID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_shopping carts`
--

INSERT INTO `project_shopping carts` (`id`, `added date`, `qty`, `discount`, `amount`, `ClientsID`) VALUES
(3, '2018-07-15', 3, 0, 30, 10),
(4, '2018-07-08', 2, 1, 50, 11),
(5, '2018-07-01', 1, 1, 800, 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `project_clients`
--
ALTER TABLE `project_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ManufacturersID` (`ManufacturersID`);

--
-- Indexes for table `project_contain`
--
ALTER TABLE `project_contain`
  ADD PRIMARY KEY (`ShoppingCartsID`,`PoductsID`),
  ADD KEY `PoductsID` (`PoductsID`);

--
-- Indexes for table `project_manufacturers`
--
ALTER TABLE `project_manufacturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_produce`
--
ALTER TABLE `project_produce`
  ADD PRIMARY KEY (`ManufacurersID`,`ProductsID`),
  ADD KEY `ProductsID` (`ProductsID`);

--
-- Indexes for table `project_products`
--
ALTER TABLE `project_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_shopping carts`
--
ALTER TABLE `project_shopping carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ClientsID` (`ClientsID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `project_clients`
--
ALTER TABLE `project_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `project_products`
--
ALTER TABLE `project_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `project_shopping carts`
--
ALTER TABLE `project_shopping carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `project_clients`
--
ALTER TABLE `project_clients`
  ADD CONSTRAINT `project_clients_ibfk_1` FOREIGN KEY (`ManufacturersID`) REFERENCES `project_manufacturers` (`id`);

--
-- Constraints for table `project_contain`
--
ALTER TABLE `project_contain`
  ADD CONSTRAINT `project_contain_ibfk_1` FOREIGN KEY (`ShoppingCartsID`) REFERENCES `project_shopping carts` (`id`),
  ADD CONSTRAINT `project_contain_ibfk_2` FOREIGN KEY (`PoductsID`) REFERENCES `project_products` (`id`);

--
-- Constraints for table `project_produce`
--
ALTER TABLE `project_produce`
  ADD CONSTRAINT `project_produce_ibfk_1` FOREIGN KEY (`ProductsID`) REFERENCES `project_products` (`id`),
  ADD CONSTRAINT `project_produce_ibfk_2` FOREIGN KEY (`ManufacurersID`) REFERENCES `project_manufacturers` (`id`);

--
-- Constraints for table `project_shopping carts`
--
ALTER TABLE `project_shopping carts`
  ADD CONSTRAINT `project_shopping carts_ibfk_1` FOREIGN KEY (`ClientsID`) REFERENCES `project_clients` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
