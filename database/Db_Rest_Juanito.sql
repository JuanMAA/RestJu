-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-08-2018 a las 02:25:21
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hj`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(10) UNSIGNED NOT NULL,
  `nombreCategoria` varchar(70) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='details of all categoried';

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nombreCategoria`) VALUES
(1, 'Carnes\r\n'),
(2, 'Esaladas\r\n'),
(3, 'Pastas'),
(4, 'Bebidas\r\n'),
(5, 'Snaks\r\n'),
(6, 'Frituras\r\n'),
(7, 'Golosinas\r\n'),
(8, 'Bebidas'),
(9, 'Frutas'),
(10, 'Del Mar\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `idCuenta` int(10) UNSIGNED NOT NULL,
  `idOrden` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `fecha` date NOT NULL DEFAULT '0000-00-00',
  `hora` varchar(45) NOT NULL DEFAULT '',
  `estado` varchar(45) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleorden`
--

CREATE TABLE `detalleorden` (
  `idDetalleOrden` int(10) UNSIGNED NOT NULL,
  `idOrden` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `idProducto` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cantidad` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `estado` varchar(45) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalleorden`
--

INSERT INTO `detalleorden` (`idDetalleOrden`, `idOrden`, `idProducto`, `cantidad`, `estado`) VALUES
(1, 1, 3, 4, 'EN_PROSESO'),
(2, 2, 6, 0, 'EN_PROSESO'),
(3, 3, 5, 5, 'EN_PROSESO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `usuario` varchar(45) NOT NULL DEFAULT '',
  `contrasena` varchar(45) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`idUsuario`, `usuario`, `contrasena`) VALUES
(1, 'cook', 'cook'),
(2, '1', 'mesa1'),
(3, '2', 'mesa2'),
(4, '3', 'mesa3'),
(5, '4', 'mesa4'),
(6, '5', 'mesa5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `idOrden` int(10) UNSIGNED NOT NULL,
  `numeroMesa` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `aNombreDe` varchar(20) NOT NULL DEFAULT '',
  `fecha` date NOT NULL DEFAULT '0000-00-00',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `estadoOrden` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`idOrden`, `numeroMesa`, `aNombreDe`, `fecha`, `hora`, `estadoOrden`) VALUES
(1, 1, 'Juanito', '2018-08-28', '20:47:20', 'PEDIDO_LISTO'),
(2, 1, 'Camilo', '2018-08-28', '20:47:57', 'PEDIDO_LISTO'),
(3, 1, 'Jaimito', '2018-08-28', '21:18:09', 'EN_ESPERA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(10) UNSIGNED NOT NULL,
  `idCategoria` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `nombreProducto` varchar(45) NOT NULL DEFAULT '',
  `cantidad` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `precio` varchar(45) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='item detail';

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `idCategoria`, `nombreProducto`, `cantidad`, `precio`) VALUES
(1, 8, 'Coca-Cola 2LT', 200, '1000'),
(2, 8, 'FANTA 2LT', 200, '1000'),
(3, 1, 'Pollo', 200, '2900'),
(4, 1, 'Bistec', 90, '4000'),
(5, 5, 'Super 8', 3000, '300'),
(6, 5, 'Chocman', 4000, '300');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`idCuenta`),
  ADD UNIQUE KEY `order_id` (`idOrden`);

--
-- Indices de la tabla `detalleorden`
--
ALTER TABLE `detalleorden`
  ADD PRIMARY KEY (`idDetalleOrden`),
  ADD KEY `order_id` (`idOrden`),
  ADD KEY `item_id` (`idProducto`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`idOrden`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `category_id` (`idCategoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  MODIFY `idCuenta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalleorden`
--
ALTER TABLE `detalleorden`
  MODIFY `idDetalleOrden` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `idUsuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `idOrden` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `cuenta_ibfk_1` FOREIGN KEY (`idOrden`) REFERENCES `orden` (`idOrden`);

--
-- Filtros para la tabla `detalleorden`
--
ALTER TABLE `detalleorden`
  ADD CONSTRAINT `detalleorden_ibfk_1` FOREIGN KEY (`idOrden`) REFERENCES `orden` (`idOrden`),
  ADD CONSTRAINT `detalleorden_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
