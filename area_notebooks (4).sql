-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2024 a las 18:05:52
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `area_notebooks`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `Prestamo_ID` int(11) NOT NULL,
  `Netbook_ID` varchar(4) NOT NULL,
  `Fecha_Prestamo` varchar(10) DEFAULT NULL,
  `Fecha_Devolucion` varchar(10) DEFAULT NULL,
  `Hora_Prestamo` varchar(5) DEFAULT NULL,
  `Hora_Devolucion` varchar(5) DEFAULT NULL,
  `Curso` varchar(50) DEFAULT NULL,
  `Alumno` varchar(100) DEFAULT NULL,
  `Tutor` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`Prestamo_ID`, `Netbook_ID`, `Fecha_Prestamo`, `Fecha_Devolucion`, `Hora_Prestamo`, `Hora_Devolucion`, `Curso`, `Alumno`, `Tutor`) VALUES
(13, 'B1', '19/11/2024', '20/11/2025', '13:44', '17:10', '44', 'Juan', 'Nico'),
(17, 'C1', '26/11/2024', '26/11/2024', '14:00', '17:10', '44', 'MATI', 'WALTER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `ID` varchar(3) NOT NULL,
  `Cod_Barra` varchar(100) NOT NULL,
  `Estado` enum('Dañada','En uso','Hurto','Obsoleta') DEFAULT 'En uso',
  `Observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stock`
--

INSERT INTO `stock` (`ID`, `Cod_Barra`, `Estado`, `Observaciones`) VALUES
('B1', '0303456nananananan', 'En uso', 'AYEDA'),
('C1', 'FAQ434313', 'Dañada', 'hsfihsifhsdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Usuario_ID` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Rol` enum('Admin','Personal') DEFAULT 'Personal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`Prestamo_ID`),
  ADD UNIQUE KEY `Netbook__ID` (`Netbook_ID`) USING BTREE;

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Cod_Barra` (`Cod_Barra`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Usuario_ID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `Prestamo_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Usuario_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`Netbook_ID`) REFERENCES `stock` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
