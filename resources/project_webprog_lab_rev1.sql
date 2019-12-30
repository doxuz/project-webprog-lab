-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2019 at 03:50 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_webprog_lab`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `courier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `courier_id`, `total_price`, `created_at`, `updated_at`) VALUES
(8, 1, NULL, 3000, '2019-12-30 04:57:43', '2019-12-30 04:57:43'),
(11, 4, NULL, 174000, '2019-12-30 07:00:11', '2019-12-30 07:00:11'),
(12, 5, NULL, 183000, '2019-12-30 07:15:51', '2019-12-30 07:15:51'),
(13, 6, NULL, 0, '2019-12-30 07:20:47', '2019-12-30 07:20:47'),
(14, 7, NULL, 0, '2019-12-30 07:21:45', '2019-12-30 07:21:45'),
(18, 8, NULL, 17000, '2019-12-30 07:37:05', '2019-12-30 07:37:05'),
(19, 9, NULL, 192000, '2019-12-30 07:44:58', '2019-12-30 07:44:58');

-- --------------------------------------------------------

--
-- Table structure for table `cart_histories`
--

CREATE TABLE `cart_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `courier_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_histories`
--

INSERT INTO `cart_histories` (`id`, `date`, `user_id`, `courier_id`, `total_price`, `created_at`, `updated_at`) VALUES
(4, '2019-12-30 07:30:29', 1, 2, 30000, '2019-12-30 00:30:29', '2019-12-30 00:30:29'),
(5, '2019-12-30 07:36:05', 1, 1, 3000, '2019-12-30 00:36:05', '2019-12-30 00:36:05'),
(6, '2019-12-30 07:37:25', 1, 1, 10000, '2019-12-30 00:37:25', '2019-12-30 00:37:25'),
(7, '2019-12-30 07:38:58', 1, 2, 5000, '2019-12-30 00:38:58', '2019-12-30 00:38:58'),
(8, '2019-12-30 07:39:52', 1, 1, 6000, '2019-12-30 00:39:52', '2019-12-30 00:39:52'),
(9, '2019-12-30 07:40:32', 1, 1, 3000, '2019-12-30 00:40:32', '2019-12-30 00:40:32'),
(10, '2019-12-30 13:53:26', 2, 3, 60000, '2019-12-30 06:53:26', '2019-12-30 06:53:26');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `flower_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `flower_id`, `quantity`, `created_at`, `updated_at`) VALUES
(21, 8, 2, 3, '2019-12-30 04:57:43', '2019-12-30 04:57:43'),
(22, 8, 17, 10, '2019-12-30 06:51:31', '2019-12-30 06:51:31'),
(24, 8, 9, 3, '2019-12-30 07:00:11', '2019-12-30 07:00:11'),
(25, 11, 11, 2, '2019-12-30 07:02:49', '2019-12-30 07:02:49'),
(26, 8, 14, 3, '2019-12-30 07:15:51', '2019-12-30 07:15:51'),
(28, 8, 8, 2, '2019-12-30 07:36:29', '2019-12-30 07:36:29'),
(29, 8, 6, 1, '2019-12-30 07:37:05', '2019-12-30 07:37:05'),
(30, 18, 2, 1, '2019-12-30 07:38:35', '2019-12-30 07:38:35'),
(31, 18, 4, 1, '2019-12-30 07:38:43', '2019-12-30 07:38:43'),
(32, 18, 9, 1, '2019-12-30 07:38:55', '2019-12-30 07:38:55'),
(33, 18, 8, 2, '2019-12-30 07:39:02', '2019-12-30 07:39:02');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items_histories`
--

CREATE TABLE `cart_items_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_history_id` bigint(20) UNSIGNED NOT NULL,
  `flower_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_items_histories`
--

INSERT INTO `cart_items_histories` (`id`, `cart_history_id`, `flower_id`, `quantity`, `created_at`, `updated_at`) VALUES
(9, 4, 3, 3, '2019-12-30 00:30:29', '2019-12-30 00:30:29'),
(10, 4, 2, 3, '2019-12-30 00:30:29', '2019-12-30 00:30:29'),
(11, 4, 4, 1, '2019-12-30 00:30:29', '2019-12-30 00:30:29'),
(12, 4, 6, 1, '2019-12-30 00:30:29', '2019-12-30 00:30:29'),
(13, 5, 2, 1, '2019-12-30 00:36:05', '2019-12-30 00:36:05'),
(14, 6, 5, 2, '2019-12-30 00:37:25', '2019-12-30 00:37:25'),
(15, 7, 15, 1, '2019-12-30 00:38:58', '2019-12-30 00:38:58'),
(16, 8, 2, 2, '2019-12-30 00:39:52', '2019-12-30 00:39:52'),
(17, 9, 16, 1, '2019-12-30 00:40:32', '2019-12-30 00:40:32'),
(18, 10, 17, 4, '2019-12-30 06:53:26', '2019-12-30 06:53:26');

-- --------------------------------------------------------

--
-- Table structure for table `couriers`
--

CREATE TABLE `couriers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `couriers`
--

INSERT INTO `couriers` (`id`, `name`, `cost`, `created_at`, `updated_at`) VALUES
(1, 'JNE', 9000, NULL, '2019-12-30 04:57:55'),
(2, 'Wahana', 5000, NULL, NULL),
(3, 'J&T', 8000, '2019-12-30 04:51:27', '2019-12-30 04:51:27');

-- --------------------------------------------------------

--
-- Table structure for table `flowers`
--

CREATE TABLE `flowers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flower_type_id` bigint(20) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `flower_pic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flowers`
--

INSERT INTO `flowers` (`id`, `name`, `flower_type_id`, `price`, `description`, `stock`, `flower_pic`, `created_at`, `updated_at`) VALUES
(2, 'Yellow Lily 1', 2, 3000, 'yellow like banana minion hehe', 0, 'uploads/yellow_lily.jpg', NULL, '2019-12-30 07:38:35'),
(3, 'Red Rose 2', 1, 5000, 'its red and its dangerous *wink*', 0, 'uploads/Red_rose.jpg', NULL, '2019-12-30 00:10:23'),
(4, 'Yellow Lily 2', 2, 3000, 'yellow like banana minion hehe', 0, 'uploads/yellow_lily.jpg', NULL, '2019-12-30 07:38:43'),
(5, 'Red Rose 3', 1, 5000, 'its red and its dangerous *wink*', 1, 'uploads/Red_rose.jpg', NULL, '2019-12-30 06:57:22'),
(6, 'Yellow Lily 3', 2, 3000, 'yellow like banana minion hehe', 6, 'uploads/yellow_lily.jpg', NULL, '2019-12-30 07:44:58'),
(7, 'Red Rose 4', 1, 5000, 'its red and its dangerous *wink*', 5, 'uploads/Red_rose.jpg', NULL, NULL),
(8, 'Yellow Lily 4', 2, 3000, 'yellow like banana minion hehe', 2, 'uploads/yellow_lily.jpg', NULL, '2019-12-30 07:39:02'),
(9, 'Red Rose 5', 1, 5000, 'its red and its dangerous *wink*', 0, 'uploads/Red_rose.jpg', NULL, '2019-12-30 07:38:55'),
(10, 'Yellow Lily 5', 2, 3000, 'yellow like banana minion hehe', 1, 'uploads/yellow_lily.jpg', NULL, '2019-12-30 07:01:35'),
(11, 'Red Rose 6', 1, 5000, 'its red and its dangerous *wink*', 3, 'uploads/Red_rose.jpg', NULL, '2019-12-30 07:02:49'),
(12, 'Yellow Lily 6', 2, 3000, 'yellow like banana minion hehe', 4, 'uploads/yellow_lily.jpg', NULL, '2019-12-30 07:34:35'),
(13, 'Red Rose 7', 1, 5000, 'its red and its dangerous *wink*', 5, 'uploads/Red_rose.jpg', NULL, NULL),
(14, 'Yellow Lily 7', 2, 3000, 'yellow like banana minion hehe', 7, 'uploads/yellow_lily.jpg', NULL, '2019-12-30 07:15:51'),
(15, 'Red Rose 8', 1, 5000, 'its red and its dangerous *wink*', 4, 'uploads/Red_rose.jpg', NULL, '2019-12-30 00:38:53'),
(16, 'Yellow Lily 8', 2, 3000, 'yellow like banana minion hehe', 5, 'uploads/yellow_lily.jpg', NULL, '2019-12-30 07:21:45'),
(17, 'Iris 1', 2, 15000, 'I\'m blue and I look good :)', 1, 'uploads\\iris.jpg', '2019-12-30 02:38:19', '2019-12-30 06:53:18');

-- --------------------------------------------------------

--
-- Table structure for table `flower_types`
--

CREATE TABLE `flower_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flower_types`
--

INSERT INTO `flower_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'rose', NULL, '2019-12-30 04:32:10'),
(2, 'lily', NULL, NULL),
(4, 'iris', '2019-12-30 04:22:50', '2019-12-30 04:31:18');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_12_28_160002_create_flower_types_table', 1),
(4, '2019_12_28_160016_create_flowers_table', 1),
(5, '2019_12_28_160023_create_couriers_table', 1),
(6, '2019_12_28_160029_create_carts_table', 1),
(7, '2019_12_28_160036_create_cart_items_table', 1),
(8, '2019_12_28_160045_create_cart_histories_table', 1),
(9, '2019_12_28_160053_create_cart_items_histories_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_pic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `email`, `name`, `password`, `phone`, `gender`, `address`, `profile_pic`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'a@a', 'aa', '$2y$10$qYU9sBfo/UbcuwKw.FBIL.UJxWqQOJd/eZL1Nr1UCLFmthABcb5I.', '12345678', 'male', 'aaaaaaaaaaaaaaaaaaaaa', 'uploads\\iris.jpg', NULL, NULL, '2019-12-29 07:19:11', '2019-12-30 06:03:01'),
(2, 'member', 'b@b', 'bb', '$2y$10$WZQ24zfQXI1.Uu2oQgutJe6n9Fd/XmY4FiGC5ifAxiYxzHqVxbXCO', '87654321', 'female', 'bbbbbbbbbbbbbbbbbbbbbbbbbb', 'uploads\\Red_rose.jpg', NULL, NULL, '2019-12-30 05:41:59', '2019-12-30 06:15:01'),
(4, 'member', 'c@c', 'cc', '$2y$10$88aN8L3bwOXg47Wz6kopje8nmtc2gt5EWCeRoy1JU1RzkAcFjBKIK', '123145124', 'female', 'adawdadadwad', 'uploads\\yellow_lily.jpg', NULL, NULL, '2019-12-30 06:56:17', '2019-12-30 06:56:17'),
(5, 'member', 'd@d', 'dd', '$2y$10$PKvJ05qKMhjekBf60XqpQ.a1jbt3gFChiLui4Df9nS0gfD/eZY1JW', '123414512', 'female', 'dddddddddddddddddddddddddd', 'uploads\\iris.jpg', NULL, NULL, '2019-12-30 07:15:29', '2019-12-30 07:15:29'),
(6, 'member', 'e@e', 'ee', '$2y$10$ChiF1h6QyhZlDMQX1PI3sO8iFlNCyYfihBGkP8v9khk7qTkfG8o06', '123141234', 'female', 'awddddddddawdaw', 'uploads\\Red_rose.jpg', NULL, NULL, '2019-12-30 07:20:36', '2019-12-30 07:20:36'),
(7, 'member', 'f@f', 'ff', '$2y$10$HJ4y715WD44n5W3bNbR0qeIJFcbno8vyfjQGBTiLlKmW9Ss.zQhcq', '21314124124', 'female', 'fffffffffffffffffffffffffffff', 'uploads\\yellow_lily.jpg', NULL, NULL, '2019-12-30 07:21:36', '2019-12-30 07:21:36'),
(8, 'member', 'g@g', 'gg', '$2y$10$AOISof0YSDqwkQmi1qNycesHv7QxM4dFCMkx4Cjj8C0AAGL3VI5y6', '124512412', 'male', 'gggggggggggggggggggggg', 'uploads\\Red_rose.jpg', NULL, NULL, '2019-12-30 07:32:46', '2019-12-30 07:32:46'),
(9, 'member', 'h@h', 'hh', '$2y$10$FHksxEwcoIOkS80pqrQdMuroV5iJxc/KCZihqPx27wgNnZ7jW4rAa', '213123131', 'female', 'ggggggggggggggggh', 'uploads\\Red_rose.jpg', NULL, NULL, '2019-12-30 07:44:48', '2019-12-30 07:44:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_courier_id_foreign` (`courier_id`);

--
-- Indexes for table `cart_histories`
--
ALTER TABLE `cart_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_histories_user_id_foreign` (`user_id`),
  ADD KEY `cart_histories_courier_id_foreign` (`courier_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_flower_id_foreign` (`flower_id`);

--
-- Indexes for table `cart_items_histories`
--
ALTER TABLE `cart_items_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_histories_cart_history_id_foreign` (`cart_history_id`),
  ADD KEY `cart_items_histories_flower_id_foreign` (`flower_id`);

--
-- Indexes for table `couriers`
--
ALTER TABLE `couriers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flowers`
--
ALTER TABLE `flowers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flowers_flower_type_id_foreign` (`flower_type_id`);

--
-- Indexes for table `flower_types`
--
ALTER TABLE `flower_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `cart_histories`
--
ALTER TABLE `cart_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `cart_items_histories`
--
ALTER TABLE `cart_items_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `couriers`
--
ALTER TABLE `couriers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `flowers`
--
ALTER TABLE `flowers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `flower_types`
--
ALTER TABLE `flower_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_courier_id_foreign` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `cart_histories`
--
ALTER TABLE `cart_histories`
  ADD CONSTRAINT `cart_histories_courier_id_foreign` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_items_flower_id_foreign` FOREIGN KEY (`flower_id`) REFERENCES `flowers` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `cart_items_histories`
--
ALTER TABLE `cart_items_histories`
  ADD CONSTRAINT `cart_items_histories_cart_history_id_foreign` FOREIGN KEY (`cart_history_id`) REFERENCES `cart_histories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_items_histories_flower_id_foreign` FOREIGN KEY (`flower_id`) REFERENCES `flowers` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `flowers`
--
ALTER TABLE `flowers`
  ADD CONSTRAINT `flowers_flower_type_id_foreign` FOREIGN KEY (`flower_type_id`) REFERENCES `flower_types` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
