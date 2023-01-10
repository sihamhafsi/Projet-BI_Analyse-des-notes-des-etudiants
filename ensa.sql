-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 05 jan. 2023 à 09:10
-- Version du serveur : 8.0.27
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ensa`
--

-- --------------------------------------------------------

--
-- Structure de la table `cour`
--

DROP TABLE IF EXISTS `cour`;
CREATE TABLE IF NOT EXISTS `cour` (
  `id_cour` int NOT NULL,
  `libelle` varchar(45) DEFAULT NULL,
  `niveau_cour` varchar(45) DEFAULT NULL,
  `id_enseignant` int DEFAULT NULL,
  `id_salle` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id_cour`),
  KEY `fk_ens_idx` (`id_enseignant`),
  KEY `fk_s_idx` (`id_salle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `cour`
--

INSERT INTO `cour` (`id_cour`, `libelle`, `niveau_cour`, `id_enseignant`, `id_salle`, `date`) VALUES
(1, 'bi', 'info2', 1, 11, '2022-11-11'),
(2, 'sql', 'info2', 2, 22, '2022-10-12'),
(3, 'analyse', 'info2', 3, 33, '2022-10-10'),
(4, 'python', 'info1', 5, 11, '2021-09-23'),
(5, 'algo', 'info1', 6, 22, '2021-10-24'),
(6, 'algebre', 'm1', 8, 33, '2022-09-08'),
(7, 'mecanique', 'procede1', 9, 11, '2022-09-19'),
(8, 'chimie', 'procede1', 10, 22, '2022-10-31'),
(9, 'cloud', 'm2', 7, 33, '2022-11-26');

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

DROP TABLE IF EXISTS `enseignant`;
CREATE TABLE IF NOT EXISTS `enseignant` (
  `id_enseignant` int NOT NULL,
  `nom_enseignant` varchar(45) DEFAULT NULL,
  `prenom_enseignant` varchar(45) DEFAULT NULL,
  `email_enseignant` varchar(45) DEFAULT NULL,
  `tele_enseignant` varchar(45) DEFAULT NULL,
  `adress_enseignant` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_enseignant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`id_enseignant`, `nom_enseignant`, `prenom_enseignant`, `email_enseignant`, `tele_enseignant`, `adress_enseignant`) VALUES
(1, 'bani', 'laila', 'bani@gmail.com', '0666666666', 'khouribga'),
(2, 'marzouk', 'amal', 'a.marzouk@gmail.com', '0666666666', 'marrakech'),
(3, 'bouhaddar', 'ilias', 'i.bouhadddar@gmail.com', '0666666666', 'marrakech'),
(4, 'samout', 'oussama', 'o.samout@gmail.com', '0666666666', 'casa'),
(5, 'himmi', 'hiba', 'h.himmi@gmail.com', '0666666666', 'marrakech'),
(6, 'dahbi', 'fati', 'dahbi@gmail.com', '0666666666', 'marrakech'),
(7, 'sabik', 'youssef', 'y.sabik@gmail.com', '0666666667', 'casa'),
(8, 'gbouri', 'salma', 'gbouri@gmail.com', '0877777777', 'el jadida'),
(9, 'radi', 'bouchra', 'radi@gmail.com', '0466666666', 'rabat'),
(10, 'mahdaoui', 'mohamed', 'mahdaoui@gmail.com', '08777777777', 'safi');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id_etudiant` int NOT NULL,
  `nom_etudiant` varchar(45) DEFAULT NULL,
  `prenom_etudiant` varchar(45) DEFAULT NULL,
  `adress_etudiant` varchar(45) DEFAULT NULL,
  `niveau_etudiant` varchar(45) DEFAULT NULL,
  `tel_etudiant` varchar(45) DEFAULT NULL,
  `email_etudiant` varchar(45) DEFAULT NULL,
  `id_cour` int DEFAULT NULL,
  PRIMARY KEY (`id_etudiant`),
  KEY `fk_c_idx` (`id_cour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id_etudiant`, `nom_etudiant`, `prenom_etudiant`, `adress_etudiant`, `niveau_etudiant`, `tel_etudiant`, `email_etudiant`, `id_cour`) VALUES
(1, 'tibari', 'amina', 'oued zem', 'info2', '0666666666', 'tibari@gmail.com', 1),
(2, 'chigri', 'amal', 'khouribga', 'info2', '0666666666', 'chigri@gmail.com', 1),
(3, 'ahmadi', 'ahmed', 'casa', 'info1', '0666666666', 'a.ah@gmail.com', 4),
(4, 'nouri', 'anouar', 'rabat', 'info1', '0666666666', 'n.n@gmail.com', 5),
(5, 'el haddaji', 'oussama', 'khouribga', 'm2', '0666666666', 'ous.t@gmail.com', 3),
(6, 'heffaoui', 'fati', 'laayoun', 'procede1', '0666666666', 'heffaouifati@gmail.com', 7),
(7, 'sati', 'el mehdi', 'casa', 'info2', '067676767', 'sati@gmail.com', 2),
(8, 'faize', 'houda', 'tanger', 'procede1', '07867688778', 'faize@gmail.com', 8),
(9, 'baoud', 'youssra', 'tetouan', 'm2', '098877777', 'y.baoud@gmail.com', 9),
(10, 'nokra', 'imane', 'kenitra', 'm2', '0654788899', 'i.nokra@gmail.com', 4),
(11, 'lawti', 'kawtar', 'fes', 'info1', '067546889', 'lawti12@gmail.com', 5),
(12, 'baroudi', 'yassine', 'beni mellal', 'info2', '079855678', 'baroudi@gmail.com', 2),
(13, 'charif', 'walid', 'ifrane', 'procede1', '098828929', 'charif', 8),
(14, 'kacim', 'ikram', 'agadir', 'm2', '0877666888', 'kacimik@gmail.com', 3),
(15, 'sabiri', 'mohamed', 'fes', 'info1', '077665899', 'sabirim@gmail.com', 6),
(16, 'zibot', 'habiba', 'rabat', 'info2', '0987668882', 'ziboth@gmail.com', 1),
(17, 'khalil', 'hafsa', 'ben grir', 'm1', '09888282', 'khalil@gmail.com', 2),
(18, 'tahi', 'hamza', 'temara', 'procede1', '083892992', 'tahihamz1@gmail.com', 8),
(19, 'amiri', 'hafsa', 'zagora', 'procede1', '082992992', 'amiri2@gmail.com', 7),
(20, 'madih', 'amina', 'casa', 'info2', '082992992', 'madih@gmail.com', 3);

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

DROP TABLE IF EXISTS `note`;
CREATE TABLE IF NOT EXISTS `note` (
  `id_note` int NOT NULL,
  `note` float DEFAULT NULL,
  `montion` varchar(45) DEFAULT NULL,
  `id_etudiant` int DEFAULT NULL,
  `id_cour` int DEFAULT NULL,
  PRIMARY KEY (`id_note`),
  KEY `fk_et_idx` (`id_etudiant`),
  KEY `fk_co_idx` (`id_cour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `note`
--

INSERT INTO `note` (`id_note`, `note`, `montion`, `id_etudiant`, `id_cour`) VALUES
(1, 20, 'tres bien', 1, 1),
(2, 20, 'tres bien', 2, 1),
(3, 12, 'assez bien', 5, 3),
(4, 18, 'tres bien', 6, 2),
(5, 16, 'bien', 3, 4),
(6, 15, 'bien', 4, 5),
(7, 15, 'bien', 20, 3),
(8, 10, 'passable', 19, 7),
(9, 6, 'mal', 18, 8),
(10, 14, 'bien', 17, 2),
(11, 13, 'assez bien', 16, 1),
(12, 17, 'tres bien', 15, 6),
(13, 18, 'tres bien', 14, 3),
(14, 7, 'mal', 13, 8),
(15, 16, 'bien', 12, 2),
(16, 10, 'passable', 11, 5),
(17, 20, 'excellent', 10, 4),
(18, 15, 'bien', 7, 2),
(19, 3, 'aj', 8, 8),
(20, 1, 'aj', 9, 9);

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `id_salle` int NOT NULL,
  `nom_salle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_salle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`id_salle`, `nom_salle`) VALUES
(11, 'c1'),
(22, 'c2'),
(33, 'c3');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cour`
--
ALTER TABLE `cour`
  ADD CONSTRAINT `fk_e` FOREIGN KEY (`id_enseignant`) REFERENCES `enseignant` (`id_enseignant`),
  ADD CONSTRAINT `fk_s` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id_salle`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `fk_c` FOREIGN KEY (`id_cour`) REFERENCES `cour` (`id_cour`);

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `fk_co` FOREIGN KEY (`id_cour`) REFERENCES `cour` (`id_cour`),
  ADD CONSTRAINT `fk_et` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
