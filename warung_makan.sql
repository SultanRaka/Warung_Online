-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2021 at 05:11 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `warung_makan`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` varchar(6) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `detil` varchar(50) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `url` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `nama`, `detil`, `harga`, `url`) VALUES
('BVG001', 'Air Mineral', 'k e s e g a r a n', 5000, 'img/air.png'),
('BVG002', 'Coca Cola', 'minuman berdosa, eh, bersoda', 7000, 'img/cola.jpg'),
('BVG003', 'Kopi', 'ngopi dulu bossq', 7000, 'img/kopi.png'),
('MKN001', 'Burger', 'Burger dengan daging sapi', 15000, 'img/burger.jpg'),
('MKN002', 'French Fries', 'kentang goreng enak', 10000, 'img/kentang.jpg'),
('MKN003', 'Hotdog', 'Ini bukan anjing panas, tapi roti sosis', 15000, 'img/hotdog.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orderonline`
--

CREATE TABLE `orderonline` (
  `nama` text DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `detil` text DEFAULT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderonline`
--

INSERT INTO `orderonline` (`nama`, `alamat`, `detil`, `total`) VALUES
('Suryadi', 'nomaden', 'Air Mineral 1 pcs \n', 5000),
('Gawd Gura', 'A', 'Air Mineral 3 pcs \n', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `no_meja` varchar(2) DEFAULT NULL,
  `detil` text DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `no_meja`, `detil`, `total`) VALUES
(3, '1', 'Air Mineral 1 pcs \nKopi 1 pcs \n', 12000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
