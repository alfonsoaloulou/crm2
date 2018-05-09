-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 10 Mai 2018 à 00:46
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `crm2`
--

-- --------------------------------------------------------

--
-- Structure de la table `campagne`
--

CREATE TABLE IF NOT EXISTS `campagne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Contenu de la table `campagne`
--

INSERT INTO `campagne` (`id`, `nom`, `date`, `description`) VALUES
(1, 'campagne test', '2013-03-18', 'campagne'),
(2, 'campagne test', '2013-03-18', 'campagne'),
(3, 'campagne test', '2013-03-18', 'campagne'),
(4, 'campagne test', '2013-03-18', 'campagne');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `commande_produit`
--

CREATE TABLE IF NOT EXISTS `commande_produit` (
  `produit_id` int(11) NOT NULL,
  `commande_id` int(11) NOT NULL,
  PRIMARY KEY (`produit_id`,`commande_id`),
  KEY `IDX_DF1E9E87F347EFB` (`produit_id`),
  KEY `IDX_DF1E9E8782EA2E54` (`commande_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande_service`
--

CREATE TABLE IF NOT EXISTS `commande_service` (
  `service_id` int(11) NOT NULL,
  `commande_id` int(11) NOT NULL,
  PRIMARY KEY (`service_id`,`commande_id`),
  KEY `IDX_1726E872ED5CA9E6` (`service_id`),
  KEY `IDX_1726E87282EA2E54` (`commande_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organisation_id` int(11) DEFAULT NULL,
  `campagne_id` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fonction` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tel` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4C62E6389E6B1585` (`organisation_id`),
  KEY `IDX_4C62E63816227374` (`campagne_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `devis`
--

CREATE TABLE IF NOT EXISTS `devis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `devis_produit`
--

CREATE TABLE IF NOT EXISTS `devis_produit` (
  `produit_id` int(11) NOT NULL,
  `devis_id` int(11) NOT NULL,
  PRIMARY KEY (`produit_id`,`devis_id`),
  KEY `IDX_BB4B777BF347EFB` (`produit_id`),
  KEY `IDX_BB4B777B41DEFADA` (`devis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `devis_service`
--

CREATE TABLE IF NOT EXISTS `devis_service` (
  `service_id` int(11) NOT NULL,
  `devis_id` int(11) NOT NULL,
  PRIMARY KEY (`service_id`,`devis_id`),
  KEY `IDX_7373018EED5CA9E6` (`service_id`),
  KEY `IDX_7373018E41DEFADA` (`devis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE IF NOT EXISTS `facture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `facture_produit`
--

CREATE TABLE IF NOT EXISTS `facture_produit` (
  `produit_id` int(11) NOT NULL,
  `facture_id` int(11) NOT NULL,
  PRIMARY KEY (`produit_id`,`facture_id`),
  KEY `IDX_61424D7EF347EFB` (`produit_id`),
  KEY `IDX_61424D7E7F2DEE08` (`facture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `facture_service`
--

CREATE TABLE IF NOT EXISTS `facture_service` (
  `service_id` int(11) NOT NULL,
  `facture_id` int(11) NOT NULL,
  PRIMARY KEY (`service_id`,`facture_id`),
  KEY `IDX_A97A3B8BED5CA9E6` (`service_id`),
  KEY `IDX_A97A3B8B7F2DEE08` (`facture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fos_user`
--

CREATE TABLE IF NOT EXISTS `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', 'admin@gmail.com', 1, NULL, '$2y$13$JdAY5meQoKbOZ/RVjEH8gOuQlbNJP0rfY/WgCw.e1CdM.f9/Jhd0e', '2018-04-30 17:00:37', NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}');

-- --------------------------------------------------------

--
-- Structure de la table `organisation`
--

CREATE TABLE IF NOT EXISTS `organisation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tel` int(8) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `siteweb` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secteur` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `organisation`
--

INSERT INTO `organisation` (`id`, `nom`, `tel`, `email`, `siteweb`, `secteur`) VALUES
(1, 'hts', 25155454, 'contact@hts.com', 'hts.tn', 'informatique');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PrixUnit` double NOT NULL,
  `Description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_29A5EC27146F3EA3` (`ref`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`id`, `ref`, `nom`, `PrixUnit`, `Description`) VALUES
(1, '2244CA', 'PC HP 2000', 950, 'pc Hp'),
(2, 'SM-J530', 'Galaxy j5 pro', 999, 'Smartphoe'),
(3, 'SM-J730G/DS\r\n', 'Galaxy j7 pro', 1399, 'Smartphone'),
(4, 'T525\r\n', 'Tecno n9', 259, 'Smartphone'),
(5, 'SM-G920F', 'Galaxy s6', 599, 'Smartphone'),
(6, 'SM-G935V\r\n', 'Galaxy s7 edge', 1999, 'Smartphone'),
(7, 'E5-573G-58JB', 'acer E-15', 950, 'PC ACER'),
(8, 'W26', 'Winx', 45, 'Powerbank 1000mA\r\n'),
(9, 'EO-HS3303YE\r\n', 'ecouteurs', 15, 'Samsung'),
(10, 'SRH-1540 ', 'headcasque', 35, 'Samsung'),
(11, '845-VR', 'VR', 20, 'None');

-- --------------------------------------------------------

--
-- Structure de la table `prospect`
--

CREATE TABLE IF NOT EXISTS `prospect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organisation_id` int(11) DEFAULT NULL,
  `campagne_id` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fonction` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tel` int(8) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C9CE8C7D9E6B1585` (`organisation_id`),
  KEY `IDX_C9CE8C7D16227374` (`campagne_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `prospect`
--

INSERT INTO `prospect` (`id`, `organisation_id`, `campagne_id`, `nom`, `fonction`, `tel`, `email`) VALUES
(1, 1, 4, 'majdi', 'approvisionnement', 52455225, 'majdi@gmail.com'),
(2, 1, 4, 'alfonso', 'commercial', 54000444, 'alfonso@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prix` double NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Contenu de la table `service`
--

INSERT INTO `service` (`id`, `ref`, `nom`, `prix`, `description`) VALUES
(2, 'serv1', 'maintenance', 1500, 'Maitenance des SI'),
(3, 'serv2', 'audit', 2000, 'audit informatique'),
(4, 'serv3', 'integration', 2500, 'integration des systemes'),
(5, 'serv4', 'CRM', 15000, 'application web pour la gestion des relations avec les clients'),
(6, 'serv5', 'ERP', 25000, 'Prologiciel de gestion integré'),
(7, 'serv6', 'site web', 18000, 'creation d''un site web');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD CONSTRAINT `FK_DF1E9E8782EA2E54` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DF1E9E87F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `commande_service`
--
ALTER TABLE `commande_service`
  ADD CONSTRAINT `FK_1726E87282EA2E54` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1726E872ED5CA9E6` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `FK_4C62E63816227374` FOREIGN KEY (`campagne_id`) REFERENCES `campagne` (`id`),
  ADD CONSTRAINT `FK_4C62E6389E6B1585` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`);

--
-- Contraintes pour la table `devis_produit`
--
ALTER TABLE `devis_produit`
  ADD CONSTRAINT `FK_BB4B777B41DEFADA` FOREIGN KEY (`devis_id`) REFERENCES `devis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_BB4B777BF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `devis_service`
--
ALTER TABLE `devis_service`
  ADD CONSTRAINT `FK_7373018E41DEFADA` FOREIGN KEY (`devis_id`) REFERENCES `devis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_7373018EED5CA9E6` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `facture_produit`
--
ALTER TABLE `facture_produit`
  ADD CONSTRAINT `FK_61424D7E7F2DEE08` FOREIGN KEY (`facture_id`) REFERENCES `facture` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_61424D7EF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `facture_service`
--
ALTER TABLE `facture_service`
  ADD CONSTRAINT `FK_A97A3B8B7F2DEE08` FOREIGN KEY (`facture_id`) REFERENCES `facture` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A97A3B8BED5CA9E6` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `prospect`
--
ALTER TABLE `prospect`
  ADD CONSTRAINT `FK_C9CE8C7D16227374` FOREIGN KEY (`campagne_id`) REFERENCES `campagne` (`id`),
  ADD CONSTRAINT `FK_C9CE8C7D9E6B1585` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
