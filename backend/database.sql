-- 1. Buat & Gunakan Database
CREATE DATABASE IF NOT EXISTS `potensi_desa_belajar`;
USE `potensi_desa_belajar`;

-- Reset tabel agar data bersih dan terstruktur
DROP TABLE IF EXISTS `usulan`;
DROP TABLE IF EXISTS `potensi`;
DROP TABLE IF EXISTS `desa`;
DROP TABLE IF EXISTS `users`;

-- 2. Tabel User (Admin)
CREATE TABLE `users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(50) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `nama_lengkap` VARCHAR(100) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed Akun Admin (Username: admin | Password: admin123)
INSERT INTO `users` (`username`, `password`, `nama_lengkap`) VALUES
('admin', 'admin123', 'Administrator Desa');

-- 3. Tabel Desa
CREATE TABLE `desa` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nama_desa` VARCHAR(100) NOT NULL,
  `kecamatan` VARCHAR(100) NOT NULL,
  `deskripsi` TEXT NULL,
  `foto` VARCHAR(255) NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed Data Desa (Kecamatan di Kabupaten Jember)
INSERT INTO `desa` (`id`, `nama_desa`, `kecamatan`, `deskripsi`, `foto`) VALUES
(1, 'Desa Sumberjati', 'Ambulu', 'Desa Sumberjati dikenal dengan hasil pertanian, edamame, dan kerajinan warga lokal.', '/desa-sumberjati.jpg'),
(2, 'Desa Gambirono', 'Bangsalsari', 'Pusat produksi kerajinan bambu, olahan pangan, dan perkebunan kopi.', '/desa-gambirono.jpg'),
(3, 'Desa Sukorambi', 'Sukorambi', 'Dikenal dengan potensi agrowisata, sayuran organik, dan jasa lokal.', '/desa-sukorambi.jpg'),
(4, 'Desa Wirowongso', 'Ajung', 'Pusat UMKM olahan pangan, peternakan domba, dan industri rumah tangga.', '/desa-wirowongso.jpg');

-- 4. Tabel Potensi Desa (Katalog Utama Terverifikasi)
CREATE TABLE `potensi` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nama_potensi` VARCHAR(150) NOT NULL,
  `asal_desa` VARCHAR(100) NOT NULL,
  `kategori` VARCHAR(50) NOT NULL,
  `deskripsi` TEXT NULL,
  `alamat` TEXT NULL,
  `no_wa` VARCHAR(20) NOT NULL,
  `gmap` TEXT NULL,
  `foto` TEXT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed Data Potensi (Lengkap dengan kolom gmap & 4 Kategori Figma)
INSERT INTO `potensi` (`nama_potensi`, `asal_desa`, `kategori`, `deskripsi`, `alamat`, `no_wa`, `gmap`, `foto`) VALUES
-- Desa Sumberjati
('Olahan Edamame Frozen', 'Desa Sumberjati', 'UMKM & Produk', 'Produk kedelai edamame segar dan beku kualitas ekspor asli olahan warga lokal.', 'Dusun Krajan RT 01 / RW 02, Sumberjati', '6281234567890', 'https://maps.google.com', 'https://picsum.photos/800/600'),
('Jasa Jahit Busana Anggun', 'Desa Sumberjati', 'Keahlian', 'Menerima jasa jahit seragam, pakaian harian, hingga busana kebaya dengan hasil rapi.', 'Jl. Ambulu No. 15, Sumberjati', '6281234567891', 'https://maps.google.com', 'https://picsum.photos/800/601'),
('Benih Padi Unggul Sertifikat', 'Desa Sumberjati', 'Hasil Pertanian & Peternakan', 'Penyedia benih padi berkualitas tinggi tahan penyakit dan bersertifikat resmi.', 'Dusun Sumberejo RT 03, Sumberjati', '6281234567892', 'https://maps.google.com', 'https://picsum.photos/800/602'),
('Servis Pompa Air & Listrik', 'Desa Sumberjati', 'Jasa & Servis', 'Layanan perbaikan instalasi listrik rumah tangga dan perbaikan mesin pompa air.', 'Jl. Gelora No. 04, Sumberjati', '6281234567893', 'https://maps.google.com', 'https://picsum.photos/800/603'),

-- Desa Gambirono
('Anyaman Bambu Traditional', 'Desa Gambirono', 'Keahlian', 'Produksi besek, keranjang, dan hiasan bambu buatan tangan kualitas tinggi.', 'Dusun Gambirono RT 02 / RW 01', '6281234567894', 'https://maps.google.com', 'https://picsum.photos/800/604'),
('Kopi Robusta Petik Merah', 'Desa Gambirono', 'Hasil Pertanian & Peternakan', 'Biji kopi robusta pilihan hasil panen lereng perbukitan lokal.', 'Jl. Raya Gambirono No. 88', '6281234567895', 'https://maps.google.com', 'https://picsum.photos/800/605'),
('Bengkel Las Sinar Mayang', 'Desa Gambirono', 'Jasa & Servis', 'Menerima pengerjaan pagar, teralis kanopi, dan konstruksi besi minimalis.', 'Dusun Gambirono Barat', '6281234567896', 'https://maps.google.com', 'https://picsum.photos/800/606'),
('Tape Manis khas Jember', 'Desa Gambirono', 'UMKM & Produk', 'Olahan tape singkong manis legi alami tanpa bahan pengawet.', 'Jl. Stasiun Gambirono No. 12', '6281234567897', 'https://maps.google.com', 'https://picsum.photos/800/607'),

-- Desa Sukorambi
('Sayur Organik Fresh', 'Desa Sukorambi', 'Hasil Pertanian & Peternakan', 'Hasil panen sayuran hijau segar harian dipetik langsung dari kebun warga.', 'Dusun Mujan RT 01, Sukorambi', '6281234567898', 'https://maps.google.com', 'https://picsum.photos/800/608'),
('Ukiran Kayu Jati Seni', 'Desa Sukorambi', 'Keahlian', 'Kerajinan seni ukir kayu kaligrafi dan hiasan dinding khas Jawa.', 'Jl. Agrowisata No. 09, Sukorambi', '6281234567899', 'https://maps.google.com', 'https://picsum.photos/800/609'),

-- Desa Wirowongso
('Peternakan Domba Garut', 'Desa Wirowongso', 'Hasil Pertanian & Peternakan', 'Penyedia bibit unggul dan domba siap potong dari kandang ternak sehat.', 'Dusun Besini RT 04, Wirowongso', '6281234567800', 'https://maps.google.com', 'https://picsum.photos/800/610'),
('Madu Murni Hutan Murni', 'Desa Wirowongso', 'UMKM & Produk', 'Madu asli dipanen dari sarang lebah hutan tanpa campuran gula.', 'Jl. Bandara Letkol Grinting No. 45', '6281234567801', 'https://maps.google.com', 'https://picsum.photos/800/611');

-- 5. Tabel Usulan Potensi Desa (Pengajuan dari Masyarakat)
CREATE TABLE `usulan` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nama_potensi` VARCHAR(150) NOT NULL,
  `asal_desa` VARCHAR(100) NOT NULL,
  `kategori` VARCHAR(50) NOT NULL,
  `deskripsi` TEXT NULL,
  `alamat` TEXT NULL,
  `no_wa` VARCHAR(20) NOT NULL,
  `gmap` TEXT NULL,
  `foto` TEXT NULL,
  `status` ENUM('Pending', 'Disetujui', 'Ditolak') DEFAULT 'Pending',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed Data Usulan (Sudah Ditambahkan Kolom `foto`)
INSERT INTO `usulan` (`nama_potensi`, `asal_desa`, `kategori`, `deskripsi`, `alamat`, `no_wa`, `gmap`, `foto`, `status`, `created_at`) VALUES
-- Bulan Juli 2026
('Keripik Singkong Pedas Manis', 'Desa Sumberjati', 'UMKM & Produk', 'Olahan singkong krispi dengan bumbu rempah pilihan.', 'Jl. Ambulu No. 22', '6282111111111', 'https://maps.google.com', 'https://picsum.photos/800/600', 'Disetujui', '2026-07-10 08:30:00'),
('Jasa Servis Motor Keliling', 'Desa Gambirono', 'Jasa & Servis', 'Layanan perbaikan motor ringan yang bisa dipanggil ke rumah.', 'Dusun Gambirono RT 01', '6282111111112', 'https://maps.google.com', 'https://picsum.photos/800/601', 'Disetujui', '2026-07-24 14:15:00'),

-- Bulan Agustus 2026
('Budidaya Jamur Tiram Segar', 'Desa Sukorambi', 'Hasil Pertanian & Peternakan', 'Kultivasi jamur tiram putih tanpa pestisida kimia.', 'Dusun Mujan RT 03', '6282111111113', 'https://maps.google.com', 'https://picsum.photos/800/602', 'Disetujui', '2026-08-05 10:00:00'),
('Anyaman Tas Tali Kur', 'Desa Wirowongso', 'Keahlian', 'Pembuatan tas kerajinan tangan dari tali kur warna-warni.', 'Jl. Bandara No. 02', '6282111111114', 'https://maps.google.com', 'https://picsum.photos/800/603', 'Pending', '2026-08-18 11:45:00'),
('Penyediaan Bibit Cabai Rawit', 'Desa Sumberjati', 'Hasil Pertanian & Peternakan', 'Bibit cabai rawit unggul siap tanam dalam polybag.', 'Dusun Krajan RT 05', '6282111111115', 'https://maps.google.com', 'https://picsum.photos/800/604', 'Disetujui', '2026-08-29 16:20:00'),

-- Bulan September 2026
('Kue Tradisional Basah', 'Desa Gambirono', 'UMKM & Produk', 'Menerima pesanan jajanan pasar untuk acara hajatan dan rapat.', 'Jl. Stasiun No. 07', '6282111111116', 'https://maps.google.com', 'https://picsum.photos/800/605', 'Pending', '2026-09-02 09:10:00'),
('Jasa Pembuatan Layout Taman', 'Desa Sukorambi', 'Keahlian', 'Jasa desain dan penataan taman rumah minimalis.', 'Dusun Mujan RT 02', '6282111111117', 'https://maps.google.com', 'https://picsum.photos/800/606', 'Pending', '2026-09-15 13:00:00'),
('Susu Kambing Etawa Segar', 'Desa Wirowongso', 'Hasil Pertanian & Peternakan', 'Susu murni kaya nutrisi langsung dari peternakan lokal.', 'Dusun Besini RT 01', '6282111111118', 'https://maps.google.com', 'https://picsum.photos/800/607', 'Disetujui', '2026-09-28 07:30:00'),

-- Bulan Oktober 2026
('Pembersihan & Treatment AC', 'Desa Sumberjati', 'Jasa & Servis', 'Jasa cuci AC, isi freon, dan perbaikan pendingin ruangan.', 'Jl. Raya Sumberjati No. 50', '6282111111119', 'https://maps.google.com', 'https://picsum.photos/800/608', 'Pending', '2026-10-04 10:30:00'),
('Olahan Bawang Goreng Renyah', 'Desa Gambirono', 'UMKM & Produk', 'Bawang goreng kemasan stoples tanpa campuran tepung.', 'Dusun Gambirono RT 03', '6282111111120', 'https://maps.google.com', 'https://picsum.photos/800/609', 'Pending', '2026-10-12 15:40:00');