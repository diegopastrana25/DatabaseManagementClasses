SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `animalworld`
--

CREATE DATABASE animalworld;
USE animalworld;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `owner`
--

CREATE TABLE `owner` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `addess` varchar(100) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `dni` varchar(9) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `owner`
--

INSERT INTO `owner` (`id`, `name`, `addess`, `phone`, `dni`, `email`) VALUES
(1, 'Hadriel', 'Calle Falsa 123', 'NO PHONE', '15151515A', 'hadriel.informatica@icse.es'),
(2, 'Paul', NULL, NULL, NULL, NULL),
(3, 'Ringo', NULL, NULL, NULL, NULL),
(4, 'John', NULL, NULL, NULL, NULL),
(5, 'George', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pet`
--

CREATE TABLE `pet` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `specie` varchar(50) NOT NULL,
  `owner_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pet`
--

INSERT INTO `pet` (`id`, `name`, `birthdate`, `specie`, `owner_id`) VALUES
(1, 'pipo', '2010-02-01', 'parrot', 1),
(2, 'billy', '2013-04-01', 'dog', 1),
(3, 'Connors', '2005-04-10', 'lizard', 1),
(4, 'bean', '2015-10-01', 'cat', 2),
(5, 'flyn', '2013-10-01', 'bird', 2),
(6, 'carmelita', '2010-02-01', 'cat', 3),
(7, 'bigotitos', '2010-02-01', 'cat', 3),
(8, 'musa', '2010-02-01', 'cat', 3),
(9, 'fifi', '2010-02-01', 'cat', 3),
(10, 'Raph', '1999-05-01', 'turtle', 4),
(11, 'Mickey', '1999-05-01', 'turtle', 4),
(12, 'Donnie', '1999-05-01', 'turtle', 4),
(13, 'Leo', '1999-05-01', 'turtle', 4),
(14, 'stuart', '1999-05-01', 'bird', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_key` (`owner_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `owner`
--
ALTER TABLE `owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pet`
--
ALTER TABLE `pet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pet`
--
ALTER TABLE `pet`
  ADD CONSTRAINT `pet_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`id`);
COMMIT;
