-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jan 2026 pada 09.34
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundryjavaweb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlet`
--

CREATE TABLE `outlet` (
  `id_outlet` int(11) NOT NULL,
  `nama_outlet` varchar(100) DEFAULT NULL,
  `owner` varchar(100) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `outlet`
--

INSERT INTO `outlet` (`id_outlet`, `nama_outlet`, `owner`, `telp`, `alamat`) VALUES
(1, 'sopa', 'sopa', '1111', 'serang'),
(8, 'lili', 'sopa', '090909', 'gunkar\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket`
--

CREATE TABLE `paket` (
  `id_paket` int(11) NOT NULL,
  `nama_paket` varchar(100) DEFAULT NULL,
  `jenis` varchar(20) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `id_outlet` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `paket`
--

INSERT INTO `paket` (`id_paket`, `nama_paket`, `jenis`, `harga`, `id_outlet`) VALUES
(1, 'kering wangi', 'Kiloan', 1000, 1),
(8, 'Cuci setrika', 'Satuan', 20000, 1),
(9, 'Setrika', 'Satuan', 3000, 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `jk` char(1) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `no_ktp` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `alamat`, `jk`, `telp`, `no_ktp`) VALUES
(1, 'nisa', 'cempaka', 'P', '1234', '12345'),
(4, 'salma', 'jl.gnkrang', 'P', '09878787', '090909'),
(5, 'yura', 'salam', 'P', '12321', '360000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `invoice` varchar(30) DEFAULT NULL,
  `id_outlet` int(11) DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `status` enum('baru','diproses','dicuci','disetrika','diambil') DEFAULT NULL,
  `total_harga` double DEFAULT NULL,
  `total_bayar` double DEFAULT NULL,
  `dibayar_pada` datetime DEFAULT NULL,
  `bayar` int(11) DEFAULT 0,
  `kembalian` int(11) DEFAULT 0,
  `metode_bayar` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `invoice`, `id_outlet`, `id_pelanggan`, `tanggal`, `status`, `total_harga`, `total_bayar`, `dibayar_pada`, `bayar`, `kembalian`, `metode_bayar`) VALUES
(6, '1 ', 1, 4, '2025-12-27 19:20:38', 'diambil', 5000, 10000, '2025-12-27 19:41:17', 10000, 5000, 'Cash'),
(7, '2', 1, 4, '2025-12-27 19:52:37', 'diambil', 812000, 1000000, '2026-01-03 14:33:19', 1000000, 188000, 'Transfer'),
(8, '3', 1, 5, '2025-12-27 19:52:58', 'diambil', 194000, 200000, '2025-12-27 19:54:09', 200000, 6000, 'Transfer'),
(10, '4', 8, 4, '2026-01-03 14:31:11', 'diambil', 34000, 50000, '2026-01-03 14:37:06', 50000, 16000, 'Cash'),
(11, '10', 8, 1, '2026-01-03 14:46:34', 'diambil', 370000, 500000, '2026-01-03 14:48:13', 500000, 130000, 'Transfer'),
(12, '123', 8, 4, '2026-01-03 15:18:46', 'diambil', 420000, 660000, '2026-01-03 15:20:35', 420000, 240000, 'Cash'),
(13, '5', 1, 5, '2026-01-03 19:06:58', 'diambil', 60000, 60000, '2026-01-03 19:11:39', 60000, 0, 'Cash'),
(14, '6', 1, 5, '2026-01-05 07:26:08', 'diproses', 44000, NULL, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `id_detail` int(11) NOT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `id_paket` int(11) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `subtotal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`id_detail`, `id_transaksi`, `id_paket`, `qty`, `harga`, `subtotal`) VALUES
(13, 6, 1, 2, 1000, 2000),
(14, 6, 1, 3, 1000, 3000),
(15, 8, 8, 3, 20000, 60000),
(16, 8, 9, 44, 3000, 132000),
(17, 8, 1, 2, 1000, 2000),
(18, 7, 8, 40, 20000, 800000),
(19, 7, 1, 12, 1000, 12000),
(20, 10, 1, 34, 1000, 34000),
(21, 11, 8, 11, 20000, 220000),
(22, 11, 9, 50, 3000, 150000),
(23, 12, 8, 21, 20000, 420000),
(24, 13, 8, 2, 20000, 40000),
(25, 13, 1, 11, 1000, 11000),
(26, 13, 9, 3, 3000, 9000),
(27, 14, 8, 2, 20000, 40000),
(28, 14, 1, 4, 1000, 4000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` enum('admin','outlet','owner') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin', 'admin', 'admin'),
(2, 'kasir', 'kasir', 'kasir', 'outlet'),
(3, 'owner', 'owner', 'owner', 'owner');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id_outlet`);

--
-- Indeks untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indeks untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id_outlet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `paket`
--
ALTER TABLE `paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
