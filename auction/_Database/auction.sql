-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2019 at 02:17 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auction`
--

-- --------------------------------------------------------

--
-- Table structure for table `auction`
--

CREATE TABLE `auction` (
  `auction_id` int(11) NOT NULL,
  `start_price` decimal(8,2) NOT NULL,
  `reserve_price` decimal(8,2) NOT NULL,
  `current_bid` decimal(8,2) NOT NULL,
  `start_time` datetime NOT NULL,
  `duration_id` int(11) NOT NULL,
  `end_time` datetime NOT NULL,
  `viewings` int(11) NOT NULL DEFAULT '0',
  `win_confirmed` tinyint(1) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `bid_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `auction_id` int(11) NOT NULL,
  `bid_price` decimal(8,2) NOT NULL,
  `bid_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category` varchar(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category`) VALUES
(1, 'Antiques'),
(2, 'Art'),
(3, 'Baby'),
(4, 'Books, Comics & Magazines'),
(5, 'Business, Office & Industrial'),
(6, 'Cameras & Photography'),
(7, 'Cars, Motorcycles & Vehicles'),
(8, 'Clothes, Shoes & Accessories'),
(9, 'Coins'),
(10, 'Collectables'),
(11, 'Computers/Tablets & Networking'),
(12, 'Crafts'),
(13, 'Dolls & Bears'),
(14, 'DVDs, Films & TV'),
(15, 'Events Tickets'),
(16, 'Garden & Patio'),
(17, 'Health & Beauty'),
(18, 'Holidays & Travel'),
(19, 'Home, Furniture & DIY'),
(20, 'Jewellery & Watches'),
(21, 'Mobile Phones & Communication'),
(22, 'Music'),
(23, 'Musical Instruments'),
(24, 'Pet Supplies'),
(25, 'Pottery, Porcelain & Glass'),
(26, 'Property'),
(27, 'Sound & Vision'),
(28, 'Sporting Goods'),
(29, 'Sports Memorabilia'),
(30, 'Stamps'),
(31, 'Toys & Games'),
(32, 'Vehicle Parts & Accessories'),
(33, 'Video Games & Consoles'),
(34, 'Wholesale & Job Lots'),
(35, 'Everything Else');

-- --------------------------------------------------------

--
-- Table structure for table `duration`
--

CREATE TABLE `duration` (
  `duration_id` int(11) NOT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `duration`
--

INSERT INTO `duration` (`duration_id`, `duration`) VALUES
(1, 1),
(2, 3),
(3, 5),
(4, 7),
(5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `item_picture` varchar(255) NOT NULL,
  `label` varchar(127) NOT NULL,
  `description` varchar(255) NOT NULL,
  `state_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `item_picture`, `label`, `description`, `state_id`, `category_id`) VALUES
(2, 'uploads/item/020519-130208_img1.jpg', 'vgig', 'kkkkk', 3, 6),
(3, 'uploads/item/020519-130253_img2.jpg', 'ggg', 'ggug', 2, 7),
(4, 'uploads/item/020519-140235_img1.jpg', 'gfuf', 'yjftydjyd', 4, 8),
(6, 'uploads/item/020519-140246_img2.jpg', 'hjbuh', 'huhjjhu', 3, 6),
(7, 'uploads/item/020519-210217_20181114_193807.jpg', 'ball', 'this is good', 4, 7),
(8, 'uploads/item/020519-210212_img1.jpg', 'fan', 'ddffe', 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `rating_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role`) VALUES
(1, 'Buyer'),
(2, 'Seller');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL,
  `state` varchar(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `state`) VALUES
(1, 'Brand New'),
(2, 'Like New'),
(3, 'Very Good'),
(4, 'Good'),
(5, 'Acceptable');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(31) NOT NULL,
  `passwd` varchar(40) NOT NULL,
  `profile_picture` varchar(255) NOT NULL,
  `first_name` varchar(31) NOT NULL,
  `last_name` varchar(31) NOT NULL,
  `email` varchar(63) NOT NULL,
  `birthdate` date NOT NULL,
  `rating_count` int(11) NOT NULL,
  `rating` decimal(3,2) NOT NULL DEFAULT '0.00',
  `role_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `watch`
--

CREATE TABLE `watch` (
  `user_id` int(11) NOT NULL,
  `auction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auction`
--
ALTER TABLE `auction`
  ADD PRIMARY KEY (`auction_id`),
  ADD KEY `Auction_Duration` (`duration_id`),
  ADD KEY `Auction_Item` (`item_id`),
  ADD KEY `Auction_Users` (`user_id`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`bid_id`),
  ADD KEY `Auction_Bids` (`auction_id`),
  ADD KEY `Users_Bids` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `duration`
--
ALTER TABLE `duration`
  ADD PRIMARY KEY (`duration_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `Category_Item` (`category_id`),
  ADD KEY `Item_condition_id` (`state_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`sender_id`,`receiver_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `Users_Roles` (`role_id`);

--
-- Indexes for table `watch`
--
ALTER TABLE `watch`
  ADD PRIMARY KEY (`user_id`,`auction_id`),
  ADD KEY `Watch_Auction` (`auction_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auction`
--
ALTER TABLE `auction`
  MODIFY `auction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `bid_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `duration`
--
ALTER TABLE `duration`
  MODIFY `duration_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auction`
--
ALTER TABLE `auction`
  ADD CONSTRAINT `Auction_Duration` FOREIGN KEY (`duration_id`) REFERENCES `duration` (`duration_id`),
  ADD CONSTRAINT `Auction_Item` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  ADD CONSTRAINT `Auction_Users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `bids`
--
ALTER TABLE `bids`
  ADD CONSTRAINT `Auction_Bids` FOREIGN KEY (`auction_id`) REFERENCES `auction` (`auction_id`),
  ADD CONSTRAINT `Users_Bids` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `Category_Item` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `Item_condition_id` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `Rating_Users` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `Users_Roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

--
-- Constraints for table `watch`
--
ALTER TABLE `watch`
  ADD CONSTRAINT `Users_Watch` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `Watch_Auction` FOREIGN KEY (`auction_id`) REFERENCES `auction` (`auction_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
