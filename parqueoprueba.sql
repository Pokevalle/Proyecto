-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2025 a las 04:40:22
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
-- Base de datos: `parqueoprueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `area_id` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `tipo_vehiculo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`area_id`, `nombre`, `capacidad`, `tipo_vehiculo`) VALUES
('C01', 'CATEDRATICO', 45, 'AUTO'),
('C02', 'CATEDRATICO', 5, 'AUTO'),
('E01', 'ESTUDIANTE', 70, 'AUTO'),
('E02', 'ESTUDIANTE', 20, 'AUTO'),
('M01', 'ESTUDIANTE', 120, 'MOTO'),
('M02', 'ESTUDIANTE', 10, 'MOTO'),
('MC01', 'CATEDRATICO', 45, 'MOTO'),
('MC02', 'CATEDRATICO', 5, 'MOTO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `placa` varchar(15) NOT NULL,
  `carnet` varchar(15) DEFAULT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `saldos` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`placa`, `carnet`, `nombres`, `apellidos`, `telefono`, `saldos`) VALUES
('DFWEFDSE', '332523', 'wefwefwe', 'ewfewfwe', '634634', 534534),
('DFWEFWEF', 'VISITANTE-100', 'ewfwef', 'ewfwe', 'fewfwf', NULL),
('dgsedse', '4435453', 'reegrg', 'dfwfe', '57646', NULL),
('efsdefs', '3090-24-454545', 'Bryan Petillo', 'Juana Juato', '35235325', NULL),
('EFWEFWEFWE', '532532532', 'fwefwefwe', 'fewfwef', '4352352', 234),
('EFWFWEF', '532523', 'fwefwef', 'ergerg', '53252', NULL),
('ERWFWEFWEF', '352352', 'ewqfwefew', 'ewfwef', '463634', 355),
('ewfdsew', '3525', 'fdfse', 'ergergdf', '436344', NULL),
('ewfdsewf', '235235', 'ewfewf', 'hhfth', '4345634', NULL),
('EWFWEF', '43534', 'fewfwe', 'fedwef', '5345', NULL),
('EWFWEFEW', 'VISITANTE-3223', 'ewfwefw', 'efwfwef', '463634', NULL),
('EWFWEFEW3', '543543', 'fdwfew', 'wefef', '3634634', 1000),
('ewfwefewe', '454343', 'rfregre', 'greger', '433434', NULL),
('EWWEFWEFW', '65464', 'ewfwef', 'wefds', '23523', 345),
('fdsfsdfds', '5453', 'reger', 'wef', '345343', NULL),
('FEWFEWF', 'VISITANTE-029', 'ewfwef', 'ewfwef', '46363', NULL),
('FEWFEWF3', 'VISITANTE-030', 'ewfwefew', 'ewfwefw', '463643', NULL),
('FEWFEWF4', '434634', 'dgergerg', 'gergerge', '643634', 300),
('fewfjnwej', '543534', 'fewfwefds', 'fwefwe', '5325', NULL),
('fewfwefds', '453453463', 'regwcwef', 'ergfwegf', '46334', NULL),
('FWEFWEFEWF', '56346534', 'fewfwefew', 'ewgweg', 'ewfwe', 253),
('gdfgdfgdf', 'VISITANTE-015', 'fewfwe', 'ewfew', '34634', NULL),
('GREGERGERGER', 'VISITANTE-32532', 'ewfwefwe', 'fehfdg', '34646', NULL),
('GREGERGERGSD', '4634643', 'ffewfwef', 'efwfwef', '643', 685),
('M-012LMN', '2185-24-3281', 'María Elena', 'Rodríguez Díaz', '555-1004', NULL),
('M-013KLM', '4150-24-5896', 'Agustín Ignacio', 'Vera Poblete', '555-1087', NULL),
('M-013OPQ', '7501-20-1020', 'Trinidad Alejandra', 'Mendoza Ríos', '555-1093', NULL),
('M-013STU', '4150-19-5863', 'José Manuel', 'Castro Herrera', '555-1014', NULL),
('M-013WXY', '3090-24-3145', 'Felipe Andrés', 'Alarcón Moya', '555-1057', NULL),
('M-111STU', '4150-19-7563', 'Benjamin Andrés', 'Muñoz Vidal', '555-1074', NULL),
('M-135MNO', '7501-22-1004', 'María José', 'Navarro Vega', '555-1013', NULL),
('M-222BCD', '1275-20-8471', 'Martín Andrés', 'Luna González', '555-1089', NULL),
('M-235CDE', '7501-20-1006', 'Laura Cecilia', 'Dominguez Reyes', '555-1023', NULL),
('M-235QRS', '1275-22-6547', 'Sofia Alejandra', 'Pérez Mora', '555-1008', NULL),
('M-235UVW', '1275-25-1974', 'Karla Vanessa', 'Morales Guzmán', '555-1015', NULL),
('M-235YZA', '1275-24-5298', 'Alberto Enrique', 'Cortes Núñez', '555-1029', NULL),
('M-258ABC', '4150-21-7823', 'Alejandra Francisca', 'Barrientos Jara', '555-1060', NULL),
('M-258NOP', '2185-24-8765', 'Rosa Amalia', 'Gallegos Vidal', '555-1052', NULL),
('M-333HIJ', '1275-21-6932', 'Valentina Sofia', 'Castro Muñoz', '555-1082', NULL),
('M-369DEF', '2185-21-4987', 'Miguel Angel', 'Paredes Rios', '555-1032', NULL),
('M-444QRS', '1275-23-8712', 'Natalia Carolina', 'Arias Campos', '555-1035', NULL),
('M-480TUV', '1275-19-7246', 'Antonella Belén', 'Guzmán Paredes', '555-1095', NULL),
('M-555WXY', '1275-23-2145', 'Javiera Antonia', 'Lagos Hernández', '555-1075', NULL),
('M-568DEF', '1275-24-5789', 'Ignacio Antonio', 'Garrido Segura', '555-1069', NULL),
('M-568HIJ', '2185-22-6937', 'Facundo Alejandro', 'Tapia Herrera', '555-1099', NULL),
('M-568ZAB', '2185-25-1765', 'Sebastián Alejandro', 'Contreras Mora', '555-1092', NULL),
('M-666FGH', '1275-25-2367', 'Christian Andrés', 'Bustamante Palma', '555-1062', NULL),
('M-680BCD', '3090-20-8976', 'Tomás Eduardo', 'Yáñez Castillo', '555-1077', NULL),
('M-703YZA', '2185-23-6598', 'Samuel David', 'Valenzuela Riffo', '555-1059', NULL),
('M-780FGH', '4150-23-4398', 'Emilio José', 'Aravena Soto', '555-1094', NULL),
('M-780JKL', '4150-22-7198', 'Oscar David', 'Sanchez Cruz', '555-1020', NULL),
('M-780NOP', '4150-20-2634', 'Jorge Luis', 'Mejía Valencia', '555-1034', NULL),
('M-813CDE', '2185-25-2954', 'Héctor Mauricio', 'Lara Montes', '555-1045', NULL),
('M-888UVW', '4150-25-4687', 'Joaquín Andrés', 'Orellana Díaz', '555-1080', NULL),
('M-913GHI', '1275-19-4198', 'Diana Carolina', 'Venegas Olivares', '555-1049', NULL),
('M-925EFG', '7501-24-1009', 'Sandra Milena', 'Rojas Bustos', '555-1038', NULL),
('M-999MNO', '7501-23-1010', 'Gloria Esther', 'Espinoza Zúñiga', '555-1043', NULL),
('O-124NOP', '7501-23-1003', 'Juan Carlos', 'Ramírez Jiménez', '555-1009', NULL),
('P-024JKL', '3090-23-8954', 'Rodrigo Ignacio', 'Poblete Troncoso', '555-1064', NULL),
('P-036HIJ', '3090-21-5812', 'Luciano Andrés', 'Reyes Medina', '555-1097', NULL),
('P-037GHI', 'VISITANTE-003', 'Carlos', 'López', '555-1011', NULL),
('P-123ABC', '3090-25-7654', 'Ana María', 'López García', '555-1001', NULL),
('P-124RST', '7501-21-1012', 'Walter Francisco', 'Ibarra Vergara', '555-1053', NULL),
('P-124VWX', '4150-20-1234', 'Maximiliano José', 'Acuña Rivas', '555-1067', NULL),
('P-124ZAB', '7501-20-1013', 'Nancy Elizabeth', 'Cáceres Leiva', '555-1058', NULL),
('P-135NOP', '3090-19-5178', 'Brenda Lissette', 'Salas Parra', '555-1044', NULL),
('P-146LMN', '2185-20-7412', 'Diego Alexander', 'Torres Rojas', '555-1012', NULL),
('P-147KLM', 'VISITANTE-004', 'Ana', 'Martínez', '555-1016', NULL),
('P-234JKL', '7501-25-1001', 'Carlos José', 'Martínez Ruiz', '555-1002', NULL),
('P-246PQR', '2185-20-5321', 'Antonia Paz', 'Ramírez González', '555-1079', NULL),
('P-246TUV', '7501-19-1014', 'Margarita Ana', 'Quiroga Olivares', '555-1063', NULL),
('P-257OPQ', 'VISITANTE-005', 'Luis', 'Rodríguez', '555-1021', NULL),
('P-259MNO', 'VISITANTE-014', 'Andrés', 'Navarro', '555-1066', NULL),
('P-321YZA', '7501-23-1017', 'Marcela Alejandra', 'Silva Rojas', '555-1078', NULL),
('P-345RST', 'VISITANTE-002', 'María', 'González', '555-1007', NULL),
('P-346BCD', '3090-21-2389', 'Andrea Patricia', 'Silva Mendoza', '555-1010', NULL),
('P-346FGH', 'VISITANTE-018', 'Beatriz', 'Molina', '555-1086', NULL),
('P-346TUV', '2185-22-6123', 'Monica Patricia', 'Vargas Luna', '555-1025', NULL),
('P-346XYZ', '3090-22-9623', 'Amanda Paz', 'Fuentes López', '555-1090', NULL),
('P-357STU', 'VISITANTE-007', 'Jorge', 'Hernández', '555-1031', NULL),
('P-357ZAB', '1275-21-3456', 'Daniel Esteban', 'Aguilar Mejía', '555-1022', NULL),
('P-369QRS', '4150-21-8347', 'Raúl Antonio', 'Medina Fuentes', '555-1027', NULL),
('P-456DEF', 'VISITANTE-001', 'Juan', 'Pérez', '555-1003', NULL),
('P-457ABC', 'VISITANTE-008', 'Marta', 'Díaz', '555-1036', NULL),
('P-457EFG', 'VISITANTE-009', 'Rosa', 'Moreno', '555-1041', NULL),
('P-457WXY', 'VISITANTE-006', 'Carmen', 'García', '555-1026', NULL),
('P-468CDE', '1275-20-6823', 'Victor Manuel', 'Figueroa Molina', '555-1042', NULL),
('P-479UVW', '3090-24-8521', 'Ricardo Andrés', 'Ortega Peña', '555-1017', NULL),
('P-567PQR', 'VISITANTE-010', 'Francisco', 'Ruiz', '555-1046', NULL),
('P-579IJK', '4150-24-7631', 'Verónica Alejandra', 'Cárdenas Ponce', '555-1047', NULL),
('P-579YZA', '4150-23-9123', 'Luis Fernando', 'Gómez Castro', '555-1006', NULL),
('P-581STU', '2185-22-4678', 'Carolina Andrea', 'Zúñiga Albornoz', '555-1065', NULL),
('P-591WXY', '1275-22-9876', 'Yessica Paola', 'Pizarro Garrido', '555-1055', NULL),
('P-654EFG', '4150-23-5412', 'César Augusto', 'Donoso Toledo', '555-1054', NULL),
('P-679CDE', '4150-25-4089', 'Claudia Marcela', 'Sepúlveda Tapia', '555-1040', NULL),
('P-679GHI', '3090-23-9874', 'Francisco Javier', 'Rivera Ochoa', '555-1024', NULL),
('P-679KLM', '3090-25-6327', 'Edgar Omar', 'Bravo Santana', '555-1050', NULL),
('P-680OPQ', '2185-23-4632', 'Gabriela Fernanda', 'Reyes Paredes', '555-1019', NULL),
('P-691ABC', '2185-21-3897', 'Matías Alejandro', 'Sáez Delgado', '555-1072', NULL),
('P-692VWX', 'VISITANTE-011', 'Elena', 'Alvarez', '555-1051', NULL),
('P-702ZAB', 'VISITANTE-012', 'Pablo', 'Romero', '555-1056', NULL),
('P-791EFG', '2185-19-7418', 'Florencia Antonia', 'Salazar Torres', '555-1085', NULL),
('P-802DEF', '2185-19-7341', 'Pablo Andrés', 'Guzmán Ferrada', '555-1039', NULL),
('P-802XYZ', '7501-21-1019', 'Daniela Fernanda', 'Rivera Castro', '555-1088', NULL),
('P-890VWX', '3090-19-3254', 'Camilo Andrés', 'Figueroa Rivas', '555-1084', NULL),
('P-891IJK', '7501-24-1016', 'Francisca Ignacia', 'Correa Pino', '555-1073', NULL),
('P-891MNO', '7501-19-1007', 'Carmen Rosa', 'Guerrero Soto', '555-1028', NULL),
('P-891QRS', '3090-22-1765', 'Isabel Cristina', 'Contreras León', '555-1030', NULL),
('P-902HIJ', '7501-24-1002', 'Pedro Antonio', 'Hernández López', '555-1005', NULL),
('P-902LMN', '7501-25-1021', 'Catalina Andrea', 'Ortega Silva', '555-1098', NULL),
('P-902PQR', '7501-25-1015', 'Paola Daniela', 'Urrutia Molina', '555-1068', NULL),
('P-902TUV', '7501-25-1008', 'Elena Beatriz', 'Campos Salazar', '555-1033', NULL),
('P-924FGH', '7501-22-1011', 'Mario Alfonso', 'Farías Duarte', '555-1048', NULL),
('P-987KLM', '3090-20-9456', 'Roberto Carlos', 'Miranda Lagos', '555-1037', NULL),
('REERGRGRE', '523523', 'ewfefwe', 'ewfwef', '32523', 434),
('safasfas', '35232', 'fdsfdsfs', 'sfaasf', '436634', NULL),
('sfasfasfas', '363634', 'fsdfdsvse', 'efsfesfs', '5433463', NULL),
('WEEWFWEFWE', '436346', 'ewfwefe', 'ewfwefw', '436346', 3252),
('wefwefefw', '39329923', 'pepe el toro', 'junan', '3253235', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `spots`
--

CREATE TABLE `spots` (
  `spot_id` varchar(10) NOT NULL,
  `area_id` varchar(10) DEFAULT NULL,
  `tipo_vehiculo` enum('AUTO','MOTO') NOT NULL,
  `status` enum('FREE','OCCUPIED','TEMPORAL') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `spots`
--

INSERT INTO `spots` (`spot_id`, `area_id`, `tipo_vehiculo`, `status`) VALUES
('S-C01-001', 'C01', 'AUTO', 'FREE'),
('S-C01-002', 'C01', 'AUTO', 'FREE'),
('S-C01-003', 'C01', 'AUTO', 'FREE'),
('S-C01-004', 'C01', 'AUTO', 'FREE'),
('S-C01-005', 'C01', 'AUTO', 'FREE'),
('S-C01-006', 'C01', 'AUTO', 'FREE'),
('S-C01-007', 'C01', 'AUTO', 'FREE'),
('S-C01-008', 'C01', 'AUTO', 'FREE'),
('S-C01-009', 'C01', 'AUTO', 'FREE'),
('S-C01-010', 'C01', 'AUTO', 'FREE'),
('S-C01-011', 'C01', 'AUTO', 'FREE'),
('S-C01-012', 'C01', 'AUTO', 'FREE'),
('S-C01-013', 'C01', 'AUTO', 'FREE'),
('S-C01-014', 'C01', 'AUTO', 'FREE'),
('S-C01-015', 'C01', 'AUTO', 'FREE'),
('S-C01-016', 'C01', 'AUTO', 'FREE'),
('S-C01-017', 'C01', 'AUTO', 'FREE'),
('S-C01-018', 'C01', 'AUTO', 'FREE'),
('S-C01-019', 'C01', 'AUTO', 'FREE'),
('S-C01-020', 'C01', 'AUTO', 'FREE'),
('S-C01-021', 'C01', 'AUTO', 'FREE'),
('S-C01-022', 'C01', 'AUTO', 'FREE'),
('S-C01-023', 'C01', 'AUTO', 'FREE'),
('S-C01-024', 'C01', 'AUTO', 'FREE'),
('S-C01-025', 'C01', 'AUTO', 'FREE'),
('S-C01-026', 'C01', 'AUTO', 'FREE'),
('S-C01-027', 'C01', 'AUTO', 'FREE'),
('S-C01-028', 'C01', 'AUTO', 'FREE'),
('S-C01-029', 'C01', 'AUTO', 'FREE'),
('S-C01-030', 'C01', 'AUTO', 'FREE'),
('S-C01-031', 'C01', 'AUTO', 'FREE'),
('S-C01-032', 'C01', 'AUTO', 'FREE'),
('S-C01-033', 'C01', 'AUTO', 'FREE'),
('S-C01-034', 'C01', 'AUTO', 'FREE'),
('S-C01-035', 'C01', 'AUTO', 'FREE'),
('S-C01-036', 'C01', 'AUTO', 'FREE'),
('S-C01-037', 'C01', 'AUTO', 'FREE'),
('S-C01-038', 'C01', 'AUTO', 'FREE'),
('S-C01-039', 'C01', 'AUTO', 'FREE'),
('S-C01-040', 'C01', 'AUTO', 'FREE'),
('S-C01-041', 'C01', 'AUTO', 'FREE'),
('S-C01-042', 'C01', 'AUTO', 'FREE'),
('S-C01-043', 'C01', 'AUTO', 'FREE'),
('S-C01-044', 'C01', 'AUTO', 'FREE'),
('S-C01-045', 'C01', 'AUTO', 'FREE'),
('S-C02-001', 'C02', 'AUTO', 'FREE'),
('S-C02-002', 'C02', 'AUTO', 'FREE'),
('S-C02-003', 'C02', 'AUTO', 'FREE'),
('S-C02-004', 'C02', 'AUTO', 'FREE'),
('S-C02-005', 'C02', 'AUTO', 'FREE'),
('S-E01-001', 'E01', 'AUTO', 'FREE'),
('S-E01-002', 'E01', 'AUTO', 'FREE'),
('S-E01-003', 'E01', 'AUTO', 'FREE'),
('S-E01-004', 'E01', 'AUTO', 'FREE'),
('S-E01-005', 'E01', 'AUTO', 'FREE'),
('S-E01-006', 'E01', 'AUTO', 'FREE'),
('S-E01-007', 'E01', 'AUTO', 'FREE'),
('S-E01-008', 'E01', 'AUTO', 'FREE'),
('S-E01-009', 'E01', 'AUTO', 'FREE'),
('S-E01-010', 'E01', 'AUTO', 'FREE'),
('S-E01-011', 'E01', 'AUTO', 'FREE'),
('S-E01-012', 'E01', 'AUTO', 'FREE'),
('S-E01-013', 'E01', 'AUTO', 'FREE'),
('S-E01-014', 'E01', 'AUTO', 'FREE'),
('S-E01-015', 'E01', 'AUTO', 'FREE'),
('S-E01-016', 'E01', 'AUTO', 'FREE'),
('S-E01-017', 'E01', 'AUTO', 'FREE'),
('S-E01-018', 'E01', 'AUTO', 'FREE'),
('S-E01-019', 'E01', 'AUTO', 'FREE'),
('S-E01-020', 'E01', 'AUTO', 'FREE'),
('S-E01-021', 'E01', 'AUTO', 'FREE'),
('S-E01-022', 'E01', 'AUTO', 'FREE'),
('S-E01-023', 'E01', 'AUTO', 'FREE'),
('S-E01-024', 'E01', 'AUTO', 'FREE'),
('S-E01-025', 'E01', 'AUTO', 'FREE'),
('S-E01-026', 'E01', 'AUTO', 'FREE'),
('S-E01-027', 'E01', 'AUTO', 'FREE'),
('S-E01-028', 'E01', 'AUTO', 'FREE'),
('S-E01-029', 'E01', 'AUTO', 'FREE'),
('S-E01-030', 'E01', 'AUTO', 'FREE'),
('S-E01-031', 'E01', 'AUTO', 'FREE'),
('S-E01-032', 'E01', 'AUTO', 'FREE'),
('S-E01-033', 'E01', 'AUTO', 'FREE'),
('S-E01-034', 'E01', 'AUTO', 'FREE'),
('S-E01-035', 'E01', 'AUTO', 'FREE'),
('S-E01-036', 'E01', 'AUTO', 'FREE'),
('S-E01-037', 'E01', 'AUTO', 'FREE'),
('S-E01-038', 'E01', 'AUTO', 'FREE'),
('S-E01-039', 'E01', 'AUTO', 'FREE'),
('S-E01-040', 'E01', 'AUTO', 'FREE'),
('S-E01-041', 'E01', 'AUTO', 'FREE'),
('S-E01-042', 'E01', 'AUTO', 'FREE'),
('S-E01-043', 'E01', 'AUTO', 'FREE'),
('S-E01-044', 'E01', 'AUTO', 'FREE'),
('S-E01-045', 'E01', 'AUTO', 'FREE'),
('S-E01-046', 'E01', 'AUTO', 'FREE'),
('S-E01-047', 'E01', 'AUTO', 'FREE'),
('S-E01-048', 'E01', 'AUTO', 'FREE'),
('S-E01-049', 'E01', 'AUTO', 'FREE'),
('S-E01-050', 'E01', 'AUTO', 'FREE'),
('S-E01-051', 'E01', 'AUTO', 'FREE'),
('S-E01-052', 'E01', 'AUTO', 'FREE'),
('S-E01-053', 'E01', 'AUTO', 'FREE'),
('S-E01-054', 'E01', 'AUTO', 'FREE'),
('S-E01-055', 'E01', 'AUTO', 'FREE'),
('S-E01-056', 'E01', 'AUTO', 'FREE'),
('S-E01-057', 'E01', 'AUTO', 'FREE'),
('S-E01-058', 'E01', 'AUTO', 'FREE'),
('S-E01-059', 'E01', 'AUTO', 'FREE'),
('S-E01-060', 'E01', 'AUTO', 'FREE'),
('S-E01-061', 'E01', 'AUTO', 'FREE'),
('S-E01-062', 'E01', 'AUTO', 'FREE'),
('S-E01-063', 'E01', 'AUTO', 'FREE'),
('S-E01-064', 'E01', 'AUTO', 'FREE'),
('S-E01-065', 'E01', 'AUTO', 'FREE'),
('S-E01-066', 'E01', 'AUTO', 'FREE'),
('S-E01-067', 'E01', 'AUTO', 'FREE'),
('S-E01-068', 'E01', 'AUTO', 'FREE'),
('S-E01-069', 'E01', 'AUTO', 'FREE'),
('S-E01-070', 'E01', 'AUTO', 'FREE'),
('S-E02-001', 'E02', 'AUTO', 'FREE'),
('S-E02-002', 'E02', 'AUTO', 'FREE'),
('S-E02-003', 'E02', 'AUTO', 'FREE'),
('S-E02-004', 'E02', 'AUTO', 'FREE'),
('S-E02-005', 'E02', 'AUTO', 'FREE'),
('S-E02-006', 'E02', 'AUTO', 'FREE'),
('S-E02-007', 'E02', 'AUTO', 'FREE'),
('S-E02-008', 'E02', 'AUTO', 'FREE'),
('S-E02-009', 'E02', 'AUTO', 'FREE'),
('S-E02-010', 'E02', 'AUTO', 'FREE'),
('S-E02-011', 'E02', 'AUTO', 'FREE'),
('S-E02-012', 'E02', 'AUTO', 'FREE'),
('S-E02-013', 'E02', 'AUTO', 'FREE'),
('S-E02-014', 'E02', 'AUTO', 'FREE'),
('S-E02-015', 'E02', 'AUTO', 'FREE'),
('S-E02-016', 'E02', 'AUTO', 'FREE'),
('S-E02-017', 'E02', 'AUTO', 'FREE'),
('S-E02-018', 'E02', 'AUTO', 'FREE'),
('S-E02-019', 'E02', 'AUTO', 'FREE'),
('S-E02-020', 'E02', 'AUTO', 'FREE'),
('S-M01-001', 'M01', 'MOTO', 'FREE'),
('S-M01-002', 'M01', 'MOTO', 'FREE'),
('S-M01-003', 'M01', 'MOTO', 'FREE'),
('S-M01-004', 'M01', 'MOTO', 'FREE'),
('S-M01-005', 'M01', 'MOTO', 'FREE'),
('S-M01-006', 'M01', 'MOTO', 'FREE'),
('S-M01-007', 'M01', 'MOTO', 'FREE'),
('S-M01-008', 'M01', 'MOTO', 'FREE'),
('S-M01-009', 'M01', 'MOTO', 'FREE'),
('S-M01-010', 'M01', 'MOTO', 'FREE'),
('S-M01-011', 'M01', 'MOTO', 'FREE'),
('S-M01-012', 'M01', 'MOTO', 'FREE'),
('S-M01-013', 'M01', 'MOTO', 'FREE'),
('S-M01-014', 'M01', 'MOTO', 'FREE'),
('S-M01-015', 'M01', 'MOTO', 'FREE'),
('S-M01-016', 'M01', 'MOTO', 'FREE'),
('S-M01-017', 'M01', 'MOTO', 'FREE'),
('S-M01-018', 'M01', 'MOTO', 'FREE'),
('S-M01-019', 'M01', 'MOTO', 'FREE'),
('S-M01-020', 'M01', 'MOTO', 'FREE'),
('S-M01-021', 'M01', 'MOTO', 'FREE'),
('S-M01-022', 'M01', 'MOTO', 'FREE'),
('S-M01-023', 'M01', 'MOTO', 'FREE'),
('S-M01-024', 'M01', 'MOTO', 'FREE'),
('S-M01-025', 'M01', 'MOTO', 'FREE'),
('S-M01-026', 'M01', 'MOTO', 'FREE'),
('S-M01-027', 'M01', 'MOTO', 'FREE'),
('S-M01-028', 'M01', 'MOTO', 'FREE'),
('S-M01-029', 'M01', 'MOTO', 'FREE'),
('S-M01-030', 'M01', 'MOTO', 'FREE'),
('S-M01-031', 'M01', 'MOTO', 'FREE'),
('S-M01-032', 'M01', 'MOTO', 'FREE'),
('S-M01-033', 'M01', 'MOTO', 'FREE'),
('S-M01-034', 'M01', 'MOTO', 'FREE'),
('S-M01-035', 'M01', 'MOTO', 'FREE'),
('S-M01-036', 'M01', 'MOTO', 'FREE'),
('S-M01-037', 'M01', 'MOTO', 'FREE'),
('S-M01-038', 'M01', 'MOTO', 'FREE'),
('S-M01-039', 'M01', 'MOTO', 'FREE'),
('S-M01-040', 'M01', 'MOTO', 'FREE'),
('S-M01-041', 'M01', 'MOTO', 'FREE'),
('S-M01-042', 'M01', 'MOTO', 'FREE'),
('S-M01-043', 'M01', 'MOTO', 'FREE'),
('S-M01-044', 'M01', 'MOTO', 'FREE'),
('S-M01-045', 'M01', 'MOTO', 'FREE'),
('S-M01-046', 'M01', 'MOTO', 'FREE'),
('S-M01-047', 'M01', 'MOTO', 'FREE'),
('S-M01-048', 'M01', 'MOTO', 'FREE'),
('S-M01-049', 'M01', 'MOTO', 'FREE'),
('S-M01-050', 'M01', 'MOTO', 'FREE'),
('S-M01-051', 'M01', 'MOTO', 'FREE'),
('S-M01-052', 'M01', 'MOTO', 'FREE'),
('S-M01-053', 'M01', 'MOTO', 'FREE'),
('S-M01-054', 'M01', 'MOTO', 'FREE'),
('S-M01-055', 'M01', 'MOTO', 'FREE'),
('S-M01-056', 'M01', 'MOTO', 'FREE'),
('S-M01-057', 'M01', 'MOTO', 'FREE'),
('S-M01-058', 'M01', 'MOTO', 'FREE'),
('S-M01-059', 'M01', 'MOTO', 'FREE'),
('S-M01-060', 'M01', 'MOTO', 'FREE'),
('S-M01-061', 'M01', 'MOTO', 'FREE'),
('S-M01-062', 'M01', 'MOTO', 'FREE'),
('S-M01-063', 'M01', 'MOTO', 'FREE'),
('S-M01-064', 'M01', 'MOTO', 'FREE'),
('S-M01-065', 'M01', 'MOTO', 'FREE'),
('S-M01-066', 'M01', 'MOTO', 'FREE'),
('S-M01-067', 'M01', 'MOTO', 'FREE'),
('S-M01-068', 'M01', 'MOTO', 'FREE'),
('S-M01-069', 'M01', 'MOTO', 'FREE'),
('S-M01-070', 'M01', 'MOTO', 'FREE'),
('S-M01-071', 'M01', 'MOTO', 'FREE'),
('S-M01-072', 'M01', 'MOTO', 'FREE'),
('S-M01-073', 'M01', 'MOTO', 'FREE'),
('S-M01-074', 'M01', 'MOTO', 'FREE'),
('S-M01-075', 'M01', 'MOTO', 'FREE'),
('S-M01-076', 'M01', 'MOTO', 'FREE'),
('S-M01-077', 'M01', 'MOTO', 'FREE'),
('S-M01-078', 'M01', 'MOTO', 'FREE'),
('S-M01-079', 'M01', 'MOTO', 'FREE'),
('S-M01-080', 'M01', 'MOTO', 'FREE'),
('S-M01-081', 'M01', 'MOTO', 'FREE'),
('S-M01-082', 'M01', 'MOTO', 'FREE'),
('S-M01-083', 'M01', 'MOTO', 'FREE'),
('S-M01-084', 'M01', 'MOTO', 'FREE'),
('S-M01-085', 'M01', 'MOTO', 'FREE'),
('S-M01-086', 'M01', 'MOTO', 'FREE'),
('S-M01-087', 'M01', 'MOTO', 'FREE'),
('S-M01-088', 'M01', 'MOTO', 'FREE'),
('S-M01-089', 'M01', 'MOTO', 'FREE'),
('S-M01-090', 'M01', 'MOTO', 'FREE'),
('S-M01-091', 'M01', 'MOTO', 'FREE'),
('S-M01-092', 'M01', 'MOTO', 'FREE'),
('S-M01-093', 'M01', 'MOTO', 'FREE'),
('S-M01-094', 'M01', 'MOTO', 'FREE'),
('S-M01-095', 'M01', 'MOTO', 'FREE'),
('S-M01-096', 'M01', 'MOTO', 'FREE'),
('S-M01-097', 'M01', 'MOTO', 'FREE'),
('S-M01-098', 'M01', 'MOTO', 'FREE'),
('S-M01-099', 'M01', 'MOTO', 'FREE'),
('S-M01-100', 'M01', 'MOTO', 'FREE'),
('S-M01-101', 'M01', 'MOTO', 'FREE'),
('S-M01-102', 'M01', 'MOTO', 'FREE'),
('S-M01-103', 'M01', 'MOTO', 'FREE'),
('S-M01-104', 'M01', 'MOTO', 'FREE'),
('S-M01-105', 'M01', 'MOTO', 'FREE'),
('S-M01-106', 'M01', 'MOTO', 'FREE'),
('S-M01-107', 'M01', 'MOTO', 'FREE'),
('S-M01-108', 'M01', 'MOTO', 'FREE'),
('S-M01-109', 'M01', 'MOTO', 'FREE'),
('S-M01-110', 'M01', 'MOTO', 'FREE'),
('S-M01-111', 'M01', 'MOTO', 'FREE'),
('S-M01-112', 'M01', 'MOTO', 'FREE'),
('S-M01-113', 'M01', 'MOTO', 'FREE'),
('S-M01-114', 'M01', 'MOTO', 'FREE'),
('S-M01-115', 'M01', 'MOTO', 'FREE'),
('S-M01-116', 'M01', 'MOTO', 'FREE'),
('S-M01-117', 'M01', 'MOTO', 'FREE'),
('S-M01-118', 'M01', 'MOTO', 'FREE'),
('S-M01-119', 'M01', 'MOTO', 'FREE'),
('S-M01-120', 'M01', 'MOTO', 'FREE'),
('S-M02-001', 'M02', 'MOTO', 'FREE'),
('S-M02-002', 'M02', 'MOTO', 'FREE'),
('S-M02-003', 'M02', 'MOTO', 'FREE'),
('S-M02-004', 'M02', 'MOTO', 'FREE'),
('S-M02-005', 'M02', 'MOTO', 'FREE'),
('S-M02-006', 'M02', 'MOTO', 'FREE'),
('S-M02-007', 'M02', 'MOTO', 'FREE'),
('S-M02-008', 'M02', 'MOTO', 'FREE'),
('S-M02-009', 'M02', 'MOTO', 'FREE'),
('S-M02-010', 'M02', 'MOTO', 'FREE'),
('S-MC01-001', 'MC01', 'MOTO', 'FREE'),
('S-MC01-002', 'MC01', 'MOTO', 'FREE'),
('S-MC01-003', 'MC01', 'MOTO', 'FREE'),
('S-MC01-004', 'MC01', 'MOTO', 'FREE'),
('S-MC01-005', 'MC01', 'MOTO', 'FREE'),
('S-MC01-006', 'MC01', 'MOTO', 'FREE'),
('S-MC01-007', 'MC01', 'MOTO', 'FREE'),
('S-MC01-008', 'MC01', 'MOTO', 'FREE'),
('S-MC01-009', 'MC01', 'MOTO', 'FREE'),
('S-MC01-010', 'MC01', 'MOTO', 'FREE'),
('S-MC01-011', 'MC01', 'MOTO', 'FREE'),
('S-MC01-012', 'MC01', 'MOTO', 'FREE'),
('S-MC01-013', 'MC01', 'MOTO', 'FREE'),
('S-MC01-014', 'MC01', 'MOTO', 'FREE'),
('S-MC01-015', 'MC01', 'MOTO', 'FREE'),
('S-MC01-016', 'MC01', 'MOTO', 'FREE'),
('S-MC01-017', 'MC01', 'MOTO', 'FREE'),
('S-MC01-018', 'MC01', 'MOTO', 'FREE'),
('S-MC01-019', 'MC01', 'MOTO', 'FREE'),
('S-MC01-020', 'MC01', 'MOTO', 'FREE'),
('S-MC01-021', 'MC01', 'MOTO', 'FREE'),
('S-MC01-022', 'MC01', 'MOTO', 'FREE'),
('S-MC01-023', 'MC01', 'MOTO', 'FREE'),
('S-MC01-024', 'MC01', 'MOTO', 'FREE'),
('S-MC01-025', 'MC01', 'MOTO', 'FREE'),
('S-MC01-026', 'MC01', 'MOTO', 'FREE'),
('S-MC01-027', 'MC01', 'MOTO', 'FREE'),
('S-MC01-028', 'MC01', 'MOTO', 'FREE'),
('S-MC01-029', 'MC01', 'MOTO', 'FREE'),
('S-MC01-030', 'MC01', 'MOTO', 'FREE'),
('S-MC01-031', 'MC01', 'MOTO', 'FREE'),
('S-MC01-032', 'MC01', 'MOTO', 'FREE'),
('S-MC01-033', 'MC01', 'MOTO', 'FREE'),
('S-MC01-034', 'MC01', 'MOTO', 'FREE'),
('S-MC01-035', 'MC01', 'MOTO', 'FREE'),
('S-MC01-036', 'MC01', 'MOTO', 'FREE'),
('S-MC01-037', 'MC01', 'MOTO', 'FREE'),
('S-MC01-038', 'MC01', 'MOTO', 'FREE'),
('S-MC01-039', 'MC01', 'MOTO', 'FREE'),
('S-MC01-040', 'MC01', 'MOTO', 'FREE'),
('S-MC01-041', 'MC01', 'MOTO', 'FREE'),
('S-MC01-042', 'MC01', 'MOTO', 'FREE'),
('S-MC01-043', 'MC01', 'MOTO', 'FREE'),
('S-MC01-044', 'MC01', 'MOTO', 'FREE'),
('S-MC01-045', 'MC01', 'MOTO', 'FREE'),
('S-MC02-001', 'MC02', 'MOTO', 'FREE'),
('S-MC02-002', 'MC02', 'MOTO', 'FREE'),
('S-MC02-003', 'MC02', 'MOTO', 'FREE'),
('S-MC02-004', 'MC02', 'MOTO', 'FREE'),
('S-MC02-005', 'MC02', 'MOTO', 'FREE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `placa` varchar(15) DEFAULT NULL,
  `area_id` varchar(10) DEFAULT NULL,
  `spot_id` varchar(10) DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `modo` enum('FLAT','VARIABLE') DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `salida_temporal` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `placa`, `area_id`, `spot_id`, `fecha_ingreso`, `fecha_salida`, `modo`, `monto`, `salida_temporal`) VALUES
(17, 'REERGRGRE', 'M01', 'S-M01-001', '2025-11-14 18:32:28', '2025-11-14 18:32:47', 'VARIABLE', 2.00, NULL),
(18, 'REERGRGRE', 'M01', 'S-M01-001', '2025-11-14 18:33:13', '2025-11-14 19:57:55', 'VARIABLE', 2.00, '2025-11-14 18:33:26'),
(19, 'EWWEFWEFW', 'E01', 'S-E01-001', '2025-11-14 20:17:06', '2025-11-14 21:31:54', 'FLAT', 15.00, NULL),
(20, 'FEWFWEFDS', 'C01', 'S-C01-001', '2025-11-14 21:27:29', '2025-11-14 21:32:03', 'FLAT', 15.00, NULL),
(21, 'FEWFEWF4', 'C01', 'S-C01-001', '2025-11-14 21:33:13', '2025-11-14 21:33:47', 'FLAT', 15.00, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `placa` varchar(15) NOT NULL,
  `tipo_vehiculo` varchar(20) DEFAULT NULL,
  `tipo_area` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`placa`, `tipo_vehiculo`, `tipo_area`) VALUES
('DFWEFDSE', 'MOTO', 'ESTUDIANTE'),
('DFWEFWEF', 'AUTO', 'VISITANTE'),
('dgsedse', 'AUTO', 'CATEDRATICO'),
('efsdefs', 'MOTO', 'CATEDRATICO'),
('EFWEFWEFWE', 'MOTO', 'ESTUDIANTE'),
('EFWFWEF', 'AUTO', 'ESTUDIANTE'),
('ERWFWEFWEF', 'AUTO', 'CATEDRATICO'),
('ewfdsew', 'AUTO', 'CATEDRATICO'),
('ewfdsewf', 'MOTO', 'VISITANTE'),
('EWFWEF', 'AUTO', 'CATEDRATICO'),
('EWFWEFEW', 'AUTO', 'VISITANTE'),
('EWFWEFEW3', 'AUTO', 'CATEDRATICO'),
('ewfwefewe', 'AUTO', 'CATEDRATICO'),
('EWWEFWEFW', 'AUTO', 'ESTUDIANTE'),
('fdsfsdfds', 'MOTO', 'VISITANTE'),
('FEWFEWF', 'AUTO', 'VISITANTE'),
('FEWFEWF3', 'MOTO', 'VISITANTE'),
('FEWFEWF4', 'AUTO', 'CATEDRATICO'),
('fewfjnwej', 'MOTO', 'ESTUDIANTE'),
('fewfwefds', 'AUTO', 'CATEDRATICO'),
('FWEFWEFEWF', 'MOTO', 'CATEDRATICO'),
('gdfgdfgdf', 'AUTO', 'VISITANTE'),
('GREGERGERGER', 'MOTO', 'VISITANTE'),
('GREGERGERGSD', 'MOTO', 'CATEDRATICO'),
('M-012LMN', 'MOTO', 'ESTUDIANTE'),
('M-013KLM', 'MOTO', 'ESTUDIANTE'),
('M-013OPQ', 'MOTO', 'ESTUDIANTE'),
('M-013STU', 'MOTO', 'ESTUDIANTE'),
('M-013WXY', 'MOTO', 'ESTUDIANTE'),
('M-035IJK', 'MOTO', 'ESTUDIANTE'),
('M-111STU', 'MOTO', 'CATEDRATICO'),
('M-135MNO', 'MOTO', 'ESTUDIANTE'),
('M-148JKL', 'MOTO', 'ESTUDIANTE'),
('M-222BCD', 'MOTO', 'ESTUDIANTE'),
('M-235CDE', 'MOTO', 'ESTUDIANTE'),
('M-235QRS', 'MOTO', 'ESTUDIANTE'),
('M-235UVW', 'MOTO', 'ESTUDIANTE'),
('M-235YZA', 'MOTO', 'ESTUDIANTE'),
('M-258ABC', 'MOTO', 'ESTUDIANTE'),
('M-258NOP', 'MOTO', 'ESTUDIANTE'),
('M-333HIJ', 'MOTO', 'ESTUDIANTE'),
('M-368RST', 'MOTO', 'ESTUDIANTE'),
('M-369DEF', 'MOTO', 'ESTUDIANTE'),
('M-444QRS', 'MOTO', 'ESTUDIANTE'),
('M-468VWX', 'MOTO', 'ESTUDIANTE'),
('M-470PQR', 'MOTO', 'ESTUDIANTE'),
('M-480TUV', 'MOTO', 'ESTUDIANTE'),
('M-555WXY', 'MOTO', 'ESTUDIANTE'),
('M-568DEF', 'MOTO', 'ESTUDIANTE'),
('M-568HIJ', 'MOTO', 'ESTUDIANTE'),
('M-568ZAB', 'MOTO', 'ESTUDIANTE'),
('M-580XYZ', 'MOTO', 'ESTUDIANTE'),
('M-666FGH', 'MOTO', 'ESTUDIANTE'),
('M-680BCD', 'MOTO', 'ESTUDIANTE'),
('M-703YZA', 'MOTO', 'ESTUDIANTE'),
('M-777XYZ', 'MOTO', 'CATEDRATICO'),
('M-780FGH', 'MOTO', 'ESTUDIANTE'),
('M-780JKL', 'MOTO', 'ESTUDIANTE'),
('M-780NOP', 'MOTO', 'ESTUDIANTE'),
('M-813CDE', 'MOTO', 'ESTUDIANTE'),
('M-888UVW', 'MOTO', 'ESTUDIANTE'),
('M-913GHI', 'MOTO', 'ESTUDIANTE'),
('M-925EFG', 'MOTO', 'ESTUDIANTE'),
('M-999MNO', 'MOTO', 'VISITANTE'),
('O-124NOP', 'AUTO', 'CATEDRATICO'),
('P-024JKL', 'AUTO', 'CATEDRATICO'),
('P-036HIJ', 'AUTO', 'ESTUDIANTE'),
('P-037GHI', 'AUTO', 'VISITANTE'),
('P-123ABC', 'AUTO', 'ESTUDIANTE'),
('P-124RST', 'AUTO', 'CATEDRATICO'),
('P-124VWX', 'AUTO', 'CATEDRATICO'),
('P-124ZAB', 'AUTO', 'CATEDRATICO'),
('P-135NOP', 'AUTO', 'VISITANTE'),
('P-146LMN', 'AUTO', 'ESTUDIANTE'),
('P-147KLM', 'AUTO', 'VISITANTE'),
('P-234JKL', 'AUTO', 'ESTUDIANTE'),
('P-246PQR', 'AUTO', 'ESTUDIANTE'),
('P-246TUV', 'AUTO', 'CATEDRATICO'),
('P-257OPQ', 'AUTO', 'VISITANTE'),
('P-259MNO', 'AUTO', 'CATEDRATICO'),
('P-321YZA', 'AUTO', 'VISITANTE'),
('P-345RST', 'AUTO', 'VISITANTE'),
('P-346BCD', 'AUTO', 'ESTUDIANTE'),
('P-346FGH', 'AUTO', 'VISITANTE'),
('P-346TUV', 'AUTO', 'ESTUDIANTE'),
('P-346XYZ', 'AUTO', 'ESTUDIANTE'),
('P-357STU', 'AUTO', 'VISITANTE'),
('P-357ZAB', 'AUTO', 'ESTUDIANTE'),
('P-369QRS', 'AUTO', 'CATEDRATICO'),
('P-456DEF', 'AUTO', 'VISITANTE'),
('P-457ABC', 'AUTO', 'VISITANTE'),
('P-457EFG', 'AUTO', 'VISITANTE'),
('P-457WXY', 'AUTO', 'VISITANTE'),
('P-468CDE', 'AUTO', 'VISITANTE'),
('P-479UVW', 'AUTO', 'CATEDRATICO'),
('P-567PQR', 'AUTO', 'ESTUDIANTE'),
('P-579IJK', 'AUTO', 'CATEDRATICO'),
('P-579YZA', 'AUTO', 'CATEDRATICO'),
('P-581STU', 'AUTO', 'ESTUDIANTE'),
('P-591WXY', 'AUTO', 'ESTUDIANTE'),
('P-654EFG', 'AUTO', 'CATEDRATICO'),
('P-679CDE', 'AUTO', 'CATEDRATICO'),
('P-679GHI', 'AUTO', 'CATEDRATICO'),
('P-679KLM', 'AUTO', 'CATEDRATICO'),
('P-680OPQ', 'AUTO', 'ESTUDIANTE'),
('P-691ABC', 'AUTO', 'ESTUDIANTE'),
('P-692VWX', 'AUTO', 'VISITANTE'),
('P-702ZAB', 'AUTO', 'VISITANTE'),
('P-789GHI', 'AUTO', 'CATEDRATICO'),
('P-791EFG', 'AUTO', 'ESTUDIANTE'),
('P-802DEF', 'AUTO', 'VISITANTE'),
('P-802XYZ', 'AUTO', 'CATEDRATICO'),
('P-814BCD', 'AUTO', 'CATEDRATICO'),
('P-890VWX', 'AUTO', 'ESTUDIANTE'),
('P-891IJK', 'AUTO', 'ESTUDIANTE'),
('P-891MNO', 'AUTO', 'ESTUDIANTE'),
('P-891QRS', 'AUTO', 'ESTUDIANTE'),
('P-902HIJ', 'AUTO', 'VISITANTE'),
('P-902LMN', 'AUTO', 'VISITANTE'),
('P-902PQR', 'AUTO', 'VISITANTE'),
('P-902TUV', 'AUTO', 'VISITANTE'),
('P-924FGH', 'AUTO', 'CATEDRATICO'),
('P-926DEF', 'AUTO', 'ESTUDIANTE'),
('P-987KLM', 'AUTO', 'ESTUDIANTE'),
('REERGRGRE', 'MOTO', 'ESTUDIANTE'),
('safasfas', 'AUTO', 'CATEDRATICO'),
('sfasfasfas', 'MOTO', 'ESTUDIANTE'),
('WEEWFWEFWE', 'MOTO', 'ESTUDIANTE'),
('wefwefefw', 'AUTO', 'CATEDRATICO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`area_id`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`placa`);

--
-- Indices de la tabla `spots`
--
ALTER TABLE `spots`
  ADD PRIMARY KEY (`spot_id`),
  ADD KEY `area_id` (`area_id`);

--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `placa` (`placa`),
  ADD KEY `area_id` (`area_id`),
  ADD KEY `spot_id` (`spot_id`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`placa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `spots`
--
ALTER TABLE `spots`
  ADD CONSTRAINT `spots_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`);

--
-- Filtros para la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`placa`) REFERENCES `vehiculos` (`placa`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`),
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`spot_id`) REFERENCES `spots` (`spot_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
