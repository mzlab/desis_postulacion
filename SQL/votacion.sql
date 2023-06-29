-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2023 a las 17:01:22
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `votacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidato`
--

CREATE TABLE `candidato` (
  `id_candidato` int(11) NOT NULL,
  `nombre_completo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `candidato`
--

INSERT INTO `candidato` (`id_candidato`, `nombre_completo`) VALUES
(1, 'Pedro Martinez'),
(2, 'Sara Carvajal'),
(3, 'Emilia Thompson'),
(4, 'Marcelo Pedregal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

CREATE TABLE `comuna` (
  `id_co` int(11) NOT NULL COMMENT 'ID unico de la comuna',
  `id_re` int(11) NOT NULL COMMENT 'ID de la region asociada',
  `str_descripcion` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'Nombre descriptivo de la comuna'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Lista de comunas por provincias';

--
-- Volcado de datos para la tabla `comuna`
--

INSERT INTO `comuna` (`id_co`, `id_re`, `str_descripcion`) VALUES
(1, 1, 'ARICA'),
(2, 1, 'CAMARONES'),
(3, 1, 'PUTRE'),
(4, 1, 'GENERAL LAGOS'),
(5, 2, 'IQUIQUE'),
(6, 2, 'ALTO HOSPICIO'),
(7, 2, 'POZO ALMONTE'),
(8, 2, 'CAMI?A'),
(9, 2, 'COLCHANE'),
(10, 2, 'HUARA'),
(11, 2, 'PICA'),
(12, 3, 'ANTOFAGASTA'),
(13, 3, 'MEJILLONES'),
(14, 3, 'SIERRA GORDA'),
(15, 3, 'TALTAL'),
(16, 3, 'CALAMA'),
(17, 3, 'OLLAG?E'),
(18, 3, 'SAN PEDRO DE ATACAMA'),
(19, 3, 'TOCOPILLA'),
(20, 3, 'MAR?A ELENA'),
(21, 4, 'COPIAP?'),
(22, 4, 'CALDERA'),
(23, 4, 'TIERRA AMARILLA'),
(24, 4, 'CHA?ARAL'),
(25, 4, 'DIEGO DE ALMAGRO'),
(26, 4, 'VALLENAR'),
(27, 4, 'ALTO DEL CARMEN'),
(28, 4, 'FREIRINA'),
(29, 4, 'HUASCO'),
(30, 5, 'LA SERENA'),
(31, 5, 'COQUIMBO'),
(32, 5, 'ANDACOLLO'),
(33, 5, 'LA HIGUERA'),
(34, 5, 'PAIGUANO'),
(35, 5, 'VICU?A'),
(36, 5, 'ILLAPEL'),
(37, 5, 'CANELA'),
(38, 5, 'LOS VILOS'),
(39, 5, 'SALAMANCA'),
(40, 5, 'OVALLE'),
(41, 5, 'COMBARBAL?'),
(42, 5, 'MONTE PATRIA'),
(43, 5, 'PUNITAQUI'),
(44, 5, 'R?O HURTADO'),
(45, 6, 'VALPARA?SO'),
(46, 6, 'CASABLANCA'),
(47, 6, 'CONC?N'),
(48, 6, 'JUAN FERN?NDEZ'),
(49, 6, 'PUCHUNCAV?'),
(50, 6, 'QUINTERO'),
(51, 6, 'VI?A DEL MAR'),
(52, 6, 'ISLA DE PASCUA'),
(53, 6, 'LOS ANDES'),
(54, 6, 'CALLE LARGA'),
(55, 6, 'RINCONADA'),
(56, 6, 'SAN ESTEBAN'),
(57, 6, 'LA LIGUA'),
(58, 6, 'CABILDO'),
(59, 6, 'PAPUDO'),
(60, 6, 'PETORCA'),
(61, 6, 'ZAPALLAR'),
(62, 6, 'QUILLOTA'),
(63, 6, 'CALERA'),
(64, 6, 'HIJUELAS'),
(65, 6, 'LA CRUZ'),
(66, 6, 'NOGALES'),
(67, 6, 'SAN ANTONIO'),
(68, 6, 'ALGARROBO'),
(69, 6, 'CARTAGENA'),
(70, 6, 'EL QUISCO'),
(71, 6, 'EL TABO'),
(72, 6, 'SANTO DOMINGO'),
(73, 6, 'SAN FELIPE'),
(74, 6, 'CATEMU'),
(75, 6, 'LLAILLAY'),
(76, 6, 'PANQUEHUE'),
(77, 6, 'PUTAENDO'),
(78, 6, 'SANTA MAR?A'),
(79, 6, 'LIMACHE'),
(80, 6, 'QUILPU?'),
(81, 6, 'VILLA ALEMANA'),
(82, 6, 'OLMU?'),
(83, 7, 'RANCAGUA'),
(84, 7, 'CODEGUA'),
(85, 7, 'COINCO'),
(86, 7, 'COLTAUCO'),
(87, 7, 'DO?IHUE'),
(88, 7, 'GRANEROS'),
(89, 7, 'LAS CABRAS'),
(90, 7, 'MACHAL?'),
(91, 7, 'MALLOA'),
(92, 7, 'MOSTAZAL'),
(93, 7, 'OLIVAR'),
(94, 7, 'PEUMO'),
(95, 7, 'PICHIDEGUA'),
(96, 7, 'QUINTA DE TILCOCO'),
(97, 7, 'RENGO'),
(98, 7, 'REQU?NOA'),
(99, 7, 'SAN VICENTE'),
(100, 7, 'PICHILEMU'),
(101, 7, 'LA ESTRELLA'),
(102, 7, 'LITUECHE'),
(103, 7, 'MARCHIHUE'),
(104, 7, 'NAVIDAD'),
(105, 7, 'PAREDONES'),
(106, 7, 'SAN FERNANDO'),
(107, 7, 'CH?PICA'),
(108, 7, 'CHIMBARONGO'),
(109, 7, 'LOLOL'),
(110, 7, 'NANCAGUA'),
(111, 7, 'PALMILLA'),
(112, 7, 'PERALILLO'),
(113, 7, 'PLACILLA'),
(114, 7, 'PUMANQUE'),
(115, 7, 'SANTA CRUZ'),
(116, 8, 'TALCA'),
(117, 8, 'CONSTITUCI?N'),
(118, 8, 'CUREPTO'),
(119, 8, 'EMPEDRADO'),
(120, 8, 'MAULE'),
(121, 8, 'PELARCO'),
(122, 8, 'PENCAHUE'),
(123, 8, 'R?O CLARO'),
(124, 8, 'SAN CLEMENTE'),
(125, 8, 'SAN RAFAEL'),
(126, 8, 'CAUQUENES'),
(127, 8, 'CHANCO'),
(128, 8, 'PELLUHUE'),
(129, 8, 'CURIC?'),
(130, 8, 'HUALA??'),
(131, 8, 'LICANT?N'),
(132, 8, 'MOLINA'),
(133, 8, 'RAUCO'),
(134, 8, 'ROMERAL'),
(135, 8, 'SAGRADA FAMILIA'),
(136, 8, 'TENO'),
(137, 8, 'VICHUQU?N'),
(138, 8, 'LINARES'),
(139, 8, 'COLB?N'),
(140, 8, 'LONGAV?'),
(141, 8, 'PARRAL'),
(142, 8, 'RETIRO'),
(143, 8, 'SAN JAVIER'),
(144, 8, 'VILLA ALEGRE'),
(145, 8, 'YERBAS BUENAS'),
(146, 9, 'CONCEPCI?N'),
(147, 9, 'CORONEL'),
(148, 9, 'CHIGUAYANTE'),
(149, 9, 'FLORIDA'),
(150, 9, 'HUALQUI'),
(151, 9, 'LOTA'),
(152, 9, 'PENCO'),
(153, 9, 'SAN PEDRO DE LA PAZ'),
(154, 9, 'SANTA JUANA'),
(155, 9, 'TALCAHUANO'),
(156, 9, 'TOM?'),
(157, 9, 'HUALP?N'),
(158, 9, 'LEBU'),
(159, 9, 'ARAUCO'),
(160, 9, 'CA?ETE'),
(161, 9, 'CONTULMO'),
(162, 9, 'CURANILAHUE'),
(163, 9, 'LOS ALAMOS'),
(164, 9, 'TIR?A'),
(165, 9, 'LOS ANGELES'),
(166, 9, 'ANTUCO'),
(167, 9, 'CABRERO'),
(168, 9, 'LAJA'),
(169, 9, 'MULCH?N'),
(170, 9, 'NACIMIENTO'),
(171, 9, 'NEGRETE'),
(172, 9, 'QUILACO'),
(173, 9, 'QUILLECO'),
(174, 9, 'SAN ROSENDO'),
(175, 9, 'SANTA B?RBARA'),
(176, 9, 'TUCAPEL'),
(177, 9, 'YUMBEL'),
(178, 9, 'ALTO BIOB?O'),
(179, 9, 'CHILL?N'),
(180, 9, 'BULNES'),
(181, 9, 'COBQUECURA'),
(182, 9, 'COELEMU'),
(183, 9, 'COIHUECO'),
(184, 9, 'CHILL?N VIEJO'),
(185, 9, 'EL CARMEN'),
(186, 9, 'NINHUE'),
(187, 9, '?IQU?N'),
(188, 9, 'PEMUCO'),
(189, 9, 'PINTO'),
(190, 9, 'PORTEZUELO'),
(191, 9, 'QUILL?N'),
(192, 9, 'QUIRIHUE'),
(193, 9, 'R?NQUIL'),
(194, 9, 'SAN CARLOS'),
(195, 9, 'SAN FABI?N'),
(196, 9, 'SAN IGNACIO'),
(197, 9, 'SAN NICOL?S'),
(198, 9, 'TREGUACO'),
(199, 9, 'YUNGAY'),
(200, 10, 'TEMUCO'),
(201, 10, 'CARAHUE'),
(202, 10, 'CUNCO'),
(203, 10, 'CURARREHUE'),
(204, 10, 'FREIRE'),
(205, 10, 'GALVARINO'),
(206, 10, 'GORBEA'),
(207, 10, 'LAUTARO'),
(208, 10, 'LONCOCHE'),
(209, 10, 'MELIPEUCO'),
(210, 10, 'NUEVA IMPERIAL'),
(211, 10, 'PADRE LAS CASAS'),
(212, 10, 'PERQUENCO'),
(213, 10, 'PITRUFQU?N'),
(214, 10, 'PUC?N'),
(215, 10, 'SAAVEDRA'),
(216, 10, 'TEODORO SCHMIDT'),
(217, 10, 'TOLT?N'),
(218, 10, 'VILC?N'),
(219, 10, 'VILLARRICA'),
(220, 10, 'CHOLCHOL'),
(221, 10, 'ANGOL'),
(222, 10, 'COLLIPULLI'),
(223, 10, 'CURACAUT?N'),
(224, 10, 'ERCILLA'),
(225, 10, 'LONQUIMAY'),
(226, 10, 'LOS SAUCES'),
(227, 10, 'LUMACO'),
(228, 10, 'PUR?N'),
(229, 10, 'RENAICO'),
(230, 10, 'TRAIGU?N'),
(231, 10, 'VICTORIA'),
(232, 11, 'VALDIVIA'),
(233, 11, 'CORRAL'),
(234, 11, 'LANCO'),
(235, 11, 'LOS LAGOS'),
(236, 11, 'M?FIL'),
(237, 11, 'MARIQUINA'),
(238, 11, 'PAILLACO'),
(239, 11, 'PANGUIPULLI'),
(240, 11, 'LA UNI?N'),
(241, 11, 'FUTRONO'),
(242, 11, 'LAGO RANCO'),
(243, 11, 'R?O BUENO'),
(244, 12, 'PUERTO MONTT'),
(245, 12, 'CALBUCO'),
(246, 12, 'COCHAM?'),
(247, 12, 'FRESIA'),
(248, 12, 'FRUTILLAR'),
(249, 12, 'LOS MUERMOS'),
(250, 12, 'LLANQUIHUE'),
(251, 12, 'MAULL?N'),
(252, 12, 'PUERTO VARAS'),
(253, 12, 'CASTRO'),
(254, 12, 'ANCUD'),
(255, 12, 'CHONCHI'),
(256, 12, 'CURACO DE V?LEZ'),
(257, 12, 'DALCAHUE'),
(258, 12, 'PUQUELD?N'),
(259, 12, 'QUEIL?N'),
(260, 12, 'QUELL?N'),
(261, 12, 'QUEMCHI'),
(262, 12, 'QUINCHAO'),
(263, 12, 'OSORNO'),
(264, 12, 'PUERTO OCTAY'),
(265, 12, 'PURRANQUE'),
(266, 12, 'PUYEHUE'),
(267, 12, 'R?O NEGRO'),
(268, 12, 'SAN JUAN DE LA COSTA'),
(269, 12, 'SAN PABLO'),
(270, 12, 'CHAIT?N'),
(271, 12, 'FUTALEUF?'),
(272, 12, 'HUALAIHU?'),
(273, 12, 'PALENA'),
(274, 13, 'COIHAIQUE'),
(275, 13, 'LAGO VERDE'),
(276, 13, 'AIS?N'),
(277, 13, 'CISNES'),
(278, 13, 'GUAITECAS'),
(279, 13, 'COCHRANE'),
(280, 13, 'OHIGGINS'),
(281, 13, 'TORTEL'),
(282, 13, 'CHILE CHICO'),
(283, 13, 'R?O IB??EZ'),
(284, 14, 'PUNTA ARENAS'),
(285, 14, 'LAGUNA BLANCA'),
(286, 14, 'R?O VERDE'),
(287, 14, 'SAN GREGORIO'),
(288, 14, 'CABO DE HORNOS'),
(289, 14, 'ANT?RTICA'),
(290, 14, 'PORVENIR'),
(291, 14, 'PRIMAVERA'),
(292, 14, 'TIMAUKEL'),
(293, 14, 'NATALES'),
(294, 14, 'TORRES DEL PAINE'),
(295, 15, 'SANTIAGO'),
(296, 15, 'CERRILLOS'),
(297, 15, 'CERRO NAVIA'),
(298, 15, 'CONCHAL?'),
(299, 15, 'EL BOSQUE'),
(300, 15, 'ESTACI?N CENTRAL'),
(301, 15, 'HUECHURABA'),
(302, 15, 'INDEPENDENCIA'),
(303, 15, 'LA CISTERNA'),
(304, 15, 'LA FLORIDA'),
(305, 15, 'LA GRANJA'),
(306, 15, 'LA PINTANA'),
(307, 15, 'LA REINA'),
(308, 15, 'LAS CONDES'),
(309, 15, 'LO BARNECHEA'),
(310, 15, 'LO ESPEJO'),
(311, 15, 'LO PRADO'),
(312, 15, 'MACUL'),
(313, 15, 'MAIP?'),
(314, 15, '?U?OA'),
(315, 15, 'PEDRO AGUIRRE CERDA'),
(316, 15, 'PE?ALOL?N'),
(317, 15, 'PROVIDENCIA'),
(318, 15, 'PUDAHUEL'),
(319, 15, 'QUILICURA'),
(320, 15, 'QUINTA NORMAL'),
(321, 15, 'RECOLETA'),
(322, 15, 'RENCA'),
(323, 15, 'SAN JOAQU?N'),
(324, 15, 'SAN MIGUEL'),
(325, 15, 'SAN RAM?N'),
(326, 15, 'VITACURA'),
(327, 15, 'PUENTE ALTO'),
(328, 15, 'PIRQUE'),
(329, 15, 'SAN JOS? DE MAIPO'),
(330, 15, 'COLINA'),
(331, 15, 'LAMPA'),
(332, 15, 'TILTIL'),
(333, 15, 'SAN BERNARDO'),
(334, 15, 'BUIN'),
(335, 15, 'CALERA DE TANGO'),
(336, 15, 'PAINE'),
(337, 15, 'MELIPILLA'),
(338, 15, 'ALHU?'),
(339, 15, 'CURACAV?'),
(340, 15, 'MAR?A PINTO'),
(341, 15, 'SAN PEDRO'),
(342, 15, 'TALAGANTE'),
(343, 15, 'EL MONTE'),
(344, 15, 'ISLA DE MAIPO'),
(345, 15, 'PADRE HURTADO'),
(346, 15, 'PE?AFLOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `id_re` int(11) NOT NULL COMMENT 'ID unico',
  `str_descripcion` varchar(60) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Nombre extenso',
  `str_romano` varchar(5) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Número de región',
  `num_provincias` int(11) NOT NULL COMMENT 'total provincias',
  `num_comunas` int(11) NOT NULL COMMENT 'Total de comunas'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Lista de regiones de Chile';

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`id_re`, `str_descripcion`, `str_romano`, `num_provincias`, `num_comunas`) VALUES
(1, 'ARICA Y PARINACOTA', 'XV', 2, 4),
(2, 'TARAPAC?', 'I', 2, 7),
(3, 'ANTOFAGASTA', 'II', 3, 9),
(4, 'ATACAMA ', 'III', 3, 9),
(5, 'COQUIMBO ', 'IV', 3, 15),
(6, 'VALPARA?SO ', 'V', 8, 38),
(7, 'DEL LIBERTADOR GRAL. BERNARDO OHIGGINS ', 'VI', 3, 33),
(8, 'DEL MAULE', 'VII', 4, 30),
(9, 'DEL BIOB?O ', 'VIII', 4, 54),
(10, 'DE LA ARAUCAN?A', 'IX', 2, 32),
(11, 'DE LOS R?OS', 'XIV', 2, 12),
(12, 'DE LOS LAGOS', 'X', 4, 30),
(13, 'AIS?N DEL GRAL. CARLOS IBA?EZ DEL CAMPO ', 'XI', 4, 10),
(14, 'MAGALLANES Y DE LA ANT?RTICA CHILENA', 'XII', 4, 11),
(15, 'METROPOLITANA DE SANTIAGO', 'RM', 6, 52);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `voto`
--

CREATE TABLE `voto` (
  `id_voto` int(11) NOT NULL COMMENT 'PK',
  `nombre_completo` varchar(255) NOT NULL COMMENT 'Nombre y apellido del votante',
  `alias` varchar(255) NOT NULL COMMENT 'Alias del votante',
  `rut` varchar(255) NOT NULL COMMENT 'Rut formateado',
  `email` varchar(255) NOT NULL,
  `id_re` int(11) NOT NULL COMMENT 'FK, id de la región seleccionada',
  `id_co` int(11) NOT NULL COMMENT 'FK, id de la comuna seleccionada',
  `id_candidato` int(11) NOT NULL COMMENT 'FK, id del candidato seleccionado',
  `fuente_referencia` varchar(255) NOT NULL COMMENT 'Checkbox ,cómo se entero de nosotros'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidato`
--
ALTER TABLE `candidato`
  ADD PRIMARY KEY (`id_candidato`);

--
-- Indices de la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD PRIMARY KEY (`id_co`) USING BTREE,
  ADD KEY `id_re` (`id_re`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id_re`);

--
-- Indices de la tabla `voto`
--
ALTER TABLE `voto`
  ADD PRIMARY KEY (`id_voto`),
  ADD KEY `id_re` (`id_re`),
  ADD KEY `id_co` (`id_co`),
  ADD KEY `id_candidato` (`id_candidato`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `candidato`
--
ALTER TABLE `candidato`
  MODIFY `id_candidato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `comuna`
--
ALTER TABLE `comuna`
  MODIFY `id_co` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID unico de la comuna', AUTO_INCREMENT=347;

--
-- AUTO_INCREMENT de la tabla `voto`
--
ALTER TABLE `voto`
  MODIFY `id_voto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK';

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD CONSTRAINT `comuna_ibfk_1` FOREIGN KEY (`id_re`) REFERENCES `region` (`id_re`);

--
-- Filtros para la tabla `voto`
--
ALTER TABLE `voto`
  ADD CONSTRAINT `voto_ibfk_1` FOREIGN KEY (`id_re`) REFERENCES `region` (`id_re`),
  ADD CONSTRAINT `voto_ibfk_2` FOREIGN KEY (`id_re`) REFERENCES `comuna` (`id_co`),
  ADD CONSTRAINT `voto_ibfk_3` FOREIGN KEY (`id_re`) REFERENCES `region` (`id_re`),
  ADD CONSTRAINT `voto_ibfk_4` FOREIGN KEY (`id_co`) REFERENCES `comuna` (`id_co`),
  ADD CONSTRAINT `voto_ibfk_5` FOREIGN KEY (`id_candidato`) REFERENCES `candidato` (`id_candidato`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
