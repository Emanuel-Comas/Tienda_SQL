-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-01-2025 a las 22:39:05
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
-- Base de datos: `store`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `ID_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`ID_categoria`, `nombre_categoria`) VALUES
(1, 'Ropa'),
(2, 'Calzado'),
(3, 'Equipos'),
(4, 'Accesorios'),
(5, 'Fitness'),
(6, 'Nutrición'),
(7, 'Outdoor'),
(8, 'Tecnología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID_cliente` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` int(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID_cliente`, `nombre`, `apellido`, `correo`, `telefono`, `direccion`, `fecha_registro`) VALUES
(1, 'Juan', 'Pérez', 'juanperez@example.com', 666123456, 'Calle Real 12, Madrid', '2025-01-01'),
(2, 'María', 'González', 'mariagonzalez@example.com', 666654321, 'Av. Libertad 34, Barcelona', '2025-01-02'),
(3, 'Carlos', 'López', 'carloslopez@example.com', 666789456, 'Calle Sol 56, Valencia', '2025-01-03'),
(4, 'Lucía', 'Martínez', 'luciamartinez@example.com', 666321654, 'Calle Norte 78, Sevilla', '2025-01-04'),
(5, 'Ana', 'Sánchez', 'anasanchez@example.com', 666987654, 'Calle de la Paz 90, Madrid', '2025-01-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallesventas`
--

CREATE TABLE `detallesventas` (
  `ID_detalle` int(11) NOT NULL,
  `ID_venta` int(11) DEFAULT NULL,
  `ID_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detallesventas`
--

INSERT INTO `detallesventas` (`ID_detalle`, `ID_venta`, `ID_producto`, `cantidad`, `precio_unitario`) VALUES
(1, 1, 1, 2, 19.99),
(2, 2, 2, 2, 79.99),
(3, 3, 3, 3, 29.99),
(4, 3, 5, 1, 15.99),
(5, 4, 7, 1, 499.99),
(6, 5, 6, 3, 45.5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `ID_devolucion` int(11) NOT NULL,
  `ID_venta` int(11) DEFAULT NULL,
  `ID_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `ID_empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `devoluciones`
--

INSERT INTO `devoluciones` (`ID_devolucion`, `ID_venta`, `ID_producto`, `cantidad`, `fecha_devolucion`, `motivo`, `ID_empleado`) VALUES
(1, 2, 2, 1, '2025-01-10', 'Producto defectuoso', 3),
(2, 3, 3, 1, '2025-01-11', 'Cambio de talla', 2),
(3, 4, 7, 1, '2025-01-12', 'No era lo que esperaba', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `ID_empleado` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `salario` float DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`ID_empleado`, `nombre`, `apellido`, `cargo`, `salario`, `fecha_contratacion`) VALUES
(1, 'Pedro', 'Jiménez', 'Vendedor', 1800, '2025-01-01'),
(2, 'Laura', 'Hernández', 'Encargada de tienda', 2200, '2025-01-02'),
(3, 'José', 'Ramírez', 'Vendedor', 1750, '2025-01-03'),
(4, 'Sandra', 'García', 'Gerente de ventas', 2500, '2025-01-04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarios`
--

CREATE TABLE `inventarios` (
  `ID_inventario` int(11) NOT NULL,
  `ID_producto` int(11) DEFAULT NULL,
  `fecha_inventario` datetime DEFAULT NULL,
  `cantidad_entrante` int(11) DEFAULT NULL,
  `cantidad_saliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventarios`
--

INSERT INTO `inventarios` (`ID_inventario`, `ID_producto`, `fecha_inventario`, `cantidad_entrante`, `cantidad_saliente`) VALUES
(1, 1, '2025-01-01 10:00:00', 100, 0),
(2, 2, '2025-01-02 14:30:00', 200, 50),
(3, 3, '2025-01-03 09:00:00', 50, 0),
(4, 7, '2025-01-07 11:00:00', 30, 1),
(5, 6, '2025-01-06 16:45:00', 120, 0),
(6, 8, '2025-01-08 13:15:00', 75, 0),
(7, 9, '2025-01-09 08:30:00', 150, 0),
(8, 4, '2025-01-10 14:00:00', 40, 0),
(9, 5, '2025-01-11 10:30:00', 100, 25),
(10, 6, '2025-01-12 11:45:00', 60, 0),
(11, 1, '2025-01-13 12:00:00', 80, 10),
(12, 2, '2025-01-14 09:30:00', 250, 50),
(13, 3, '2025-01-15 15:15:00', 40, 0),
(14, 7, '2025-01-16 18:00:00', 35, 2),
(15, 5, '2025-01-17 13:45:00', 120, 30),
(16, 8, '2025-01-18 14:30:00', 100, 0),
(17, 9, '2025-01-19 16:00:00', 200, 50),
(18, 4, '2025-01-20 17:30:00', 30, 5),
(19, 1, '2025-01-21 08:30:00', 90, 0),
(20, 2, '2025-01-22 10:15:00', 150, 60),
(21, 3, '2025-01-23 14:00:00', 70, 10),
(22, 6, '2025-01-24 11:15:00', 50, 0),
(23, 7, '2025-01-25 13:00:00', 45, 0),
(24, 5, '2025-01-26 14:00:00', 100, 0),
(25, 8, '2025-01-27 09:30:00', 60, 20),
(26, 9, '2025-01-28 16:45:00', 250, 30),
(27, 4, '2025-01-29 10:00:00', 20, 10),
(28, 1, '2025-01-30 08:00:00', 60, 0),
(29, 2, '2025-01-31 11:30:00', 180, 30),
(30, 3, '2025-02-01 09:15:00', 90, 10),
(31, 7, '2025-02-02 12:00:00', 30, 0),
(32, 6, '2025-02-03 14:45:00', 100, 0),
(33, 5, '2025-02-04 10:30:00', 80, 15),
(34, 8, '2025-02-05 13:00:00', 70, 0),
(35, 9, '2025-02-06 15:30:00', 120, 20),
(36, 4, '2025-02-07 17:00:00', 50, 0),
(37, 1, '2025-02-08 08:30:00', 100, 0),
(38, 2, '2025-02-09 14:00:00', 120, 20),
(39, 3, '2025-02-10 09:00:00', 50, 5),
(40, 7, '2025-02-11 13:30:00', 45, 1),
(41, 6, '2025-02-12 10:00:00', 60, 0),
(42, 5, '2025-02-13 12:15:00', 90, 10),
(43, 8, '2025-02-14 16:00:00', 50, 0),
(44, 9, '2025-02-15 11:45:00', 200, 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_producto` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `cantidad_stock` int(50) DEFAULT NULL,
  `fecha_agregado` datetime DEFAULT NULL,
  `ID_categoria` int(11) DEFAULT NULL,
  `ID_proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID_producto`, `nombre`, `descripcion`, `precio`, `cantidad_stock`, `fecha_agregado`, `ID_categoria`, `ID_proveedor`) VALUES
(1, 'Camiseta Deportiva', 'Camiseta de algodón transpirable para actividades deportivas', 19.99, 150, '2025-01-01 00:00:00', 1, 1),
(2, 'Zapatillas Running', 'Zapatillas deportivas para correr, amortiguación avanzada', 79.99, 200, '2025-01-02 00:00:00', 2, 2),
(3, 'Pelota de Fútbol', 'Pelota oficial de fútbol, tamaño 5', 29.99, 100, '2025-01-03 00:00:00', 3, 1),
(4, 'Raqueta de Tenis', 'Raqueta de tenis profesional de carbono', 129.99, 50, '2025-01-04 00:00:00', 3, 1),
(5, 'Gorra Deportiva', 'Gorra con protección UV, ideal para correr y actividades al aire libre', 15.99, 75, '2025-01-05 00:00:00', 4, 3),
(6, 'Mancuernas', 'Set de mancuernas ajustables, ideal para entrenamiento en casa', 45.5, 120, '2025-01-06 00:00:00', 5, 4),
(7, 'Bicicleta de Montaña', 'Bicicleta de montaña con suspensión de alta calidad', 499.99, 30, '2025-01-07 00:00:00', 7, 3),
(8, 'Proteínas Whey', 'Suplemento de proteínas de suero de alta calidad', 39.99, 250, '2025-01-08 00:00:00', 6, 4),
(9, 'GPS Deportivo', 'Reloj GPS con monitor de frecuencia cardíaca y geolocalización', 149.99, 60, '2025-01-09 00:00:00', 8, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ID_proveedor` int(11) NOT NULL,
  `nombre_proveedor` varchar(100) DEFAULT NULL,
  `telefono` int(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`ID_proveedor`, `nombre_proveedor`, `telefono`, `direccion`, `correo`) VALUES
(1, 'SportEquip', 555234567, 'Calle Fútbol 123, Madrid', 'contacto@sportequip.com'),
(2, 'Athletic Shoes', 555765432, 'Av. Running 456, Barcelona', 'ventas@athleticshoes.com'),
(3, 'Outdoor Supplies', 555345678, 'Calle Aventuras 789, Valencia', 'outdoor@supplies.com'),
(4, 'FitPro Nutrition', 555876543, 'Calle Salud 101, Sevilla', 'info@fitpro.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `ID_venta` int(11) NOT NULL,
  `ID_cliente` int(11) DEFAULT NULL,
  `ID_empleado` int(11) DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL,
  `total` float DEFAULT NULL,
  `metodo_pago` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`ID_venta`, `ID_cliente`, `ID_empleado`, `fecha_venta`, `total`, `metodo_pago`) VALUES
(1, 1, 1, '2025-01-01', 99.99, 'Tarjeta'),
(2, 2, 3, '2025-01-02', 159.99, 'Efectivo'),
(3, 3, 2, '2025-01-03', 289.98, 'Tarjeta'),
(4, 4, 4, '2025-01-04', 649.98, 'Transferencia'),
(5, 5, 1, '2025-01-05', 89.97, 'Tarjeta');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`ID_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_cliente`);

--
-- Indices de la tabla `detallesventas`
--
ALTER TABLE `detallesventas`
  ADD PRIMARY KEY (`ID_detalle`),
  ADD KEY `fk_detalleVenta_venta` (`ID_venta`),
  ADD KEY `fk_detalleVenta_producto` (`ID_producto`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`ID_devolucion`),
  ADD KEY `fk_devolucion_ventas` (`ID_venta`),
  ADD KEY `fk_devolucion_productos` (`ID_producto`),
  ADD KEY `fk_devolucion_empleados` (`ID_empleado`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`ID_empleado`);

--
-- Indices de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD PRIMARY KEY (`ID_inventario`),
  ADD KEY `fk_inventario_productos` (`ID_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_producto`),
  ADD KEY `fk_categoria_productos` (`ID_categoria`),
  ADD KEY `fk_proveedor_productos` (`ID_proveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ID_proveedor`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`ID_venta`),
  ADD KEY `fk_cliente_ventas` (`ID_cliente`),
  ADD KEY `fk_empleado_ventas` (`ID_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `ID_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detallesventas`
--
ALTER TABLE `detallesventas`
  MODIFY `ID_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  MODIFY `ID_devolucion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `ID_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  MODIFY `ID_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `ID_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `ID_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallesventas`
--
ALTER TABLE `detallesventas`
  ADD CONSTRAINT `fk_detalleVenta_producto` FOREIGN KEY (`ID_producto`) REFERENCES `productos` (`ID_producto`),
  ADD CONSTRAINT `fk_detalleVenta_venta` FOREIGN KEY (`ID_venta`) REFERENCES `ventas` (`ID_venta`);

--
-- Filtros para la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD CONSTRAINT `fk_devolucion_empleados` FOREIGN KEY (`ID_empleado`) REFERENCES `empleados` (`ID_empleado`),
  ADD CONSTRAINT `fk_devolucion_productos` FOREIGN KEY (`ID_producto`) REFERENCES `productos` (`ID_producto`),
  ADD CONSTRAINT `fk_devolucion_ventas` FOREIGN KEY (`ID_venta`) REFERENCES `ventas` (`ID_venta`);

--
-- Filtros para la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD CONSTRAINT `fk_inventario_productos` FOREIGN KEY (`ID_producto`) REFERENCES `productos` (`ID_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_categoria_productos` FOREIGN KEY (`ID_categoria`) REFERENCES `categorias` (`ID_categoria`),
  ADD CONSTRAINT `fk_proveedor_productos` FOREIGN KEY (`ID_proveedor`) REFERENCES `proveedores` (`ID_proveedor`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_cliente_ventas` FOREIGN KEY (`ID_cliente`) REFERENCES `clientes` (`ID_cliente`),
  ADD CONSTRAINT `fk_empleado_ventas` FOREIGN KEY (`ID_empleado`) REFERENCES `empleados` (`ID_empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
