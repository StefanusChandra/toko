-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2022 at 06:55 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imk`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga_beli` varchar(100) NOT NULL,
  `harga_jual` varchar(100) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `id_kategori`, `stok`, `harga_beli`, `harga_jual`, `date_added`) VALUES
(14, 'Aerobite', 1, 20, '115000', '120000', '2022-07-04 04:53:43'),
(15, 'BG65', 1, 25, '65000', '70000', '2022-07-04 04:54:41'),
(16, 'BG65 TI', 1, 22, '85000', '90000', '2022-07-04 04:55:23'),
(17, 'BG66', 1, 30, '75000', '80000', '2022-07-04 04:56:44'),
(18, 'BG66 Brilliant', 1, 23, '75000', '80000', '2022-07-04 04:57:58'),
(19, 'BG66 Force', 1, 25, '80000', '95000', '2022-07-04 04:58:59'),
(20, 'BG66 Ultimax', 1, 30, '110000', '115000', '2022-07-04 05:00:25'),
(21, 'BG6', 1, 34, '55000', '60000', '2022-07-04 05:59:30'),
(22, 'No.3 Boost', 2, 15, '80000', '85000', '2022-07-04 05:05:54'),
(23, 'No.1 Boost', 2, 20, '70000', '75000', '2022-07-04 05:07:14'),
(24, 'No.1', 2, 15, '60000', '65000', '2022-07-04 05:08:14'),
(25, 'No.7 Boost', 2, 15, '65000', '70000', '2022-07-04 05:51:02'),
(26, 'No.7', 2, 13, '62000', '68000', '2022-07-04 05:52:41'),
(27, 'No.5', 2, 12, '60000', '75000', '2022-07-04 05:54:52');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Yonex'),
(2, 'Li-Ning');

-- --------------------------------------------------------

--
-- Table structure for table `sub_transaksi`
--

CREATE TABLE `sub_transaksi` (
  `id_subtransaksi` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `total_harga` varchar(20) NOT NULL,
  `no_invoice` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_transaksi`
--

INSERT INTO `sub_transaksi` (`id_subtransaksi`, `id_barang`, `id_transaksi`, `jumlah_beli`, `total_harga`, `no_invoice`) VALUES
(19, 6, 15, 2, '460000', '15/AF/4/18/07/57/25'),
(20, 8, 15, 1, '450000', '15/AF/4/18/07/57/25'),
(21, 21, 16, 1, '60000', '04/AF/2/22/07/59/38');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tgl_transaksi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `kode_kasir` int(11) NOT NULL,
  `total_bayar` varchar(20) NOT NULL,
  `no_invoice` varchar(20) NOT NULL,
  `nama_pembeli` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tgl_transaksi`, `kode_kasir`, `total_bayar`, `no_invoice`, `nama_pembeli`) VALUES
(15, '2018-01-15 06:57:25', 4, '910000', '15/AF/4/18/07/57/25', 'afiq'),
(16, '2022-07-04 05:59:38', 2, '60000', '04/AF/2/22/07/59/38', 'Aji');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `status` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `status`, `date_created`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, '2017-12-12 00:44:45'),
(2, 'kasir', '8691e4fc53b99da544ce86e22acba62d13352eff', 2, '2017-12-17 09:52:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `sub_transaksi`
--
ALTER TABLE `sub_transaksi`
  ADD PRIMARY KEY (`id_subtransaksi`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sub_transaksi`
--
ALTER TABLE `sub_transaksi`
  MODIFY `id_subtransaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
