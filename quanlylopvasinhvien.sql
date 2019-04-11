-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 11, 2019 lúc 07:46 SA
-- Phiên bản máy phục vụ: 5.7.14
-- Phiên bản PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlylopvasinhvien`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giangvien`
--

CREATE TABLE `giangvien` (
  `magv` varchar(10) NOT NULL,
  `tengv` varchar(255) NOT NULL,
  `sdt` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lopmh`
--

CREATE TABLE `lopmh` (
  `MALOPMH` varchar(10) NOT NULL,
  `TENLOPMH` varchar(255) NOT NULL,
  `MAMH` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lopmh-sv`
--

CREATE TABLE `lopmh-sv` (
  `MALOPMH` varchar(10) NOT NULL,
  `MASV` varchar(10) NOT NULL,
  `GHICHU` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `monhoc`
--

CREATE TABLE `monhoc` (
  `MAMONHOC` varchar(10) NOT NULL,
  `TENMONHOC` text NOT NULL,
  `SOTINCHI` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `monhoc`
--

INSERT INTO `monhoc` (`MAMONHOC`, `TENMONHOC`, `SOTINCHI`) VALUES
('TH039288', 'Lập trình web', 2),
('TH30029', 'Nhập môn CSDL', 2),
('TN0392', 'Nhập môn công tác kỹ sư', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhom`
--

CREATE TABLE `nhom` (
  `MANHOM` int(11) NOT NULL,
  `MALOPMH` varchar(10) NOT NULL,
  `SOLUONGTOIDA` int(11) NOT NULL,
  `NHOMTRUONG` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sinhvien`
--

CREATE TABLE `sinhvien` (
  `MASINHVIEN` varchar(10) NOT NULL,
  `HOTENSV` text NOT NULL,
  `PHAI` tinyint(1) NOT NULL,
  `NGAYSINH` datetime NOT NULL,
  `QUEQUAN` text NOT NULL,
  `MALOP` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `ID` int(10) NOT NULL,
  `LINK` varchar(255) NOT NULL,
  `IMAGE` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thaoluan`
--

CREATE TABLE `thaoluan` (
  `MATL` int(11) NOT NULL,
  `MACHA` int(11) DEFAULT NULL,
  `NOIDUNG` text,
  `NGAYDANG` datetime DEFAULT NULL,
  `MANGUOIDANG` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thongbao`
--

CREATE TABLE `thongbao` (
  `MAGV` varchar(10) NOT NULL,
  `MASV` varchar(10) NOT NULL,
  `NOIDUNG` text,
  `NGAYGUI` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tuan`
--

CREATE TABLE `tuan` (
  `STT` int(11) NOT NULL,
  `CHUTHICH` text NOT NULL,
  `MALOPMH` varchar(10) NOT NULL,
  `MASV` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `lopmh`
--
ALTER TABLE `lopmh`
  ADD PRIMARY KEY (`MALOPMH`),
  ADD KEY `MAMH` (`MAMH`);

--
-- Chỉ mục cho bảng `lopmh-sv`
--
ALTER TABLE `lopmh-sv`
  ADD PRIMARY KEY (`MALOPMH`,`MASV`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `monhoc`
--
ALTER TABLE `monhoc`
  ADD PRIMARY KEY (`MAMONHOC`);

--
-- Chỉ mục cho bảng `nhom`
--
ALTER TABLE `nhom`
  ADD PRIMARY KEY (`MANHOM`),
  ADD KEY `MALOPMH` (`MALOPMH`),
  ADD KEY `NHOMTRUONG` (`NHOMTRUONG`);

--
-- Chỉ mục cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`MASINHVIEN`),
  ADD KEY `MALOP` (`MALOP`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `thaoluan`
--
ALTER TABLE `thaoluan`
  ADD PRIMARY KEY (`MATL`);

--
-- Chỉ mục cho bảng `thongbao`
--
ALTER TABLE `thongbao`
  ADD PRIMARY KEY (`MASV`,`MAGV`);

--
-- Chỉ mục cho bảng `tuan`
--
ALTER TABLE `tuan`
  ADD PRIMARY KEY (`STT`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `nhom`
--
ALTER TABLE `nhom`
  MODIFY `MANHOM` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `thaoluan`
--
ALTER TABLE `thaoluan`
  MODIFY `MATL` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `tuan`
--
ALTER TABLE `tuan`
  MODIFY `STT` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `lopmh`
--
ALTER TABLE `lopmh`
  ADD CONSTRAINT `lopmh_ibfk_1` FOREIGN KEY (`MAMH`) REFERENCES `monhoc` (`MAMONHOC`);

--
-- Các ràng buộc cho bảng `nhom`
--
ALTER TABLE `nhom`
  ADD CONSTRAINT `nhom_ibfk_1` FOREIGN KEY (`MALOPMH`) REFERENCES `lopmh` (`MALOPMH`),
  ADD CONSTRAINT `nhom_ibfk_2` FOREIGN KEY (`NHOMTRUONG`) REFERENCES `sinhvien` (`MASINHVIEN`);

--
-- Các ràng buộc cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD CONSTRAINT `sinhvien_ibfk_1` FOREIGN KEY (`MALOP`) REFERENCES `lopmh` (`MALOPMH`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
