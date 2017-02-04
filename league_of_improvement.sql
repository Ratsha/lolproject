-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Vært: localhost
-- Genereringstid: 04. 02 2017 kl. 15:51:22
-- Serverversion: 5.5.24-log
-- PHP-version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `league_of_improvement`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `champions`
--

CREATE TABLE IF NOT EXISTS `champions` (
  `championId` int(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`championId`),
  UNIQUE KEY `name_2` (`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `champions`
--

INSERT INTO `champions` (`championId`, `name`, `image`) VALUES
(1, 'Annie', '..'),
(2, 'Olaf', '..'),
(3, 'Galio', '..'),
(4, 'Twisted Fate', '..'),
(5, 'Xin Zhao', '..'),
(6, 'Urgot', '..'),
(7, 'LeBlanc', '..'),
(8, 'Vladimir', '..'),
(9, 'Fiddlesticks', '..'),
(10, 'Kayle', '..'),
(11, 'Master Yi', '..'),
(12, 'Alistar', '..'),
(13, 'Ryze', '..'),
(14, 'Sion', '..'),
(15, 'Sivir', '..'),
(16, 'Soraka', '..'),
(17, 'Teemo', '..'),
(18, 'Tristana', '..'),
(19, 'Warwick', '..'),
(20, 'Nunu', '..'),
(21, 'Miss Fortune', '..'),
(22, 'Ashe', '..'),
(23, 'Tryndamere', '..'),
(24, 'Jax', '..'),
(25, 'Morgana', '..'),
(26, 'Zilean', '..'),
(27, 'Singed', '..'),
(28, 'Evelynn', '..'),
(29, 'Twitch', '..'),
(30, 'Karthus', '..'),
(31, 'Cho''Gath', '..'),
(32, 'Amumu', '..'),
(33, 'Rammus', '..'),
(34, 'Anivia', '..'),
(35, 'Shaco', '..'),
(36, 'Dr. Mundo', '..'),
(37, 'Sona', '..'),
(38, 'Kassadin', '..'),
(39, 'Irelia', '..'),
(40, 'Janna', '..'),
(41, 'Gangplank', '..'),
(42, 'Corki', '..'),
(43, 'Karma', '..'),
(44, 'Taric', '..'),
(45, 'Veigar', '..'),
(48, 'Trundle', '..'),
(50, 'Swain', '..'),
(51, 'Caitlyn', '..'),
(53, 'Blitzcrank', '..'),
(54, 'Malphite', '..'),
(55, 'Katarina', '..'),
(56, 'Nocturne', '..'),
(57, 'Maokai', '..'),
(58, 'Renekton', '..'),
(59, 'Jarvan IV', '..'),
(60, 'Elise', '..'),
(61, 'Orianna', '..'),
(62, 'Wukong', '..'),
(63, 'Brand', '..'),
(64, 'Lee Sin', '..'),
(67, 'Vayne', '..'),
(68, 'Rumble', '..'),
(69, 'Cassiopeia', '..'),
(72, 'Skarner', '..'),
(74, 'Heimerdinger', '..'),
(75, 'Nasus', '..'),
(76, 'Nidalee', '..'),
(77, 'Udyr', '..'),
(78, 'Poppy', '..'),
(79, 'Gragas', '..'),
(80, 'Pantheon', '..'),
(81, 'Ezreal', '..'),
(82, 'Mordekaiser', '..'),
(83, 'Yorick', '..'),
(84, 'Akali', '..'),
(85, 'Kennen', '..'),
(86, 'Garen', '..'),
(89, 'Leona', '..'),
(90, 'Malzahar', '..'),
(91, 'Talon', '..'),
(92, 'Riven', '..'),
(96, 'Kog''Maw', '..'),
(98, 'Shen', '..'),
(99, 'Lux', '..'),
(101, 'Xerath', '..'),
(102, 'Shyvana', '..'),
(103, 'Ahri', '..'),
(104, 'Graves', '..'),
(105, 'Fizz', '..'),
(106, 'Volibear', '..'),
(107, 'Rengar', '..'),
(110, 'Varus', '..'),
(111, 'Nautilus', '..'),
(112, 'Viktor', '..'),
(113, 'Sejuani', '..'),
(114, 'Fiora', '..'),
(115, 'Ziggs', '..'),
(117, 'Lulu', '..'),
(119, 'Draven', '..'),
(120, 'Hecarim', '..'),
(121, 'Kha''Zix', '..'),
(122, 'Darius', '..'),
(126, 'Jayce', '..'),
(127, 'Lissandra', '..'),
(131, 'Diana', '..'),
(133, 'Quinn', '..'),
(134, 'Syndra', '..'),
(136, 'Aurelion Sol', '..'),
(143, 'Zyra', '..'),
(150, 'Gnar', '..'),
(154, 'Zac', '..'),
(157, 'Yasuo', '..'),
(161, 'Vel''Koz', '..'),
(163, 'Taliyah', '..'),
(164, 'Camille', '..'),
(201, 'Braum', '..'),
(202, 'Jhin', '..'),
(203, 'Kindred', '..'),
(222, 'Jinx', '..'),
(223, 'Tahm Kench', '..'),
(236, 'Lucian', '..'),
(238, 'Zed', '..'),
(240, 'Kled', '..'),
(245, 'Ekko', '..'),
(254, 'Vi', '..'),
(266, 'Aatrox', '..'),
(267, 'Nami', '..'),
(268, 'Azir', '..'),
(412, 'Thresh', '..'),
(420, 'Illaoi', '..'),
(421, 'Rek''Sai', '..'),
(427, 'Ivern', '..'),
(429, 'Kalista', '..'),
(432, 'Bard', '..');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `matches`
--

CREATE TABLE IF NOT EXISTS `matches` (
  `matchId` int(11) NOT NULL,
  `summonerId` int(11) NOT NULL,
  `time` int(13) NOT NULL,
  `championId` int(3) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`matchId`),
  KEY `summonerId` (`summonerId`,`time`,`championId`),
  KEY `championId` (`championId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `summoners`
--

CREATE TABLE IF NOT EXISTS `summoners` (
  `summonerId` int(11) NOT NULL,
  `name` varchar(16) NOT NULL,
  `lastUpdated` int(13) NOT NULL,
  PRIMARY KEY (`summonerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`championId`) REFERENCES `champions` (`championId`),
  ADD CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`summonerId`) REFERENCES `summoners` (`summonerId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
