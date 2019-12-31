-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 31 Décembre 2019 à 10:29
-- Version du serveur :  5.7.28-0ubuntu0.16.04.2
-- Version de PHP :  7.0.33-0ubuntu0.16.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

CREATE TABLE `artworks` (
  `Id` int(11) NOT NULL,
  `Name` varchar(120) NOT NULL,
  `Url` varchar(500) NOT NULL,
  `Image` varchar(120) NOT NULL,
  `Image_Cover` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `artworks`
--

INSERT INTO `artworks` (`Id`, `Name`, `Url`, `Image`, `Image_Cover`) VALUES
(1, 'Kimetsu No Yaiba', 'kny', 'kny_cover.gif', 'kny_cover.jpg'),
(2, 'Dragon Ball', 'db', 'db_cover.gif', 'db_cover.jpg'),
(3, 'Naruto', 'naruto', 'naruto_cover.gif', 'naruto_cover.png'),
(4, 'One Piece', 'op', 'op_cover.gif', 'op_cover.jpg'),
(5, 'My Hero Academia', 'mha', 'mha_cover.gif', 'mha_cover.jpg'),
(6, 'One Punch Man', 'opm', 'opm_cover.gif', 'opm_cover.jpg'),
(7, 'Vinland Saga', 'vs', 'vs_cover.gif', 'vs_cover.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `orderline`
--

CREATE TABLE `orderline` (
  `Order_Id` int(11) NOT NULL,
  `Product_Id` int(11) NOT NULL,
  `Quantity_Ordered` int(200) NOT NULL,
  `PriceEach` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `TaxRate` double DEFAULT NULL,
  `TaxAmount` double DEFAULT NULL,
  `TotalAmount` double DEFAULT NULL,
  `CreationTimestamp` datetime DEFAULT NULL,
  `CompleteTimestamp` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `Id` int(11) NOT NULL,
  `Artworks_Id` int(11) NOT NULL,
  `Name` varchar(120) NOT NULL,
  `Photo` varchar(90) NOT NULL,
  `ProductLine` varchar(50) NOT NULL,
  `Description` varchar(900) NOT NULL,
  `QuantityInStock` int(255) NOT NULL,
  `BuyPrice` double NOT NULL,
  `Price` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `products`
--

INSERT INTO `products` (`Id`, `Artworks_Id`, `Name`, `Photo`, `ProductLine`, `Description`, `QuantityInStock`, `BuyPrice`, `Price`) VALUES
(1, 2, 'SonGoku Ultra Instinct', 'GokuMui.png', 'figurines', 'Banpresto Figurine - DBZ - Son Goku FES Vol 8 - Ultra Instinct Son Goku - 20 cm ', 50, 0.8, 70),
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
(27, 2, 'GOGETA SSJ BLUE 52CM', 'gogita.png', 'figurines', 'Figurine de Gogeta en Super Saiyan Blue\r\nConçus et peint à la mains, la reproduction est fidèle au personnage de la série Dragon Ball.\r\nLa figurine contient des led.\r\nMatière: Résine haute qualité\r\nDimension: 52cm\r\nÉdition: Édition limitée\r\nÉditeur: Figure Class\r\nPièces: 240pcs', 500, 100, 175);

-- --------------------------------------------------------

--
-- Structure de la table `streaming`
--

CREATE TABLE `streaming` (
  `Id` int(11) NOT NULL,
  `Artworks_Id` int(11) NOT NULL,
  `Caption` varchar(120) NOT NULL,
  `Description` varchar(900) NOT NULL,
  `Video` varchar(120) NOT NULL,
  `CreationTimestamp` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `streaming`
--

INSERT INTO `streaming` (`Id`, `Artworks_Id`, `Caption`, `Description`, `Video`, `CreationTimestamp`) VALUES
(1, 1, 'Kimetsu No Yaiba 01 VOSTFR', 'on verra', 'Kimetsu_no_Yaiba_01_VOSTFR.mp4', '2019-12-28 15:17:47'),
(2, 1, 'Kimetsu No Yaiba 02 VOSTFR', 'plus tard', 'Kimetsu_no_Yaiba_02_VOSTFR.mp4', '2019-12-28 16:26:43'),
(4, 7, 'Vinland Saga 24 VOSTFR', 't\'as vu le titre', 'Vinland_Saga_24_VOSTFR.mp4', '2019-12-31 10:28:00'),
(5, 2, 'DBS Broly', 't\'as vu le titre', 'DBS_FILM_01_Broly_2018_VOSTFR.mp4', '2019-12-31 10:29:13');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `FirstName` varchar(120) NOT NULL,
  `LastName` varchar(120) NOT NULL,
  `Email` varchar(120) NOT NULL,
  `Pseudo` varchar(20) DEFAULT NULL,
  `Password` varchar(120) NOT NULL,
  `Address` varchar(360) NOT NULL,
  `City` varchar(120) NOT NULL,
  `Zip` varchar(11) NOT NULL,
  `Role` varchar(11) NOT NULL,
  `CreationTimestamp` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`Id`, `FirstName`, `LastName`, `Email`, `Pseudo`, `Password`, `Address`, `City`, `Zip`, `Role`, `CreationTimestamp`) VALUES
(1, 'Abmane', 'Oussoul', 'admin@gmail.com', 'admin', '$2y$11$1cf67a5dea60152ac284fu.dmjXduH4H4JEW7C3vmtO/PI1mx9cAa', '05 avenue nord', 'Paris', '75010', 'admin', '2019-12-26 16:53:31'),
(3, 'Kuzumo', 'Power', 'sallukhan0805@gmail.com', 'Omoshiroy', '$2y$11$423b35d4a0d61dbe6c816u.Ja2kSZFDmMAB7EhU53jPBvC0pLB75y', 'chez konoha ', 'Le village de beerus', '68125', 'user', '2019-12-27 17:34:38');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `artworks`
--
ALTER TABLE `artworks`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `streaming`
--
ALTER TABLE `streaming`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `artworks`
--
ALTER TABLE `artworks`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `streaming`
--
ALTER TABLE `streaming`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
