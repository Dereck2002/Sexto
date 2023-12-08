-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-12-2023 a las 02:40:53
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `sexto`
--
CREATE DATABASE IF NOT EXISTS `sexto` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sexto`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lavadoras`
--

DROP TABLE IF EXISTS `lavadoras`;
CREATE TABLE `lavadoras` (
  `lavadoraId` int(11) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `numserie` varchar(50) NOT NULL,
  `tipolavadora` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,
  `fabrica` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `lavadoras`
--

TRUNCATE TABLE `lavadoras`;
--
-- Volcado de datos para la tabla `lavadoras`
--

INSERT DELAYED IGNORE INTO `lavadoras` (`lavadoraId`, `modelo`, `numserie`, `tipolavadora`, `precio`, `fabrica`) VALUES
(6, 'LG', 'DGDFH-1', 'Lavadora de ropa', 400, 'ElectroMax'),
(7, 'Indurama', 'JYFHV-4', 'Secadora', 300, 'S.A'),
(8, 'Indurama', 'HVIKDF-2', 'Secadora', 400, 'ElectroMax'),
(9, 'Electrolux', 'JYFTSD-5', 'lavadora de platos', 500, 'ElectroMaster');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

DROP TABLE IF EXISTS `pais`;
CREATE TABLE `pais` (
  `PaisId` int(11) NOT NULL,
  `Nombre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Truncar tablas antes de insertar `pais`
--

TRUNCATE TABLE `pais`;
--
-- Volcado de datos para la tabla `pais`
--

INSERT DELAYED IGNORE INTO `pais` (`PaisId`, `Nombre`) VALUES
(1, 'Ecuador'),
(2, 'Peru'),
(3, 'Colombia'),
(4, 'EEUU');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

DROP TABLE IF EXISTS `provincias`;
CREATE TABLE `provincias` (
  `ProvinciasId` int(11) NOT NULL,
  `Nombre` text NOT NULL,
  `PaisesId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Truncar tablas antes de insertar `provincias`
--

TRUNCATE TABLE `provincias`;
--
-- Volcado de datos para la tabla `provincias`
--

INSERT DELAYED IGNORE INTO `provincias` (`ProvinciasId`, `Nombre`, `PaisesId`) VALUES
(1, 'Pichincha', 1),
(2, 'Imbabura', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `UsuarioId` int(11) NOT NULL,
  `Cedula` varchar(17) NOT NULL,
  `Nombres` varchar(100) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `Telefono` varchar(17) NOT NULL,
  `Correo` varchar(150) NOT NULL,
  `Contrasenia` text NOT NULL,
  `Rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Truncar tablas antes de insertar `usuarios`
--

TRUNCATE TABLE `usuarios`;
--
-- Volcado de datos para la tabla `usuarios`
--

INSERT DELAYED IGNORE INTO `usuarios` (`UsuarioId`, `Cedula`, `Nombres`, `Apellidos`, `Telefono`, `Correo`, `Contrasenia`, `Rol`) VALUES
(1, '1005037492', 'Dereck Alexander', 'Jaramillo Pabon', '0983288443', 'jaramilloderek13@gmail.com', '123', 'Administrador'),
(2, '1234567890', 'Otro Luis', 'Otro Llerena', '0987654321', 'correo@gmail.com', '123', 'Vendedor'),
(4, '1803971330', 'Luis Antonio', 'Llerena Ocaña', '0981030167', 'lleroc@gmail.com', '123', 'Administrador');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `lavadoras`
--
ALTER TABLE `lavadoras`
  ADD PRIMARY KEY (`lavadoraId`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`PaisId`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`ProvinciasId`),
  ADD KEY `Pais_Provincia` (`PaisesId`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`UsuarioId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `lavadoras`
--
ALTER TABLE `lavadoras`
  MODIFY `lavadoraId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `PaisId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `ProvinciasId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `UsuarioId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD CONSTRAINT `Pais_Provincia` FOREIGN KEY (`PaisesId`) REFERENCES `pais` (`PaisId`);
COMMIT;
