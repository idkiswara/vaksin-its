-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2021 at 06:38 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vaksin-its`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar-vaksinasi`
--

CREATE TABLE `daftar-vaksinasi` (
  `id_daftar_vaksinasi` int(11) NOT NULL,
  `id_vaksinasi` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detil-vaksinasi`
--

CREATE TABLE `detil-vaksinasi` (
  `id_detil_vaksin` int(11) NOT NULL,
  `id_vaksinator` int(11) NOT NULL,
  `id_vaksinasi` int(11) NOT NULL,
  `kode_vaksin` int(11) NOT NULL,
  `pendaftaran_start` date NOT NULL,
  `pendaftaran_finish` date NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `kuota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `master-pegawai`
--

CREATE TABLE `master-pegawai` (
  `id_pegawai` int(2) NOT NULL,
  `nama_pegawai` varchar(255) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan','','') NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nip/npp` varchar(16) NOT NULL,
  `golongan_darah` enum('A','B','O','AB') NOT NULL,
  `nomor_hp` varchar(12) NOT NULL,
  `status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master-pegawai`
--

INSERT INTO `master-pegawai` (`id_pegawai`, `nama_pegawai`, `nik`, `jenis_kelamin`, `tanggal_lahir`, `nip/npp`, `golongan_darah`, `nomor_hp`, `status`) VALUES
(1, 'Ishack Dwi Kiswara', '3578031806950003', 'laki-laki', '1995-06-18', '1234567890123456', 'B', '08973260966', '1'),
(2, 'Criswinditia Putri', '3578031909950003', 'perempuan', '1995-09-19', '1234567890123456', 'B', '081803142133', '2');

-- --------------------------------------------------------

--
-- Table structure for table `master-penyelenggara`
--

CREATE TABLE `master-penyelenggara` (
  `id_penyelenggara` int(11) NOT NULL,
  `nama_penyelenggara` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master-penyelenggara`
--

INSERT INTO `master-penyelenggara` (`id_penyelenggara`, `nama_penyelenggara`) VALUES
(1, 'RSU Haji'),
(2, 'RRSAL');

-- --------------------------------------------------------

--
-- Table structure for table `master-vaksin-jenis`
--

CREATE TABLE `master-vaksin-jenis` (
  `kode_vaksin` int(2) NOT NULL,
  `nama_vaksin` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master-vaksin-jenis`
--

INSERT INTO `master-vaksin-jenis` (`kode_vaksin`, `nama_vaksin`) VALUES
(1, 'CoronaVac'),
(2, 'AstraZeneca');

-- --------------------------------------------------------

--
-- Table structure for table `master-vaksinasi-jadwal`
--

CREATE TABLE `master-vaksinasi-jadwal` (
  `id_vaksinasi` int(2) NOT NULL,
  `tanggal_vaksinasi` date NOT NULL,
  `kuota` int(11) NOT NULL,
  `jam_buka` time NOT NULL,
  `jam_tutup` time NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master-vaksinasi-jadwal`
--

INSERT INTO `master-vaksinasi-jadwal` (`id_vaksinasi`, `tanggal_vaksinasi`, `kuota`, `jam_buka`, `jam_tutup`, `status`) VALUES
(1, '2020-07-28', 500, '07:00:00', '12:00:00', 1),
(2, '2021-07-28', 500, '08:00:00', '12:00:00', 2),
(3, '2022-07-28', 100, '12:00:00', '15:00:00', 0),
(4, '2022-07-28', 100, '12:00:00', '15:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `master-vaksinator`
--

CREATE TABLE `master-vaksinator` (
  `id_vaksinator` int(11) NOT NULL,
  `nama_vaksinator` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat-kipi`
--

CREATE TABLE `riwayat-kipi` (
  `id_riwayat_kipi` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `gejala` varchar(255) NOT NULL,
  `tindakan` varchar(255) NOT NULL,
  `konsul_dokter` enum('Sudah','Belum','','') NOT NULL,
  `tanggal_kipi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat-vaksin`
--

CREATE TABLE `riwayat-vaksin` (
  `id_riwayat_vaksin` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `id_vaksinator` int(11) NOT NULL,
  `id_penyelenggara` int(11) NOT NULL,
  `status_kehadiran` enum('hadir','tidak_hadir','','') NOT NULL,
  `vaksinasi_ke` varchar(1) NOT NULL,
  `id_vaksinasi` int(11) NOT NULL,
  `tanggal_vaksin2` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar-vaksinasi`
--
ALTER TABLE `daftar-vaksinasi`
  ADD PRIMARY KEY (`id_daftar_vaksinasi`),
  ADD KEY `ID_VAKSINASI` (`id_vaksinasi`),
  ADD KEY `ID_PEGAWAI` (`id_pegawai`);

--
-- Indexes for table `detil-vaksinasi`
--
ALTER TABLE `detil-vaksinasi`
  ADD PRIMARY KEY (`id_detil_vaksin`),
  ADD KEY `id_detil_vaksin` (`id_detil_vaksin`),
  ADD KEY `id_vaksinasi` (`id_vaksinasi`),
  ADD KEY `id_vaksinator` (`id_vaksinator`),
  ADD KEY `kode_vaksin` (`kode_vaksin`);

--
-- Indexes for table `master-pegawai`
--
ALTER TABLE `master-pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `master-penyelenggara`
--
ALTER TABLE `master-penyelenggara`
  ADD PRIMARY KEY (`id_penyelenggara`),
  ADD KEY `id_penyelenggara` (`id_penyelenggara`);

--
-- Indexes for table `master-vaksin-jenis`
--
ALTER TABLE `master-vaksin-jenis`
  ADD PRIMARY KEY (`kode_vaksin`),
  ADD KEY `kode_vaksin` (`kode_vaksin`);

--
-- Indexes for table `master-vaksinasi-jadwal`
--
ALTER TABLE `master-vaksinasi-jadwal`
  ADD PRIMARY KEY (`id_vaksinasi`),
  ADD KEY `id_vaksinasi` (`id_vaksinasi`);

--
-- Indexes for table `master-vaksinator`
--
ALTER TABLE `master-vaksinator`
  ADD PRIMARY KEY (`id_vaksinator`),
  ADD KEY `id_vaksinator` (`id_vaksinator`);

--
-- Indexes for table `riwayat-kipi`
--
ALTER TABLE `riwayat-kipi`
  ADD PRIMARY KEY (`id_riwayat_kipi`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `riwayat-vaksin`
--
ALTER TABLE `riwayat-vaksin`
  ADD PRIMARY KEY (`id_riwayat_vaksin`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `id_vaksinator` (`id_vaksinator`),
  ADD KEY `id_penyelenggara` (`id_penyelenggara`),
  ADD KEY `id_pegawai_2` (`id_pegawai`),
  ADD KEY `id_vaksinasi` (`id_vaksinasi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar-vaksinasi`
--
ALTER TABLE `daftar-vaksinasi`
  MODIFY `id_daftar_vaksinasi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detil-vaksinasi`
--
ALTER TABLE `detil-vaksinasi`
  MODIFY `id_detil_vaksin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master-pegawai`
--
ALTER TABLE `master-pegawai`
  MODIFY `id_pegawai` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `master-penyelenggara`
--
ALTER TABLE `master-penyelenggara`
  MODIFY `id_penyelenggara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `master-vaksin-jenis`
--
ALTER TABLE `master-vaksin-jenis`
  MODIFY `kode_vaksin` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `master-vaksinasi-jadwal`
--
ALTER TABLE `master-vaksinasi-jadwal`
  MODIFY `id_vaksinasi` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `master-vaksinator`
--
ALTER TABLE `master-vaksinator`
  MODIFY `id_vaksinator` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `riwayat-kipi`
--
ALTER TABLE `riwayat-kipi`
  MODIFY `id_riwayat_kipi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `riwayat-vaksin`
--
ALTER TABLE `riwayat-vaksin`
  MODIFY `id_riwayat_vaksin` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar-vaksinasi`
--
ALTER TABLE `daftar-vaksinasi`
  ADD CONSTRAINT `daftar-vaksinasi_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `master-pegawai` (`id_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `daftar-vaksinasi_ibfk_2` FOREIGN KEY (`id_vaksinasi`) REFERENCES `master-vaksinasi-jadwal` (`id_vaksinasi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detil-vaksinasi`
--
ALTER TABLE `detil-vaksinasi`
  ADD CONSTRAINT `detil-vaksinasi_ibfk_1` FOREIGN KEY (`kode_vaksin`) REFERENCES `master-vaksin-jenis` (`kode_vaksin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detil-vaksinasi_ibfk_2` FOREIGN KEY (`id_vaksinator`) REFERENCES `master-vaksinator` (`id_vaksinator`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detil-vaksinasi_ibfk_3` FOREIGN KEY (`id_vaksinasi`) REFERENCES `master-vaksinasi-jadwal` (`id_vaksinasi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `riwayat-kipi`
--
ALTER TABLE `riwayat-kipi`
  ADD CONSTRAINT `riwayat-kipi_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `master-pegawai` (`id_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `riwayat-vaksin`
--
ALTER TABLE `riwayat-vaksin`
  ADD CONSTRAINT `riwayat-vaksin_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `master-pegawai` (`id_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `riwayat-vaksin_ibfk_2` FOREIGN KEY (`id_vaksinator`) REFERENCES `master-vaksinator` (`id_vaksinator`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `riwayat-vaksin_ibfk_3` FOREIGN KEY (`id_penyelenggara`) REFERENCES `master-penyelenggara` (`id_penyelenggara`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
