-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-07-2023 a las 20:57:42
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carta`
--

CREATE TABLE `carta` (
  `id_carta` int(11) NOT NULL,
  `clase` varchar(50) NOT NULL,
  `img` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carta`
--

INSERT INTO `carta` (`id_carta`, `clase`, `img`) VALUES
(1, 'bebidas', 'https://us.123rf.com/450wm/vectortatu/vectortatu1608/vectortatu160800094/61333605-dibujado-a-mano-c%C3%B3cteles-conjunto-en-la-pizarra-y-el-texto-elija-su-bebida-bar-caf%C3%A9-o-restaurante.jpg?ver=6'),
(2, 'platos', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC9SkXmOHlin2BCpoqopLJ5WGFTPpV-LcFB-W3VZLZGSlstqNZ2-Z9HNndWRHYHCulEHk&usqp=CAU'),
(3, 'postres', 'https://static.vecteezy.com/system/resources/previews/022/872/412/non_2x/desserts-set-isolated-on-chalkboard-background-hand-drawn-sketch-of-delicious-cupcakes-and-cakes-with-cream-and-berry-tops-design-gastronomy-product-element-great-for-menu-poster-or-restaurant-vector.jpg'),
(21, 'entradas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRysHHyZ7PUVIC5v7rXXlZ5oY9N76u6LvhgOA&usqp=CAU'),
(31, 'ensaladas', 'https://st2.depositphotos.com/1807998/10163/v/600/depositphotos_101633012-stock-illustration-salads-menu-design-vintage-illustration.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcion`
--

CREATE TABLE `opcion` (
  `id_opcion` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `img_opcion` varchar(500) NOT NULL,
  `precio` float NOT NULL,
  `id_carta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `opcion`
--

INSERT INTO `opcion` (`id_opcion`, `nombre`, `descripcion`, `img_opcion`, `precio`, `id_carta`) VALUES
(1, 'Pan Roti Canai', 'Pan de masa fina cocido a la plancha con leche condensada.', 'https://images.rappi.com.ar/products/c69ce9de-41d9-4d34-a603-58c938ac45bf-1591833850044.jpeg?e=webp&d=511x511&q=85', 1600, 2),
(3, 'Roti Canai con Curry', 'Pan de masa fina cocido a la plancha con curry del día y leche condensada', 'https://images.rappi.com.ar/products/32aff7e4-62e8-4965-9162-e2fde4c201c6-1591834151138.jpeg?e=webp&d=511x511&q=85', 2800, 2),
(4, 'Ensalada Talong Vegana Sin TACC', 'Ensalada de puré de berenjena ahumada, tomate cherry, cebolla morada, vinagreta de coco, chips de batata.', 'https://images.rappi.com.ar/products/33a5b261-bdd8-4345-9cc2-36b842e1ad31-1664475188797.png?e=webp&d=511x511&q=85', 2050, 2),
(11, 'Minicake de Chocotorta', 'Chocotorta de chocolinas con nuestro toque especial.', 'https://images.rappi.com.ar/products/585439-1566822174.png?e=webp&d=511x511&q=85', 850, 3),
(12, 'Mini Cheesecake Frutos Rojos', 'Cheesecake entero con arándanos, moras y frambuesas', 'https://images.rappi.com.ar/products/585436-1566822218.png?e=webp&d=511x511&q=85', 1750, 3),
(13, 'Almirante Donn Porter 350ml', 'Cerveza sin tacc.', 'https://images.rappi.com.ar/products/2111305173-1642715062533_hq.jpeg?e=webp&d=511x511&q=85', 1500, 1),
(14, 'Almirante Donn Amber 350ml', 'Cerveza sin tacc.', 'https://images.rappi.com.ar/products/2111305174-1642715095593.jpg?e=webp&d=511x511&q=85', 1500, 1),
(15, 'Kombucha Pomelo Rosado 345ml', 'Kombucha bravía en lata sabor pomelo rosado y jengibre. .', 'https://images.rappi.com.ar/products/4872ee59-2f46-439f-864b-cf54807b72e4-1646940007801.png?e=webp&d=511x511&q=85', 1100, 1),
(16, 'Kombucha Manzana Verde 345 ml', 'Kombucha bravia en lata manzana verde, guaraná y cayena.', 'https://images.rappi.com.ar/products/0c727e8b-fed7-40bd-b6c0-05a8e3b34bb5-1646940030082.png?e=webp&d=511x511&q=85', 1100, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `contraseña` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `contraseña`) VALUES
(1, 'brostsimon', '$2y$10$tZ8ZwWcJkl5l5QbQo5kyneszCRjk.S2AGXbWHA/.aspuOe2jj/5e6');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carta`
--
ALTER TABLE `carta`
  ADD PRIMARY KEY (`id_carta`);

--
-- Indices de la tabla `opcion`
--
ALTER TABLE `opcion`
  ADD PRIMARY KEY (`id_opcion`),
  ADD KEY `id_carta` (`id_carta`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carta`
--
ALTER TABLE `carta`
  MODIFY `id_carta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `opcion`
--
ALTER TABLE `opcion`
  MODIFY `id_opcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `opcion`
--
ALTER TABLE `opcion`
  ADD CONSTRAINT `opcion_ibfk_1` FOREIGN KEY (`id_carta`) REFERENCES `carta` (`id_carta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
