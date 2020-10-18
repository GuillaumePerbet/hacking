-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 18 oct. 2020 à 11:57
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `hackathon`
--

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `idCommentaire` int(11) NOT NULL AUTO_INCREMENT,
  `idStylo` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `commentaire` mediumtext NOT NULL,
  `dateCom` date NOT NULL,
  PRIMARY KEY (`idCommentaire`),
  KEY `fk_stylo_id` (`idStylo`),
  KEY `fk_utilisateur_id` (`idUtilisateur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `element`
--

DROP TABLE IF EXISTS `element`;
CREATE TABLE IF NOT EXISTS `element` (
  `idElement` int(11) NOT NULL AUTO_INCREMENT,
  `nomElement` varchar(40) NOT NULL,
  `question` mediumtext NOT NULL,
  `elementSuivant1` int(11) DEFAULT NULL COMMENT 'Element enfant de l''élément suivant',
  `elementSuivant2` int(11) DEFAULT NULL,
  `reponse1` varchar(100) NOT NULL,
  `reponse2` varchar(100) NOT NULL,
  PRIMARY KEY (`idElement`),
  KEY `fk_elementSuivant2` (`elementSuivant2`),
  KEY `fk_elementSuivant1` (`elementSuivant1`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `element`
--

INSERT INTO `element` (`idElement`, `nomElement`, `question`, `elementSuivant1`, `elementSuivant2`, `reponse1`, `reponse2`) VALUES
(1, 'verrouSecu', 'Est-ce qu\'il y aura un verrou de sécurité ?', 5, 5, 'Oui', 'Non'),
(5, 'siteInjection', 'Peut-on appliquer le stylo auto-injecteur partout sur le corps, ou sur une zone déterminée ?', 6, 6, 'Multiple', 'Unique'),
(6, 'precision', 'Quel est la précision d\'injection du stylo ?', 7, 8, 'Précis', 'Libre'),
(7, 'sensibilite', 'Quelle est la forme de la base ?', 8, 8, 'Base large', 'Base fine'),
(8, 'symetrique', 'L\'appareil sera-t-il symétrique ?', 9, 9, 'Oui', 'Non'),
(9, 'conventionnelle', 'La forme est elle conventionnelle?', NULL, NULL, 'Oui', 'Non');

-- --------------------------------------------------------

--
-- Structure de la table `elementerreur`
--

DROP TABLE IF EXISTS `elementerreur`;
CREATE TABLE IF NOT EXISTS `elementerreur` (
  `idElement` int(11) NOT NULL,
  `idErreur` int(11) NOT NULL,
  KEY `fk_element_id` (`idElement`),
  KEY `fk_erreur_id` (`idErreur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `elementerreur`
--

INSERT INTO `elementerreur` (`idElement`, `idErreur`) VALUES
(1, 2),
(9, 8),
(5, 3),
(5, 4),
(7, 6),
(8, 7);

-- --------------------------------------------------------

--
-- Structure de la table `erreur`
--

DROP TABLE IF EXISTS `erreur`;
CREATE TABLE IF NOT EXISTS `erreur` (
  `idErreur` int(11) NOT NULL AUTO_INCREMENT,
  `textErreur` mediumtext NOT NULL,
  `Conseils` mediumtext NOT NULL,
  `RepDeclencheur` varchar(40) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idErreur`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `erreur`
--

INSERT INTO `erreur` (`idErreur`, `textErreur`, `Conseils`, `RepDeclencheur`, `image`) VALUES
(2, 'Certains utilisateurs n\'ont pas réussi a déverrouillé le verrou de sécurité', 'Quick start simplifié qui décrit les grandes étapes d\'utilisation\r\n', 'Oui', 'base-large.svg'),
(3, 'Les utilisateurs ont utilisé le même site d\'injection plusieurs fois de suite', 'Ecrire de manière accessible et à plusieurs endroits les conditions de stockages, et d\'utilisation (ex. appel des urgences, massage du site, vétement, désinfection du site, nettoyage de l\'appareil, fonctions du dispositifs, informations sur le capuchon, durée de l\'injection, pincement de la peau, réutilisation du stylo, rotation des sites d\'injection)', 'Unique', 'avec-aiguille.svg'),
(8, 'Les utilisateurs ont pris le mauvais appareil (mauvaise intention thérapeutique ou dispositif de démonstration).', 'Nom bien visibles sur le dispositif.', 'Non', NULL),
(4, 'Certaines injections n\'ont pas été effectuées au site d\'injection prévu', 'Ecrire de manière accessible et à plusieurs endroits les conditions de stockages, et d\'utilisation (ex. appel des urgences, massage du site, vêtement, désinfection du site, nettoyage de l\'appareil, fonctions du dispositifs, informations sur le capuchon, durée de l\'injection, pincement de la peau, réutilisation du stylo, rotation des sites d\'injection)', 'Multiple', NULL),
(7, 'Tenir un appareil à l\'envers.', 'Permettre aux utilisateurs de distinguer les deux bouts du dispositifs en évitant les design symétriques.', 'Oui', 'dispositif-inviolabilite.svg'),
(6, 'Le site a bougé durant l’injection.', 'Mettre en place une base d\'injection large pour permettre au dispositif de rester perpendiculaire et stable contre la zone d\'injection', 'Base fine', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `stylo`
--

DROP TABLE IF EXISTS `stylo`;
CREATE TABLE IF NOT EXISTS `stylo` (
  `idStylo` int(11) NOT NULL AUTO_INCREMENT,
  `appelation` varchar(40) NOT NULL,
  PRIMARY KEY (`idStylo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `styloerreur`
--

DROP TABLE IF EXISTS `styloerreur`;
CREATE TABLE IF NOT EXISTS `styloerreur` (
  `idStylo` int(11) DEFAULT NULL,
  `idErrreur` int(11) DEFAULT NULL,
  KEY `fk_stylo_id` (`idStylo`),
  KEY `fk_erreur_id` (`idErrreur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) DEFAULT NULL,
  `prenom` varchar(40) DEFAULT NULL,
  `typeUtilisateur` enum('utilisateur','professionnel_sante','concepteur') NOT NULL,
  `mail` varchar(40) NOT NULL COMMENT 'fait office de login',
  `mdp_crypte` mediumtext NOT NULL,
  `pays` enum('France','Belgique','Suisse','Canada (Qu?bec)') NOT NULL,
  PRIMARY KEY (`idUtilisateur`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `nom`, `prenom`, `typeUtilisateur`, `mail`, `mdp_crypte`, `pays`) VALUES
(1, NULL, NULL, 'utilisateur', 'jean.dupont@test.test', '5f4dcc3b5aa765d61d8327deb882cf99', 'France');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
