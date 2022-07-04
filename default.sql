-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2022 at 03:28 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_shop`
--
DROP DATABASE IF EXISTS `book_shop`;
CREATE DATABASE IF NOT EXISTS `book_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `book_shop`;

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `orderID` bigint(10) NOT NULL,
  `ISBN13` varchar(13) NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderID` bigint(10) NOT NULL,
  `userID` bigint(20) NOT NULL,
  `basePrice` decimal(10,2) UNSIGNED DEFAULT 0.00,
  `postagePrice` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `recipientName` varchar(200) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `postcode` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `postage_price`
--

DROP TABLE IF EXISTS `postage_price`;
CREATE TABLE `postage_price` (
  `local_base` int(10) UNSIGNED NOT NULL,
  `local_increment` int(10) UNSIGNED NOT NULL,
  `international_base` int(10) UNSIGNED NOT NULL,
  `international_increment` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `postage_price`
--

INSERT INTO `postage_price` (`local_base`, `local_increment`, `international_base`, `international_increment`) VALUES
(3, 1, 10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `userID` bigint(20) DEFAULT NULL,
  `ISBN13` varchar(13) DEFAULT NULL,
  `qty` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shopping_cart`
--

INSERT INTO `shopping_cart` (`userID`, `ISBN13`, `qty`) VALUES
(4, '9780786838653', 1),
(4, '4968726478145', 1),
(4, '4968726478145', 1),
(4, '4968726478145', 1),
(4, '4968726478145', 1),
(4, '4968726478145', 1),
(4, '4968726478145', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `ISBN13` varchar(13) NOT NULL COMMENT '13 digits, ignore hyphens',
  `bookName` varchar(100) DEFAULT NULL,
  `bookAuthor` varchar(50) DEFAULT NULL,
  `publicationDate` date DEFAULT NULL,
  `bookDescription` text DEFAULT NULL,
  `coverImg` text DEFAULT NULL,
  `tradePrice` decimal(10,2) UNSIGNED DEFAULT NULL,
  `retailPrice` decimal(10,2) UNSIGNED DEFAULT NULL,
  `qty` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`ISBN13`, `bookName`, `bookAuthor`, `publicationDate`, `bookDescription`, `coverImg`, `tradePrice`, `retailPrice`, `qty`) VALUES
('1234567891011', 'TestName', 'PotatoAuthor', '2022-05-03', 'TestDesc', '1234567891011-no_book_cover.jpg', '56.00', '67.00', 6),
('1675825649801', 'Romance of Three Kingdoms', 'Luo GuanZhong', '1522-01-01', 'The story – part historical and part fictional – romanticises and dramatises the lives of feudal lords and their retainers, who tried to replace the dwindling Han dynasty or restore it. While the novel follows hundreds of characters, the focus is mainly on the three power blocs that emerged from the remnants of the Han dynasty, and would eventually form the three states of Cao Wei, Shu Han, and Eastern Wu. The novel deals with the plots, personal and military battles, intrigues, and struggles of these states to achieve dominance for almost 100 years.', '1675825649801-sanguo.jpg', '50.00', '89.00', 0),
('2558488500656', 'A Game of Thrones', 'George R.R. Martin', '1990-01-06', 'ABC', '2558488500656-got.jpg', '20.00', '40.00', 35),
('4968726478145', 'Peter And Jane', 'William Murray', '2001-02-01', 'Educational Book For Kids', '4968726478145-peterandjane.jpg', '25.00', '44.88', 172),
('9780786838653', 'Percy Jackson: The Lightning Thief', 'Rick Riordan', '2005-06-28', 'In this stunning collectors\' edition of The Lightning Thief, Percy Jackson\'s world is brought to life with eight full-color plates by the series jacket artist John Rocco. The edition comes in an elegant slipcase with a ribbon bookmark, rough edges, and cloth cover--a perfect keepsake for fans of this truly epic series.\r\n\r\nAfter getting expelled from yet another school for yet another clash with mythological monsters only he can see, twelve-year-old Percy Jackson is taken to Camp Half-Blood, where he finally learns the truth about his unique abilities: He is a demigod, half human, half immortal. Even more stunning: His father is the Greek god Poseidon, ruler of the sea, making Percy one of the most powerful demigods alive. There\'s little time to process this news. All too soon, a cryptic prophecy from the Oracle sends Percy on his first quest, a mission to the Underworld to prevent a war among the gods of Olympus.\r\n\r\nThis first installment of Rick Riordan\'s best-selling series is a non-stop thrill-ride and a classic of mythic proportions.', '9780786838653-9780786838653-percyjackson.jpg', '20.00', '30.00', 1),
('9781536204957', 'The Last Mapmaker', 'Christina Soontornvat', '2022-04-12', 'Left with few options, Sai follows her heart and the only opportunity she has to escape this cycle of poverty to the ocean. Her story is not only full of a thirst for adventure, but also the knowledge that she cannot rely on her father. That she\'s stuck in a system based on family lineage or wealth and she must escape. My heart already broke for Sai before she even got on the boat. And then when she embarks, I found myself thrilled alongside her.', '9781536204957-9781536204957-thelastmapmaker.jpg', '20.00', '30.00', 5);

-- --------------------------------------------------------

--
-- Table structure for table `userprivilige`
--

DROP TABLE IF EXISTS `userprivilige`;
CREATE TABLE `userprivilige` (
  `priviligeInt` int(11) NOT NULL,
  `priviligeText` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userprivilige`
--

INSERT INTO `userprivilige` (`priviligeInt`, `priviligeText`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `userEmail` varchar(100) NOT NULL,
  `userPassword` varchar(100) NOT NULL,
  `userPrivilige` int(11) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `postcode` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `userEmail`, `userPassword`, `userPrivilige`, `country`, `state`, `district`, `postcode`, `address`) VALUES
(4, 'kevin wong', 'wongkevin206@gmail.com', '$2y$10$W37apNDH8161DlKr3vzrlOl3v.ve5H7NyV2ZV4A3bN4BnX3ZAE/gq', 1, 'Malaysia', 'Penang', 'Bayan lepas', '11900', '24 lebuh bukit kecil 1'),
(5, 'test', 'test@gmail.com', '$2y$10$eD/82W/KtY09dx//poYVTeb5xd5.am04UgywTj.HKJHteg5FaK2.6', 1, '', '', '', '0', ''),
(29, 'testing123', '321testingdelete@gmail.com', '$2y$04$XBlo8taBY3ayZcILk02d3uwKTMLIEYniD8xFnXC4TebT135ZtSw8K', 2, '', '', '', '0', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD KEY `orderID` (`orderID`,`ISBN13`),
  ADD KEY `ISBN13` (`ISBN13`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `orderID` (`orderID`);

--
-- Indexes for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD KEY `userID` (`userID`),
  ADD KEY `ISBN13` (`ISBN13`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`ISBN13`);

--
-- Indexes for table `userprivilige`
--
ALTER TABLE `userprivilige`
  ADD KEY `priviligeInt` (`priviligeInt`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `userEmail` (`userEmail`),
  ADD UNIQUE KEY `userEmail_2` (`userEmail`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`ISBN13`) REFERENCES `stock` (`ISBN13`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `orderitem_ibfk_3` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
