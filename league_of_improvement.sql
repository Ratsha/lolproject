-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Vært: localhost
-- Genereringstid: 11. 02 2017 kl. 14:11:05
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

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `matches`
--

CREATE TABLE IF NOT EXISTS `matches` (
  `matchId` bigint(11) NOT NULL,
  `summonerId` int(11) NOT NULL,
  `time` bigint(13) NOT NULL,
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
  `lastUpdated` bigint(13) unsigned NOT NULL,
  PRIMARY KEY (`summonerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`summonerId`) REFERENCES `summoners` (`summonerId`),
  ADD CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`championId`) REFERENCES `champions` (`championId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
