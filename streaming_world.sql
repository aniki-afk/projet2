-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 26 déc. 2019 à 16:46
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `streaming_world`
--

-- --------------------------------------------------------

--
-- Structure de la table `orderline`
--

DROP TABLE IF EXISTS `orderline`;
CREATE TABLE IF NOT EXISTS `orderline` (
  `Order_Id` int(11) NOT NULL,
  `Product_Id` int(11) NOT NULL,
  `Quantity_Ordered` int(200) NOT NULL,
  `PriceEach` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `User_Id` int(11) NOT NULL,
  `TaxRate` double DEFAULT NULL,
  `TaxAmount` double DEFAULT NULL,
  `TotalAmount` double DEFAULT NULL,
  `CreationTimestamp` datetime DEFAULT NULL,
  `CompleteTimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(120) NOT NULL,
  `ProductLine` varchar(50) NOT NULL,
  `Description` varchar(900) NOT NULL,
  `QuantityInStock` int(255) NOT NULL,
  `BuyPrice` double NOT NULL,
  `Price` double NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `streaming`
--

DROP TABLE IF EXISTS `streaming`;
CREATE TABLE IF NOT EXISTS `streaming` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Caption` varchar(120) NOT NULL,
  `Description` varchar(900) NOT NULL,
  `Video` varchar(120) NOT NULL,
  `Image` varchar(120) NOT NULL,
  `CreationTimestamp` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(120) NOT NULL,
  `LastName` varchar(120) NOT NULL,
  `Email` varchar(120) NOT NULL,
  `Pseudo` varchar(20) DEFAULT NULL,
  `Password` varchar(120) NOT NULL,
  `Address` varchar(360) NOT NULL,
  `City` varchar(120) NOT NULL,
  `Zip` varchar(11) NOT NULL,
  `Role` varchar(11) NOT NULL,
  `CreationTimestamp` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`Id`, `FirstName`, `LastName`, `Email`, `Pseudo`, `Password`, `Address`, `City`, `Zip`, `Role`, `CreationTimestamp`) VALUES
(1, 'Abmane', 'Oussoul', 'admin@gmail.com', 'admin', '$2y$11$1cf67a5dea60152ac284fu.dmjXduH4H4JEW7C3vmtO/PI1mx9cAa', '01 avenue nord', 'Paris', '75010', 'admin', '2019-12-26 16:53:31');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
