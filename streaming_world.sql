-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 04 jan. 2020 à 16:46
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
-- Structure de la table `artworks`
--

DROP TABLE IF EXISTS `artworks`;
CREATE TABLE IF NOT EXISTS `artworks` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(120) NOT NULL,
  `Url` varchar(500) NOT NULL,
  `Image` varchar(120) NOT NULL,
  `Image_Cover` varchar(150) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `artworks`
--

INSERT INTO `artworks` (`Id`, `Name`, `Url`, `Image`, `Image_Cover`) VALUES
(1, 'Kimetsu No Yaiba', 'kny', 'kny_cover.gif', 'kny_cover.jpg'),
(2, 'Dragon Ball', 'db', 'db_cover.gif', 'db_cover.jpg'),
(3, 'Naruto', 'naruto', 'naruto_cover.gif', 'naruto_cover.jpg'),
(4, 'One Piece', 'op', 'op_cover.gif', 'op_cover.jpg'),
(5, 'My Hero Academia', 'mha', 'mha_cover.gif', 'mha_cover.jpg'),
(6, 'One Punch Man', 'opm', 'opm_cover.gif', 'opm_cover.jpg'),
(7, 'Vinland Saga', 'vs', 'vs_cover.gif', 'vs_cover.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Post_Id` int(200) NOT NULL,
  `Contents` varchar(900) NOT NULL,
  `Nickname` varchar(255) NOT NULL,
  `CreationTimestamp` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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

--
-- Déchargement des données de la table `orderline`
--

INSERT INTO `orderline` (`Order_Id`, `Product_Id`, `Quantity_Ordered`, `PriceEach`) VALUES
(1, 2, 1, 42),
(1, 28, 1, 55),
(1, 23, 1, 195),
(2, 24, 1, 15),
(2, 25, 1, 15),
(2, 26, 1, 22.5),
(3, 7, 1, 130),
(4, 27, 1, 175),
(5, 1, 1, 70),
(6, 26, 3, 22.5);

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`Id`, `User_Id`, `TaxRate`, `TaxAmount`, `TotalAmount`, `CreationTimestamp`, `CompleteTimestamp`) VALUES
(1, 1, 20, 5840, 292, '2020-01-03 10:26:19', NULL),
(2, 1, 20, 1050, 52.5, '2020-01-03 10:27:34', NULL),
(3, 1, 20, 2600, 130, '2020-01-03 10:29:08', '2020-01-03 10:30:28'),
(4, 1, 20, 3500, 175, '2020-01-03 10:30:53', '2020-01-03 11:02:29'),
(5, 1, 20, 1400, 70, '2020-01-03 11:55:15', '2020-01-03 11:55:15'),
(6, 1, 20, 1350, 67.5, '2020-01-04 17:45:23', '2020-01-04 17:45:23');

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Content` varchar(900) NOT NULL,
  `CreationTimestamp` datetime NOT NULL,
  `Nickname` varchar(255) NOT NULL,
  `Product_Id` int(255) DEFAULT NULL,
  `Episode_Id` int(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`Id`, `Content`, `CreationTimestamp`, `Nickname`, `Product_Id`, `Episode_Id`) VALUES
(1, 'hate de voir la suite !!', '2020-01-04 15:30:46', 'admin', NULL, 1),
(31, 'Superbe episode!', '2020-01-04 16:25:56', 'admin', NULL, 1),
(30, 'Superbe episode!', '2020-01-04 16:25:46', 'admin', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `productline`
--

DROP TABLE IF EXISTS `productline`;
CREATE TABLE IF NOT EXISTS `productline` (
  `ProductLine` varchar(50) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`ProductLine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `productline`
--

INSERT INTO `productline` (`ProductLine`) VALUES
('accessoires'),
('blu-ray'),
('figurines'),
('tome');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Artworks_Id` int(11) NOT NULL,
  `Name` varchar(120) NOT NULL,
  `Photo` varchar(90) NOT NULL,
  `ProductLine` varchar(50) NOT NULL,
  `Description` varchar(900) NOT NULL,
  `QuantityInStock` int(255) NOT NULL,
  `BuyPrice` double NOT NULL,
  `Price` double NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`Id`, `Artworks_Id`, `Name`, `Photo`, `ProductLine`, `Description`, `QuantityInStock`, `BuyPrice`, `Price`) VALUES
(1, 2, 'SonGoku Ultra Instinct Dragon Ball Super', 'GokuMui.png', 'figurines', 'Banpresto Figurine - DBZ - Son Goku FES Vol 8 - Ultra Instinct Son Goku - 20 cm ', 50, 0.8, 70),
(2, 3, 'Naruto Shippuden Bijuu Mode', 'NarutoBijuu.jpg', 'figurines', 'TAMASHII NATIONS Naruto Shippuden Naruto Uzumaki -Kurama- Kizuna Relation, BandaiFiguartsZERO', 35, 0.8, 42),
(3, 4, 'Monkey D. Luffy 4ème', 'LuffyGear4.jpg', 'figurines', 'One Piece Modèle Surdimensionné Monkey D. Luffy 4ème Scène Statue Décoration D\'animation', 120, 0.8, 128),
(5, 1, 'Kamado Tanjiro', 'tanjiro.jpg', 'figurines', 'Demon Slayer PVC Action Figures Kamado Tanjirou Tenth Style The Dragon of Change Anime Kimetsu no Yaiba Figurine', 500, 15, 50),
(7, 5, 'All Might United States of Smash', 'allmight.jpg', 'figurines', 'Figurine Boku no Hero Academia - All Might & All For One - United States of Smash Version', 500, 95, 130),
(23, 6, 'Genos One Punch Man', 'genos.jpg', 'figurines', 'Genos By Tsume One Punch Man. La figurine est dotée d\'un système d\'éclairage LED complexe! Les pièces mécaniques de ses bras sont très détaillées ! Poids: 10 kg, largeur: 40cm, longueur: 40 cm, hauteur: 49 cm.', 500, 110, 195),
(22, 3, 'Madara Uchiwa by TSUME PRECO', 'madara.jpg', 'figurines', 'Naruto Shippuden - Figurine Madara Uchiwa by TSUME\r\nL\'échelle 1/4 a permis une sculpture plus fine de l\'armure ainsi que du pelage du Kyubi. Les LEDs incluent dans les yeux de Madara et du Kyubi mettent en valeur leur Sharingan.\r\nTaille : 51 cm', 500, 100, 185),
(21, 4, 'Empereur Kaido', 'Kaido.jpg', 'figurines', 'Anime One Piece quatre empereurs Kaido PVC Action Figure Modèle 19cm	', 250, 50, 65),
(24, 1, 'Tanjiro Pikachu version', 'PokeTanjiro.jpg', 'figurines', 'Véritable anime phénomène,  Kimetsu no Yaiba a déboulé dans la vie de nombreux fans de manga et d\'anime sans prévenir. Mais puisque créer des figurines à l\'effigie des personnages de l\'anime était trop simple, la société Game Harbors a souhaité mettre à l\'honneur un crossover un peu particulier : Kimetsu no Yaiba x Pokémon. Tanjiro sous la forme d\'un Pikachu (13cm).', 500, 5, 15),
(25, 1, 'Nezuko Pikachu version', 'PokeNezuko.jpg', 'figurines', 'Véritable anime phénomène,  Kimetsu no Yaiba a déboulé dans la vie de nombreux fans de manga et d\'anime sans prévenir. Mais puisque créer des figurines à l\'effigie des personnages de l\'anime était trop simple, la société Game Harbors a souhaité mettre à l\'honneur un crossover un peu particulier : Kimetsu no Yaiba x Pokémon. Nezuko sous la forme d\'un Pikachu (13cm).', 500, 5, 15),
(26, 1, 'Tanjiro et Nezuko Pikachu version', 'PokeTanjiro&Nezuko.jpg', 'figurines', 'Véritable anime phénomène,  Kimetsu no Yaiba a déboulé dans la vie de nombreux fans de manga et d\'anime sans prévenir. Mais puisque créer des figurines à l\'effigie des personnages de l\'anime était trop simple, la société Game Harbors a souhaité mettre à l\'honneur un crossover un peu particulier : Kimetsu no Yaiba x Pokémon. Ainsi, Tanjiro et Nezuko s\'illustrent alors sous la forme d\'un Pikachu (13cm).', 500, 10, 22.5),
(27, 2, 'GOGETA SSJ BLUE 52CM', 'gogita.png', 'figurines', 'Figurine de Gogeta en Super Saiyan Blue\r\nConçus et peint à la mains, la reproduction est fidèle au personnage de la série Dragon Ball.\r\nLa figurine contient des led.\r\nMatière: Résine haute qualité\r\nDimension: 52cm\r\nÉdition: Édition limitée\r\nÉditeur: Figure Class\r\nPièces: 240pcs', 500, 100, 175),
(28, 2, 'Statue Dragon Ball Z Majin Végéta HQS Plus By Tsume 54cm', 'majin.jpeg', 'figurines', 'La statue représente le prince des Saiyans sur le point de lancer son attaque – parfois appelée “Atomic Blast” – contre Majin Buu.\r\nIl porte sur le front la marque du sceau de possession de Babidi dont il vient tout juste de se libérer.\r\nSa tenue porte les stigmates de son combat face à Goku, et des éclairs l\'entourent… signe signe de la puissance du Super Saiyan 2.', 500, 25, 55);

-- --------------------------------------------------------

--
-- Structure de la table `streaming`
--

DROP TABLE IF EXISTS `streaming`;
CREATE TABLE IF NOT EXISTS `streaming` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Artworks_Id` int(11) NOT NULL,
  `Caption` varchar(120) NOT NULL,
  `Status` int(200) NOT NULL,
  `Description` varchar(900) NOT NULL,
  `Video` varchar(120) NOT NULL,
  `CreationTimestamp` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `streaming`
--

INSERT INTO `streaming` (`Id`, `Artworks_Id`, `Caption`, `Status`, `Description`, `Video`, `CreationTimestamp`) VALUES
(1, 1, 'Kimetsu No Yaiba 01 VOSTFR', 1, 'Regardez le nouvel anime far de la decennie', 'Kimetsu_no_Yaiba_01_VOSTFR.mp4', '2019-12-28 15:17:47'),
(2, 1, 'Kimetsu No Yaiba 02 VOSTFR', 2, 'Continuez avec l\'episode 2 !!', 'Kimetsu_no_Yaiba_02_VOSTFR.mp4', '2019-12-28 16:26:43'),
(4, 7, 'Vinland Saga 24 VOSTFR', 24, 't\'as vu le titre', 'Vinland_Saga_24_VOSTFR.mp4', '2019-12-31 10:28:00'),
(5, 2, 'DBS Broly', 1, 't\'as vu le titre', 'DBS_FILM_01_Broly_2018_VOSTFR.mp4', '2019-12-31 10:29:13'),
(6, 1, 'Kimetsu No Yaiba 03 VOSTFR', 3, 'ep kny 03', 'Kimetsu_no_Yaiba_03_VOSTFR.mp4', '2019-12-31 10:37:46'),
(8, 1, 'Kimetsu No Yaiba 04 VOSTFR', 4, 'ep 4', 'Kimetsu_no_Yaiba_04_VOSTFR.mp4', '2020-01-01 17:00:07'),
(9, 1, 'Kimetsu No Yaiba 05 VOSTFR', 5, 'ep 5', 'Kimetsu_no_Yaiba_05_VOSTFR.mp4', '2020-01-01 17:00:31'),
(10, 1, 'Kimetsu No Yaiba 06 VOSTFR', 6, 'ep 4', 'Kimetsu_no_Yaiba_06_VOSTFR.mp4', '2020-01-01 17:00:46'),
(11, 1, 'Kimetsu No Yaiba 07 VOSTFR', 7, 'ep 4', 'Kimetsu_no_Yaiba_07_VOSTFR.mp4', '2020-01-01 17:01:01'),
(12, 1, 'Kimetsu No Yaiba 08 VOSTFR', 8, 'ep 8', 'Kimetsu_no_Yaiba_08_VOSTFR.mp4', '2020-01-01 17:01:25'),
(13, 1, 'Kimetsu No Yaiba 09 VOSTFR', 9, 'tkt', 'Kimetsu_no_Yaiba_09_VOSTFR.mp4', '2019-12-31 10:37:46'),
(14, 1, 'Kimetsu No Yaiba 10 VOSTFR', 10, 'ep 4', 'Kimetsu_no_Yaiba_10_VOSTFR.mp4', '2020-01-01 17:00:07'),
(15, 1, 'Kimetsu No Yaiba 11 VOSTFR', 11, 'ep 5', 'Kimetsu_no_Yaiba_11_VOSTFR.mp4', '2020-01-01 17:00:31'),
(16, 1, 'Kimetsu No Yaiba 12 VOSTFR', 12, 'ep 4', 'Kimetsu_no_Yaiba_12_VOSTFR.mp4', '2020-01-01 17:00:46'),
(17, 1, 'Kimetsu No Yaiba 13 VOSTFR', 13, 'ep 4', 'Kimetsu_no_Yaiba_13_VOSTFR.mp4', '2020-01-01 17:01:01'),
(18, 1, 'Kimetsu No Yaiba 14 VOSTFR', 14, 'ep 8', 'Kimetsu_no_Yaiba_14_VOSTFR.mp4', '2020-01-01 17:01:25'),
(19, 1, 'Kimetsu No Yaiba 15 VOSTFR', 15, 'Regardez le nouvel anime far de la decennie', 'Kimetsu_no_Yaiba_15_VOSTFR.mp4', '2019-12-28 15:17:47'),
(20, 1, 'Kimetsu No Yaiba 16 VOSTFR', 16, 'Continuez avec l\'episode 2 !!', 'Kimetsu_no_Yaiba_16_VOSTFR.mp4', '2019-12-28 16:26:43'),
(21, 1, 'Kimetsu No Yaiba 17 VOSTFR', 17, 'tkt', 'Kimetsu_no_Yaiba_17_VOSTFR.mp4', '2019-12-31 10:37:46'),
(22, 1, 'Kimetsu No Yaiba 18 VOSTFR', 18, 'ep 4', 'Kimetsu_no_Yaiba_18_VOSTFR.mp4', '2020-01-01 17:00:07'),
(23, 1, 'Kimetsu No Yaiba 19 VOSTFR', 19, 'ep 5', 'Kimetsu_no_Yaiba_19_VOSTFR.mp4', '2020-01-01 17:00:31'),
(24, 1, 'Kimetsu No Yaiba 20 VOSTFR', 20, 'ep 4', 'Kimetsu_no_Yaiba_20_VOSTFR.mp4', '2020-01-01 17:00:46'),
(25, 1, 'Kimetsu No Yaiba 21 VOSTFR', 21, 'ep 4', 'Kimetsu_no_Yaiba_21_VOSTFR.mp4', '2020-01-01 17:01:01'),
(26, 1, 'Kimetsu No Yaiba 22 VOSTFR', 22, 'ep 8', 'Kimetsu_no_Yaiba_22_VOSTFR.mp4', '2020-01-01 17:01:25'),
(27, 1, 'Kimetsu No Yaiba 23 VOSTFR', 23, 'tkt', 'Kimetsu_no_Yaiba_23_VOSTFR.mp4', '2019-12-31 10:37:46'),
(28, 1, 'Kimetsu No Yaiba 24 VOSTFR', 24, 'ep 4', 'Kimetsu_no_Yaiba_24_VOSTFR.mp4', '2020-01-01 17:00:07'),
(29, 1, 'Kimetsu No Yaiba 25 VOSTFR', 25, 'ep 5', 'Kimetsu_no_Yaiba_25_VOSTFR.mp4', '2020-01-01 17:00:31'),
(30, 1, 'Kimetsu No Yaiba 26 VOSTFR', 26, 'ep 4', 'Kimetsu_no_Yaiba_26_VOSTFR.mp4', '2020-01-01 17:00:46'),
(31, 7, 'Vinland Saga 01 VOSTFR', 1, 'ep 1', 'Vinland_Saga_01_VOSTFR.mp4', '2020-01-02 14:52:03'),
(32, 7, 'Vinland Saga 02 VOSTFR', 2, 'ep 2', 'Vinland_Saga_02_VOSTFR.mp4', '2020-01-02 14:53:18'),
(33, 7, 'Vinland Saga 03 VOSTFR', 3, 'ep 3', 'Vinland_Saga_03_VOSTFR.mp4', '2020-01-02 14:54:15'),
(34, 7, 'Vinland Saga 04 VOSTFR', 4, 'ep 4', 'Vinland_Saga_04_VOSTFR.mp4', '2020-01-02 14:55:17'),
(35, 7, 'Vinland Saga 05 VOSTFR', 5, 'ep 5', 'Vinland_Saga_05_VOSTFR.mp4', '2020-01-02 14:56:12'),
(36, 7, 'Vinland Saga 06 VOSTFR', 6, 'ep 6', 'Vinland_Saga_06_VOSTFR.mp4', '2020-01-02 14:57:53'),
(37, 7, 'Vinland Saga 07 VOSTFR', 7, 'ep 7', 'Vinland_Saga_07_VOSTFR.mp4', '2020-01-02 14:58:42'),
(38, 7, 'Vinland Saga 08 VOSTFR', 8, 'ep 8', 'Vinland_Saga_08_VOSTFR.mp4', '2020-01-02 14:59:56'),
(39, 7, 'Vinland Saga 09 VOSTFR', 9, 'ep 9', 'Vinland_Saga_09_VOSTFR.mp4', '2020-01-02 15:00:58'),
(40, 7, 'Vinland Saga 10 VOSTFR', 10, 'ep 10', 'Vinland_Saga_10_VOSTFR.mp4', '2020-01-02 15:01:56'),
(41, 7, 'Vinland Saga 11 VOSTFR', 11, 'ep 11', 'Vinland_Saga_11_VOSTFR.mp4', '2020-01-02 15:02:55'),
(42, 7, 'Vinland Saga 12 VOSTFR', 12, 'ep 12', 'Vinland_Saga_12_VOSTFR.mp4', '2020-01-02 15:03:44'),
(43, 7, 'Vinland Saga 13 VOSTFR', 13, 'ep 13', 'Vinland_Saga_13_VOSTFR.mp4', '2020-01-02 15:04:32'),
(44, 7, 'Vinland Saga 14 VOSTFR', 14, 'ep 14', 'Vinland_Saga_14_VOSTFR.mp4', '2020-01-02 15:05:24'),
(45, 7, 'Vinland Saga 15 VOSTFR', 15, 'ep 15', 'Vinland_Saga_15_VOSTFR.mp4', '2020-01-02 15:06:12'),
(46, 7, 'Vinland Saga 16 VOSTFR', 16, 'ep 16', 'Vinland_Saga_16_VOSTFR.mp4', '2020-01-02 15:06:57'),
(47, 7, 'Vinland Saga 17 VOSTFR', 17, 'ep 17', 'Vinland_Saga_17_VOSTFR.mp4', '2020-01-02 15:08:00'),
(48, 7, 'Vinland Saga 18 VOSTFR', 18, 'ep 18', 'Vinland_Saga_18_VOSTFR.mp4', '2020-01-02 15:08:53'),
(49, 7, 'Vinland Saga 19 VOSTFR', 19, 'ep 19', 'Vinland_Saga_19_VOSTFR.mp4', '2020-01-02 15:09:42'),
(50, 7, 'Vinland Saga 20 VOSTFR', 20, 'ep 20', 'Vinland_Saga_20_VOSTFR.mp4', '2020-01-04 10:48:50'),
(51, 7, 'Vinland Saga 21 VOSTFR', 21, 'ep 21', 'Vinland_Saga_21_VOSTFR-1.mp4', '2020-01-04 10:49:41'),
(52, 7, 'Vinland Saga 22 VOSTFR', 22, 'ep 22', 'Vinland_Saga_22_VOSTFR.mp4', '2020-01-04 10:50:20'),
(53, 7, 'Vinland Saga 23 VOSTFR', 23, 'ep 23', 'Vinland_Saga_23_VOSTFR.mp4', '2020-01-04 10:51:20');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`Id`, `FirstName`, `LastName`, `Email`, `Pseudo`, `Password`, `Address`, `City`, `Zip`, `Role`, `CreationTimestamp`) VALUES
(1, 'Abmane', 'Oussoul', 'admin@gmail.com', 'admin', '$2y$11$1cf67a5dea60152ac284fu.dmjXduH4H4JEW7C3vmtO/PI1mx9cAa', '05 avenue nord', 'Paris', '75010', 'admin', '2019-12-26 16:53:31'),
(3, 'Kuzumo', 'Power', 'sallukhan0805@gmail.com', 'Omoshiroy', '$2y$11$423b35d4a0d61dbe6c816u.Ja2kSZFDmMAB7EhU53jPBvC0pLB75y', 'chez konoha ', 'Le village de beerus', '68125', 'user', '2019-12-27 17:34:38');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
