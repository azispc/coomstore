-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2019 at 01:48 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coomstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(12) NOT NULL,
  `id_kategori` int(12) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `merk_barang` varchar(50) NOT NULL,
  `spek_bar` varchar(50) NOT NULL,
  `harga_modal` int(50) NOT NULL,
  `jumlah_barang` int(50) NOT NULL,
  `harga_jual` int(50) NOT NULL,
  `ket_bar` text NOT NULL,
  `foto_bar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kat` int(12) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `ket_kat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pel` int(12) NOT NULL,
  `nama_pel` varchar(50) NOT NULL,
  `jk_pel` varchar(12) NOT NULL,
  `telp_pel` varchar(13) NOT NULL,
  `alamat_pel` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pel`, `nama_pel`, `jk_pel`, `telp_pel`, `alamat_pel`) VALUES
(1, 'azis', 'L', '83853295747', 'sumenep'),
(2, 'azis', 'L', '83853295747', 'sumenep');

-- --------------------------------------------------------

--
-- Table structure for table `rekam_service`
--

CREATE TABLE `rekam_service` (
  `id_rm` int(12) NOT NULL,
  `kode_service` varchar(20) NOT NULL,
  `id_pel` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id_service` int(12) NOT NULL,
  `id_rm` int(12) NOT NULL,
  `jenis_barang` varchar(12) NOT NULL,
  `merk_barang` varchar(50) NOT NULL,
  `type_barang` varchar(50) NOT NULL,
  `kelengkapan_barang` varchar(50) NOT NULL,
  `status_kelengkapan` varchar(50) NOT NULL,
  `kerusakan_barang` varchar(50) NOT NULL,
  `tgl_masuk` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `rincian_harga` double NOT NULL,
  `status_service` varchar(10) NOT NULL,
  `harga_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kat`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pel`);

--
-- Indexes for table `rekam_service`
--
ALTER TABLE `rekam_service`
  ADD PRIMARY KEY (`id_rm`),
  ADD KEY `id_pel` (`id_pel`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id_service`),
  ADD KEY `id_pelanggan` (`id_rm`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kat` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pel` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rekam_service`
--
ALTER TABLE `rekam_service`
  MODIFY `id_rm` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id_service` int(12) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kat`);

--
-- Constraints for table `rekam_service`
--
ALTER TABLE `rekam_service`
  ADD CONSTRAINT `rekam_service_ibfk_1` FOREIGN KEY (`id_pel`) REFERENCES `pelanggan` (`id_pel`);

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`id_rm`) REFERENCES `rekam_service` (`id_rm`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
