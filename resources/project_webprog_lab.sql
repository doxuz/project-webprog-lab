-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2019 at 09:24 AM
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
(25, 11, NULL, 65000, '2019-12-31 01:22:22', '2019-12-31 01:22:22');

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
(11, '2019-12-31 08:09:15', 11, 5, 80000, '2019-12-31 01:09:15', '2019-12-31 01:09:15'),
(12, '2019-12-31 08:20:24', 14, 6, 180000, '2019-12-31 01:20:24', '2019-12-31 01:20:24');

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
(11, 25, 19, 1, '2019-12-31 01:22:22', '2019-12-31 01:22:22'),
(12, 25, 20, 1, '2019-12-31 01:22:24', '2019-12-31 01:22:24'),
(13, 25, 21, 1, '2019-12-31 01:22:25', '2019-12-31 01:22:25');

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
(1, 11, 20, 2, '2019-12-31 01:09:15', '2019-12-31 01:09:15'),
(2, 11, 21, 1, '2019-12-31 01:09:15', '2019-12-31 01:09:15'),
(3, 11, 19, 1, '2019-12-31 01:09:15', '2019-12-31 01:09:15'),
(4, 12, 42, 1, '2019-12-31 01:20:24', '2019-12-31 01:20:24'),
(5, 12, 24, 1, '2019-12-31 01:20:24', '2019-12-31 01:20:24'),
(6, 12, 27, 1, '2019-12-31 01:20:24', '2019-12-31 01:20:24'),
(7, 12, 39, 3, '2019-12-31 01:20:24', '2019-12-31 01:20:24');

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
(5, 'JNE', 9000, '2019-12-31 01:06:01', '2019-12-31 01:06:01'),
(6, 'Wahana', 5000, '2019-12-31 01:06:10', '2019-12-31 01:06:10'),
(7, 'J&T', 8000, '2019-12-31 01:06:19', '2019-12-31 01:06:19');

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
(19, 'Rose 1', 5, 20000, 'A flower with crimson red dress.', 8, 'uploads\\Red_rose.jpg', '2019-12-31 00:54:48', '2019-12-31 01:22:22'),
(20, 'Lily 1', 6, 15000, 'Its me! Your favorite yellow flower!', 12, 'uploads\\yellow_lily.jpg', '2019-12-31 00:58:13', '2019-12-31 01:22:24'),
(21, 'Iris 1', 8, 30000, 'Once in a blue moon, I bloom.', 3, 'uploads\\iris.jpg', '2019-12-31 00:58:40', '2019-12-31 01:22:25'),
(22, 'Rose 2', 5, 20000, 'A flower with crimson red dress.', 10, 'uploads\\Red_rose.jpg', '2019-12-31 00:54:48', '2019-12-31 00:54:48'),
(23, 'Lily 2', 6, 15000, 'Its me! Your favorite yellow flower!', 15, 'uploads\\yellow_lily.jpg', '2019-12-31 00:58:13', '2019-12-31 00:58:13'),
(24, 'Iris 2', 8, 30000, 'Once in a blue moon, I bloom.', 4, 'uploads\\iris.jpg', '2019-12-31 00:58:40', '2019-12-31 01:19:48'),
(25, 'Rose 3', 5, 20000, 'A flower with crimson red dress.', 10, 'uploads\\Red_rose.jpg', '2019-12-31 00:54:48', '2019-12-31 00:54:48'),
(26, 'Lily 3', 6, 15000, 'Its me! Your favorite yellow flower!', 15, 'uploads\\yellow_lily.jpg', '2019-12-31 00:58:13', '2019-12-31 00:58:13'),
(27, 'Iris 3', 8, 30000, 'Once in a blue moon, I bloom.', 4, 'uploads\\iris.jpg', '2019-12-31 00:58:40', '2019-12-31 01:19:51'),
(28, 'Rose 4', 5, 20000, 'A flower with crimson red dress.', 10, 'uploads\\Red_rose.jpg', '2019-12-31 00:54:48', '2019-12-31 00:54:48'),
(29, 'Lily 4', 6, 15000, 'Its me! Your favorite yellow flower!', 15, 'uploads\\yellow_lily.jpg', '2019-12-31 00:58:13', '2019-12-31 00:58:13'),
(30, 'Iris 4', 8, 30000, 'Once in a blue moon, I bloom.', 5, 'uploads\\iris.jpg', '2019-12-31 00:58:40', '2019-12-31 00:58:40'),
(31, 'Rose 5', 5, 20000, 'A flower with crimson red dress.', 10, 'uploads\\Red_rose.jpg', '2019-12-31 00:54:48', '2019-12-31 00:54:48'),
(32, 'Lily 5', 6, 15000, 'Its me! Your favorite yellow flower!', 15, 'uploads\\yellow_lily.jpg', '2019-12-31 00:58:13', '2019-12-31 00:58:13'),
(33, 'Iris 5', 8, 30000, 'Once in a blue moon, I bloom.', 5, 'uploads\\iris.jpg', '2019-12-31 00:58:40', '2019-12-31 00:58:40'),
(34, 'Rose 6', 5, 20000, 'A flower with crimson red dress.', 10, 'uploads\\Red_rose.jpg', '2019-12-31 00:54:48', '2019-12-31 00:54:48'),
(35, 'Lily 6', 6, 15000, 'Its me! Your favorite yellow flower!', 15, 'uploads\\yellow_lily.jpg', '2019-12-31 00:58:13', '2019-12-31 00:58:13'),
(36, 'Iris 6', 8, 30000, 'Once in a blue moon, I bloom.', 5, 'uploads\\iris.jpg', '2019-12-31 00:58:40', '2019-12-31 00:58:40'),
(37, 'Rose 7', 5, 20000, 'A flower with crimson red dress.', 10, 'uploads\\Red_rose.jpg', '2019-12-31 00:54:48', '2019-12-31 00:54:48'),
(38, 'Lily 7', 6, 15000, 'Its me! Your favorite yellow flower!', 15, 'uploads\\yellow_lily.jpg', '2019-12-31 00:58:13', '2019-12-31 00:58:13'),
(39, 'Iris 7', 8, 30000, 'Once in a blue moon, I bloom.', 2, 'uploads\\iris.jpg', '2019-12-31 00:58:40', '2019-12-31 01:20:15'),
(40, 'Rose 8', 5, 20000, 'A flower with crimson red dress.', 10, 'uploads\\Red_rose.jpg', '2019-12-31 00:54:48', '2019-12-31 00:54:48'),
(41, 'Lily 8', 6, 15000, 'Its me! Your favorite yellow flower!', 15, 'uploads\\yellow_lily.jpg', '2019-12-31 00:58:13', '2019-12-31 00:58:13'),
(42, 'Iris 8', 8, 30000, 'Once in a blue moon, I bloom.', 4, 'uploads\\iris.jpg', '2019-12-31 00:58:40', '2019-12-31 01:19:40');

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
(5, 'Rose', '2019-12-31 00:50:49', '2019-12-31 00:51:44'),
(6, 'Lily', '2019-12-31 00:50:59', '2019-12-31 00:50:59'),
(8, 'Iris', '2019-12-31 00:51:55', '2019-12-31 00:51:55');

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
(11, 'admin', 'admin@example.com', 'Admin', '$2y$10$M4yQpTNusGgHQFMfR8fxLenagqMsE5Ipqs7hhgONg3luy/YG.SDTW', '12345678', 'male', 'New Bahamas 24 Street.', 'uploads\\profile.png', NULL, 'jbfa0KPBJDTC5g0pKZiKoDh6g9wC82fd1zuWYYdBOA7r7OP84rgMPPwucpux', '2019-12-31 00:46:52', '2019-12-31 01:15:04'),
(13, 'member', 'jacob@email.com', 'Jacob', '$2y$10$D5YmzsdmZR9reGm77lg06.S1MV1yocc9xki4gqj7e7Ke2.lIAZJLm', '0812222222', 'male', 'Jacob Street 24 Dotonbori', 'uploads\\profile.png', NULL, NULL, '2019-12-31 01:18:20', '2019-12-31 01:18:20'),
(14, 'member', 'jayz@email.com', 'Jayz', '$2y$10$sv1hrufzqm8aQJosCNJ4euVbv74.UmDwsCZItY88//nKWYl8cRTPa', '12312123213', 'male', 'New Kids, California, USA', 'uploads\\profile.png', NULL, NULL, '2019-12-31 01:19:28', '2019-12-31 01:19:28');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `cart_histories`
--
ALTER TABLE `cart_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `cart_items_histories`
--
ALTER TABLE `cart_items_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `couriers`
--
ALTER TABLE `couriers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `flowers`
--
ALTER TABLE `flowers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `flower_types`
--
ALTER TABLE `flower_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
