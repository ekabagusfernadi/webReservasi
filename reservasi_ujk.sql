-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2021 at 04:56 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reservasi_ujk`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_menu`
--

CREATE TABLE `data_menu` (
  `id_menu` int(10) UNSIGNED NOT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `harga` int(50) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_menu`
--

INSERT INTO `data_menu` (`id_menu`, `nama_menu`, `harga`) VALUES
(1, 'Mie Ayam', 10000),
(2, 'Bakso', 5000),
(4, 'Nasi Goreng', 10000),
(5, 'Indomie Special', 6000),
(6, 'Seprit', 5000),
(7, 'Es Teh', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `data_reservasi`
--

CREATE TABLE `data_reservasi` (
  `kode_reservasi` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tanggal_daftar` date DEFAULT current_timestamp(),
  `total_harga` int(50) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_reservasi`
--

INSERT INTO `data_reservasi` (`kode_reservasi`, `nama`, `tanggal_daftar`, `total_harga`) VALUES
('202106230001', 'Bocil', '2021-06-23', 15000),
('202106230002', 'Usmane', '2021-06-23', 25000),
('202106240001', 'kucing', '2021-06-24', 20000),
('202106240002', 'Arman', '2021-06-24', 0),
('202106250001', 'kijangcitys-desu', '2021-06-25', 0),
('202106250002', 'percubaan', '2021-06-25', 0),
('202106250003', 'saya kijang', '2021-06-25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(10) UNSIGNED NOT NULL,
  `kode_reservasi` varchar(50) NOT NULL,
  `id_menu` int(10) UNSIGNED NOT NULL,
  `nama_menu_saat_ini` varchar(100) NOT NULL,
  `jumlah_pesanan` int(10) UNSIGNED NOT NULL,
  `harga_saat_ini` int(50) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `kode_reservasi`, `id_menu`, `nama_menu_saat_ini`, `jumlah_pesanan`, `harga_saat_ini`) VALUES
(57, '202106230001', 1, 'Mie Ayam', 1, 10000),
(58, '202106230001', 6, 'Seprit', 1, 5000),
(59, '202106230002', 2, 'Bakso', 2, 5000),
(60, '202106230002', 6, 'Seprit', 3, 5000),
(61, '202106240001', 1, 'Mie Ayam', 2, 10000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_menu`
--
ALTER TABLE `data_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `data_reservasi`
--
ALTER TABLE `data_reservasi`
  ADD PRIMARY KEY (`kode_reservasi`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `kode_reservasi` (`kode_reservasi`),
  ADD KEY `id_menu` (`id_menu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_menu`
--
ALTER TABLE `data_menu`
  MODIFY `id_menu` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `data_menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`kode_reservasi`) REFERENCES `data_reservasi` (`kode_reservasi`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
