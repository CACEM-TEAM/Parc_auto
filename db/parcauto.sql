-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : jeu. 17 juil. 2025 à 15:59
-- Version du serveur : 8.0.42
-- Version de PHP : 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `parcauto`
--

-- --------------------------------------------------------

--
-- Structure de la table `agents`
--

CREATE TABLE `agents` (
  `id` int NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `direction` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `controle_eclairage`
--

CREATE TABLE `controle_eclairage` (
  `id` int NOT NULL,
  `controle_id` int NOT NULL,
  `type_feu` enum('feux_position_AV','feux_position_AR','feux_croisement_AV','feux_croisement_AR','feux_route_AV','clignotant_AV','clignotant_AR','clignotant_lateraux','feux_stop_AV','feux_stop_AR','feux_stop_centrale','feux_marche_arriere','feux_plaque') NOT NULL,
  `fonctionne` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `controle_enjoliveurs`
--

CREATE TABLE `controle_enjoliveurs` (
  `id` int NOT NULL,
  `controle_id` int NOT NULL,
  `position` enum('AVD','AVG','ARD','ARG') NOT NULL,
  `etat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `controle_etat_salissure`
--

CREATE TABLE `controle_etat_salissure` (
  `id` int NOT NULL,
  `controle_id` int NOT NULL,
  `etat_salissure` enum('correcte','prevoir lavage') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `controle_frein`
--

CREATE TABLE `controle_frein` (
  `id` int NOT NULL,
  `controle_id` int NOT NULL,
  `type_frein` enum('plaquette','disque') NOT NULL,
  `etat` enum('correcte','mauvais') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `controle_liquides`
--

CREATE TABLE `controle_liquides` (
  `id` int NOT NULL,
  `controle_id` int NOT NULL,
  `type_liquide` enum('huile_moteur','liquide_refroidissement','lave_glace') NOT NULL,
  `etat` enum('correcte','mauvais') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `controle_usure_pneumatiques`
--

CREATE TABLE `controle_usure_pneumatiques` (
  `id` int NOT NULL,
  `controle_id` int NOT NULL,
  `position` enum('AVD','AVG','ARD','ARG') NOT NULL,
  `usure` enum('correcte','moyenne','mauvaise') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `controle_vehicule`
--

CREATE TABLE `controle_vehicule` (
  `id` int NOT NULL,
  `vehicule_id` int NOT NULL,
  `agent_id` int NOT NULL,
  `date_controle` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `equipements`
--

CREATE TABLE `equipements` (
  `id` int NOT NULL,
  `controle_id` int NOT NULL,
  `equipement` varchar(50) NOT NULL,
  `etat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vehicules`
--

CREATE TABLE `vehicules` (
  `id` int NOT NULL,
  `immatriculation` varchar(20) NOT NULL,
  `marque` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `fonction_service` varchar(100) DEFAULT NULL,
  `remisage_domicile` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `controle_eclairage`
--
ALTER TABLE `controle_eclairage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `controle_id` (`controle_id`);

--
-- Index pour la table `controle_enjoliveurs`
--
ALTER TABLE `controle_enjoliveurs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `controle_id` (`controle_id`);

--
-- Index pour la table `controle_etat_salissure`
--
ALTER TABLE `controle_etat_salissure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `controle_id` (`controle_id`);

--
-- Index pour la table `controle_frein`
--
ALTER TABLE `controle_frein`
  ADD PRIMARY KEY (`id`),
  ADD KEY `controle_id` (`controle_id`);

--
-- Index pour la table `controle_liquides`
--
ALTER TABLE `controle_liquides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `controle_id` (`controle_id`);

--
-- Index pour la table `controle_usure_pneumatiques`
--
ALTER TABLE `controle_usure_pneumatiques`
  ADD PRIMARY KEY (`id`),
  ADD KEY `controle_id` (`controle_id`);

--
-- Index pour la table `controle_vehicule`
--
ALTER TABLE `controle_vehicule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicule_id` (`vehicule_id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Index pour la table `equipements`
--
ALTER TABLE `equipements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `controle_id` (`controle_id`);

--
-- Index pour la table `vehicules`
--
ALTER TABLE `vehicules`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `controle_eclairage`
--
ALTER TABLE `controle_eclairage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `controle_enjoliveurs`
--
ALTER TABLE `controle_enjoliveurs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `controle_etat_salissure`
--
ALTER TABLE `controle_etat_salissure`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `controle_frein`
--
ALTER TABLE `controle_frein`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `controle_liquides`
--
ALTER TABLE `controle_liquides`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `controle_usure_pneumatiques`
--
ALTER TABLE `controle_usure_pneumatiques`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `controle_vehicule`
--
ALTER TABLE `controle_vehicule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `equipements`
--
ALTER TABLE `equipements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `vehicules`
--
ALTER TABLE `vehicules`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `controle_eclairage`
--
ALTER TABLE `controle_eclairage`
  ADD CONSTRAINT `controle_eclairage_ibfk_1` FOREIGN KEY (`controle_id`) REFERENCES `controle_vehicule` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `controle_enjoliveurs`
--
ALTER TABLE `controle_enjoliveurs`
  ADD CONSTRAINT `controle_enjoliveurs_ibfk_1` FOREIGN KEY (`controle_id`) REFERENCES `controle_vehicule` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `controle_etat_salissure`
--
ALTER TABLE `controle_etat_salissure`
  ADD CONSTRAINT `controle_etat_salissure_ibfk_1` FOREIGN KEY (`controle_id`) REFERENCES `controle_vehicule` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `controle_frein`
--
ALTER TABLE `controle_frein`
  ADD CONSTRAINT `controle_frein_ibfk_1` FOREIGN KEY (`controle_id`) REFERENCES `controle_vehicule` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `controle_liquides`
--
ALTER TABLE `controle_liquides`
  ADD CONSTRAINT `controle_liquides_ibfk_1` FOREIGN KEY (`controle_id`) REFERENCES `controle_vehicule` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `controle_usure_pneumatiques`
--
ALTER TABLE `controle_usure_pneumatiques`
  ADD CONSTRAINT `controle_usure_pneumatiques_ibfk_1` FOREIGN KEY (`controle_id`) REFERENCES `controle_vehicule` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `controle_vehicule`
--
ALTER TABLE `controle_vehicule`
  ADD CONSTRAINT `controle_vehicule_ibfk_1` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `controle_vehicule_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `equipements`
--
ALTER TABLE `equipements`
  ADD CONSTRAINT `equipements_ibfk_1` FOREIGN KEY (`controle_id`) REFERENCES `controle_vehicule` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
