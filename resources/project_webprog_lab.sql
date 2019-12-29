-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2019 at 08:04 PM
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
(2, 1, NULL, 10000, '2019-12-29 09:06:45', '2019-12-29 09:06:45');

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
(6, 2, 3, 2, '2019-12-29 09:10:01', '2019-12-29 09:10:01');

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
(1, 'JNE', 9000, NULL, NULL),
(2, 'Wahana', 5000, NULL, NULL);

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
(1, 'Red Rose 1', 1, 5000, 'its red and its dangerous *wink*', 1, 'uploads/Red_rose.jpg', NULL, '2019-12-29 09:55:44'),
(2, 'Yellow Lily 1', 2, 3000, 'yellow like banana minion hehe', 10, 'uploads/yellow_lily.jpg', NULL, '2019-12-29 12:02:10'),
(3, 'Red Rose 2', 1, 5000, 'its red and its dangerous *wink*', 1, 'uploads/Red_rose.jpg', NULL, '2019-12-29 10:23:23'),
(4, 'Yellow Lily 2', 2, 3000, 'yellow like banana minion hehe', 3, 'uploads/yellow_lily.jpg', NULL, '2019-12-29 10:27:08'),
(5, 'Red Rose 3', 1, 5000, 'its red and its dangerous *wink*', 5, 'uploads/Red_rose.jpg', NULL, NULL),
(6, 'Yellow Lily 3', 2, 3000, 'yellow like banana minion hehe', 10, 'uploads/yellow_lily.jpg', NULL, NULL),
(7, 'Red Rose 4', 1, 5000, 'its red and its dangerous *wink*', 5, 'uploads/Red_rose.jpg', NULL, NULL),
(8, 'Yellow Lily 4', 2, 3000, 'yellow like banana minion hehe', 6, 'uploads/yellow_lily.jpg', NULL, '2019-12-29 11:52:01'),
(9, 'Red Rose 5', 1, 5000, 'its red and its dangerous *wink*', 5, 'uploads/Red_rose.jpg', NULL, NULL),
(10, 'Yellow Lily 5', 2, 3000, 'yellow like banana minion hehe', 3, 'uploads/yellow_lily.jpg', NULL, '2019-12-29 11:57:47'),
(11, 'Red Rose 6', 1, 5000, 'its red and its dangerous *wink*', 5, 'uploads/Red_rose.jpg', NULL, '2019-12-29 11:59:41'),
(12, 'Yellow Lily 6', 2, 3000, 'yellow like banana minion hehe', 10, 'uploads/yellow_lily.jpg', NULL, NULL),
(13, 'Red Rose 7', 1, 5000, 'its red and its dangerous *wink*', 5, 'uploads/Red_rose.jpg', NULL, NULL),
(14, 'Yellow Lily 7', 2, 3000, 'yellow like banana minion hehe', 10, 'uploads/yellow_lily.jpg', NULL, NULL),
(15, 'Red Rose 8', 1, 5000, 'its red and its dangerous *wink*', 5, 'uploads/Red_rose.jpg', NULL, NULL),
(16, 'Yellow Lily 8', 2, 3000, 'yellow like banana minion hehe', 10, 'uploads/yellow_lily.jpg', NULL, NULL);

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
(1, 'rose', NULL, NULL),
(2, 'lily', NULL, NULL);

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
(1, 'member', 'a@a', 'aa', '$2y$10$qYU9sBfo/UbcuwKw.FBIL.UJxWqQOJd/eZL1Nr1UCLFmthABcb5I.', '12345678', 'male', 'aaaaaaaaaaaaaaaaaaaaaaaaaaa', 'uploads\\Red_rose.jpg', NULL, NULL, '2019-12-29 07:19:11', '2019-12-29 07:19:11');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart_histories`
--
ALTER TABLE `cart_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cart_items_histories`
--
ALTER TABLE `cart_items_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `couriers`
--
ALTER TABLE `couriers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `flowers`
--
ALTER TABLE `flowers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `flower_types`
--
ALTER TABLE `flower_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
