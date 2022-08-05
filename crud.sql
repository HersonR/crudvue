-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-08-2022 a las 07:56:35
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingrediente`
--

CREATE TABLE `ingrediente` (
  `id_ingrediente` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_vencimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ingrediente`
--

INSERT INTO `ingrediente` (`id_ingrediente`, `nombre`, `descripcion`, `fecha_ingreso`, `fecha_vencimiento`) VALUES
(1, 'Leche', 'Leche sin lactosa', '2022-08-04', '2022-08-11'),
(2, 'Chocolate', 'Chocolate blanco en paquete', '2022-08-04', '2022-08-12'),
(3, 'Frutas', 'Fresas frescas', '2022-08-04', '2022-08-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pastel`
--

CREATE TABLE `pastel` (
  `id_pastel` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `preparado_por` varchar(20) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_vencimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pastel`
--

INSERT INTO `pastel` (`id_pastel`, `nombre`, `descripcion`, `preparado_por`, `fecha_creacion`, `fecha_vencimiento`) VALUES
(1, 'Tres leches', 'Pastel frío', 'Herson Raxon1', '2022-08-04', '2022-08-11'),
(2, 'Chocolate', 'Pastel de chocolate blanco', 'Herson Raxon2', '2022-08-04', '2022-08-11'),
(3, 'Fresas con crema', 'Pastel frutas frescas', 'Herson Raxon3', '2022-08-04', '2022-08-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pastel_ingredientes`
--

CREATE TABLE `pastel_ingredientes` (
  `id_pastel_ingrediente` int(11) NOT NULL,
  `id_pastel` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`id_ingrediente`);

--
-- Indices de la tabla `pastel`
--
ALTER TABLE `pastel`
  ADD PRIMARY KEY (`id_pastel`);

--
-- Indices de la tabla `pastel_ingredientes`
--
ALTER TABLE `pastel_ingredientes`
  ADD PRIMARY KEY (`id_pastel_ingrediente`),
  ADD KEY `id_pastel` (`id_pastel`),
  ADD KEY `id_ingrediente` (`id_ingrediente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `id_ingrediente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pastel`
--
ALTER TABLE `pastel`
  MODIFY `id_pastel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pastel_ingredientes`
--
ALTER TABLE `pastel_ingredientes`
  MODIFY `id_pastel_ingrediente` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pastel_ingredientes`
--
ALTER TABLE `pastel_ingredientes`
  ADD CONSTRAINT `pastel_ingredientes_ibfk_1` FOREIGN KEY (`id_pastel`) REFERENCES `pastel` (`id_pastel`),
  ADD CONSTRAINT `pastel_ingredientes_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`ID_INGREDIENTE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
