-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2026 at 09:55 PM
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
-- Database: `family`
--

-- --------------------------------------------------------

--
-- Table structure for table `familias`
--

CREATE TABLE `familias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `edad` int(11) NOT NULL,
  `parentesco_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `familias`
--

INSERT INTO `familias` (`id`, `nombre`, `edad`, `parentesco_id`, `usuario_id`) VALUES
(1, 'YOLOTROLL', 12, 5, 2),
(2, 'bananirou', 70, 5, 10),
(3, 'juan', 12, 2, 10),
(4, 'YOLOTROLL', 11, 2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `parentesco`
--

CREATE TABLE `parentesco` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parentesco`
--

INSERT INTO `parentesco` (`id`, `descripcion`) VALUES
(1, 'Cónyuge'),
(6, 'Hermana'),
(5, 'Hermano'),
(2, 'Hijo'),
(4, 'Madre'),
(3, 'Padre');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `rol` enum('USUARIO','ADMIN') DEFAULT 'USUARIO',
  `nombre` varchar(100) DEFAULT NULL,
  `DNI` varchar(8) DEFAULT NULL,
  `telefono` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `contraseña`, `rol`, `nombre`, `DNI`, `telefono`) VALUES
(1, 'WAZAAAA', '$2y$10$9Gu6.mBlbzWsRoQdllKTDuCss54zilWFNHenLdCG4RbCeXzvWJuJa', 'USUARIO', NULL, NULL, NULL),
(2, 'YOLO', '$2y$10$Ji3fXQXKgYcMeWdAacTVXu2f/giIn/hUNSO0FCkmHi/D70dIee5yu', 'USUARIO', 'YOLOTROLL', '12345678', 12345678),
(4, 'juan', '$2y$10$6nqzlX8nKid.DiuoQDDUJ.f7Svt3IBB2gzyg8YXE3mKOQNYXk80wW', 'USUARIO', NULL, NULL, NULL),
(5, 'juan1', '$2y$10$X9pmUJO4GLjuz6.iSbjss.QKcnnqh8q9owPXQC7BM7ElzjkVU8tou', 'USUARIO', NULL, NULL, NULL),
(9, 'waza', '$2y$10$SX2QvocMhgcXKBBQT.iPIOPa6YAj4W3vfQemU6hzmD0iaA/PSaUvi', 'ADMIN', NULL, NULL, NULL),
(10, 'ariel', '$2y$10$lkd0cEg21ytOhIKaftCU2uEtYos9ZEBf8YYJpbZy37Upv72jD2T/y', 'USUARIO', 'Ariel Charca', '48854540', 1158081495),
(11, 'sebas', '$2y$10$nwusQKBxkLYnCzA6xAlrwuWUMVFGMpmC5ZP27b62E/HVcuTtBCwzG', 'USUARIO', 'sebastian', '12131141', 2147483647);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `familias`
--
ALTER TABLE `familias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parentesco_id` (`parentesco_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `parentesco`
--
ALTER TABLE `parentesco`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `descripcion` (`descripcion`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `DNI` (`DNI`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `familias`
--
ALTER TABLE `familias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `parentesco`
--
ALTER TABLE `parentesco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `familias`
--
ALTER TABLE `familias`
  ADD CONSTRAINT `familias_ibfk_1` FOREIGN KEY (`parentesco_id`) REFERENCES `parentesco` (`id`),
  ADD CONSTRAINT `familias_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
