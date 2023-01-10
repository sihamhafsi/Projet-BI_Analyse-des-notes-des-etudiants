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
-- Base de données : `ensadm`
--

-- --------------------------------------------------------

--
-- Structure de la table `dim_cours`
--

DROP TABLE IF EXISTS `dim_cours`;
CREATE TABLE IF NOT EXISTS `dim_cours` (
  `id_cours` int NOT NULL,
  `libelle` varchar(45) DEFAULT NULL,
  `niveau_cours` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cours`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `dim_cours`
--

INSERT INTO `dim_cours` (`id_cours`, `libelle`, `niveau_cours`) VALUES
(1, 'bi', 'info2'),
(2, 'sql', 'info2'),
(3, 'analyse', 'info2'),
(4, 'python', 'info1'),
(5, 'algo', 'info1'),
(6, 'algebre', 'm1'),
(7, 'mecanique', 'procede1'),
(8, 'chimie', 'procede1'),
(9, 'cloud', 'm2');

-- --------------------------------------------------------

--
-- Structure de la table `dim_date`
--

DROP TABLE IF EXISTS `dim_date`;
CREATE TABLE IF NOT EXISTS `dim_date` (
  `id_date` date NOT NULL,
  `mois` varchar(45) DEFAULT NULL,
  `annee` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `dim_date`
--

INSERT INTO `dim_date` (`id_date`, `mois`, `annee`) VALUES
('2021-09-23', '9', '2021'),
('2021-10-24', '10', '2021'),
('2022-09-08', '9', '2022'),
('2022-09-19', '9', '2022'),
('2022-10-10', '10', '2022'),
('2022-10-12', '10', '2022'),
('2022-10-31', '10', '2022'),
('2022-11-11', '11', '2022'),
('2022-11-26', '11', '2022');

-- --------------------------------------------------------

--
-- Structure de la table `dim_enseignant`
--

DROP TABLE IF EXISTS `dim_enseignant`;
CREATE TABLE IF NOT EXISTS `dim_enseignant` (
  `id_enseignant` int NOT NULL,
  `nom_enseignant` varchar(45) DEFAULT NULL,
  `prenom_enseignant` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_enseignant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `dim_enseignant`
--

INSERT INTO `dim_enseignant` (`id_enseignant`, `nom_enseignant`, `prenom_enseignant`) VALUES
(1, 'bani', 'laila'),
(2, 'marzouk', 'amal'),
(3, 'bouhaddar', 'ilias'),
(4, 'samout', 'oussama'),
(5, 'himmi', 'hiba'),
(6, 'dahbi', 'fati'),
(7, 'sabik', 'youssef'),
(8, 'gbouri', 'salma'),
(9, 'radi', 'bouchra'),
(10, 'mahdaoui', 'mohamed');

-- --------------------------------------------------------

--
-- Structure de la table `dim_etudiant`
--

DROP TABLE IF EXISTS `dim_etudiant`;
CREATE TABLE IF NOT EXISTS `dim_etudiant` (
  `id_etudiant` int NOT NULL,
  `nom_etudiant` varchar(45) DEFAULT NULL,
  `prenom_etudiant` varchar(45) DEFAULT NULL,
  `niveau_etudiant` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `dim_etudiant`
--

INSERT INTO `dim_etudiant` (`id_etudiant`, `nom_etudiant`, `prenom_etudiant`, `niveau_etudiant`) VALUES
(1, 'tibari', 'amina', 'info2'),
(2, 'chigri', 'amal', 'info2'),
(3, 'ahmadi', 'ahmed', 'info1'),
(4, 'nouri', 'anouar', 'info1'),
(5, 'el haddaji', 'oussama', 'm2'),
(6, 'heffaoui', 'fati', 'procede1'),
(7, 'sati', 'el mehdi', 'info2'),
(8, 'faize', 'houda', 'procede1'),
(9, 'baoud', 'youssra', 'm2'),
(10, 'nokra', 'imane', 'm2'),
(11, 'lawti', 'kawtar', 'info1'),
(12, 'baroudi', 'yassine', 'info2'),
(13, 'charif', 'walid', 'procede1'),
(14, 'kacim', 'ikram', 'm2'),
(15, 'sabiri', 'mohamed', 'info1'),
(16, 'zibot', 'habiba', 'info2'),
(17, 'khalil', 'hafsa', 'm1'),
(18, 'tahi', 'hamza', 'procede1'),
(19, 'amiri', 'hafsa', 'procede1'),
(20, 'madih', 'amina', 'info2');

-- --------------------------------------------------------

--
-- Structure de la table `fact_notes`
--

DROP TABLE IF EXISTS `fact_notes`;
CREATE TABLE IF NOT EXISTS `fact_notes` (
  `note` float DEFAULT NULL,
  `mention` varchar(45) DEFAULT NULL,
  `id_cours` int DEFAULT NULL,
  `id_enseignant` int DEFAULT NULL,
  `id_etudiant` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  KEY `fk_cou_idx` (`id_cours`),
  KEY `fk_ens_idx` (`id_enseignant`),
  KEY `fk_etu_idx` (`id_etudiant`),
  KEY `fk_da_idx` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fact_notes`
--

INSERT INTO `fact_notes` (`note`, `mention`, `id_cours`, `id_enseignant`, `id_etudiant`, `date`) VALUES
(20, 'tres bien', 1, 1, 1, '2022-11-11'),
(20, 'tres bien', 1, 1, 2, '2022-11-11'),
(12, 'assez bien', 3, 3, 5, '2022-10-10'),
(16, 'bien', 4, 5, 3, '2021-09-23'),
(15, 'bien', 5, 6, 4, '2021-10-24'),
(15, 'bien', 3, 3, 20, '2022-10-10'),
(10, 'passable', 7, 9, 19, '2022-09-19'),
(6, 'mal', 8, 10, 18, '2022-10-31'),
(14, 'bien', 2, 2, 17, '2022-10-12'),
(13, 'assez bien', 1, 1, 16, '2022-11-11'),
(17, 'tres bien', 6, 8, 15, '2022-09-08'),
(18, 'tres bien', 3, 3, 14, '2022-10-10'),
(7, 'mal', 8, 10, 13, '2022-10-31'),
(16, 'bien', 2, 2, 12, '2022-10-12'),
(10, 'passable', 5, 6, 11, '2021-10-24'),
(20, 'excellent', 4, 5, 10, '2021-09-23'),
(15, 'bien', 2, 2, 7, '2022-10-12'),
(3, 'aj', 8, 10, 8, '2022-10-31'),
(1, 'aj', 9, 7, 9, '2022-11-26');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `fact_notes`
--
ALTER TABLE `fact_notes`
  ADD CONSTRAINT `fk_cou` FOREIGN KEY (`id_cours`) REFERENCES `dim_cours` (`id_cours`),
  ADD CONSTRAINT `fk_da` FOREIGN KEY (`date`) REFERENCES `dim_date` (`id_date`),
  ADD CONSTRAINT `fk_ens` FOREIGN KEY (`id_enseignant`) REFERENCES `dim_enseignant` (`id_enseignant`),
  ADD CONSTRAINT `fk_etu` FOREIGN KEY (`id_etudiant`) REFERENCES `dim_etudiant` (`id_etudiant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
