-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2025 at 09:26 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(1, 1, 'anvith', '4644664464', 'anvith@gmail.com', 'cash on delivery', 'flat no. nfsaflkjbkjbja,  ac,mnlkndan, hvjvsjvjvh, bkjhdj, indiagggujjb - 576015', 'Senston Microfiber Volleyball Official Size 5 - Waterproof Indoor/Outdoor Soft Volleyball For Kids Y (1159 x 1) - basketball (800 x 1) - ', 1959, '2025-05-10', 'completed'),
(2, 1, 'ihoihwhiw', '664646', 'anvith@gmail.com', 'cash on delivery', 'flat no. sjdbjbgkjsbkg, sgknkgfkjlfng, sdklgsbdg, gnnfnlkg, sbkjgbjd - 646446', 'Bat (2000 x 1) - ', 2000, '2025-05-10', 'accepted'),
(3, 1, 'kjhijgij', '9555555555', 'anvith@gmail.com', 'cash on delivery', 'flat no. HJVVVJH, KJGSIJISGJAK, BKJSBKJBA, KJBKJB, HAVJXVA - 576105', 'basketball (800 x 1) - ', 800, '2025-05-10', 'pending'),
(4, 1, 'jdavfiavvfh', '9888888888', 'dzzddz@gmail.com', 'cash on delivery', 'flat no. nfknsn, iudijbfdfhdfhf, mumbai, hffhd55, India - 555555', 'Bat (2000 x 1) - basketball (800 x 1) - ', 2800, '2025-05-10', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `details`, `price`, `image_01`, `image_02`, `image_03`) VALUES
(1, 'Bat', 'cricket', 'great product', 2000, 'kasmir-willow-listing_0.png', 'images.jpeg', '31LnhoH6p2L._AC_UF894,1000_QL80_.jpg'),
(2, 'basketball', 'basketball', 'best product', 800, 'Basketball_Clipart.svg.png', 'images.jpeg', '250px-Basketball.jpeg'),
(3, 'GKI Euro XX Wooden Table Tennis Racquet', 'tabletennis', 'Speed: 99\r\nControl: 98\r\nStrong 5 ply blade with comfortable flared handle\r\nITTF approved|Attractive design front label with drawing of Timo Boll', 3939, 'tt1.jpg', 'tt3.jpg', 'tt4.jpg'),
(4, 'Senston Microfiber Volleyball Official Size 5 - Waterproof Indoor/Outdoor Soft Volleyball For Kids Y', 'volleyball', 'This volleyball is standard size 5 with unique 18 panels design,9.8oz weight, 8.2” in diameter. machine-sewn construction for stable fly and durable usage, sponge back structure brings you soft touch.\r\nButyl rubber bladder has extended Air Retention,The surface of this beach volleyball is Made of high quality synthetic leather, which is soft, comfortable, and wear-resistant, waterproof\r\nThis waterproof volleyball is suitable for beginners training. Outdoor playing and gaming. Suitable for the be', 1159, 'v1.jpg', 'v2.jpg', 'v3.jpg'),
(5, 'Nivia Airstrike Football Stud with TPU Sole with Direct Injection Molding Technology A Moulded Remov', 'football', 'Material typeSynthetic\r\nClosure typeLace-Up\r\nHeel typeFlat\r\nWater resistance levelWater Resistant\r\nSole materialEthylene Vinyl Acetate\r\nStyleAirstrike Football Stud\r\nCountry of OriginIndia', 548, 'f1.jpg', 'fs.jpg', 'f3.jpg'),
(6, 'Senston Badminton Rackets Set of 2 Badminton Set for Outdoor Backyards Gym, Lightweight Badminton Ra', 'badminton', 'COMPLETE SET :This badminton set includes 2 high-quality badminton rackets, 2 nylon shuttlecocks, 2 racket grips, and a convenient carrying bag.\r\nPERFECT FOR BEGINNERS : Whether you&#39;re new to the game or just looking for some casual fun, these rackets are perfect for you. For more advanced players, check out our store for professional-grade rackets.\r\nSOLID CONSTRUCTION : Our rackets feature a one-piece design with a built-in T-joint for maximum stability and precision control. Say goodbye to', 2399, 'b1.jpg', 'b2.jpg', 'b3.jpg'),
(7, 'Optifit® 32inch Baseball Bat with Storage Bag, 1100g Alloy Steel Baseball Bat, Heavy Duty Base Ball ', 'softball', 'STURDY CONSTRUCTION: The 32-inch alloy steel baseball bat is constructed using high-quality materials with spray coating that ensure its durability and strength. The alloy steel used in making the bat can withstand extreme pressure and impact. The bats sturdy construction makes it an ideal option for players who want a bat that can last several seasons.\r\nWELL BALANCED: The 32 Inches alloy steel baseball bat is designed for optimum performance and maximum control. The bat is well balanced, making', 1148, 's1.jpg', 's2.jpg', 's3.jpg'),
(8, 'Leosportz Agility Speed Ladder Agility Training Equipment, Soccer Speed Ladder, Football Footwork La', 'athletics', 'Size: 11 Feet 8 Rungs\r\nStyle Name: Agility Ladder\r\nColour: Orange\r\nVersatile Design: Combines ladder and hurdles, adjustable for dynamic flexibility, coordination, and balance training.\r\nCost-Effective: Multipurpose design reduces the need for multiple training tools, saving money.\r\nQuick Setup: Semi-rigid frame allows for tangle-free storage and easy 10-second assembly.\r\nDurable & Portable: Lightweight and suitable for indoor and outdoor use, perfect for any training course.\r\nInclusive for All:', 799, 'aa1.jpg', 'aa2.jpg', 'aa3.jpg'),
(9, 'Layan Sports MRF Cricket Kit Grand Edition (Genius) VK-18 Virat Kolhi Complete Cricket Kit (Size 5 (', 'cricket', 'COMPLETE KIT: The LAYAN SPORTS Grand Edition (Genius) VK-18 Virat Kohli Complete Cricket Kit includes all essential cricket equipment for young players in Size 5, perfect for budding cricketers.\r\nHIGH-QUALITY MATERIALS: Each item in the kit is made from high-quality materials, ensuring durability and performance during practice and matches.\r\nINSPIRED BY VIRAT KOHLI: Designed with inspiration from cricket legend Virat Kohli, this kit aims to motivate young players to achieve greatness on the fiel', 4499, 'c1.jpg', 'c1.jpg', 'c1.jpg'),
(10, 'Jaspo Revive (World Cup Edition) Premium Plastic Stumps Set For All Ages- Ideal For Boys, Girls, And', 'cricket', '1: Durable Construction: Made from high-quality, sturdy plastic material, these stumps are built to withstand intense gameplay, ensuring long-lasting use.\r\n2: Universal Appeal: Suitable for players of all ages, our stumps set is versatile and caters to the needs of kids, teenagers, and adults alike. Perfect for family gatherings, school events, or friendly matches with friends.\r\n3: Easy to Set Up: The stumps set is easy to assemble and disassemble, allowing for quick setup wherever you go. Enjoy', 379, 'pp.jpg', 'pp2.jpg', 'pp3.jpg'),
(11, 'BOXCO Power Hand Made Four Piece Cricket Leather Ball for T20 Matches, One Day Matches, Test Matches', 'cricket', '\r\nBrand	BOXCO\r\nMaterial	Leather\r\nColour	WHITE\r\nAge Range (Description)	Adult\r\nItem Weight	300 Grams', 2714, 'h1.jpg', 'h2.jpg', 'h3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'anvith', 'anvith@gmail.com', '58115a0704bd010df636cf4660c5e0dcd0c61f49');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
