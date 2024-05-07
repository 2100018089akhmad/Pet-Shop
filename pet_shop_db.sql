-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 18 Apr 2024 pada 15.47
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pet_shop_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Food', 'Sample Description', 1, '2021-06-21 10:17:41'),
(4, 'Accessories', '&lt;p&gt;Sample Category&lt;/p&gt;', 1, '2021-06-21 16:34:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(2, 'Muhmmad ', 'hasfar', 'Male', '082134420013', 'hasfar@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'DIY', '2024-04-18 20:02:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `unit` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `size` varchar(250) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `unit`, `price`, `size`, `date_created`, `date_updated`) VALUES
(1, 1, 50, 'pcs', 250000, 'M', '2021-06-21 13:01:30', '2024-04-18 20:34:33'),
(2, 1, 20, 'Sample', 300000, 'L', '2021-06-21 13:07:00', '2024-04-18 20:34:27'),
(3, 4, 150, 'pcs', 500000, 'M', '2021-06-21 16:50:37', '2024-04-18 20:34:19'),
(4, 3, 50, 'pack', 150000, 'M', '2021-06-21 16:51:12', '2024-04-18 20:34:11'),
(5, 5, 30, 'pcs', 50000, 'M', '2021-06-21 16:51:35', '2024-04-18 20:34:04'),
(6, 4, 10, 'pcs', 550000, 'L', '2021-06-21 16:51:54', '2024-04-18 20:33:45'),
(7, 6, 100, 'pcs', 150000, 'S', '2021-06-22 15:50:47', '2024-04-18 20:33:27'),
(8, 6, 150, 'pcs', 180000, 'M', '2021-06-22 15:51:13', '2024-04-18 20:33:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(4, 2, 'DIY', 'cod', 250, 1, 0, '2024-04-18 20:27:28', '2024-04-18 20:27:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `size` varchar(20) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `size`, `unit`, `quantity`, `price`, `total`) VALUES
(5, 4, 1, 'M', 'pcs', 1, 250, 250);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `product_name`, `description`, `status`, `date_created`) VALUES
(1, 1, 1, 'Dog Food 101', '&lt;p&gt;Sample Product&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dolor felis, mattis sit amet turpis eu, porta efficitur arcu. Ut orci est, posuere a mi sed, sollicitudin volutpat nisl. Vestibulum aliquam condimentum dictum. Sed a lobortis dolor, nec molestie nulla. Quisque purus justo, fermentum sed commodo in, hendrerit non nisi. In eleifend diam at pellentesque tempor. Mauris a augue ultrices, vulputate ipsum ac, lobortis eros. Nulla tempor odio sit amet magna finibus dignissim vitae eu turpis.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Proin nec semper nisi. Aenean varius purus at eros aliquam, non luctus eros interdum. Etiam non nisl ut lacus semper ornare sed iaculis justo. Mauris justo mauris, faucibus sit amet pharetra at, accumsan quis felis. Nulla gravida elementum porttitor. Vestibulum blandit semper ligula sit amet laoreet. Aliquam a est consectetur, blandit odio ultricies, finibus enim. Sed gravida pretium elit, et bibendum est dignissim sed. Aliquam ultrices felis a arcu feugiat, vel porta neque luctus. Vivamus dignissim porttitor nulla, non pulvinar nulla blandit a. Sed nisi leo, volutpat in nibh sit amet, laoreet semper massa.&lt;/p&gt;', 1, '2021-06-21 11:19:31'),
(3, 1, 3, 'Cat Food 101', '&lt;p&gt;Cat Food 101&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Sed interdum odio a efficitur volutpat. Etiam porta erat ut quam feugiat iaculis. Nam tincidunt sem metus, quis mattis nisl iaculis id. Aliquam vehicula auctor facilisis. Etiam tincidunt id velit sed pulvinar. Mauris mi est, varius in mauris ut, rhoncus congue nisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Fusce mollis arcu mauris, tempor fermentum odio vehicula nec. Morbi sit amet dui mollis, sodales dolor vel, efficitur tortor. Nam vel pretium lectus. Morbi ultricies magna eget libero bibendum posuere. Ut ultrices tellus ac enim egestas feugiat.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Mauris faucibus, erat porta auctor porttitor, ligula leo ornare sem, eu dignissim diam massa a purus. Praesent et faucibus metus. Nulla iaculis enim nec efficitur consectetur. Sed vehicula purus neque, quis luctus odio varius non. Sed hendrerit leo et velit ultricies, eget venenatis elit ornare. Pellentesque nec tincidunt nunc. Donec fringilla tristique lectus, vitae malesuada massa mollis ut. Nulla eleifend ac ligula vel rutrum.&lt;/p&gt;', 1, '2021-06-21 16:48:16'),
(4, 4, 4, 'Dog bed', '&lt;p&gt;Sample&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;text-align: justify;&quot;&gt;Proin nec semper nisi. Aenean varius purus at eros aliquam, non luctus eros interdum. Etiam non nisl ut lacus semper ornare sed iaculis justo. Mauris justo mauris, faucibus sit amet pharetra at, accumsan quis felis. Nulla gravida elementum porttitor. Vestibulum blandit semper ligula sit amet laoreet. Aliquam a est consectetur, blandit odio ultricies, finibus enim. Sed gravida pretium elit, et bibendum est dignissim sed. Aliquam ultrices felis a arcu feugiat, vel porta neque luctus. Vivamus dignissim porttitor nulla, non pulvinar nulla blandit a. Sed nisi leo, volutpat in nibh sit amet, laoreet semper massa.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-06-21 16:49:07'),
(5, 4, 5, 'Cat  Plates 623', '&lt;p&gt;&lt;span style=&quot;text-align: justify;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dolor felis, mattis sit amet turpis eu, porta efficitur arcu. Ut orci est, posuere a mi sed, sollicitudin volutpat nisl. Vestibulum aliquam condimentum dictum. Sed a lobortis dolor, nec molestie nulla. Quisque purus justo, fermentum sed commodo in, hendrerit non nisi. In eleifend diam at pellentesque tempor. Mauris a augue ultrices, vulputate ipsum ac, lobortis eros. Nulla tempor odio sit amet magna finibus dignissim vitae eu turpis.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-06-21 16:50:11'),
(6, 4, 4, 'Dog Belt', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dui nulla, tincidunt in arcu at, vulputate volutpat velit. Quisque volutpat gravida erat, gravida porttitor magna malesuada sed. Curabitur massa est, ullamcorper a diam vitae, tincidunt sagittis justo. Nam eu orci ligula. Duis ullamcorper dui at nisi consequat, sed suscipit sapien lacinia. Praesent ut lacus id arcu bibendum egestas. Cras ullamcorper dictum mi, non commodo mauris iaculis a. Pellentesque porta sem id dapibus tincidunt. Aenean metus tellus, efficitur ut feugiat in, euismod et arcu. In pharetra, dolor in fermentum facilisis, metus urna lacinia metus, in maximus justo tellus et tortor. Nam pulvinar eu enim auctor pellentesque.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Nam ut quam velit. Suspendisse commodo non urna nec dictum. Pellentesque eget enim id velit bibendum auctor vel id lectus. Maecenas dolor nibh, ultricies eget metus vel, efficitur varius tellus. Donec semper eros sit amet urna bibendum scelerisque. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer cursus est in sapien sodales, quis pulvinar nisl aliquet. Pellentesque blandit diam lobortis pulvinar ornare. Sed venenatis imperdiet massa, ut mollis sapien sagittis a. Nulla dignissim ultrices metus a mattis. Nunc egestas mattis nisl at posuere. Donec malesuada ut justo sed aliquam. Sed venenatis sit amet tortor et semper. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus sit amet massa at massa malesuada volutpat quis nec libero.&lt;/p&gt;', 1, '2021-06-22 15:50:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(4, 4, 250, '2024-04-18 20:27:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sizes`
--

CREATE TABLE `sizes` (
  `id` int(30) NOT NULL,
  `size` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sizes`
--

INSERT INTO `sizes` (`id`, `size`) VALUES
(1, 'xs'),
(2, 's'),
(3, 'm'),
(4, 'l'),
(5, 'xl'),
(6, 'None');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(1, 1, 'Dog Food', '&lt;p&gt;Sample only&lt;/p&gt;', 1, '2021-06-21 10:58:32'),
(3, 1, 'Cat Food', '&lt;p&gt;Sample&lt;/p&gt;', 1, '2021-06-21 16:34:59'),
(4, 4, 'Dog Needs', '&lt;p&gt;Sample&amp;nbsp;&lt;/p&gt;', 1, '2021-06-21 16:35:26'),
(5, 4, 'Cat Needs', '&lt;p&gt;Sample&lt;/p&gt;', 1, '2021-06-21 16:35:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'DNR'),
(6, 'short_name', 'DNR Pet shop'),
(11, 'logo', 'uploads/1624240440_paw.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1624240440_banner1.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '202cb962ac59075b964b07152d234b70', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2024-04-18 20:00:45'),
(2, 'Muhammad ', 'Hasfar', 'am', '123', NULL, NULL, 0, '2024-04-18 20:32:08', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
