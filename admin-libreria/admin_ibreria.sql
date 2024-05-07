-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3309
-- Tiempo de generación: 07-05-2024 a las 02:04:31
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `admin-libreria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `author`
--

DROP TABLE IF EXISTS `author`;
CREATE TABLE IF NOT EXISTS `author` (
  `authorid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('Enable','Disable') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`authorid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `author`
--

INSERT INTO `author` (`authorid`, `name`, `status`) VALUES
(2, 'Alan Forbes', 'Enable'),
(3, 'Lynn Beighley &amp; Michael Morrison', 'Enable'),
(4, 'Luis Miguel Cabezas Granado', 'Enable');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `bookid` int NOT NULL AUTO_INCREMENT,
  `categoryid` int NOT NULL,
  `authorid` int NOT NULL,
  `rackid` int NOT NULL,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `picture` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `publisherid` int NOT NULL,
  `isbn` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `no_of_copy` int NOT NULL,
  `status` enum('Enable','Disable') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `book`
--

INSERT INTO `book` (`bookid`, `categoryid`, `authorid`, `rackid`, `name`, `picture`, `publisherid`, `isbn`, `no_of_copy`, `status`, `added_on`, `updated_on`) VALUES
(1, 2, 2, 2, 'The Joy of PHP Programming', 'joy-php.jpg', 8, 'B00BALXN70', 10, 'Enable', '2022-06-12 11:12:48', '2022-06-12 11:13:27'),
(2, 2, 3, 2, 'Head First PHP &amp;amp; MySQL', 'header-first-php.jpg', 9, '0596006306', 10, 'Enable', '2022-06-12 11:16:01', '2022-06-12 11:16:01'),
(3, 2, 4, 2, 'Curso de PHP 8 Y MySQL 8: Manual Imprescindible', '', 10, '9788441543720', 23, 'Enable', '2022-06-12 13:29:14', '2022-06-12 13:29:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `categoryid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('Enable','Disable') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`categoryid`, `name`, `status`) VALUES
(1, 'Web Design', 'Enable'),
(2, 'Programming', 'Enable'),
(3, 'Commerce', 'Enable'),
(4, 'Math', 'Enable'),
(6, 'Web Development', 'Enable');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `issued_book`
--

DROP TABLE IF EXISTS `issued_book`;
CREATE TABLE IF NOT EXISTS `issued_book` (
  `issuebookid` int NOT NULL AUTO_INCREMENT,
  `bookid` int NOT NULL,
  `userid` int NOT NULL,
  `issue_date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expected_return_date` datetime NOT NULL,
  `return_date_time` datetime NOT NULL,
  `status` enum('Issued','Returned','Not Return') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`issuebookid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `issued_book`
--

INSERT INTO `issued_book` (`issuebookid`, `bookid`, `userid`, `issue_date_time`, `expected_return_date`, `return_date_time`, `status`) VALUES
(1, 2, 2, '2022-06-12 15:33:45', '2022-06-15 16:27:59', '2022-06-16 16:27:59', 'Issued'),
(3, 3, 3, '2022-06-12 18:46:07', '2022-06-30 18:46:02', '2022-06-12 18:46:14', 'Returned');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publisher`
--

DROP TABLE IF EXISTS `publisher`;
CREATE TABLE IF NOT EXISTS `publisher` (
  `publisherid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` enum('Enable','Disable') NOT NULL,
  PRIMARY KEY (`publisherid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `publisher`
--

INSERT INTO `publisher` (`publisherid`, `name`, `status`) VALUES
(2, 'Amazon publishing', 'Enable'),
(3, 'Penguin books ltd.', 'Enable'),
(4, 'Vintage Publishing', 'Enable'),
(5, 'Macmillan Publishers', 'Enable'),
(6, 'Simon &amp; Schuster', 'Enable'),
(7, 'HarperCollins', 'Enable'),
(8, 'Plum Island', 'Enable'),
(9, 'O’Reilly', 'Enable'),
(10, 'Anaya Multimedia', 'Enable');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rack`
--

DROP TABLE IF EXISTS `rack`;
CREATE TABLE IF NOT EXISTS `rack` (
  `rackid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('Enable','Disable') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Enable',
  PRIMARY KEY (`rackid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `rack`
--

INSERT INTO `rack` (`rackid`, `name`, `status`) VALUES
(1, 'R1', 'Enable'),
(2, 'R2', 'Enable');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `role` enum('admin','user') DEFAULT 'admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `password`, `role`) VALUES
(2, 'Pedro', 'Usuario', 'pusuario@cweb.com', '4b67deeb9aba04a5b54632ad19934f26', 'user'),
(3, 'Juan', 'Usuario', 'jusuario@cweb.com', '4b67deeb9aba04a5b54632ad19934f26', 'user'),
(4, 'Mauricio', 'Sevilla', 'hola@configuroweb.com', '4b67deeb9aba04a5b54632ad19934f26', 'admin');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
