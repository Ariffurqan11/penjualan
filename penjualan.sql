-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 10, 2026 at 01:26 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `detil_pesan`
--

CREATE TABLE `detil_pesan` (
  `id_pesan` int NOT NULL,
  `id_produk` varchar(20) NOT NULL,
  `jumlah` int NOT NULL,
  `harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detil_pesan`
--

INSERT INTO `detil_pesan` (`id_pesan`, `id_produk`, `jumlah`, `harga`) VALUES
(1, 'PRD-001', 2, 72000),
(2, 'PRD-001', 2, 72000);

-- --------------------------------------------------------

--
-- Table structure for table `faktur`
--

CREATE TABLE `faktur` (
  `id_faktur` int NOT NULL,
  `id_pesan` int NOT NULL,
  `tgl_faktur` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `faktur`
--

INSERT INTO `faktur` (`id_faktur`, `id_pesan`, `tgl_faktur`) VALUES
(1, 1, '2026-10-27'),
(2, 2, '2026-10-27');

-- --------------------------------------------------------

--
-- Table structure for table `kuitansi`
--

CREATE TABLE `kuitansi` (
  `id_kuitansi` int NOT NULL,
  `id_faktur` int NOT NULL,
  `tgl_kuitansi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kuitansi`
--

INSERT INTO `kuitansi` (`id_kuitansi`, `id_faktur`, `tgl_kuitansi`) VALUES
(1, 1, '2026-10-27'),
(2, 2, '2026-10-27');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(20) NOT NULL,
  `nm_pelanggan` varchar(100) NOT NULL,
  `alamat` text,
  `telepon` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nm_pelanggan`, `alamat`, `telepon`, `email`) VALUES
('PEL-001', 'Pelanggan Umum (Cash)', 'Jl. Toko Utama No. 01', '081200000001', 'umum@tokokasir.id'),
('PEL-002', 'Budi Santoso', 'Jl. Merak No. 14, Bandung', '081234567890', 'budi.santoso@gmail.com'),
('PEL-003', 'Siti Rahmawati', 'Jl. Melati Blok C2, Jakarta', '085678912345', 'siti.rahma@yahoo.com'),
('PEL-004', 'Warung Berkah Bu Ani', 'Jl. Kenanga No. 88, Surabaya', '087811223344', 'berkah.ani@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id_pesan` int NOT NULL,
  `id_pelanggan` varchar(20) NOT NULL,
  `id_user` int NOT NULL,
  `tgl_pesan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pesan`
--

INSERT INTO `pesan` (`id_pesan`, `id_pelanggan`, `id_user`, `tgl_pesan`) VALUES
(1, 'PEL-001', 1, '2026-10-27'),
(2, 'PEL-001', 1, '2026-10-27');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` varchar(20) NOT NULL,
  `nm_produk` varchar(150) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `harga` double NOT NULL,
  `stock` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nm_produk`, `satuan`, `harga`, `stock`) VALUES
('PRD-001', 'Beras Ramos Super 5 Kg', 'Sak', 72000, 31),
('PRD-002', 'Minyak Goreng Sania 2 Liter', 'Pouch', 35000, 50),
('PRD-003', 'Gula Pasir Gulaku 1 Kg', 'Kg', 17500, 80),
('PRD-004', 'Indomie Goreng Spesial', 'Bungkus', 3100, 240),
('PRD-005', 'Kopi Kapal Api Special Mix 10x24g', 'Renceng', 15000, 60),
('PRD-006', 'Teh Celup Sosro Isi 25', 'Kotak', 7500, 95),
('PRD-007', 'Susu Kental Manis Frisian Flag', 'Kaleng', 12500, 45),
('PRD-008', 'Sabun Mandi Lifebuoy Total 10 85g', 'Pcs', 4500, 110),
('PRD-009', 'Shampoo Pantene 160ml', 'Botol', 24000, 30),
('PRD-010', 'Air Mineral Aqua 600ml', 'Botol', 3500, 150);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Kasir','Owner') NOT NULL DEFAULT 'Kasir'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `role`) VALUES
(1, 'Administrator Utama', 'admin', '0192023a7bbd73250516f069df18b500', 'Admin'),
(2, 'Kasir Toko 1', 'kasir', 'de28f8f7998f23ab4194b51a6029416f', 'Kasir'),
(3, 'Pemilik Toko', 'owner', '5be057accb25758101fa5eadbbd79503', 'Owner');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detil_pesan`
--
ALTER TABLE `detil_pesan`
  ADD PRIMARY KEY (`id_pesan`,`id_produk`),
  ADD KEY `fk_detil_produk` (`id_produk`);

--
-- Indexes for table `faktur`
--
ALTER TABLE `faktur`
  ADD PRIMARY KEY (`id_faktur`),
  ADD KEY `fk_faktur_pesan` (`id_pesan`);

--
-- Indexes for table `kuitansi`
--
ALTER TABLE `kuitansi`
  ADD PRIMARY KEY (`id_kuitansi`),
  ADD KEY `fk_kuitansi_faktur` (`id_faktur`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id_pesan`),
  ADD KEY `fk_pesan_pelanggan` (`id_pelanggan`),
  ADD KEY `fk_pesan_user` (`id_user`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detil_pesan`
--
ALTER TABLE `detil_pesan`
  ADD CONSTRAINT `fk_detil_pesan` FOREIGN KEY (`id_pesan`) REFERENCES `pesan` (`id_pesan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detil_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON UPDATE CASCADE;

--
-- Constraints for table `faktur`
--
ALTER TABLE `faktur`
  ADD CONSTRAINT `fk_faktur_pesan` FOREIGN KEY (`id_pesan`) REFERENCES `pesan` (`id_pesan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kuitansi`
--
ALTER TABLE `kuitansi`
  ADD CONSTRAINT `fk_kuitansi_faktur` FOREIGN KEY (`id_faktur`) REFERENCES `faktur` (`id_faktur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pesan`
--
ALTER TABLE `pesan`
  ADD CONSTRAINT `fk_pesan_pelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pesan_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
