DROP DATABASE IF EXISTS shoptrackr;
CREATE DATABASE shoptrackr;
USE shoptrackr;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-05-2024 a las 20:38:16
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
-- Base de datos: `shoptrackr`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`id`, `nombre`) VALUES
(1, 'Gerente'),
(2, 'Vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Bebidas'),
(2, 'Snacks'),
(3, 'Dulces'),
(4, 'Periódicos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido`
--

CREATE TABLE `detalles_pedido` (
  `id` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_pedido`
--

INSERT INTO `detalles_pedido` (`id`, `id_pedido`, `id_producto`, `cantidad`) VALUES
(1, 1, 1, 2),
(2, 1, 2, 2),
(3, 2, 7, 2),
(4, 2, 8, 1),
(5, 2, 10, 1),
(6, 3, 4, 1),
(7, 3, 7, 3),
(8, 3, 8, 2),
(9, 4, 2, 1),
(10, 5, 3, 2),
(11, 5, 1, 1),
(12, 6, 8, 1),
(13, 6, 3, 2),
(14, 6, 6, 3),
(15, 7, 6, 1),
(16, 7, 2, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre`, `user`, `pass`, `id_cargo`) VALUES
(1, 'Juan López', 'juan', 'password123', 1),
(2, 'María Delgado', 'maria', 'abc123', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`) VALUES
(1, 'Bezoya'),
(2, 'Lay\'s'),
(3, 'Don Simón'),
(4, 'Kinder'),
(5, 'Ferrero Rocher'),
(6, 'Mars'),
(7, 'KitKat'),
(8, 'Heineken'),
(9, 'Coca-Cola'),
(10, 'Cadbury'),
(12, 'Oreo'),
(13, 'Trident'),
(15, 'Red Bull'),
(16, 'Nescafé'),
(17, 'Halls'),
(18, 'Haribo'),
(19, 'Sprite'),
(20, 'Fanta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_vendedor` int(11) DEFAULT NULL,
  `precio_total` decimal(10,2) DEFAULT NULL,
  `hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_vendedor`, `precio_total`, `hora`) VALUES
(1, 1, 6.50, '2024-04-22 11:05:38'),
(2, 1, 9.25, '2024-04-22 11:07:43'),
(3, 1, 13.50, '2024-04-22 11:08:18'),
(4, 2, 1.25, '2024-04-22 11:25:29'),
(5, 1, 5.00, '2024-05-01 17:06:53'),
(6, 1, 12.50, '2024-05-01 17:18:32'),
(7, 1, 17.50, '2024-05-01 18:00:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `id_marca` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `coste` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `stock_minimo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `id_marca`, `id_categoria`, `precio`, `coste`, `stock`, `stock_minimo`) VALUES
(1, 'Refresco de Cola', 9, 1, 2.00, 1.00, 90, 10),
(2, 'Patatas Fritas', 2, 2, 1.25, 0.60, 60, 15),
(3, 'Chocolate', 5, 3, 1.50, 0.75, 2, 11),
(4, 'Caramelos', 18, 3, 0.50, 0.25, 85, 26),
(5, 'Refresco', 6, 3, 0.25, 0.00, 8, 10),
(6, 'Revista de Entretenimiento', 12, 4, 2.50, 1.25, 22, 11),
(7, 'Revista de Moda', 12, 4, 3.00, 1.50, 15, 5),
(8, 'Revista de Deportes', 12, 4, 2.00, 1.00, 20, 5),
(9, 'Café', 16, 1, 1.50, 0.75, 0, 10),
(10, 'Té', 16, 1, 1.25, 0.65, 24, 5),
(11, 'Donut', 4, 3, 1.25, 0.60, 30, 10),
(12, 'Bocadillo de Jamón', 2, 2, 2.00, 1.00, 20, 5),
(13, 'Helado', 6, 3, 1.75, 0.90, 40, 10),
(14, 'Palomitas de Maíz', 2, 2, 1.00, 0.50, 50, 10),
(15, 'Agua Mineral', 1, 1, 1.50, 0.75, 50, 10),
(16, 'Jugo de Naranja', 3, 1, 1.75, 0.90, 30, 10),
(17, 'Cerveza', 8, 1, 2.50, 1.25, 21, 5),
(222, 'Producto de prueba', 18, 2, 1.00, 1.00, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cargo` (`id_cargo`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_vendedor` (`id_vendedor`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_marca` (`id_marca`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1231314;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1232;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD CONSTRAINT `detalles_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `detalles_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_vendedor`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
