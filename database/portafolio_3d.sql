-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-07-2023 a las 10:10:21
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
-- Base de datos: `portafolio_3d`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230717220807', '2023-07-17 22:08:27', 1413);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mundos`
--

CREATE TABLE `mundos` (
  `id` int(11) NOT NULL,
  `img` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mundos`
--

INSERT INTO `mundos` (`id`, `img`) VALUES
(1, 'https://lh3.googleusercontent.com/drive-viewer/AITFw-ySaSchiFnbBLE3R6nA3NfOLf3ix9_LkznJ-tfCZelGHmxWLwRl6oFI1Pvz32kej43oBHpo0iSA7MsUTzwwBwjcuXDm9Q=w1366-h657'),
(2, 'https://lh3.googleusercontent.com/drive-viewer/AITFw-zc_in5YYqe8MgZ1V-fjl82gvcbkvRM5UbwBxroOewBVAbOBVjFH0glH_DyHwc-ml-yc_vfCYZ5cYdjryKz5wuzzwhq=w1366-h657'),
(3, 'https://lh3.googleusercontent.com/drive-viewer/AITFw-zGKfquBd4cuezKmpOq8U2v50-cPn6sjbn9g_vCbGS1OisIRiuTUTzvTbBH7J9SSQ02rQGcW4uO0GSMu0esrmNq3-tZ6Q=w1366-h657'),
(4, 'https://lh3.googleusercontent.com/drive-viewer/AITFw-yDJWtHcVwBdchlgvyjt95S4cnOZ1IoiEpxQkL-O43pZxtifSKzar6jUuNv0Gn_aqNx488OiVq5D8Bgy8HFle2_xW-gJw=w1366-h657');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `explication` varchar(500) NOT NULL,
  `demo` varchar(255) NOT NULL,
  `github` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id`, `name`, `explication`, `demo`, `github`, `img`) VALUES
(1, 'Rediseño y maquetación de página Web', 'Nuestro cliente le pidió a una agencia de diseño web un prototipo del sitio web de su restaurante, pero la agencia contratada ya no pudo continuar con el proceso.  ​  Nos comparte el archivo editable del prototipo en Figma y nos dice que si vemos alguna mejora en referencia a la experiencia de usuario podemos aplicarla.  ​  Además quiere que se haga la maquetación con HTML y CSS de ese prototipo.', 'https://eloquent-bublanina-dec510.netlify.app/', 'https://github.com/askor222/MiPrimeraPaginaWeb.git', 'https://simplonline.co/_next/image?url=https%3A%2F%2Fsimplonline-v3-prod.s3.eu-west-3.amazonaws.com%2Fmedia%2Fimage%2Fjpg%2Frestaurantes-marketing-6409add20dc02709595156.jpg&w=427&q=75'),
(2, 'Consumo de una API', 'El cliente nos está requiriendo crear una página para reflejar la información almacenada en una API', 'https://aesthetic-souffle-9e666f.netlify.app/', 'https://github.com/askor222/Consumo-de-una-API.git', 'https://simplonline.co/_next/image?url=https%3A%2F%2Fsimplonline-v3-prod.s3.eu-west-3.amazonaws.com%2Fmedia%2Fimage%2Fpng%2Fapi-644479e2c2755248421919.png&w=1280&q=75');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `is_verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `is_verified`) VALUES
(1, 'kibriare@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$.otY8n3XVFnISN62.1d.vest6Zt46T5tS5TlTVsQree1iJbJ/Nol.', 0),
(2, 'usuario@gmail.com', '[]', '$2y$13$IaCkW6bUXbWnIN1sX63bferIDIF.zjMmO7gpX9v2grMX11BiaouUG', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `mundos`
--
ALTER TABLE `mundos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mundos`
--
ALTER TABLE `mundos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
