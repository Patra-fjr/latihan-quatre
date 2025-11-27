-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2025 at 02:54 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_resto`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `jabatan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `email`, `username`, `password`, `jabatan`) VALUES
('ad262', 'Asep', 'asep@gmail.com', 'aassep', '$2y$10$LVCsV9OwKCd8U8RQeNYWB.tngJwF/6JuY.tilgDJzFQHQkpBqmhoC', 'staff'),
('ad397', 'Taufik', 'taufik@gmail.com', 'Fiksa', '$2y$10$JxJB0AmnR1iY3NOjuEe7XO29FlOkp9XwwCJ9QyGKO1h3F.2mhtwLS', 'Owner'),
('ad532', 'Nissa', 'Nissa@gmail.com', 'nissa', '$2y$10$D3XaBnYKF7JvjC0E/kusWOU6rAs1zyFTAHpbDnHcQpwgJmNIyijxi', 'Owner'),
('ad556', 'Nina', 'Nina@gmail.com', 'nina01', '$2y$10$7up54HTFAES3UhZo5cRdP.pPzRHSRLfaHNYaqBf51Zqt0Aed/u5aq', 'Staff'),
('ad818', 'Dudi', 'dudi@gmail.com', 'dud', '$2y$10$5jdRGlPUTbhYSAjV0geLQO6zv39SZ6UbNK8dKoOTYnMUAA0mPf.pi', 'Staff'),
('ad934', 'Putra', 'putra@gmail.com', 'Kecoaterbang', '$2y$10$pRKI8AltV2eykxuulOQXqeuGafFhv0MddveWra.FrR80HxwNRYc7C', 'Staff'),
('ad977', 'Aufar', 'aufar@gmail.com', 'Pacz', '$2y$10$g9YcF6e/BtQKFj0e72Bq5uzBB/7Kv9iA3RMypGsiNOgU5639vrp9i', 'Staff');

-- --------------------------------------------------------

--
-- Table structure for table `detail_orders`
--

CREATE TABLE `detail_orders` (
  `id_detailorder` int(11) NOT NULL,
  `id_order` varchar(10) NOT NULL,
  `id_menu` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_orders`
--

INSERT INTO `detail_orders` (`id_detailorder`, `id_order`, `id_menu`, `quantity`, `subtotal`) VALUES
(8, 'ORD68f5074', 'menu005', 2, 52000.00),
(9, 'ORD68f521e', 'menu002', 2, 66000.00),
(10, 'ORD68f58ec', 'menu005', 2, 52000.00),
(11, 'ORD68f593b', 'menu003', 1, 33000.00),
(12, 'ORD68f5948', 'menu002', 1, 33000.00),
(13, 'ORD68f5948', 'menu009', 1, 27000.00),
(14, 'ORD68f59b4', 'menu007', 1, 15000.00),
(15, 'ORD68f59b4', 'menu004', 1, 33000.00),
(16, 'ORD6919316', 'menu002', 1, 33000.00);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` varchar(10) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `status_kategori` enum('tersedia','tidak tersedia') NOT NULL DEFAULT 'tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `status_kategori`) VALUES
('kat001', 'makanan', 'tersedia'),
('kat002', 'minuman', 'tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `meja`
--

CREATE TABLE `meja` (
  `id_meja` varchar(10) NOT NULL,
  `nomor_meja` int(11) NOT NULL,
  `status_meja` enum('tersedia','tidak tersedia') NOT NULL DEFAULT 'tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meja`
--

INSERT INTO `meja` (`id_meja`, `nomor_meja`, `status_meja`) VALUES
('tab001', 1, 'tersedia'),
('tab002', 2, 'tersedia'),
('tab003', 3, 'tersedia'),
('tab004', 4, 'tersedia'),
('tab005', 5, 'tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` varchar(10) NOT NULL,
  `id_kategori` varchar(10) NOT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `status_menu` enum('tersedia','tidak tersedia') NOT NULL DEFAULT 'tersedia',
  `gambar` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `id_kategori`, `nama_menu`, `harga`, `status_menu`, `gambar`, `deskripsi`, `created_at`) VALUES
('menu002', 'kat001', ' Margherita Pizza', 33000.00, 'tersedia', '68f5061ab3435-Gemini_Generated_Image_pxdikypxdikypxdi.png', '', '2025-10-19 02:18:13'),
('menu003', 'kat001', 'Lasagna', 33000.00, 'tersedia', '68f506479b116-Gemini_Generated_Image_pxdikypxdikypxdi (1).png', '', '2025-10-19 02:18:13'),
('menu004', 'kat001', 'Risotto ai Funghi', 33000.00, 'tersedia', '68f5067d01442-Gemini_Generated_Image_pxdikypxdikypxdi (2).png', '', '2025-10-19 02:18:13'),
('menu005', 'kat001', 'Gnocchi al Pesto', 26000.00, 'tersedia', '68f5069be413e-Gemini_Generated_Image_pxdikypxdikypxdi (3).png', '', '2025-10-19 02:18:13'),
('menu006', 'kat002', 'Espresso', 15000.00, 'tersedia', '68f506cf5e74f-Gemini_Generated_Image_pxdikypxdikypxdi (5).png', 'Espresso', '2025-10-19 02:18:13'),
('menu007', 'kat002', 'Cappuccino', 15000.00, 'tersedia', '68f506e279dff-Gemini_Generated_Image_pxdikypxdikypxdi (6).png', '', '2025-10-19 02:18:13'),
('menu008', 'kat002', 'Limoncello', 26000.00, 'tersedia', '68f506f86c97a-Gemini_Generated_Image_pxdikypxdikypxdi (7).png', '', '2025-10-19 02:18:13'),
('menu009', 'kat002', 'Aperol Spritz', 27000.00, 'tersedia', '68f5070c94059-Gemini_Generated_Image_pxdikypxdikypxdi (7).png', '', '2025-10-19 02:18:13'),
('menu011', 'kat001', 'Tiramisu', 20000.00, 'tersedia', '68f506bb28c06-Gemini_Generated_Image_pxdikypxdikypxdi (4).png', '', '2025-10-19 02:18:13');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id_order` varchar(10) NOT NULL,
  `id_meja` varchar(10) NOT NULL,
  `nama_customer` varchar(100) NOT NULL,
  `nomor_telepon` varchar(20) DEFAULT NULL,
  `tanggal_order` date NOT NULL,
  `waktu_order` time NOT NULL,
  `total_harga` decimal(10,2) NOT NULL,
  `status_order` enum('selesai','proses') NOT NULL DEFAULT 'proses'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id_order`, `id_meja`, `nama_customer`, `nomor_telepon`, `tanggal_order`, `waktu_order`, `total_harga`, `status_order`) VALUES
('ORD68f5074', 'tab002', 'Taufik', '', '2025-10-19', '17:44:09', 57200.00, 'selesai'),
('ORD68f521e', 'tab002', 'Ucup', '', '2025-10-19', '19:37:43', 72600.00, 'selesai'),
('ORD68f58ec', 'tab001', 'Bagas', '085281690957', '2025-10-20', '03:22:13', 57200.00, 'selesai'),
('ORD68f593b', 'tab003', 'P', '082314567890', '2025-10-20', '03:43:12', 36300.00, 'selesai'),
('ORD68f5948', 'tab003', 'PATRA', '098765124356', '2025-10-20', '03:46:44', 66000.00, 'selesai'),
('ORD68f59b4', 'tab001', 'uta', '082399189223', '2025-10-20', '04:15:31', 52800.00, 'selesai'),
('ORD6919316', 'tab003', 'Zikra', '', '2025-11-16', '03:05:28', 36300.00, 'selesai');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(10) NOT NULL,
  `id_order` varchar(10) NOT NULL,
  `id_admin` varchar(10) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  `waktu_transaksi` time DEFAULT NULL,
  `metode_transaksi` enum('Cash','Transfer') DEFAULT NULL,
  `status_transaksi` enum('Selesai','Belum Bayar') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_order`, `id_admin`, `tanggal_transaksi`, `waktu_transaksi`, `metode_transaksi`, `status_transaksi`) VALUES
('tr18017609', 'ORD68f5948', 'ad262', '2025-10-20', '04:24:58', 'Transfer', 'Selesai'),
('tr25317609', 'ORD68f593b', 'ad397', '2025-10-20', '03:45:03', '', 'Selesai'),
('tr34617608', 'ORD68f521e', 'ad397', '2025-10-19', '19:38:47', 'Transfer', 'Selesai'),
('tr40717608', 'ORD68f5074', 'ad397', '2025-10-19', '18:06:52', '', 'Selesai'),
('tr75017632', 'ORD6919316', 'ad397', '2025-11-16', '03:05:55', '', 'Selesai'),
('tr77017609', 'ORD68f58ec', 'ad397', '2025-10-20', '03:23:12', '', 'Selesai'),
('tr96817609', 'ORD68f59b4', 'ad262', '2025-10-20', '04:24:14', 'Transfer', 'Selesai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `detail_orders`
--
ALTER TABLE `detail_orders`
  ADD PRIMARY KEY (`id_detailorder`),
  ADD KEY `fk_id_order` (`id_order`),
  ADD KEY `fk_id_menu` (`id_menu`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `meja`
--
ALTER TABLE `meja`
  ADD PRIMARY KEY (`id_meja`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `fk_id_kategori` (`id_kategori`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `fk_id_meja` (`id_meja`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD UNIQUE KEY `id_order` (`id_order`),
  ADD KEY `fk_id_admin` (`id_admin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_orders`
--
ALTER TABLE `detail_orders`
  MODIFY `id_detailorder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_orders`
--
ALTER TABLE `detail_orders`
  ADD CONSTRAINT `fk_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_order` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_id_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_id_meja` FOREIGN KEY (`id_meja`) REFERENCES `meja` (`id_meja`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_id_admin` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transaksi_order` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
